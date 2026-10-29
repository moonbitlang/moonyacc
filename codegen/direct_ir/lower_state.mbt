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
  self.program.diagnostics[state.num] = {
    default_: default_.map(d => self.diagnostic(d)),
    actions: state.action
    .iter()
    .map(p => (token(p.0), self.diagnostic(p.1)))
    .to_array(),
    gotos,
  }
  // Terminal goto edges can retain shifts removed by precedence resolution.
  // Only the resolved action map is allowed to build token branches.
  let (instructions, terminator) = match default_ {
    Some(decision) => {
      let body = self.target(state, decision)
      (body.instructions, body.terminator)
    }
    None => {
      let stop = self.error_label
      let arms : Array[(TokenPattern, Body)] = []
      for (lookahead, decision) in state.action {
        let input = token(lookahead)
        match decision {
          Shift(next) => {
            guard! input is Terminal(term)
            arms.push(self.shift_branch(term, next.num))
          }
          _ => {
            let body = self.target(state, decision)
            if arms.search_by(p => p.0 is Tokens(_) && p.1 == body)
              is Some(index) {
              guard! arms[index].0 is Tokens(tokens)
              tokens.push(input)
            } else {
              arms.push((Tokens([input]), body))
            }
          }
        }
      }
      ([EnsureLookahead], CaseToken(arms, Body::jump(edge(stop))))
    }
  }
  let parameters = self.program.blocks[state.num].parameters
  let prefix = []
  let mut lookahead = if self.incoming[state.num] is None { Empty } else { Any }
  if self.incoming[state.num] is Some(symbol) {
    guard! parameters is [value, start, end]
    prefix.push(
      Push(cell(symbol), [State(state.num), Reg(value), Reg(start), Reg(end)]),
    )
    if symbol <= self.program.terminal_count {
      prefix.append([ConsumeLookahead, SaveErrorSnapshot([])])
      lookahead = On(Terminal(symbol))
    }
  }
  prefix.append(instructions)
  self.program.blocks[state.num] = {
    origin: Run(state.num),
    hint: NoHint,
    parameters,
    lookahead,
    instructions: prefix,
    terminator,
  }
}

///|
fn Lowering::target(
  self : Lowering,
  state : @lr1.LR1State,
  decision : @lr1.Decision,
) -> Body {
  match decision {
    Reduce(p) => Body::jump(edge(self.reduce_labels[p.num]))
    Shift(_) => abort("shift requires a binding token pattern")
    Accept => Body::jump(self.accept_edge(state))
    Conflict(_) => abort("direct backend requires resolved conflicts")
  }
}

///|
/// Token payloads are bound in the selecting branch. The target run routine
/// owns its incoming cell, so a shared run can commute its push into its cases.
fn Lowering::shift_branch(
  self : Lowering,
  term : Int32,
  target : Int32,
) -> (TokenPattern, Body) {
  let value = self.fresh(Semantic(self.program.symbols[term].type_))
  let sp = self.fresh(Position)
  let ep = self.fresh(Position)
  (
    BindToken(term, value, sp, ep),
    {
      instructions: [],
      terminator: Jump({ target, arguments: [Reg(value), Reg(sp), Reg(ep)], }),
    },
  )
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
    hint: IfCells(1),
    parameters: [],
    lookahead: Any,
    instructions: [Pop(cell(symbol), [None, Some(value), None, None])],
    terminator: Return(entry, Reg(value)),
  }
  edge(label)
}
