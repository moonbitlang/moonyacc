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
pub fn compile(
  parser_spec_str : String,
  mode~ : Mode = Default,
  filename~ : String,
  external_tokens~ : Bool = false,
  no_comments~ : Bool = false
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
  let terminals = []
  let nonterminals = []
  let terminal_by_name : Map[String, @grm.Terminal] = {}
  let terminal_by_image : Map[String, @grm.Terminal] = {}
  let nonterminal_by_name : Map[String, @grm.Nonterminal] = {}
  let production_meta_map : Map[Int, @codegen.ProductionMeta] = {}
  let terminal_meta_map : Map[Int, @codegen.TerminalMeta] = {}
  let nonterminal_meta_map : Map[Int, @codegen.NonTerminalMeta] = {}
  fn get_terminal_by_name(name : String) -> @grm.Terminal {
    match terminal_by_name.get(name) {
      Some(t) => t
      None => {
        let num = terminals.length()
        let term : @grm.Terminal = { name, num, prec: None, references: [] }
        terminals.push(term)
        terminal_by_name[name] = term
        term
      }
    }
  }

  fn get_nonterminal_by_name(name : String) -> @grm.Nonterminal {
    match nonterminal_by_name.get(name) {
      Some(nt) => nt
      None => {
        let num = nonterminals.length()
        let nonterm : @grm.Nonterminal = {
          name,
          num,
          productions: [],
          nullability: NonNullable, // transient
          references: [],
        }
        nonterminals.push(nonterm)
        nonterminal_by_name[name] = nonterm
        nonterm
      }
    }
  }

  for cmd in spec.commands {
    match cmd {
      Token(names, type_~, ..) =>
        for name in names {
          let t = get_terminal_by_name(name)
          terminal_meta_map[t.num] = { data_type: type_, image: None }
        }
      Token1(name, type_~, image~) => {
        let t = get_terminal_by_name(name)
        terminal_meta_map[t.num] = { data_type: type_, image: Some(image) }
        terminal_by_image[image] = t
      }
      _ => ()
    }
  }
  match mode {
    OnlyTokens => {
      let output = StringBuilder::new()
      @gen_mbt.codegen_tokens(
        terminals,
        fn(name) {
          terminal_meta_map.get_or_init(get_terminal_by_name(name).num, fn() {
            { data_type: None, image: None }
          })
        },
        output,
        no_comments~,
      )
      return output.to_string()
    }
    _ => ()
  }
  for rule in spec.rules {
    get_nonterminal_by_name(rule.nonterminal) |> ignore
  }
  fn get_symbol_by_name(name : String) -> @grm.Symbol {
    match terminal_by_name.get(name) {
      Some(t) => T(t)
      None => NT(nonterminal_by_name[name].unwrap())
    }
  }

  let productions = []
  let starts : Array[String] = []
  let mut curr_prec = 0
  let mut position_data_type = "Unit"
  let mut derive_map = @immut/hashmap.new()
  let prec_map = @sorted_map.new()
  for cmd in spec.commands {
    match cmd {
      Token(_) | Token1(_) => ()
      Start(names) => starts.push_iter(names.iter())
      Type(names, type_~) =>
        for name in names {
          let symbol = get_symbol_by_name(name)
          match symbol {
            T(_) => panic()
            NT(nt) => nonterminal_meta_map[nt.num] = { data_type: type_ }
          }
        }
      Position(type_~) => position_data_type = type_
      Left(names) | Right(names) | Nonassoc(names) => {
        let assoc : @grm.Associativity = match cmd {
          Left(_) => LeftAssoc
          Right(_) => RightAssoc
          Nonassoc(_) => NonAssoc
          _ => panic()
        }
        let prec = curr_prec
        curr_prec += 1
        for name in names {
          prec_map[name] = (prec, assoc)
        }
      }
      Derive(traits~, type_~) => {
        let type_ : @codegen.PubType = match type_ {
          "Token" => Token
          "TokenKind" => TokenKind
          "ParseError" => ParseError
          _ => panic()
        }
        derive_map = derive_map.add(type_, traits)
      }
    }
  }
  match mode {
    OnlyTokens => panic()
    Default => ()
    JsonCst(token_payload_rewrite~) => {
      position_data_type = "Int"
      fn add_derive(t : @codegen.PubType, y : String) {
        let x = derive_map[t].or("")
        if not(x.split(",").map(fn(s) { s.trim(" ") }).contains(y)) {
          let z = if x == "" { y } else { x + ", " + y }
          derive_map = derive_map.add(t, z)
        }
      }

      match token_payload_rewrite {
        None => ()
        Some(_) => add_derive(Token, "Show")
      }
    }
  }
  for name, prec in prec_map {
    match terminal_by_name.get(name) {
      Some(t) => t.prec = Some(prec)
      None => ()
    }
  }
  for rule in spec.rules {
    let lhs = get_nonterminal_by_name(rule.nonterminal)
    match rule.type_ {
      Some(type_) => nonterminal_meta_map[lhs.num] = { data_type: type_ }
      None =>
        match nonterminal_meta_map[lhs.num] {
          Some(_) => ()
          None => nonterminal_meta_map[lhs.num] = { data_type: "Unit" }
        }
    }
    for clause in rule.clauses {
      let rhs = clause.items.map(fn(item) {
        match item.symbol {
          Symbol(symbol) => get_symbol_by_name(symbol)
          Image(image) => T(terminal_by_image[image].unwrap())
        }
      })
      let num = productions.length()
      let production : @grm.Production = { num, lhs, rhs, prec: None }
      production.prec = match clause.prec {
        Some(prec) => {
          // TODO: error reporting
          let (level, _assoc) = prec_map[prec].unwrap()
          Some(level)
        }
        None => {
          // TODO: Reconsider this
          let mut last_prec = None
          for index, symbol in production.rhs {
            match symbol {
              T(t) => {
                t.references.push((production, index))
                last_prec = t.prec.map(fn { (level, _) => level })
              }
              NT(nt) => nt.references.push((production, index))
            }
          }
          last_prec
        }
      }
      productions.push(production)
      lhs.productions.push(production)
      fn item_ident_to_index(ident : @parser.ClauseItemIdent) -> Int {
        match ident {
          Dollar(index) => index
          Name(_) => panic()
        }
      }

      let bindings : Array[(@codegen.BindingSubject, @codegen.CodeFragment)] = []
      let visited = @sorted_set.new()
      fn add_binding(desc : @parser.SubstItemDesc) {
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

      let code = match mode {
        OnlyTokens => panic()
        Default =>
          match clause.action.code {
            None => "()"
            Some({ code, subst }) => {
              let new_code_buf = StringBuilder::new()
              let mut last_index = 0
              for item in subst {
                new_code_buf.write_substring(
                  code,
                  last_index,
                  item.start - last_index,
                )
                add_binding(item.desc)
                new_code_buf.write_string(
                  match item.desc {
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
                  },
                )
                last_index = item.end
              }
              if last_index < code.length() {
                new_code_buf.write_substring(
                  code,
                  last_index,
                  code.length() - last_index,
                )
              }
              new_code_buf.to_string()
            }
          }
        JsonCst(_) => {
          add_binding(StartPos)
          add_binding(EndPos)
          #|{
          #|  "type": "NONTERMINAL",
          $|  "name": "\{lhs.name}",
          $|  "prod_num": \{production.num},
          $|  "children": args_to_json(_args),
          $|  "start": _start_pos.to_json(),
          $|  "end": _end_pos.to_json(),
          #|}
        }
      }
      match mode {
        OnlyTokens => panic()
        JsonCst(_) => ()
        Default =>
          for index, item in clause.items {
            match item {
              { symbol: _, binder: Some(name) } =>
                bindings.push((Data(index), name))
              _ => ()
            }
          }
      }
      production_meta_map[num] = { bindings, body: code }
    }
  }

  // Populate nullability
  let transient_non_nullables = @sorted_set.from_iter(nonterminals.iter())
  for nt in nonterminals {
    if nt.productions.iter().all(fn(p) { p.rhs.is_empty() }) {
      nt.nullability = Null
      transient_non_nullables.remove(nt)
    }
  }
  fn is_nullable(symbol : @grm.Symbol) -> Bool {
    match symbol {
      T(_) => false
      NT({ nullability: Null | Nullable, .. }) => true
      NT({ nullability: NonNullable, .. }) => false
    }
  }

  while true {
    let mut changed = false
    for nt in transient_non_nullables {
      if nt.productions.iter().any(fn(p) { p.rhs.iter().all(is_nullable) }) {
        nt.nullability = Nullable
        transient_non_nullables.remove(nt)
        changed = true
      }
    }
    if not(changed) {
      break
    }
  }
  let starts = starts.map(fn(name) {
    let start_nt = get_nonterminal_by_name(name)
    let augmented_start_nt = get_nonterminal_by_name("\{name}_prime")
    nonterminal_meta_map[augmented_start_nt.num] = nonterminal_meta_map[start_nt.num].unwrap()
    let production : @grm.Production = {
      num: productions.length(),
      lhs: augmented_start_nt,
      rhs: [NT(start_nt)],
      prec: None,
    }
    start_nt.references.push((production, 0))
    productions.push(production)
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
      Default => spec.footer.or_default()
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
  let output = StringBuilder::new()
  @gen_mbt.codegen(
    grammar,
    automaton,
    meta,
    output,
    mode=match mode {
      OnlyTokens => panic()
      Default => Default
      JsonCst(token_payload_rewrite=None) => JsonCst(token_payload_rewrite=None)
      JsonCst(token_payload_rewrite=Some(NoPayload)) =>
        JsonCst(token_payload_rewrite=Some(NoPayload))
      JsonCst(token_payload_rewrite=Some(JsonPayload)) =>
        JsonCst(token_payload_rewrite=Some(JsonPayload))
    },
    external_tokens~,
    no_comments~,
  )
  output.to_string()
}
