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
        arms.map(pair => (pair.0, self.branch(pair.1))),
        self.branch(fallback),
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
        let body = matches[0].1
        for instruction in body.instructions {
          self.instruction(instruction)
        }
        self.terminator(body.terminator)
      } else {
        CheckCaseState(value, arms.map(pair => (pair.0, self.branch(pair.1))))
      }
    }
    Return(entry, value) => CheckReturn(entry, self.value(value))
    Stop => CheckStop
    Unreachable => CheckUnreachable
  }
}

///|
fn StackCheck::result(
  self : StackCheck,
  term : Terminator,
) -> StackCheckBranch raise InvalidProgram {
  let terminator = self.terminator(term)
  if terminator is (CheckCaseToken(_) | CheckCaseState(_)) {
    // Every branch has its own final state and complete observation trace.
    { stack: { removed: 0, suffix: [], }, trace: [], terminator, }
  } else {
    {
      stack: if terminator is (CheckStop | CheckUnreachable) {
        { removed: 0, suffix: [], }
      } else {
        self.stack()
      },
      trace: self.trace.copy(),
      terminator,
    }
  }
}

///|
fn StackCheck::branch(
  self : StackCheck,
  body : Body,
) -> StackCheckBranch raise InvalidProgram {
  let branch = self.copy()
  for instruction in body.instructions {
    branch.instruction(instruction)
  }
  branch.result(body.terminator)
}

///|
fn stack_check_run(
  block : Block,
  incoming_state? : Int32,
) -> StackCheckBranch raise InvalidProgram {
  let machine = StackCheck::new(incoming_state?)
  for parameter in block.parameters {
    machine.bind_value(parameter, SymParameter(parameter))
  }
  for instruction in block.instructions {
    machine.instruction(instruction)
  }
  machine.result(block.terminator)
}

///|
/// Compare every leaf of an extended-block rewrite independently of the optimizer. The
/// enclosing program validator owns CFG, action-signature and lookahead checks.
/// Opaque-prefix accesses remain observable checks; only known pushed cells can
/// disappear. Dead registers are intentionally absent from the comparison.
fn check_stack_rewrite(
  before : Block,
  after : Block,
  incoming_state? : Int32,
) -> Bool {
  if before.parameters != after.parameters ||
    before.lookahead != after.lookahead {
    return false
  }
  if incoming_state is Some(state) && state < 0 {
    return false
  }
  try
    stack_check_run(before, incoming_state?) ==
    stack_check_run(after, incoming_state?)
  catch {
    InvalidProgram(_) => false
  }
}
