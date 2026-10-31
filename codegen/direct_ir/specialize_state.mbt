///|
fn Program::specialize_state_with_budget(
  self : Program,
  knowledge : StackKnowledge,
  growth : Int32,
) -> Program raise InvalidProgram {
  self.validate()
  require(growth >= 0, "negative state-specialization budget")
  let pass = StateSpecializer::{
    source: self,
    flow: self.stack_flow(knowledge),
    evaluator: StackFlowPass::new(self, knowledge),
    supply: RegisterSupply::new(self),
    blocks: self.blocks.copy(),
    versions: Map([]),
    pending: [],
    useful: Set([]),
    remaining: growth,
  }
  fn transform(
    original : Int32,
    label : Int32,
    state : Int32?,
  ) -> Unit raise InvalidProgram {
    let block = pass.blocks[label]
    let machine = pass.entry(original, block, state?)
    let expansion = StateExpansion::{
      remaining: STATE_INLINE_GROWTH,
      useful: false,
    }
    let body = pass.body(
      { instructions: block.instructions, terminator: block.terminator, },
      machine,
      Set([original]),
      expansion,
    )
    pass.blocks[label] = {
      ..block,
      instructions: body.instructions,
      terminator: body.terminator,
    }
    if expansion.useful {
      pass.useful.add(label)
    }
  }
  for original, _ in self.blocks {
    if pass.flow.entries[original] is Some(_) {
      transform(original, original, None)
    }
  }
  // A monotone registry keys only original labels. Never compact labels or
  // specialize an already specialized copy while processing the worklist.
  for index = 0; index < pass.pending.length(); index = index + 1 {
    let version = pass.pending[index]
    transform(version.original, version.label, Some(version.state))
  }
  let program = pass.discard_unproductive()
  // Recompute from real entries, without assuming the recorded contexts.
  // This checks stack/selector synchronization and final entry types as well
  // as every surviving version's known-state precondition.
  check_state_versions(program, knowledge, pass.pending)
  program.compact()
}

///|
/// Bounded state specialization before cautious inlining and PUSH commutation.
/// Lexer/action/checkpoint operations remain in source order; every fallback
/// keeps the original general routine when no known state or budget exists.
pub fn Program::specialize_state(
  self : Program,
  knowledge : StackKnowledge,
) -> Program raise InvalidProgram {
  let size = self.blocks.fold(init=0, (n, b) => {
    n +
    b.parameters.length() +
    specialization_cost({
      instructions: b.instructions,
      terminator: b.terminator,
    })
  })
  self.specialize_state_with_budget(knowledge, size * 2)
}
