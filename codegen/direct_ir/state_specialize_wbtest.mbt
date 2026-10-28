///|
fn specialize_source(route : Int32, push : Bool) -> Block {
  let instructions : Array[Instruction] = []
  if push {
    instructions.push(Push({ symbol: Some(3), fields: [State], }, [State(1)]))
  }
  instructions.push(EnsureLookahead)
  {
    ..forwarding([], 7, []),
    instructions,
    terminator: CaseToken(
      [(Terminal(1), { target: 3, arguments: [State(route)], })],
      { target: 7, arguments: [], },
    ),
  }
}

///|
fn specialize_fixture() -> Program {
  let int : @elab.TypeExpr = Constr(pkg=None, "Int", [])
  let unit : @elab.TypeExpr = Constr(pkg=None, "Unit", [])
  let value = stack_test_value
  let pos = stack_test_position
  let state = flow_reg
  let blocks = [
    specialize_source(0, true),
    specialize_source(1, true),
    specialize_source(2, false),
    {
      ..forwarding([state(0)], 4, [Reg(state(0))]),
      lookahead: On(Terminal(1)),
      instructions: [
        Input(1, value(1), pos(2), pos(3)),
        Push(cell(1), [State(5), Reg(value(1)), Reg(pos(2)), Reg(pos(3))]),
        ConsumeLookahead,
        SaveErrorSnapshot([]),
      ],
    },
    {
      ..forwarding([state(4)], 5, [
        Reg(state(10)),
        Reg(value(9)),
        Reg(pos(6)),
        Reg(pos(7)),
        Reg(state(4)),
      ]),
      instructions: [
        Peek(0, cell(1), [None, Some(value(5)), Some(pos(6)), Some(pos(7))]),
        ReadPreviousPosition(1, pos(8)),
        Action(
          0,
          [{ value: Reg(value(5)), start: Reg(pos(6)), end: Reg(pos(7)), }],
          Reg(pos(8)),
          value(9),
        ),
        Pop(cell(1), [None, None, None, None]),
        Peek(0, { symbol: None, fields: [State], }, [Some(state(10))]),
      ],
    },
    {
      ..forwarding([state(11), value(12), pos(13), pos(14), state(15)], 8, []),
      terminator: CaseState(Reg(state(11)), [
        (
          1,
          {
            target: 8,
            arguments: [
              Reg(value(12)),
              Reg(pos(13)),
              Reg(pos(14)),
              Reg(state(15)),
            ],
          },
        ),
        (
          2,
          {
            target: 9,
            arguments: [
              Reg(value(12)),
              Reg(pos(13)),
              Reg(pos(14)),
              Reg(state(15)),
            ],
          },
        ),
      ]),
    },
    {
      ..forwarding([state(24)], 10, []),
      instructions: [Peek(0, cell(2), [None, Some(value(25)), None, None])],
      terminator: CaseState(Reg(state(24)), [
        (0, { target: 10, arguments: [Reg(value(25))], }),
        (1, { target: 11, arguments: [Reg(value(25))], }),
        (2, { target: 12, arguments: [Reg(value(25))], }),
      ]),
    },
    { ..forwarding([], 7, []), lookahead: Present, terminator: Stop(0), },
    {
      ..forwarding([value(16), pos(17), pos(18), state(19)], 6, [Reg(state(19))]),
      instructions: [
        Push(cell(2), [State(6), Reg(value(16)), Reg(pos(17)), Reg(pos(18))]),
      ],
    },
    {
      ..forwarding([value(20), pos(21), pos(22), state(23)], 6, [Reg(state(23))]),
      instructions: [
        Push(cell(2), [State(7), Reg(value(20)), Reg(pos(21)), Reg(pos(22))]),
      ],
    },
    {
      ..forwarding([value(26)], 10, []),
      terminator: Return(0, Reg(value(26))),
    },
    {
      ..forwarding([value(27)], 11, []),
      terminator: Return(1, Reg(value(27))),
    },
    {
      ..forwarding([value(28)], 12, []),
      terminator: Return(2, Reg(value(28))),
    },
  ]
  {
    entries: [
      { name: "first", block: 0, state: 2, result_type: int, },
      { name: "second", block: 1, state: 3, result_type: int, },
      { name: "third", block: 2, state: 2, result_type: int, },
    ],
    blocks,
    symbols: [
      { name: "<end>", type_: unit, },
      { name: "NUMBER", type_: int, },
      { name: "result", type_: int, },
      { name: "prefix", type_: unit, },
    ],
    terminal_count: 1,
    actions: [{ rhs: [1], lhs: 2, callable: true, }],
    diagnostics: Array::make(10, {
      default_: Some(Accept),
      actions: [],
      gotos: [],
    }),
  }
}

