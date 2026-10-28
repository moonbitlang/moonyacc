///|
test "direct action anchors follow subaction slices and JSON CST spans" {
  let base : @elab.Action = {
    stamp: @stamp.new(),
    arity: 1,
    type_: Constr(pkg=None, "Unit", []),
    span: (BeforeRhs, EndOf(0)),
    sub_actions: [],
    bindings: [],
    body: Default,
    original_clause_info: { file: "test.mbty", line: 0, column: 0, code: "", },
  }
  let empty = {
    ..base,
    stamp: @stamp.new(),
    arity: 0,
    span: (BeforeRhs, BeforeRhs),
    bindings: [(Position(BeforeRhs), "pos")],
  }
  let leading = {
    ..base,
    stamp: @stamp.new(),
    sub_actions: [{ start: 0, end: 0, action: empty, }],
  }
  let nested = {
    ..base,
    stamp: @stamp.new(),
    sub_actions: [{ start: 0, end: 1, action: leading, }],
  }
  let following = {
    ..base,
    stamp: @stamp.new(),
    sub_actions: [{ start: 1, end: 1, action: empty, }],
  }
  let json = {
    ..base,
    stamp: @stamp.new(),
    body: JsonCst(name="start", rule_index=0, clause_index=0),
  }
  let plans = action_parameter_plans(
    [base, empty, leading, nested, following, json].iter(),
    true,
  )
  assert_false(plans[base.stamp].contains(Position(BeforeRhs)))
  assert_false(plans[following.stamp].contains(Position(BeforeRhs)))
  for action in [empty, leading, nested, json] {
    assert_true(plans[action.stamp].contains(Position(BeforeRhs)))
  }
}
