///|
priv struct RegisterPruner {
  program : Program
  demand : StorageDemand
}

///|
fn RegisterPruner::live(self : RegisterPruner, reg : Register) -> Bool {
  self.demand.registers.contains(reg.id)
}

///|
fn RegisterPruner::fields(self : RegisterPruner, cell : Cell) -> Array[Int32] {
  cell.fields
  .mapi((i, _) => i)
  .filter(i => {
    match cell.symbol {
      Some(symbol) => self.demand.fields[symbol].contains(cell.fields[i])
      None => true
    }
  })
}

///|
fn RegisterPruner::instruction(
  self : RegisterPruner,
  instruction : Instruction,
) -> Instruction? {
  match instruction {
    Bind(pairs) => {
      let pairs = pairs.filter(p => self.live(p.0))
      if pairs.is_empty() {
        None
      } else {
        Some(Bind(pairs))
      }
    }
    ReadPreviousPosition(_, reg) if !self.live(reg) => None
    Push(cell, values) => {
      let indices = self.fields(cell)
      Some(
        Push(
          { ..cell, fields: indices.map(i => cell.fields[i]), },
          indices.map(i => values[i]),
        ),
      )
    }
    Pop(cell, regs) | Peek(_, cell, regs) => {
      let indices = self.fields(cell)
      let cell = { ..cell, fields: indices.map(i => cell.fields[i]), }
      let regs = indices.map(i => {
        match regs[i] {
          Some(reg) if self.live(reg) => Some(reg)
          _ => None
        }
      })
      match instruction {
        Pop(_) => Some(Pop(cell, regs))
        Peek(depth, _, _) =>
          if regs.all(r => r is None) {
            None
          } else {
            Some(Peek(depth, cell, regs))
          }
        _ => abort("not a stack read")
      }
    }
    // Actions, lexer calls, consumption and snapshots remain effectful even
    // when they define no live register.
    _ => Some(instruction)
  }
}

///|
fn RegisterPruner::body(self : RegisterPruner, body : Body) -> Body {
  let terminator = match body.terminator {
    Jump(edge) => {
      let parameters = self.program.blocks[edge.target].parameters
      Jump({
        ..edge,
        arguments: edge.arguments
        .mapi((i, value) => (i, value))
        .filter_map(p => {
          if self.live(parameters[p.0]) {
            Some(p.1)
          } else {
            None
          }
        }),
      })
    }
    CaseToken(arms, fallback) =>
      CaseToken(
        arms.map(p => {
          let pattern = if p.0.definitions().all(r => !self.live(r)) {
            Tokens(p.0.tokens())
          } else {
            p.0
          }
          (pattern, self.body(p.1))
        }),
        self.body(fallback),
      )
    CaseState(value, arms) =>
      CaseState(value, arms.map(p => (p.0, self.body(p.1))))
    term => term
  }
  {
    instructions: body.instructions.filter_map(i => self.instruction(i)),
    terminator,
  }
}

///|
/// Prune definitions and their uses together, using the same demand fixed
/// point as emission. Logical state fields and stack depth remain unchanged.
pub fn Program::prune_registers(
  self : Program,
  knowledge : StackKnowledge,
  positions~ : Bool,
) -> Program raise InvalidProgram {
  self.validate()
  let flow = self.stack_flow(knowledge)
  let pruner = RegisterPruner::{
    program: self,
    demand: self.storage_demand(flow, positions~),
  }
  let blocks = self.blocks.map(block => {
    let body = pruner.body({
      instructions: block.instructions,
      terminator: block.terminator,
    })
    {
      ..block,
      parameters: block.parameters.filter(r => pruner.live(r)),
      instructions: body.instructions,
      terminator: body.terminator,
    }
  })
  let program = Program::{ ..self, blocks, }
  program.validate()
  program
}
