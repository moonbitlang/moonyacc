///|
test "continuation merging is alpha-equivalent and preserves argument order" {
  let base = check_block([], [], [])
  let a = check_reg(0, State)
  let b = check_reg(1, State)
  let x = check_reg(2, State)
  let y = check_reg(3, State)
  let source = fixture([
    {
      ..base,
      instructions: [EnsureLookahead],
      terminator: CaseToken(
        [
          (
            Tokens([Terminal(1)]),
            Body::jump({ target: 1, arguments: [State(0)], }),
          ),
        ],
        Body::jump({ target: 2, arguments: [State(0)], }),
      ),
    },
    {
      ..base,
      lookahead: Present,
      parameters: [a],
      instructions: [Bind([(b, Reg(a))]), SaveErrorSnapshot([Reg(b)])],
      terminator: Jump(edge(3)),
    },
    {
      ..base,
      lookahead: Present,
      parameters: [x],
      instructions: [Bind([(y, Reg(x))]), SaveErrorSnapshot([Reg(y)])],
      terminator: Jump(edge(3)),
    },
    { ..base, lookahead: Present, terminator: Stop, },
  ])
  let merged = source.merge_continuations()
  assert_eq(merged.blocks.length(), 3)
  guard! merged.blocks[0].terminator is CaseToken([(_, first)], second)
  assert_true(first.terminator == second.terminator)
  let different = { ..source, blocks: source.blocks.copy(), }
  different.blocks[2] = {
    ..source.blocks[2],
    instructions: [Bind([(y, State(0))]), SaveErrorSnapshot([Reg(y)])],
  }
  assert_eq(different.merge_continuations().blocks.length(), 4)
  let contract = { ..source, blocks: source.blocks.copy(), }
  contract.blocks[2] = { ..source.blocks[2], lookahead: Any, }
  contract.blocks[3] = {
    ..source.blocks[3],
    lookahead: Any,
    instructions: [EnsureLookahead],
  }
  assert_eq(contract.merge_continuations().blocks.length(), 4)
}
