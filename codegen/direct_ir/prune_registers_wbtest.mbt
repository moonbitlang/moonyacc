///|
fn pruning_fixture() -> (Program, StackKnowledge) {
  let int : @elab.TypeExpr = Constr(pkg=None, "Int", [])
  let value = check_int(0)
  let sp = check_reg(1, Position)
  let ep = check_reg(2, Position)
  let parameter = check_int(3)
  let position = check_reg(4, Position)
  let dead = check_int(5)
  let before = check_reg(6, Position)
  let result = check_int(7)
  let (base, knowledge) = stack_flow_fixture([], Unreachable)
  let block = base.blocks[0]
  (
    {
      ..base,
      terminal_count: 1,
      entries: [{ ..base.entries[0], result_type: int, }],
      symbols: [
        base.symbols[0],
        { name: "TOKEN", type_: int, },
        { name: "start", type_: int, },
      ],
      actions: [{ rhs: [1], lhs: 2, inputs: [], callable: true, }],
      blocks: [
        {
          ..block,
          lookahead: Empty,
          instructions: [LoadLookahead],
          terminator: CaseToken(
            [
              (
                BindToken(1, value, sp, ep),
                {
                  instructions: [
                    Push(cell(1), [State(1), Reg(value), Reg(sp), Reg(ep)]),
                    ConsumeLookahead,
                    SaveErrorSnapshot([]),
                  ],
                  terminator: Jump({
                    target: 1,
                    arguments: [Reg(value), Reg(sp)],
                  }),
                },
              ),
            ],
            { instructions: [], terminator: Stop, },
          ),
        },
        {
          ..block,
          parameters: [parameter, position],
          lookahead: Empty,
          instructions: [
            Bind([(dead, Reg(parameter))]),
            ReadPreviousPosition(0, before),
            Action(0, [], result),
            Pop(cell(1), [None, None, None, None]),
          ],
          terminator: Return(0, Reg(result)),
        },
      ],
    },
    knowledge,
  )
}

///|
test "dead token operands are removed with their parameters and stack fields" {
  let (program, knowledge) = pruning_fixture()
  let after = program.prune_registers(knowledge, positions=true)
  ignore(after.stack_flow(knowledge))
  guard after.blocks[0].terminator
    is CaseToken([(Tokens([Terminal(1)]), branch)], _) else {
    fail("dead token bindings survived")
  }
  assert_true(
    branch.instructions
    is [
      Push({ fields: [State], .. }, [State(1)]),
      ConsumeLookahead,
      SaveErrorSnapshot([]),
    ],
  )
  assert_true(branch.terminator is Jump({ arguments: [], .. }))
  assert_true(after.blocks[1].parameters.is_empty())
  assert_true(
    after.blocks[1].instructions
    is [Action(0, [], _), Pop({ fields: [State], .. }, [None])],
  )
}

///|
test "live action inputs retain bindings and action signatures reject malformed operands" {
  let (program, knowledge) = pruning_fixture()
  let parameters = program.blocks[1].parameters
  guard! program.blocks[1].instructions[2] is Action(_, _, result)
  let inputs = [Reg(parameters[0]), Reg(parameters[1])]
  let program = {
    ..program,
    actions: [
      {
        ..program.actions[0],
        inputs: [Value(0, program.symbols[1].type_), Position(StartOf(0))],
      },
    ],
  }
  program.blocks[1] = {
    ..program.blocks[1],
    instructions: [
      Action(0, inputs, result),
      Pop(cell(1), [None, None, None, None]),
    ],
  }
  let after = program.prune_registers(knowledge, positions=true)
  assert_true(after.blocks[0].terminator is CaseToken([(BindToken(_), _)], _))
  assert_true(after.blocks[1].parameters == parameters)
  // Removing or swapping operands must not silently change the calling convention.
  for wrong in [[], [inputs[1], inputs[0]]] {
    let invalid = { ..after, blocks: after.blocks.copy(), }
    invalid.blocks[1] = {
      ..after.blocks[1],
      instructions: [Action(0, wrong, result)],
    }
    assert_true(
      try {
        invalid.validate()
        false
      } catch {
        InvalidProgram(_) => true
      },
    )
  }
}
