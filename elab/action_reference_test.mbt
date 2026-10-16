///|
fn action_reference_source(rhs : String, action : String) -> String {
  "// 😀\r\n%position<Int>\r\n%token<Int> N\r\n%start<Int> start\r\n%%\r\nstart: " +
  rhs +
  " { " +
  action +
  " };\r\n"
}

///|
fn elaborate_action_reference(source : String) -> @elab.ParserSpec raise {
  let lexer = @parser.new_lexer(source)
  let ast = @parser.spec(fn() { try! lexer.next_token() }, 0)
  @elab.elaborate(
    ast,
    source,
    "action_reference.mbty",
    json_cst=No,
    token_payload_rewrite=NoRewrite,
    force_int_position=false,
  )
}

///|
test "action references reject invalid indices at the reference span" {
  for
    (rhs, reference, expected_index) in [
      ("N", "$0", 0),
      ("N", "$2", 2),
      ("", "$1", 1),
      ("N", "$startpos($0)", 0),
      ("N", "$startpos($2)", 2),
      ("N", "$endpos($2)", 2),
      ("N", "$loc($2)", 2),
    ] {
    let source = action_reference_source(rhs, reference)
    let start = source.find(reference).unwrap()
    try elaborate_action_reference(source) catch {
      @elab.OutOfBoundsAccess(index, loc~) => {
        assert_eq(index, expected_index)
        assert_eq(loc, (start, start + reference.length()))
      }
      _ => fail("Expected an out-of-bounds error for \{reference}")
    } noraise {
      _ => fail("Accepted invalid reference \{reference}")
    }
  }
}

///|
test "position references reject unknown binders at the reference span" {
  for reference in ["$startpos(missing)", "$endpos(missing)", "$loc(missing)"] {
    let source = action_reference_source("n=N", reference)
    let start = source.find(reference).unwrap()
    try elaborate_action_reference(source) catch {
      @elab.UnresolvedSymbol(name, loc~) => {
        assert_eq(name, "missing")
        assert_eq(loc, (start, start + reference.length()))
      }
      _ => fail("Expected an unresolved-symbol error for \{reference}")
    } noraise {
      _ => fail("Accepted unknown binder in \{reference}")
    }
  }
}

///|
test "action references accept valid numeric indices and binders" {
  let source = action_reference_source(
    "first=N last=N", "let _ = ($startpos($1), $endpos(last), $loc($2), $loc(first)); $1 + $2",
  )
  ignore(elaborate_action_reference(source))
}
