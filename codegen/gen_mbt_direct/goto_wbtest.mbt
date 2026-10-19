///|
fn goto_fixture() -> Array[@direct_ir.Block] {
  let int : @elab.TypeExpr = Constr(pkg=None, "Int", [])
  let pred : @direct_ir.Register = { id: 0, type_: State, }
  let value : @direct_ir.Register = { id: 1, type_: Semantic(int), }
  let sp : @direct_ir.Register = { id: 2, type_: Position, }
  let ep : @direct_ir.Register = { id: 3, type_: Position, }
  let a : @direct_ir.Register = { id: 4, type_: Semantic(int), }
  let b : @direct_ir.Register = { id: 5, type_: Position, }
  let c : @direct_ir.Register = { id: 6, type_: Position, }
  let d : @direct_ir.Register = { id: 7, type_: Position, }
  let e : @direct_ir.Register = { id: 8, type_: Semantic(int), }
  let f : @direct_ir.Register = { id: 9, type_: Position, }
  let cell : @direct_ir.Cell = {
    symbol: Some(2),
    fields: [State, Semantic, Start, End],
  }
  let base : @direct_ir.Block = {
    origin: Helper,
    parameters: [],
    lookahead: Any,
    instructions: [],
    terminator: Unreachable,
  }
  [
    {
      ..base,
      parameters: [pred, value, sp, ep],
      instructions: [SaveErrorSnapshot],
      terminator: CaseState(Reg(pred), [
        (10, { target: 1, arguments: [Reg(value), Reg(sp), Reg(ep)], }),
        (20, { target: 2, arguments: [Reg(ep), Reg(value), Reg(sp)], }),
      ]),
    },
    {
      ..base,
      parameters: [a, b, c],
      instructions: [Push(cell, [State(42), Reg(a), Reg(b), Reg(c)])],
      terminator: Jump({ target: 3, arguments: [], }),
    },
    {
      ..base,
      parameters: [d, e, f],
      instructions: [Push(cell, [State(43), Reg(e), Reg(f), Reg(d)])],
      terminator: Jump({ target: 3, arguments: [], }),
    },
    base,
  ]
}

///|
test "goto factoring substitutes parameters and keeps LR states separate from PCs" {
  let blocks = goto_fixture()
  let (plans, omitted) = plan_gotos(blocks, [])
  let plan = plans[0]
  assert_true(plan.data.0 is Reg(r) && r.id == 1)
  assert_true(plan.data.1 is Reg(r) && r.id == 2)
  assert_true(plan.data.2 is Reg(r) && r.id == 3)
  assert_true(
    plan.choices ==
    [
      (10, { state: State(42), label: 3, }),
      (20, { state: State(43), label: 3, }),
    ],
  )
  // Equal code destinations do not make the pushed LR states interchangeable.
  assert_eq(grouped_cases(plan.choices, (a, b) => a == b).length(), 2)
  let layout = BlockLayout::new(blocks, omitted~)
  assert_eq(layout.blocks, [0, 3])
  assert_eq(layout.pc(3), 1)
  assert_true(blocks[0].instructions is [SaveErrorSnapshot])
}

///|
test "goto factoring retains effects, unequal spans and externally used helpers" {
  let original = goto_fixture()
  let blocks = original.copy()
  blocks[2] = {
    ..original[2],
    instructions: [..original[2].instructions, SaveErrorSnapshot],
  }
  assert_true(plan_gotos(blocks, []).0.is_empty())
  blocks[2] = original[2]
  guard original[0].terminator is CaseState(selector, arms) else { panic() }
  let different = arms.copy()
  let second = arms[1].1
  different[1] = (
    20,
    {
      ..second,
      arguments: [second.arguments[2], second.arguments[1], second.arguments[0]],
    },
  )
  blocks[0] = { ..original[0], terminator: CaseState(selector, different), }
  assert_true(plan_gotos(blocks, []).0.is_empty())
  blocks[0] = original[0]
  let (plans, omitted) = plan_gotos(blocks, [2])
  assert_true(plans.is_empty())
  assert_true(omitted.is_empty())
  let incoming = original[0].parameters.map(r => { ..r, id: r.id + 100, })
  blocks.push({
    ..original[0],
    parameters: incoming,
    instructions: [],
    terminator: CaseState(Reg(incoming[0]), [
      (
        10,
        {
          target: 1,
          arguments: [Reg(incoming[1]), Reg(incoming[2]), Reg(incoming[3])],
        },
      ),
    ]),
  })
  assert_true(plan_gotos(blocks, []).0.is_empty())
  let blocks = original.copy()
  blocks.push({
    ..original[3],
    parameters: [{ id: 10, type_: original[2].parameters[1].type_, }],
  })
  blocks[2] = {
    ..original[2],
    terminator: Jump({ target: 4, arguments: [Reg(original[2].parameters[1])], }),
  }
  assert_true(plan_gotos(blocks, []).0.is_empty())
}
