///|
/// A parameterless block cannot read old parameter slots. Its result registers
/// can therefore be defined directly in distinct slots of its Jump successor.
/// Each register gets at most one slot, even if passed more than once.
fn coalesce_results(
  blocks : Array[@direct_ir.Block],
  slots : Map[Int32, (Int32, Int32)],
) -> Unit {
  for block in blocks {
    if block.parameters.is_empty() && block.terminator is Jump(edge) {
      let parameters = blocks[edge.target].parameters
      for i, value in edge.arguments {
        if value is Reg(reg) &&
          !slots.contains(reg.id) &&
          slots.get(parameters[i].id) is Some(slot) {
          slots[reg.id] = slot
        }
      }
    }
  }
}

///|
fn Emitter::bind_register(
  self : Emitter,
  reg : @direct_ir.Register,
  value : @mbt_ast.Expr,
) -> @mbt_ast.Stmt {
  guard! !self.erased_register(reg)
  if self.slots.contains(reg.id) {
    self.store(reg, value)
  } else {
    binding("_yy_r\{reg.id}", value)
  }
}
