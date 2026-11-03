///|
/// Completed state versions, before target-dependent admission. A candidate
/// groups requests from one caller, including its branch alternatives. This
/// preserves sharing at a goto fanout; each request includes all specialized
/// successors it needs. Labels and proofs never escape this plan.
pub struct StateSpecializations {
  priv source : Program
  priv expanded : Program
  priv versions : Array[StateVersion]
  priv groups : Array[Array[Int32]]
  priv base_growth : Int32
  priv decisions : Map[Int32, Int32]
}

///|
fn block_specialization_size(block : Block) -> Int32 {
  block.parameters.length() +
  specialization_cost({
    instructions: block.instructions,
    terminator: block.terminator,
  })
}

///|
fn Program::specialization_size(self : Program) -> Int32 {
  self.blocks.fold(init=0, (n, b) => n + block_specialization_size(b))
}

///|
fn StateSpecializations::new(
  source : Program,
  expanded : Program,
  versions : Array[StateVersion],
  useful : Set[Int32],
  requests : Map[Int32, Set[Int32]],
  decisions : Map[Int32, Int32],
) -> StateSpecializations {
  let groups = []
  for owner, block in expanded.blocks[:source.blocks.length()] {
    let successors = Set::from_iter(block.terminator.successors().iter())
    let roots = requests
      .get(owner)
      .unwrap_or(Set([]))
      .to_array()
      .filter(label => useful.contains(label) && successors.contains(label))
    roots.sort()
    if !roots.is_empty() {
      groups.push(roots)
    }
  }
  {
    source,
    expanded,
    versions,
    groups,
    decisions,
    base_growth: Int32::max(
      0,
      expanded.blocks[:source.blocks.length()].fold(init=0, (n, b) => {
        n + block_specialization_size(b)
      }) -
      source.specialization_size(),
    ),
  }
}

///|
/// State-case sites eliminated in the selected contexts, counting shared
/// dependencies once. This is a static benefit, not a runtime frequency.
pub fn StateSpecializations::savings(
  self : StateSpecializations,
  selected : Array[Int32],
) -> Int32 raise InvalidProgram {
  self
  .closure(selected)
  .iter()
  .fold(init=0, (n, label) => n + self.decisions.get(label).unwrap_or(0))
}

///|
fn StateSpecializations::closure(
  self : StateSpecializations,
  selected : Array[Int32],
) -> Set[Int32] raise InvalidProgram {
  let pending = []
  for id in selected {
    require(
      id >= 0 && id < self.groups.length(),
      "invalid specialization candidate",
    )
    pending.append(self.groups[id])
  }
  let labels = Set([])
  while pending.pop() is Some(label) {
    if labels.contains(label) {
      continue
    }
    labels.add(label)
    for next in self.expanded.blocks[label].terminator.successors() {
      if next >= self.source.blocks.length() {
        pending.push(next)
      }
    }
  }
  labels
}

///|
/// Small complete closures are considered first. This is an IR work/size
/// ordering, not a prediction about grammar frequencies or machine time.
pub fn StateSpecializations::candidates(
  self : StateSpecializations,
) -> Array[Int32] {
  let ranked = self.groups.mapi((id, _) => {
    let labels = self.closure([id]) catch {
      InvalidProgram(message) => abort(message)
    }
    let cost = labels
      .iter()
      .fold(init=0, (n, label) => {
        n + block_specialization_size(self.expanded.blocks[label])
      })
    (id, cost)
  })
  ranked.sort_by((a, b) => if a.1 == b.1 { a.0 - b.0 } else { a.1 - b.1 })
  ranked.map(p => p.0)
}

///|
/// Charge only complete retained closures, counting shared dependencies once.
/// Rejecting a candidate consumes no retained-code budget.
fn StateSpecializations::within_growth(
  self : StateSpecializations,
  candidates : Array[Int32],
  growth : Int32,
) -> Array[Int32] raise InvalidProgram {
  require(growth >= 0, "negative state-specialization budget")
  let selected = []
  let retained = Set([])
  let mut remaining = growth - self.base_growth
  for id in candidates {
    let labels = self.closure([id])
    let mut rest = remaining
    for label in labels {
      if !retained.contains(label) {
        rest -= block_specialization_size(self.expanded.blocks[label])
        if rest < 0 {
          break
        }
      }
    }
    if rest >= 0 {
      selected.push(id)
      remaining = rest
      for label in labels {
        retained.add(label)
      }
    }
  }
  selected
}

///|
pub fn StateSpecializations::within_budget(
  self : StateSpecializations,
  candidates : Array[Int32],
) -> Array[Int32] raise InvalidProgram {
  // Retain the existing two-source-size growth allowance. Discovery work is
  // separate and never consumes this admission allowance.
  self.within_growth(candidates, self.source.specialization_size() * 2)
}

///|
pub fn StateSpecializations::apply(
  self : StateSpecializations,
  selected : Array[Int32],
  knowledge : StackKnowledge,
) -> Program raise InvalidProgram {
  if selected.is_empty() {
    return self.source
  }
  let retained = self.closure(selected)
  let fallback = Map::from_iter(
    self.versions
    .iter()
    .filter_map(version => {
      if retained.contains(version.label) {
        None
      } else {
        Some((version.label, version.original))
      }
    }),
  )
  let program = {
    ..self.expanded,
    blocks: self.expanded.blocks.map(block => {
      ..block,
      terminator: block.terminator.map_edges(edge => {
        ..edge,
        target: fallback.get(edge.target).unwrap_or(edge.target),
      }),
    }),
  }
  // Recompute from real entries, including generic fallbacks. Version labels
  // are hypotheses to check, never assumptions supplied to the analysis.
  check_state_versions(
    program,
    knowledge,
    self.versions.filter(v => retained.contains(v.label)),
  )
  program.compact()
}

///|
/// Apply and check a selection, then run the common cleanup exactly once.
/// This boundary avoids rechecking the unchanged input before that cleanup;
/// final storage and checkpoint proofs are still derived from its output.
pub fn StateSpecializations::prepare(
  self : StateSpecializations,
  selected : Array[Int32],
  knowledge : StackKnowledge,
  positions~ : Bool,
) -> PreparedProgram raise InvalidProgram {
  let program = self.apply(selected, knowledge)
  if selected.is_empty() {
    // apply([]) is the exact generic source, rather than a checked rewrite.
    program.validate()
    ignore(program.stack_flow(knowledge))
  }
  program.simplify().prepare_cleanup(knowledge, positions~)
}
