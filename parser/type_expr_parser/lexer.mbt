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
pub suberror LexError {
  Unrecognized(Char, Int)
} derive(Debug)

///|
priv struct Lexer {
  base : StringView
  mut rest : StringView
}

///|
fn new_lexer(input : String) -> Lexer {
  let base = input[:]
  { base, rest: base, }
}

///|
fn Lexer::next_token(self : Lexer) -> (Token, Int, Int) raise LexError {
  for input = self.rest {
    let start = input.start_offset() - self.base.start_offset()
    lexmatch input with longest {
      (re"^[ \t\r\n]+", after=rest) => continue rest
      (
        re"^@" +
        (re"[A-Za-z_][A-Za-z0-9_]*(?:/[A-Za-z_][A-Za-z0-9_]*)*" as pkg) +
        re"\." +
        (re"[A-Za-z_][A-Za-z0-9_]*" as id),
        after=rest,
      ) => {
        self.rest = rest
        break (
          PKG_AND_IDENT((pkg.to_owned(), id.to_owned())),
          start,
          rest.start_offset() - self.base.start_offset(),
        )
      }
      (re"^[A-Za-z_][A-Za-z0-9_]*" as ident, after=rest) => {
        self.rest = rest
        break (
          IDENT(ident.to_owned()),
          start,
          rest.start_offset() - self.base.start_offset(),
        )
      }
      (re"^->", after=rest) => {
        self.rest = rest
        break (ARROW, start, rest.start_offset() - self.base.start_offset())
      }
      (re"^\[", after=rest) => {
        self.rest = rest
        break (LBRACKET, start, rest.start_offset() - self.base.start_offset())
      }
      (re"^\]", after=rest) => {
        self.rest = rest
        break (RBRACKET, start, rest.start_offset() - self.base.start_offset())
      }
      (re"^\(", after=rest) => {
        self.rest = rest
        break (LPAREN, start, rest.start_offset() - self.base.start_offset())
      }
      (re"^\)", after=rest) => {
        self.rest = rest
        break (RPAREN, start, rest.start_offset() - self.base.start_offset())
      }
      (re"^,", after=rest) => {
        self.rest = rest
        break (COMMA, start, rest.start_offset() - self.base.start_offset())
      }
      (re"^\?", after=rest) => {
        self.rest = rest
        break (QUESTION, start, rest.start_offset() - self.base.start_offset())
      }
      (re"^." as ch, after=rest) => {
        self.rest = rest
        raise Unrecognized(ch, start)
      }
      re"^$" => {
        self.rest = input
        break (EOF, start, start)
      }
    }
  }
}
