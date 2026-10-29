///|
fn chunk_test_block() -> @direct_ir.Block {
  {
    hint: NoHint,
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
  let stop = { ..chunk_test_block(), terminator: Stop, }
  blocks.append(Array::make(40, stop))
  let shared = BlockLayout::new(blocks)
  assert_eq(shared.blocks.length(), 36)
  assert_eq(dispatch_width(blocks, shared), 64)
  let large = Array::make(65, chunk_test_block())
  assert_eq(dispatch_width(large, BlockLayout::new(large)), 32)
}

///|
test "dispatch cost bounds instructions and parameter storage inclusively" {
  // 35 jump terminators, one parameter and 476 binds cost exactly 512.
  let blocks = Array::make(35, chunk_test_block())
  blocks[0] = {
    ..blocks[0],
    parameters: [{ id: 0, type_: State, }],
    instructions: Array::make(476, Bind([])),
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
    {
      ..chunk_test_block(),
      terminator: CaseState(
        State(0),
        arms.map(p => (p.0, @direct_ir.Body::jump(p.1))),
      ),
    },
  ]
  assert_eq(dispatch_width(blocks, BlockLayout::new(blocks)), 64)
  blocks[0] = {
    ..blocks[0],
    terminator: CaseToken(
      arms.map(pair => {
        (Tokens([Terminal(pair.0 + 1)]), @direct_ir.Body::jump(pair.1))
      }),
      @direct_ir.Body::jump({ target: 0, arguments: [], }),
    ),
  }
  assert_eq(dispatch_width(blocks, BlockLayout::new(blocks)), 32)
}
