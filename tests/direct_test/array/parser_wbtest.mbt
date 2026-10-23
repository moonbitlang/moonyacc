///|
fn located(tokens : Array[Token]) -> Array[(Token, Int32, Int32)] {
  tokens.mapi((i, token) => (token, i, i + 1))
}

///|
test "direct inline epsilon spans use the position before the physical RHS" {
  assert_eq(
    inline_positions([(NUMBER(1), 10, 11), (EOF, 20, 21)], initial_pos=7),
    [(7, 7), (7, 11), (10, 11), (7, 11)],
  )
  assert_eq(
    inline_positions(
      [(LPAREN, 1, 2), (NUMBER(1), 10, 11), (EOF, 20, 21)],
      initial_pos=7,
    ),
    [(2, 2), (2, 11), (10, 11), (2, 11)],
  )
  // The action does not read the anchor, but its enclosing span still does.
  assert_eq(
    inline_positions(
      [(LPAREN, 1, 2), (STAR, 5, 6), (NUMBER(1), 10, 11), (EOF, 20, 21)],
      initial_pos=7,
    ),
    [(2, 11)],
  )
}

///|
test "direct reductions preserve values, precedence, inline actions and spans" {
  assert_eq(
    start(
      located([NUMBER(2), PLUS, LPAREN, NUMBER(3), STAR, NUMBER(4), RPAREN, EOF]),
    ),
    (14, 0, 7),
  )
}

///|
test "direct rejection retains nonassoc and expected-token semantics" {
  reductions.val = 0
  try start(located([NUMBER(1), EQ, NUMBER(2), EQ, NUMBER(3), EOF])) catch {
    UnexpectedToken(EQ, (3, 4), expected) => {
      assert_true(expected.iter().any(k => k is TK_PLUS))
      assert_true(expected.iter().any(k => k is TK_EOF))
      assert_false(expected.iter().any(k => k is TK_EQ))
    }
    _ => fail("wrong nonassoc error")
  } noraise {
    _ => fail("accepted a nonassociative chain")
  }
  assert_eq(reductions.val, 0)
  try start(located([LPAREN, NUMBER(1)])) catch {
    UnexpectedEndOfInput(2, expected) =>
      assert_true(expected.iter().any(k => k is TK_RPAREN))
    _ => fail("wrong end-of-input error")
  } noraise {
    _ => fail("accepted an incomplete expression")
  }
}

///|
test "direct control flow uses bounded host stack for long and nested inputs" {
  let tokens : Array[Token] = [NUMBER(1)]
  for _ in 0..<20000 {
    tokens.push(PLUS)
    tokens.push(NUMBER(1))
  }
  tokens.push(EOF)
  assert_eq(start(located(tokens)).0, 20001)
  let nested : Array[Token] = []
  for _ in 0..<10000 {
    nested.push(LPAREN)
  }
  nested.push(NUMBER(7))
  for _ in 0..<10000 {
    nested.push(RPAREN)
  }
  nested.push(EOF)
  assert_eq(start(located(nested)).0, 7)
}
