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
pub(all) struct ParserSpec {
  header : Code?
  trailer : Code?
  tokens : Array[Token]
  rules : Array[Rule]
  start_rules : Array[Rule]
  position_type : Code?
  derive_map : Map[String, String]
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
pub(all) typealias Code = String

///|
pub(all) enum SubstItemDesc {
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

///|
pub(all) struct SubstItem {
  start : Int
  end : Int
  desc : SubstItemDesc
} derive(Show, ToJson)

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
  items : Array[ClauseItem]
  prec : Int?
  action : ClauseAction
} derive(ToJson)

///|
pub(all) struct ClauseAction {
  code : CodeWithSubst?
  start : Int
  end : Int
} derive(ToJson)

///|
pub(all) struct CodeWithSubst {
  code : Code
  utf8_pos : Int
  subst : Array[SubstItem]
} derive(ToJson)

///|
pub(all) struct ClauseItem {
  binder : Code?
  desc : ClauseItemDesc
} derive(ToJson)

///|
pub(all) enum ClauseItemDesc {
  Token(Token)
  RuleCall(Rule)
} derive(ToJson)
