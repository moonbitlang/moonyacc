///|
fn StateExit::read_state(
  self : StateExit,
  depth : Int32,
  cell : Cell,
  bindings : Array[Register?],
) -> Unit {
  let state = match depth {
    0 => self.window.current
    1 => self.window.predecessor
    _ => None
  }
  for i, field in cell.fields {
    if field is State && bindings[i] is Some(reg) {
      self.bind_fact(reg, state)
    }
  }
}

///|
fn StateExit::instruction(self : StateExit, instruction : Instruction) -> Unit {
  match instruction {
    Bind(bindings) => {
      let values = bindings.map(pair => self.value(pair.1))
      for i, (reg, _) in bindings {
        self.bind_fact(reg, values[i])
      }
    }
    Push(cell, values) => {
      let mut current = None
      for i, field in cell.fields {
        if field is State {
          current = self.value(values[i])
        }
      }
      self.window = { current, predecessor: self.window.current, }
    }
    Pop(cell, bindings) => {
      self.read_state(0, cell, bindings)
      self.window = { current: self.window.predecessor, predecessor: None, }
    }
    Peek(depth, cell, bindings) => self.read_state(depth, cell, bindings)
    // A diagnostic suffix describes a saved stack, not the current stack.
    SaveErrorSnapshot(_)
    | EnsureLookahead
    | Input(_)
    | ConsumeLookahead
    | ReadPreviousPosition(_)
    | Action(_) => ()
  }
}

///|
/// Requires a validated block and entry facts aligned with its parameters.
/// The same transfer is used by global flow and by specialization planning.
fn state_exit(block : Block, entry : StateEntry) -> StateExit {
  let exit = StateExit::{ window: entry.window, known: Map([]), }
  for i, parameter in block.parameters {
    exit.bind_fact(parameter, entry.parameters[i])
  }
  for instruction in block.instructions {
    exit.instruction(instruction)
  }
  exit
}
