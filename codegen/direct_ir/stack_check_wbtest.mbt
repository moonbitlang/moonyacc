///|
fn check_reg(id : Int32, type_ : ValueType) -> Register {
  { id, type_, }
}

///|
fn check_int(id : Int32) -> Register {
  check_reg(id, Semantic(Constr(pkg=None, "Int", [])))
}

///|
fn check_block(
  parameters : Array[Register],
  instructions : Array[Instruction],
  arguments : Array[Value],
) -> Block {
  {
    hint: NoHint,
    origin: Helper,
    parameters,
    lookahead: Any,
    instructions,
    terminator: Jump({ target: 0, arguments, }),
  }
}

///|
test "stack rewrite checker forwards known values and positions across an action" {
  let value = check_int(0)
  let start = check_reg(1, Position)
  let end = check_reg(2, Position)
  let read = check_int(3)
  let read_start = check_reg(4, Position)
  let read_end = check_reg(5, Position)
  let before = check_reg(6, Position)
  let result = check_int(7)
  let parameters = [value, start, end]
  let original = check_block(
    parameters,
    [
      Push(cell(1), [State(4), Reg(value), Reg(start), Reg(end)]),
      Peek(0, cell(1), [None, Some(read), Some(read_start), Some(read_end)]),
      ReadPreviousPosition(0, before),
      Action(
        0,
        [{ value: Reg(read), start: Reg(read_start), end: Reg(read_end), }],
        Reg(before),
        result,
      ),
      Pop(cell(1), [None, None, None, None]),
    ],
    [Reg(result)],
  )
  let rewritten = check_block(
    parameters,
    [
      Action(
        0,
        [{ value: Reg(value), start: Reg(start), end: Reg(end), }],
        Reg(end),
        result,
      ),
    ],
    [Reg(result)],
  )
  assert_true(check_stack_rewrite(original, rewritten))
  let wrong_position = check_block(
    parameters,
    [
      Action(
        0,
        [{ value: Reg(value), start: Reg(start), end: Reg(end), }],
        Reg(start),
        result,
      ),
    ],
    [Reg(result)],
  )
  assert_false(check_stack_rewrite(original, wrong_position))
}

///|
test "stack rewrite checker preserves unknown prefix checks and initial position fallback" {
  let value = check_int(0)
  let start = check_reg(1, Position)
  let end = check_reg(2, Position)
  let read = check_int(3)
  let before = check_reg(4, Position)
  let state = check_reg(5, State)
  let parameters = [value, start, end]
  let original = check_block(
    parameters,
    [
      Push(cell(1), [State(4), Reg(value), Reg(start), Reg(end)]),
      Peek(1, cell(2), [None, Some(read), None, None]),
      ReadPreviousPosition(1, before),
      Pop(cell(1), [None, None, None, None]),
      Pop(cell(2), [None, None, None, None]),
      Peek(0, { symbol: None, fields: [State], }, [Some(state)]),
    ],
    [Reg(read), Reg(before), Reg(state)],
  )
  let rewritten = check_block(
    parameters,
    [
      Peek(0, cell(2), [None, Some(read), None, None]),
      ReadPreviousPosition(0, before),
      Pop(cell(2), [None, None, None, None]),
      Peek(0, { symbol: None, fields: [State], }, [Some(state)]),
    ],
    [Reg(read), Reg(before), Reg(state)],
  )
  assert_true(check_stack_rewrite(original, rewritten))
  let missing_check = {
    ..rewritten,
    instructions: [ReadPreviousPosition(0, before)],
  }
  assert_false(check_stack_rewrite(original, missing_check))
  let wrong_depth = check_block(
    parameters,
    [
      Peek(1, cell(2), [None, Some(read), None, None]),
      ReadPreviousPosition(0, before),
      Pop(cell(2), [None, None, None, None]),
      Peek(0, { symbol: None, fields: [State], }, [Some(state)]),
    ],
    [Reg(read), Reg(before), Reg(state)],
  )
  assert_false(check_stack_rewrite(original, wrong_depth))
}

