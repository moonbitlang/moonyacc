///|
/// These are code-size budgets, not LR-state or grammar-specific rules. A
/// single oversized extended block remains indivisible; no code is cloned.
const REGION_NODES = 64

///|
const REGION_COST = 512

///|
fn body_cost(instructions : Int32, term : @direct_ir.Terminator) -> Int32 {
  let branches = match term {
    Jump(edge) => edge.arguments.length()
    CaseToken(arms, fallback) => {
      let mut cost = body_cost(
        fallback.instructions.length(),
        fallback.terminator,
      )
      for (pattern, body) in arms {
        cost += pattern.definitions().length() +
          body_cost(body.instructions.length(), body.terminator)
      }
      cost
    }
    CaseState(_, arms) => {
      let mut cost = 0
      for (_, body) in arms {
        cost += body_cost(body.instructions.length(), body.terminator)
      }
      cost
    }
    Return(_) | Stop | Unreachable => 0
  }
  instructions + 1 + branches
}

///|
fn partition(source : @direct_ir.Program, graph : Graph) -> Array[Array[Int32]] {
  let nodes = source.blocks.mapi((i, _) => i)
  let costs = source.blocks.map(b => {
    b.parameters.length() + body_cost(b.instructions.length(), b.terminator)
  })
  let groups : Array[Array[Int32]] = []
  let mut current : Array[Int32] = []
  let mut cost = 0
  fn append(unit_ : Array[Int32]) {
    let mut extra = 0
    for node in unit_ {
      extra += costs[node]
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
      cost += costs[node]
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
