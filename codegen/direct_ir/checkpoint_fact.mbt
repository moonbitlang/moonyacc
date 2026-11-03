///|
/// An upper bound on saved_prefix - depth in the diagnostic state stack.
/// While valid, saved_prefix is the checkpoint prefix still held in the values
/// buffer; the remainder is held in the journal. The numeric bound also applies
/// after a dead snapshot has lost its validity guarantee.
/// A finite bound is nonpositive and proves that the next push needs no copy.
/// None means unknown, not the numeric value zero.
pub struct CheckpointFact {
  upper : Int32?
  // A dead snapshot may be invalidated, but must be replaced before Stop.
  valid : Bool
  // True proves equality with the current physical prefix, including contents;
  // false means unknown. Virtual suffix changes do not affect this fact.
  current : Bool
}

///|
fn CheckpointFact::initial() -> CheckpointFact {
  { upper: Some(0), valid: true, current: true, }
}

///|
fn CheckpointFact::unknown() -> CheckpointFact {
  { upper: None, valid: false, current: false, }
}

///|
pub fn CheckpointFact::no_overlap(self : CheckpointFact) -> Bool {
  self.upper is Some(bound) && bound <= 0
}

///|
fn CheckpointFact::covers(
  self : CheckpointFact,
  incoming : CheckpointFact,
) -> Bool {
  (!self.valid || incoming.valid) &&
  (!self.current || incoming.current) &&
  (match (self.upper, incoming.upper) {
    (None, _) => true
    (Some(bound), Some(value)) => value <= bound
    (Some(_), None) => false
  })
}

///|
fn CheckpointFact::join(
  self : CheckpointFact,
  other : CheckpointFact,
) -> CheckpointFact {
  {
    valid: self.valid && other.valid,
    current: self.current && other.current,
    upper: match (self.upper, other.upper) {
      (Some(a), Some(b)) => Some(Int32::max(a, b))
      _ => None
    },
  }
}

///|
/// The state-stack ABI materializes one integer state per surviving IR
/// Push/Pop, independently of semantic lanes. A protected push gives
/// d' = min(d, 0) - 1; an unprotected push gives d' = d - 1. Pop gives d' = d + 1.
/// Positive bounds are deliberately forgotten; this pass does not yet prove
/// fixed-size journal spans. Snapshot suffixes are virtual and add no depth.
pub fn CheckpointFact::step(
  self : CheckpointFact,
  instruction : Instruction,
  preserve~ : Bool = true,
) -> CheckpointFact {
  match instruction {
    SaveErrorSnapshot(_) => CheckpointFact::initial()
    Push(_) =>
      {
        valid: self.valid && (preserve || self.no_overlap()),
        current: false,
        upper: match self.upper {
          // Saturation weakens the mathematical upper bound instead of
          // allowing analysis arithmetic to wrap around.
          Some(-2147483648) => Some(-2147483648)
          Some(bound) => Some(bound - 1)
          None if preserve => Some(-1)
          None => None
        },
      }
    Pop(_) =>
      {
        valid: self.valid,
        current: false,
        upper: match self.upper {
          Some(bound) if bound < 0 => Some(bound + 1)
          _ => None
        },
      }
    _ => self
  }
}

///|
pub fn CheckpointFact::needs_journal(
  self : CheckpointFact,
  preserve~ : Bool,
) -> Bool {
  preserve && !self.no_overlap()
}
