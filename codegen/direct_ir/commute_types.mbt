///|
priv struct VirtualCell {
  cell : Cell
  values : Array[Value]
}

///|
priv struct PushEnv {
  pushes : Array[VirtualCell]
  aliases : Map[Int32, Value]
  prefix_state : Value?
}

///|
fn PushEnv::copy(self : PushEnv) -> PushEnv {
  { ..self, pushes: self.pushes.copy(), aliases: self.aliases.copy(), }
}

///|
fn PushEnv::value(self : PushEnv, value : Value) -> Value {
  match value {
    Reg(reg) => self.aliases.get(reg.id).unwrap_or(value)
    State(_) => value
  }
}

///|
fn PushEnv::bind(self : PushEnv, bindings : Array[(Register, Value)]) -> Unit {
  let values = bindings.map(p => self.value(p.1))
  for i, (reg, _) in bindings {
    self.aliases[reg.id] = values[i]
  }
}

///|
fn VirtualCell::read(
  self : VirtualCell,
  cell : Cell,
  regs : Array[Register?],
) -> Array[(Register, Value)]? {
  guard cell.symbol is None || cell.symbol == self.cell.symbol else { None }
  let result = []
  for i, field in cell.fields {
    guard self.cell.fields.search(field) is Some(index) else { return None }
    if regs[i] is Some(reg) {
      result.push((reg, self.values[index]))
    }
  }
  Some(result)
}

///|
priv struct Commuted {
  before : Body
  after : Body
  absorbed : Int32
}

///|
fn Commuted::prepend(
  self : Commuted,
  original : Instruction,
  emitted : Instruction?,
) -> Commuted {
  {
    ..self,
    before: {
      ..self.before,
      instructions: [original, ..self.before.instructions],
    },
    after: match emitted {
      None => self.after
      Some(instruction) =>
        {
          ..self.after,
          instructions: [instruction, ..self.after.instructions],
        }
    },
  }
}

///|
priv struct PushCommuter {
  program : Program
  supply : RegisterSupply
}

///|
fn pushes_vanish(
  instructions : ArrayView[Instruction],
  term : Terminator,
) -> Bool {
  term is (Stop | Unreachable) &&
  instructions.all(i => i is (Bind(_) | Push(_)))
}

///|
fn materialize(pushes : ArrayView[VirtualCell], body : Body) -> Body {
  if pushes_vanish(body.instructions[:], body.terminator) {
    return body
  }
  {
    ..body,
    instructions: [
      ..pushes.map(p => Instruction::Push(p.cell, p.values)),
      ..body.instructions,
    ],
  }
}
