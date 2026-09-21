///|
test (it : @test.Test) {
  let lexer = new_lexer(_embed_binary_search_ml)
  let json = implementation(fn() { lexer.next_token() }, 0)
  it.writeln(json.stringify(indent=2))
  it.snapshot(filename="binary_search_ml.json")
}

///|
test "OCaml lexer preserves longest-match rule priority" {
  let lexer = new_lexer("&& <- :: [%% [@@@ ;; let do Foo 123")
  let tokens : Array[(TokenKind, Int, Int)] = []
  while true {
    let (token, start, end) = lexer.next_token()
    tokens.push((token.kind(), start, end))
    if token is EOF {
      break
    }
  }
  debug_inspect(
    tokens,
    content=(
      #|[
      #|  ("AMPERAMPER", 0, 2),
      #|  ("INFIXOP0", 3, 5),
      #|  ("COLONCOLON", 6, 8),
      #|  ("LBRACKETPERCENTPERCENT", 9, 12),
      #|  ("LBRACKETATATAT", 13, 17),
      #|  ("SEMISEMI", 18, 20),
      #|  ("LET", 21, 24),
      #|  ("TO", 25, 27),
      #|  ("UIDENT", 28, 31),
      #|  ("INT", 32, 35),
      #|  ("EOF", 35, 35),
      #|]
    ),
  )
}
