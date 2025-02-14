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
pub(all) struct ParserSpec {
  header : Code?
  trailer : Code?
  decls : Array[Declaration]
  rules : Array[Rule]
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
pub(all) enum Declaration {
  Start(Array[Symbol])
  Token(Array[Symbol], type_~ : Code?)
  Token1(Symbol, type_~ : Code?, image~ : String)
  Type(Array[Symbol], type_~ : Code)
  Derive(traits~ : Code, type_~ : Code)
  Position(type_~ : Code)
  Left(Array[Symbol])
  Right(Array[Symbol])
  Nonassoc(Array[Symbol])
} derive(ToJson)

///|
pub(all) struct Rule {
  nonterminal : Symbol
  type_ : Code?
  clauses : Array[Clause]
} derive(ToJson)

///|
pub(all) struct Clause {
  items : Array[ClauseItem]
  prec : Symbol?
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
  symbol : ClauseItemSymbol
} derive(ToJson)

///|
pub(all) enum ClauseItemSymbol {
  Symbol(Symbol)
  Image(String)
} derive(ToJson)
