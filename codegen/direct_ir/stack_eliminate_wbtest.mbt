///|
fn stack_test_reg(id : Int32, type_ : ValueType) -> Register {
  { id, type_, }
}

///|
fn stack_test_value(id : Int32) -> Register {
  stack_test_reg(id, Semantic(Constr(pkg=None, "Int", [])))
}

///|
fn stack_test_position(id : Int32) -> Register {
  stack_test_reg(id, Position)
}

///|
fn stack_test_input(
  token : Int32,
  first : Int32,
  target : Int32,
  push : Bool,
) -> Block {
  let value = stack_test_value(first)
  let start = stack_test_position(first + 1)
  let end = stack_test_position(first + 2)
  let instructions : Array[Instruction] = [
    Input(token, value, start, end),
    ConsumeLookahead,
  ]
  if push {
    instructions.push(
      Push(cell(3), [State(0), Reg(value), Reg(start), Reg(end)]),
    )
  }
  {
    ..forwarding(
      [],
      target,
      if push {
        [Reg(start)]
      } else {
        [Reg(value), Reg(start), Reg(end)]
      },
    ),
    lookahead: On(Terminal(token)),
    instructions,
  }
}

///|
// Two token paths keep the original reduction reachable after one predecessor
// is specialized, so the program validator also checks fresh register IDs.
fn stack_test_program() -> Program {
  let int : @elab.TypeExpr = Constr(pkg=None, "Int", [])
  let value = stack_test_value(3)
  let start = stack_test_position(4)
  let end = stack_test_position(5)
  let forwarded = stack_test_position(6)
  let parameter = stack_test_position(7)
  let read = stack_test_value(8)
  let read_start = stack_test_position(9)
  let read_end = stack_test_position(10)
  let before = stack_test_position(11)
  let result = stack_test_value(12)
  let predecessor = stack_test_reg(13, State)
  let accepted = stack_test_value(14)
  let accepted_start = stack_test_position(15)
  {
    entries: [{ name: "start", block: 0, state: 0, result_type: int, }],
    symbols: ["<end>", "A", "B", "source", "result"].map(name => Symbol::{
      name,
      type_: int,
    }),
    terminal_count: 2,
    actions: [{ rhs: [3], lhs: 4, callable: true, }],
    diagnostics: [{ default_: Some(Accept), actions: [], gotos: [], }],
    blocks: [
      {
        ..forwarding([], 7, []),
        instructions: [EnsureLookahead],
        terminator: CaseToken(
          [
            (Terminal(1), { target: 1, arguments: [], }),
            (Terminal(2), { target: 6, arguments: [], }),
          ],
          { target: 7, arguments: [], },
        ),
      },
      stack_test_input(1, 0, 2, false),
      {
        ..forwarding([value, start, end], 3, [Reg(start)]),
        origin: Run(0),
        instructions: [
          Push(cell(3), [State(0), Reg(value), Reg(start), Reg(end)]),
        ],
      },
      forwarding([forwarded], 4, [Reg(forwarded)]),
      {
        ..forwarding([parameter], 5, [Reg(result), Reg(parameter)]),
        instructions: [
          Peek(0, cell(3), [None, Some(read), Some(read_start), Some(read_end)]),
          ReadPreviousPosition(1, before),
          Action(
            0,
            [{ value: Reg(read), start: Reg(read_start), end: Reg(read_end), }],
            Reg(before),
            result,
          ),
          Pop(cell(3), [None, None, None, None]),
          Peek(0, { symbol: None, fields: [State], }, [Some(predecessor)]),
        ],
      },
      {
        ..forwarding([accepted, accepted_start], 7, []),
        terminator: Return(0, Reg(accepted)),
      },
      stack_test_input(2, 16, 4, true),
      { ..forwarding([], 7, []), lookahead: Present, terminator: Stop(0), },
    ],
  }
}

///|
fn stack_test_root(program : Program) -> Block {
  program.blocks.filter(block => {
    block.parameters ==
    [stack_test_value(3), stack_test_position(4), stack_test_position(5)]
  })[0]
}

