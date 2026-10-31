///|
/// On a stack-checked program these instructions have no observable effect
/// before Stop: diagnostics read the last snapshot, not the current stack.
/// Snapshot, action and input operations are deliberately barriers.
fn Instruction::discardable_before_stop(self : Instruction) -> Bool {
  self
  is (Push(_)
  | Pop(_)
  | Peek(_)
  | Bind(_)
  | ReadPreviousPosition(_)
  | RefineLookahead(_))
}

///|
/// Least fixed point of finite, straight-line paths ending at Stop. Pure
/// forwarding cycles are not terminating paths and must never become Stop.
fn Program::stop_blocks(self : Program) -> Array[Bool] {
  let stops = Array::make(self.blocks.length(), false)
  let predecessors = Array::makei(self.blocks.length(), _ => [])
  let pending = []
  for label, block in self.blocks {
    if !block.instructions.all(i => i.discardable_before_stop()) {
      continue
    }
    match block.terminator {
      Stop => {
        stops[label] = true
        pending.push(label)
      }
      Jump(edge) => predecessors[edge.target].push(label)
      _ => ()
    }
  }
  while pending.pop() is Some(target) {
    for source in predecessors[target] {
      if !stops[source] {
        stops[source] = true
        pending.push(source)
      }
    }
  }
  stops
}

///|
fn Body::stop_earlier(self : Body, stops : Array[Bool]) -> Body {
  let term = match self.terminator {
    CaseToken(arms, fallback) =>
      CaseToken(
        arms.map(p => (p.0, p.1.stop_earlier(stops))),
        fallback.stop_earlier(stops),
      )
    CaseState(value, arms) =>
      CaseState(value, arms.map(p => (p.0, p.1.stop_earlier(stops))))
    Jump(edge) if stops[edge.target] => Stop
    other => other
  }
  let mut count = self.instructions.length()
  if term is Stop {
    while count > 0 && self.instructions[count - 1].discardable_before_stop() {
      count -= 1
    }
  }
  { instructions: self.instructions[:count].to_owned(), terminator: term, }
}

///|
fn Terminator::stop_count(self : Terminator) -> Int32 {
  (if self is Stop { 1 } else { 0 }) +
  self.bodies().fold(init=0, (n, body) => n + body.terminator.stop_count())
}

///|
fn Body::share_stop(self : Body, label : Int32) -> Body {
  let terminator = match self.terminator {
    Stop => Jump(edge(label))
    CaseToken(arms, fallback) =>
      CaseToken(
        arms.map(p => (p.0, p.1.share_stop(label))),
        fallback.share_stop(label),
      )
    CaseState(value, arms) =>
      CaseState(value, arms.map(p => (p.0, p.1.share_stop(label))))
    term => term
  }
  { ..self, terminator, }
}

///|
/// Our error exit computes expected tokens. Preserve sharing after propagation
/// instead of duplicating that cold body at every newly exposed Stop.
fn Program::share_stop(self : Program) -> Program {
  if self.blocks.fold(init=0, (n, b) => n + b.terminator.stop_count()) <= 1 {
    return self
  }
  let label = self.blocks.length()
  let blocks = self.blocks.map(block => {
    let body = Body::{
      instructions: block.instructions,
      terminator: block.terminator,
    }.share_stop(label)
    { ..block, instructions: body.instructions, terminator: body.terminator, }
  })
  blocks.push({
    origin: Helper,
    hint: NoHint,
    parameters: [],
    lookahead: Present,
    instructions: [],
    terminator: Stop,
  })
  Program::{ ..self, blocks, }.simplify()
}

///|
/// Menhir's StopEarlier, with explicit snapshot/input/action barriers. Check
/// stack accesses before deleting them, so malformed IR is never legitimized.
pub fn Program::stop_earlier(
  self : Program,
  knowledge : StackKnowledge,
) -> Program raise InvalidProgram {
  self.validate()
  ignore(self.stack_flow(knowledge))
  let stops = self.stop_blocks()
  let blocks = self.blocks.map(block => {
    let body = Body::{
      instructions: block.instructions,
      terminator: block.terminator,
    }.stop_earlier(stops)
    { ..block, instructions: body.instructions, terminator: body.terminator, }
  })
  let program = Program::{ ..self, blocks, }.compact().share_stop()
  program.validate()
  program
}
