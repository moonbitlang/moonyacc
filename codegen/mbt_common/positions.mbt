///|
/// Position expressions are resolved before emission. Unit positions disappear
/// here; FirstNonEmpty lowers to a short-circuit expression, never an array.
fn Context::position_expr(
  self : Context,
  position : @elab.PositionExpr,
) -> @mbt_ast.Expr {
  if !self.tracks_positions() {
    return Unit
  }
  match position {
    BeforeRhs => Ident("_last_pos")
    StartOf(index) => component(Index(Ident("_args"), Int(index)), 1)
    EndOf(index) => component(Index(Ident("_args"), Int(index)), 2)
    FirstNonEmpty(spans) => {
      let mut result : @mbt_ast.Expr = if spans.is_empty() {
        Ident("_last_pos")
      } else {
        self.position_expr(spans[spans.length() - 1].1)
      }
      for i in spans.length()>..0 {
        let (start, end) = spans[i]
        // An inlined epsilon symbol has identical symbolic endpoints. Other
        // symbols still need a check: lexers may produce zero-width tokens.
        if start != end {
          let start = self.position_expr(start)
          result = If(
            Binary(NotEqual, start, self.position_expr(end)),
            value_block(start),
            Some(value_block(result)),
          )
        }
      }
      result
    }
  }
}
