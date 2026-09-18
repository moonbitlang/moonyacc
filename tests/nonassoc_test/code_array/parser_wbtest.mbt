///|
fn parse_tokens(tokens : Array[Token]) -> Int raise ParseError {
  start(tokens.mapi((index, token) => (token, index, index + 1)), initial_pos=0)
}

///|
test "nonassoc accepts comparisons and parenthesized nesting" {
  assert_eq(parse_tokens([NUMBER(1), EQ, NUMBER(2)]), 3)
  assert_eq(parse_tokens([NUMBER(1), NE, NUMBER(2)]), 3)
  assert_eq(
    parse_tokens([LPAREN, NUMBER(1), EQ, NUMBER(2), RPAREN, NE, NUMBER(3)]),
    6,
  )
  assert_eq(
    parse_tokens([NUMBER(1), EQ, LPAREN, NUMBER(2), NE, NUMBER(3), RPAREN]),
    6,
  )
}

///|
test "nonassoc rejects the second operator before running its reduction" {
  for operator in [EQ, NE] {
    reductions.val = 0
    try parse_tokens([NUMBER(1), EQ, NUMBER(2), operator, NUMBER(3)]) catch {
      UnexpectedToken(token, (3, 4), expected) => {
        assert_true(
          match (token, operator) {
            (EQ, EQ) | (NE, NE) => true
            _ => false
          },
        )
        assert_false(
          expected.iter().any(kind => kind is TK_EQ || kind is TK_NE),
        )
      }
      _ => fail("Expected a syntax error at the second operator")
    } noraise {
      _ => fail("Accepted a nonassociative chain")
    }
    assert_eq(reductions.val, 0)
  }
}
