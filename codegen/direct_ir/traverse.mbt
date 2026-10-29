///|
pub fn Terminator::bodies(self : Terminator) -> Array[Body] {
  match self {
    CaseToken(arms, fallback) => [..arms.map(p => p.1), fallback]
    CaseState(_, arms) => arms.map(p => p.1)
    _ => []
  }
}

///|
fn collect_instructions(
  instructions : Array[Instruction],
  terminator : Terminator,
  result : Array[Instruction],
) -> Unit {
  result.append(instructions)
  for body in terminator.bodies() {
    collect_instructions(body.instructions, body.terminator, result)
  }
}

///|
/// Structural traversal, including mutually exclusive branch bodies.
pub fn Block::all_instructions(self : Block) -> Array[Instruction] {
  let result = []
  collect_instructions(self.instructions, self.terminator, result)
  result
}

///|
pub fn Body::all_instructions(self : Body) -> Array[Instruction] {
  let result = []
  collect_instructions(self.instructions, self.terminator, result)
  result
}
