///|
test "single-token typed parsers need neither a partial token guard nor unused position helpers" {
  assert_eq(start([(VALUE('λ'), 3, 4)]), 'λ')
  try start([], initial_pos=13) catch {
    UnexpectedEndOfInput(position, expected) => {
      assert_eq(position, 13)
      assert_true(expected.any(kind => kind is TK_VALUE))
    }
    _ => fail("wrong empty-input error")
  } noraise {
    _ => fail("accepted empty input")
  }
}
