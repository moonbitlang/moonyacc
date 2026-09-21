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
test {
  debug_inspect(
    @type_expr_parser.parse("Int"),
    content=(
      #|Constr(pkg=None, "Int", [])
    ),
  )
}

///|
test {
  debug_inspect(
    @type_expr_parser.parse("Array[Int]"),
    content=(
      #|Constr(pkg=None, "Array", [Constr(pkg=None, "Int", [])])
    ),
  )
}

///|
test {
  debug_inspect(
    @type_expr_parser.parse("Array[\r\n  Int\r\n]"),
    content=(
      #|Constr(pkg=None, "Array", [Constr(pkg=None, "Int", [])])
    ),
  )
}

///|
test {
  debug_inspect(
    @type_expr_parser.parse("Array[(Int, Int)]"),
    content=(
      #|Constr(
      #|  pkg=None,
      #|  "Array",
      #|  [([Constr(pkg=None, "Int", []), Constr(pkg=None, "Int", [])])],
      #|)
    ),
  )
}

///|
test {
  debug_inspect(
    @type_expr_parser.parse("Array[(Int, Map[String, (Int, Int) -> Int])]"),
    content=(
      #|Constr(
      #|  pkg=None,
      #|  "Array",
      #|  [
      #|    (
      #|      [
      #|        Constr(pkg=None, "Int", []),
      #|        Constr(
      #|          pkg=None,
      #|          "Map",
      #|          [
      #|            Constr(pkg=None, "String", []),
      #|            Arrow(
      #|              [Constr(pkg=None, "Int", []), Constr(pkg=None, "Int", [])],
      #|              Constr(pkg=None, "Int", []),
      #|            ),
      #|          ],
      #|        ),
      #|      ],
      #|    ),
      #|  ],
      #|)
    ),
  )
}

///|
test "qualified type names use the longest lexer match" {
  debug_inspect(
    @type_expr_parser.parse("@foo/bar.Baz[Int]"),
    content=(
      #|Constr(pkg=Some("foo/bar"), "Baz", [Constr(pkg=None, "Int", [])])
    ),
  )
}

///|
test "arrow wins over the illegal-character fallback" {
  debug_inspect(
    @type_expr_parser.parse("(Int) -> String"),
    content=(
      #|Arrow([Constr(pkg=None, "Int", [])], Constr(pkg=None, "String", []))
    ),
  )
}

///|
test "type lexer errors use UTF-16 offsets" {
  let err = try @type_expr_parser.parse("Int 😀") catch {
    err => Some(err)
  } noraise {
    _ => None
  }
  debug_inspect(err, content="Some(LexError(Unrecognized('😀', 4)))")
}
