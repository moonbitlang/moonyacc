///|
/// Facts about the current stack state and its immediate predecessor. Unknown
/// deeper states are never recovered from block provenance or diagnostic data.
priv struct StateWindow {
  current : Int32?
  predecessor : Int32?
} derive(Eq)

///|
priv struct StateEntry {
  window : StateWindow
  parameters : Array[Int32?]
} derive(Eq)

///|
priv struct StateExit {
  mut window : StateWindow
  known : Map[Int32, Int32]
}

///|
fn StateEntry::join(self : StateEntry, other : StateEntry) -> StateEntry {
  fn agree(left : Int32?, right : Int32?) -> Int32? {
    if left == right {
      left
    } else {
      None
    }
  }
  {
    window: {
      current: agree(self.window.current, other.window.current),
      predecessor: agree(self.window.predecessor, other.window.predecessor),
    },
    parameters: self.parameters.mapi((i, value) => {
      agree(value, other.parameters[i])
    }),
  }
}

///|
fn StateExit::value(self : StateExit, value : Value) -> Int32? {
  match value {
    State(state) => Some(state)
    Reg(reg) => self.known.get(reg.id)
  }
}

///|
fn StateExit::edge(self : StateExit, edge : Edge) -> StateEntry {
  { window: self.window, parameters: edge.arguments.map(v => self.value(v)), }
}

///|
fn StateExit::bind_fact(
  self : StateExit,
  reg : Register,
  value : Int32?,
) -> Unit {
  // Validation guarantees SSA definitions, so unknown definitions have no old
  // binding to remove. Semantic values and positions cannot become state facts.
  if reg.type_ is State && value is Some(state) {
    self.known[reg.id] = state
  }
}
