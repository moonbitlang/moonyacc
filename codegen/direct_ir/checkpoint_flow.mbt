///|
/// None entries are unreachable in the syntactic CFG. Emitter queries for
/// such blocks receive an unknown fact, never an optimization permission.
pub struct CheckpointFlow {
  entries : Array[CheckpointFact?]
}

///|
pub fn CheckpointFlow::entry(
  self : CheckpointFlow,
  label : Int32,
) -> CheckpointFact {
  self.entries[label].unwrap_or(CheckpointFact::unknown())
}

///|
fn Body::checkpoint_edges(
  self : Body,
  entry : CheckpointFact,
  visit : (Int32, CheckpointFact) -> Unit raise?,
) -> Unit raise? {
  let after = entry.after(self.instructions)
  if self.terminator is Jump(edge) {
    visit(edge.target, after)
  }
  for branch in self.terminator.bodies() {
    branch.checkpoint_edges(after, visit)
  }
}

///|
/// Joins only weaken bounds. Positive pop cycles reach unknown; negative
/// push cycles cannot make a join stronger. No unrolling limit is needed.
pub fn Program::checkpoint_flow(
  self : Program,
) -> CheckpointFlow raise InvalidProgram {
  self.validate()
  let entries : Array[CheckpointFact?] = Array::make(self.blocks.length(), None)
  let queued = Array::make(self.blocks.length(), false)
  let work = []
  fn offer(label : Int32, incoming : CheckpointFact) {
    let updated = match entries[label] {
      None => incoming
      Some(previous) => {
        if previous.covers(incoming) {
          return
        }
        previous.join(incoming)
      }
    }
    entries[label] = Some(updated)
    if !queued[label] {
      queued[label] = true
      work.push(label)
    }
  }
  for entry in self.entries {
    offer(entry.block, CheckpointFact::initial())
  }
  while work.pop() is Some(label) {
    queued[label] = false
    let block = self.blocks[label]
    let body : Body = {
      instructions: block.instructions,
      terminator: block.terminator,
    }
    body.checkpoint_edges(entries[label].unwrap(), offer)
  }
  let flow = CheckpointFlow::{ entries, }
  flow.validate(self)
  flow
}

///|
/// Check inductiveness independently of the worklist algorithm: the initial
/// state and every outgoing edge must satisfy the destination's claimed bound.
/// This is checked for the final CFG, before any storage/emission planning.
pub fn CheckpointFlow::validate(
  self : CheckpointFlow,
  program : Program,
) -> Unit raise InvalidProgram {
  require(
    self.entries.length() == program.blocks.length(),
    "checkpoint fact count mismatch",
  )
  for entry in self.entries {
    if entry is Some({ upper: Some(bound), }) {
      require(bound <= 0, "invalid finite checkpoint bound")
    }
  }
  fn check_edge(
    target : Int32,
    incoming : CheckpointFact,
  ) -> Unit raise InvalidProgram {
    require(
      target >= 0 && target < self.entries.length(),
      "invalid checkpoint edge",
    )
    guard self.entries[target] is Some(claim) else {
      raise InvalidProgram("reachable block lacks a checkpoint fact")
    }
    require(claim.covers(incoming), "checkpoint entry bound is not proved")
  }
  for entry in program.entries {
    check_edge(entry.block, CheckpointFact::initial())
  }
  for label, block in program.blocks {
    if self.entries[label] is Some(entry) {
      let body : Body = {
        instructions: block.instructions,
        terminator: block.terminator,
      }
      body.checkpoint_edges(entry, check_edge)
    }
  }
}

///|
fn Body::any_checkpoint_push(
  self : Body,
  initial : CheckpointFact,
  predicate : (CheckpointFact) -> Bool,
) -> Bool {
  let mut fact = initial
  for instruction in self.instructions {
    if instruction is Push(_) && predicate(fact) {
      return true
    }
    fact = fact.step(instruction)
  }
  self.terminator
  .bodies()
  .any(branch => branch.any_checkpoint_push(fact, predicate))
}

///|
fn CheckpointFlow::any_push(
  self : CheckpointFlow,
  program : Program,
  predicate : (CheckpointFact) -> Bool,
) -> Bool {
  program.blocks
  .mapi((label, block) => {
    let body : Body = {
      instructions: block.instructions,
      terminator: block.terminator,
    }
    body.any_checkpoint_push(self.entry(label), predicate)
  })
  .any(x => x)
}

///|
pub fn CheckpointFlow::requires_journal(
  self : CheckpointFlow,
  program : Program,
) -> Bool {
  self.any_push(program, fact => !fact.no_overlap())
}

///|
pub fn CheckpointFlow::has_unprotected_push(
  self : CheckpointFlow,
  program : Program,
) -> Bool {
  self.any_push(program, fact => fact.no_overlap())
}
