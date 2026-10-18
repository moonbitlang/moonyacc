///|
priv struct DiagnosticTable {
  // Negative entries encode a constant decision as -(decision + 1).
  // Otherwise the entry points to [count, symbol, decision, ...] in data.
  rows : Array[Int]
  data : Array[Int]
  reductions : Array[(Int, Int)]
}

///|
priv struct DiagnosticEncoder {
  state_count : Int
  reductions : Array[(Int, Int)]
  reduction_ids : Map[(Int, Int), Int]
}

///|
/// Error = 0, accept = 1, shift = state + 2. Reductions follow the state range
/// and share (pop count, lhs) entries; no semantic action pointers are stored.
fn DiagnosticEncoder::encode(
  self : DiagnosticEncoder,
  action : @direct_ir.DiagnosticAction,
) -> Int {
  match action {
    Accept => 1
    Shift(state) => state + 2
    Reduce(count, lhs) => {
      let key = (count, lhs)
      let id = match self.reduction_ids.get(key) {
        Some(id) => id
        None => {
          let id = self.reductions.length()
          self.reduction_ids[key] = id
          self.reductions.push(key)
          id
        }
      }
      2 + self.state_count + id
    }
  }
}

///|
fn DiagnosticEncoder::entries(
  self : DiagnosticEncoder,
  state : @direct_ir.DiagnosticState,
) -> Array[(Int, Int)] {
  let entries = state.actions.map(p => (token_id(p.0), self.encode(p.1)))
  for (symbol, target) in state.gotos {
    entries.push((symbol, self.encode(Shift(target))))
  }
  entries.sort_by((a, b) => a.0.compare(b.0))
  entries
}

///|
/// Only the IR's unconditional defaults become constant rows. All missing
/// entries in a sparse row remain Error, including resolved nonassoc conflicts.
fn diagnostic_table(
  states : Array[@direct_ir.DiagnosticState],
) -> DiagnosticTable {
  let encoder = DiagnosticEncoder::{
    state_count: states.length(),
    reductions: [],
    reduction_ids: Map([]),
  }
  let rows = []
  let data = []
  let shared : Map[Array[(Int, Int)], Int] = Map([])
  for state in states {
    if state.default_ is Some(action) {
      rows.push(-encoder.encode(action) - 1)
      continue
    }
    let entries = encoder.entries(state)
    if entries.is_empty() {
      rows.push(-1)
      continue
    }
    if shared.get(entries) is Some(offset) {
      rows.push(offset)
      continue
    }
    let offset = data.length()
    // The sorted key is never mutated after interning it.
    shared[entries] = offset
    rows.push(offset)
    data.push(entries.length())
    for (symbol, decision) in entries {
      data.push(symbol)
      data.push(decision)
    }
  }
  { rows, data, reductions: encoder.reductions, }
}
