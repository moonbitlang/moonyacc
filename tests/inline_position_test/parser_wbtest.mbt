///|
test "inline ranges include every token and preserve following references" {
  assert_eq(
    multi([(P, 1, 2), (A, 10, 11), (B, 20, 21), (C, 30, 31)], initial_pos=0),
    [(10, 21), (10, 21), (30, 31), (1, 31), (1, 31)],
  )
  // A zero-width token is skipped, but an inline symbol is still considered
  // as one original span, even when its first token has zero width.
  assert_eq(
    multi([(P, 1, 1), (A, 10, 10), (B, 20, 21), (C, 30, 31)], initial_pos=0),
    [(10, 21), (10, 21), (30, 31), (1, 31), (10, 31)],
  )
}

///|
test "empty inline ranges use the initial or preceding end position" {
  assert_eq(empty_before([(C, 10, 11)], initial_pos=0), [
    (0, 0),
    (0, 0),
    (0, 11),
    (10, 11),
  ])
  assert_eq(empty_after([(P, 1, 2)], initial_pos=0), [
    (2, 2),
    (2, 2),
    (1, 2),
    (1, 2),
  ])
  assert_eq(all_empty([], initial_pos=7), [(7, 7), (7, 7), (7, 7), (7, 7)])
}

///|
test "nested inline ranges survive further expansion and enclosing reductions" {
  let tokens = [(P, 1, 2), (A, 10, 11), (B, 20, 21), (C, 30, 31)]
  assert_eq(nested(tokens, initial_pos=0), [
    (2, 2),
    (10, 21),
    (2, 21),
    (10, 21),
    (21, 21),
    (2, 21),
    (21, 21),
    (30, 31),
    (1, 31),
    (1, 31),
  ])
  assert_eq(propagated(tokens, initial_pos=0), [
    (2, 2),
    (10, 21),
    (2, 21),
    (10, 21),
    (2, 21),
    (2, 21),
    (2, 21),
    (30, 31),
  ])
}
