///|
/// Co-locate fixed continuations before packing regions. The preference comes
/// from CFG edges, never LR labels or benchmark frequencies. The initial units
/// preserve small SCCs, so joining continuations cannot split natural loops.
fn fixed_successor_units(
  graph : Graph,
  units : Array[Array[Int32]],
  costs : Array[Int32],
) -> Array[Array[Int32]] {
  let nodes = []
  let parent = Map([])
  let sizes = Map([])
  let weights = Map([])
  for unit_ in units {
    let r = unit_[0]
    nodes.append(unit_)
    for node in unit_ {
      parent[node] = r
    }
    sizes[r] = unit_.length()
    weights[r] = unit_.fold(init=0, (n, node) => n + costs[node])
  }
  let allowed = Set(nodes)
  fn root(node : Int32) -> Int32 {
    let mut r = node
    while parent[r] != r {
      r = parent[r]
    }
    let mut next = node
    while parent[next] != r {
      let old = parent[next]
      parent[next] = r
      next = old
    }
    r
  }
  let edges = nodes.filter_map(from => {
    if graph.successors[from] is [to] && allowed.contains(to) && from != to {
      Some((from, to))
    } else {
      None
    }
  })
  edges.sort_by((a, b) => {
    // Preserve unshared chains first; among shared tails, prefer smaller
    // units so a large predecessor cannot monopolize a short continuation.
    let shared_a = if graph.predecessors[a.1].length() == 1 { 0 } else { 1 }
    let shared_b = if graph.predecessors[b.1].length() == 1 { 0 } else { 1 }
    if shared_a != shared_b {
      shared_a - shared_b
    } else {
      let delta = costs[a.0] + costs[a.1] - costs[b.0] - costs[b.1]
      if delta != 0 {
        delta
      } else {
        a.0 - b.0
      }
    }
  })
  for (from, to) in edges {
    let a = root(from)
    let b = root(to)
    if a != b &&
      sizes[a] + sizes[b] <= REGION_NODES &&
      weights[a] + weights[b] <= REGION_COST {
      parent[b] = a
      sizes[a] += sizes[b]
      weights[a] += weights[b]
    }
  }
  let grouped : Map[Int32, Array[Int32]] = Map([])
  let order = []
  for node in nodes {
    let r = root(node)
    if !grouped.contains(r) {
      grouped[r] = []
      order.push(r)
    }
    grouped[r].push(node)
  }
  order.map(r => grouped[r])
}
