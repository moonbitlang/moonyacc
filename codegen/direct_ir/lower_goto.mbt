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
  for state in self.automaton.states {
    for symbol, target in state.goto {
      if symbol is NT(_) &&
        symbol_id(symbol, self.program.terminal_count) == lhs {
        arms.push(
          (
            state.num,
            Edge::{
              target: target.num,
              arguments: [Reg(value), Reg(sp), Reg(ep)],
            },
          ),
        )
      }
    }
  }
  {
    origin: Goto(lhs),
    specialize_state: false,
    hint: IfKnownState,
    parameters: [pred, value, sp, ep],
    lookahead: Any,
    instructions: [],
    terminator: CaseState(Reg(pred), arms.map(p => (p.0, Body::jump(p.1)))),
  }
}
