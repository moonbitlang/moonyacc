///|
const STATE_COPIES_PER_BLOCK : Int32 = 8

///|
const STATE_COPIES_TOTAL : Int32 = 256

///|
priv struct StateSpecializer {
  program : Program
  supply : RegisterSupply
  blocks : Array[Block]
  cache : Map[(Int32, Int32), Int32?]
  copies : Array[Int32]
  claims : Array[(Int32, Int32)]
  mut remaining : Int32
}

///|
fn StateSpecializer::target(
  self : StateSpecializer,
  label : Int32,
  state : Int32,
) -> Int32 raise InvalidProgram {
  let key = (label, state)
  if self.cache.get(key) is Some(cached) {
    return cached.unwrap_or(label)
  }
  self.cache[key] = None
  let block = self.program.blocks[label]
  guard stack_region_root(block) &&
    self.copies[label] < STATE_COPIES_PER_BLOCK &&
    self.claims.length() < STATE_COPIES_TOTAL &&
    self.remaining > 0 else {
    label
  }
  let root = self.supply.clone_block(block)
  guard self.program.stack_region(
      label,
      root,
      self.supply,
      incoming_state=state,
    )
    is Some(region) &&
    region.resolved_states > 0 else {
    label
  }
  let cost = region.block.instructions.length() +
    region.block.parameters.length() +
    1
  guard cost <= self.remaining else { label }
  let specialized = self.blocks.length()
  self.blocks.push(region.block)
  self.claims.push((specialized, state))
  self.copies[label] += 1
  self.remaining -= cost
  self.cache[key] = Some(specialized)
  specialized
}

///|
/// Check assumptions from real entries after redirecting edges. Specialization
/// claims are never seeds, so even a cycle cannot justify its own entry state.
fn check_state_claims(
  program : Program,
  claims : Array[(Int32, Int32)],
) -> Unit raise InvalidProgram {
  let actual = program.state_flow()
  for (label, state) in claims {
    if actual[label] is Some(entry) {
      require(
        entry.window.current == Some(state),
        "unproved state specialization at block \{label}",
      )
    }
  }
}

///|
fn StateSpecializer::redirect(
  self : StateSpecializer,
  terminator : Terminator,
  exit : StateExit,
  state : Int32,
) -> Terminator raise InvalidProgram {
  fn edge(edge : Edge) -> Edge raise InvalidProgram {
    { ..edge, target: self.target(edge.target, state), }
  }
  if terminator is CaseState(selector, arms) &&
    exit.value(selector) is Some(known) {
    // Retain the original switch, but do not spend clone budgets on edges that
    // this transfer proves infeasible. Claims are still checked on the final CFG.
    CaseState(
      selector,
      arms.map(pair => {
        (pair.0, if pair.0 == known { edge(pair.1) } else { pair.1 })
      }),
    )
  } else {
    terminator.map_edges(edge)
  }
}

///|
/// Specialize only profitable bounded push/reduce regions. Cache by original
/// block and incoming physical state, never by semantic values or whole paths.
pub fn Program::specialize_states(
  self : Program,
) -> Program raise InvalidProgram {
  let incoming = self.state_flow()
  let instructions = self.blocks.fold(init=0, (n, b) => {
    n + b.instructions.length() + 1
  })
  let specializer = StateSpecializer::{
    program: self,
    supply: RegisterSupply::new(self),
    blocks: self.blocks.copy(),
    cache: Map([]),
    copies: Array::make(self.blocks.length(), 0),
    claims: [],
    remaining: Int32::max(128, instructions / 8),
  }
  for label, block in self.blocks {
    if incoming[label] is Some(entry) {
      let exit = state_exit(block, entry)
      if exit.window.current is Some(state) {
        let terminator = specializer.redirect(block.terminator, exit, state)
        specializer.blocks[label] = { ..block, terminator, }
      }
    }
  }
  let program = Program::{ ..self, blocks: specializer.blocks, }
  program.validate()
  check_state_claims(program, specializer.claims)
  program.compact()
}
