///|
test "token pruning removes one nonbinding branch covering a multi-token domain" {
  let (base, knowledge) = stack_flow_fixture([], Unreachable)
  let block = base.blocks[0]
  let tokens = Tokens([Terminal(1), Terminal(2)])
  let stop : Body = { instructions: [], terminator: Stop, }
  let program = {
    ..base,
    blocks: [
      {
        ..block,
        instructions: [EnsureLookahead],
        terminator: CaseToken([(tokens, Body::jump(edge(1)))], stop),
      },
      {
        ..block,
        lookahead: Present,
        terminator: CaseToken(
          [
            (
              tokens,
              { instructions: [SaveErrorSnapshot([])], terminator: Stop, },
            ),
          ],
          stop,
        ),
      },
    ],
  }
  let after = program.prune_control(knowledge)
  assert_true(after.blocks[1].instructions is [SaveErrorSnapshot([])])
  assert_true(after.blocks[1].terminator is Stop)
  ignore(after.stack_flow(knowledge))
}

///|
test "final inlining sees single-entry blocks exposed by token pruning" {
  let block = check_block([], [], [])
  let stop : Body = { instructions: [], terminator: Stop, }
  let program = fixture([
    {
      ..block,
      instructions: [EnsureLookahead],
      terminator: CaseToken(
        [(Tokens([Terminal(1)]), Body::jump(edge(1)))],
        stop,
      ),
    },
    {
      ..block,
      lookahead: Present,
      terminator: CaseToken(
        [
          (Tokens([Terminal(1)]), Body::jump(edge(2))),
          (Tokens([EndOfInput]), Body::jump(edge(2))),
        ],
        { instructions: [], terminator: Unreachable, },
      ),
    },
    {
      ..block,
      lookahead: Present,
      instructions: [SaveErrorSnapshot([])],
      terminator: Stop,
    },
  ])
  let after = program.prepare(cache_knowledge(), positions=false).program
  assert_eq(after.blocks.length(), 2)
  guard after.blocks[0].terminator is CaseToken([(_, branch)], _) else {
    fail("lost the entry token decision")
  }
  assert_true(branch.instructions is [SaveErrorSnapshot([])])
  guard branch.terminator is Jump(edge) else {
    fail("lost the shared error exit")
  }
  assert_true(after.blocks[edge.target].terminator is Stop)
  assert_eq(
    after.blocks.fold(init=0, (n, b) => n + b.terminator.stop_count()),
    1,
  )
}
