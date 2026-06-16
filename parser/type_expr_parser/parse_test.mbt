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
    parse("Int"),
    content=(
      #|Constr(pkg=None, "Int", [])
    ),
  )
}

///|
test {
  debug_inspect(
    parse("Array[Int]"),
    content=(
      #|Constr(pkg=None, "Array", [Constr(pkg=None, "Int", [])])
    ),
  )
}

///|
test {
  debug_inspect(
    parse("Array[(Int, Int)]"),
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
    parse("Array[(Int, Map[String, (Int, Int) -> Int])]"),
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
