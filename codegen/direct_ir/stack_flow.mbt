///|
priv struct StackFlowPass {
  program : Program
  knowledge : StackKnowledge
  universe : Set[Token]
  previous_symbols : Map[Int32, Set[Int32]]
  previous_initial : Set[Int32]
  read_above : Map[Int32, Array[Int32]]
}

///|
fn StackFlowPass::refine(
  self : StackFlowPass,
  machine : StackMachineFact,
) -> Unit raise InvalidProgram {
  let mut common : Array[StackCellFact]? = None
  for state in machine.current {
    let word = self.knowledge.long[state]
    common = Some(
      match common {
        None => word
        Some(previous) => join_words(previous, word)
      },
    )
  }
  guard common is Some(known) else { return }
  let actual = machine.word
  let overlap = Int32::min(actual.length(), known.length())
  for depth in 0..<overlap {
    require(
      actual[actual.length() - depth - 1].symbol ==
      known[known.length() - depth - 1].symbol,
      "inconsistent LR state and stack suffix",
    )
    let index = actual.length() - depth - 1
    let states = intersect_states(
      actual[index].predecessors,
      known[known.length() - depth - 1].predecessors,
    )
    require(!states.is_empty(), "inconsistent predecessor states")
    actual[index] = { ..actual[index], predecessors: states, }
  }
  if known.length() > actual.length() {
    require(!machine.exact, "LR state requires a deeper stack")
    machine.word = [..known[:known.length() - actual.length()], ..actual]
  }
}

///|
fn StackFlowPass::instruction(
  self : StackFlowPass,
  instruction : Instruction,
  machine : StackMachineFact,
) -> Unit raise InvalidProgram {
  match instruction {
    EnsureLookahead => {
      if machine.empty_token {
        machine.tokens = self.universe.copy()
      }
      machine.empty_token = false
    }
    LoadLookahead => {
      require(
        machine.empty_token && machine.tokens.is_empty(),
        "unconditional lexer read overwrites lookahead",
      )
      machine.empty_token = false
      machine.tokens = self.universe.copy()
    }
    ConsumeLookahead => {
      require(
        !machine.empty_token &&
        !machine.tokens.is_empty() &&
        !machine.tokens.contains(EndOfInput),
        "consuming absent lookahead",
      )
      machine.empty_token = true
      machine.tokens = Set([])
    }
    Input(symbol, _, _, _) =>
      require(
        !machine.empty_token && machine.tokens == Set([Terminal(symbol)]),
        "input token is not proved",
      )
    Bind(bindings) => {
      let facts = bindings.map(p => machine.value(p.1))
      for i, (reg, _) in bindings {
        if reg.type_ is State {
          machine.registers[reg.id] = facts[i]
        }
      }
    }
    Push(cell, values) => {
      guard cell.symbol is Some(symbol) &&
        cell.fields.search(State) is Some(index) else {
        raise InvalidProgram("stack proof requires a logical state field")
      }
      let targets = machine.value(values[index]).states
      require(!targets.is_empty(), "unknown pushed LR state")
      for source in machine.current {
        for target in targets {
          require(
            self.knowledge.transitions[source].contains((symbol, target)),
            "push is not an LR transition",
          )
        }
      }
      machine.word.push({ symbol, predecessors: machine.current, })
      machine.move_depth(1)
      machine.current = targets
    }
    Peek(depth, cell, bindings) => self.read(machine, depth, cell, bindings)
    Pop(cell, bindings) => {
      self.read(machine, 0, cell, bindings)
      guard machine.word.pop() is Some(top) else {
        raise InvalidProgram("stack proof underflow")
      }
      machine.current = top.predecessors
      machine.move_depth(-1)
    }
    ReadPreviousPosition(depth, reg) => {
      self.refine(machine)
      require(
        depth <= machine.word.length(),
        "unknown previous-position suffix",
      )
      let states = if depth == 0 {
        machine.current
      } else {
        machine.word[machine.word.length() - depth].predecessors
      }
      let symbols = self.previous_symbols.get_or_init(reg.id, () => Set([]))
      self.record_above(machine, depth, reg)
      for state in states {
        if self.knowledge.long[state].last() is Some(cell) {
          symbols.add(cell.symbol)
        } else {
          self.previous_initial.add(reg.id)
        }
      }
    }
    Action(_) | SaveErrorSnapshot(_) => ()
  }
}

///|
fn StackFlowPass::read(
  self : StackFlowPass,
  machine : StackMachineFact,
  depth : Int32,
  cell : Cell,
  bindings : Array[Register?],
) -> Unit raise InvalidProgram {
  self.refine(machine)
  if cell.symbol is Some(symbol) {
    require(depth < machine.word.length(), "unknown stack cell suffix")
    require(
      machine.word[machine.word.length() - depth - 1].symbol == symbol,
      "stack symbol mismatch",
    )
  } else {
    require(depth <= machine.word.length(), "unknown state depth")
  }
  for i, field in cell.fields {
    if bindings[i] is Some(reg) {
      self.record_above(machine, depth, reg)
    }
    if field is State && bindings[i] is Some(reg) {
      let states = if depth == 0 {
        machine.current
      } else {
        machine.word[machine.word.length() - depth].predecessors
      }
      machine.registers[reg.id] = { states, depth: Some(depth), }
    }
  }
}

