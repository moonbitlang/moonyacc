///|
fn BlockValidator::instruction(
  self : BlockValidator,
  instruction : Instruction,
) -> Unit raise InvalidProgram {
  match instruction {
    EnsureLookahead =>
      if !(self.lookahead is On(_)) {
        self.lookahead = Present
      }
    Input(t, value, sp, ep) => self.input(t, value, sp, ep)
    ConsumeLookahead => {
      self.check(
        self.lookahead is On(Terminal(_)),
        "ConsumeLookahead requires a real token",
      )
      self.lookahead = Empty
    }
    SaveErrorSnapshot => ()
    ReadPreviousPosition(depth, reg) => {
      self.check(depth >= 0, "negative previous-position depth")
      self.check(
        reg.type_ == Position,
        "ReadPreviousPosition requires a position register",
      )
      self.add_definition(reg)
    }
    Bind(bindings) => {
      for (reg, value) in bindings {
        self.expect(value, reg.type_)
      }
      for (reg, _) in bindings {
        self.add_definition(reg)
      }
    }
    Push(cell, values) => {
      self.check(cell.symbol is Some(_), "cannot push an opaque cell")
      let types = self.field_types(cell)
      self.check(types.length() == values.length(), "cell value arity mismatch")
      for i, value in values {
        self.expect(value, types[i])
      }
    }
    Pop(cell, bindings) => {
      self.check(cell.symbol is Some(_), "cannot pop an opaque cell")
      self.bind_cell(cell, bindings)
    }
    Peek(depth, cell, bindings) => {
      self.check(depth >= 0, "negative stack depth")
      self.bind_cell(cell, bindings)
    }
    Action(id, args, last_pos, result) =>
      self.action(id, args, last_pos, result)
  }
}

///|
fn BlockValidator::input(
  self : BlockValidator,
  t : Int32,
  value : Register,
  sp : Register,
  ep : Register,
) -> Unit raise InvalidProgram {
  self.program.checked_token(Terminal(t))
  self.check(
    self.lookahead == On(Terminal(t)),
    "Input requires the matching token branch",
  )
  self.check(
    value.type_ == Semantic(self.program.checked_symbol(t).type_),
    "Input payload type mismatch",
  )
  self.check(
    sp.type_ == Position && ep.type_ == Position,
    "Input position type mismatch",
  )
  self.add_definition(value)
  self.add_definition(sp)
  self.add_definition(ep)
}

///|
fn BlockValidator::action(
  self : BlockValidator,
  id : Int32,
  args : Array[ActionArgument],
  last_pos : Value,
  result : Register,
) -> Unit raise InvalidProgram {
  self.check(id >= 0 && id < self.program.actions.length(), "invalid action")
  let action = self.program.actions[id]
  self.check(action.callable, "cannot call an augmented start action")
  self.check(args.length() == action.rhs.length(), "action arity mismatch")
  for i, arg in args {
    self.expect(
      arg.value,
      Semantic(self.program.checked_symbol(action.rhs[i]).type_),
    )
    self.expect(arg.start, Position)
    self.expect(arg.end, Position)
  }
  self.expect(last_pos, Position)
  self.check(
    result.type_ == Semantic(self.program.checked_symbol(action.lhs).type_),
    "action result type mismatch",
  )
  self.add_definition(result)
}

///|
fn BlockValidator::terminator(
  self : BlockValidator,
  terminator : Terminator,
) -> Unit raise InvalidProgram {
  match terminator {
    Jump(target) => self.edge(target, self.lookahead)
    CaseToken(arms, default_) => {
      self.check(
        self.lookahead is (Present | On(_)),
        "CaseToken requires lookahead",
      )
      let seen = []
      for (t, target) in arms {
        self.program.checked_token(t)
        self.check(!seen.contains(t), "duplicate token branch")
        seen.push(t)
        self.edge(target, On(t))
      }
      self.edge(default_, self.lookahead)
    }
    CaseState(value, arms) => {
      self.expect(value, State)
      let seen = []
      for (id, target) in arms {
        self.program.checked_state(id)
        self.check(!seen.contains(id), "duplicate state branch")
        seen.push(id)
        self.edge(target, self.lookahead)
      }
    }
    Return(entry, value) => {
      self.check(
        entry >= 0 && entry < self.program.entries.length(),
        "invalid return entry",
      )
      self.expect(value, Semantic(self.program.entries[entry].result_type))
    }
    Stop(id) => {
      self.program.checked_state(id)
      self.check(self.lookahead is (Present | On(_)), "Stop requires lookahead")
    }
    Unreachable => ()
  }
}
