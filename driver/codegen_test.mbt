///|
test "CRLF grammar comments render like LF comments" {
  let source = "%token A EOF\n%start start\n%%\nstart:\n  A EOF\n  { () }\n"
  fn generate(source : String) -> String {
    @driver.compile(
      source,
      filename="parser.mly",
      mode=JsonCst,
      input_mode=Pull,
      token_payload_rewrite=NoPayload,
      force_int_position=true,
      generator=@gen_mbt_table.compress_generator,
    )
  }
  assert_true(
    generate(source.replace_all(old="\n", new="\r\n")) == generate(source),
  )
}

///|
test "JSON CST generation shares nonterminal construction" {
  let grammar =
    #|%position<Int>
    #|%token<Int> NUMBER
    #|%token MARK EOF
    #|%start start
    #|%%
    #|start: prefix atom EOF { () };
    #|prefix: { () } | MARK { () };
    #|%inline atom: NUMBER { () };
  for
    generator in [
      @gen_mbt.generator, @gen_mbt_table.generator, @gen_mbt_table.compress_generator,
    ] {
    for input_mode in [@driver.InputMode::Array, Pull] {
      let output = @driver.compile(
        grammar,
        filename="shared_cst.mbty",
        mode=JsonCst,
        input_mode~,
        generator~,
      )
      assert_eq(output.split("\"NONTERMINAL\"").count() - 1, 1)
    }
    let output = @driver.compile(
      grammar,
      filename="shared_cst.mbty",
      generator~,
    )
    assert_eq(output.split("\"NONTERMINAL\"").count() - 1, 0)
  }
}
