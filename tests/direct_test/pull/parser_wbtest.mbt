///|
test "direct pull keeps lookahead cached through reductions and stops at EOF" {
  let tokens = [NUMBER(1), PLUS, NUMBER(2), EQ, NUMBER(3), EOF]
  let mut cursor = 0
  fn read_token() -> (Token, Int32, Int32) {
    let i = cursor
    cursor += 1
    (tokens[i], i, i + 1)
  }
  assert_eq(start(read_token, 0), (6, 0, 5))
  assert_eq(cursor, tokens.length())
  assert_eq(reductions.val, 1)
}

///|
test "direct pull nonassoc rejects before running the action or reading further" {
  reductions.val = 0
  let tokens = [NUMBER(1), EQ, NUMBER(2), EQ]
  let mut cursor = 0
  fn read_token() -> (Token, Int32, Int32) {
    let i = cursor
    cursor += 1
    (tokens[i], i, i + 1)
  }
  try start(read_token, 0) catch {
    UnexpectedToken(EQ, (3, 4), _) => ()
    _ => fail("wrong nonassoc error")
  } noraise {
    _ => fail("accepted a nonassociative chain")
  }
  assert_eq(cursor, 4)
  assert_eq(reductions.val, 0)
}
