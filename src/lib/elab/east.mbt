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
}

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
}

///|
pub(all) struct Token {
  name : String
  mut prec : (Int, Associativity)?
  mut type_ : Code?
  mut image : String?
}

///|
pub(all) typealias Symbol = String

///|
pub(all) struct Rule {
  name : Symbol
  inline : Bool
  mut type_ : Code?
  clauses : Array[Clause]
}

///|
pub(all) struct Clause {
  items : Array[Item]
  prec : Int?
  action : Action
}

///|
pub(all) struct Action {
  stamp : @stamp.Stamp
  arity : Int
  type_ : Code?
  sub_actions : Array[SubAction]
  bindings : Array[(BindingSubject, Code)]
  body : Array[(String, (Int, Int)?)] // array of (code, (utf8_pos, utf8_len)?)
}

///|
pub(all) struct SubAction {
  start : Int
  end : Int
  action : Action
}

///|
pub(all) enum BindingSubject {
  Data(Int, type_~ : Code?)
  LastPos
  StartPos(Int)
  EndPos(Int)
  SymbolStartPos
  SubAction(start~ : Int, type_~ : Code?)
}

///|
pub(all) struct Item {
  binder : Code?
  desc : ItemDesc
}

///|
pub(all) enum ItemDesc {
  Token(Token)
  RuleCall(Rule)
}

///|
pub fn Item::type_(self : Item) -> Code? {
  match self.desc {
    Token(token) => token.type_
    RuleCall(rule) => rule.type_
  }
}
