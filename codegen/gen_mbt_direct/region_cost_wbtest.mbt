///|
test "region costs measure expanded stack writes independently of formatting" {
  let assignment = body([Assign(Ident("slot"), Int(1))])
  let renamed = body([
    Comment("a longer diagnostic comment"),
    Eval(Unit),
    Assign(Ident("a_much_longer_slot_name"), Int(123456)),
  ])
  assert_eq(emission_cost(assignment), emission_cost(renamed))
  // Both were one logical instruction, but this real emitter helper creates
  // length testing, an array write/growth branch, and a merge.
  let write = body([array_stack_write(Ident("values"), Ident("depth"), Int(1))])
  assert_true(emission_cost(write) > emission_cost(assignment))
  assert_eq(emission_cost(body([Eval(Unit), Comment("proof only")])), 0)
  let nested = value_block(If(Bool(true), write, Some(assignment)))
  assert_true(
    emission_cost(nested) > emission_cost(write) + emission_cost(assignment),
  )
}
