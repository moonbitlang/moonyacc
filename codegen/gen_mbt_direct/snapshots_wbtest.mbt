///|
test "virtual diagnostic suffixes have independent scalar storage" {
  let dynamic : @direct_ir.Register = { id: 0, type_: State, }
  let block : @direct_ir.Block = {
    hint: NoHint,
    origin: Helper,
    parameters: [],
    lookahead: Any,
    instructions: [SaveErrorSnapshot([State(4), Reg(dynamic), State(6)])],
    terminator: Unreachable,
  }
  let plan = SnapshotPlan::new([block])
  assert_eq(plan.width, 3)
  assert_true(plan.saves)
  assert_eq(plan.storage().map(pair => pair.0.name), [
    "error_depth", "error_suffix_0", "error_suffix_1", "error_suffix_2",
  ])
  guard plan.capture([Int(4), Ident("dynamic_state"), Int(6)], name => {
      Ident(name)
    })
    is [
      Eval(Call(Ident("yy_stack_checkpoint"), [Positional(Ident("stack"))])),
      Assign(Ident("error_suffix_0"), Int(4)),
      Assign(Ident("error_suffix_1"), Ident("dynamic_state")),
      Assign(Ident("error_suffix_2"), Int(6)),
      Assign(Ident("error_depth"), Int(3)),
    ] else {
    fail("snapshot must copy the virtual states at capture time")
  }
  guard plan.capture([], name => Ident(name))
    is [Eval(_), Assign(Ident("error_depth"), Int(0))] else {
    fail("an ordinary shift must hide the previous virtual suffix")
  }
  let absent = SnapshotPlan::new([])
  assert_true(absent.storage().is_empty())
  assert_true(
    absent.states(Ident("prefix"), name => Ident(name)) is Ident("prefix"),
  )
}
