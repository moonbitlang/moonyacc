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
pub(all) enum TypeExpr {
  Constr(pkg~ : String?, String, Array[TypeExpr])
  Option(TypeExpr)
  Tuple(Array[TypeExpr])
  Arrow(Array[TypeExpr], TypeExpr)
} derive(ToJson)

///|
pub(all) enum Declaration {
  Start(Array[Symbol])
  Token(Array[Symbol], type_~ : TypeExpr?)
  Token1(Symbol, type_~ : TypeExpr?, image~ : String)
  Type(Array[Symbol], type_~ : TypeExpr)
  Derive(traits~ : Array[TypeExpr], type_~ : Code)
  Position(type_~ : TypeExpr)
  Left(Array[Symbol])
  Right(Array[Symbol])
  Nonassoc(Array[Symbol])
} derive(ToJson)

///|
pub(all) struct Rule {
  inline : Bool
  nonterminal : Symbol
  generic_params : Array[String]
  params : Array[(String, TypeExpr?)]
  type_ : TypeExpr?
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
  start : Position
  end : Position
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
  term : Term
} derive(ToJson)

///|
pub(all) enum Term {
  Symbol(Symbol)
  Image(String)
  RuleCall(Symbol, Array[Term])
  AnonmousInlineRule(Array[ClauseItem], ClauseAction)
} derive(ToJson)
