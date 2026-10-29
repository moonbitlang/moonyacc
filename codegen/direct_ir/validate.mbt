///|
pub suberror InvalidProgram {
  InvalidProgram(String)
}

///|
/// Check metadata, block interfaces and the lookahead protocol. This does not
/// prove inter-block stack shapes.
pub fn Program::validate(self : Program) -> Unit raise InvalidProgram {
  self.validate_metadata()
  let definitions : Map[Int32, Bool] = Map([])
  for label, block in self.blocks {
    let validator = BlockValidator::{
      program: self,
      definitions,
      label,
      locals: Map([]),
      lookahead: block.lookahead,
    }
    validator.validate(block)
  }
  self.validate_diagnostics()
}

///|
fn require(ok : Bool, message : String) -> Unit raise InvalidProgram {
  if !ok {
    raise InvalidProgram(message)
  }
}

///|
fn Program::checked_symbol(
  self : Program,
  id : Int32,
) -> Symbol raise InvalidProgram {
  require(id > 0 && id < self.symbols.length(), "invalid symbol \{id}")
  self.symbols[id]
}

///|
fn Program::checked_state(
  self : Program,
  id : Int32,
) -> Unit raise InvalidProgram {
  require(id >= 0 && id < self.diagnostics.length(), "invalid state \{id}")
}

///|
fn Program::checked_token(
  self : Program,
  t : Token,
) -> Unit raise InvalidProgram {
  match t {
    EndOfInput => ()
    Terminal(id) =>
      require(id > 0 && id <= self.terminal_count, "invalid terminal \{id}")
  }
}

///|
fn Program::validate_metadata(self : Program) -> Unit raise InvalidProgram {
  require(
    self.terminal_count >= 0 && self.terminal_count < self.symbols.length(),
    "invalid terminal count",
  )
  for action in self.actions {
    ignore(self.checked_symbol(action.lhs))
    require(
      action.lhs > self.terminal_count,
      "action lhs must be a nonterminal",
    )
    for id in action.rhs {
      ignore(self.checked_symbol(id))
    }
    for input in action.inputs {
      match input {
        Value(index, type_) => {
          require(
            index >= 0 && index < action.rhs.length(),
            "action input index out of range",
          )
          require(
            self.symbols[action.rhs[index]].type_ == type_,
            "action input type mismatch",
          )
        }
        Position(StartOf(index) | EndOf(index)) =>
          require(
            index >= 0 && index < action.rhs.length(),
            "action position index out of range",
          )
        Position(BeforeRhs) => ()
        Position(FirstNonEmpty(_)) =>
          raise InvalidProgram("non-atomic action input")
      }
    }
  }
  for entry in self.entries {
    require(
      entry.block >= 0 && entry.block < self.blocks.length(),
      "invalid entry block",
    )
    self.checked_state(entry.state)
    let block = self.blocks[entry.block]
    require(block.parameters.is_empty(), "entry block has parameters")
    require(block.lookahead is (Any | Empty), "entry requires a cached token")
  }
}

///|
fn Program::validate_diagnostic_action(
  self : Program,
  action : DiagnosticAction,
) -> Unit raise InvalidProgram {
  match action {
    Shift(id) => self.checked_state(id)
    Reduce(count, lhs) => {
      require(count >= 0, "negative reduction length")
      ignore(self.checked_symbol(lhs))
      require(
        lhs > self.terminal_count,
        "diagnostic reduction lhs must be a nonterminal",
      )
    }
    Accept => ()
  }
}

///|
fn Program::validate_diagnostics(self : Program) -> Unit raise InvalidProgram {
  for diagnostic in self.diagnostics {
    if diagnostic.default_ is Some(action) {
      self.validate_diagnostic_action(action)
    }
    for (token, action) in diagnostic.actions {
      self.checked_token(token)
      self.validate_diagnostic_action(action)
    }
    for (lhs, target) in diagnostic.gotos {
      ignore(self.checked_symbol(lhs))
      self.checked_state(target)
      require(
        lhs > self.terminal_count,
        "diagnostic goto requires a nonterminal",
      )
    }
  }
}
