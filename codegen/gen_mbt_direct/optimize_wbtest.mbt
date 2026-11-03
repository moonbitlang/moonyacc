///|
test "parallel copies preserve cycles, identity slots and local inputs" {
  let a : @direct_ir.Register = { id: 0, type_: State, }
  let b : @direct_ir.Register = { id: 1, type_: State, }
  let c : @direct_ir.Register = { id: 2, type_: State, }
  let position : @direct_ir.Register = { id: 3, type_: Position, }
  fn slot(r : @direct_ir.Register) -> (Int32, Int32)? {
    if r.id < 2 {
      Some((0, r.id))
    } else {
      None
    }
  }
  fn read(v : @direct_ir.Value, slots : Array[Int32]) -> Int32 {
    match v {
      State(n) => n
      Reg(r) => if r.id < 2 { slots[r.id] } else { 30 }
    }
  }
  let cases : Array[Array[(@direct_ir.Register, @direct_ir.Value)]] = [
    [(a, Reg(b)), (b, Reg(a))],
    [(a, Reg(a)), (b, State(7))],
    [(a, Reg(c)), (b, Reg(a))],
    [(a, State(4)), (b, Reg(c))],
    [(a, Reg(b)), (position, Reg(position)), (b, Reg(a))],
  ]
  for moves in cases {
    let initial = [10, 20]
    let expected = initial.copy()
    for (dest, value) in moves {
      if slot(dest) is Some(_) {
        expected[dest.id] = read(value, initial)
      }
    }
    let actual = initial.copy()
    let saved : Map[Int32, Int32] = Map([])
    for step in parallel_moves(moves, slot) {
      match step {
        Store(dest, value) => actual[dest.id] = read(value, actual)
        Save(i, value) => saved[i] = read(value, actual)
        Restore(dest, i) => actual[dest.id] = saved[i]
      }
    }
    assert_eq(actual, expected)
  }
}

///|
test "coalescing keeps duplicated results and incoming parameters distinct" {
  let value : @direct_ir.Register = { id: 0, type_: Position, }
  let a : @direct_ir.Register = { id: 1, type_: Position, }
  let b : @direct_ir.Register = { id: 2, type_: Position, }
  let c : @direct_ir.Register = { id: 3, type_: Position, }
  let d : @direct_ir.Register = { id: 4, type_: Position, }
  let base : @direct_ir.Block = {
    specialize_state: false,
    hint: NoHint,
    origin: Helper,
    parameters: [],
    lookahead: Any,
    instructions: [],
    terminator: Unreachable,
  }
  let blocks = [
    {
      ..base,
      instructions: [ReadPreviousPosition(0, value)],
      terminator: Jump({ target: 1, arguments: [Reg(value), Reg(value)], }),
    },
    {
      ..base,
      parameters: [a, b],
      terminator: Jump({ target: 2, arguments: [Reg(b), Reg(a)], }),
    },
    { ..base, parameters: [c, d], },
  ]
  let slots = Map([
    (a.id, (2, 0)),
    (b.id, (2, 1)),
    (c.id, (2, 0)),
    (d.id, (2, 1)),
  ])
  coalesce_results(blocks, slots)
  // Defining the result writes one slot. The edge must still copy it to the
  // second slot, and the next block must still see two distinct parameters.
  assert_eq(slots[value.id], (2, 0))
  assert_eq(slots[a.id], (2, 0))
  assert_eq(slots[b.id], (2, 1))
  let copies = parallel_moves([(a, Reg(value)), (b, Reg(value))], r => {
    slots.get(r.id)
  })
  assert_eq(copies.length(), 1)
  assert_true(
    copies[0] is Store(dest, Reg(source)) && dest == b && source == value,
  )
  let erased_slots : Map[Int32, (Int32, Int32)] = Map([])
  coalesce_results(blocks, erased_slots)
  assert_true(erased_slots.is_empty())
}
