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
  let program = match optimization_level {
    O0 | O1 | O2 => {
      let program = self.simplify().inline_blocks(cautious=true)
      let program = program
        .commute_pushes(knowledge)
        .inline_blocks(cautious=false)
      program.prune_control(knowledge).discard_unobserved_snapshots()
    }
  }
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
