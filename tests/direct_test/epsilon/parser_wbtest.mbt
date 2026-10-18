///|
// No terminals or shift instructions: also check the generated code for warnings.
test "direct nullable entries without terminals preserve the initial position" {
  assert_eq(position([], initial_pos=42), 42)
  unit([], initial_pos=42)
}
