///|
fn cache_knowledge() -> StackKnowledge {
  {
    transitions: [[]],
    short: [[]],
    long: [[]],
    production_sites: [],
    entry_origins: [Set([0])],
  }
}

///|
test "cache contracts carry empty and present facts through joins and loops" {
  let base = check_block([], [], [])
  let value = check_reg(0, Semantic(Constr(pkg=None, "Unit", [])))
  let start = check_reg(1, Position)
  let end = check_reg(2, Position)
  let stop : Body = { instructions: [], terminator: Stop, }
  let program = fixture([
    {
      ..base,
      instructions: [EnsureLookahead],
      terminator: CaseToken(
        [(BindToken(1, value, start, end), Body::jump(edge(1)))],
        stop,
      ),
    },
    {
      ..base,
      lookahead: On(Terminal(1)),
      instructions: [ConsumeLookahead],
      terminator: Jump(edge(2)),
    },
    {
      ..base,
      instructions: [EnsureLookahead],
      terminator: CaseToken(
        [(Tokens([Terminal(1)]), Body::jump(edge(3)))],
        stop,
      ),
    },
    {
      ..base,
      instructions: [EnsureLookahead],
      terminator: CaseToken(
        [(Tokens([Terminal(1)]), Body::jump(edge(1)))],
        stop,
      ),
    },
  ])
  program.validate()
  let optimized = program.prune_control(cache_knowledge())
  assert_true(optimized.blocks[0].lookahead is Empty)
  assert_true(optimized.blocks[0].instructions is [LoadLookahead])
  assert_true(optimized.blocks[1].lookahead is On(Terminal(1)))
  assert_true(optimized.blocks[2].lookahead is Empty)
  assert_true(optimized.blocks[2].instructions is [LoadLookahead])
  assert_true(optimized.blocks[3].lookahead is On(Terminal(1)))
  assert_true(optimized.blocks[3].instructions.is_empty())
  ignore(optimized.stack_flow(cache_knowledge()))
  // A local declaration is not a proof. Invalid claims must be rejected even
  // when no binding pattern happens to expose them in the block body.
  let invalid = { ..program, blocks: program.blocks.copy(), }
  invalid.blocks[2] = { ..invalid.blocks[2], lookahead: Present, }
  assert_true(
    try {
      ignore(invalid.prune_control(cache_knowledge()))
      false
    } catch {
      _ => true
    },
  )
}

///|
test "a consumed token and cached EOF require a conditional read at their join" {
  let base = check_block([], [], [])
  let program = fixture([
    {
      ..base,
      lookahead: Empty,
      instructions: [LoadLookahead],
      terminator: CaseToken(
        [
          (
            Tokens([Terminal(1)]),
            { instructions: [ConsumeLookahead], terminator: Jump(edge(1)), },
          ),
          (Tokens([EndOfInput]), Body::jump(edge(1))),
        ],
        { instructions: [], terminator: Unreachable, },
      ),
    },
    { ..base, instructions: [EnsureLookahead], terminator: Stop, },
  ])
  program.validate()
  let optimized = program.prune_control(cache_knowledge())
  assert_true(optimized.blocks[1].lookahead is Any)
  assert_true(optimized.blocks[1].instructions is [EnsureLookahead])
  let entry = optimized.stack_flow(cache_knowledge()).entries[1].unwrap()
  assert_true(entry.empty_token)
  assert_true(entry.tokens.contains(EndOfInput))
}

///|
test "singleton token proofs survive case removal and reject unsupported refinements" {
  let block = check_block([], [], [])
  let base = fixture([block])
  let program = {
    ..base,
    terminal_count: 0,
    symbols: [base.symbols[0]],
    blocks: [
      { ..block, instructions: [EnsureLookahead], terminator: Jump(edge(1)), },
      {
        ..block,
        lookahead: Present,
        terminator: CaseToken(
          [(Tokens([EndOfInput]), { instructions: [], terminator: Stop, })],
          { instructions: [], terminator: Unreachable, },
        ),
      },
    ],
  }
  let after = program.prune_control(cache_knowledge())
  assert_true(
    after.blocks[0].instructions is [LoadLookahead, RefineLookahead(EndOfInput)],
  )
  assert_true(after.blocks[1].terminator is Stop)
  ignore(after.stack_flow(cache_knowledge()))
  let invalid = fixture([
    {
      ..block,
      instructions: [EnsureLookahead, RefineLookahead(Terminal(1))],
      terminator: Stop,
    },
  ])
  invalid.validate()
  assert_true(
    try {
      ignore(invalid.stack_flow(cache_knowledge()))
      false
    } catch {
      InvalidProgram(_) => true
    },
  )
}
