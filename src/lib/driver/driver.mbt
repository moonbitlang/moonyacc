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
pub(all) enum Mode {
  Default
  JsonCst(token_payload_rewrite~ : TokenPayloadRewrite?)
  OnlyTokens
}

///|
pub(all) enum TokenPayloadRewrite {
  NoPayload
  JsonPayload
}

///|
pub(all) enum InputMode {
  Array
  Pull
}

///|
pub fn compile(
  parser_spec_str : String,
  mode~ : Mode = Default,
  input_mode~ : InputMode = Array,
  filename~ : String,
  external_tokens~ : Bool = false,
  no_comments~ : Bool = false,
  source_map_builder? : &@codegen.SourceMapBuilder,
  generator~ : &@codegen.CodeGenerator
) -> String {
  let lexer = @parser.new_lexer(parser_spec_str)
  fn token() {
    lexer.next_token?().unwrap()
  }

  let spec = try {
    @parser.spec!(token, 0)
  } catch {
    @parser.UnexpectedToken(token, loc, expected) => {
      let loc_str = loc_to_string(filename, parser_spec_str, loc)
      let expected_str = array_to_or_list(expected.map(Show::to_string)[:])
      println_to_stderr(
        "SyntaxError: Unexpected token \{token.kind()}, expected \{expected_str}.\n  at \{loc_str}",
      )
      exit(1)
    }
  }
  let spec = @elab.elaborate(spec)
  let terminals = []
  let nonterminals = []
  let terminal_by_name : Map[String, @grm.Terminal] = {}
  let nonterminal_by_name : Map[String, @grm.Nonterminal] = {}
  for token in spec.tokens {
    let terminal : @grm.Terminal = {
      name: token.name,
      num: token.num,
      prec: match token.prec {
        None => None
        Some((prec, NonAssoc)) => Some((prec, @grm.NonAssoc))
        Some((prec, LeftAssoc)) => Some((prec, @grm.LeftAssoc))
        Some((prec, RightAssoc)) => Some((prec, @grm.RightAssoc))
      },
    }
    terminal_by_name[token.name] = terminal
    terminals.push(terminal)
  }
  for rule in spec.rules {
    let nonterminal : @grm.Nonterminal = {
      name: rule.name,
      num: rule.num,
      productions: [],
    }
    nonterminal_by_name[rule.name] = nonterminal
    nonterminals.push(nonterminal)
  }
  fn get_terminal_by_name(name : String) -> @grm.Terminal {
    terminal_by_name.get(name).unwrap()
  }

  fn get_nonterminal_by_name(name : String) -> @grm.Nonterminal {
    nonterminal_by_name.get(name).unwrap()
  }

  let production_meta_map : Map[Int, @codegen.ProductionMeta] = {}
  let terminal_meta_map : Map[Int, @codegen.TerminalMeta] = {}
  let nonterminal_meta_map : Map[Int, @codegen.NonTerminalMeta] = {}
  match mode {
    OnlyTokens => {
      let output = StringBuilder::new()
      generator.codegen_tokens(
        terminals,
        fn(name) {
          terminal_meta_map.get_or_init(get_terminal_by_name(name).num, fn() {
            { data_type: None, image: None }
          })
        },
        output,
        no_comments~,
        derive_map=@immut/hashmap.new(),
      )
      return output.to_string()
    }
    _ => ()
  }
  let productions = []
  let starts : Array[String] = spec.start_rules.map(fn(rule) { rule.name })
  let mut position_data_type = spec.position_type.or(generator.void_type())
  let mut derive_map = @immut/hashmap.new()
  fn add_derive(t : @codegen.PubType, y : String) {
    let x = derive_map[t].or("")
    if not(x.split(",").map(fn(s) { s.trim(" ") }).contains(y)) {
      let z = if x == "" { y } else { x + ", " + y }
      derive_map = derive_map.add(t, z)
    }
  }

  for type_, traits in spec.derive_map {
    add_derive(
      match type_ {
        "Token" => Token
        "TokenKind" => TokenKind
        "ParseError" => ParseError
        _ => panic()
      },
      traits,
    )
  }
  match mode {
    OnlyTokens => panic()
    Default => ()
    JsonCst(token_payload_rewrite~) => {
      position_data_type = "Int"
      match token_payload_rewrite {
        None => ()
        Some(_) => add_derive(Token, "Show")
      }
    }
  }
  for token in spec.tokens {
    let terminal = get_terminal_by_name(token.name)
    terminal_meta_map[terminal.num] = {
      data_type: token.type_,
      image: token.image,
    }
  }
  for rule in spec.rules {
    let lhs = get_nonterminal_by_name(rule.name)
    match rule.type_ {
      Some(type_) => nonterminal_meta_map[lhs.num] = { data_type: type_ }
      None =>
        match nonterminal_meta_map[lhs.num] {
          Some(_) => ()
          None =>
            nonterminal_meta_map[lhs.num] = { data_type: generator.void_type() }
        }
    }
    for clause in rule.clauses {
      let production_num = productions.length()
      let production : @grm.Production = {
        num: production_num,
        lhs,
        rhs: clause.items.map(fn(item) {
          match item.desc {
            Token(token) => T(get_terminal_by_name(token.name))
            RuleCall(rule) => NT(get_nonterminal_by_name(rule.name))
          }
        }),
        prec: clause.prec,
      }
      productions.push(production)
      lhs.productions.push(production)
      fn item_ident_to_index(ident : @elab.ClauseItemIdent) -> Int {
        match ident {
          Dollar(index) => index
          Name(_) => panic()
        }
      }

      let bindings : Array[(@codegen.BindingSubject, @codegen.CodeFragment)] = []
      let visited = @sorted_set.new()
      fn add_binding(desc : @elab.Subst) {
        guard not(visited.contains(desc)) else { return }
        visited.add(desc)
        match desc {
          Dollar(index) => {
            let name = "_dollar\{index}"
            bindings.push((Data(index - 1), name))
          }
          StartPos =>
            if production.rhs.length() == 0 {
              bindings.push((LastPos, "_start_pos"))
            } else {
              bindings.push((StartPos(0), "_start_pos"))
            }
          Loc => {
            add_binding(StartPos)
            add_binding(EndPos)
          }
          EndPos =>
            if production.rhs.length() == 0 {
              bindings.push((LastPos, "_end_pos"))
            } else {
              bindings.push((EndPos(production.rhs.length() - 1), "_end_pos"))
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

      let body : Array[(String, (Int, Int)?)] = []
      match mode {
        OnlyTokens => panic()
        Default =>
          match clause.action {
            None => body.push((generator.void_action_code(), None))
            Some(chunks) =>
              for chunk in chunks {
                body.push(
                  (
                    match chunk.desc {
                      Code(code) => code
                      Subst(subst) => {
                        add_binding(subst)
                        match subst {
                          Dollar(index) => "_dollar\{index}"
                          StartPos => "_start_pos"
                          EndPos => "_end_pos"
                          Loc => "(_start_pos, _end_pos)"
                          StartPosOf(arg) =>
                            "_start_pos_of_item\{item_ident_to_index(arg)}"
                          EndPosOf(arg) =>
                            "_end_pos_of_item\{item_ident_to_index(arg)}"
                          LocOf(arg) => {
                            let index = item_ident_to_index(arg)
                            "(_start_pos_of_item\{index}, _end_pos_of_item\{index})"
                          }
                          SymbolStartPos => "_symbol_start_pos"
                          Sloc => "(_symbol_start_pos, _end_pos)"
                        }
                      }
                    },
                    Some((chunk.orig_utf8_pos, chunk.orig_utf8_len)),
                  ),
                )
              }
          }
        JsonCst(_) => {
          add_binding(StartPos)
          add_binding(EndPos)
          body.push(
            (
              #|{
              #|  "type": "NONTERMINAL",
              $|  "name": "\{lhs.name}",
              $|  "prod_num": \{production.num},
              $|  "children": args_to_json(_args),
              $|  "start": _start_pos.to_json(),
              $|  "end": _end_pos.to_json(),
              #|}
              ,
              None,
            ),
          )
        }
      }
      match mode {
        OnlyTokens => panic()
        JsonCst(_) => ()
        Default =>
          for index, item in clause.items {
            match item {
              { binder: Some(name), .. } => bindings.push((Data(index), name))
              _ => ()
            }
          }
      }
      production_meta_map[production_num] = { bindings, body }
    }
  }
  let starts = starts.map(fn(name) {
    let start_nt = get_nonterminal_by_name(name)
    let augmented_start_nt : @grm.Nonterminal = {
      num: nonterminals.length(),
      name: "\{name}_prime",
      productions: [],
    }
    nonterminal_by_name[augmented_start_nt.name] = augmented_start_nt
    nonterminals.push(augmented_start_nt)
    nonterminal_meta_map[augmented_start_nt.num] = nonterminal_meta_map[start_nt.num].unwrap()
    let production : @grm.Production = {
      num: productions.length(),
      lhs: augmented_start_nt,
      rhs: [NT(start_nt)],
      prec: None,
    }
    productions.push(production)
    augmented_start_nt.productions.push(production)
    production
  })
  let grammar : @grm.Grammar = { terminals, nonterminals, productions, starts }
  let automaton = @lr1.Automaton::build(grammar)
  let errors = @lr1.resolve_conflicts(automaton.conflicts)
  for error in errors {
    // TODO: detailed error message
    match error {
      Reduce_conflict_resolved_by_presentation_order(_) =>
        println_to_stderr("Reduce conflict resolved by presentation order")
      Shift_reduce_conflict_resolved_without_precedence(_) =>
        println_to_stderr("Shift-reduce conflict resolved without precedence")
      Shift_reduce_conflict_not_resolved_because_of_non_assoc(_) =>
        println_to_stderr(
          "Shift-reduce conflict not resolved because of non-associativity",
        )
    }
  }
  let meta : @codegen.MetaProvider = {
    header: match mode {
      OnlyTokens => panic()
      Default => spec.header.or_default()
      JsonCst(_) => ""
    },
    footer: match mode {
      OnlyTokens => panic()
      Default => spec.trailer.or_default()
      JsonCst(_) => ""
    },
    position_data_type,
    terminal_meta: fn(name) {
      let meta = terminal_meta_map.get_or_init(get_terminal_by_name(name).num, fn(

      ) {
        { data_type: None, image: None }
      })
      match mode {
        OnlyTokens => panic()
        Default | JsonCst(token_payload_rewrite=None) => meta
        JsonCst(token_payload_rewrite=Some(NoPayload)) =>
          { ..meta, data_type: None }
        JsonCst(token_payload_rewrite=Some(JsonPayload)) =>
          {
            ..meta,
            data_type: match meta.data_type {
              Some(_) => Some("Json")
              None => None
            },
          }
      }
    },
    nonterminal_meta: fn(name) {
      match mode {
        OnlyTokens => panic()
        Default =>
          nonterminal_meta_map[get_nonterminal_by_name(name).num].unwrap()
        JsonCst(_) => { data_type: "Json" }
      }
    },
    production_meta: fn(num) { production_meta_map[num].unwrap() },
    derive_map,
  }
  let output_buffer = StringBuilder::new()
  let output = @logger_with_cursor.new(output_buffer)
  generator.codegen(
    grammar,
    automaton,
    meta,
    output,
    source_map_builder~,
    grammar_filename=@_driver_util.path_basename(filename),
    mode=match mode {
      OnlyTokens => panic()
      Default => Default
      JsonCst(token_payload_rewrite=None) => JsonCst(token_payload_rewrite=None)
      JsonCst(token_payload_rewrite=Some(NoPayload)) =>
        JsonCst(token_payload_rewrite=Some(NoPayload))
      JsonCst(token_payload_rewrite=Some(JsonPayload)) =>
        JsonCst(token_payload_rewrite=Some(JsonPayload))
    },
    input_mode=match input_mode {
      Array => Array
      Pull => Pull
    },
    external_tokens~,
    no_comments~,
  )
  output_buffer.to_string()
}
