///|
/// Concrete reference machine, including overwritten cells that have already
/// been popped. Its snapshot is checked against an independent saved array.
priv struct JournalModel {
  values : Array[Int32]
  undo : Array[Int32]
  mut depth : Int32
  mut checkpoint : Int32
  mut prefix : Int32
  mut suffix : Array[Int32]
  mut expected : Array[Int32]
}

///|
fn JournalModel::copy(self : JournalModel) -> JournalModel {
  {
    ..self,
    values: self.values.copy(),
    undo: self.undo.copy(),
    suffix: self.suffix.copy(),
    expected: self.expected.copy(),
  }
}

///|
fn journal_model_write(
  array : Array[Int32],
  index : Int32,
  value : Int32,
) -> Unit {
  if index == array.length() {
    array.push(value)
  } else {
    array[index] = value
  }
}

///|
fn JournalModel::push(
  self : JournalModel,
  state : Int32,
  journal~ : Bool,
) -> Unit {
  if journal {
    while self.prefix > self.depth {
      self.prefix -= 1
      journal_model_write(
        self.undo,
        self.checkpoint - self.prefix - 1,
        self.values[self.prefix],
      )
    }
  }
  journal_model_write(self.values, self.depth, state)
  self.depth += 1
}

///|
fn JournalModel::capture(self : JournalModel, suffix : Array[Int32]) -> Unit {
  self.checkpoint = self.depth
  self.prefix = self.depth
  self.suffix = suffix
  self.expected = [..self.values[:self.depth], ..suffix]
}

///|
fn JournalModel::snapshot(self : JournalModel) -> Array[Int32] {
  let states = Array::makei(self.checkpoint, index => {
    if index < self.prefix {
      self.values[index]
    } else {
      self.undo[self.checkpoint - index - 1]
    }
  })
  [..states, ..self.suffix]
}

///|
test "journal-free pushes preserve checkpoints across every bounded stack history" {
  let initial = JournalModel::{
    values: [0],
    undo: [],
    depth: 1,
    checkpoint: 1,
    prefix: 1,
    suffix: [],
    expected: [0],
  }
  fn visit(
    reference : JournalModel,
    optimized : JournalModel,
    fact : CheckpointFact,
    remaining : Int32,
  ) -> Unit raise {
    assert_eq(optimized.snapshot(), reference.expected)
    assert_eq(reference.snapshot(), reference.expected)
    assert_eq(
      optimized.values[:optimized.depth],
      reference.values[:reference.depth],
    )
    if fact.upper is Some(bound) {
      assert_true(optimized.prefix - optimized.depth <= bound)
    }
    if remaining == 0 {
      return
    }
    for operation in 0..<3 {
      if operation == 1 && reference.depth == 1 {
        continue
      }
      let a = reference.copy()
      let b = optimized.copy()
      let instruction = match operation {
        0 => {
          a.push(remaining, journal=true)
          b.push(remaining, journal=!fact.no_overlap())
          checkpoint_push()
        }
        1 => {
          a.depth -= 1
          b.depth -= 1
          checkpoint_pop()
        }
        _ => {
          let suffix = if remaining % 2 == 0 { [10, 20] } else { [] }
          a.capture(suffix)
          b.capture(suffix)
          SaveErrorSnapshot(suffix.map(state => State(state)))
        }
      }
      visit(a, b, fact.step(instruction), remaining - 1)
    }
  }
  visit(initial, initial.copy(), CheckpointFact::initial(), 9)
  assert_eq(
    CheckpointFact::{ upper: Some(-2147483648), }.step(checkpoint_push()).upper,
    Some(-2147483648),
  )
}
