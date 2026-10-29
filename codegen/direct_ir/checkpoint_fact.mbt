///|
/// An upper bound on saved_prefix - depth in the diagnostic state stack.
/// saved_prefix is the checkpoint prefix still held in the values buffer;
/// the remaining checkpoint cells have already been copied to the journal.
/// A finite bound is nonpositive and proves that the next push needs no copy.
/// None means unknown, not the numeric value zero.
pub struct CheckpointFact {
  upper : Int32?
}

///|
fn CheckpointFact::initial() -> CheckpointFact {
  { upper: Some(0), }
}

///|
fn CheckpointFact::unknown() -> CheckpointFact {
  { upper: None, }
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
  match (self.upper, incoming.upper) {
    (None, _) => true
    (Some(bound), Some(value)) => value <= bound
    (Some(_), None) => false
  }
}

///|
fn CheckpointFact::join(
  self : CheckpointFact,
  other : CheckpointFact,
) -> CheckpointFact {
  {
    upper: match (self.upper, other.upper) {
      (Some(a), Some(b)) => Some(Int32::max(a, b))
      _ => None
    },
  }
}

///|
/// The state-stack ABI materializes one integer state per surviving IR
/// Push/Pop, independently of semantic lanes. Its push preserves the old
/// prefix before writing, giving d' = min(d, 0) - 1. Pop gives d' = d + 1.
/// Positive bounds are deliberately forgotten; this pass does not yet prove
/// fixed-size journal spans. Snapshot suffixes are virtual and add no depth.
pub fn CheckpointFact::step(
  self : CheckpointFact,
  instruction : Instruction,
) -> CheckpointFact {
  match instruction {
    SaveErrorSnapshot(_) => CheckpointFact::initial()
    Push(_) =>
      {
        upper: Some(
          match self.upper {
            // Saturation weakens the mathematical upper bound instead of
            // allowing analysis arithmetic to wrap around.
            Some(-2147483648) => -2147483648
            Some(bound) => bound - 1
            None => -1
          },
        ),
      }
    Pop(_) =>
      {
        upper: match self.upper {
          Some(bound) if bound < 0 => Some(bound + 1)
          _ => None
        },
      }
    _ => self
  }
}

///|
fn CheckpointFact::after(
  self : CheckpointFact,
  instructions : Array[Instruction],
) -> CheckpointFact {
  instructions.fold(init=self, (fact, instruction) => fact.step(instruction))
}
