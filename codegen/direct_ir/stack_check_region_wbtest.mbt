///|
test "stack region checker proves known goto while retaining action and snapshot order" {
  let value = check_int(0)
  let pos = check_reg(1, Position)
  let read = check_int(2)
  let start = check_reg(3, Position)
  let end = check_reg(4, Position)
  let before = check_reg(5, Position)
  let result = check_int(6)
  let state = check_reg(7, State)
  let next_value = check_int(8)
  let next_start = check_reg(9, Position)
  let next_end = check_reg(10, Position)
  let read_state : Instruction = Peek(0, { symbol: None, fields: [State], }, [
    Some(state),
  ])
  let root = {
    ..check_block(
      [value, pos],
      [
        Push(cell(1), [State(7), Reg(value), Reg(pos), Reg(pos)]),
        SaveErrorSnapshot([]),
      ],
      [],
    ),
    terminator: Jump({ target: 1, arguments: [], }),
  }
  let reduce = {
    ..check_block(
      [],
      [
        Peek(0, cell(1), [None, Some(read), Some(start), Some(end)]),
        ReadPreviousPosition(1, before),
        Action(
          0,
          [{ value: Reg(read), start: Reg(start), end: Reg(end), }],
          Reg(before),
          result,
        ),
        Pop(cell(1), [None, None, None, None]),
        read_state,
      ],
      [],
    ),
    terminator: CaseState(Reg(state), [
      (4, { target: 2, arguments: [Reg(result), Reg(start), Reg(end)], }),
      (5, { target: 3, arguments: [Reg(result), Reg(start), Reg(end)], }),
    ]),
  }
  let next = {
    ..check_block(
      [next_value, next_start, next_end],
      [
        Push(cell(2), [
          State(8),
          Reg(next_value),
          Reg(next_start),
          Reg(next_end),
        ]),
      ],
      [],
    ),
    terminator: Jump({ target: 9, arguments: [], }),
  }
  let after = {
    ..root,
    instructions: [
      SaveErrorSnapshot([State(7)]),
      ReadPreviousPosition(0, before),
      Action(
        0,
        [{ value: Reg(value), start: Reg(pos), end: Reg(pos), }],
        Reg(before),
        result,
      ),
      read_state,
      Push(cell(2), [State(8), Reg(result), Reg(pos), Reg(pos)]),
    ],
    terminator: next.terminator,
  }
  let segments = [(0, root), (1, reduce), (2, next)]
  assert_true(check_stack_region(segments, after, incoming_state=4))
  assert_false(check_stack_region(segments, after))
  assert_false(check_stack_region(segments, after, incoming_state=5))
  assert_false(
    check_stack_region(
      [(0, root), (1, reduce), (3, next)],
      after,
      incoming_state=4,
    ),
  )
  let wrong_action = {
    ..after,
    instructions: [
      SaveErrorSnapshot([State(7)]),
      ReadPreviousPosition(0, before),
      Action(
        1,
        [{ value: Reg(value), start: Reg(pos), end: Reg(pos), }],
        Reg(before),
        result,
      ),
      read_state,
      Push(cell(2), [State(8), Reg(result), Reg(pos), Reg(pos)]),
    ],
  }
  assert_false(check_stack_region(segments, wrong_action, incoming_state=4))
}

///|
test "stack region checker binds edge arguments in parallel and checks arity" {
  let left = check_int(0)
  let right = check_int(1)
  let a = check_int(2)
  let b = check_int(3)
  let root = {
    ..check_block([left, right], [], []),
    terminator: Jump({ target: 1, arguments: [Reg(right), Reg(left)], }),
  }
  let next = check_block([a, b], [], [Reg(a), Reg(b)])
  let after = check_block([left, right], [], [Reg(right), Reg(left)])
  assert_true(check_stack_region([(0, root), (1, next)], after))
  assert_false(
    check_stack_region([(0, root), (1, next)], {
      ..after,
      terminator: Jump({ target: 0, arguments: [Reg(left), Reg(right)], }),
    }),
  )
  assert_false(
    check_stack_region([(0, root), (1, { ..next, parameters: [a], })], after),
  )
  let wrong_args = {
    ..root,
    terminator: Jump({ target: 1, arguments: [Reg(left), Reg(right)], }),
  }
  assert_false(check_stack_region([(0, wrong_args), (1, next)], after))
}

///|
test "stack checker state seed applies only to the original prefix top" {
  let parameter = check_reg(0, State)
  let top = check_reg(1, State)
  let deep = check_reg(2, State)
  let opaque_cell : Cell = { symbol: None, fields: [State], }
  let original = check_block(
    [parameter],
    [Peek(0, opaque_cell, [Some(top)]), Peek(1, opaque_cell, [Some(deep)])],
    [Reg(top), Reg(deep), Reg(parameter)],
  )
  let specialized = {
    ..original,
    terminator: Jump({
      target: 0,
      arguments: [State(4), Reg(deep), Reg(parameter)],
    }),
  }
  assert_true(check_stack_rewrite(original, specialized, incoming_state=4))
  assert_false(check_stack_rewrite(original, specialized))
  assert_false(
    check_stack_rewrite(
      original,
      {
        ..specialized,
        terminator: Jump({
          target: 0,
          arguments: [State(4), State(4), Reg(parameter)],
        }),
      },
      incoming_state=4,
    ),
  )
  assert_false(
    check_stack_rewrite(
      original,
      {
        ..specialized,
        terminator: Jump({
          target: 0,
          arguments: [State(4), Reg(deep), State(4)],
        }),
      },
      incoming_state=4,
    ),
  )
  // A constant result does not authorize removing the unknown prefix access.
  assert_false(
    check_stack_rewrite(
      original,
      { ..specialized, instructions: [Peek(1, opaque_cell, [Some(deep)])], },
      incoming_state=4,
    ),
  )
  let popped = check_block(
    [],
    [Pop(cell(1), [None, None, None, None]), Peek(0, opaque_cell, [Some(top)])],
    [Reg(top)],
  )
  assert_false(
    check_stack_rewrite(
      popped,
      { ..popped, terminator: Jump({ target: 0, arguments: [State(4)], }), },
      incoming_state=4,
    ),
  )
  let snapshot = check_block([], [SaveErrorSnapshot([])], [])
  assert_false(
    check_stack_rewrite(
      snapshot,
      { ..snapshot, instructions: [SaveErrorSnapshot([State(4)])], },
      incoming_state=4,
    ),
  )
}
