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
fn CodegenSymbol::to_string(self : CodegenSymbol) -> String {
  match self {
    T(t) => "T_\{t.name}"
    NT(nt) => "NT_\{derive_nonterminal_ident(nt)}"
    EOI => "EOI"
  }
}

///|
priv enum CodegenDecision {
  Accept
  Shift(Int)
  Reduce(Int, @grm.Nonterminal, Int)
  ReduceNoLookahead(Int, @grm.Nonterminal, Int)
} derive(Eq, Compare)

///|
fn derive_nonterminal_ident(nont : @grm.Nonterminal) -> String {
  let name = nont.name
  name
  .replace_all(old=" ", new="_")
  .replace_all(old="(", new="_")
  .replace_all(old=")", new="_")
  .replace_all(old=",", new="_")
}

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
) -> Unit {
  let context = @mbt_common.Context::new(
    grammar,
    automaton,
    meta,
    filename=grammar_filename,
    mode~,
    input_mode~,
  )
  let items = context.prelude(external_tokens~)
  items.append(context.runtime_types(Code))
  let symbols = grammar.terminals.map(t => @mbt_ast.Constructor::{
    name: "T_" + t.name,
    arguments: [],
  })
  for nt in grammar.nonterminals {
    if !grammar.starts.iter().any(p => p.lhs == nt) {
      symbols.push({
        name: "NT_" + derive_nonterminal_ident(nt),
        arguments: [],
      })
    }
  }
  symbols.push({ name: "EOI", arguments: [], })
  items.push(@mbt_ast.item(Enum("YYSymbol", symbols, []), visibility=Private))
  items.push(
    @mbt_ast.item(
      Init(
        @mbt_common.value_block(
          Match(Ascribe(Ident("EOI"), @mbt_common.named_type("YYSymbol", [])), [
            (Constructor("EOI", []), @mbt_common.value_block(Unit)),
            (Any, @mbt_common.value_block(Unit)),
          ]),
        ),
      ),
      comments=["Workaround for EOI unused warning"],
    ),
  )
  items.append(context.action_items())
  items.push(context.input_function(Code))

  for state in automaton.states {
    let mut sum = 0
    let groups : @sorted_map.SortedMap[
      CodegenDecision,
      @immut/sorted_set.SortedSet[CodegenSymbol],
    ] = SortedMap([])
    fn add(symbol : CodegenSymbol, decision : CodegenDecision) {
      groups[decision] = groups
        .get(decision)
        .unwrap_or(@immut/sorted_set.new())
        .add(symbol)
      match symbol {
        T(t) => sum += t.num
        NT(nt) => sum += grammar.terminals.length() + nt.num
        EOI => sum += grammar.terminals.length() + grammar.nonterminals.length()
      }
    }
    for input, decision in state.action {
      add(
        match input {
          Input(t) => T(t)
          EndOfInput => EOI
        },
        match decision {
          Accept => Accept
          Shift(next) => Shift(next.num)
          Reduce(p) => Reduce(p.rhs.length(), p.lhs, p.num)
          Conflict(_) => panic()
        },
      )
    }
    for symbol, target in state.goto {
      if symbol is NT(nt) {
        add(NT(nt), Shift(target.num))
      }
    }
    let no_lookahead = match [..groups.keys()] {
      [Reduce(_)] | [Accept] => !state.forbid_default_reduction
      _ => false
    }
    fn decision_expr(decision : CodegenDecision) -> @mbt_ast.Expr {
      match decision {
        Accept => Ident("Accept")
        Shift(state) => @mbt_common.call("Shift", [Ident("yy_state_\{state}")])
        Reduce(count, nt, production)
        | ReduceNoLookahead(count, nt, production) => {
          let name = if decision is Reduce(_) {
            "Reduce"
          } else {
            "ReduceNoLookahead"
          }
          @mbt_common.call(name, [
            Int(count),
            Ident("NT_" + derive_nonterminal_ident(nt)),
            Ident(
              "yy_action_\{context.action_id((meta.production_meta)(production).action)}",
            ),
          ])
        }
      }
    }
    let body = if groups.length() == 1 && no_lookahead {
      let decision = match [..groups.keys()][0] {
        Reduce(count, nt, p) => ReduceNoLookahead(count, nt, p)
        decision => decision
      }
      @mbt_common.value_block(decision_expr(decision))
    } else {
      let mut total = grammar.terminals.length() + grammar.nonterminals.length()
      for t in grammar.terminals {
        total += t.num
      }
      for nt in grammar.nonterminals {
        if !grammar.starts.iter().any(p => p.lhs == nt) {
          total += grammar.terminals.length() + nt.num
        }
      }
      let arms = groups
        .iter()
        .map(pair => {
          let (decision, symbols) = pair
          let patterns = symbols
            .iter()
            .map(symbol => {
              @mbt_ast.Pattern::Constructor(CodegenSymbol::to_string(symbol), [])
            })
            .to_array()
          (
            if patterns.length() == 1 {
              patterns[0]
            } else {
              @mbt_ast.Pattern::Or(patterns)
            },
            @mbt_common.value_block(decision_expr(decision)),
          )
        })
        .to_array()
      if sum != total {
        arms.push((Any, @mbt_common.value_block(Ident("Error"))))
      }
      @mbt_common.value_block(Match(Ident("_lookahead"), arms))
    }
    let comments = if no_comments {
      []
    } else {
      state.iter_item_groups().map(Show::to_string).to_array()
    }
    items.push(
      @mbt_ast.item(
        Function(
          @mbt_ast.function(
            "yy_state_\{state.num}",
            [
              Positional(
                "_lookahead",
                Some(@mbt_common.named_type("YYSymbol", [])),
              ),
            ],
            body,
            result=@mbt_common.named_type("YYDecision", []),
          ),
        ),
        comments~,
      ),
    )
  }
  items.append(context.parser_runtime(Code))
  for (production, state) in automaton.starts {
    let name = production.lhs.name
    let type_ = (meta.nonterminal_meta)(name).data_type
    items.push(
      @mbt_common.entry_point(
        name=name[:name.length() - "_prime".length()].to_owned(),
        result=type_,
        position=meta.position_data_type,
        state=Ident("yy_state_\{state.num}"),
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
priv struct CodeGenerator(Unit)

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
  )
}

///|
pub let generator : &@codegen.CodeGenerator = CodeGenerator(())
