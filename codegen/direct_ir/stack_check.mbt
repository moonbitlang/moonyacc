///|
fn StackCheck::edge(
  self : StackCheck,
  edge : Edge,
) -> StackCheckEdge raise InvalidProgram {
  { target: edge.target, arguments: edge.arguments.map(v => self.value(v)), }
}

///|
fn StackCheck::terminator(
  self : StackCheck,
  term : Terminator,
) -> StackCheckTerminator raise InvalidProgram {
  match term {
    Jump(edge) => CheckJump(self.edge(edge))
    CaseToken(arms, fallback) =>
      CheckCaseToken(
        arms.map(pair => (pair.0, self.edge(pair.1))),
        self.edge(fallback),
      )
    CaseState(value, arms) => {
      let value = self.value(value)
      require(value.type_() == State, "stack rewrite state branch type")
      if value is SymState(state) {
        let matches = arms.filter(pair => pair.0 == state)
        require(
          matches.length() == 1,
          "stack rewrite state branch missing or duplicated",
        )
        CheckJump(self.edge(matches[0].1))
      } else {
        CheckCaseState(value, arms.map(pair => (pair.0, self.edge(pair.1))))
      }
    }
    Return(entry, value) => CheckReturn(entry, self.value(value))
    Stop(state) => CheckStop(state)
    Unreachable => CheckUnreachable
  }
}

///|
fn stack_check_run(
  block : Block,
) -> (StackCheckStack, Array[StackCheckEvent], StackCheckTerminator) raise InvalidProgram {
  let machine = StackCheck::new()
  for parameter in block.parameters {
    machine.bind_value(parameter, SymParameter(parameter))
  }
  for instruction in block.instructions {
    machine.instruction(instruction)
  }
  (machine.stack(), machine.trace, machine.terminator(block.terminator))
}

///|
/// Check a bounded straightline rewrite independently of the optimizer. The
/// enclosing program validator owns CFG, action-signature and lookahead checks.
/// Opaque-prefix accesses remain observable checks; only known pushed cells can
/// disappear. Dead registers are intentionally absent from the comparison.
fn check_stack_rewrite(before : Block, after : Block) -> Bool {
  if before.parameters != after.parameters ||
    before.lookahead != after.lookahead {
    return false
  }
  try stack_check_run(before) == stack_check_run(after) catch {
    InvalidProgram(_) => false
  }
}
