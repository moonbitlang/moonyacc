///|
/// Remove a save only when all continuations replace it or return without
/// observing it. This changes no parser effects or CFG edges.
fn Program::discard_unobserved_snapshots(
  self : Program,
) -> Program raise InvalidProgram {
  let live = self.snapshot_liveness()
  let blocks = self.blocks.map(block => {
    let body = Body::{
      instructions: block.instructions,
      terminator: block.terminator,
    }.prune_snapshots(live)
    { ..block, instructions: body.instructions, terminator: body.terminator, }
  })
  let program = Program::{ ..self, blocks, }
  program.validate()
  program
}

///|
fn Body::prune_snapshots(self : Body, live : SnapshotLiveness) -> Body {
  let points = live.points(self)
  let instructions = []
  for i, instruction in self.instructions {
    if instruction is SaveErrorSnapshot(_) && !points[i + 1] {
      continue
    }
    instructions.push(instruction)
  }
  let term = match self.terminator {
    CaseToken(arms, fallback) =>
      CaseToken(
        arms.map(p => (p.0, p.1.prune_snapshots(live))),
        fallback.prune_snapshots(live),
      )
    CaseState(value, arms) =>
      CaseState(value, arms.map(p => (p.0, p.1.prune_snapshots(live))))
    other => other
  }
  { instructions, terminator: term, }
}
