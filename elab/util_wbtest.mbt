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
fn assert_offset_line_column(
  content : String,
  offset : Int,
  line : Int,
  column : Int,
) -> Unit raise {
  let (actual_line, actual_column) = offset_to_line_column(content, offset)
  assert_eq(actual_line, line)
  assert_eq(actual_column, column)
}

///|
test "offset_to_line_column treats CRLF as one newline" {
  let content = "a\r\nbc"
  assert_offset_line_column(content, 3, 2, 1)
  assert_offset_line_column(content, 5, 2, 3)
}

///|
test "offset_to_line_column treats lone CR as newline" {
  assert_offset_line_column("a\rb", 2, 2, 1)
}
