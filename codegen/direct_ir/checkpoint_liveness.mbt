///|
/// Whether the current snapshot may reach Stop before being replaced. Actions
/// and lexer calls do not receive this parser's private diagnostic snapshot;
/// their own effects stay in order. Return and Unreachable do not observe it.
pub struct SnapshotLiveness {
  entries : Array[Bool]
}

///|
fn SnapshotLiveness::terminator(
  self : SnapshotLiveness,
  term : Terminator,
) -> Bool {
  match term {
    Stop => true
    Return(_) | Unreachable => false
    Jump(edge) => self.entries[edge.target]
    CaseToken(arms, fallback) =>
      self.before(fallback) || arms.any(p => self.before(p.1))
    CaseState(_, arms) => arms.any(p => self.before(p.1))
  }
}

///|
fn SnapshotLiveness::before(self : SnapshotLiveness, body : Body) -> Bool {
  if body.instructions.any(i => i is SaveErrorSnapshot(_)) {
    false
  } else {
    self.terminator(body.terminator)
  }
}

///|
/// Instruction-boundary facts: index i is before instruction i, and the last
/// element is before the terminator. Save kills the previous snapshot only.
pub fn SnapshotLiveness::points(
  self : SnapshotLiveness,
  body : Body,
) -> Array[Bool] {
  let points = Array::make(body.instructions.length() + 1, false)
  let mut live = self.terminator(body.terminator)
  points[body.instructions.length()] = live
  for i = body.instructions.length() - 1; i >= 0; i = i - 1 {
    if body.instructions[i] is SaveErrorSnapshot(_) {
      live = false
    }
    points[i] = live
  }
  points
}

///|
pub fn Program::snapshot_liveness(
  self : Program,
) -> SnapshotLiveness raise InvalidProgram {
  self.validate()
  let entries = Array::make(self.blocks.length(), false)
  let predecessors = Array::makei(self.blocks.length(), _ => [])
  for label, block in self.blocks {
    for target in block.terminator.successors() {
      predecessors[target].push(label)
    }
  }
  let flow = SnapshotLiveness::{ entries, }
  let work = self.blocks.mapi((i, _) => i)
  let queued = Array::make(self.blocks.length(), true)
  while work.pop() is Some(label) {
    queued[label] = false
    let block = self.blocks[label]
    if !entries[label] &&
      flow.before({
        instructions: block.instructions,
        terminator: block.terminator,
      }) {
      entries[label] = true
      for previous in predecessors[label] {
        if !queued[previous] {
          queued[previous] = true
          work.push(previous)
        }
      }
    }
  }
  flow.validate(self)
  flow
}

///|
/// Independently check the may-analysis post-fixed point. A conservative true
/// may lose an optimization; an unproved false could lose an error snapshot.
pub fn SnapshotLiveness::validate(
  self : SnapshotLiveness,
  program : Program,
) -> Unit raise InvalidProgram {
  require(
    self.entries.length() == program.blocks.length(),
    "snapshot liveness count mismatch",
  )
  for label, block in program.blocks {
    require(
      !self.before({
        instructions: block.instructions,
        terminator: block.terminator,
      }) ||
      self.entries[label],
      "snapshot liveness misses an observable path",
    )
  }
}
