// State specialization follows Menhir 20260209, StackLangTransform.SpecializeState.
// The state/stack transfer rules belong to StackFlow; this pass owns only
// versioning, the inlining policy, and a bounded worklist of source contexts.

///|
priv struct StateVersion {
  original : Int32
  state : Int32
  label : Int32
}

///|
priv struct StateExpansion {
  mut remaining : Int32
  mut useful : Bool
}

///|
priv struct StateSpecializer {
  source : Program
  flow : StackFlow
  evaluator : StackFlowPass
  supply : RegisterSupply
  blocks : Array[Block]
  versions : Map[(Int32, Int32), StateVersion]
  pending : Array[StateVersion]
  useful : Set[Int32]
  mut remaining : Int32
}

///|
// These bound transformation work, not target code size (owned by emission).
// Each source body may grow by at most this many logical operations; the
// whole pass may add at most twice the original IR size before O1 cleanup.
const STATE_INLINE_GROWTH = 128

///|
fn specialization_cost(body : Body) -> Int32 {
  let own = body.instructions.fold(init=1, (n, instruction) => {
    n + 1 + instruction.definitions().length()
  })
  own +
  body.terminator
  .bodies()
  .fold(init=0, (n, branch) => n + specialization_cost(branch))
}

///|
fn StateSpecializer::take(self : StateSpecializer, cost : Int32) -> Bool {
  if cost > self.remaining {
    false
  } else {
    self.remaining -= cost
    true
  }
}

///|
fn has_token_case(term : Terminator) -> Bool {
  term is CaseToken(_) || term.bodies().any(b => has_token_case(b.terminator))
}

///|
fn StateSpecializer::version(
  self : StateSpecializer,
  original : Int32,
  state : Int32,
) -> Int32 raise InvalidProgram {
  let target = self.source.blocks[original]
  guard target.specialize_state && !has_token_case(target.terminator) else {
    original
  }
  guard self.flow.entries[original] is Some(entry) else { original }
  require(
    entry.current.contains(state),
    "specialization state is not a source context",
  )
  // A monomorphic source block already retains this fact without cloning.
  guard entry.current.length() > 1 else { original }
  if self.versions.get((original, state)) is Some(version) {
    return version.label
  }
  let cost = target.parameters.length() +
    specialization_cost({
      instructions: target.instructions,
      terminator: target.terminator,
    })
  guard self.take(cost) else { original }
  let version = StateVersion::{ original, state, label: self.blocks.length(), }
  self.versions[(original, state)] = version
  self.blocks.push(self.supply.clone_block(target))
  self.pending.push(version)
  version.label
}

///|
/// Our state cells contain destination states. Menhir's saved top state is
/// therefore the predecessor in the logical suffix, NOT machine.current.
fn StateSpecializer::known_predecessor(
  self : StateSpecializer,
  machine : StackMachineFact,
) -> Bool raise InvalidProgram {
  self.evaluator.refine(machine)
  machine.word
  .last()
  .map(cell => cell.predecessors.length() == 1)
  .unwrap_or(false)
}

///|
/// Meet a source entry with the selected state's stack invariant, analogous
/// to Menhir's spec_block_type. Actual callers are checked again independently
/// before labels are compacted; provenance and hints prove no assumptions.
fn StateSpecializer::entry(
  self : StateSpecializer,
  original : Int32,
  block : Block,
  state? : Int32,
) -> StackMachineFact raise InvalidProgram {
  let entry = self.flow.entries[original].unwrap()
  let machine = entry.machine(block)
  if state is Some(state) {
    require(
      machine.current.contains(state),
      "incompatible specialization entry",
    )
    machine.current = Set([state])
    self.evaluator.refine(machine)
  }
  machine
}

///|
fn check_state_versions(
  program : Program,
  knowledge : StackKnowledge,
  versions : Array[StateVersion],
) -> Unit raise InvalidProgram {
  program.validate()
  let actual = program.stack_flow(knowledge)
  for version in versions {
    if actual.entries[version.label] is Some(entry) {
      require(
        entry.current == Set([version.state]),
        "specialized entry receives a different LR state",
      )
    }
  }
}
