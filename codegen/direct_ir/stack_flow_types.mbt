///|
pub(all) struct StateValueFact {
  states : Set[Int32]
  // Equality with the LR state at this depth in the current stack, if known.
  depth : Int32?
}

///|
pub(all) struct StackEntryFact {
  word : Array[StackCellFact]
  exact : Bool
  current : Set[Int32]
  parameters : Array[StateValueFact]
  empty_token : Bool
  tokens : Set[Token]
}

///|
pub(all) struct StackFlow {
  entries : Array[StackEntryFact?]
  previous_symbols : Map[Int32, Set[Int32]]
  previous_initial : Set[Int32]
  read_above : Map[Int32, Array[Int32]]
}

///|
priv struct StackMachineFact {
  mut word : Array[StackCellFact]
  exact : Bool
  mut current : Set[Int32]
  registers : Map[Int32, StateValueFact]
  mut empty_token : Bool
  mut tokens : Set[Token]
}

///|
fn union_states(left : Set[Int32], right : Set[Int32]) -> Set[Int32] {
  let result = left.copy()
  ignore(extend_states(result, right))
  result
}

///|
fn intersect_states(left : Set[Int32], right : Set[Int32]) -> Set[Int32] {
  Set::from_iter(left.iter().filter(x => right.contains(x)))
}

///|
fn join_words(
  left : Array[StackCellFact],
  right : Array[StackCellFact],
) -> Array[StackCellFact] {
  let n = Int32::min(left.length(), right.length())
  let mut count = 0
  while count < n &&
        left[left.length() - count - 1].symbol ==
        right[right.length() - count - 1].symbol {
    count += 1
  }
  Array::makei(count, i => {
    let a = left[left.length() - count + i]
    let b = right[right.length() - count + i]
    {
      symbol: a.symbol,
      predecessors: union_states(a.predecessors, b.predecessors),
    }
  })
}

///|
fn same_word(left : Array[StackCellFact], right : Array[StackCellFact]) -> Bool {
  left.length() == right.length() &&
  left
  .mapi((i, cell) => {
    cell.symbol == right[i].symbol && cell.predecessors == right[i].predecessors
  })
  .all(x => x)
}

///|
fn StateValueFact::join(
  self : StateValueFact,
  other : StateValueFact,
) -> StateValueFact {
  {
    states: union_states(self.states, other.states),
    depth: if self.depth == other.depth {
      self.depth
    } else {
      None
    },
  }
}

///|
fn StackEntryFact::join(
  self : StackEntryFact,
  other : StackEntryFact,
) -> StackEntryFact {
  let word = join_words(self.word, other.word)
  {
    word,
    exact: self.exact &&
    other.exact &&
    word.length() == self.word.length() &&
    word.length() == other.word.length(),
    current: union_states(self.current, other.current),
    parameters: self.parameters.mapi((i, p) => p.join(other.parameters[i])),
    empty_token: self.empty_token || other.empty_token,
    tokens: Set::from_iter(self.tokens.iter().concat(other.tokens.iter())),
  }
}

///|
fn StackEntryFact::same(self : StackEntryFact, other : StackEntryFact) -> Bool {
  same_word(self.word, other.word) &&
  self.exact == other.exact &&
  self.current == other.current &&
  self.empty_token == other.empty_token &&
  self.tokens == other.tokens &&
  self.parameters.length() == other.parameters.length() &&
  self.parameters
  .mapi((i, p) => {
    p.states == other.parameters[i].states &&
    p.depth == other.parameters[i].depth
  })
  .all(x => x)
}

///|
fn StackMachineFact::copy(self : StackMachineFact) -> StackMachineFact {
  {
    ..self,
    word: self.word.copy(),
    current: self.current.copy(),
    registers: self.registers.copy(),
    tokens: self.tokens.copy(),
  }
}

///|
fn StackMachineFact::value(
  self : StackMachineFact,
  value : Value,
) -> StateValueFact {
  match value {
    State(state) => { states: Set([state]), depth: None, }
    Reg(reg) => {
      let fact = self.registers
        .get(reg.id)
        .unwrap_or({ states: Set([]), depth: None, })
      if fact.depth is Some(depth) && depth <= self.word.length() {
        let states = if depth == 0 {
          self.current
        } else {
          self.word[self.word.length() - depth].predecessors
        }
        { ..fact, states: intersect_states(fact.states, states), }
      } else {
        fact
      }
    }
  }
}

///|
fn StackMachineFact::move_depth(self : StackMachineFact, delta : Int32) -> Unit {
  for (id, fact) in self.registers.to_array() {
    if fact.depth is Some(depth) {
      self.registers[id] = {
        ..fact,
        depth: if depth + delta >= 0 {
          Some(depth + delta)
        } else {
          None
        },
      }
    }
  }
}

///|
fn StackFlowPass::new(
  program : Program,
  knowledge : StackKnowledge,
) -> StackFlowPass {
  let universe = Set([EndOfInput])
  for symbol in 1..<=program.terminal_count {
    universe.add(Terminal(symbol))
  }
  {
    program,
    knowledge,
    universe,
    previous_symbols: Map([]),
    previous_initial: Set([]),
    read_above: Map([]),
  }
}

///|
fn StackEntryFact::machine(
  self : StackEntryFact,
  block : Block,
) -> StackMachineFact {
  let machine = StackMachineFact::{
    word: self.word.copy(),
    exact: self.exact,
    current: self.current.copy(),
    registers: Map([]),
    empty_token: self.empty_token,
    tokens: self.tokens.copy(),
  }
  for i, parameter in block.parameters {
    if parameter.type_ is State {
      machine.registers[parameter.id] = self.parameters[i]
    }
  }
  machine
}
