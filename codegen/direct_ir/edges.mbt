///|
/// Only control-flow labels are mapped here. LR states in CaseState patterns,
/// constants, diagnostics and provenance belong to a separate namespace.
fn Terminator::map_edges(self : Terminator, f : (Edge) -> Edge) -> Terminator {
  match self {
    Jump(edge) => Jump(f(edge))
    CaseToken(arms, fallback) =>
      CaseToken(arms.map(p => (p.0, f(p.1))), f(fallback))
    CaseState(value, arms) => CaseState(value, arms.map(p => (p.0, f(p.1))))
    Return(_) | Stop(_) | Unreachable => self
  }
}

///|
fn Terminator::successors(self : Terminator) -> Array[Int32] {
  match self {
    Jump(edge) => [edge.target]
    CaseToken(arms, fallback) => {
      let targets = arms.map(p => p.1.target)
      targets.push(fallback.target)
      targets
    }
    CaseState(_, arms) => arms.map(p => p.1.target)
    Return(_) | Stop(_) | Unreachable => []
  }
}
