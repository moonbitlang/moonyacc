///|
test "JSON CST sharing preserves metadata, empty ranges and inline children" {
  let number = (NUMBER(7), (3, 9), (3, 11))
  let eof = (EOF, (3, 11), (3, 11))
  let empty_prefix : Json = {
    "type": "NONTERMINAL",
    "name": "prefix",
    "rule_index": 1,
    "clause_index": 0,
    "children": [],
    "start": [3, 4],
    "end": [3, 4],
  }
  let marked_prefix : Json = {
    "type": "NONTERMINAL",
    "name": "prefix",
    "rule_index": 1,
    "clause_index": 1,
    "children": [
      {
        "type": "TERMINAL",
        "name": "MARK",
        "data": Json::null(),
        "start": [3, 4],
        "end": [3, 5],
      },
    ],
    "start": [3, 4],
    "end": [3, 5],
  }
  for
    (tokens, prefix) in [
      ([number, eof], empty_prefix),
      ([(MARK, (3, 4), (3, 5)), number, eof], marked_prefix),
    ] {
    json_inspect(start(tokens, initial_pos=(3, 4)), content={
      "type": "NONTERMINAL",
      "name": "start",
      "rule_index": 0,
      "clause_index": 0,
      "children": [
        prefix,
        {
          "type": "TERMINAL",
          "name": "NUMBER",
          "data": 7,
          "start": [3, 9],
          "end": [3, 11],
        },
        {
          "type": "TERMINAL",
          "name": "EOF",
          "data": Json::null(),
          "start": [3, 11],
          "end": [3, 11],
        },
      ],
      "start": [3, 4],
      "end": [3, 11],
    })
  }
}
