///|
fn StateSpecializer::body(
  self : StateSpecializer,
  body : Body,
  machine : StackMachineFact,
  path : Set[Int32],
  expansion : StateExpansion,
) -> Body raise InvalidProgram {
  let machine = machine.copy()
  for instruction in body.instructions {
    self.evaluator.instruction(instruction, machine)
  }
  let rest = match body.terminator {
    Jump(edge) => self.jump(edge, machine, path, expansion)
    CaseState(selector, arms) =>
      self.state_case(selector, arms, machine, path, expansion)
    CaseToken(arms, fallback) => {
      let remaining = machine.tokens.copy()
      let arms = arms.map(p => {
        let tokens = p.0.tokens()
        let selected = Set::from_iter(
          tokens.iter().filter(t => machine.tokens.contains(t)),
        )
        for token in tokens {
          remaining.remove(token)
        }
        (
          p.0,
          if selected.is_empty() {
            p.1
          } else {
            self.body(
              p.1,
              { ..machine, tokens: selected, empty_token: false, },
              path,
              expansion,
            )
          },
        )
      })
      let fallback = if remaining.is_empty() {
        fallback
      } else {
        self.body(fallback, { ..machine, tokens: remaining, }, path, expansion)
      }
      { instructions: [], terminator: CaseToken(arms, fallback), }
    }
    term => { instructions: [], terminator: term, }
  }
  append_body(body.instructions, rest)
}

///|
fn StateSpecializer::state_case(
  self : StateSpecializer,
  selector : Value,
  arms : Array[(Int32, Body)],
  machine : StackMachineFact,
  path : Set[Int32],
  expansion : StateExpansion,
) -> Body raise InvalidProgram {
  let fact = machine.value(selector)
  if fact.states.length() == 1 {
    let state = fact.states.iter().next().unwrap()
    guard arms.search_by(p => p.0 == state) is Some(index) else {
      raise InvalidProgram("state specialization selects a missing branch")
    }
    let body = arms[index].1
    if fact.depth is Some(_) && arms.any(p => p.1 != body) {
      expansion.savings += 1
    }
    return self.body(
      body,
      self.evaluator.state_branch(machine, selector, state).unwrap(),
      path,
      expansion,
    )
  }
  let arms = arms.map(p => {
    (
      p.0,
      match self.evaluator.state_branch(machine, selector, p.0) {
        None => p.1
        Some(branch) => self.body(p.1, branch, path, expansion)
      },
    )
  })
  { instructions: [], terminator: CaseState(selector, arms), }
}

///|
/// Retain only versions that remove a state decision, directly or through a
/// specialized successor. This is the analogue of Menhir's needed-state test
/// for our implicit current-state/stack ABI. Cycles without a benefit vanish.
fn StateSpecializer::discard_unproductive(self : StateSpecializer) -> Program {
  let reverse : Array[Array[Int32]] = Array::makei(self.blocks.length(), _ => [])
  for _, version in self.versions {
    for target in self.blocks[version.label].terminator.successors() {
      if target >= self.source.blocks.length() {
        reverse[target].push(version.label)
      }
    }
  }
  // A candidate depends on complete successor versions. Propagate an
  // interrupted expansion backward before deciding which closures are useful.
  let failed = self.incomplete.to_array()
  while failed.pop() is Some(label) {
    for previous in reverse[label] {
      if !self.incomplete.contains(previous) {
        self.incomplete.add(previous)
        failed.push(previous)
      }
    }
  }
  for label in self.incomplete {
    self.useful.remove(label)
  }
  let work = self.useful.to_array()
  while work.pop() is Some(label) {
    for previous in reverse[label] {
      if !self.incomplete.contains(previous) && !self.useful.contains(previous) {
        self.useful.add(previous)
        work.push(previous)
      }
    }
  }
  let originals : Map[Int32, Int32] = Map([])
  for _, version in self.versions {
    if !self.useful.contains(version.label) {
      originals[version.label] = version.original
    }
  }
  let blocks = self.blocks.map(block => {
    ..block,
    terminator: block.terminator.map_edges(edge => {
      ..edge,
      target: originals.get(edge.target).unwrap_or(edge.target),
    }),
  })
  { ..self.source, blocks, }
}
