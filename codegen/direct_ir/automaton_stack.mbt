// Stack suffix and predecessor analyses adapted from Menhir's StackSymbols and
// StackStates (Inria, GPL-2.0-only). The grammar and resolved LR automaton remain
// the authority; no generated-code shape or state numbering is assumed.

///|
pub(all) struct StackCellFact {
  symbol : Int32
  predecessors : Set[Int32]
}

///|
pub(all) struct StackKnowledge {
  transitions : Array[Array[(Int32, Int32)]]
  short : Array[Array[StackCellFact]]
  long : Array[Array[StackCellFact]]
  production_sites : Array[Array[Int32]]
  entry_origins : Array[Set[Int32]]
}

///|
fn common_suffix(left : Array[Int32], right : Array[Int32]) -> Array[Int32] {
  let limit = Int32::min(left.length(), right.length())
  let mut count = 0
  while count < limit &&
        left[left.length() - count - 1] == right[right.length() - count - 1] {
    count += 1
  }
  left[left.length() - count:].to_owned()
}

///|
/// The least fixed point is the longest suffix common to all paths from real
/// entries. Root [] is distinct from an unreachable node (None).
fn long_stack_symbols(
  transitions : Array[Array[(Int32, Int32)]],
  roots : Array[Int32],
) -> Array[Array[Int32]] {
  let words : Array[Array[Int32]?] = Array::make(transitions.length(), None)
  let pending = []
  let queued = Array::make(transitions.length(), false)
  fn contribute(target : Int32, word : Array[Int32]) {
    let next = match words[target] {
      None => word
      Some(previous) => common_suffix(previous, word)
    }
    if words[target] != Some(next) {
      words[target] = Some(next)
      if !queued[target] {
        queued[target] = true
        pending.push(target)
      }
    }
  }
  for root in roots {
    contribute(root, [])
  }
  while pending.pop() is Some(source) {
    queued[source] = false
    let prefix = words[source].unwrap()
    for (symbol, target) in transitions[source] {
      contribute(target, [..prefix, symbol])
    }
  }
  words.map(word => word.unwrap_or([]))
}

///|
fn extend_states(target : Set[Int32], source : Set[Int32]) -> Bool {
  let before = target.length()
  for state in source {
    target.add(state)
  }
  target.length() != before
}

///|
/// Cell-wise reachability: a source state seeds the newest target cell, and an
/// existing cell flows one position deeper along every automaton transition.
fn stack_predecessors(
  transitions : Array[Array[(Int32, Int32)]],
  words : Array[Array[Int32]],
) -> Array[Array[StackCellFact]] {
  let cells : Array[Array[Set[Int32]]] = words.map(w => {
    Array::makei(w.length(), _ => Set([]))
  })
  let queued = words.map(w => Array::make(w.length(), false))
  let pending = []
  fn enqueue(state : Int32, depth : Int32) {
    if !queued[state][depth] {
      queued[state][depth] = true
      pending.push((state, depth))
    }
  }
  for source, edges in transitions {
    for (_, target) in edges {
      guard !cells[target].is_empty() else { continue }
      cells[target][0].add(source)
      enqueue(target, 0)
    }
  }
  while pending.pop() is Some((source, depth)) {
    queued[source][depth] = false
    for (_, target) in transitions[source] {
      if depth + 1 < cells[target].length() &&
        extend_states(cells[target][depth + 1], cells[source][depth]) {
        enqueue(target, depth + 1)
      }
    }
  }
  words.mapi((state, symbols) => {
    symbols.mapi((i, symbol) => {
      symbol,
      predecessors: cells[state][symbols.length() - i - 1],
    })
  })
}

///|
fn automaton_origins(
  transitions : Array[Array[(Int32, Int32)]],
  roots : Array[Int32],
) -> Array[Set[Int32]] {
  let origins : Array[Set[Int32]] = Array::makei(transitions.length(), _ => {
    Set([])
  })
  let pending = []
  for entry, root in roots {
    origins[root].add(entry)
    pending.push(root)
  }
  while pending.pop() is Some(source) {
    for (_, target) in transitions[source] {
      if extend_states(origins[target], origins[source]) {
        pending.push(target)
      }
    }
  }
  origins
}

///|
pub fn analyze_stack(
  grammar : @grm.Grammar,
  automaton : @lr1.Automaton,
) -> StackKnowledge {
  let terminal_count = grammar.terminals.length()
  let transitions : Array[Array[(Int32, Int32)]] = Array::makei(
    automaton.states.length(),
    _ => [],
  )
  for state in automaton.states {
    transitions[state.num] = state.goto
      .iter()
      .map(pair => (symbol_id(pair.0, terminal_count), pair.1.num))
      .to_array()
  }
  let roots = automaton.starts.map(p => p.1.num)
  let short : Array[Array[Int32]] = Array::makei(automaton.states.length(), _ => {
    []
  })
  for state in automaton.states {
    let mut word = []
    for item in state.iter_item_groups() {
      if item.core.dot > word.length() {
        word = item.core.production.rhs[:item.core.dot].map(s => {
          symbol_id(s, terminal_count)
        })
      }
    }
    short[state.num] = word
  }
  let long = long_stack_symbols(transitions, roots)
  let sites : Array[Set[Int32]] = Array::makei(grammar.productions.length(), _ => {
    Set([])
  })
  for state in automaton.states {
    for (_, decision) in state.action {
      match decision {
        Reduce(production) => sites[production.num].add(state.num)
        Accept =>
          for item in state.iter_item_groups() {
            if item.core.dot == item.core.production.rhs.length() &&
              grammar.starts.contains(item.core.production) {
              sites[item.core.production.num].add(state.num)
            }
          }
        _ => ()
      }
    }
  }
  {
    transitions,
    short: stack_predecessors(transitions, short),
    long: stack_predecessors(transitions, long),
    production_sites: sites.map(states => states.to_array()),
    entry_origins: automaton_origins(transitions, roots),
  }
}