///|
test "stack rewrite checker retains action order arguments and lexer timing" {
  let value = check_int(0)
  let other = check_int(1)
  let pos = check_reg(2, Position)
  let result = check_int(3)
  let unit = check_reg(4, Semantic(Constr(pkg=None, "Unit", [])))
  let input_value = check_int(5)
  let input_start = check_reg(6, Position)
  let input_end = check_reg(7, Position)
  let args = [{ value: Reg(value), start: Reg(pos), end: Reg(pos), }]
  let first : Instruction = Action(0, args, Reg(pos), result)
  let second : Instruction = Action(1, [], Reg(pos), unit)
  let input : Instruction = Input(1, input_value, input_start, input_end)
  let original = check_block(
    [value, other, pos],
    [first, second, EnsureLookahead, input, ConsumeLookahead],
    [],
  )
  assert_true(check_stack_rewrite(original, original))
  assert_false(
    check_stack_rewrite(original, {
      ..original,
      instructions: [second, first, EnsureLookahead, input, ConsumeLookahead],
    }),
  )
  assert_false(
    check_stack_rewrite(original, {
      ..original,
      instructions: [first, EnsureLookahead, input, ConsumeLookahead],
    }),
  )
  assert_false(
    check_stack_rewrite(original, {
      ..original,
      instructions: [EnsureLookahead, input, first, second, ConsumeLookahead],
    }),
  )
  assert_false(
    check_stack_rewrite(original, {
      ..original,
      instructions: [
        Action(
          0,
          [{ value: Reg(other), start: Reg(pos), end: Reg(pos), }],
          Reg(pos),
          result,
        ),
        second,
        EnsureLookahead,
        input,
        ConsumeLookahead,
      ],
    }),
  )
}

///|
test "stack rewrite checker snapshots logical state before later pops" {
  let value = check_int(0)
  let pos = check_reg(1, Position)
  let push : Instruction = Push(cell(1), [
    State(4),
    Reg(value),
    Reg(pos),
    Reg(pos),
  ])
  let pop : Instruction = Pop(cell(1), [None, None, None, None])
  let original = check_block([value, pos], [push, SaveErrorSnapshot([]), pop], [])
  assert_true(check_stack_rewrite(original, original))
  assert_true(
    check_stack_rewrite(original, {
      ..original,
      instructions: [SaveErrorSnapshot([State(4)])],
    }),
  )
  assert_false(
    check_stack_rewrite(original, {
      ..original,
      instructions: [SaveErrorSnapshot([])],
    }),
  )
  assert_false(
    check_stack_rewrite(original, {
      ..original,
      instructions: [push, pop, SaveErrorSnapshot([])],
    }),
  )
  assert_false(
    check_stack_rewrite(original, {
      ..original,
      instructions: [
        Push(cell(1), [State(5), Reg(value), Reg(pos), Reg(pos)]),
        SaveErrorSnapshot([]),
        pop,
      ],
    }),
  )
}

///|
test "stack rewrite checker normalizes physical and virtual snapshot suffixes" {
  let value = check_int(0)
  let pos = check_reg(1, Position)
  let first : Instruction = Push(cell(1), [
    State(4),
    Reg(value),
    Reg(pos),
    Reg(pos),
  ])
  let second : Instruction = Push(cell(2), [
    State(5),
    Reg(value),
    Reg(pos),
    Reg(pos),
  ])
  let pop_first : Instruction = Pop(cell(1), [None, None, None, None])
  let pop_second : Instruction = Pop(cell(2), [None, None, None, None])
  let original = check_block(
    [value, pos],
    [first, second, SaveErrorSnapshot([]), pop_second, pop_first],
    [],
  )
  let virtual_snapshot = {
    ..original,
    instructions: [SaveErrorSnapshot([State(4), State(5)])],
  }
  assert_true(check_stack_rewrite(original, virtual_snapshot))
  assert_true(
    check_stack_rewrite(original, {
      ..original,
      instructions: [first, SaveErrorSnapshot([State(5)]), pop_first],
    }),
  )
  assert_false(
    check_stack_rewrite(original, {
      ..original,
      instructions: [SaveErrorSnapshot([State(5), State(4)])],
    }),
  )
  assert_false(
    check_stack_rewrite(original, {
      ..original,
      instructions: [SaveErrorSnapshot([State(5)])],
    }),
  )
  assert_false(
    check_stack_rewrite(original, {
      ..original,
      instructions: [SaveErrorSnapshot([Reg(pos)])],
    }),
  )
  // Snapshot equivalence does not excuse a changed final physical stack.
  assert_false(
    check_stack_rewrite(
      { ..original, instructions: [first, second, SaveErrorSnapshot([])], },
      virtual_snapshot,
    ),
  )
}