///|
test "stack elimination forwards a typed goto cell without duplicating action registers" {
  let program = stack_test_program()
  program.validate()
  let result = program.eliminate_stack()
  result.validate()
  let root = stack_test_root(result)
  assert_false(
    root.instructions.any(instruction => instruction is (Push(_) | Pop(_))),
  )
  assert_eq(
    root.instructions.filter(instruction => instruction is Action(_)).length(),
    1,
  )
  for instruction in root.instructions {
    for reg in instruction.definitions() {
      assert_true(reg.id > 18)
    }
  }
  guard root.instructions
    is [
      ReadPreviousPosition(0, before),
      Action(0, [arg], Reg(action_before), action_result),
      Peek(0, { symbol: None, fields: [State], }, _),
    ] else {
    fail("did not eliminate the complete known RHS")
  }
  assert_true(arg.value == Reg(stack_test_value(3)))
  assert_true(arg.start == Reg(stack_test_position(4)))
  assert_true(arg.end == Reg(stack_test_position(5)))
  assert_true(before == action_before)
  guard root.terminator is Jump(edge) else {
    fail("lost reduction continuation")
  }
  assert_true(
    edge.arguments == [Reg(action_result), Reg(stack_test_position(4))],
  )
  assert_true(
    result.blocks.any(block => {
      block.instructions.any(instruction => {
        instruction is Action(_, _, _, { id: 12, .. })
      })
    }),
  )
}

///|
test "stack regions stop at snapshots token branches physical RHS cells and cycles" {
  for boundary in 0..<5 {
    let program = stack_test_program()
    let forward = program.blocks[3]
    let parameter = forward.parameters[0]
    match boundary {
      0 => program.blocks[3] = { ..forward, instructions: [SaveErrorSnapshot], }
      1 =>
        program.blocks[3] = {
          ..forward,
          instructions: [EnsureLookahead],
          terminator: CaseToken([], { target: 4, arguments: [Reg(parameter)], }),
        }
      2 => {
        let reduction = program.blocks[4]
        let left = stack_test_value(19)
        let start = stack_test_position(20)
        let end = stack_test_position(21)
        let instructions = reduction.instructions.copy()
        guard instructions[2] is Action(id, args, before, result) else {
          fail("missing fixture action")
        }
        instructions[2] = Action(
          id,
          [{ value: Reg(left), start: Reg(start), end: Reg(end), }, ..args],
          before,
          result,
        )
        instructions.insert(
          0,
          Peek(1, cell(3), [None, Some(left), Some(start), Some(end)]),
        )
        instructions.insert(5, Pop(cell(3), [None, None, None, None]))
        program.blocks[4] = { ..reduction, instructions, }
        program.actions[0] = { ..program.actions[0], rhs: [3, 3], }
      }
      3 =>
        program.blocks[3] = {
          ..forward,
          terminator: Jump({ target: 3, arguments: [Reg(parameter)], }),
        }
      _ =>
        program.blocks[3] = {
          ..forward,
          instructions: Array::make(120, Bind([])),
        }
    }
    program.validate()
    let result = program.eliminate_stack()
    result.validate()
    let root = stack_test_root(result)
    guard root.instructions is [Push(actual, values)] else {
      fail("crossed stack-region boundary \{boundary}")
    }
    assert_true(actual == cell(3))
    assert_true(
      values ==
      [
        State(0),
        Reg(stack_test_value(3)),
        Reg(stack_test_position(4)),
        Reg(stack_test_position(5)),
      ],
    )
  }
}

///|
test "pending stack positions distinguish virtual cells from the opaque prefix" {
  let value = stack_test_value(0)
  let start = stack_test_position(1)
  let end = stack_test_position(2)
  let top = stack_test_position(3)
  let before = stack_test_position(4)
  let rewrite = StackRewrite::new()
  let push : Instruction = Push(cell(3), [
    State(0),
    Reg(value),
    Reg(start),
    Reg(end),
  ])
  rewrite.instruction(push)
  rewrite.instruction(ReadPreviousPosition(0, top))
  rewrite.instruction(ReadPreviousPosition(1, before))
  assert_true(rewrite.value(Reg(top)) == Reg(end))
  assert_true(rewrite.output is [ReadPreviousPosition(0, _)])
  assert_eq(rewrite.pending.length(), 1)
  // A partial cell cannot enter the virtual suffix. Materialize the complete
  // pending cell before this push so its omitted End retains normal defaults.
  rewrite.instruction(
    Push({ symbol: Some(4), fields: [State, Semantic, Start], }, [
      State(0),
      Reg(value),
      Reg(start),
    ]),
  )
  rewrite.instruction(ReadPreviousPosition(0, stack_test_position(5)))
  assert_true(rewrite.pending.is_empty())
  assert_true(
    rewrite.output
    is [
      ReadPreviousPosition(0, _),
      Push({ symbol: Some(3), .. }, _),
      Push({ symbol: Some(4), fields: [State, Semantic, Start], }, _),
      ReadPreviousPosition(0, _),
    ],
  )
}
