///|
/// Symbols here describe executions of the existing IR, not grammar semantics.
priv enum StackCheckValue {
  SymParameter(Register)
  SymOutput(Register)
  SymState(Int32)
  SymPrefixField(Int32, Field, ValueType)
  SymPreviousPosition(Int32)
} derive(Eq)

///|
priv struct StackCheckCell {
  cell : Cell
  values : Array[StackCheckValue]
} derive(Eq)

///|
priv struct StackCheckStack {
  removed : Int32
  suffix : Array[StackCheckCell]
} derive(Eq)

///|
priv enum StackCheckEvent {
  ReadLookahead
  ReadInput(Int32, Register, Register, Register)
  AdvanceLookahead
  CaptureSnapshot(StackCheckStack)
  CheckPeek(Int32, Cell)
  CheckPop(Int32, Cell)
  CheckPreviousPosition(Int32)
  CallAction(Int32, Array[StackCheckValue], StackCheckValue, Register)
} derive(Eq)

///|
priv struct StackCheckEdge {
  target : Int32
  arguments : Array[StackCheckValue]
} derive(Eq)

///|
priv enum StackCheckTerminator {
  CheckJump(StackCheckEdge)
  CheckCaseToken(Array[(Token, StackCheckEdge)], StackCheckEdge)
  CheckCaseState(StackCheckValue, Array[(Int32, StackCheckEdge)])
  CheckReturn(Int32, StackCheckValue)
  CheckStop(Int32)
  CheckUnreachable
} derive(Eq)

///|
priv struct StackCheck {
  registers : Map[Int32, StackCheckValue]
  suffix : Array[StackCheckCell]
  trace : Array[StackCheckEvent]
  mut removed : Int32
}

///|
fn StackCheck::new() -> StackCheck {
  { registers: Map([]), suffix: [], trace: [], removed: 0, }
}

///|
fn StackCheckValue::type_(self : StackCheckValue) -> ValueType {
  match self {
    SymParameter(reg) | SymOutput(reg) => reg.type_
    SymState(_) => State
    SymPrefixField(_, _, type_) => type_
    SymPreviousPosition(_) => Position
  }
}

///|
fn StackCheck::value(
  self : StackCheck,
  value : Value,
) -> StackCheckValue raise InvalidProgram {
  match value {
    State(state) => SymState(state)
    Reg(reg) => {
      guard self.registers.get(reg.id) is Some(value) else {
        raise InvalidProgram("stack rewrite reads an undefined register")
      }
      require(
        value.type_() == reg.type_,
        "stack rewrite changes a register type",
      )
      value
    }
  }
}

///|
fn StackCheck::bind_value(
  self : StackCheck,
  reg : Register,
  value : StackCheckValue,
) -> Unit raise InvalidProgram {
  require(
    !self.registers.contains(reg.id),
    "stack rewrite redefines a register",
  )
  require(reg.type_ == value.type_(), "stack rewrite binds a wrong type")
  self.registers[reg.id] = value
}

///|
fn StackCheck::stack(self : StackCheck) -> StackCheckStack {
  { removed: self.removed, suffix: self.suffix.map(c => c), }
}
