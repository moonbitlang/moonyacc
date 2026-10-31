///|
test "token-only input requires erased positions" {
  let layout : @codegen.InputLayout = TokenOnly
  assert_true(layout.accepts_position(Constr(pkg=None, "Unit", [])))
  assert_false(layout.accepts_position(Constr(pkg=None, "Int", [])))
  // Unknown user aliases do not prove that position information is absent.
  assert_false(layout.accepts_position(Constr(pkg=None, "Position", [])))
  let located : @codegen.InputLayout = Located
  assert_true(located.accepts_position(Constr(pkg=None, "Position", [])))
}
