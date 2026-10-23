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
pub type Code = String

///|
pub(all) enum TypeExpr {
  Constr(pkg~ : String?, String, Array[TypeExpr])
  Param(String)
  Option(TypeExpr)
  Tuple(Array[TypeExpr])
  Arrow(Array[TypeExpr], TypeExpr)
} derive(Eq, Compare)

///|
pub impl Show for TypeExpr with fn output(self, logger) {
  Logger::write_string(
    logger,
    match self {
      Constr(pkg~, name, args) => {
        let primary = match pkg {
          None => name
          Some(pkg) => "@\{pkg}.\{name}"
        }
        if args.length() == 0 {
          primary
        } else {
          primary + "[" + args.iter().map(Show::to_string).join(", ") + "]"
        }
      }
      Param(_) => panic()
      Option(type_) =>
        if type_ is Arrow(_, _) {
          "(" + Show::to_string(type_) + ")?"
        } else {
          Show::to_string(type_) + "?"
        }
      Tuple(types) => "(" + types.iter().map(Show::to_string).join(", ") + ")"
      Arrow(args, ret) =>
        "(" +
        args.iter().map(Show::to_string).join(", ") +
        ") -> " +
        Show::to_string(ret)
    },
  )
}

///|
pub(all) struct ParserSpec {
  header : @immut/vector.Vector[CodeChunk]
  trailer : @immut/vector.Vector[CodeChunk]
  tokens : Array[Token]
  rules : Map[Symbol, Rule]
  start_rules : Array[Symbol]
  position_type : TypeExpr
  derive_map : @array_multimap.T[String, String]
}

///|
pub(all) struct Token {
  name : String
  mut prec : (Int32, Associativity)?
  mut type_ : TypeExpr
  mut image : String?
}

///|
pub type Symbol = String

///|
pub(all) struct Rule {
  name : Symbol
  inline : Bool
  generic_params : Set[String]
  params : Array[(String, TypeExpr)]
  mut type_ : TypeExpr
  clauses : Array[Clause]
}

///|
pub(all) struct Clause {
  items : Array[Item]
  prec : Int32?
  action : Action
}

// (code, (UTF-16 offset, UTF-16 length)?)

///|
pub type CodeChunk = (String, (Int32, Int32)?)

///|
/// Resolved names stay stable when inlining changes their binding subjects.
pub(all) enum ActionReference {
  Binding(String)
  Location(String, String)
}

///|
/// User text and substitution origins use UTF-16 code-unit offsets.
pub(all) enum ActionPiece {
  Text(String, offset~ : Int32)
  Reference(ActionReference, offset~ : Int32, length~ : Int32)
}

///|
/// Generated actions retain their meaning until the backend chooses syntax.
pub(all) enum ActionBody {
  Default
  User(Array[ActionPiece])
  JsonCst(name~ : String, rule_index~ : Int32, clause_index~ : Int32)
}

///|
pub(all) struct Action {
  stamp : @stamp.Stamp
  // Number of physical RHS items after expansion.
  arity : Int32
  type_ : TypeExpr
  // The original production's extent, expressed in the current RHS layout.
  span : (PositionExpr, PositionExpr)
  sub_actions : Array[SubAction]
  bindings : Array[(BindingSubject, Code)]
  body : ActionBody
  original_clause_info : OriginalClauseInfo
}

///|
pub(all) enum PositionExpr {
  BeforeRhs
  StartOf(Int32)
  EndOf(Int32)
  // Fall back to the last span's end, or BeforeRhs if there are no spans.
  FirstNonEmpty(Array[(PositionExpr, PositionExpr)])
} derive(Eq)

///|
pub(all) struct OriginalClauseInfo {
  file : String
  line : Int32
  column : Int32
  code : String
}

///|
pub(all) struct SubAction {
  start : Int32
  end : Int32
  action : Action
}

///|
pub(all) enum BindingSubject {
  Data(Int32, type_~ : TypeExpr)
  Position(PositionExpr)
  SubAction(index~ : Int32, type_~ : TypeExpr)
}

///|
pub(all) struct Item {
  binder : Code?
  term : Term
}

///|
pub(all) enum Term {
  Token(Token)
  Param(String, TypeExpr)
  RuleCall(Symbol, Array[Term], TypeExpr)
}

///|
pub fn Item::type_(self : Item) -> TypeExpr {
  match self.term {
    Token(token) => token.type_
    Param(_, type_) => type_
    RuleCall(_, _, type_) => type_
  }
}
