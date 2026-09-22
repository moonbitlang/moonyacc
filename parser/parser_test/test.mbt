// Copyright (C) 2025 International Digital Economy Academy
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; version 2.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, see <https://www.gnu.org/licenses/>.

///|
test "lexer" (it : @test.Test) {
  let lexer = @parser.new_lexer(parser_mbty)
  fn token() {
    lexer.next_token() catch {
      _ => panic()
    }
  }

  while true {
    let (tok, _, _) = token()
    it.writeln(Repr(tok))
    match tok {
      EOF => break
      _ => ()
    }
  }
  it.snapshot(filename="parser_spec.tokens")
}

///|
test "parser_spec.json" (it : @test.Test) {
  let lexer = @parser.new_lexer(parser_mbty)
  fn token() {
    try! lexer.next_token()
  }

  let spec = @parser.spec(token, 0)
  it.writeln(ToJson::to_json(spec).stringify(indent=2))
  it.snapshot(filename="parser_spec.json")
}

///|
test "parser spec CRLF and lone CR match LF input" {
  fn parse_spec(input : String) -> @ast.ParserSpec raise {
    let lexer = @parser.new_lexer(input)
    fn token() {
      try! lexer.next_token()
    }

    @parser.spec(token, 0)
  }

  fn normalize_spec_json(json : Json) -> Json {
    match json {
      Object(obj) => {
        let normalized : Map[String, Json] = Map([])
        obj.each((key, value) => {
          match key {
            "loc" | "symbol_loc" | "utf8_pos" | "start" | "end" => ()
            _ => normalized[key] = normalize_spec_json(value)
          }
        })
        Json::object(normalized)
      }
      Array(items) => Json::array(items.map(normalize_spec_json))
      String(str) =>
        Json::string(
          str.replace_all(old="\r\n", new="\n").replace_all(old="\r", new="\n"),
        )
      _ => json
    }
  }

  let crlf_parser_mbty = parser_mbty.replace_all(old="\n", new="\r\n")
  let cr_parser_mbty = parser_mbty.replace_all(old="\n", new="\r")
  let spec_json = normalize_spec_json(ToJson::to_json(parse_spec(parser_mbty)))
  let crlf_spec_json = normalize_spec_json(
    ToJson::to_json(parse_spec(crlf_parser_mbty)),
  )
  let cr_spec_json = normalize_spec_json(
    ToJson::to_json(parse_spec(cr_parser_mbty)),
  )
  @test.assert_eq(cr_spec_json, spec_json)
  @test.assert_eq(crlf_spec_json, spec_json)
}

///|
test "parser_spec.mbty" (it : @test.Test) {
  let lexer = @parser.new_lexer(parser_mbty)
  fn token() {
    try! lexer.next_token()
  }

  let spec = @parser.spec(token, 0)
  let buf = StringBuilder()
  @ast.print_spec(spec, buf)
  it.write(buf.to_string())
  it.snapshot(filename="parser_spec.mbty")
}

///|
test "ocaml parser" (it : @test.Test) {
  let lexer = @parser.new_lexer(ocaml_mly)
  fn token() {
    try! lexer.next_token()
  }

  let spec = @parser.spec(token, 0)
  let buf = StringBuilder()
  @ast.print_spec(spec, buf)
  it.write(buf.to_string())
  it.snapshot(filename="ocaml.mly")
}

///|
test "lexer uses longest match and preserves rule priority" {
  let lexer = @parser.new_lexer("@pkg/sub.name identifier %position")
  match (try! lexer.next_token()) {
    (PKG_AND_IDENT((pkg, id)), 0, 13) => {
      @test.assert_eq(pkg, "pkg/sub")
      @test.assert_eq(id, "name")
    }
    _ => @test.fail("expected a package-qualified identifier")
  }
  match (try! lexer.next_token()) {
    (IDENT(id), 14, 24) => @test.assert_eq(id, "identifier")
    _ => @test.fail("expected an identifier")
  }
  match (try! lexer.next_token()) {
    (PERCENT_POSITION, 25, 34) => ()
    _ => @test.fail("expected %position")
  }
  match (try! lexer.next_token()) {
    (EOF, 34, 34) => ()
    _ => @test.fail("expected EOF")
  }
}

///|
test "lexer positions are UTF-16 offsets" {
  let lexer = @parser.new_lexer("// 😀\n%start")
  match (try! lexer.next_token()) {
    (PERCENT_START, 6, 12) => ()
    _ => @test.fail("expected UTF-16 offsets after an emoji in a comment")
  }
  match (try! lexer.next_token()) {
    (EOF, 12, 12) => ()
    _ => @test.fail("expected EOF at the UTF-16 input length")
  }
}

