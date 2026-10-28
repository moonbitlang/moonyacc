///|
/// Outer None means unreachable; an inner None is an unknown state on a
/// reachable path. Only real parser entries seed this analysis. In particular,
/// specialization claims must never be used to seed their own proof.
fn Program::state_flow(self : Program) -> Array[StateEntry?] {
  let incoming : Array[StateEntry?] = Array::make(self.blocks.length(), None)
  let queued = Array::make(self.blocks.length(), false)
  let pending = []
  fn propagate(label : Int32, entry : StateEntry) {
    let previous = incoming[label]
    let next = match previous {
      None => entry
      Some(previous) => previous.join(entry)
    }
    if previous != Some(next) {
      incoming[label] = Some(next)
      if !queued[label] {
        queued[label] = true
        pending.push(label)
      }
    }
  }
  for entry in self.entries {
    propagate(entry.block, {
      window: { current: Some(entry.state), predecessor: None, },
      parameters: [],
    })
  }
  while pending.pop() is Some(label) {
    queued[label] = false
    guard! incoming[label] is Some(entry)
    let block = self.blocks[label]
    let exit = state_exit(block, entry)
    fn edge(edge : Edge) {
      propagate(edge.target, exit.edge(edge))
    }
    match block.terminator {
      Jump(target) => edge(target)
      CaseToken(arms, fallback) => {
        for (_, target) in arms {
          edge(target)
        }
        edge(fallback)
      }
      CaseState(selector, arms) =>
        for (state, target) in arms {
          match exit.value(selector) {
            Some(known) => if state == known { edge(target) }
            None => edge(target)
          }
        }
      Return(_) | Stop(_) | Unreachable => ()
    }
  }
  incoming
}
