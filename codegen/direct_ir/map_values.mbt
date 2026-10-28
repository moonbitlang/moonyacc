///|
fn ActionArgument::map_values(
  self : ActionArgument,
  f : (Value) -> Value,
) -> ActionArgument {
  { value: f(self.value), start: f(self.start), end: f(self.end), }
}

///|
fn Instruction::map_values(
  self : Instruction,
  operand : (Value) -> Value,
  definition : (Register) -> Register,
) -> Instruction {
  match self {
    EnsureLookahead | ConsumeLookahead => self
    SaveErrorSnapshot(suffix) => SaveErrorSnapshot(suffix.map(operand))
    Input(token, value, start, end) =>
      Input(token, definition(value), definition(start), definition(end))
    ReadPreviousPosition(depth, reg) =>
      ReadPreviousPosition(depth, definition(reg))
    Bind(pairs) => Bind(pairs.map(p => (definition(p.0), operand(p.1))))
    Push(cell, values) => Push(cell, values.map(operand))
    Pop(cell, regs) => Pop(cell, regs.map(r => r.map(definition)))
    Peek(depth, cell, regs) =>
      Peek(depth, cell, regs.map(r => r.map(definition)))
    Action(id, args, before, result) =>
      Action(
        id,
        args.map(a => a.map_values(operand)),
        operand(before),
        definition(result),
      )
  }
}

///|
fn Terminator::map_values(
  self : Terminator,
  f : (Value) -> Value,
) -> Terminator {
  let term = self.map_edges(e => { ..e, arguments: e.arguments.map(f), })
  match term {
    CaseState(value, arms) => CaseState(f(value), arms)
    Return(entry, value) => Return(entry, f(value))
    _ => term
  }
}
