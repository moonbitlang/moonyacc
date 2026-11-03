///|
/// Budgets for partitioning large CFGs. A whole CFG within the node limit
/// stays local: splitting it would introduce a shared context and dispatcher.
/// Operation costs then bound the helpers of a partitioned parser. Oversized
/// extended blocks stay indivisible; no code is cloned.
const REGION_NODES = 64

///|
const REGION_COST = 512

///|
// A costed alternative may retain a natural loop above the ordinary packing
// budget. The node bound remains unchanged; irreducible loops and acyclic
// fragments do not receive this allowance.
const LOOP_REGION_COST : Int32 = 4 * REGION_COST

///|
fn partition(
  source : @direct_ir.Program,
  graph : Graph,
  costs : Array[Int32],
  units : Array[Array[Int32]],
  fixed~ : Bool = false,
) -> Array[Array[Int32]] {
  let nodes = source.blocks.mapi((i, _) => i)
  if nodes.length() <= REGION_NODES {
    return if nodes.is_empty() { [] } else { [nodes] }
  }
  let groups : Array[Array[Int32]] = []
  let mut current : Array[Int32] = []
  let mut cost = 0
  fn append(unit_ : Array[Int32]) {
    let mut extra = 0
    for node in unit_ {
      extra = Int32::min(REGION_COST + 1, extra + costs[node])
    }
    if !current.is_empty() &&
      (
        current.length() + unit_.length() > REGION_NODES ||
        cost + extra > REGION_COST
      ) {
      groups.push(current)
      current = []
      cost = 0
    }
    current.append(unit_)
    cost += extra
  }
  let units = if fixed {
    fixed_successor_units(graph, units, costs)
  } else {
    units
  }
  for unit_ in units {
    append(unit_)
  }
  if !current.is_empty() {
    groups.push(current)
  }
  groups
}

///|
priv struct StructureParts {
  size : Int32
  cost : Int32
  units : Array[Array[Int32]]
}

///|
/// Partition the global structured tree, not a flat state-number/DFS list.
/// Whole loops and join scopes that fit remain indivisible. Oversized parents
/// expose their structured children, preserving small nested loops in them.
fn structure_parts(
  control : Control,
  costs : Array[Int32],
  joins : Bool,
  whole_loops : Bool,
) -> StructureParts {
  let children = match control {
    Run(label, _) => return { size: 1, cost: costs[label], units: [[label]], }
    Select(_) => return { size: 0, cost: 0, units: [], }
    Scope(_, body) | Loop(_, body) | Dispatch(_, _, body) => [body]
    Sequence(nodes) => nodes
    Switch(cases) => cases.map(p => p.1)
  }
  let parts = children.map(child => {
    structure_parts(child, costs, joins, whole_loops)
  })
  let size = parts.fold(init=0, (size, part) => {
    Int32::min(REGION_NODES + 1, size + part.size)
  })
  let ceiling = if whole_loops { LOOP_REGION_COST } else { REGION_COST }
  let cost = parts.fold(init=0, (cost, part) => {
    Int32::min(ceiling + 1, cost + part.cost)
  })
  let units = []
  for part in parts {
    units.append(part.units)
  }
  if size > 0 &&
    size <= REGION_NODES &&
    cost <=
    (if whole_loops && control is Loop(_) {
      LOOP_REGION_COST
    } else {
      REGION_COST
    }) &&
    (joins || control is (Loop(_) | Dispatch(_))) {
    let nodes = []
    for unit_ in units {
      nodes.append(unit_)
    }
    { size, cost, units: [nodes], }
  } else {
    { size, cost, units, }
  }
}

///|
fn structure_units(
  control : Control,
  costs : Array[Int32],
  joins : Bool,
  whole_loops : Bool,
) -> Array[Array[Int32]] {
  structure_parts(control, costs, joins, whole_loops).units
}
