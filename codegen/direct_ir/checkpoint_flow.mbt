///|
/// None entries are unreachable in the syntactic CFG. Emitter queries for
/// such blocks receive an unknown fact, never an optimization permission.
pub struct CheckpointFlow {
  entries : Array[CheckpointFact?]
  liveness : SnapshotLiveness
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
  liveness : SnapshotLiveness,
  visit : (Int32, CheckpointFact) -> Unit raise?,
) -> Unit raise? {
  let points = liveness.points(self)
  let mut after = entry
  for i, instruction in self.instructions {
    after = after.step(instruction, preserve=points[i + 1])
  }
  if self.terminator is Jump(edge) {
    visit(edge.target, after)
  }
  for branch in self.terminator.bodies() {
    branch.checkpoint_edges(after, liveness, visit)
  }
}

///|
/// Joins only weaken bounds. Positive pop cycles reach unknown; negative
/// push cycles cannot make a join stronger. No unrolling limit is needed.
pub fn Program::checkpoint_flow(
  self : Program,
) -> CheckpointFlow raise InvalidProgram {
  self.validate()
  let liveness = self.snapshot_liveness()
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
    body.checkpoint_edges(entries[label].unwrap(), liveness, offer)
  }
  let flow = CheckpointFlow::{ entries, liveness, }
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
  self.liveness.validate(program)
  require(
    self.entries.length() == program.blocks.length(),
    "checkpoint fact count mismatch",
  )
  for entry in self.entries {
    if entry is Some({ upper: Some(bound), .. }) {
      require(bound <= 0, "invalid finite checkpoint bound")
    }
    if entry is Some(fact) && fact.current {
      require(
        fact.valid && fact.upper == Some(0),
        "invalid current-prefix fact",
      )
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
      body.checkpoint_validity(entry, self.liveness)
      body.checkpoint_edges(entry, self.liveness, check_edge)
    }
  }
}

///|
fn Body::any_checkpoint_operation(
  self : Body,
  initial : CheckpointFact,
  liveness : SnapshotLiveness,
  predicate : (Instruction, CheckpointFact, Bool) -> Bool,
) -> Bool {
  let mut fact = initial
  let points = liveness.points(self)
  for i, instruction in self.instructions {
    if predicate(instruction, fact, points[i + 1]) {
      return true
    }
    fact = fact.step(instruction, preserve=points[i + 1])
  }
  self.terminator
  .bodies()
  .any(branch => branch.any_checkpoint_operation(fact, liveness, predicate))
}

///|
fn CheckpointFlow::any_operation(
  self : CheckpointFlow,
  program : Program,
  predicate : (Instruction, CheckpointFact, Bool) -> Bool,
) -> Bool {
  program.blocks
  .mapi((label, block) => {
    let body : Body = {
      instructions: block.instructions,
      terminator: block.terminator,
    }
    body.any_checkpoint_operation(self.entry(label), self.liveness, predicate)
  })
  .any(x => x)
}

///|
pub fn CheckpointFlow::requires_journal(
  self : CheckpointFlow,
  program : Program,
) -> Bool {
  self.any_operation(program, (instruction, fact, live) => {
    instruction is Push(_) && fact.needs_journal(preserve=live)
  })
}

///|
pub fn CheckpointFlow::has_unprotected_push(
  self : CheckpointFlow,
  program : Program,
) -> Bool {
  self.any_operation(program, (instruction, fact, live) => {
    instruction is Push(_) && !fact.needs_journal(preserve=live)
  })
}

///|
pub fn CheckpointFlow::requires_save(
  self : CheckpointFlow,
  program : Program,
) -> Bool {
  self.any_operation(program, (instruction, fact, _) => {
    instruction is SaveErrorSnapshot(_) && !fact.current
  })
}

///|
fn Body::checkpoint_validity(
  self : Body,
  initial : CheckpointFact,
  liveness : SnapshotLiveness,
) -> Unit raise InvalidProgram {
  let points = liveness.points(self)
  let mut fact = initial
  for i, instruction in self.instructions {
    require(
      !points[i] || fact.valid,
      "observable snapshot has been invalidated",
    )
    fact = fact.step(instruction, preserve=points[i + 1])
  }
  require(
    !points[self.instructions.length()] || fact.valid,
    "error continuation lacks a valid snapshot",
  )
  for branch in self.terminator.bodies() {
    branch.checkpoint_validity(fact, liveness)
  }
}
