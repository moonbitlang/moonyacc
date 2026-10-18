///|
/// Owns label/register allocation and the sharing caches for one lowering run.
priv struct Lowering {
  program : Program
  automaton : @lr1.Automaton
  reduce_labels : Map[Int, Int]
  goto_labels : Map[Int, Int]
  shifts : Map[(Int, Int), Int]
  mut next_register : Int
}

///|
fn symbol_id(symbol : @grm.Symbol, terminal_count : Int) -> Int {
  match symbol {
    T(t) => t.num + 1
    NT(nt) => terminal_count + nt.num + 1
  }
}

///|
fn symbol_table(
  grammar : @grm.Grammar,
  meta : @codegen.MetaProvider,
  mode : @codegen.Mode,
) -> Array[Symbol] {
  fn effective_type(type_ : @elab.TypeExpr) -> @elab.TypeExpr {
    match mode {
      Default => type_
      JsonCst => Constr(pkg=None, "Json", [])
    }
  }
  let symbols : Array[Symbol] = [
    { name: "<end>", type_: Constr(pkg=None, "Unit", []), },
  ]
  for term in grammar.terminals {
    symbols.push({
      name: term.name,
      type_: effective_type((meta.terminal_meta)(term.name).data_type),
    })
  }
  for nt in grammar.nonterminals {
    symbols.push({
      name: nt.name,
      type_: effective_type((meta.nonterminal_meta)(nt.name).data_type),
    })
  }
  symbols
}

///|
fn Lowering::new(
  grammar : @grm.Grammar,
  automaton : @lr1.Automaton,
  meta : @codegen.MetaProvider,
  mode : @codegen.Mode,
) -> Lowering {
  let terminal_count = grammar.terminals.length()
  let symbols = symbol_table(grammar, meta, mode)
  let entries = automaton.starts.map(start => {
    let (production, state) = start
    let name = production.lhs.name
    Entry::{
      name: name[:name.length() - "_prime".length()].to_owned(),
      block: state.num,
      state: state.num,
      result_type: symbols[symbol_id(production.rhs[0], terminal_count)].type_,
    }
  })
  let actions = grammar.productions.map(p => ActionSignature::{
    rhs: p.rhs.map(s => symbol_id(s, terminal_count)),
    lhs: symbol_id(NT(p.lhs), terminal_count),
    callable: !grammar.starts.contains(p),
  })
  let self = Lowering::{
    program: {
      entries,
      blocks: [],
      symbols,
      terminal_count,
      actions,
      diagnostics: [],
    },
    automaton,
    reduce_labels: {},
    goto_labels: {},
    shifts: {},
    next_register: 0,
  }
  // Run labels occupy the LR state numbers; all other labels follow them.
  for state in automaton.states {
    ignore(self.reserve(Run(state.num)))
  }
  self
}

///|
fn Lowering::reserve(self : Lowering, origin : Origin) -> Int {
  let label = self.program.blocks.length()
  self.program.blocks.push({
    origin,
    parameters: [],
    lookahead: Any,
    instructions: [],
    terminator: Unreachable,
  })
  label
}

///|
fn Lowering::fresh(self : Lowering, type_ : ValueType) -> Register {
  let id = self.next_register
  self.next_register += 1
  { id, type_, }
}

///|
fn Lowering::reserve_reductions(self : Lowering) -> Unit {
  for state in self.automaton.states {
    for _, decision in state.action {
      if decision is Reduce(p) && !self.reduce_labels.contains(p.num) {
        self.reduce_labels[p.num] = self.reserve(Reduce(p.num))
        let lhs = symbol_id(NT(p.lhs), self.program.terminal_count)
        if !self.goto_labels.contains(lhs) {
          self.goto_labels[lhs] = self.reserve(Goto(lhs))
        }
      }
    }
  }
}

///|
fn cell(symbol : Int) -> Cell {
  { symbol: Some(symbol), fields: [State, Semantic, Start, End], }
}

///|
fn edge(target : Int) -> Edge {
  { target, arguments: [], }
}
