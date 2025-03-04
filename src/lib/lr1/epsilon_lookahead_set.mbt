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
priv struct EpsilonLookaheadSet[T] {
  set : T
  nullable : Bool
}

///|
fn EpsilonLookaheadSet::union[T : AbstractLookaheadSet](
  set1 : EpsilonLookaheadSet[T],
  set2 : EpsilonLookaheadSet[T]
) -> EpsilonLookaheadSet[T] {
  { set: set1.set.union(set2.set), nullable: set1.nullable || set2.nullable }
}

///|
/// epsilon free first
fn EpsilonLookaheadSet::op_add[T : AbstractLookaheadSet](
  set1 : EpsilonLookaheadSet[T],
  set2 : EpsilonLookaheadSet[T]
) -> EpsilonLookaheadSet[T] {
  if set1.nullable {
    { set: set1.set.union(set2.set), nullable: set2.nullable }
  } else {
    set1
  }
}