///|
test "lexer handles nested comments without recursion" {
  let prefix = "(* outer (* nested (* deeper *) comment *) end *)"
  let lexer = @parser.new_lexer(prefix + "ident")
  match (try! lexer.next_token()) {
    (IDENT(id), start, end) => {
      @test.assert_eq(id, "ident")
      @test.assert_eq(start, prefix.length())
      @test.assert_eq(end, prefix.length() + 5)
    }
    _ => @test.fail("expected the identifier after a nested comment")
  }
}

///|
fn assert_unterminated_lexer_reaches_eof(input : String) -> Unit raise {
  let lexer = @parser.new_lexer(input)
  try lexer.next_token() catch {
    UnexpectedEndOfFile => ()
    _ => @test.fail("expected UnexpectedEndOfFile")
  } noraise {
    _ => @test.fail("expected an unterminated-structure error")
  }
  match (try! lexer.next_token()) {
    (EOF, start, end) => {
      @test.assert_eq(start, input.length())
      @test.assert_eq(end, input.length())
    }
    _ => @test.fail("expected EOF after the unterminated-structure error")
  }
}

///|
test "lexer commits EOF after an unterminated nested comment" {
  assert_unterminated_lexer_reaches_eof("(* 😀 outer (* nested *)")
}

///|
test "lexer commits EOF after unterminated angle code" {
  assert_unterminated_lexer_reaches_eof("<type expression")
}

///|
test "lexer commits EOF after unterminated percent code" {
  assert_unterminated_lexer_reaches_eof("%{header code")
}

///|
test "lexer scans nested actions and substitution offsets" {
  let lexer = @parser.new_lexer(
    "{outer {😀 $1} $startpos(x) $loc($2) $symbolstartpos $name}",
  )
  match (try! lexer.next_token()) {
    (LBRACE_CODE_RBRACE((code, base, subst)), 0, 59) => {
      @test.assert_eq(
        code, "outer {😀 $1} $startpos(x) $loc($2) $symbolstartpos $name",
      )
      @test.assert_eq(base, 1)
      debug_inspect(
        subst,
        content=(
          #|[
          #|  { start: 10, end: 12, desc: Dollar(1) },
          #|  { start: 14, end: 26, desc: StartPosOf(Name("x")) },
          #|  { start: 27, end: 35, desc: LocOf(Dollar(2)) },
          #|  { start: 36, end: 51, desc: SymbolStartPos },
          #|]
        ),
      )
    }
    _ => @test.fail("expected a nested action token")
  }
}

///|
test "lexer commits EOF after an unterminated nested action" {
  assert_unterminated_lexer_reaches_eof("{ outer { nested }")
}

///|
test "lexer preserves header and trailer ranges" {
  let lexer = @parser.new_lexer("%{😀%}%%x%%😀")
  match (try! lexer.next_token()) {
    (PERCENT_LBRACE_CODE_PERCENT_RBRACE((code, start, len)), 0, 6) => {
      @test.assert_eq(code, "😀")
      @test.assert_eq(start, 2)
      @test.assert_eq(len, 4)
    }
    _ => @test.fail("expected a header token")
  }
  match (try! lexer.next_token()) {
    (PERCENT_PERCENT, 6, 8) => ()
    _ => @test.fail("expected the first %% token")
  }
  match (try! lexer.next_token()) {
    (IDENT(id), 8, 9) => @test.assert_eq(id, "x")
    _ => @test.fail("expected an identifier between %% markers")
  }
  match (try! lexer.next_token()) {
    (PERCENT_PERCENT_CODE_EOF((code, start, len)), 9, 13) => {
      @test.assert_eq(code, "😀")
      @test.assert_eq(start, 11)
      @test.assert_eq(len, 2)
    }
    _ => @test.fail("expected a trailer token")
  }
}

///|
test "lexer reports an illegal Unicode character at its UTF-16 offset" {
  let lexer = @parser.new_lexer(" 😀")
  try lexer.next_token() catch {
    Unrecognized(ch, offset) => {
      @test.assert_eq(ch, '😀')
      @test.assert_eq(offset, 1)
    }
    _ => @test.fail("expected Unrecognized")
  } noraise {
    _ => @test.fail("expected an illegal-character error")
  }
}
