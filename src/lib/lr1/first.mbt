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
fn compute_first_fn[T : AbstractLookaheadSet](
  grammar : @grm.Grammar
) -> (ArrayView[@grm.Symbol]) -> EpsilonLookaheadSet[T] {
  let nt_first_map : Array[EpsilonLookaheadSet[T]?] = Array::make(
    grammar.nonterminals.length(),
    None,
  )
  fn first(symbols : ArrayView[@grm.Symbol]) {
    match symbols {
      [] => { set: T::empty(), nullable: true }
      [symbol, .. rest] =>
        (match symbol {
          T(t) => { set: T::singleton(Input(t)), nullable: false }
          NT(nt) =>
            match nt_first_map[nt.num] {
              Some(set) => set
              None => {
                nt_first_map[nt.num] = Some({ set: T::empty(), nullable: false })
                let set = nt.productions.fold(
                  init={ set: T::empty(), nullable: false },
                  fn(acc, p) { acc.union(first(p.rhs[:])) },
                )
                nt_first_map[nt.num] = Some(set)
                set
              }
            }
        }) +
        first(rest)
    }
  }

  first
}
