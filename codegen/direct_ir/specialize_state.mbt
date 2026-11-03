///|
pub fn Program::state_specializations(
  self : Program,
  knowledge : StackKnowledge,
) -> StateSpecializations raise InvalidProgram {
  self.validate()
  let pass = StateSpecializer::{
    source: self,
    flow: self.stack_flow(knowledge),
    evaluator: StackFlowPass::new(self, knowledge),
    supply: RegisterSupply::new(self),
    blocks: self.blocks.copy(),
    versions: Map([]),
    pending: [],
    useful: Set([]),
    savings: Map([]),
    incomplete: Set([]),
    requests: Map([]),
    owner: 0,
  }
  fn transform(
    original : Int32,
    label : Int32,
    state : Int32?,
  ) -> Unit raise InvalidProgram {
    let block = pass.blocks[label]
    pass.owner = label
    let machine = pass.entry(original, block, state?)
    let expansion = StateExpansion::{
      remaining: STATE_INLINE_GROWTH,
      savings: 0,
      complete: true,
    }
    let body = pass.body(
      { instructions: block.instructions, terminator: block.terminator, },
      machine,
      Set([original]),
      expansion,
    )
    if expansion.complete {
      pass.blocks[label] = {
        ..block,
        instructions: body.instructions,
        terminator: body.terminator,
      }
      if expansion.savings > 0 {
        pass.useful.add(label)
        pass.savings[label] = expansion.savings
      }
    } else {
      pass.incomplete.add(label)
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
  check_state_versions(program, knowledge, pass.pending)
  StateSpecializations::new(
    self,
    program,
    pass.pending,
    pass.useful,
    pass.requests,
    pass.savings,
  )
}

///|
fn Program::specialize_state_with_budget(
  self : Program,
  knowledge : StackKnowledge,
  growth : Int32,
) -> Program raise InvalidProgram {
  require(growth >= 0, "negative state-specialization budget")
  let plan = self.state_specializations(knowledge)
  let selected = plan.within_growth(plan.candidates(), growth)
  plan.apply(selected, knowledge)
}

///|
/// Target-independent admission of complete dependency closures. The MoonBit
/// emitter additionally assesses cleaned CFGs and their structured layouts.
pub fn Program::specialize_state(
  self : Program,
  knowledge : StackKnowledge,
) -> Program raise InvalidProgram {
  let size = self.specialization_size()
  self.specialize_state_with_budget(knowledge, size * 2)
}
