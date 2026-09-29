///|
test "generated syntax preserves calls, grouping and literal contents" {
  let env = make_env(0)
  assert_eq(from_field(env), 6)
  assert_eq(from_method(env), 1003)
  assert_eq(grouping(), 7)
  assert_eq(table_value(), 20)
  assert_true(bit_precedence())
  assert_eq(literal(), "quote:\" slash:\\ interp:\\{x} 😀\r\n\u0000")
  assert_eq(char_literal(), '\'')
  let reader : Reader = make_reader()
  assert_eq(reader(4), 5)
  let same = identity_reader()
  assert_eq(same(4), 4)
  assert_eq(identity("hello"), "hello")
}

///|
test "generated statements, declarations and raw blocks compile and execute" {
  assert_eq(sum_squares(4), 14)
  assert_eq(sum_tail([10, 2, 3]), 5)
  assert_eq(walk(4), 6)
  assert_eq(loop_result(10), 3)
  assert_eq(loop_result(1), 0)
  let env = Env::{ read: x => x, value: 3, }
  assert_eq(bump(env), 4)
  assert_eq(show_ready(), "ready")
  assert_eq(user_code(), 42)
  assert_eq(positive(2), 2)
  try positive(-1) catch {
    Failed(-1) => ()
    _ => fail("wrong error")
  } noraise {
    _ => fail("expected rejection")
  }
}
