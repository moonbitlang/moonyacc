///|
/// Inlining is state-directed: goto/epsilon with known current state, unit
/// reduction with known saved predecessor. No instruction is reordered.
fn StateSpecializer::inline_target(
  self : StateSpecializer,
  edge : Edge,
  machine : StackMachineFact,
) -> (Block, Bool)? raise InvalidProgram {
  let target = self.source.blocks[edge.target]
  let known = machine.current.length() == 1
  match target.hint {
    NoHint => None
    IfCells(0) if known => Some((target, false))
    IfCells(1) if self.known_predecessor(machine) => Some((target, false))
    Always if known || self.known_predecessor(machine) => Some((target, false))
    IfKnownState => {
      guard target.instructions.is_empty() &&
        target.terminator is CaseState(selector, arms) else {
        None
      }
      let trial = machine.copy()
      self.evaluator.instruction(
        Bind(target.parameters.mapi((i, p) => (p, edge.arguments[i]))),
        trial,
      )
      let fact = trial.value(selector)
      guard fact.states.length() == 1 else { None }
      let state = fact.states.iter().next().unwrap()
      guard arms.search_by(p => p.0 == state) is Some(index) else {
        raise InvalidProgram("specialized goto has no matching state")
      }
      let body = arms[index].1
      // Select before cloning/charging: a large goto becomes just one arm.
      // Do not substitute constants into every arm (Menhir's incasetag rule),
      // so equivalent successors can still be shared by later passes.
      Some(
        (
          {
            ..target,
            instructions: body.instructions,
            terminator: body.terminator,
          },
          fact.depth is Some(_) && arms.any(p => p.1 != body),
        ),
      )
    }
    _ => None
  }
}

///|
fn StateSpecializer::jump(
  self : StateSpecializer,
  edge : Edge,
  machine : StackMachineFact,
  path : Set[Int32],
  expansion : StateExpansion,
) -> Body raise InvalidProgram {
  if !path.contains(edge.target) {
    if self.inline_target(edge, machine) is Some((target, useful)) {
      let cost = 1 +
        target.parameters.length() +
        specialization_cost({
          instructions: target.instructions,
          terminator: target.terminator,
        })
      if cost <= expansion.remaining {
        expansion.remaining -= cost
        if useful {
          expansion.savings += 1
        }
        let copy = self.supply.clone_block(target)
        let path = path.copy()
        path.add(edge.target)
        return self.body(
          {
            instructions: [
              Bind(copy.parameters.mapi((i, p) => (p, edge.arguments[i]))),
              ..copy.instructions,
            ],
            terminator: copy.terminator,
          },
          machine,
          path,
          expansion,
        )
      } else {
        expansion.complete = false
      }
    }
  }
  let target = if machine.current.length() == 1 {
    self.version(edge.target, machine.current.iter().next().unwrap())
  } else {
    edge.target
  }
  Body::jump({ ..edge, target, })
}
