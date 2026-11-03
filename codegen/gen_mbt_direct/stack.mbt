///|
fn Emitter::block_instructions(
  self : Emitter,
  block : @direct_ir.Block,
  checkpoint : @direct_ir.CheckpointFact,
) -> (Array[@mbt_ast.Stmt], @direct_ir.CheckpointFact) {
  let statements = []
  let pending = []
  let mut checkpoint = checkpoint
  let live = self.checkpoints.liveness.points({
    instructions: block.instructions,
    terminator: block.terminator,
  })
  fn flush() {
    if !pending.is_empty() {
      statements.append(self.pop_cells(pending))
      pending.clear()
    }
  }
  for i, instruction in block.instructions {
    if instruction is Pop(cell, regs) &&
      regs.all(reg => reg.map(r => self.erased_register(r)).unwrap_or(true)) {
      pending.push(cell)
    } else {
      // No read, semantic action, lexer call or checkpoint is crossed.
      flush()
      statements.append(
        self.instruction(instruction, checkpoint, preserve=live[i + 1]),
      )
    }
    // Batched pops still advance the logical fact one instruction at a time;
    // flush() emits them before any operation that can observe the depth.
    checkpoint = checkpoint.step(instruction, preserve=live[i + 1])
  }
  flush()
  (statements, checkpoint)
}
