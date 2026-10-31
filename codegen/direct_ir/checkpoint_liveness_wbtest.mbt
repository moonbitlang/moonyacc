///|
fn live_checkpoint_fixture() -> Program {
  let base = { ..check_block([], [], []), lookahead: Present, }
  let push = checkpoint_push()
  let pop = checkpoint_pop()
  fixture([
    {
      ..base,
      lookahead: Empty,
      instructions: [LoadLookahead, push, SaveErrorSnapshot([State(0)])],
      terminator: Jump(edge(1)),
    },
    {
      ..base,
      terminator: CaseToken(
        [
          (
            Tokens([Terminal(1)]),
            { instructions: [pop, push], terminator: Jump(edge(2)), },
          ),
        ],
        { instructions: [], terminator: Stop, },
      ),
    },
    {
      ..base,
      instructions: [SaveErrorSnapshot([])],
      terminator: Jump(edge(3)),
    },
    {
      ..base,
      instructions: [SaveErrorSnapshot([State(0)])],
      terminator: Jump(edge(1)),
    },
  ])
}

///|
test "dead snapshots cross branches and loops but are refreshed before observation" {
  let source = live_checkpoint_fixture()
  let live = source.snapshot_liveness()
  assert_true(live.entries == [false, true, false, false])
  let program = source.discard_unobserved_snapshots()
  assert_true(program.blocks[2].instructions.is_empty())
  assert_true(
    program.blocks[0].instructions.last() is Some(SaveErrorSnapshot(_)),
  )
  assert_true(program.blocks[3].instructions is [SaveErrorSnapshot(_)])
  let flow = program.checkpoint_flow()
  assert_false(flow.entry(2).valid)
  assert_false(flow.entry(2).current)
  assert_eq(flow.entry(2).upper, None)
  assert_true(flow.entry(1).valid && flow.entry(1).current)
  assert_false(flow.requires_journal(program))
  assert_true(flow.requires_save(program))
  // A pop/push pair restores depth but may replace content. It cannot prove
  // that the next capture is redundant, nor that the old snapshot is valid.
  for claim in [{ ..flow.entry(2), valid: true, }, CheckpointFact::initial()] {
    let entries = flow.entries.copy()
    entries[2] = Some(claim)
    assert_true(
      try {
        CheckpointFlow::{ ..flow, entries, }.validate(program)
        false
      } catch {
        InvalidProgram(_) => true
      },
    )
  }
  let entries = live.entries.copy()
  entries[1] = false
  assert_true(
    try {
      SnapshotLiveness::{ entries, }.validate(source)
      false
    } catch {
      InvalidProgram(_) => true
    },
  )
}

///|
test "unchanged physical prefix does not erase live virtual suffix updates" {
  let base = { ..check_block([], [], []), lookahead: Present, }
  let source = fixture([
    {
      ..base,
      lookahead: Empty,
      instructions: [LoadLookahead, SaveErrorSnapshot([State(0)])],
      terminator: CaseToken([(Tokens([Terminal(1)]), Body::jump(edge(1)))], {
        instructions: [],
        terminator: Stop,
      }),
    },
    {
      ..base,
      instructions: [SaveErrorSnapshot([State(0), State(0)])],
      terminator: Stop,
    },
  ])
  let program = source.discard_unobserved_snapshots()
  assert_true(
    program.blocks[0].instructions
    is [LoadLookahead, SaveErrorSnapshot([State(0)])],
  )
  assert_true(
    program.blocks[1].instructions is [SaveErrorSnapshot([State(0), State(0)])],
  )
  let flow = program.checkpoint_flow()
  assert_true(flow.entry(1).current)
  assert_false(flow.requires_save(program))
  assert_false(flow.requires_journal(program))
}

///|
test "snapshot validity alone does not prove that a physical save is redundant" {
  let base = { ..check_block([], [], []), lookahead: Present, }
  let source = fixture([
    {
      ..base,
      lookahead: Empty,
      instructions: [LoadLookahead, checkpoint_push()],
      terminator: Jump(edge(1)),
    },
    { ..base, instructions: [SaveErrorSnapshot([])], terminator: Stop, },
  ])
  let flow = source.checkpoint_flow()
  assert_true(flow.entry(1).valid)
  assert_false(flow.entry(1).current)
  assert_true(flow.requires_save(source))
  let entries = flow.entries.copy()
  // The bound 0 is conservative here and validity is true, but the claimed
  // equality is false: the current stack is longer than the saved prefix.
  entries[1] = Some(CheckpointFact::initial())
  assert_true(
    try {
      CheckpointFlow::{ ..flow, entries, }.validate(source)
      false
    } catch {
      InvalidProgram(_) => true
    },
  )
}
