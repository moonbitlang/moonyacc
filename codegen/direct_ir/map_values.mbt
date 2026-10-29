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
    EnsureLookahead | LoadLookahead | ConsumeLookahead => self
    SaveErrorSnapshot(suffix) => SaveErrorSnapshot(suffix.map(operand))
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
  self.map_registers(f, r => r)
}

///|
fn Body::map_registers(
  self : Body,
  operand : (Value) -> Value,
  definition : (Register) -> Register,
) -> Body {
  {
    instructions: self.instructions.map(i => i.map_values(operand, definition)),
    terminator: self.terminator.map_registers(operand, definition),
  }
}

///|
fn Terminator::map_registers(
  self : Terminator,
  operand : (Value) -> Value,
  definition : (Register) -> Register,
) -> Terminator {
  match self {
    Jump(edge) => Jump({ ..edge, arguments: edge.arguments.map(operand), })
    CaseToken(arms, fallback) =>
      CaseToken(
        arms.map(p => {
          (
            p.0.map_definitions(definition),
            p.1.map_registers(operand, definition),
          )
        }),
        fallback.map_registers(operand, definition),
      )
    CaseState(value, arms) =>
      CaseState(
        operand(value),
        arms.map(p => (p.0, p.1.map_registers(operand, definition))),
      )
    Return(entry, value) => Return(entry, operand(value))
    Stop | Unreachable => self
  }
}
