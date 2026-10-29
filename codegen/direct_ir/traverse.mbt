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

///|
fn Body::definitions(self : Body) -> Array[Register] {
  let result = []
  for instruction in self.instructions {
    result.append(instruction.definitions())
  }
  if self.terminator is CaseToken(arms, _) {
    for (pattern, _) in arms {
      result.append(pattern.definitions())
    }
  }
  for body in self.terminator.bodies() {
    result.append(body.definitions())
  }
  result
}

///|
fn Block::definitions(self : Block) -> Array[Register] {
  let body : Body = {
    instructions: self.instructions,
    terminator: self.terminator,
  }
  [..self.parameters, ..body.definitions()]
}

///|
pub fn Terminator::token_patterns(self : Terminator) -> Array[TokenPattern] {
  let result = match self {
    CaseToken(arms, _) => arms.map(p => p.0)
    _ => []
  }
  for body in self.bodies() {
    result.append(body.terminator.token_patterns())
  }
  result
}

///|
pub fn Terminator::can_stop(self : Terminator) -> Bool {
  self is Stop || self.bodies().any(b => b.terminator.can_stop())
}
