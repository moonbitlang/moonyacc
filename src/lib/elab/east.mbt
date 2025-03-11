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
pub(all) enum TypeExpr {
  Constr(pkg~ : String?, String, Array[TypeExpr])
  Option(TypeExpr)
  Tuple(Array[TypeExpr])
  Arrow(Array[TypeExpr], TypeExpr)
} derive(Eq, Compare)

///|
pub impl Show for TypeExpr with output(self, logger) {
  logger.write_string(
    match self {
      Constr(pkg~, name, args) => {
        let primary = match pkg {
          None => name
          Some(pkg) => "@\{pkg}.\{name}"
        }
        if args.length() == 0 {
          primary
        } else {
          primary +
          "[" +
          args.iter().map(TypeExpr::to_string).join(", ") +
          "]"
        }
      }
      Option(type_) =>
        if type_ is Arrow(_, _) {
          "(" + TypeExpr::to_string(type_) + ")?"
        } else {
          TypeExpr::to_string(type_) + "?"
        }
      Tuple(types) =>
        "(" + types.iter().map(TypeExpr::to_string).join(", ") + ")"
      Arrow(args, ret) =>
        "(" +
        args.iter().map(TypeExpr::to_string).join(", ") +
        ") -> " +
        TypeExpr::to_string(ret)
    },
  )
}

///|
pub(all) struct ParserSpec {
  header : Code?
  trailer : Code?
  tokens : Array[Token]
  rules : Array[Rule]
  start_rules : Array[Rule]
  position_type : TypeExpr?
  derive_map : @array_multimap.T[String, TypeExpr]
}

///|
pub(all) struct Token {
  name : String
  mut prec : (Int, Associativity)?
  mut type_ : TypeExpr?
  mut image : String?
}

///|
pub(all) typealias Symbol = String

///|
pub(all) struct Rule {
  name : Symbol
  inline : Bool
  mut type_ : TypeExpr?
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
  type_ : TypeExpr?
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
  Data(Int, type_~ : TypeExpr?)
  LastPos
  StartPos(Int)
  EndPos(Int)
  SymbolStartPos
  SubAction(start~ : Int, type_~ : TypeExpr?)
}

///|
pub(all) struct Item {
  binder : Code?
  term : Term
}

///|
pub(all) enum Term {
  Token(Token)
  RuleCall(Rule)
}

///|
pub fn Item::type_(self : Item) -> TypeExpr? {
  match self.term {
    Token(token) => token.type_
    RuleCall(rule) => rule.type_
  }
}
