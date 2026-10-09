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
priv enum CodegenSymbol {
  T(@grm.Terminal)
  NT(@grm.Nonterminal)
  EOI
} derive(Eq, Compare)

///|
fn CodegenSymbol::eoi() -> CodegenSymbol {
  EOI
}

///|
fn CodegenSymbol::terminal(term : @grm.Terminal) -> CodegenSymbol {
  T(term)
}

///|
fn CodegenSymbol::nonterminal(nont : @grm.Nonterminal) -> CodegenSymbol {
  NT(nont)
}

///|
fn CodegenSymbol::encode(self : CodegenSymbol, grammar : @grm.Grammar) -> Int {
  match self {
    EOI => 0
    T(t) => 1 + t.num
    NT(nt) => 1 + grammar.terminals.length() + nt.num
  }
}

///|
priv enum CodegenDecision {
  Error
  Accept
  Shift(@lr1.LR1State)
  Reduce(@grm.Production)
  ReduceNoLookahead(@grm.Production)
} derive(Eq, Compare)

///|
fn codegen_tokens(
  terminals : Array[@grm.Terminal],
  terminal_meta : (String) -> @codegen.TerminalMeta,
  output : &Logger,
  no_comments? : Bool = false,
  derive_map? : @array_multimap.T[String, String] = @array_multimap.new(),
) -> Unit {
  ignore(no_comments)
  @mbt_ast.emit(
    @mbt_common.token_items(terminals, terminal_meta, derive_map~),
    @logger_with_cursor.new(output),
  )
}

///|
fn decompressor() -> @mbt_ast.Item {
  let int = @mbt_common.named_type("Int", [])
  let array = @mbt_common.named_type("ReadOnlyArray", [int])
  let repeated : @mbt_ast.Block = {
    statements: [
      Let(
        Bind("count"),
        None,
        Binary(Subtract, Unary(Negate, Ident("val")), Int(1)),
      ),
      ForEach(
        [Any],
        Range(Int(0), Ident("count"), false),
        @mbt_common.value_block(
          MethodCall(Ident("output"), "push", [Positional(Ident("last"))]),
        ),
      ),
    ],
    result: None,
  }
  let literal : @mbt_ast.Block = {
    statements: [
      Eval(MethodCall(Ident("output"), "push", [Positional(Ident("val"))])),
      Assign(Ident("last"), Ident("val")),
    ],
    result: None,
  }
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_decompress",
        [Positional("input", Some(array))],
        {
          statements: [
            Let(Bind("output"), None, Array([])),
            LetMut("last", None, Int(0)),
            ForEach(
              [Bind("val")],
              Ident("input"),
              @mbt_common.value_block(
                If(Binary(Less, Ident("val"), Int(0)), repeated, Some(literal)),
              ),
            ),
          ],
          result: Some(
            @mbt_common.call("ReadOnlyArray::from_array", [Ident("output")]),
          ),
        },
        result=array,
      ),
    ),
  )
}

///|
fn decoder(
  symbol_count : Int,
  state_count : Int,
  production_count : Int,
) -> @mbt_ast.Item {
  let reduce_base = 2 + state_count
  let default_base = reduce_base + production_count
  fn reduction(name : String, base : Int) -> @mbt_ast.Block {
    let index : @mbt_ast.Expr = Binary(Subtract, Ident("encoded"), Int(base))
    @mbt_common.value_block(
      @mbt_common.call(name, [
        Index(Ident("yy_prod_len_table"), index),
        Index(Ident("yy_prod_lhs_table"), index),
        Index(Ident("yy_prod_act_table"), index),
      ]),
    )
  }
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_state",
        [
          Positional("state", Some(@mbt_common.named_type("YYState", []))),
          Positional("symbol", Some(@mbt_common.named_type("YYSymbol", []))),
        ],
        {
          statements: [
            Let(
              Bind("encoded"),
              None,
              Index(
                Ident("yy_state_table"),
                Binary(
                  Add,
                  Binary(Multiply, Ident("state"), Int(symbol_count)),
                  Ident("symbol"),
                ),
              ),
            ),
          ],
          result: Some(
            Match(Ident("encoded"), [
              (Int(0), @mbt_common.value_block(Ident("Error"))),
              (Int(1), @mbt_common.value_block(Ident("Accept"))),
              (
                Range(2, Some(reduce_base - 1), true),
                @mbt_common.value_block(
                  @mbt_common.call("Shift", [
                    Binary(Subtract, Ident("encoded"), Int(2)),
                  ]),
                ),
              ),
              (
                Range(reduce_base, Some(default_base - 1), true),
                reduction("Reduce", reduce_base),
              ),
              (
                Range(default_base, None, false),
                reduction("ReduceNoLookahead", default_base),
              ),
              (Any, @mbt_common.value_block(@mbt_common.call("panic", []))),
            ]),
          ),
        },
        result=@mbt_common.named_type("YYDecision", []),
      ),
    ),
  )
}

