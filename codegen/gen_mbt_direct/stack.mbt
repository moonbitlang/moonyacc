///|
fn Emitter::block_instructions(
  self : Emitter,
  block : @direct_ir.Block,
) -> Array[@mbt_ast.Stmt] {
  let statements = []
  let pending = []
  fn flush() {
    if !pending.is_empty() {
      statements.append(self.pop_cells(pending))
      pending.clear()
    }
  }
  for instruction in block.instructions {
    if instruction is Pop(cell, regs) &&
      regs.all(reg => reg.map(r => self.erased_register(r)).unwrap_or(true)) {
      pending.push(cell)
    } else {
      // No read, semantic action, lexer call or checkpoint is crossed.
      flush()
      statements.append(self.instruction(instruction))
    }
  }
  flush()
  statements
}