///|
fn StackFlowPass::record_above(
  self : StackFlowPass,
  machine : StackMachineFact,
  depth : Int32,
  reg : Register,
) -> Unit raise InvalidProgram {
  let symbols = machine.word[machine.word.length() - depth:].map(cell => {
    cell.symbol
  })
  if self.read_above.get(reg.id) is Some(previous) {
    require(previous == symbols, "inconsistent stack read suffix")
  } else {
    self.read_above[reg.id] = symbols
  }
}

///|
fn StackFlowPass::body(
  self : StackFlowPass,
  body : Body,
  machine : StackMachineFact,
  jump : (Edge, StackMachineFact) -> Unit,
) -> Unit raise InvalidProgram {
  let branch = machine.copy()
  for instruction in body.instructions {
    self.instruction(instruction, branch)
  }
  self.finish(body.terminator, branch, jump)
}

///|
fn StackFlowPass::finish(
  self : StackFlowPass,
  term : Terminator,
  machine : StackMachineFact,
  jump : (Edge, StackMachineFact) -> Unit,
) -> Unit raise InvalidProgram {
  match term {
    Jump(edge) => jump(edge, machine)
    CaseToken(arms, fallback) => {
      require(!machine.empty_token, "token case without a cached token")
      let remaining = machine.tokens.copy()
      for (tokens, body) in arms {
        let selected = Set::from_iter(
          tokens.iter().filter(token => machine.tokens.contains(token)),
        )
        for token in tokens {
          remaining.remove(token)
        }
        if !selected.is_empty() {
          self.body(
            body,
            { ..machine, empty_token: false, tokens: selected, },
            jump,
          )
        }
      }
      if !remaining.is_empty() {
        self.body(fallback, { ..machine, tokens: remaining, }, jump)
      }
    }
    CaseState(value, arms) => {
      let fact = machine.value(value)
      require(!fact.states.is_empty(), "unknown LR state selector")
      require(
        fact.states.iter().all(state => arms.any(p => p.0 == state)),
        "nonexhaustive LR state case",
      )
      for (state, body) in arms {
        if !fact.states.contains(state) {
          continue
        }
        let branch = machine.copy()
        if value is Reg(reg) {
          branch.registers[reg.id] = { ..fact, states: Set([state]), }
        }
        if fact.depth == Some(0) {
          branch.current = Set([state])
          self.refine(branch)
        }
        self.body(body, branch, jump)
      }
    }
    Return(entry, _) => {
      let initial = self.program.entries[entry].state
      // A root with no incoming LR transition can occur only at the bottom.
      // This recovers the final stack type after recursive joins lose height.
      let root_only = self.knowledge.transitions.all(edges => {
        edges.all(p => p.1 != initial)
      })
      require(
        (machine.exact || root_only) &&
        machine.word.is_empty() &&
        machine.current == Set([initial]),
        "return has the wrong entry stack",
      )
    }
    Stop => require(!machine.empty_token, "error exit without a cached token")
    Unreachable => ()
  }
}

///|
/// Inductively checks logical stack symbols on the actual CFG. State-case
/// refinements use LR invariants only when the selector is synchronized with
/// the current stack; provenance annotations are never used as assumptions.
pub fn Program::stack_flow(
  self : Program,
  knowledge : StackKnowledge,
) -> StackFlow raise InvalidProgram {
  let pass = StackFlowPass::new(self, knowledge)
  let entries : Array[StackEntryFact?] = Array::make(self.blocks.length(), None)
  let queued = Array::make(self.blocks.length(), false)
  let pending = []
  fn contribute(label : Int32, next : StackEntryFact) {
    let combined = match entries[label] {
      None => next
      Some(previous) => previous.join(next)
    }
    if entries[label].map(previous => previous.same(combined)).unwrap_or(false) {
      return
    }
    entries[label] = Some(combined)
    if !queued[label] {
      queued[label] = true
      pending.push(label)
    }
  }
  for entry in self.entries {
    contribute(entry.block, {
      word: [],
      exact: true,
      current: Set([entry.state]),
      parameters: [],
      empty_token: true,
      tokens: Set([]),
    })
  }
  while pending.pop() is Some(label) {
    queued[label] = false
    let entry = entries[label].unwrap()
    let block = self.blocks[label]
    let machine = entry.machine(block)
    pass.body(
      { instructions: block.instructions, terminator: block.terminator, },
      machine,
      (edge, exit) => {
        contribute(edge.target, {
          word: exit.word.copy(),
          exact: exit.exact,
          current: exit.current,
          parameters: edge.arguments.map(v => exit.value(v)),
          empty_token: exit.empty_token,
          tokens: exit.tokens,
        })
      },
    )
  }
  {
    entries,
    previous_symbols: pass.previous_symbols,
    previous_initial: pass.previous_initial,
    read_above: pass.read_above,
  }
}
