///|
test "O2 retains nonidentity unit actions and positions across predecessor contexts" {
  for (tokens, expected, trace) in [
    ([A, NUMBER(3), EOF], (7, 1, 2), ["prefix-a", "number", "factor", "value", "epsilon", "start"]),
    ([B, LP, NUMBER(2), RP, EOF], (117, 1, 4), ["prefix-b", "number", "factor", "value", "paren", "factor", "value", "epsilon", "start"]),
    ([NUMBER(3), EOF], (1007, 0, 1), ["prefix-empty", "number", "factor", "value", "epsilon", "start"]),
  ] {
    events.val = []
    let mut reads = 0
    let result = start(() => {
      let i = reads
      reads += 1
      (tokens[i], i, i + 1)
    }, -1)
    assert_eq(result, expected)
    assert_eq(events.val, trace)
    assert_eq(reads, tokens.length())
  }
}

///|
test "O2 preserves failure before a conditional epsilon action" {
  events.val = []
  let tokens = [B, NUMBER(5), LP]
  let mut reads = 0
  try start(() => {
    let i = reads
    reads += 1
    (tokens[i], i, i + 1)
  }, -1) catch {
    UnexpectedToken(LP, (2, 3), expected) => assert_true(expected is [TK_EOF])
    _ => fail("unexpected specialized error")
  } noraise {
    _ => fail("accepted invalid lookahead")
  }
  assert_eq(reads, 3)
  assert_eq(events.val, ["prefix-b", "number", "factor", "value"])
}
