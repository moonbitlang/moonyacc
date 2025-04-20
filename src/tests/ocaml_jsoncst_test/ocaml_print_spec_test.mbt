///|
test "parser" (it : @test.T) {
  let lexer = @parser.new_lexer(ocaml_parser_spec_src)
  fn token() {
    lexer.next_token?().unwrap()
  }

  let spec = @parser.spec!(token, 0)
  it.buffer.reset()
  @ast.print_spec(spec, it.buffer)
  it.snapshot!(filename="ocaml.mly")
}
