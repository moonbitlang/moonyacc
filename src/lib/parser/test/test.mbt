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
test "lexer" (it : @test.T) {
  let lexer = @parser.new_lexer(parser_spec_src)
  fn token() {
    try {
      lexer.next_token!()
    } catch {
      _ => panic()
    }
  }

  while true {
    let (tok, _, _) = token()
    it.writeln(tok)
    match tok {
      EOF => break
      _ => ()
    }
  }
  it.snapshot!(filename="parser_spec.tokens")
}

///|
test "parser" (it : @test.T) {
  let lexer = @parser.new_lexer(parser_spec_src)
  fn token() {
    lexer.next_token?().unwrap()
  }

  let spec = @parser.spec!(token, 0)
  it.writeln(spec.to_json().stringify(indent=2))
  it.snapshot!(filename="parser_spec.json")
  it.buffer.reset()
  @ast.print_spec(spec, it.buffer)
  it.snapshot!(filename="parser_spec.mbty")
}

///|
test "parser" (it : @test.T) {
  let lexer = @parser.new_lexer(parser_spec_src)
  fn token() {
    lexer.next_token?().unwrap()
  }

  let spec = @parser.spec!(token, 0)
  it.writeln(spec.to_json().stringify(indent=2))
  it.snapshot!(filename="parser_spec.json")
}

///|
test "parser" (it : @test.T) {
  let lexer = @parser.new_lexer(parser_spec_src)
  fn token() {
    lexer.next_token?().unwrap()
  }

  let spec = @parser.spec!(token, 0)
  it.buffer.reset()
  @ast.print_spec(spec, it.buffer)
  it.snapshot!(filename="parser_spec.mbty")
}
