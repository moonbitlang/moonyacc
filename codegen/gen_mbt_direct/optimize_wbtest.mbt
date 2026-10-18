///|
test "parallel copies preserve cycles, identity slots and local inputs" {
  let a : @direct_ir.Register = { id: 0, type_: State, }
  let b : @direct_ir.Register = { id: 1, type_: State, }
  let c : @direct_ir.Register = { id: 2, type_: State, }
  fn slot(r : @direct_ir.Register) -> (Int, Int)? {
    if r.id < 2 {
      Some((0, r.id))
    } else {
      None
    }
  }
  fn read(v : @direct_ir.Value, slots : Array[Int]) -> Int {
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
  ]
  for moves in cases {
    let initial = [10, 20]
    let expected = initial.copy()
    for (dest, value) in moves {
      expected[dest.id] = read(value, initial)
    }
    let actual = initial.copy()
    let saved : Map[Int, Int] = Map([])
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
    origin: Helper,
    parameters: [],
    lookahead: Any,
    instructions: [],
    terminator: Unreachable,
  }
  let blocks = [
    {
      ..base,
      instructions: [ReadLastPosition(value)],
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
}

///|
test "stack argument fusion preserves escaping spans and respects effects" {
  let int : @elab.TypeExpr = Constr(pkg=None, "Int", [])
  let v : @direct_ir.Register = { id: 0, type_: Semantic(int), }
  let sp : @direct_ir.Register = { id: 1, type_: Position, }
  let ep : @direct_ir.Register = { id: 2, type_: Position, }
  let last : @direct_ir.Register = { id: 3, type_: Position, }
  let result : @direct_ir.Register = { id: 4, type_: Semantic(int), }
  let next : @direct_ir.Register = { id: 5, type_: Semantic(int), }
  let cell : @direct_ir.Cell = {
    symbol: Some(1),
    fields: [State, Semantic, Start, End],
  }
  let peek : @direct_ir.Instruction = Peek(0, cell, [
    None,
    Some(v),
    Some(sp),
    Some(ep),
  ])
  let args : Array[@direct_ir.ActionArgument] = [
    { value: Reg(v), start: Reg(sp), end: Reg(ep), },
  ]
  let actions : Array[@direct_ir.ActionSignature] = [
    { rhs: [1], lhs: 2, callable: true, },
    { rhs: [], lhs: 2, callable: true, },
  ]
  let block : @direct_ir.Block = {
    origin: Reduce(0),
    parameters: [],
    lookahead: Any,
    instructions: [
      peek,
      ReadLastPosition(last),
      Action(0, args, Reg(last), result),
      Pop(cell, [None, None, None, None]),
      Action(1, [], Reg(sp), next),
    ],
    terminator: Return(0, Reg(next)),
  }
  let plan = action_arguments(block, actions)
  assert_true(plan.slices.contains(2))
  assert_true(plan.unused.contains(v.id))
  assert_false(plan.unused.contains(sp.id))
  let with_effect = {
    ..block,
    instructions: [
      peek,
      EnsureLookahead,
      ReadLastPosition(last),
      Action(0, args, Reg(last), result),
    ],
    terminator: Return(0, Reg(result)),
  }
  assert_true(action_arguments(with_effect, actions).slices.is_empty())
}
