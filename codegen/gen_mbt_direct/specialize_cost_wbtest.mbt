///|
test "state-case elimination can pay for a selector but cannot hide excess region exits or growth" {
  let before = SpecializationCost::new(4, 6, 0, 0, 100)
  // A fixed jump routed through a new region replaces one proved state case.
  assert_true(before.admits(SpecializationCost::new(5, 6, 0, 1, 110), 112))
  // Fewer local selectors cannot pay for two extra exits with only one fold.
  assert_false(before.admits(SpecializationCost::new(6, 2, 0, 1, 100), 112))
  // Semantic savings never waive the emitted-code limit.
  assert_false(before.admits(SpecializationCost::new(4, 2, 0, 8, 113), 112))
}
