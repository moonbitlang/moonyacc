///|
fn Emitter::previous_position_at(
  self : Emitter,
  stack : @mbt_ast.Expr,
) -> @mbt_ast.Expr {
  if !self.support.tracks_positions() {
    return Unit
  }
  If(
    Is(stack, Constructor("YYEmpty", [])),
    value_block(self.machine("initial_position")),
    Some(value_block(self.stack_call("end", [stack]))),
  )
}

///|
fn Emitter::previous_position(self : Emitter, depth : Int32) -> @mbt_ast.Expr {
  self.previous_position_at(self.stack_at(depth))
}

///|
fn initial_position_needed(
  program : @direct_ir.Program,
  support : @mbt_common.Context,
  meta : @codegen.MetaProvider,
) -> Bool {
  if !support.tracks_positions() {
    return false
  }
  let (starts, ends) = position_reads(program)
  for block in program.blocks {
    let unused = unused_previous_positions(block, id => {
      support.action_uses_before_rhs((meta.production_meta)(id).action)
    })
    for instruction in block.instructions {
      match instruction {
        ReadPreviousPosition(_, reg) if !unused.contains(reg.id) => return true
        Push(cell, _) =>
          if cell.symbol is Some(symbol) &&
            (
              (!cell.fields.contains(Start) && starts.contains(symbol)) ||
              (!cell.fields.contains(End) && ends.contains(symbol))
            ) {
            return true
          }
        _ => ()
      }
    }
  }
  false
}
