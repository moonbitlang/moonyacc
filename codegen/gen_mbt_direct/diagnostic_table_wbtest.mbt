///|
fn reference_decision(
  state : @direct_ir.DiagnosticState,
  symbol : Int,
) -> (Int, Int, Int) {
  fn action(value : @direct_ir.DiagnosticAction) -> (Int, Int, Int) {
    match value {
      Accept => (1, 0, 0)
      Shift(next) => (2, next, 0)
      Reduce(count, lhs) => (3, count, lhs)
    }
  }
  if state.default_ is Some(value) {
    return action(value)
  }
  for (token, value) in state.actions {
    if token_id(token) == symbol {
      return action(value)
    }
  }
  for (lhs, next) in state.gotos {
    if lhs == symbol {
      return (2, next, 0)
    }
  }
  (0, 0, 0)
}

///|
/// Read the packed format linearly, independently of the emitted binary search.
fn DiagnosticTable::read(
  self : DiagnosticTable,
  state : Int,
  symbol : Int,
) -> (Int, Int, Int) {
  let row = self.rows[state]
  let mut code = if row < 0 { -row - 1 } else { 0 }
  if row >= 0 {
    for i in 0..<self.data[row] {
      let entry = row + 1 + i * 2
      if self.data[entry] == symbol {
        code = self.data[entry + 1]
        break
      }
    }
  }
  if code < 2 {
    (code, 0, 0)
  } else if code < self.rows.length() + 2 {
    (2, code - 2, 0)
  } else {
    let (count, lhs) = self.reductions[code - self.rows.length() - 2]
    (3, count, lhs)
  }
}

///|
test "diagnostic storage preserves sparse gaps, defaults and shared rows" {
  let sparse : @direct_ir.DiagnosticState = {
    default_: None,
    actions: [
      (Terminal(3), Reduce(0, 9)),
      (EndOfInput, Accept),
      (Terminal(1), Shift(0)),
      (Terminal(6), Reduce(2, 8)),
    ],
    gotos: [(8, 7), (9, 0)],
  }
  let default_ : @direct_ir.DiagnosticState = {
    default_: Some(Reduce(0, 9)),
    actions: [(Terminal(3), Reduce(0, 9))],
    gotos: [],
  }
  let states : Array[@direct_ir.DiagnosticState] = [
    sparse,
    { ..sparse, actions: sparse.actions.rev(), gotos: sparse.gotos.rev(), },
    default_,
    { default_: Some(Accept), actions: [], gotos: [], },
    { default_: None, actions: [], gotos: [], },
    {
      default_: None,
      actions: [(Terminal(2), Reduce(1, 8)), (Terminal(4), Shift(7))],
      gotos: [],
    },
    default_,
    { default_: None, actions: [(Terminal(6), Shift(7))], gotos: [], },
  ]
  let table = diagnostic_table(states)
  for state, decisions in states {
    for symbol in -1..<12 {
      assert_eq(
        table.read(state, symbol),
        reference_decision(decisions, symbol),
      )
    }
  }
  assert_eq(table.rows[0], table.rows[1])
  assert_eq(table.rows[2], table.rows[6])
  assert_eq(table.reductions.length(), 3)
}
