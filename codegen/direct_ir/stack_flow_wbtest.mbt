///|
fn stack_flow_fixture(
  instructions : Array[Instruction],
  terminator : Terminator,
) -> (Program, StackKnowledge) {
  let base = fixture([check_block([], instructions, [])])
  let program = {
    ..base,
    blocks: [{ ..base.blocks[0], terminator, }],
    symbols: [..base.symbols, { name: "OTHER", type_: base.symbols[1].type_, }],
    terminal_count: 2,
    diagnostics: [base.diagnostics[0], base.diagnostics[0]],
  }
  let words : Array[Array[StackCellFact]] = [
    [],
    [{ symbol: 1, predecessors: Set([0, 1]), }],
  ]
  let knowledge : StackKnowledge = {
    transitions: [[(1, 1)], [(1, 1)]],
    short: words,
    long: words,
    production_sites: [],
    entry_origins: [Set([0]), Set([0])],
  }
  (program, knowledge)
}

///|
test "stack proof rejects wrong symbols transitions selectors and returns" {
  let state = check_reg(0, State)
  let logical : Cell = { symbol: Some(1), fields: [State], }
  let valid = [
    Push(logical, [State(1)]),
    Peek(0, logical, [Some(state)]),
    Pop(logical, [None]),
  ]
  let (program, knowledge) = stack_flow_fixture(valid, Unreachable)
  program.validate()
  ignore(program.stack_flow(knowledge))
  let invalid = [
    [Push(logical, [State(0)])],
    [
      Push(logical, [State(1)]),
      Pop({ symbol: Some(2), fields: [State], }, [None]),
    ],
    [Pop(logical, [None])],
  ]
  for instructions in invalid {
    let bad = { ..program, blocks: [{ ..program.blocks[0], instructions, }], }
    assert_true(
      try {
        ignore(bad.stack_flow(knowledge))
        false
      } catch {
        _ => true
      },
    )
  }
  let bad_case = {
    ..program,
    blocks: [
      {
        ..program.blocks[0],
        instructions: valid[:2].to_owned(),
        terminator: CaseState(Reg(state), [
          (0, { instructions: [], terminator: Unreachable, }),
        ]),
      },
    ],
  }
  assert_true(
    try {
      ignore(bad_case.stack_flow(knowledge))
      false
    } catch {
      _ => true
    },
  )
  let value = check_reg(1, Semantic(program.symbols[1].type_))
  let sp = check_reg(2, Position)
  let ep = check_reg(3, Position)
  let wrong_return = {
    ..program,
    blocks: [
      {
        ..program.blocks[0],
        instructions: [EnsureLookahead],
        terminator: CaseToken(
          [
            (
              BindToken(1, value, sp, ep),
              {
                instructions: [Push(logical, [State(1)])],
                terminator: Return(0, Reg(value)),
              },
            ),
          ],
          { instructions: [], terminator: Stop, },
        ),
      },
    ],
  }
  wrong_return.validate()
  assert_true(
    try {
      ignore(wrong_return.stack_flow(knowledge))
      false
    } catch {
      _ => true
    },
  )
  // Provenance is deliberately misleading: only executed transitions count.
  let wrong_origin = {
    ..program,
    blocks: [{ ..program.blocks[0], origin: Run(1), }],
  }
  ignore(wrong_origin.stack_flow(knowledge))
}

///|
test "storage demand follows action inputs across cells and block parameters" {
  let int : @elab.TypeExpr = Constr(pkg=None, "Int", [])
  let value = check_int(0)
  let unused = check_int(1)
  let sp = check_reg(2, Position)
  let ep = check_reg(3, Position)
  let result = check_int(4)
  let before = check_reg(5, Position)
  let block = {
    ..check_block(
      [value, unused, sp, ep, before],
      [Action(0, [Reg(value), Reg(before)], result)],
      [],
    ),
    terminator: Return(0, Reg(result)),
  }
  let program = {
    ..fixture([block]),
    actions: [
      {
        lhs: 2,
        rhs: [1, 1],
        inputs: [Value(0, int), Position(BeforeRhs)],
        callable: true,
      },
    ],
  }
  let flow : StackFlow = {
    entries: [],
    previous_symbols: Map([]),
    previous_initial: Set([]),
    read_above: Map([]),
  }
  let demand = program.storage_demand(flow, positions=true)
  assert_eq(demand.registers, Set([value.id, before.id, result.id]))
}
