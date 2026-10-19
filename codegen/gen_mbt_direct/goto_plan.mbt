///|
priv struct GotoPush {
  cell : @direct_ir.Cell
  data : (@direct_ir.Value, @direct_ir.Value, @direct_ir.Value)
  target : GotoTarget
}

///|
priv struct GotoTarget {
  state : @direct_ir.Value
  label : Int
} derive(Eq)

///|
priv struct GotoPlan {
  selector : @direct_ir.Value
  data : (@direct_ir.Value, @direct_ir.Value, @direct_ir.Value)
  // Case keys and target.state are LR states; target.label names an IR block.
  choices : Array[(Int, GotoTarget)]
  helpers : Set[Int]
}

///|
/// -1 means no predecessor, -2 means shared or externally enterable.
fn predecessor_owners(
  blocks : Array[@direct_ir.Block],
  entries : Array[Int],
) -> Array[Int] {
  let owners = Array::make(blocks.length(), -1)
  for entry in entries {
    owners[entry] = -2
  }
  for label, block in blocks {
    for target in successors(block.terminator) {
      if owners[target] == -1 {
        owners[target] = label
      } else if owners[target] != label {
        owners[target] = -2
      }
    }
  }
  owners
}

///|
fn push_argument(
  value : @direct_ir.Value,
  parameters : Array[@direct_ir.Register],
  arguments : Array[@direct_ir.Value],
) -> @direct_ir.Value? {
  match value {
    State(_) => Some(value)
    Reg(reg) => {
      for i, parameter in parameters {
        if parameter == reg {
          return Some(arguments[i])
        }
      }
      None
    }
  }
}

///|
/// Match the complete continuation. Additional effects, partial cells or
/// outgoing arguments require ordinary block emission.
fn goto_push(
  blocks : Array[@direct_ir.Block],
  edge : @direct_ir.Edge,
) -> GotoPush? {
  let block = blocks[edge.target]
  guard block.instructions is [Push(cell, values)] &&
    block.terminator is Jump(next) &&
    next.arguments.is_empty() &&
    cell.fields == [State, Semantic, Start, End] &&
    values.length() == 4 &&
    block.parameters.length() == edge.arguments.length() else {
    None
  }
  let resolved = []
  for value in values {
    guard push_argument(value, block.parameters, edge.arguments) is Some(value) else {
      return None
    }
    resolved.push(value)
  }
  Some({
    cell,
    data: (resolved[1], resolved[2], resolved[3]),
    target: { state: resolved[0], label: next.target, },
  })
}

///|
fn plan_goto(
  blocks : Array[@direct_ir.Block],
  owners : Array[Int],
  label : Int,
) -> GotoPlan? {
  guard blocks[label].terminator is CaseState(selector, arms) &&
    !arms.is_empty() else {
    None
  }
  guard goto_push(blocks, arms[0].1) is Some(first) else { None }
  let choices = []
  let helpers = Set([])
  for (pattern, edge) in arms {
    guard owners[edge.target] == label else { return None }
    guard goto_push(blocks, edge) is Some(push) &&
      push.cell == first.cell &&
      push.data == first.data else {
      return None
    }
    choices.push((pattern, push.target))
    helpers.add(edge.target)
  }
  Some({ selector, data: first.data, choices, helpers, })
}

///|
fn plan_gotos(
  blocks : Array[@direct_ir.Block],
  entries : Array[Int],
) -> (Map[Int, GotoPlan], Set[Int]) {
  let owners = predecessor_owners(blocks, entries)
  let plans = Map([])
  let omitted = Set([])
  for label, _ in blocks {
    if plan_goto(blocks, owners, label) is Some(plan) {
      plans[label] = plan
      for helper in plan.helpers {
        omitted.add(helper)
      }
    }
  }
  (plans, omitted)
}
