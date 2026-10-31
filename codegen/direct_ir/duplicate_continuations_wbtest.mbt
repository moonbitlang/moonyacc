///|
test "continuation duplication preserves branch-local parallel arguments and effects" {
  let base = check_block([], [], [])
  let left = check_reg(0, State)
  let right = check_reg(1, State)
  let out = check_reg(2, Semantic(Constr(pkg=None, "Unit", [])))
  let source = {
    ..fixture([]),
    symbols: [
      ..fixture([]).symbols,
      { name: "n", type_: Constr(pkg=None, "Unit", []), },
    ],
    diagnostics: [fixture([]).diagnostics[0], fixture([]).diagnostics[0]],
    actions: [{ lhs: 2, rhs: [], inputs: [], callable: true, }],
    blocks: [
      {
        ..base,
        instructions: [EnsureLookahead],
        terminator: CaseToken(
          [
            (
              Tokens([Terminal(1)]),
              Body::jump({ target: 1, arguments: [State(0), State(1)], }),
            ),
          ],
          Body::jump({ target: 1, arguments: [State(1), State(0)], }),
        ),
      },
      {
        ..base,
        parameters: [left, right],
        lookahead: Present,
        instructions: [
          SaveErrorSnapshot([Reg(left), Reg(right)]),
          Action(0, [], out),
        ],
        terminator: Jump(edge(2)),
      },
      { ..base, lookahead: Present, terminator: Stop, },
    ],
  }
  let result = source.duplicate_continuations([1])
  assert_true(result.sources == [0, 2])
  let after = result.program
  assert_eq(after.blocks.length(), 2)
  guard! after.blocks[0].terminator is CaseToken([(_, a)], b)
  guard! a.instructions
    is [Bind(a_args), SaveErrorSnapshot(_), Action(0, [], a_out)]
  guard! b.instructions
    is [Bind(b_args), SaveErrorSnapshot(_), Action(0, [], b_out)]
  assert_true(a_args.map(p => p.1) == [State(0), State(1)])
  assert_true(b_args.map(p => p.1) == [State(1), State(0)])
  assert_true(a_out.id != b_out.id && a_args[0].0.id != b_args[0].0.id)
  after.validate()
  // The checker executes an original call, not the duplicator's expansion.
  let caller = {
    ..base,
    instructions: [EnsureLookahead],
    terminator: Jump({ target: 1, arguments: [State(0), State(1)], }),
  }
  let expected = stack_check_run(
    caller,
    continuations=Map([(1, source.blocks[1])]),
  )
  let wrong = {
    ..caller,
    instructions: [
      EnsureLookahead,
      Bind([(left, State(1)), (right, State(0))]),
      SaveErrorSnapshot([Reg(left), Reg(right)]),
      Action(0, [], out),
    ],
    terminator: Jump(edge(2)),
  }
  assert_false(expected == stack_check_run(wrong))
}

///|
test "continuation duplication rejects recursive selections and public entries" {
  let source = fixture([
    forwarding([], 1, []),
    forwarding([], 2, []),
    forwarding([], 1, []),
  ])
  for labels in [[0], [1, 2], [1, 1], [-1]] {
    assert_true(
      try {
        ignore(source.duplicate_continuations(labels))
        false
      } catch {
        InvalidProgram(_) => true
      },
    )
  }
  // One side of the cycle may be duplicated: the resulting self-loop still
  // performs the original path and never introduces recursive parser calls.
  let result = source.duplicate_continuations([1]).program
  assert_eq(result.blocks.length(), 2)
  assert_true(result.blocks[1].terminator is Jump({ target: 1, .. }))
}
