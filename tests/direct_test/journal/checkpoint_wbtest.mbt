///|
/// This grammar still requires a journal. Compare the emitted checkpoint with
/// an immutable reference, across
/// reductions that overwrite older states, new shifts, and buffer reuse.
test "state checkpoint survives nested overwrites and repeated snapshots" {
  let stack : YYStateStack = {
    values: [0],
    depth: 1,
    checkpoint: 1,
    saved_prefix: 1,
    undo: [],
  }
  let reference = [0]
  let mut snapshot = reference.copy()
  let mut random = 37U
  for step in 0..<2000 {
    random = random * 1664525U + 1013904223U
    match random % 5U {
      0U => {
        yy_stack_checkpoint(stack)
        snapshot = reference.copy()
      }
      1U | 2U if reference.length() > 1 => {
        stack.depth -= 1
        reference.truncate(reference.length() - 1)
      }
      _ => {
        yy_stack_push(stack, step)
        reference.push(step)
      }
    }
    assert_eq(stack.depth, reference.length())
    assert_eq(stack.values[:stack.depth].to_owned(), reference)
    let actual = yy_stack_snapshot(stack).iter().to_array()
    assert_eq(actual, snapshot.rev())
    assert_true(stack.undo.length() <= stack.values.length())
    assert_true(stack.undo.length() >= stack.checkpoint - stack.saved_prefix)
  }
}

///|
test "error after nullable reductions still describes the last shifted prefix" {
  start([NUMBER, NUMBER, N, EOF].map(t => (t, (), ())))
  start([LP, NUMBER, NUMBER, BAD].map(t => (t, (), ())))
  try start([NUMBER, NUMBER, BAD].map(t => (t, (), ()))) catch {
    UnexpectedToken(BAD, _, expected) => {
      assert_eq(expected.length(), 3)
      assert_true(expected.any(t => t is TK_NUMBER))
      assert_true(expected.any(t => t is TK_N))
      assert_true(expected.any(t => t is TK_EOF))
    }
    _ => fail("wrong journal-backed error")
  } noraise {
    _ => fail("accepted a terminator from the other prefix")
  }
}
