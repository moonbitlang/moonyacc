///|
fn build_rules_from_src(src : String) -> Map[String, Rule] {
  let lexer = @parser.new_lexer(src)
  fn token() {
    lexer.next_token?().unwrap()
  }

  let ast_spec = @parser.spec?(token, 0).unwrap()
  let spec = elaborate(ast_spec, json_cst=No)
  spec.rules
}

///|
let stdlib_rules : Map[String, Rule] = build_rules_from_src(stdlib_src)
