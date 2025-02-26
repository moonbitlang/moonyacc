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
  inline : Bool
  mut type_ : Code?
  clauses : Array[Clause]
} derive(ToJson)

///|
pub(all) struct Clause {
  num : Int
  items : Array[Item]
  prec : Int?
  action : Action
} derive(ToJson)

///|
pub(all) struct Action {
  num : Int
  arity : Int
  type_ : Code?
  sub_actions : Array[SubAction]
  bindings : Array[(BindingSubject, Code)]
  body : Array[(String, (Int, Int)?)] // array of (code, (utf8_pos, utf8_len)?)
} derive(ToJson)

///|
pub(all) struct SubAction {
  start : Int
  end : Int
  action : Action
} derive(ToJson)

///|
pub(all) enum BindingSubject {
  Data(Int, type_~ : Code?)
  LastPos
  StartPos(Int)
  EndPos(Int)
  SymbolStartPos
  SubAction(start~ : Int, type_~ : Code?)
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
pub fn Item::type_(self : Item) -> Code? {
  match self.desc {
    Token(token) => token.type_
    RuleCall(rule) => rule.type_
  }
}