///|
fn codegen(
  grammar : @grm.Grammar,
  automaton : @lr1.Automaton,
  meta : @codegen.MetaProvider,
  output : @logger_with_cursor.LoggerWithCursor,
  source_map_builder? : &@codegen.SourceMapBuilder,
  grammar_filename~ : String,
  external_tokens? : Bool = false,
  no_comments? : Bool = false,
  mode? : @codegen.Mode = Default,
  input_mode? : @codegen.InputMode = Array,
  compress? : Bool = false,
) -> Unit {
  ignore(no_comments)
  let context = @mbt_common.Context::new(
    grammar,
    automaton,
    meta,
    filename=grammar_filename,
    mode~,
    input_mode~,
  )
  let items = context.prelude(external_tokens~)
  items.append(context.runtime_types(Table))
  items.append(context.action_items())
  items.push(context.input_function(Table))
  let used_productions = @sorted_set.SortedSet([])
  for state in automaton.states {
    for _, decision in state.action {
      if decision is Reduce(production) {
        used_productions.add(production)
      }
    }
  }
  let used_productions = used_productions.to_array()
  fn get_used_production_num(prod : @grm.Production) -> Int {
    used_productions.search(prod).unwrap()
  }

  fn encode_decision(decision : CodegenDecision) -> Int {
    match decision {
      Error => 0
      Accept => 1
      Shift(next_state) => 2 + next_state.num
      Reduce(production) =>
        2 + automaton.states.length() + get_used_production_num(production)
      ReduceNoLookahead(production) =>
        2 +
        automaton.states.length() +
        used_productions.length() +
        get_used_production_num(production)
    }
  }

  let int_array = @mbt_common.named_type("ReadOnlyArray", [
    @mbt_common.named_type("Int", []),
  ])
  items.push(
    @mbt_ast.item(
      Global(
        "yy_prod_lhs_table",
        Some(int_array),
        Array(
          used_productions.map(p => {
            @mbt_ast.Expr::Int(
              CodegenSymbol::nonterminal(p.lhs).encode(grammar),
            )
          }),
        ),
      ),
    ),
  )
  items.push(
    @mbt_ast.item(
      Global(
        "yy_prod_len_table",
        Some(int_array),
        Array(used_productions.map(p => @mbt_ast.Expr::Int(p.rhs.length()))),
      ),
    ),
  )
  items.push(
    @mbt_ast.item(
      Global(
        "yy_prod_act_table",
        Some(
          // New native lowering in v0.10.14+00f066f21 rejects static arrays of
          // direct references to named functions. Keep this as FixedArray.
          @mbt_common.named_type("FixedArray", [
            @mbt_common.named_type("YYAction", []),
          ]),
        ),
        Array(
          used_productions.map(p => {
            @mbt_ast.Expr::Ident(
              "yy_action_\{context.action_id((meta.production_meta)(p.num).action)}",
            )
          }),
        ),
      ),
    ),
  )
  let state_table = []
  fn iter_symbol() -> Iter[CodegenSymbol] {
    Iter::singleton(CodegenSymbol::eoi())
    .add(grammar.terminals.iter().map(t => CodegenSymbol::terminal(t)))
    .add(grammar.nonterminals.iter().map(nt => CodegenSymbol::nonterminal(nt)))
  }

  fn append_row(state : @lr1.LR1State) {
    let decision_groups : @sorted_map.SortedMap[
      CodegenDecision,
      @immut/sorted_set.SortedSet[CodegenSymbol],
    ] = SortedMap([])
    fn add_symbol_decision(symbol, decision) {
      decision_groups[decision] = decision_groups
        .get(decision)
        .unwrap_or(@immut/sorted_set.new())
        .add(symbol)
    }

    for input, decision in state.action {
      add_symbol_decision(
        match input {
          Input(term) => T(term)
          EndOfInput => EOI
        },
        match decision {
          Accept => Accept
          Shift(next_state) => Shift(next_state)
          Reduce(production) => Reduce(production)
          Conflict(_) => panic()
        },
      )
    }
    for symbol, state in state.goto {
      match symbol {
        NT(nonterm) => add_symbol_decision(NT(nonterm), Shift(state))
        _ => ()
      }
    }
    let no_lookahead_needed = match [..decision_groups.keys()] {
      [Reduce(_)] | [Accept] => !state.forbid_default_reduction
      _ => false
    }
    fn to_codegen_decision(decision : @lr1.Decision?) -> CodegenDecision {
      match decision {
        None => Error
        Some(Accept) => Accept
        Some(Shift(next_state)) => Shift(next_state)
        Some(Reduce(production)) =>
          if no_lookahead_needed {
            ReduceNoLookahead(production)
          } else {
            Reduce(production)
          }
        Some(Conflict(_)) => panic()
      }
    }

    for symbol in iter_symbol() {
      let decision : CodegenDecision = match symbol {
        EOI => to_codegen_decision(state.action.get(EndOfInput))
        T(t) => to_codegen_decision(state.action.get(Input(t)))
        NT(nt) =>
          match state.goto.get(NT(nt)) {
            None => Error
            Some(next_state) => Shift(next_state)
          }
      }
      state_table.push(encode_decision(decision))
    }
  }

  for state in automaton.states {
    append_row(state)
  }

  // Assume input elements are unsigned
  fn compress_array(input : Array[Int]) -> Array[Int] {
    if input.length() == 0 {
      return []
    }
    let output = []
    let mut last = input[0]
    let mut count = 1
    for val in input[1:] {
      if val == last {
        count += 1
      } else {
        output.push(last)
        if count > 1 {
          output.push(-count)
        }
        last = val
        count = 1
      }
    }
    output.push(last)
    if count > 1 {
      output.push(-count)
    }
    output
  }

  let state_table = if compress {
    compress_array(state_table)
  } else {
    state_table
  }
  if compress {
    items.push(decompressor())
  }
  let table : @mbt_ast.Expr = Array(state_table.map(i => @mbt_ast.Expr::Int(i)))
  items.push(
    @mbt_ast.item(
      Global(
        "yy_state_table",
        Some(int_array),
        if compress {
          @mbt_common.call("yy_decompress", [table])
        } else {
          table
        },
      ),
    ),
  )
  items.push(
    decoder(
      1 + grammar.terminals.length() + grammar.nonterminals.length(),
      automaton.states.length(),
      used_productions.length(),
    ),
  )
  items.append(context.parser_runtime(Table))
  for (production, state) in automaton.starts {
    let name = production.lhs.name
    let type_ = (meta.nonterminal_meta)(name).data_type
    items.push(
      @mbt_common.entry_point(
        name=name[:name.length() - "_prime".length()].to_owned(),
        result=type_,
        position=meta.position_data_type,
        state=Int(state.num),
        unbox="YYObj_" + @mbt_common.type_ident(type_),
        input_mode~,
      ),
    )
  }
  items.append(context.action_runtime())
  items.append(context.footer())
  @mbt_ast.emit(items, output, source_map_builder?)
}

///|
priv struct GeneratorConfig {
  compress : Bool
}

///|
priv struct CodeGenerator(GeneratorConfig)

///|
impl @codegen.CodeGenerator for CodeGenerator with fn codegen_tokens(
  self,
  terminals,
  terminal_meta,
  output,
  no_comments~,
  derive_map~,
) {
  ignore(self)
  codegen_tokens(terminals, terminal_meta, output, no_comments~, derive_map~)
}

///|
impl @codegen.CodeGenerator for CodeGenerator with fn codegen(
  self,
  grammar,
  automaton,
  meta,
  output,
  source_map_builder~,
  grammar_filename~,
  external_tokens~,
  no_comments~,
  mode~,
  input_mode~,
) {
  ignore(self)
  codegen(
    grammar,
    automaton,
    meta,
    output,
    source_map_builder?,
    grammar_filename~,
    external_tokens~,
    no_comments~,
    mode~,
    input_mode~,
    compress=self.compress,
  )
}

///|
pub let compress_generator : &@codegen.CodeGenerator = CodeGenerator({
  compress: true,
})

///|
pub let generator : &@codegen.CodeGenerator = CodeGenerator({ compress: false, })
