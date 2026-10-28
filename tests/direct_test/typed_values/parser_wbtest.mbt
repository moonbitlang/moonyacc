///|
fn located(tokens : Array[Token]) -> Array[(Token, Pos, Pos)] {
  tokens.mapi((i, token) => {
    (token, Pos::{ offset: i, }, Pos::{ offset: i + 1, })
  })
}

///|
test "typed values preserve distinct result types without Default constraints" {
  visits.val = 0
  amount_events.val = []
  amount_spans.val = []
  let value = item(located([TEXT("typed"), NUMBER(7), FLAG(true), EOF]))
  assert_eq(value.text, "typed")
  assert_eq(value.count, 7)
  assert_true(value.enabled)
  assert_eq(visits.val, 1)
  assert_eq(amount_events.val, ["encode", "decode", "end", "amount"])
  assert_eq(amount_spans.val, [(1, 2, 2)])
  let add = function(located([NUMBER(5), EOF]))
  assert_eq(add(9), 14)
  assert_eq(text(located([TEXT("identity"), EOF])), "identity")
  assert_eq(text(located([TEXT("reenter"), EOF])), "nested")
}

///|
test "typed stacks preserve the last-shift snapshot and custom positions" {
  visits.val = 0
  amount_events.val = []
  amount_spans.val = []
  try item(located([TEXT("typed"), NUMBER(7), TEXT("bad"), EOF])) catch {
    UnexpectedToken(TEXT("bad"), (start, end), expected) => {
      assert_eq((start.offset, end.offset), (2, 3))
      assert_true(expected is [TK_FLAG])
    }
    _ => fail("wrong typed-stack error")
  } noraise {
    _ => fail("accepted mismatched symbols")
  }
  assert_eq(visits.val, 1)
  // The forwarding reductions run before this lookahead; the nullable suffix
  // requires FLAG. Diagnostic simulation must not execute any of these actions.
  assert_eq(amount_events.val, ["encode", "decode"])
  assert_eq(amount_spans.val, [])
}

///|
test "typed action temporaries do not capture bindings or globals" {
  assert_eq(
    hygiene(
      located([
        NUMBER(7),
        NUMBER(2),
        NUMBER(2),
        NUMBER(9),
        NUMBER(2),
        NUMBER(7),
        EOF,
      ]),
    ),
    (14, 42, 3, 107),
  )
}
