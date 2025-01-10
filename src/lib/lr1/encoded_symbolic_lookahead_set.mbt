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
struct EncodedSymbolicLookaheadSet {
  concrete_set : EncodedLookaheadSet
  vars : @small_int_set.T
}

///|
let _empty : EncodedSymbolicLookaheadSet = {
  concrete_set: EncodedLookaheadSet::empty(),
  vars: @small_int_set.empty(),
}

///|
fn EncodedSymbolicLookaheadSet::empty() -> EncodedSymbolicLookaheadSet {
  _empty
}

///|
fn EncodedSymbolicLookaheadSet::singleton(
  lookahead : Lookahead
) -> EncodedSymbolicLookaheadSet {
  {
    concrete_set: EncodedLookaheadSet::singleton(lookahead),
    vars: @small_int_set.empty(),
  }
}

///|
fn EncodedSymbolicLookaheadSet::variable(
  var : Int
) -> EncodedSymbolicLookaheadSet {
  {
    concrete_set: EncodedLookaheadSet::empty(),
    vars: @small_int_set.singleton(var),
  }
}

///|
fn EncodedSymbolicLookaheadSet::union(
  self : EncodedSymbolicLookaheadSet,
  other : EncodedSymbolicLookaheadSet
) -> EncodedSymbolicLookaheadSet {
  {
    concrete_set: self.concrete_set.union(other.concrete_set),
    vars: self.vars.union(other.vars),
  }
}

///|
fn EncodedSymbolicLookaheadSet::from_iter(
  iter : Iter[Lookahead]
) -> EncodedSymbolicLookaheadSet {
  {
    concrete_set: EncodedLookaheadSet::from_iter(iter),
    vars: @small_int_set.empty(),
  }
}

///|
fn EncodedSymbolicLookaheadSet::interpret(
  self : EncodedSymbolicLookaheadSet,
  subst : Array[EncodedLookaheadSet]
) -> EncodedLookaheadSet {
  self.vars
  .iter()
  .map(fn(var) { subst[var] })
  .fold(init=self.concrete_set, EncodedLookaheadSet::union)
}
