///|
/// Budgets for partitioning large CFGs. A whole CFG within the node limit
/// stays local: splitting it would introduce a shared context and dispatcher.
/// Operation costs then bound the helpers of a partitioned parser. Oversized
/// extended blocks stay indivisible; no code is cloned.
const REGION_NODES = 64

///|
const REGION_COST = 512

///|
fn partition(
  source : @direct_ir.Program,
  graph : Graph,
  costs : Array[Int32],
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
  for component in graph.components(nodes) {
    let mut cost = 0
    for node in component {
      cost = Int32::min(REGION_COST + 1, cost + costs[node])
    }
    if component.length() <= REGION_NODES && cost <= REGION_COST {
      // Preserve a small SCC as a unit rather than cutting its back edges.
      append(component)
    } else {
      let order = graph.postorder(component)
      for i = order.length() - 1; i >= 0; i = i - 1 {
        append([order[i]])
      }
    }
  }
  if !current.is_empty() {
    groups.push(current)
  }
  groups
}
