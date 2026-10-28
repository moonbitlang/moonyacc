///|
fn StackCheck::bind(
  self : StackCheck,
  bindings : Array[(Register, Value)],
) -> Unit raise InvalidProgram {
  // Resolve every source before defining any destination: Bind is parallel.
  let values = bindings.map(pair => self.value(pair.1))
  for i, (reg, _) in bindings {
    self.bind_value(reg, values[i])
  }
}

///|
fn StackCheck::input(
  self : StackCheck,
  token : Int32,
  value : Register,
  start : Register,
  end : Register,
) -> Unit raise InvalidProgram {
  require(value.type_ is Semantic(_), "stack rewrite input value type")
  require(
    start.type_ == Position && end.type_ == Position,
    "stack rewrite input positions",
  )
  self.bind_value(value, SymOutput(value))
  self.bind_value(start, SymOutput(start))
  self.bind_value(end, SymOutput(end))
  self.trace.push(ReadInput(token, value, start, end))
}

///|
fn StackCheck::action(
  self : StackCheck,
  id : Int32,
  args : Array[ActionArgument],
  before : Value,
  result : Register,
) -> Unit raise InvalidProgram {
  let values = []
  for arg in args {
    let value = self.value(arg.value)
    let start = self.value(arg.start)
    let end = self.value(arg.end)
    require(value.type_() is Semantic(_), "stack rewrite action value type")
    require(
      start.type_() == Position && end.type_() == Position,
      "stack rewrite action positions",
    )
    values.append([value, start, end])
  }
  let before = self.value(before)
  require(before.type_() == Position, "stack rewrite action before position")
  require(result.type_ is Semantic(_), "stack rewrite action result type")
  self.bind_value(result, SymOutput(result))
  self.trace.push(CallAction(id, values, before, result))
}

///|
fn StackCheck::instruction(
  self : StackCheck,
  instruction : Instruction,
) -> Unit raise InvalidProgram {
  match instruction {
    EnsureLookahead => self.trace.push(ReadLookahead)
    Input(token, value, start, end) => self.input(token, value, start, end)
    ConsumeLookahead => self.trace.push(AdvanceLookahead)
    SaveErrorSnapshot => self.trace.push(CaptureSnapshot(self.stack()))
    ReadPreviousPosition(depth, reg) => self.previous_position(depth, reg)
    Bind(bindings) => self.bind(bindings)
    Push(cell, values) => self.push(cell, values)
    Pop(cell, bindings) => self.read(0, cell, bindings, pop=true)
    Peek(depth, cell, bindings) => self.read(depth, cell, bindings, pop=false)
    Action(id, args, before, result) => self.action(id, args, before, result)
  }
}