///|
test "stack rewrite checker captures dynamic snapshot values and prefix identity" {
  let value = check_int(0)
  let pos = check_reg(1, Position)
  let initial = check_reg(2, State)
  let captured = check_reg(3, State)
  let later = check_reg(4, State)
  let push : Instruction = Push(cell(1), [
    Reg(captured),
    Reg(value),
    Reg(pos),
    Reg(pos),
  ])
  let pop : Instruction = Pop(cell(1), [None, None, None, None])
  let next : Instruction = Bind([(later, State(9))])
  let original = check_block(
    [value, pos, initial],
    [Bind([(captured, Reg(initial))]), push, SaveErrorSnapshot([]), pop, next],
    [Reg(later)],
  )
  assert_true(
    check_stack_rewrite(original, {
      ..original,
      instructions: [SaveErrorSnapshot([Reg(initial)]), next],
    }),
  )
  assert_false(
    check_stack_rewrite(original, {
      ..original,
      instructions: [next, SaveErrorSnapshot([Reg(later)])],
    }),
  )
  let prefix_pop : Instruction = Pop(cell(2), [None, None, None, None])
  let before_pop = check_block(
    [],
    [SaveErrorSnapshot([State(4)]), prefix_pop],
    [],
  )
  let after_pop = check_block([], [prefix_pop, SaveErrorSnapshot([State(4)])], [])
  assert_false(check_stack_rewrite(before_pop, after_pop))
}

///|
test "stack rewrite checker resolves parallel copies and constant state exits" {
  let left = check_int(0)
  let right = check_int(1)
  let a = check_int(2)
  let b = check_int(3)
  let state = check_reg(4, State)
  let original = check_block(
    [left, right],
    [Bind([(a, Reg(right)), (b, Reg(left))])],
    [Reg(a), Reg(b)],
  )
  assert_true(
    check_stack_rewrite(
      original,
      check_block([left, right], [], [Reg(right), Reg(left)]),
    ),
  )
  assert_false(
    check_stack_rewrite(
      original,
      check_block([left, right], [], [Reg(left), Reg(right)]),
    ),
  )
  let invalid_parallel = check_block(
    [left, right],
    [Bind([(a, Reg(right)), (b, Reg(a))])],
    [Reg(a), Reg(b)],
  )
  assert_false(check_stack_rewrite(invalid_parallel, invalid_parallel))
  let branch = {
    ..check_block([], [Bind([(state, State(2))])], []),
    terminator: CaseState(Reg(state), [
      (2, Body::jump({ target: 1, arguments: [], })),
    ]),
  }
  assert_true(
    check_stack_rewrite(branch, {
      ..branch,
      instructions: [],
      terminator: Jump({ target: 1, arguments: [], }),
    }),
  )
}

///|
test "stack rewrite checker rejects incompatible cells and malformed reads" {
  let checked_read = check_block(
    [],
    [Peek(0, cell(1), [None, None, None, None])],
    [],
  )
  assert_false(check_stack_rewrite(checked_read, check_block([], [], [])))
  let value = check_int(0)
  let pos = check_reg(1, Position)
  let valid = check_block(
    [value, pos],
    [
      Push(cell(1), [State(4), Reg(value), Reg(pos), Reg(pos)]),
      Pop(cell(1), [None, None, None, None]),
    ],
    [],
  )
  let bad_symbol = {
    ..valid,
    instructions: [
      valid.instructions[0],
      Pop(cell(2), [None, None, None, None]),
    ],
  }
  assert_false(check_stack_rewrite(bad_symbol, bad_symbol))
  let bad_arity = { ..valid, instructions: [Peek(0, cell(1), [])], }
  assert_false(check_stack_rewrite(bad_arity, bad_arity))
  let bad_field = {
    ..valid,
    instructions: [
      Push({ symbol: Some(1), fields: [State, State], }, [State(4), State(4)]),
    ],
  }
  assert_false(check_stack_rewrite(bad_field, bad_field))
  let unbound_reg = { ..valid, terminator: Return(0, Reg(check_int(99))), }
  assert_false(check_stack_rewrite(unbound_reg, unbound_reg))
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
