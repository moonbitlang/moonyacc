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
pub(all) enum JsonCst {
  No
  Yes(TokenPayloadRewrite?)
}

///|
pub(all) enum TokenPayloadRewrite {
  NoPayload
  JsonPayload
}

///|
pub fn elaborate(
  ast_spec : @parser.ParserSpec,
  json_cst~ : JsonCst
) -> ParserSpec {
  let mut header = ast_spec.header
  let mut trailer = ast_spec.trailer
  let token_by_name : Map[String, Token] = {}
  let rule_by_name : Map[String, Rule] = {}
  let token_by_image : Map[String, Token] = {}
  let tokens : Array[Token] = []
  let rules : Array[Rule] = []
  fn get_token_by_name(name : String) -> Token {
    match token_by_name.get(name) {
      Some(t) => t
      None => {
        let token : Token = {
          name,
          type_: Constr(pkg=None, "Unit", []),
          image: None,
          prec: None,
        }
        token_by_name[name] = token
        tokens.push(token)
        token
      }
    }
  }

  // Prepare tokens
  for ast_decl in ast_spec.decls {
    match ast_decl {
      Token(names, type_~) =>
        for name in names {
          let token = get_token_by_name(name)
          token.type_ = type_
            .map(elaborate_type_expr)
            .or(Constr(pkg=None, "Unit", []))
        }
      Token1(name, type_~, image~) => {
        let token = get_token_by_name(name)
        token.type_ = type_
          .map(elaborate_type_expr)
          .or(Constr(pkg=None, "Unit", []))
        token.image = Some(image)
        token_by_image[image] = token
      }
      _ => ()
    }
  }

  // Prepare rules
  for ast_rule in ast_spec.rules {
    let rule : Rule = {
      inline: ast_rule.inline,
      name: ast_rule.nonterminal,
      generic_params: ast_rule.generic_params,
      params: ast_rule.params.map(fn(param) {
        (
          param.0,
          param.1.map(elaborate_type_expr).or(Constr(pkg=None, "Unit", [])),
        )
      }),
      type_: ast_rule.type_
      .map(elaborate_type_expr)
      .or(Constr(pkg=None, "Unit", [])),
      clauses: [],
    }
    rules.push(rule)
    rule_by_name[rule.name] = rule
  }
  let mut curr_prec = 0
  let prec_map = @sorted_map.new()
  for ast_decl in ast_spec.decls {
    match ast_decl {
      Left(idents) | Right(idents) | Nonassoc(idents) => {
        let assoc : Associativity = match ast_decl {
          Left(_) => LeftAssoc
          Right(_) => RightAssoc
          Nonassoc(_) => NonAssoc
          _ => panic()
        }
        let prec = curr_prec
        curr_prec += 1
        for ident in idents {
          prec_map[ident] = (prec, assoc)
          match token_by_name[ident] {
            None => ()
            Some(token) => token.prec = Some((prec, assoc))
          }
        }
      }
      Type(idents, type_~) =>
        for ident in idents {
          match token_by_name[ident] {
            None =>
              match rule_by_name[ident] {
                None => panic()
                Some(rule) => rule.type_ = elaborate_type_expr(type_)
              }
            Some(token) => token.type_ = elaborate_type_expr(type_)
          }
        }
      _ => ()
    }
  }
  fn map_term(
    ast_term : @parser.Term,
    rule_param_map : Map[String, TypeExpr]
  ) -> Term {
    match ast_term {
      Symbol(symbol) =>
        match token_by_name[symbol] {
          None =>
            match rule_param_map[symbol] {
              Some(type_) => Param(symbol, type_)
              None => RuleCall(rule_by_name[symbol].unwrap(), [])
            }
          Some(token) => Token(token)
        }
      Image(image) => Token(token_by_image[image].unwrap())
      RuleCall(symbol, args) =>
        RuleCall(
          rule_by_name[symbol].unwrap(),
          args.map(fn(arg) { map_term(arg, rule_param_map) }),
        )
    }
  }

  for rule_index, ast_rule in ast_spec.rules {
    let rule = rule_by_name[ast_rule.nonterminal].unwrap()
    rule.type_ = match json_cst {
      No => rule.type_
      Yes(_) => Constr(pkg=None, "Json", [])
    }
    let rule_param_map : Map[String, TypeExpr] = Map::from_array(rule.params)
    for clause_index, ast_clause in ast_rule.clauses {
      let items = ast_clause.items.map(fn(ast_item) {
        Item::{
          binder: ast_item.binder,
          term: map_term(ast_item.term, rule_param_map),
        }
      })
      let prec = match ast_clause.prec {
        Some(prec) => {
          // TODO: error reporting
          let (prec, _assoc) = prec_map[prec].unwrap()
          Some(prec)
        }
        None => {
          /// FROM ocamlyacc's manual
          // > Tokens and rules have precedences.
          // > By default, the precedence of a rule is the precedence of its rightmost terminal.
          // I don't what "rightmost terminal" means, but I guess it means the last terminal in the rule.
          // So, I'll use the precedence of the last terminal in the rule.
          let mut last_prec = None
          for item in items.rev_iter() {
            match item.term {
              Token(token) => {
                last_prec = match token.prec {
                  None => None
                  Some((prec, _assoc)) => Some(prec)
                }
                break
              }
              Param(_) | RuleCall(_) => ()
            }
          }
          last_prec
        }
      }
      let clause = Clause::{
        items,
        prec,
        action: elaborate_action(
          items,
          ast_clause.action,
          rule_index~,
          clause_index~,
          nonterminal_name=rule.name,
          type_=rule.type_,
          json_cst~,
        ),
      }
      rule.clauses.push(clause)
    }
  }
  let start_rules : Array[Rule] = []
  let mut position_type : TypeExpr = Constr(pkg=None, "Unit", [])
  let derive_map = @array_multimap.new()
  for ast_decl in ast_spec.decls {
    match ast_decl {
      Start(symbols) =>
        for symbol in symbols {
          start_rules.push(rule_by_name[symbol].unwrap())
        }
      Position(type_~) => position_type = elaborate_type_expr(type_)
      Derive(traits~, type_~) =>
        for trait_ in traits {
          derive_map.add(type_, elaborate_type_expr(trait_))
        }
      _ => ()
    }
  }

  // TODO: Make this non target specific
  // JsonCst
  match json_cst {
    No => ()
    Yes(rewrite) => {
      header = None
      trailer = None
      position_type = Constr(pkg=None, "Int", [])
      match rewrite {
        None => ()
        Some(_) => derive_map.add("Token", Constr(pkg=None, "Show", []))
      }
    }
  }
  match json_cst {
    No | Yes(None) => ()
    Yes(Some(NoPayload)) =>
      for token in tokens {
        token.type_ = Constr(pkg=None, "Unit", [])
      }
    Yes(Some(JsonPayload)) =>
      for token in tokens {
        token.type_ = Constr(pkg=None, "Json", [])
      }
  }
  ParserSpec::{
    header,
    trailer,
    tokens,
    rules,
    start_rules,
    position_type,
    derive_map,
  }
}

