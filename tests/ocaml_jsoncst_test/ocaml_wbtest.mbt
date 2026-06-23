///|
test (it : @test.Test) {
  let lexbuf = @lexbuf.StringLexbuf::from_string(_embed_binary_search_ml)
  let json = implementation(fn() { token(lexbuf) }, 0)
  it.writeln(json.stringify(indent=2))
  it.snapshot(filename="binary_search_ml.json")
}
