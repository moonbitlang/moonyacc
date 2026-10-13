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
  decls : Array[Declaration]
  rules : Array[Rule]
} derive(ToJson)

///|
pub type Code = String

///|
pub(all) enum SubstItemDesc {
  Dollar(Int32)
  StartPos
  EndPos
  Loc
  StartPosOf(ClauseItemIdent)
  EndPosOf(ClauseItemIdent)
  LocOf(ClauseItemIdent)
  SymbolStartPos
  Sloc
} derive(Eq, Compare, Debug, ToJson(style="legacy"))

///|
pub(all) enum ClauseItemIdent {
  Dollar(Int32)
  Name(Code)
} derive(Eq, Compare, Debug, ToJson(style="legacy"))

///|
pub(all) struct SubstItem {
  start : Int32
  end : Int32
  desc : SubstItemDesc
} derive(Debug, ToJson)

///|
pub type Symbol = String

///|
pub(all) enum TypeExpr {
  Constr(pkg~ : String?, String, Array[TypeExpr])
  Option(TypeExpr)
  Tuple(Array[TypeExpr])
  Arrow(Array[TypeExpr], TypeExpr)
} derive(Debug, ToJson(style="legacy"))

///|
pub type TypeString = String

///|
pub(all) enum Declaration {
  Header(Code, Int32, Int32) // (code, utf8_pos, utf8_len)
  Trailer(Code, Int32, Int32) // (code, utf8_pos, utf8_len)
  Start(Array[SymbolWithLoc], type_~ : TypeString?)
  Token(Array[SymbolWithLoc], type_~ : TypeString?)
  Token1(SymbolWithLoc, type_~ : TypeString?, image~ : String)
  Type(Array[SymbolWithLoc], type_~ : TypeString)
  Derive(traits~ : TypeString, type_~ : TypeString)
  Position(type_~ : TypeString)
  Left(Array[PrecSymbol])
  Right(Array[PrecSymbol])
  Nonassoc(Array[PrecSymbol])
} derive(ToJson(style="legacy"))

///|
pub(all) struct SymbolWithLoc {
  symbol : Symbol
  loc : (Int32, Int32) // (utf8_pos, utf8_pos)
} derive(ToJson)

///|
pub(all) struct Rule {
  inline : Bool
  nonterminal : Symbol
  generic_params : Array[String]
  params : Array[(String, TypeExpr?)]
  type_ : TypeExpr?
  clauses : Array[(@list.List[ClauseWithoutAction], ClauseAction)]
} derive(ToJson)

///|
pub(all) struct ClauseWithoutAction {
  items : Array[ClauseItem]
  prec : PrecSymbol?
  loc : (Int32, Int32) // (utf8_pos, utf8_len)
} derive(ToJson)

///|
pub(all) struct ClauseAction {
  code : CodeWithSubst?
  loc : (Int32, Int32) // (utf8_pos, utf8_len)
} derive(ToJson)

///|
pub(all) struct CodeWithSubst {
  code : Code
  utf8_pos : Int32
  subst : Array[SubstItem]
} derive(ToJson)

///|
pub(all) struct ClauseItem {
  binder : Code?
  term : Term
} derive(ToJson)

///|
pub(all) enum Term {
  Symbol(Symbol, loc~ : (Int32, Int32))
  Image(String, loc~ : (Int32, Int32))
  RuleCall(Symbol, symbol_loc~ : (Int32, Int32), Array[Term])
} derive(ToJson(style="legacy"))

///|
pub(all) enum PrecSymbol {
  Symbol(Symbol)
  Image(String)
} derive(ToJson(style="legacy"))
