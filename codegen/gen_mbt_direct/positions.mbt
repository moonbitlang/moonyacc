///|
fn Emitter::previous_position(
  self : Emitter,
  depth : Int32,
  reg : @direct_ir.Register,
) -> @mbt_ast.Expr {
  let possible = self.flow.previous_symbols.get(reg.id).unwrap_or(Set([]))
  if possible.is_empty() {
    return self.machine("initial_position")
  }
  let symbol = possible.iter().next().unwrap()
  let lane = self.stack.lane(symbol, End)
  // Every possible predecessor stores End, in the same position lane. Demand
  // propagation establishes this before storage is allocated.
  guard! possible.iter().all(symbol => self.stack.lane(symbol, End) == lane)
  let value = self.lane_read(
    lane,
    self.stack.above(self.flow.read_above[reg.id], lane),
  )
  if !self.flow.previous_initial.contains(reg.id) {
    return value
  }
  If(
    Binary(Equal, Field(self.machine("stack"), Named("depth")), Int(depth + 1)),
    value_block(self.machine("initial_position")),
    Some(value_block(value)),
  )
}
