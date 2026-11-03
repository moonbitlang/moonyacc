///|
test "exhaustive token bindings retain heterogeneous values and spans across a recursive stack" {
  assert_eq(
    start([(NUMBER(7), 1, 2), (TEXT("word"), 4, 8), (NUMBER(9), 10, 11)]),
    [("7", 1, 2), ("word", 4, 8), ("9", 10, 11)],
  )
  assert_true(start([], initial_pos=42).is_empty())
}
