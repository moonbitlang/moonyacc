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
/// 0: EndOfInput
/// 1..<1024: Terminal number + 1
priv type EncodedLookaheadSet @small_int_set.T derive(Eq, Compare, Hash)

///|
fn EncodedLookaheadSet::is_empty(self : EncodedLookaheadSet) -> Bool {
  self._.is_empty()
}

///|
fn EncodedLookaheadSet::is_singleton(
  self : EncodedLookaheadSet,
  key : Lookahead
) -> Bool {
  self._.is_singleton(
    match key {
      EndOfInput => 0
      Input(key) => key.num + 1
    },
  )
}

///|
fn EncodedLookaheadSet::contains(
  self : EncodedLookaheadSet,
  lookahead : Lookahead
) -> Bool {
  match lookahead {
    Input(t) => self._.contains(t.num + 1)
    EndOfInput => self._.contains(0)
  }
}

///|
fn EncodedLookaheadSet::empty() -> EncodedLookaheadSet {
  @small_int_set.empty()
}

///|
fn EncodedLookaheadSet::default() -> EncodedLookaheadSet {
  EncodedLookaheadSet::empty()
}

///|
fn EncodedLookaheadSet::from_iter(
  iter : Iter[Lookahead]
) -> EncodedLookaheadSet {
  @small_int_set.from_iter(
    iter.map(fn(lookahead) {
      match lookahead {
        Input(t) => t.num + 1
        EndOfInput => 0
      }
    }),
  )
}

///|
fn EncodedLookaheadSet::terminal(t : @grm.Terminal) -> EncodedLookaheadSet {
  @small_int_set.singleton(t.num + 1)
}

///|
fn EncodedLookaheadSet::end_of_input() -> EncodedLookaheadSet {
  @small_int_set.singleton(0)
}

///|
fn EncodedLookaheadSet::singleton(input : Lookahead) -> EncodedLookaheadSet {
  match input {
    Input(t) => EncodedLookaheadSet::terminal(t)
    EndOfInput => EncodedLookaheadSet::end_of_input()
  }
}

///|
fn EncodedLookaheadSet::decode_iter(
  self : EncodedLookaheadSet,
  grammar : @grm.Grammar
) -> Iter[Lookahead] {
  self._
  .iter()
  .map(fn(t) {
    if t == 0 {
      EndOfInput
    } else {
      Input(grammar.terminals[t - 1])
    }
  })
}

///|
fn EncodedLookaheadSet::union(
  self : EncodedLookaheadSet,
  other : EncodedLookaheadSet
) -> EncodedLookaheadSet {
  self._.union(other._)
}

///|
fn EncodedLookaheadSet::disjoint(
  self : EncodedLookaheadSet,
  other : EncodedLookaheadSet
) -> Bool {
  self._.disjoint(other._)
}

///|
fn EncodedLookaheadSet::subset(
  self : EncodedLookaheadSet,
  other : EncodedLookaheadSet
) -> Bool {
  self._.subset(other._)
}
