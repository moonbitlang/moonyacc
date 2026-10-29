///|
fn checkpoint_push() -> Instruction {
  Push({ symbol: Some(1), fields: [State], }, [State(0)])
}

///|
fn checkpoint_pop() -> Instruction {
  Pop({ symbol: Some(1), fields: [State], }, [None])
}

///|
fn checkpoint_fixture() -> Program {
  let base = check_block([], [], [])
  let push = checkpoint_push()
  let pop = checkpoint_pop()
  let source = fixture([
    {
      ..base,
      instructions: [push, push, SaveErrorSnapshot([])],
      terminator: CaseState(State(0), [
        (0, Body::jump(edge(1))),
        (1, Body::jump(edge(6))),
      ]),
    },
    {
      ..base,
      instructions: [push],
      terminator: CaseState(State(0), [
        (0, { instructions: [pop], terminator: Jump(edge(3)), }),
        (1, { instructions: [pop, pop], terminator: Jump(edge(2)), }),
      ]),
    },
    { ..base, instructions: [push], terminator: Jump(edge(3)), },
    { ..base, instructions: [pop], terminator: Jump(edge(4)), },
    {
      ..base,
      instructions: [SaveErrorSnapshot([State(0), State(1)])],
      terminator: Jump(edge(1)),
    },
    // Unreachable pushes must never acquire an optimization permission.
    { ..base, instructions: [push], },
    // The relation analysis must converge even on an apparent pop-only cycle;
    // stack-shape feasibility is the responsibility of the existing StackFlow.
    { ..base, instructions: [pop], terminator: Jump(edge(6)), },
  ])
  { ..source, diagnostics: [..source.diagnostics, ..source.diagnostics], }
}

///|
test "checkpoint facts join branches, cross loops, and ignore virtual suffix depth" {
  let source = checkpoint_fixture()
  let flow = source.checkpoint_flow()
  assert_eq(flow.entry(0).upper, Some(0))
  assert_eq(flow.entry(1).upper, Some(0))
  assert_false(flow.entry(2).no_overlap())
  assert_eq(flow.entry(3).upper, Some(0))
  assert_false(flow.entry(4).no_overlap())
  assert_true(flow.entries[5] is None)
  assert_false(flow.entry(5).no_overlap())
  assert_false(flow.entry(6).no_overlap())
  assert_true(flow.requires_journal(source))
  assert_true(flow.has_unprotected_push(source))
  flow.validate(source)
  let safe = fixture([
    {
      ..check_block([], [], []),
      instructions: [checkpoint_push(), checkpoint_pop(), checkpoint_push()],
    },
  ])
  assert_false(safe.checkpoint_flow().requires_journal(safe))
  assert_true(safe.checkpoint_flow().has_unprotected_push(safe))
}

///|
test "the checkpoint checker rejects stronger entry claims and missing edges" {
  let source = checkpoint_fixture()
  let flow = source.checkpoint_flow()
  let invalid : Array[(Int32, CheckpointFact?)] = [
    (0, Some({ upper: Some(-1), })),
    (2, Some({ upper: Some(0), })),
    (3, None),
    (6, Some({ upper: Some(0), })),
    (1, Some({ upper: Some(1), })),
  ]
  for (label, claim) in invalid {
    let entries = flow.entries.copy()
    entries[label] = claim
    assert_true(
      try {
        CheckpointFlow::{ entries, }.validate(source)
        false
      } catch {
        _ => true
      },
    )
  }
}
