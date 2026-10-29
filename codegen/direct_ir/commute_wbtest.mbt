///|
fn commute_test(block : Block) -> Block raise InvalidProgram {
  let program = fixture([block])
  let pass = PushCommuter::{ program, supply: RegisterSupply::new(program), }
  let result = pass.body(
    { instructions: block.instructions, terminator: block.terminator, },
    { pushes: [], aliases: Map([]), prefix_state: None, },
    Set([0]),
  )
  require(result.absorbed == 0, "unbalanced test rewrite")
  let before = {
    ..block,
    instructions: result.before.instructions,
    terminator: result.before.terminator,
  }
  let after = {
    ..block,
    instructions: result.after.instructions,
    terminator: result.after.terminator,
  }
  require(check_stack_rewrite(before, after), "non-equivalent test rewrite")
  after
}

///|
test "push trains split across token branches with exact prefix reads and snapshots" {
  let value = check_int(0)
  let pos = check_reg(1, Position)
  let prefix = check_reg(2, State)
  let lower = cell(1)
  let upper = cell(2)
  let pop_lower = Instruction::Pop(lower, [None, None, None, None])
  let pop_upper = Instruction::Pop(upper, [None, None, None, None])
  let branch_read = check_reg(3, State)
  let stop : Body = { instructions: [], terminator: Stop, }
  let original = {
    ..check_block(
      [value, pos],
      [
        Push(lower, [State(3), Reg(value), Reg(pos), Reg(pos)]),
        Push(upper, [State(4), Reg(value), Reg(pos), Reg(pos)]),
        Peek(2, { symbol: None, fields: [State], }, [Some(prefix)]),
        SaveErrorSnapshot([]),
        EnsureLookahead,
      ],
      [],
    ),
    terminator: CaseToken(
      [
        (
          [Terminal(1)],
          {
            instructions: [pop_upper, pop_lower],
            terminator: Jump({ target: 0, arguments: [Reg(prefix)], }),
          },
        ),
        (
          [Terminal(2), Terminal(3)],
          {
            instructions: [
              pop_upper,
              Peek(1, { symbol: None, fields: [State], }, [Some(branch_read)]),
            ],
            terminator: Jump({ target: 0, arguments: [Reg(branch_read)], }),
          },
        ),
      ],
      stop,
    ),
  }
  let after = commute_test(original)
  assert_true(
    after.instructions
    is [Peek(0, _, _), SaveErrorSnapshot([State(3), State(4)]), EnsureLookahead],
  )
  guard after.terminator is CaseToken([(_, empty), (_, padded)], fallback) else {
    fail("lost token branches")
  }
  assert_true(empty.instructions.is_empty())
  assert_true(
    padded.instructions is [Push(cell, _), Peek(1, _, _)] && cell == lower,
  )
  assert_true(fallback.instructions.is_empty())
  // An incorrect snapshot still compiles, so test the independent checker too.
  let wrong = {
    ..after,
    instructions: [
      Peek(0, { symbol: None, fields: [State], }, [Some(prefix)]),
      SaveErrorSnapshot([State(4)]),
      EnsureLookahead,
    ],
  }
  assert_false(check_stack_rewrite(original, wrong))
}

///|
test "commuting partial cells preserves extraction consumption and action order" {
  let value = check_int(0)
  let sp = check_reg(1, Position)
  let ep = check_reg(2, Position)
  let read = check_int(3)
  let result = check_int(4)
  let partial : Cell = { symbol: Some(1), fields: [Semantic, State], }
  let original = {
    ..check_block(
      [],
      [
        EnsureLookahead,
        Input(1, value, sp, ep),
        Push(partial, [Reg(value), State(7)]),
        ConsumeLookahead,
        SaveErrorSnapshot([]),
        Peek(0, partial, [Some(read), None]),
        Action(
          0,
          [{ value: Reg(read), start: Reg(sp), end: Reg(ep), }],
          Reg(sp),
          result,
        ),
        Pop(partial, [None, None]),
      ],
      [Reg(result)],
    ),
    lookahead: On(Terminal(1)),
  }
  let after = commute_test(original)
  assert_true(
    after.instructions
    is [
      EnsureLookahead,
      Input(_),
      ConsumeLookahead,
      SaveErrorSnapshot([State(7)]),
      Action(_),
    ],
  )
  let changed = after.instructions.copy()
  let action = changed[4]
  changed[4] = changed[2]
  changed[2] = action
  assert_false(
    check_stack_rewrite(original, { ..after, instructions: changed, }),
  )
}

///|
test "only unobserved pushes vanish before failure" {
  let cell : Cell = { symbol: Some(1), fields: [State], }
  let original = {
    ..check_block([], [Push(cell, [State(1)])], []),
    terminator: Stop,
  }
  assert_true(commute_test(original).instructions.is_empty())
  let captured = {
    ..original,
    instructions: [Push(cell, [State(1)]), SaveErrorSnapshot([])],
  }
  assert_true(
    commute_test(captured).instructions is [Push(_), SaveErrorSnapshot([])],
  )
}
