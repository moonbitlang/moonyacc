///|
fn fixture(blocks : Array[Block]) -> Program {
  let unit : @elab.TypeExpr = Constr(pkg=None, "Unit", [])
  {
    entries: [{ name: "start", block: 0, state: 0, result_type: unit, }],
    blocks,
    symbols: [{ name: "<end>", type_: unit, }, { name: "TOKEN", type_: unit, }],
    terminal_count: 1,
    actions: [],
    diagnostics: [{ default_: Some(Accept), actions: [], gotos: [], }],
  }
}

///|
test "snapshot suffix values must be defined LR states" {
  let position : Register = { id: 0, type_: Position, }
  let state : Register = { id: 1, type_: State, }
  let program = fixture([
    {
      specialize_state: false,
      hint: NoHint,
      origin: Helper,
      parameters: [],
      lookahead: Any,
      instructions: [
        ReadPreviousPosition(0, position),
        SaveErrorSnapshot([State(0)]),
      ],
      terminator: Unreachable,
    },
  ])
  program.validate()
  for value in [Reg(position), Reg(state), State(1)] {
    program.blocks[0] = {
      ..program.blocks[0],
      instructions: [
        ReadPreviousPosition(0, position),
        SaveErrorSnapshot([value]),
      ],
    }
    try program.validate() catch {
      InvalidProgram(_) => ()
    } noraise {
      _ => fail("accepted an invalid snapshot suffix")
    }
  }
}

///|
test "token pattern bindings have checked types and branch-local scope" {
  let v : Register = { id: 0, type_: Semantic(Constr(pkg=None, "Unit", [])), }
  let sp : Register = { id: 1, type_: Position, }
  let ep : Register = { id: 2, type_: Position, }
  let branch : Body = {
    instructions: [ConsumeLookahead],
    terminator: Return(0, Reg(v)),
  }
  let fallback : Body = { instructions: [], terminator: Stop, }
  let pattern = TokenPattern::BindToken(1, v, sp, ep)
  let block : Block = {
    specialize_state: false,
    hint: NoHint,
    origin: Helper,
    parameters: [],
    lookahead: Empty,
    instructions: [LoadLookahead],
    terminator: CaseToken([(pattern, branch)], fallback),
  }
  let program = fixture([block])
  program.validate()
  let invalid = [
    { ..block, instructions: [], },
    {
      ..block,
      terminator: CaseToken([(Tokens([Terminal(1)]), branch)], fallback),
    },
    {
      ..block,
      terminator: CaseToken([(BindToken(1, sp, v, ep), branch)], fallback),
    },
    {
      ..block,
      terminator: CaseToken([(pattern, branch)], {
        ..fallback,
        terminator: Return(0, Reg(v)),
      }),
    },
  ]
  for block in invalid {
    let bad = { ..program, blocks: [block], }
    assert_true(
      try {
        bad.validate()
        false
      } catch {
        _ => true
      },
    )
  }
}

///|
test "block arguments enforce both types and local SSA scope" {
  let a : Register = { id: 0, type_: Position, }
  let b : Register = { id: 1, type_: Position, }
  let program = fixture([
    {
      specialize_state: false,
      hint: NoHint,
      origin: Helper,
      parameters: [],
      lookahead: Any,
      instructions: [ReadPreviousPosition(0, a)],
      terminator: Jump({ target: 1, arguments: [Reg(a)], }),
    },
    {
      specialize_state: false,
      hint: NoHint,
      origin: Helper,
      parameters: [b],
      lookahead: Any,
      instructions: [Bind([({ id: 2, type_: Position, }, Reg(b))])],
      terminator: Unreachable,
    },
  ])
  program.validate()
  program.blocks[0] = {
    ..program.blocks[0],
    terminator: Jump({ target: 1, arguments: [State(0)], }),
  }
  try program.validate() catch {
    InvalidProgram(message) => assert_true(message.contains("type mismatch"))
  } noraise {
    _ => fail("wrong argument type accepted")
  }
  program.blocks[0] = {
    ..program.blocks[0],
    terminator: Jump({ target: 1, arguments: [Reg(b)], }),
  }
  try program.validate() catch {
    InvalidProgram(message) => assert_true(message.contains("undefined"))
  } noraise {
    _ => fail("register escaped its block")
  }
}
