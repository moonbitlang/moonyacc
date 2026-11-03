///|
/// One global loop/join analysis for an exact CFG. Costing and competing
/// partitions reuse it; rebuild it after any IR rewrite.
pub struct Analysis {
  priv source : @direct_ir.Program
  priv graph : Graph
  priv forest : LoopForest
  priv whole : Control?
}

///|
/// Competing cuts of the same global structured tree. Loops is conservative;
/// the emitter can assess join grouping and fixed-successor co-location using
/// its actual lowering costs without changing the graph or its proofs.
pub(all) enum Partitioning {
  Loops
  WholeLoops
  Joins
  FixedSuccessors
}

///|
pub fn analyze(source : @direct_ir.Program) -> Analysis {
  let graph = Graph::new(source)
  let forest = graph.loop_forest()
  let whole = if source.blocks.is_empty() {
    None
  } else {
    let builder = Structurer::{ graph, forest, next_scope: 0, }
    let entries = graph.roots.to_array()
    entries.sort()
    Some(
      builder.sequence(
        source.blocks.mapi((i, _) => i),
        Map([]),
        Entries(entries),
      ),
    )
  }
  { source, graph, forest, whole, }
}

///|
pub fn Analysis::plan(
  self : Analysis,
  costs~ : Array[Int32],
  partitioning~ : Partitioning = Loops,
) -> Plan raise InvalidControl {
  let source = self.source
  require(costs.length() == source.blocks.length(), "block cost count mismatch")
  require(costs.all(c => c >= 0), "negative block cost")
  // Larger blocks already exceed the budget and remain indivisible. Capping
  // their costs also bounds arithmetic while grouping arbitrarily large CFGs.
  let ceiling = if partitioning is WholeLoops {
    LOOP_REGION_COST
  } else {
    REGION_COST
  }
  let costs = costs.map(c => Int32::min(c, ceiling + 1))
  let units = if source.blocks.length() <= REGION_NODES {
    source.blocks.mapi((i, _) => [i])
  } else {
    // Join grouping and fixed-successor co-location are competing policies;
    // neither may split the global loop units that fit the region budget.
    structure_units(
      self.whole.unwrap(),
      costs,
      partitioning is Joins,
      partitioning is WholeLoops,
    )
  }
  build_plan(
    source,
    self.graph,
    self.forest,
    partition(
      source,
      self.graph,
      costs,
      units,
      fixed=partitioning is FixedSuccessors,
    ),
    self.whole,
  )
}

///|
/// A valid per-block plan for measuring target emission before partitioning.
/// Every block is an entry, so all transfers can use the existing region ABI.
pub fn Analysis::isolate(self : Analysis) -> Plan raise InvalidControl {
  build_plan(
    self.source,
    self.graph,
    self.forest,
    self.source.blocks.mapi((i, _) => [i]),
    self.whole,
  )
}

///|
pub fn plan(
  source : @direct_ir.Program,
  costs~ : Array[Int32],
  partitioning~ : Partitioning = Loops,
) -> Plan raise InvalidControl {
  analyze(source).plan(costs~, partitioning~)
}

///|
pub fn isolate(source : @direct_ir.Program) -> Plan raise InvalidControl {
  analyze(source).isolate()
}

///|
fn build_plan(
  source : @direct_ir.Program,
  graph : Graph,
  forest : LoopForest,
  groups : Array[Array[Int32]],
  whole : Control?,
) -> Plan raise InvalidControl {
  let owner = Array::make(source.blocks.length(), -1)
  for region, nodes in groups {
    for node in nodes {
      owner[node] = region
    }
  }
  let builder = Structurer::{ graph, forest, next_scope: 0, }
  let regions = groups.map(nodes => {
    let entries = graph.entries(nodes)
    entries.sort()
    {
      members: nodes,
      entries,
      control: if groups.length() == 1 && whole is Some(whole) {
        whole
      } else {
        builder.sequence(nodes, Map([]), Entries(entries))
      },
    }
  })
  let mut stride = 1
  for region in regions {
    // Encoding an entry must not turn a cheap dispatcher index into arbitrary
    // integer division when a region happens to gain another entry. Padding
    // stays unaddressed; only real entry addresses are ever emitted.
    while stride < region.entries.length() {
      stride *= 2
    }
  }
  let addresses = Array::make(source.blocks.length(), -1)
  for index, region in regions {
    for offset, entry in region.entries {
      addresses[entry] = index * stride + offset
    }
  }
  let plan = Plan::{ source, regions, owner, addresses, stride, }
  plan.validate()
  plan
}
