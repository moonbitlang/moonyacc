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
  self.position_expression(position, atom => {
    match atom {
      BeforeRhs => Ident("_last_pos")
      StartOf(index) => component(Index(Ident("_args"), Int(index)), 1)
      EndOf(index) => component(Index(Ident("_args"), Int(index)), 2)
      FirstNonEmpty(_) => abort("non-atomic position input")
    }
  })
}

///|
fn Context::position_expression(
  self : Context,
  position : @elab.PositionExpr,
  input : (@elab.PositionExpr) -> @mbt_ast.Expr,
) -> @mbt_ast.Expr {
  if !self.tracks_positions() {
    return Unit
  }
  match position {
    BeforeRhs | StartOf(_) | EndOf(_) => input(position)
    FirstNonEmpty(spans) => {
      let mut result : @mbt_ast.Expr = if spans.is_empty() {
        input(BeforeRhs)
      } else {
        self.position_expression(spans[spans.length() - 1].1, input)
      }
      for i in spans.length()>..0 {
        let (start, end) = spans[i]
        // An inlined epsilon symbol has identical symbolic endpoints. Other
        // symbols still need a check: lexers may produce zero-width tokens.
        if start != end {
          let start = self.position_expression(start, input)
          result = If(
            Binary(NotEqual, start, self.position_expression(end, input)),
            value_block(start),
            Some(value_block(result)),
          )
        }
      }
      result
    }
  }
}