///|
fn elaborate_action(
  items : Array[Item],
  ast_action : @parser.ClauseAction,
  rule_index~ : Int,
  clause_index~ : Int,
  nonterminal_name~ : String,
  type_~ : TypeExpr,
  json_cst~ : JsonCst
) -> Action {
  let arity = items.length()
  let name_to_index : Map[String, Int] = {}
  for index, item in items {
    match item.binder {
      None => ()
      Some(name) => name_to_index[name] = index
    }
  }
  fn item_ident_to_index(ident : @parser.ClauseItemIdent) -> Int {
    match ident {
      Dollar(index) => index
      Name(name) => name_to_index[name].unwrap()
    }
  }

  let bindings : Array[(BindingSubject, Code)] = []
  let visited = @sorted_set.new()
  fn add_binding(desc : @parser.SubstItemDesc) {
    guard not(visited.contains(desc)) else { return }
    visited.add(desc)
    match desc {
      Dollar(index) => {
        let name = "_dollar\{index}"
        bindings.push((Data(index - 1, type_=items[index - 1].type_()), name))
      }
      StartPos =>
        if arity == 0 {
          bindings.push((LastPos, "_start_pos"))
        } else {
          bindings.push((StartPos(0), "_start_pos"))
        }
      Loc => {
        add_binding(StartPos)
        add_binding(EndPos)
      }
      EndPos =>
        if arity == 0 {
          bindings.push((LastPos, "_end_pos"))
        } else {
          bindings.push((EndPos(arity - 1), "_end_pos"))
        }
      StartPosOf(arg) => {
        let index = item_ident_to_index(arg)
        bindings.push((StartPos(index), "_start_pos_of_item\{index}"))
      }
      EndPosOf(arg) => {
        let index = item_ident_to_index(arg)
        bindings.push((EndPos(index), "_end_pos_of_item\{index}"))
      }
      LocOf(arg) => {
        add_binding(StartPosOf(arg))
        add_binding(EndPosOf(arg))
      }
      SymbolStartPos => bindings.push((SymbolStartPos, "_symbol_start_pos"))
      Sloc => {
        add_binding(SymbolStartPos)
        add_binding(EndPos)
      }
    }
  }

  let body : Array[(Code, (Int, Int)?)] = []
  match json_cst {
    No => {
      for index, item in items {
        match item {
          { binder: Some(name), .. } =>
            bindings.push((Data(index, type_=item.type_()), name))
          _ => ()
        }
      }
      match ast_action.code {
        None => body.push(("()", None))
        Some(code) => {
          let mut last_index = 0
          for item in code.subst {
            if item.start > last_index {
              let len = item.start - last_index
              body.push(
                (
                  code.code.substring(start=last_index, end=item.start),
                  Some((code.utf8_pos + last_index, len)),
                ),
              )
            }
            add_binding(item.desc)
            body.push(
              (
                match item.desc {
                  Dollar(index) => "_dollar\{index}"
                  StartPos => "_start_pos"
                  EndPos => "_end_pos"
                  Loc => "(_start_pos, _end_pos)"
                  StartPosOf(arg) =>
                    "_start_pos_of_item\{item_ident_to_index(arg)}"
                  EndPosOf(arg) => "_end_pos_of_item\{item_ident_to_index(arg)}"
                  LocOf(arg) => {
                    let index = item_ident_to_index(arg)
                    "(_start_pos_of_item\{index}, _end_pos_of_item\{index})"
                  }
                  SymbolStartPos => "_symbol_start_pos"
                  Sloc => "(_symbol_start_pos, _end_pos)"
                },
                Some((code.utf8_pos + item.start, item.end - item.start)),
              ),
            )
            last_index = item.end
          }
          if last_index < code.code.length() {
            let len = code.code.length() - last_index
            body.push(
              (
                code.code.substring(start=last_index, end=code.code.length()),
                Some((code.utf8_pos + last_index, len)),
              ),
            )
          }
        }
      }
    }
    Yes(_) => {
      add_binding(StartPos)
      add_binding(EndPos)
      body.push(
        (
          #|{
          #|  "type": "NONTERMINAL",
          $|  "name": "\{nonterminal_name}",
          $|  "rule_index": \{rule_index},
          $|  "clause_index": \{clause_index},
          $|  "children": args_to_json(_args),
          $|  "start": _start_pos.to_json(),
          $|  "end": _end_pos.to_json(),
          $|}
          $|
          ,
          None,
        ),
      )
    }
  }
  Action::{ stamp: @stamp.new(), arity, type_, sub_actions: [], bindings, body }
}

///|
fn elaborate_type_expr(ast_type_expr : @parser.TypeExpr) -> TypeExpr {
  match ast_type_expr {
    Constr(pkg~, name, args) =>
      Constr(pkg~, name, args.map(elaborate_type_expr))
    Option(inner) => Option(elaborate_type_expr(inner))
    Tuple(args) => Tuple(args.map(elaborate_type_expr))
    Arrow(args, ret) =>
      Arrow(args.map(elaborate_type_expr), elaborate_type_expr(ret))
  }
}