///|
fn specialize_test_engine(
  program : Program,
  budget : Int32,
) -> StateSpecializer {
  {
    program,
    supply: RegisterSupply::new(program),
    blocks: program.blocks.copy(),
    cache: Map([]),
    copies: Array::make(program.blocks.length(), 0),
    claims: [],
    remaining: budget,
  }
}

///|
test "state specialization shares state-keyed clones while keeping other inputs dynamic" {
  let program = specialize_fixture()
  program.validate()
  let result = program.specialize_states()
  result.validate()
  let targets = result.entries.map(entry => {
    guard result.blocks[entry.block].terminator is CaseToken([(_, edge)], _) else {
      abort("missing source branch")
    }
    edge.target
  })
  assert_eq(targets[0], targets[1])
  assert_true(targets[0] != targets[2])
  let incoming = result.state_flow()
  let shared = incoming[targets[0]].unwrap()
  assert_eq(shared.window.current, Some(1))
  assert_eq(shared.window.predecessor, None)
  assert_eq(shared.parameters, [None])
  for (label, destination) in [(targets[0], 6), (targets[2], 7)] {
    let block = result.blocks[label]
    assert_eq(block.parameters.length(), 1)
    assert_true(block.parameters[0].id > 28)
    assert_true(block.instructions[0] is Input(1, _, _, _))
    assert_true(block.instructions[1] is ConsumeLookahead)
    assert_true(block.instructions[2] is SaveErrorSnapshot([State(5)]))
    assert_true(block.instructions[3] is ReadPreviousPosition(0, _))
    assert_true(block.instructions[4] is Action(0, _, _, _))
    assert_eq(block.instructions.filter(i => i is Action(_)).length(), 1)
    assert_false(block.instructions.any(i => i is Pop(_)))
    guard block.instructions.last() is Some(Push(c, [State(target), ..])) else {
      fail("missing result materialization")
    }
    assert_true(c == cell(2))
    assert_eq(target, destination)
    guard block.terminator is Jump(edge) else { fail("goto was not resolved") }
    assert_true(edge.arguments == [Reg(block.parameters[0])])
  }
}

///|
test "state specialization budgets and path limits retain the original continuation" {
  let program = specialize_fixture()
  program.validate()
  let too_small = specialize_test_engine(program, 1)
  assert_eq(too_small.target(3, 1), 3)
  assert_true(too_small.claims.is_empty())
  assert_eq(too_small.blocks.length(), program.blocks.length())
  let engine = specialize_test_engine(program, 1000)
  let first = engine.target(3, 1)
  assert_true(first != 3)
  assert_eq(engine.target(3, 1), first)
  assert_eq(engine.claims.length(), 1)
  // More forwarding edges than one bounded region can cross, before any Pop.
  let first_forwarder = program.blocks.length()
  program.blocks[3] = {
    ..program.blocks[3],
    terminator: Jump({ target: first_forwarder, arguments: [Reg(flow_reg(0))], }),
  }
  for i in 0..<=STACK_REGION_BLOCKS {
    let parameter = flow_reg(29 + i)
    program.blocks.push(
      forwarding(
        [parameter],
        if i == STACK_REGION_BLOCKS {
          4
        } else {
          first_forwarder + i + 1
        },
        [Reg(parameter)],
      ),
    )
  }
  program.validate()
  let bounded = specialize_test_engine(program, 1000)
  assert_eq(bounded.target(3, 1), 3)
  assert_true(bounded.claims.is_empty())
}

///|
test "state specialization claims are proved from real entries including cycles" {
  let program = specialize_fixture()
  program.validate()
  try check_state_claims(program, [(3, 1)]) catch {
    InvalidProgram(message) =>
      assert_true(message.contains("unproved state specialization"))
  } noraise {
    _ => fail("conflicting incoming states proved one state")
  }
  let cycle = program.blocks.length()
  program.blocks.append([
    forwarding([], cycle + 1, []),
    forwarding([], cycle, []),
  ])
  program.validate()
  check_state_claims(program, [(cycle, 7), (cycle + 1, 7)])
  assert_true(program.state_flow()[cycle] is None)
  program.entries.push({
    ..program.entries[0],
    name: "cycle",
    block: cycle,
    state: 2,
  })
  program.validate()
  try check_state_claims(program, [(cycle, 7), (cycle + 1, 7)]) catch {
    InvalidProgram(message) =>
      assert_true(message.contains("unproved state specialization"))
  } noraise {
    _ => fail("cyclic claims seeded their own state assumption")
  }
}
