///|
test "typed JsonCst converts each read token, including rejected lookahead" {
  conversions.val = 0
  let tokens = [VALUE(Payload::{ value: 7, }), EOF]
  let mut cursor = 0
  let node = start(
    () => {
      let token = tokens[cursor]
      cursor += 1
      (token, (), ())
    },
    (),
  )
  assert_eq(cursor, 2)
  assert_eq(conversions.val, 1)
  json_inspect(node, content={
    "type": "NONTERMINAL",
    "name": "start",
    "rule_index": 0,
    "clause_index": 0,
    "children": [
      {
        "type": "NONTERMINAL",
        "name": "value",
        "rule_index": 1,
        "clause_index": 0,
        "children": [
          {
            "type": "TERMINAL",
            "name": "VALUE",
            "data": 7,
            "start": null,
            "end": null,
          },
        ],
        "start": null,
        "end": null,
      },
      {
        "type": "TERMINAL",
        "name": "EOF",
        "data": null,
        "start": null,
        "end": null,
      },
    ],
    "start": null,
    "end": null,
  })
  conversions.val = 0
  let mut reads = 0
  let invalid = [VALUE(Payload::{ value: 7, }), INVALID(Payload::{ value: 9, })]
  try
    start(
      () => {
        let token = invalid[reads]
        reads += 1
        (token, (), ())
      },
      (),
    )
  catch {
    UnexpectedToken(INVALID(_), _, expected) =>
      assert_true(expected is [TK_EOF])
    _ => fail("wrong rejected lookahead")
  } noraise {
    _ => fail("accepted invalid token")
  }
  assert_eq(reads, 2)
  assert_eq(conversions.val, 2)
}
