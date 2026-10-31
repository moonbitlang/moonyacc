///|
test "token-only arrays handle nullable and non-nullable empty inputs" {
  assert_eq(empty([]), 42)
  events.val = []
  assert_eq(start([NUMBER(2), PLUS, NUMBER(3), EOF]), 5)
  assert_true(events.val == ["marker", "number", "number", "add"])
  try start([]) catch {
    UnexpectedEndOfInput(pos, expected) => {
      assert_eq(pos, ())
      assert_true(expected.any(kind => kind is TK_NUMBER))
    }
    _ => fail("wrong empty-input error")
  } noraise {
    _ => fail("accepted an incomplete input")
  }
}
