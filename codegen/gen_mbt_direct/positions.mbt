///|
fn Emitter::previous_position(self : Emitter, depth : Int32) -> @mbt_ast.Expr {
  if !self.support.tracks_positions() {
    return self.machine("initial_position")
  }
  let length = dot_call(self.machine("data"), "length", [])
  If(
    Binary(Equal, length, Int(depth)),
    value_block(self.machine("initial_position")),
    Some(
      value_block(
        self.support.data_position(
          Index(self.machine("data"), Binary(Subtract, length, Int(depth + 1))),
          2,
        ),
      ),
    ),
  )
}
