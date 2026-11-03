///|
test "cloning freshens pattern definitions and their nested uses together" {
  let unit : ValueType = Semantic(Constr(pkg=None, "Unit", []))
  let value = check_reg(0, unit)
  let start = check_reg(1, Position)
  let end = check_reg(2, Position)
  let copy = check_reg(3, unit)
  let original = {
    ..check_block([], [LoadLookahead], []),
    lookahead: Empty,
    terminator: CaseToken(
      [
        (
          BindToken(1, value, start, end),
          {
            instructions: [Bind([(copy, Reg(value))])],
            terminator: Return(0, Reg(copy)),
          },
        ),
      ],
      { instructions: [], terminator: Stop, },
    ),
  }
  let program = fixture([original])
  program.validate()
  let supply = RegisterSupply::new(program)
  let first = supply.clone_block(original)
  let second = supply.clone_block(original)
  fixture([first]).validate()
  fixture([second]).validate()
  let all = [
    ..original.definitions(),
    ..first.definitions(),
    ..second.definitions(),
  ]
  assert_eq(Set(all.map(r => r.id)).length(), all.length())
  guard first.terminator is CaseToken([(BindToken(_, bound, _, _), body)], _) else {
    fail("missing binding pattern")
  }
  guard body.instructions is [Bind([(out, Reg(input))])] else {
    fail("missing renamed use")
  }
  assert_true(input == bound)
  assert_true(body.terminator is Return(_, Reg(result)) && result == out)
}
