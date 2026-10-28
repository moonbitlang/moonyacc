///|
/// Keep the existing conservative default-reduction contract.
fn default_decision(state : @lr1.LR1State, has_gotos : Bool) -> @lr1.Decision? {
  if state.forbid_default_reduction || has_gotos {
    return None
  }
  let mut default_ = None
  for _, decision in state.action {
    match decision {
      Reduce(_) | Accept => {
        if default_ is Some(previous) && previous != decision {
          return None
        }
        default_ = Some(decision)
      }
      _ => return None
    }
  }
  default_
}

///|
fn token(input : @lr1.Lookahead) -> Token {
  match input {
    Input(t) => Terminal(t.num + 1)
    EndOfInput => EndOfInput
  }
}

///|
fn Lowering::diagnostic(
  self : Lowering,
  decision : @lr1.Decision,
) -> DiagnosticAction {
  match decision {
    Shift(target) => Shift(target.num)
    Reduce(p) =>
      Reduce(p.rhs.length(), symbol_id(NT(p.lhs), self.program.terminal_count))
    Accept => Accept
    Conflict(_) => abort("direct backend requires resolved conflicts")
  }
}

///|
fn Lowering::lower_states(self : Lowering) -> Unit {
  for state in self.automaton.states {
    self.lower_state(state)
  }
}

///|
fn Lowering::lower_state(self : Lowering, state : @lr1.LR1State) -> Unit {
  let gotos = []
  for symbol, target in state.goto {
    if symbol is NT(_) {
      gotos.push((symbol_id(symbol, self.program.terminal_count), target.num))
    }
  }
  let default_ = default_decision(state, !gotos.is_empty())
  self.program.diagnostics.push({
    default_: default_.map(d => self.diagnostic(d)),
    actions: state.action
    .iter()
    .map(p => (token(p.0), self.diagnostic(p.1)))
    .to_array(),
    gotos,
  })
  // Terminal goto edges can retain shifts removed by precedence resolution.
  // Only the resolved action map is allowed to build token branches.
  let (instructions, terminator) = match default_ {
    Some(decision) => ([], Jump(self.target(state, decision, EndOfInput)))
    None => {
      let stop = self.reserve(Helper)
      self.program.blocks[stop] = {
        origin: Helper,
        parameters: [],
        lookahead: Present,
        instructions: [],
        terminator: Stop(state.num),
      }
      let arms = state.action
        .iter()
        .map(p => {
          let input = token(p.0)
          (input, self.target(state, p.1, input))
        })
        .to_array()
      ([EnsureLookahead], CaseToken(arms, edge(stop)))
    }
  }
  self.program.blocks[state.num] = {
    origin: Run(state.num),
    parameters: [],
    lookahead: Any,
    instructions,
    terminator,
  }
}

///|
fn Lowering::target(
  self : Lowering,
  state : @lr1.LR1State,
  decision : @lr1.Decision,
  input : Token,
) -> Edge {
  match decision {
    Reduce(p) => edge(self.reduce_labels[p.num])
    Shift(next) => {
      guard input is Terminal(term) else {
        abort("cannot shift internal end-of-input")
      }
      self.shift_edge(term, next.num)
    }
    Accept => self.accept_edge(state)
    Conflict(_) => abort("direct backend requires resolved conflicts")
  }
}

///|
/// Shifting a token into a state is independent of its predecessor.
fn Lowering::shift_edge(self : Lowering, term : Int32, target : Int32) -> Edge {
  if self.shifts.get((term, target)) is Some(label) {
    return edge(label)
  }
  let value = self.fresh(Semantic(self.program.symbols[term].type_))
  let sp = self.fresh(Position)
  let ep = self.fresh(Position)
  let label = self.reserve(Shift(target, term))
  self.program.blocks[label] = {
    origin: Shift(target, term),
    parameters: [],
    lookahead: On(Terminal(term)),
    instructions: [
      Input(term, value, sp, ep),
      Push(cell(term), [State(target), Reg(value), Reg(sp), Reg(ep)]),
      ConsumeLookahead,
      SaveErrorSnapshot([]),
    ],
    terminator: Jump(edge(target)),
  }
  self.shifts[(term, target)] = label
  edge(label)
}

///|
fn Lowering::accept_edge(self : Lowering, state : @lr1.LR1State) -> Edge {
  let mut entry = -1
  for item in state.iter_item_groups() {
    for i, (p, _) in self.automaton.starts {
      if item.core.production == p && item.core.dot == p.rhs.length() {
        entry = i
      }
    }
  }
  guard entry >= 0 else { abort("accept state without a start production") }
  let symbol = symbol_id(
    self.automaton.starts[entry].0.rhs[0],
    self.program.terminal_count,
  )
  let value = self.fresh(Semantic(self.program.symbols[symbol].type_))
  let label = self.reserve(Helper)
  self.program.blocks[label] = {
    origin: Helper,
    parameters: [],
    lookahead: Any,
    instructions: [Peek(0, cell(symbol), [None, Some(value), None, None])],
    terminator: Return(entry, Reg(value)),
  }
  edge(label)
}
