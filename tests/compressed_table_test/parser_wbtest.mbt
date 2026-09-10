///|
test "compressed table parses balanced parentheses" {
  ignore(start([(NUMBER(1), 0, 1)]))
  ignore(start([(LPAREN, 0, 1), (NUMBER(1), 1, 2), (RPAREN, 2, 3)]))
}

///|
test "compressed table reports incomplete input" {
  try start([(LPAREN, 0, 1), (NUMBER(1), 1, 2)]) catch {
    UnexpectedEndOfInput(2, [TK_RPAREN]) => ()
    _ => fail("Expected UnexpectedEndOfInput error")
  } noraise {
    _ => fail("Expected UnexpectedEndOfInput error")
  }
}
