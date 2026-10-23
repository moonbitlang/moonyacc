///|
fn Lowering::lower_gotos(self : Lowering) -> Unit {
  for lhs, label in self.goto_labels {
    self.program.blocks[label] = self.goto_block(lhs)
  }
}

///|
/// Dispatch on the state exposed after popping a production's RHS.
fn Lowering::goto_block(self : Lowering, lhs : Int32) -> Block {
  let pred = self.fresh(State)
  let value = self.fresh(Semantic(self.program.symbols[lhs].type_))
  let sp = self.fresh(Position)
  let ep = self.fresh(Position)
  let arms = []
  let pushes : Map[Int32, Int32] = Map([])
  for state in self.automaton.states {
    for symbol, target in state.goto {
      if symbol is NT(_) &&
        symbol_id(symbol, self.program.terminal_count) == lhs {
        let push_label = match pushes.get(target.num) {
          Some(label) => label
          None => {
            let label = self.goto_push(lhs, target.num)
            pushes[target.num] = label
            label
          }
        }
        arms.push(
          (
            state.num,
            Edge::{
              target: push_label,
              arguments: [Reg(value), Reg(sp), Reg(ep)],
            },
          ),
        )
      }
    }
  }
  {
    origin: Goto(lhs),
    parameters: [pred, value, sp, ep],
    lookahead: Any,
    instructions: [],
    terminator: CaseState(Reg(pred), arms),
  }
}

///|
fn Lowering::goto_push(self : Lowering, lhs : Int32, target : Int32) -> Int32 {
  let label = self.reserve(Helper)
  let value = self.fresh(Semantic(self.program.symbols[lhs].type_))
  let sp = self.fresh(Position)
  let ep = self.fresh(Position)
  self.program.blocks[label] = {
    origin: Helper,
    parameters: [value, sp, ep],
    lookahead: Any,
    instructions: [
      Push(cell(lhs), [State(target), Reg(value), Reg(sp), Reg(ep)]),
    ],
    terminator: Jump(edge(target)),
  }
  label
}
