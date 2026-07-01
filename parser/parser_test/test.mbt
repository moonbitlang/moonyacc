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
    it.writeln(to_repr(tok))
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
  it.writeln(spec.to_json().stringify(indent=2))
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
        let normalized : Map[String, Json] = {}
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
  let spec_json = normalize_spec_json(parse_spec(parser_mbty).to_json())
  let crlf_spec_json = normalize_spec_json(
    parse_spec(crlf_parser_mbty).to_json(),
  )
  let cr_spec_json = normalize_spec_json(parse_spec(cr_parser_mbty).to_json())
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
  let buf = StringBuilder::new()
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
  let buf = StringBuilder::new()
  @ast.print_spec(spec, buf)
  it.write(buf.to_string())
  it.snapshot(filename="ocaml.mly")
}
