///|
priv struct ContinuationDuplicator {
  targets : Map[Int32, Block]
  supply : RegisterSupply
}

///|
/// Each surviving block keeps its original label for cost estimation. This
/// mapping describes provenance only; it carries no reusable storage proofs.
pub struct DuplicatedContinuations {
  program : Program
  sources : Array[Int32]
}

///|
fn ContinuationDuplicator::body(
  self : ContinuationDuplicator,
  body : Body,
  names : Map[Int32, Register],
  changed : Ref[Bool],
) -> Body {
  match body.terminator {
    Jump(edge) if self.targets.get(edge.target) is Some(target) => {
      changed.val = true
      let copy = self.supply.clone_block(target)
      let originals = target.definitions()
      for i, reg in copy.definitions() {
        names[reg.id] = originals[i]
      }
      {
        instructions: [
          ..body.instructions,
          Bind(copy.parameters.mapi((i, p) => (p, edge.arguments[i]))),
          ..copy.instructions,
        ],
        terminator: copy.terminator,
      }
    }
    CaseToken(arms, fallback) =>
      {
        ..body,
        terminator: CaseToken(
          arms.map(p => (p.0, self.body(p.1, names, changed))),
          self.body(fallback, names, changed),
        ),
      }
    CaseState(value, arms) =>
      {
        ..body,
        terminator: CaseState(
          value,
          arms.map(p => (p.0, self.body(p.1, names, changed))),
        ),
      }
    _ => body
  }
}

///|
/// Inline independent continuations at all incoming edges, including branch
/// terminators. Selected blocks may not jump to another selected block.
/// The caller owns the code-growth/layout policy. Fresh SSA definitions avoid
/// collisions; the symbolic checker separately executes each original call
/// and compares stack, lexer/action/snapshot events and outgoing arguments.
pub fn Program::duplicate_continuations(
  self : Program,
  labels : Array[Int32],
) -> DuplicatedContinuations raise InvalidProgram {
  self.validate()
  let selected = Set(labels)
  require(selected.length() == labels.length(), "duplicate continuation label")
  let targets = Map([])
  for label in labels {
    require(
      label >= 0 && label < self.blocks.length(),
      "invalid continuation label",
    )
    require(
      !self.entries.any(e => e.block == label),
      "cannot duplicate a public entry",
    )
    let target = self.blocks[label]
    require(
      target.terminator.successors().all(next => !selected.contains(next)),
      "continuations must be independent and nonrecursive",
    )
    targets[label] = target
  }
  let pass = ContinuationDuplicator::{
    targets,
    supply: RegisterSupply::new(self),
  }
  let blocks = self.blocks.map(block => {
    let names = Map([])
    let changed = Ref(false)
    let body = pass.body(
      { instructions: block.instructions, terminator: block.terminator, },
      names,
      changed,
    )
    let after = {
      ..block,
      instructions: body.instructions,
      terminator: body.terminator,
    }
    if changed.val {
      fn definition(reg : Register) -> Register {
        names.get(reg.id).unwrap_or(reg)
      }
      let normalized = body.map_registers(
        v => {
          match v {
            Reg(reg) => Reg(definition(reg))
            State(_) => v
          }
        },
        definition,
      )
      let comparison = {
        ..block,
        instructions: normalized.instructions,
        terminator: normalized.terminator,
      }
      require(
        stack_check_run(block, continuations=targets) ==
        stack_check_run(comparison),
        "continuation duplication changes execution",
      )
    }
    after
  })
  let (result, sources) = Program::{ ..self, blocks, }.compact_with_sources()
  result.validate()
  { program: result, sources, }
}
