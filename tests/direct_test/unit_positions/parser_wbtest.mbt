///|
test "erased positions preserve actions, nullable entries and errors" {
  marked.val = 0
  let tokens = [NUMBER(2), PLUS, NUMBER(3), STAR, NUMBER(4), EOF]
  assert_eq(start(tokens.map(token => (token, (), ()))), 14)
  assert_eq(marked.val, 1)
  assert_eq(empty([], initial_pos=()), 42)
  try start([], initial_pos=()) catch {
    UnexpectedEndOfInput(pos, expected) => {
      assert_eq(pos, ())
      assert_true(expected.any(kind => kind is TK_NUMBER))
    }
    _ => fail("wrong error for empty input")
  } noraise {
    _ => fail("accepted an incomplete expression")
  }
}
