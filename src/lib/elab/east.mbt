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
pub(all) enum Associativity {
  LeftAssoc
  RightAssoc
  NonAssoc
} derive(ToJson)

///|
pub(all) typealias Code = String

///|
pub(all) struct ParserSpec {
  header : Code?
  trailer : Code?
  tokens : Array[Token]
  rules : Array[Rule]
  start_rules : Array[Rule]
  position_type : Code?
  derive_map : @array_multimap.T[String, String]
} derive(ToJson)

///|
pub(all) struct Token {
  num : Int
  name : String
  mut prec : (Int, Associativity)?
  mut type_ : Code?
  mut image : String?
} derive(ToJson)

///|
pub(all) typealias Symbol = String

///|
pub(all) struct Rule {
  num : Int
  name : Symbol
  mut type_ : Code?
  clauses : Array[Clause]
} derive(ToJson)

///|
pub(all) struct Clause {
  items : Array[Item]
  prec : Int?
  action : Array[CodeChunk]?
} derive(ToJson)

///|
pub(all) struct Item {
  binder : Code?
  desc : ItemDesc
} derive(ToJson)

///|
pub(all) enum ItemDesc {
  Token(Token)
  RuleCall(Rule)
} derive(ToJson)

///|
pub(all) struct CodeChunk {
  orig_utf8_pos : Int
  orig_utf8_len : Int
  desc : CodeChunkDesc
} derive(ToJson)

///|
pub(all) enum CodeChunkDesc {
  Code(Code)
  Subst(Subst)
} derive(ToJson)

///|
pub(all) enum Subst {
  Dollar(Int)
  StartPos
  EndPos
  Loc
  StartPosOf(ClauseItemIdent)
  EndPosOf(ClauseItemIdent)
  LocOf(ClauseItemIdent)
  SymbolStartPos
  Sloc
} derive(Eq, Compare, Show, ToJson)

///|
pub(all) enum ClauseItemIdent {
  Dollar(Int)
  Name(Code)
} derive(Eq, Compare, Show, ToJson)
