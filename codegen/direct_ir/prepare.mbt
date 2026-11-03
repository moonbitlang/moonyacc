///|
/// The emission boundary owns one program and the proofs computed for that
/// exact program. Transformations must finish before storage is planned.
pub struct PreparedProgram {
  program : Program
  flow : StackFlow
  demand : StorageDemand
  checkpoints : CheckpointFlow
}

///|
pub fn Program::prepare(
  self : Program,
  knowledge : StackKnowledge,
  positions~ : Bool,
  optimization_level~ : @codegen.OptimizationLevel = O1,
) -> PreparedProgram raise InvalidProgram {
  self.validate()
  ignore(self.stack_flow(knowledge))
  let program = self.simplify()
  let program = match optimization_level {
    O2 => program.specialize_state(knowledge)
    O0 | O1 => program
  }
  program.prepare_cleanup(knowledge, positions~)
}

///|
// Called only after checking the input program. Every transforming pass keeps
// its own checker, and prepare_emission derives fresh facts for the result.
fn Program::prepare_cleanup(
  self : Program,
  knowledge : StackKnowledge,
  positions~ : Bool,
) -> PreparedProgram raise InvalidProgram {
  let program = {
    let program = self.inline_blocks(cautious=true)
    let program = program.commute_pushes(knowledge).prune_control(knowledge)
    // Reachability first narrows demand; dead bindings then expose token
    // cases that no longer need a match. Final inlining sees the pruned CFG.
    let program = program
      .prune_registers(knowledge, positions~)
      .prune_control(knowledge)
      .stop_earlier(knowledge)
      .inline_blocks(cautious=false)
      .discard_unobserved_snapshots()
    program.prune_registers(knowledge, positions~)
  }
  program.prepare_emission(knowledge, positions~)
}

///|
/// Recompute every storage proof after a checked CFG transformation. Layout
/// trials must never reuse facts or register demands from the previous graph.
pub fn Program::prepare_emission(
  self : Program,
  knowledge : StackKnowledge,
  positions~ : Bool,
) -> PreparedProgram raise InvalidProgram {
  self.validate()
  let program = self
  let flow = program.stack_flow(knowledge)
  let demand = program.storage_demand(flow, positions~)
  let checkpoints = program.checkpoint_flow()
  for block in program.blocks {
    for instruction in block.all_instructions() {
      if instruction is Push(cell, _) {
        for field in demand.fields[cell.symbol.unwrap()] {
          require(
            cell.fields.contains(field),
            "pushed cell lacks a demanded field",
          )
        }
      }
    }
  }
  { program, flow, demand, checkpoints, }
}
