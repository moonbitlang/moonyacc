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
          num: token_by_name.size(),
          name,
          type_: None,
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
      Token(names, type_~, ..) =>
        for name in names {
          let token = get_token_by_name(name)
          token.type_ = type_
        }
      Token1(name, type_~, image~) => {
        let token = get_token_by_name(name)
        token.type_ = type_
        token.image = Some(image)
        token_by_image[image] = token
      }
      _ => ()
    }
  }

  // Prepare rules
  for ast_rule in ast_spec.rules {
    let rule : Rule = {
      num: rule_by_name.size(),
      name: ast_rule.nonterminal,
      type_: ast_rule.type_,
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
                Some(rule) => rule.type_ = Some(type_)
              }
            Some(token) => token.type_ = Some(type_)
          }
        }
      _ => ()
    }
  }
  let mut next_clause_num = 0
  for ast_rule in ast_spec.rules {
    let rule = rule_by_name[ast_rule.nonterminal].unwrap()
    for ast_clause in ast_rule.clauses {
      let items = ast_clause.items.map(fn(ast_item) {
        Item::{
          binder: ast_item.binder,
          desc: match ast_item.symbol {
            Symbol(symbol) =>
              match token_by_name[symbol] {
                None => RuleCall(rule_by_name[symbol].unwrap())
                Some(token) => Token(token)
              }
            Image(image) => Token(token_by_image[image].unwrap())
          },
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
            match item.desc {
              Token(token) => {
                last_prec = match token.prec {
                  None => None
                  Some((prec, _assoc)) => Some(prec)
                }
                break
              }
              RuleCall(_) => ()
            }
          }
          last_prec
        }
      }
      let clause_num = next_clause_num
      next_clause_num += 1
      let clause = Clause::{
        num: clause_num,
        items,
        prec,
        action: match json_cst {
          No => map_action(ast_clause.action)
          Yes(_) => make_jsoncst_action(rule.name, clause_num)
        },
      }
      rule.clauses.push(clause)
    }
  }
  let start_rules : Array[Rule] = []
  let mut position_type : Code? = None
  let derive_map = @array_multimap.new()
  for ast_decl in ast_spec.decls {
    match ast_decl {
      Start(symbols) =>
        for symbol in symbols {
          start_rules.push(rule_by_name[symbol].unwrap())
        }
      Position(type_~) => position_type = Some(type_)
      Derive(traits~, type_~) =>
        for trait_ in traits.split(",").iter().map(String::trim_space) {
          derive_map.add(type_, trait_)
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
      position_type = Some("Int")
      for rule in rules {
        rule.type_ = Some("Json")
      }
      match rewrite {
        None => ()
        Some(_) => derive_map.add("Token", "Show")
      }
    }
  }
  match json_cst {
    No | Yes(None) => ()
    Yes(Some(NoPayload)) =>
      for token in tokens {
        token.type_ = None
      }
    Yes(Some(JsonPayload)) =>
      for token in tokens {
        token.type_ = Some("Json")
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
fn map_action(ast_action : @parser.ClauseAction) -> Array[CodeChunk]? {
  match ast_action.code {
    None => None
    Some(code) => {
      let chunks = []
      let mut last_index = 0
      for item in code.subst {
        if item.start > last_index {
          let len = item.start - last_index
          chunks.push(CodeChunk::{
            desc: Code(code.code.substring(start=last_index, end=item.start)),
            loc: Some((code.utf8_pos + last_index, len)),
          })
        }
        chunks.push(CodeChunk::{
          desc: Subst(map_subst(item.desc)),
          loc: Some((code.utf8_pos + item.start, item.end - item.start)),
        })
        last_index = item.end
      }
      if last_index < code.code.length() {
        let len = code.code.length() - last_index
        chunks.push(CodeChunk::{
          desc: Code(
            code.code.substring(start=last_index, end=code.code.length()),
          ),
          loc: Some((code.utf8_pos + last_index, len)),
        })
      }
      Some(chunks)
    }
  }
}

///|
fn make_jsoncst_action(
  nonterminal_name : String,
  clause_num : Int
) -> Array[CodeChunk]? {
  Some([
    {
      loc: None,
      desc: Code(
        #|{
        #|  "type": "NONTERMINAL",
        $|  "name": "\{nonterminal_name}",
        $|  "prod_num": \{clause_num},
        $|  "children": args_to_json(_args),
        ,
      ),
    },
    { loc: None, desc: Code("\n  \"start\": ") },
    { loc: None, desc: Subst(StartPos) },
    { loc: None, desc: Code(".to_json(),\n  \"end\": ") },
    { loc: None, desc: Subst(EndPos) },
    { loc: None, desc: Code(".to_json(),\n}\n") },
  ])
}

///|
fn map_subst(ast_subst : @parser.SubstItemDesc) -> Subst {
  fn map_ident(ast_item_ident : @parser.ClauseItemIdent) -> ClauseItemIdent {
    match ast_item_ident {
      Dollar(x) => Dollar(x)
      Name(name) => Name(name)
    }
  }

  match ast_subst {
    SymbolStartPos => SymbolStartPos
    LocOf(x) => LocOf(map_ident(x))
    EndPosOf(x) => EndPosOf(map_ident(x))
    StartPosOf(x) => StartPosOf(map_ident(x))
    Loc => Loc
    EndPos => EndPos
    StartPos => StartPos
    Dollar(i) => Dollar(i)
    Sloc => Sloc
  }
}
