///|
fn chunk_test_block() -> @direct_ir.Block {
  {
    origin: Helper,
    parameters: [],
    lookahead: Any,
    instructions: [],
    terminator: Jump({ target: 0, arguments: [], }),
  }
}

///|
test "small dispatches stay together using emitted labels rather than IR count" {
  let blocks = Array::make(35, chunk_test_block())
  assert_eq(dispatch_width(blocks, BlockLayout::new(blocks)), 64)
  let stop = { ..chunk_test_block(), terminator: Stop(0), }
  blocks.append(Array::make(40, stop))
  let shared = BlockLayout::new(blocks)
  assert_eq(shared.blocks.length(), 36)
  assert_eq(dispatch_width(blocks, shared), 64)
  let large = Array::make(65, chunk_test_block())
  assert_eq(dispatch_width(large, BlockLayout::new(large)), 32)
}

///|
test "dispatch cost bounds instructions and parameter storage inclusively" {
  // 35 blocks and their empty jumps cost 70, plus 1 parameter and 441 binds.
  let blocks = Array::make(35, chunk_test_block())
  blocks[0] = {
    ..blocks[0],
    parameters: [{ id: 0, type_: State, }],
    instructions: Array::make(441, Bind([])),
  }
  assert_eq(dispatch_width(blocks, BlockLayout::new(blocks)), 64)
  blocks[0].instructions.push(Bind([]))
  assert_eq(dispatch_width(blocks, BlockLayout::new(blocks)), 32)
}

///|
test "dispatch cost includes branch arguments and the token fallback edge" {
  let arms : Array[(Int32, @direct_ir.Edge)] = [
    (0, { target: 0, arguments: Array::make(254, State(0)), }),
    (1, { target: 0, arguments: Array::make(255, State(0)), }),
  ]
  // One block, plus two edges costing 255 and 256: exactly 512.
  let blocks = [
    { ..chunk_test_block(), terminator: CaseState(State(0), arms), },
  ]
  assert_eq(dispatch_width(blocks, BlockLayout::new(blocks)), 64)
  blocks[0] = {
    ..blocks[0],
    terminator: CaseToken(arms.map(pair => (Terminal(pair.0 + 1), pair.1)), {
      target: 0,
      arguments: [],
    }),
  }
  assert_eq(dispatch_width(blocks, BlockLayout::new(blocks)), 32)
}
