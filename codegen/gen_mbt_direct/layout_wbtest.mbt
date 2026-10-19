///|
test "shared error exits preserve effects, parameters and LR provenance" {
  let stop : @direct_ir.Block = {
    origin: Helper,
    parameters: [],
    lookahead: Present,
    instructions: [],
    terminator: Stop(0),
  }
  let position : @direct_ir.Register = { id: 0, type_: Position, }
  let blocks : Array[@direct_ir.Block] = [
    stop,
    { ..stop, lookahead: On(Terminal(1)), terminator: Stop(1), },
    { ..stop, instructions: [SaveErrorSnapshot], },
    { ..stop, parameters: [position], },
    {
      ..stop,
      instructions: [Bind([({ id: 1, type_: State, }, State(1))])],
      terminator: Jump({ target: 1, arguments: [], }),
    },
  ]
  let layout = BlockLayout::new(blocks)
  assert_eq(layout.blocks, [0, 2, 3, 4])
  assert_eq(layout.pc(0), layout.pc(1))
  assert_eq(layout.pc(2), 1)
  assert_eq(layout.pc(3), 2)
  assert_eq(layout.pc(4), 3)
  // Planning aliases emitted labels without rewriting the validated IR.
  assert_true(blocks[1].terminator is Stop(1))
  assert_true(blocks[4].instructions is [Bind([(_, State(1))])])
  guard blocks[4].terminator is Jump(edge) else { fail("lost edge") }
  assert_eq(layout.pc(edge.target), layout.pc(0))
}
