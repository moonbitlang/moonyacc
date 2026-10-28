///|
fn flow_reg(id : Int32) -> Register {
  { id, type_: State, }
}

///|
fn flow_cell() -> Cell {
  { symbol: Some(1), fields: [State], }
}

///|
fn flow_fixture(blocks : Array[Block]) -> Program {
  let program = fixture(blocks)
  {
    ..program,
    entries: [{ ..program.entries[0], state: 1, }],
    diagnostics: Array::make(10, program.diagnostics[0]),
  }
}

///|
test "state flow joins reachable predecessors and entries without trusting Origin" {
  let state = flow_reg(0)
  let program = flow_fixture([
    {
      ..forwarding([], 1, []),
      origin: Run(9),
      instructions: [Peek(0, { symbol: None, fields: [State], }, [Some(state)])],
      terminator: CaseState(Reg(state), [
        (1, { target: 1, arguments: [], }),
        (2, { target: 2, arguments: [], }),
      ]),
    },
    { ..forwarding([], 3, []), instructions: [Push(flow_cell(), [State(3)])], },
    { ..forwarding([], 3, []), instructions: [Push(flow_cell(), [State(4)])], },
    { ..forwarding([], 3, []), terminator: Unreachable, },
  ])
  program.validate()
  let single = program.state_flow()
  assert_eq(single[0].unwrap().window.current, Some(1))
  assert_true(single[2] is None)
  assert_eq(single[3].unwrap().window.current, Some(3))
  assert_eq(single[3].unwrap().window.predecessor, Some(1))
  program.entries.push({ ..program.entries[0], name: "other", state: 2, })
  program.validate()
  let conflicting = program.state_flow()
  assert_eq(conflicting[0].unwrap().window.current, None)
  // Unknown selectors propagate both edges without refining the stack state.
  assert_eq(conflicting[1].unwrap().window.current, None)
  assert_eq(conflicting[2].unwrap().window.current, None)
  assert_eq(conflicting[3].unwrap().window.current, None)
  program.blocks[2] = {
    ..program.blocks[2],
    instructions: [Push(flow_cell(), [State(3)])],
  }
  program.validate()
  let agreeing = program.state_flow()
  assert_eq(agreeing[3].unwrap().window.current, Some(3))
  assert_eq(agreeing[3].unwrap().window.predecessor, None)
}

///|
test "state flow converges when a loop conflicts with its initial state" {
  let program = flow_fixture([
    forwarding([], 1, []),
    { ..forwarding([], 1, []), instructions: [Push(flow_cell(), [State(2)])], },
  ])
  program.validate()
  let incoming = program.state_flow()
  let loop_entry = incoming[1].unwrap()
  assert_eq(loop_entry.window.current, None)
  assert_eq(loop_entry.window.predecessor, None)
  let exit = state_exit(program.blocks[1], loop_entry)
  assert_eq(exit.window.current, Some(2))
  assert_eq(exit.window.predecessor, None)
}

///|
test "state windows bind popped states and forget deeper history and snapshots" {
  let initial = flow_reg(0)
  let popped = flow_reg(1)
  let first = flow_reg(2)
  let deeper = flow_reg(3)
  let second = flow_reg(4)
  let state_cell : Cell = { symbol: None, fields: [State], }
  let block = {
    ..forwarding([], 0, []),
    instructions: [
      Peek(0, state_cell, [Some(initial)]),
      Push(flow_cell(), [State(2)]),
      Push(flow_cell(), [State(3)]),
      SaveErrorSnapshot([State(9)]),
      Pop(flow_cell(), [Some(popped)]),
      Peek(0, state_cell, [Some(first)]),
      Peek(1, state_cell, [Some(deeper)]),
      Pop(flow_cell(), [None]),
      Peek(0, state_cell, [Some(second)]),
    ],
    terminator: Unreachable,
  }
  flow_fixture([block]).validate()
  let entry : StateEntry = {
    window: { current: Some(1), predecessor: Some(0), },
    parameters: [],
  }
  let exit = state_exit(block, entry)
  assert_eq(exit.value(Reg(initial)), Some(1))
  assert_eq(exit.value(Reg(popped)), Some(3))
  assert_eq(exit.value(Reg(first)), Some(2))
  assert_eq(exit.value(Reg(deeper)), None)
  assert_eq(exit.value(Reg(second)), None)
  assert_eq(exit.window.current, None)
  let partial = {
    ..block,
    instructions: [Push({ symbol: Some(1), fields: [], }, [])],
  }
  flow_fixture([partial]).validate()
  let unknown = state_exit(partial, entry)
  assert_eq(unknown.window.current, None)
  assert_eq(unknown.window.predecessor, Some(1))
}

///|
test "state flow transports parallel bindings and only state-typed edge parameters" {
  let left = flow_reg(0)
  let right = flow_reg(1)
  let a = flow_reg(2)
  let b = flow_reg(3)
  let swapped_a = flow_reg(4)
  let swapped_b = flow_reg(5)
  let final_a = flow_reg(6)
  let final_b = flow_reg(7)
  let position : Register = { id: 8, type_: Position, }
  let forwarded_position : Register = { id: 9, type_: Position, }
  let final_position : Register = { id: 10, type_: Position, }
  let program = flow_fixture([
    {
      ..forwarding([], 1, [Reg(left), Reg(right), Reg(position)]),
      instructions: [
        Bind([(left, State(1)), (right, State(2))]),
        ReadPreviousPosition(0, position),
      ],
    },
    {
      ..forwarding([a, b, forwarded_position], 2, [
        Reg(swapped_a),
        Reg(swapped_b),
        Reg(forwarded_position),
      ]),
      instructions: [
        Bind([(swapped_a, Reg(b)), (swapped_b, Reg(a))]),
        SaveErrorSnapshot([Reg(swapped_a), Reg(swapped_b)]),
      ],
    },
    {
      ..forwarding([final_a, final_b, final_position], 3, []),
      terminator: CaseState(Reg(final_a), [
        (2, { target: 3, arguments: [], }),
        (1, { target: 4, arguments: [], }),
      ]),
    },
    { ..forwarding([], 3, []), terminator: Unreachable, },
    { ..forwarding([], 4, []), terminator: Unreachable, },
  ])
  program.validate()
  let incoming = program.state_flow()
  assert_eq(incoming[1].unwrap().parameters, [Some(1), Some(2), None])
  assert_eq(incoming[2].unwrap().parameters, [Some(2), Some(1), None])
  assert_eq(incoming[2].unwrap().window.current, Some(1))
  assert_eq(incoming[3].unwrap().window.current, Some(1))
  assert_true(incoming[4] is None)
}
