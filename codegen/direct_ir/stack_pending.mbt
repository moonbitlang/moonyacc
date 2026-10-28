///|
priv struct PendingCell {
  cell : Cell
  values : Array[Value]
}

///|
/// A bounded, exact suffix above an opaque physical prefix. SSA values remain
/// stable while their pushes are delayed; this is not a runtime stack.
priv struct StackRewrite {
  pending : Array[PendingCell]
  aliases : Map[Int32, Value]
  output : Array[Instruction]
  mut cancelled : Int32
}

///|
fn StackRewrite::new() -> StackRewrite {
  { pending: [], aliases: Map([]), output: [], cancelled: 0, }
}

///|
fn StackRewrite::value(self : StackRewrite, value : Value) -> Value {
  match value {
    Reg(reg) => self.aliases.get(reg.id).unwrap_or(value)
    State(_) => value
  }
}

///|
fn StackRewrite::bind(
  self : StackRewrite,
  pairs : Array[(Register, Value)],
) -> Unit {
  // Resolve every RHS before installing any alias (parallel assignment).
  let resolved = pairs.map(p => (p.0, self.value(p.1)))
  for (reg, value) in resolved {
    self.aliases[reg.id] = value
  }
}

///|
fn StackRewrite::flush(self : StackRewrite) -> Unit {
  for pending in self.pending {
    self.output.push(Push(pending.cell, pending.values))
  }
  self.pending.clear()
}

///|
fn PendingCell::read(
  self : PendingCell,
  requested : Cell,
  regs : Array[Register?],
) -> Array[(Register, Value)]? {
  guard requested.symbol is None || requested.symbol == self.cell.symbol else {
    None
  }
  let pairs = []
  for i, field in requested.fields {
    guard self.cell.fields.search(field) is Some(index) else { return None }
    if regs[i] is Some(reg) {
      pairs.push((reg, self.values[index]))
    }
  }
  Some(pairs)
}

///|
fn StackRewrite::peek(
  self : StackRewrite,
  depth : Int32,
  cell : Cell,
  regs : Array[Register?],
) -> Unit {
  let count = self.pending.length()
  if depth < count {
    if self.pending[count - depth - 1].read(cell, regs) is Some(pairs) {
      self.bind(pairs)
      return
    }
    self.flush()
    self.output.push(Peek(depth, cell, regs))
  } else {
    self.output.push(Peek(depth - count, cell, regs))
  }
}

///|
fn StackRewrite::previous(
  self : StackRewrite,
  depth : Int32,
  reg : Register,
) -> Unit {
  let count = self.pending.length()
  if depth < count {
    let top = self.pending[count - depth - 1]
    if top.read({ symbol: top.cell.symbol, fields: [End], }, [Some(reg)])
      is Some(pairs) {
      self.bind(pairs)
      return
    }
    self.flush()
    self.output.push(ReadPreviousPosition(depth, reg))
  } else {
    self.output.push(ReadPreviousPosition(depth - count, reg))
  }
}

///|
fn StackRewrite::pop(
  self : StackRewrite,
  cell : Cell,
  regs : Array[Register?],
) -> Unit {
  if self.pending.last() is Some(top) {
    if top.cell == cell && top.read(cell, regs) is Some(pairs) {
      ignore(self.pending.pop())
      self.bind(pairs)
      self.cancelled += 1
      return
    }
    self.flush()
  }
  self.output.push(Pop(cell, regs))
}

///|
fn StackRewrite::instruction(
  self : StackRewrite,
  instruction : Instruction,
) -> Unit {
  let instruction = instruction.map_values(v => self.value(v), r => r)
  match instruction {
    Push(cell, values) if cell.fields == [State, Semantic, Start, End] =>
      self.pending.push({ cell, values, })
    Bind(pairs) => self.bind(pairs)
    Peek(depth, cell, regs) => self.peek(depth, cell, regs)
    ReadPreviousPosition(depth, reg) => self.previous(depth, reg)
    Pop(cell, regs) => self.pop(cell, regs)
    Action(_) => self.output.push(instruction)
    _ => {
      // In particular, a last-shift snapshot observes the complete stack.
      self.flush()
      self.output.push(instruction)
    }
  }
}
