///|
test "token-only pull preserves lexer and action order and error tokens" {
  let mut empty_reads = 0
  assert_eq(
    empty_with_eof(() => {
      empty_reads += 1
      EOF
    }),
    42,
  )
  assert_eq(empty_reads, 1)
  events.val = []
  let tokens = [NUMBER(2), PLUS, EOF]
  let mut cursor = 0
  fn read() -> Token {
    events.val.push("read:\{cursor}")
    let token = tokens[cursor]
    cursor += 1
    token
  }
  try start(read) catch {
    UnexpectedToken(EOF, loc, expected) => {
      assert_eq(loc, ((), ()))
      assert_true(expected.any(kind => kind is TK_NUMBER))
    }
    _ => fail("wrong rejected token")
  } noraise {
    _ => fail("accepted an incomplete expression")
  }
  assert_eq(cursor, 3)
  assert_eq(events.val, ["read:0", "marker", "number", "read:1", "read:2"])
}
