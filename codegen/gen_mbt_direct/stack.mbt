///|
fn Emitter::block_instructions(
  self : Emitter,
  block : @direct_ir.Block,
) -> Array[@mbt_ast.Stmt] {
  if self.chunked && shift_target(block) is Some(target) {
    return [Eval(call("yy_shift", [Ident("_env"), Int(target)]))]
  }
  let unused = unused_previous_positions(block, id => {
    self.support.action_uses_before_rhs((self.meta.production_meta)(id).action)
  })
  if reduction_plan(block, self.program.actions) is Some(plan) {
    return self.reduction_instructions(plan, unused)
  }
  let statements = []
  for instruction in block.instructions {
    if instruction is ReadPreviousPosition(_, reg) && unused.contains(reg.id) {
      continue
    }
    statements.append(self.instruction(instruction))
  }
  statements
}
