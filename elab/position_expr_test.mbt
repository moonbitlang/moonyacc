///|
test "rebasing an empty symbol start preserves its preceding-position anchor" {
  let position : @elab.PositionExpr = FirstNonEmpty([])
  assert_true(position.rebase(2) == EndOf(1))
}

///|
test "an erased empty prefix does not demand an unused position anchor" {
  let position : @elab.PositionExpr = FirstNonEmpty([
    (BeforeRhs, BeforeRhs),
    (StartOf(0), EndOf(0)),
  ])
  assert_false(position.uses_before_rhs())
  assert_true(@elab.PositionExpr::FirstNonEmpty([]).uses_before_rhs())
}
