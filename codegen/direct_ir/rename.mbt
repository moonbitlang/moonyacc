///|
priv struct RegisterSupply {
  mut next : Int32
}

///|
pub fn Instruction::definitions(self : Instruction) -> Array[Register] {
  match self {
    ReadPreviousPosition(_, reg) | Action(_, _, _, reg) => [reg]
    Bind(pairs) => pairs.map(p => p.0)
    Pop(_, regs) | Peek(_, _, regs) => regs.filter_map(r => r)
    _ => []
  }
}

///|
fn RegisterSupply::new(program : Program) -> RegisterSupply {
  let mut next = 0
  for block in program.blocks {
    for reg in block.definitions() {
      next = Int32::max(next, reg.id + 1)
    }
  }
  { next, }
}

///|
/// Clone all definitions, including block parameters. Renaming never changes
/// LR state constants, action IDs, symbols or control-flow labels.
fn RegisterSupply::clone_block(self : RegisterSupply, block : Block) -> Block {
  let names : Map[Int32, Register] = Map([])
  fn fresh(reg : Register) -> Register {
    let renamed = { ..reg, id: self.next, }
    self.next += 1
    names[reg.id] = renamed
    renamed
  }
  for reg in block.definitions() {
    ignore(fresh(reg))
  }
  let parameters = block.parameters.map(r => names[r.id])
  fn value(v : Value) -> Value {
    match v {
      Reg(reg) => Reg(names[reg.id])
      State(_) => v
    }
  }
  {
    ..block,
    parameters,
    instructions: block.instructions.map(i => {
      i.map_values(value, r => names[r.id])
    }),
    terminator: block.terminator.map_registers(value, r => names[r.id]),
  }
}
