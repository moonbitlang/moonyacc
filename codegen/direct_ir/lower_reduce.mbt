///|
priv struct RhsValues {
  value : Value
  start : Value
  end : Value
}

///|
fn ActionSignature::operands(
  self : ActionSignature,
  args : Array[RhsValues],
  before : Value,
) -> Array[Value] {
  self.inputs.map(input => {
    match input {
      Value(index, _) => args[index].value
      Position(BeforeRhs) => before
      Position(StartOf(index)) => args[index].start
      Position(EndOf(index)) => args[index].end
      Position(FirstNonEmpty(_)) => abort("non-atomic action dependency")
    }
  })
}

///|
fn Lowering::lower_reductions(self : Lowering) -> Unit {
  for production, label in self.reduce_labels {
    self.program.blocks[label] = self.reduction_block(production)
  }
}

///|
fn Lowering::read_rhs(
  self : Lowering,
  rhs : Array[Int32],
  instructions : Array[Instruction],
) -> Array[RhsValues] {
  let args = []
  for i, symbol in rhs {
    let value = self.fresh(Semantic(self.program.symbols[symbol].type_))
    let sp = self.fresh(Position)
    let ep = self.fresh(Position)
    instructions.push(
      Peek(rhs.length() - i - 1, cell(symbol), [
        None,
        Some(value),
        Some(sp),
        Some(ep),
      ]),
    )
    args.push(RhsValues::{ value: Reg(value), start: Reg(sp), end: Reg(ep), })
  }
  args
}

///|
fn Lowering::reduction_block(self : Lowering, production : Int32) -> Block {
  let action = self.program.actions[production]
  let instructions = []
  let args = self.read_rhs(action.rhs, instructions)
  let result = self.fresh(Semantic(self.program.symbols[action.lhs].type_))
  let last_pos = self.fresh(Position)
  instructions.push(ReadPreviousPosition(action.rhs.length(), last_pos))
  instructions.push(
    Action(production, action.operands(args, Reg(last_pos)), result),
  )
  // Actions run before any stack mutation. Keep this order visible here.
  for i = action.rhs.length() - 1; i >= 0; i = i - 1 {
    instructions.push(Pop(cell(action.rhs[i]), [None, None, None, None]))
  }
  let pred = self.fresh(State)
  instructions.push(Peek(0, { symbol: None, fields: [State], }, [Some(pred)]))
  let span = (self.meta.production_meta)(production).action.span
  guard! span.0 is (BeforeRhs | StartOf(0))
  let sp = if span.0 is BeforeRhs { Reg(last_pos) } else { args[0].start }
  let ep = if args.is_empty() {
    Reg(last_pos)
  } else {
    args[args.length() - 1].end
  }
  {
    origin: Reduce(production),
    specialize_state: false,
    hint: IfCells(action.rhs.length()),
    parameters: [],
    lookahead: Any,
    instructions,
    terminator: Jump({
      target: self.goto_labels[action.lhs],
      arguments: [Reg(pred), Reg(result), sp, ep],
    }),
  }
}
