///|
fn Emitter::bindings(
  self : Emitter,
  depth : Int32,
  cell : @direct_ir.Cell,
  registers : Array[@direct_ir.Register?],
) -> Array[@mbt_ast.Stmt] {
  let statements = []
  for i, reg in registers {
    guard reg is Some(reg) && !self.erased_register(reg) else { continue }
    let field = cell.fields[i]
    let value = if field is State {
      self.state_at(depth)
    } else {
      let lane = self.stack.lane(cell.symbol.unwrap(), field)
      let above = self.stack.above(self.flow.read_above[reg.id], lane)
      self.lane_read(lane, above)
    }
    statements.push(self.bind_register(reg, value))
  }
  statements
}

///|
fn Emitter::pop_cells(
  self : Emitter,
  cells : Array[@direct_ir.Cell],
) -> Array[@mbt_ast.Stmt] {
  let statements : Array[@mbt_ast.Stmt] = []
  let counts : Map[Int32, Int32] = Map([])
  for cell in cells {
    for (_, lane) in self.stack.symbols[cell.symbol.unwrap()] {
      counts[lane] = counts.get(lane).unwrap_or(0) + 1
    }
  }
  for (lane, count) in counts {
    statements.push(
      Augment(self.machine(lane_depth(lane)), Subtract, Int(count)),
    )
  }
  statements.push(
    Augment(
      Field(self.machine("stack"), Named("depth")),
      Subtract,
      Int(cells.length()),
    ),
  )
  if self.cache_state {
    statements.push(Assign(self.machine("state"), self.stored_state_at(0)))
  }
  statements
}
