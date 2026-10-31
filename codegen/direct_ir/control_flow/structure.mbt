///|
priv struct Structurer {
  graph : Graph
  mut next_scope : Int32
}

///|
priv enum Prefix {
  Entries(Array[Int32])
  Header(Int32)
  Headers(Array[Int32])
}

///|
fn Structurer::prefix(
  self : Structurer,
  prefix : Prefix,
  routes : Map[Int32, Transfer],
) -> Control {
  match prefix {
    Entries(entries) => Select(entries.map(n => (n, routes[n])))
    Header(node) => self.run(node, routes)
    Headers(nodes) => Switch(nodes.map(n => (n, self.run(n, routes))))
  }
}

///|
fn Structurer::fresh(self : Structurer) -> Int32 {
  let id = self.next_scope
  self.next_scope += 1
  id
}

///|
fn Structurer::run(
  self : Structurer,
  label : Int32,
  routes : Map[Int32, Transfer],
) -> Control {
  let selected = Map([])
  for target in self.graph.successors[label] {
    selected[target] = routes.get(target).unwrap_or(Exit)
  }
  Run(label, selected)
}

///|
/// A cyclic component with one external entry has a dominating header. Remove
/// that header, recursively structure the remainder, and turn edges back to
/// it into Continue. Multiple-entry SCCs use a local dispatcher instead.
fn Structurer::component(
  self : Structurer,
  nodes : Array[Int32],
  routes : Map[Int32, Transfer],
) -> Control {
  if !self.graph.cyclic(nodes) {
    return self.run(nodes[0], routes)
  }
  let loop_id = self.fresh()
  let nested = routes.copy()
  match self.graph.entries(nodes) {
    [header] => {
      nested[header] = Continue(loop_id)
      let remaining = nodes.filter(n => n != header)
      let body = if remaining.is_empty() {
        self.run(header, nested)
      } else {
        self.sequence(remaining, nested, Header(header))
      }
      Loop(loop_id, body)
    }
    headers => {
      // Cut only the entry nodes, not the entire SCC. The remainder is again
      // structured recursively and emitted once, including shared tails.
      guard! !headers.is_empty()
      for node in headers {
        nested[node] = Dispatch(loop_id)
      }
      let remaining = nodes.filter(n => !headers.contains(n))
      let body = if remaining.is_empty() {
        self.prefix(Headers(headers), nested)
      } else {
        self.sequence(remaining, nested, Headers(headers))
      }
      Dispatch(loop_id, headers, body)
    }
  }
}

///|
/// Forward edges cross lexical scopes in condensation order. The prefix is
/// either an entry selector or the header removed from an enclosing loop.
/// Each source block is emitted once; no inlining/code growth is hidden here.
fn Structurer::sequence(
  self : Structurer,
  nodes : Array[Int32],
  inherited : Map[Int32, Transfer],
  prefix : Prefix,
) -> Control {
  let components = self.graph.components(nodes)
  let scopes = components.map(_ => self.fresh())
  let routes = inherited.copy()
  for index, component in components {
    let multiple = self.graph.cyclic(component) &&
      self.graph.entries(component).length() != 1
    for node in component {
      routes[node] = if multiple {
        Enter(scopes[index])
      } else {
        Break(scopes[index])
      }
    }
  }
  let mut prefix = self.prefix(prefix, routes)
  for index, component in components {
    prefix = Sequence([
      Scope(scopes[index], prefix),
      self.component(component, routes),
    ])
  }
  prefix
}

///|
/// Partition using the target's generated-operation estimates. Costs are
/// scheduling policy only: the independent CFG checker still validates edges.
pub fn plan(
  source : @direct_ir.Program,
  costs~ : Array[Int32],
) -> Plan raise InvalidControl {
  require(costs.length() == source.blocks.length(), "block cost count mismatch")
  require(costs.all(c => c >= 0), "negative block cost")
  // Larger blocks already exceed the budget and remain indivisible. Capping
  // their costs also bounds arithmetic while grouping arbitrarily large CFGs.
  let costs = costs.map(c => Int32::min(c, REGION_COST + 1))
  let graph = Graph::new(source)
  build_plan(source, graph, partition(source, graph, costs))
}

///|
/// A valid per-block plan for measuring target emission before partitioning.
/// Every block is an entry, so all transfers can use the existing region ABI.
pub fn isolate(source : @direct_ir.Program) -> Plan raise InvalidControl {
  build_plan(source, Graph::new(source), source.blocks.mapi((i, _) => [i]))
}

///|
fn build_plan(
  source : @direct_ir.Program,
  graph : Graph,
  groups : Array[Array[Int32]],
) -> Plan raise InvalidControl {
  let owner = Array::make(source.blocks.length(), -1)
  for region, nodes in groups {
    for node in nodes {
      owner[node] = region
    }
  }
  let builder = Structurer::{ graph, next_scope: 0, }
  let regions = groups.map(nodes => {
    let entries = graph.entries(nodes)
    // An unreachable source component still gets a private entry. This keeps
    // the lowering total without pretending that it is publicly reachable.
    for component in graph.components(nodes) {
      if graph.entries(component).is_empty() {
        let entry = component[0]
        entries.push(entry)
        graph.roots.add(entry)
      }
    }
    entries.sort()
    {
      members: nodes,
      entries,
      control: builder.sequence(nodes, Map([]), Entries(entries)),
    }
  })
  let mut stride = 1
  for region in regions {
    stride = Int32::max(stride, region.entries.length())
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
