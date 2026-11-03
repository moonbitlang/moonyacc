///|
test "stop propagation crosses pure jumps but preserves snapshot and action barriers" {
  let logical : Cell = { symbol: Some(1), fields: [State], }
  let push = Instruction::Push(logical, [State(1)])
  let pop = Instruction::Pop(logical, [None])
  let state = check_reg(0, State)
  let result = check_reg(1, Semantic(Constr(pkg=None, "Unit", [])))
  let (base, knowledge) = stack_flow_fixture([], Unreachable)
  let block = base.blocks[0]
  let program = {
    ..base,
    terminal_count: 1,
    actions: [{ rhs: [], lhs: 2, inputs: [], callable: true, }],
    blocks: [
      {
        ..block,
        instructions: [
          EnsureLookahead,
          push,
          SaveErrorSnapshot([]),
          pop,
          Action(0, [], result),
          push,
        ],
        terminator: Jump(edge(1)),
      },
      {
        ..block,
        lookahead: Present,
        instructions: [Peek(0, logical, [Some(state)]), pop],
        terminator: Jump(edge(2)),
      },
      { ..block, lookahead: Present, terminator: Stop, },
    ],
  }
  let after = program.stop_earlier(knowledge)
  assert_eq(after.blocks.length(), 1)
  assert_true(
    after.blocks[0].instructions ==
    [EnsureLookahead, push, SaveErrorSnapshot([]), pop, Action(0, [], result)],
  )
  assert_true(after.blocks[0].terminator is Stop)
  ignore(after.stack_flow(knowledge))
  // An invalid read is not made valid merely because its result is discarded.
  let invalid = {
    ..base,
    blocks: [
      { ..block, instructions: [EnsureLookahead, pop], terminator: Stop, },
    ],
  }
  assert_true(
    try {
      ignore(invalid.stop_earlier(knowledge))
      false
    } catch {
      InvalidProgram(_) => true
    },
  )
}

///|
test "stop propagation does not turn a pure forwarding cycle into an error" {
  let block = check_block([], [], [])
  let program = fixture([
    {
      ..block,
      instructions: [EnsureLookahead],
      terminator: CaseToken([(Tokens([Terminal(1)]), Body::jump(edge(1)))], {
        instructions: [],
        terminator: Stop,
      }),
    },
    { ..block, terminator: Jump(edge(2)), },
    { ..block, terminator: Jump(edge(1)), },
  ])
  let after = program.stop_earlier(cache_knowledge())
  assert_eq(after.blocks.length(), 3)
  assert_true(after.blocks[1].terminator is Jump({ target: 2, .. }))
  assert_true(after.blocks[2].terminator is Jump({ target: 1, .. }))
}
