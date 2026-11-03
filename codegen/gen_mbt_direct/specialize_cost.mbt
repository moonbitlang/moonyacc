///|
/// Compare administrative choices against the state choices a candidate
/// actually removes. Rejecting every added selector would defeat state
/// specialization on a target which lowers fixed jumps through regions.
/// These are static sites, not execution frequencies or predicted CPU cycles.
priv struct SpecializationCost {
  decisions : Int32
  exits : Int32
  size : Int32
}

///|
fn Emitter::specialization_cost(
  self : Emitter,
  savings : Int32,
) -> SpecializationCost {
  let transfers = self.control.transfer_cost()
  SpecializationCost::new(
    transfers.exits,
    transfers.selectors,
    transfers.entries,
    savings,
    self.structured_cost(),
  )
}

///|
fn SpecializationCost::new(
  exits : Int32,
  selectors : Int32,
  entries : Int32,
  savings : Int32,
  size : Int32,
) -> SpecializationCost {
  {
    decisions: exits + selectors + entries - savings,
    exits: exits - savings,
    size,
  }
}

///|
fn SpecializationCost::admits(
  self : SpecializationCost,
  candidate : SpecializationCost,
  size_limit : Int32,
) -> Bool {
  candidate.decisions <= self.decisions &&
  candidate.exits <= self.exits &&
  candidate.size <= size_limit
}
