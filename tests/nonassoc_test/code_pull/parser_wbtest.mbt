///|
test "nonassoc stops the token reader at the second operator" {
  let tokens = [NUMBER(1), EQ, NUMBER(2), EQ, NUMBER(3)]
  let mut cursor = 0
  fn read_token() -> (Token, Int, Int) {
    guard cursor < tokens.length() else { (EOF, cursor, cursor) }
    let token = tokens[cursor]
    cursor += 1
    (token, cursor - 1, cursor)
  }
  try start(read_token, 0) catch {
    UnexpectedToken(EQ, (3, 4), _) => ()
    _ => fail("Expected a syntax error at the second operator")
  } noraise {
    _ => fail("Accepted a nonassociative chain")
  }
  assert_eq(cursor, 4)
}
