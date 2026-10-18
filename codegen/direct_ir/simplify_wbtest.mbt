///|
fn forwarding(
  parameters : Array[Register],
  target : Int,
  args : Array[Value],
) -> Block {
  {
    origin: Helper,
    parameters,
    lookahead: Any,
    instructions: [],
    terminator: Jump({ target, arguments: args, }),
  }
}

///|
test "jump threading substitutes arguments without renumbering LR states" {
  let pos : Register = { id: 0, type_: Position, }
  let s1 : Register = { id: 1, type_: State, }
  let p1 : Register = { id: 2, type_: Position, }
  let p2 : Register = { id: 3, type_: Position, }
  let s2 : Register = { id: 4, type_: State, }
  let program = fixture([
    forwarding([], 2, []),
    { ..forwarding([], 1, []), terminator: Unreachable, },
    {
      ..forwarding([], 3, [State(0), Reg(pos)]),
      instructions: [ReadLastPosition(pos)],
    },
    forwarding([s1, p1], 4, [Reg(p1), Reg(s1)]),
    {
      ..forwarding([p2, s2], 5, []),
      terminator: CaseState(Reg(s2), [(0, { target: 5, arguments: [], })]),
    },
    {
      ..forwarding([], 5, []),
      instructions: [EnsureLookahead],
      terminator: Stop(0),
    },
  ])
  program.validate()
  let result = program.simplify()
  result.validate()
  assert_eq(result.blocks.length(), 3)
  assert_eq(result.entries[0].block, 0)
  assert_eq(result.entries[0].state, 0)
  guard result.blocks[0].terminator is Jump(edge) else { fail("lost jump") }
  assert_eq(edge.target, 1)
  assert_true(edge.arguments == [Reg(pos), State(0)])
  guard result.blocks[1].terminator is CaseState(_, [(state, edge)]) else {
    fail("lost state branch")
  }
  assert_eq(state, 0)
  assert_eq(edge.target, 2)
  assert_true(result.blocks[2].instructions is [EnsureLookahead])
  assert_true(result.blocks[2].terminator is Stop(0))
}

///|
test "threading retains entry initialization and forwarding cycles" {
  let a : Register = { id: 0, type_: State, }
  let b : Register = { id: 1, type_: State, }
  let c : Register = { id: 2, type_: State, }
  let d : Register = { id: 3, type_: State, }
  let program = fixture([
    forwarding([], 1, [State(0), State(0)]),
    forwarding([a, b], 2, [Reg(b), Reg(a)]),
    {
      ..forwarding([c, d], 2, []),
      instructions: [EnsureLookahead],
      terminator: Stop(0),
    },
  ])
  program.validate()
  let result = program.simplify()
  result.validate()
  assert_eq(result.blocks.length(), 2)
  assert_true(result.blocks[0].parameters.is_empty())
  assert_eq(result.blocks[1].parameters.length(), 2)
  program.blocks[2] = forwarding([c, d], 1, [Reg(c), Reg(d)])
  program.validate()
  let cyclic = program.simplify()
  cyclic.validate()
  assert_eq(cyclic.blocks.length(), 3)
  guard cyclic.blocks[1].terminator is Jump(edge) else { fail("lost cycle") }
  assert_eq(edge.target, 2)
  assert_true(edge.arguments == [Reg(b), Reg(a)])
}
