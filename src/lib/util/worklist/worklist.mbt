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
pub fn process[T](worklist : Iter[T], f : (T, (T) -> Unit) -> Unit) -> Unit {
  let worklist = worklist.to_array()
  fn add(work : T) -> Unit {
    worklist.push(work)
  }

  while not(worklist.is_empty()) {
    let work = worklist.unsafe_pop()
    f(work, add)
  }
}
