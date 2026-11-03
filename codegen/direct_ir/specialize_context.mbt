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
  mut savings : Int32
  mut complete : Bool
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
  savings : Map[Int32, Int32]
  incomplete : Set[Int32]
  requests : Map[Int32, Set[Int32]]
  mut owner : Int32
}

///|
// Bound each expansion, independently of other requests. An interrupted
// expansion is discarded as a whole. The finite (source label, state) registry
// bounds discovery; retained growth and target costs are admission policies.
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
    self.requests.get_or_init(self.owner, () => Set([])).add(version.label)
    return version.label
  }
  let version = StateVersion::{ original, state, label: self.blocks.length(), }
  self.versions[(original, state)] = version
  self.blocks.push(self.supply.clone_block(target))
  self.pending.push(version)
  self.requests.get_or_init(self.owner, () => Set([])).add(version.label)
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
