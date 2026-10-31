///|
// Compile-time search bound and a global emitted-code growth allowance.
// These are independent of grammar/state identities and runtime test inputs.
const LAYOUT_TRIALS = 16

///|
fn Emitter::structured_cost(self : Emitter) -> Int32 {
  // Include the dispatcher, entry wrappers and runtime helpers as well as the
  // regional bodies. Shared user action definitions are unchanged by layout.
  self
  .parser_items(no_comments=true)
  .fold(init=0, (cost, item) => {
    cost +
    (match item.declaration {
      Function(function) => emission_cost(function.body)
      Struct(_, fields) => fields.length()
      Enum(_, constructors, _) => constructors.length()
      _ => 0
    })
  })
}

///|
fn Emitter::duplication_batch(
  self : Emitter,
  allowance : Int32,
) -> Array[Int32] {
  let labels = self.control.continuation_candidates()
  let incoming = Array::make(self.program.blocks.length(), 0)
  for block in self.program.blocks {
    for target in block.terminator.successors() {
      incoming[target] += 1
    }
  }
  // Count the actual lowered continuation in its current region. Full trial
  // emission below makes the final decision, including new copies and scopes.
  let ranked = labels.map(label => {
    let routes = self.control.transfers(label)
    let cost = Int32::max(
      1,
      emission_cost(self.block_body(label, routes, true)),
    )
    let copies = Int32::max(1, incoming[label] - 1)
    (
      label,
      if cost > allowance / copies {
        allowance + 1
      } else {
        cost * copies
      },
    )
  })
  ranked.sort_by((a, b) => if a.1 == b.1 { a.0 - b.0 } else { a.1 - b.1 })
  let selected = []
  let mut remaining = allowance
  for (label, cost) in ranked {
    let next = self.program.blocks[label].terminator.successors()
    if cost > remaining ||
      next.any(n => selected.contains(n)) ||
      selected.any(other => {
        self.program.blocks[other].terminator.successors().contains(label)
      }) {
      continue
    }
    remaining -= cost
    selected.push(label)
  }
  selected
}

///|
fn Emitter::assess_layout(
  self : Emitter,
  program : @direct_ir.Program,
  knowledge : @direct_ir.StackKnowledge,
  limit : Int32,
  reduce_selectors~ : Bool,
) -> (Emitter, Int32)? {
  // A join of equivalent code may need a stack shape our abstract domain
  // cannot express. An unproved candidate is rejected, never forced through.
  let prepared = program.prepare_emission(
    knowledge,
    positions=self.support.tracks_positions(),
  ) catch {
    InvalidProgram(_) => return None
  }
  let candidate = Emitter::new(
    prepared,
    self.meta,
    self.support,
    self.input_mode,
    optimize_resources=self.optimize_resources,
  )
  let before = self.control.transfer_cost()
  let after = candidate.control.transfer_cost()
  guard after.exits <= before.exits &&
    (if reduce_selectors {
      after.selectors < before.selectors
    } else {
      after.selectors <= before.selectors
    }) else {
    None
  }
  let size = candidate.structured_cost()
  if size <= limit {
    Some((candidate, size))
  } else {
    None
  }
}

///|
fn Emitter::promising_layout(
  self : Emitter,
  candidate : @direct_ir.DuplicatedContinuations,
  labels : Array[Int32],
) -> Bool {
  // Before redoing storage proofs and target lowering, estimate each expanded
  // block by adding the measured costs of its source and copied continuations.
  // Keeping their old entry/exit overhead is deliberately pessimistic. This
  // filter may miss an opportunity; only full re-analysis can accept one.
  let selected = Set(labels)
  let costs = candidate.sources.map(source => {
    self.program.blocks[source].terminator
    .successors()
    .fold(init=self.block_estimates[source], (cost, target) => {
      cost +
      (if selected.contains(target) { self.block_estimates[target] } else { 0 })
    })
  })
  let control = @control_flow.plan(candidate.program, costs~) catch {
    InvalidControl(message) => abort(message)
  }
  let before = self.control.transfer_cost()
  let after = control.transfer_cost()
  after.exits <= before.exits && after.selectors < before.selectors
}

///|
/// State specialization and cleanup precede this stage. Repairs to their CFG
/// are retained only after full re-analysis and structure/emission costing.
/// Original IR is the fallback; no guessed state/loop invariant is introduced.
/// Menhir's tail jumps need no selector lowering. This target-specific policy
/// accounts for the iterative regions required by MoonBit instead.
fn layout_emitter(
  prepared : @direct_ir.PreparedProgram,
  knowledge : @direct_ir.StackKnowledge,
  meta : @codegen.MetaProvider,
  support : @mbt_common.Context,
  input_mode : @codegen.InputMode,
) -> Emitter {
  let mut current = Emitter::new(
    prepared,
    meta,
    support,
    input_mode,
    optimize_resources=true,
  )
  let initial_size = current.structured_cost()
  let mut current_size = initial_size
  let growth = initial_size / 8
  let limit = initial_size + growth
  let mut trials = 0
  // Factor identical specialized tails before spending code-growth budget.
  // Re-analysis is essential: their hidden stack contexts may differ.
  let merged = current.program.merge_continuations() catch {
    InvalidProgram(message) => abort(message)
  }
  if merged.blocks.length() < current.program.blocks.length() {
    if current.assess_layout(
        merged,
        knowledge,
        initial_size,
        reduce_selectors=false,
      )
      is Some((candidate, size)) {
      current = candidate
      current_size = size
    }
  }
  while trials < LAYOUT_TRIALS {
    let batch = current.duplication_batch(Int32::max(0, limit - current_size))
    if batch.is_empty() {
      break
    }
    let pending = [batch]
    let mut accepted = false
    while !pending.is_empty() && trials < LAYOUT_TRIALS {
      let labels = pending.pop().unwrap()
      trials += 1
      let candidate = current.program.duplicate_continuations(labels) catch {
        InvalidProgram(message) => abort(message)
      }
      if current.promising_layout(candidate, labels) &&
        current.assess_layout(
          candidate.program,
          knowledge,
          limit,
          reduce_selectors=true,
        )
        is Some((candidate, size)) {
        current = candidate
        current_size = size
        accepted = true
        break
      }
      if labels.length() > 1 {
        let middle = labels.length() / 2
        pending.push(labels[middle:].to_owned())
        pending.push(labels[:middle].to_owned())
      }
    }
    if !accepted {
      break
    }
  }
  current
}
