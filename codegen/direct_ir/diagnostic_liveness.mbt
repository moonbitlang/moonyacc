///|
/// Snapshot stores have no observable effect when there is no error exit.
/// Keep this observer decision in the IR, shared by all storage layouts.
fn Program::discard_unobserved_snapshots(self : Program) -> Program {
  if self.blocks.any(b => b.terminator.can_stop()) {
    return self
  }
  {
    ..self,
    blocks: self.blocks.map(b => {
      let body : Body = {
        instructions: b.instructions,
        terminator: b.terminator,
      }
      let body = body.without_snapshots()
      { ..b, instructions: body.instructions, terminator: body.terminator, }
    }),
  }
}

///|
fn Body::without_snapshots(self : Body) -> Body {
  let term = match self.terminator {
    CaseToken(arms, fallback) =>
      CaseToken(
        arms.map(p => (p.0, p.1.without_snapshots())),
        fallback.without_snapshots(),
      )
    CaseState(value, arms) =>
      CaseState(value, arms.map(p => (p.0, p.1.without_snapshots())))
    other => other
  }
  {
    instructions: self.instructions.filter(i => !(i is SaveErrorSnapshot(_))),
    terminator: term,
  }
}
