///|
/// Only control-flow labels are mapped here. LR states in CaseState patterns,
/// constants, diagnostics and provenance belong to a separate namespace.
fn Terminator::map_edges(
  self : Terminator,
  f : (Edge) -> Edge raise?,
) -> Terminator raise? {
  match self {
    Jump(edge) => Jump(f(edge))
    CaseToken(arms, fallback) =>
      CaseToken(arms.map(p => (p.0, p.1.map_edges(f))), fallback.map_edges(f))
    CaseState(value, arms) =>
      CaseState(value, arms.map(p => (p.0, p.1.map_edges(f))))
    Return(_) | Stop | Unreachable => self
  }
}

///|
fn Body::map_edges(self : Body, f : (Edge) -> Edge raise?) -> Body raise? {
  { ..self, terminator: self.terminator.map_edges(f), }
}

///|
fn Terminator::successors(self : Terminator) -> Array[Int32] {
  match self {
    Jump(edge) => [edge.target]
    CaseToken(arms, fallback) => {
      let targets = []
      for (_, body) in arms {
        targets.append(body.terminator.successors())
      }
      targets.append(fallback.terminator.successors())
      targets
    }
    CaseState(_, arms) => {
      let targets = []
      for (_, body) in arms {
        targets.append(body.terminator.successors())
      }
      targets
    }
    Return(_) | Stop | Unreachable => []
  }
}
