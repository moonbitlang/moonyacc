///|
fn specialization_fixture() -> (Program, StackKnowledge) {
  let base = check_block([], [], [])
  let unit : @elab.TypeExpr = Constr(pkg=None, "Unit", [])
  let result = check_reg(0, Semantic(unit))
  let predecessor = check_reg(1, State)
  let selector = check_reg(2, State)
  fn state_cell(symbol : Int32) -> Cell {
    { symbol: Some(symbol), fields: [State], }
  }
  fn enter(symbol : Int32, state : Int32) -> Body {
    {
      instructions: [Push(state_cell(symbol), [State(state)])],
      terminator: Jump(edge(1)),
    }
  }
  let program = {
    ..fixture([]),
    symbols: ["#", "A", "B", "x", "u"].map(name => { name, type_: unit, }),
    terminal_count: 2,
    actions: [{ rhs: [3], lhs: 4, inputs: [], callable: true, }],
    diagnostics: Array::makei(6, _ => {
      default_: None,
      actions: [],
      gotos: [],
    }),
    blocks: [
      {
        ..base,
        instructions: [EnsureLookahead],
        terminator: CaseToken(
          [
            (Tokens([Terminal(1)]), enter(1, 1)),
            (Tokens([Terminal(2)]), enter(2, 2)),
          ],
          enter(1, 1),
        ),
      },
      {
        ..base,
        origin: Run(3),
        specialize_state: true,
        lookahead: Present,
        instructions: [Push(state_cell(3), [State(3)])],
        terminator: Jump(edge(2)),
      },
      {
        ..base,
        origin: Reduce(0),
        hint: IfCells(1),
        lookahead: Present,
        instructions: [
          Action(0, [], result),
          Pop(state_cell(3), [None]),
          Peek(0, { symbol: None, fields: [State], }, [Some(predecessor)]),
        ],
        terminator: Jump({ target: 3, arguments: [Reg(predecessor)], }),
      },
      {
        ..base,
        origin: Goto(4),
        hint: IfKnownState,
        parameters: [selector],
        lookahead: Present,
        terminator: CaseState(Reg(selector), [
          (1, Body::jump(edge(4))),
          (2, Body::jump(edge(5))),
        ]),
      },
      {
        ..base,
        lookahead: Present,
        instructions: [Push(state_cell(4), [State(4)])],
        terminator: Stop,
      },
      {
        ..base,
        lookahead: Present,
        instructions: [Push(state_cell(4), [State(5)])],
        terminator: Stop,
      },
    ],
  }
  let words : Array[Array[StackCellFact]] = [
    [],
    [{ symbol: 1, predecessors: Set([0]), }],
    [{ symbol: 2, predecessors: Set([0]), }],
    [{ symbol: 3, predecessors: Set([1, 2]), }],
    [{ symbol: 4, predecessors: Set([1]), }],
    [{ symbol: 4, predecessors: Set([2]), }],
  ]
  (
    program,
    {
      transitions: [
        [(1, 1), (2, 2)],
        [(3, 3), (4, 4)],
        [(3, 3), (4, 5)],
        [],
        [],
        [],
      ],
      short: words,
      long: words,
      production_sites: [[3]],
      entry_origins: Array::makei(6, _ => Set([0])),
    },
  )
}

///|
test "state specialization shares contexts and distinguishes saved predecessor from destination" {
  let (source, knowledge) = specialization_fixture()
  let program = source.specialize_state(knowledge)
  let flow = program.stack_flow(knowledge)
  guard! program.blocks[0].terminator is CaseToken([(_, a), (_, b)], eof)
  guard! a.terminator is Jump(left) &&
    b.terminator is Jump(right) &&
    eof.terminator is Jump(again)
  assert_eq(left.target, again.target)
  assert_true(left.target != right.target)
  assert_eq(program.blocks.filter(b => b.origin is Run(3)).length(), 2)
  for (label, state) in [(left.target, 1), (right.target, 2)] {
    assert_true(flow.entries[label].unwrap().current == Set([state]))
    assert_true(
      program.blocks[label].all_instructions().any(i => i is Action(0, [], _)),
    )
    assert_false(program.blocks[label].terminator is CaseState(_))
    check_state_versions(program, knowledge, [{ original: 1, label, state, }])
    // Using the destination state (3) in place of its predecessor is unsound.
    assert_true(
      try {
        check_state_versions(program, knowledge, [
          { original: 1, label, state: 3, },
        ])
        false
      } catch {
        InvalidProgram(_) => true
      },
    )
  }
  let all = []
  for block in program.blocks {
    all.append(block.definitions().map(r => r.id))
  }
  assert_eq(Set(all).length(), all.length())
}

///|
test "state specialization retains generic fallback under budget and policy limits" {
  let (source, knowledge) = specialization_fixture()
  for budget in [0, 1] {
    let program = source.specialize_state_with_budget(knowledge, budget)
    assert_eq(program.blocks.length(), source.blocks.length())
    assert_true(program.blocks[0].terminator == source.blocks[0].terminator)
    ignore(program.stack_flow(knowledge))
  }
  let disabled = {
    ..source,
    blocks: source.blocks.map(b => { ..b, specialize_state: false, }),
  }
  assert_eq(
    disabled.specialize_state(knowledge).blocks.length(),
    source.blocks.length(),
  )
}

///|
test "state-independent continuations and nonproductive cycles do not retain copies" {
  let (source, knowledge) = specialization_fixture()
  let selector = source.blocks[3].parameters[0]
  let same = { ..source, blocks: source.blocks.copy(), }
  same.blocks[3] = {
    ..same.blocks[3],
    terminator: CaseState(Reg(selector), [
      (1, Body::jump(edge(4))),
      (2, Body::jump(edge(4))),
    ]),
  }
  let words = knowledge.long.copy()
  words[4] = [{ symbol: 4, predecessors: Set([1, 2]), }]
  let transitions = knowledge.transitions.copy()
  transitions[2] = [(3, 3), (4, 4)]
  let after = same.specialize_state({
    ..knowledge,
    transitions,
    short: words,
    long: words,
  })
  assert_eq(after.blocks.filter(b => b.origin is Run(3)).length(), 1)
  let cycle = { ..source, blocks: source.blocks[:2].to_owned(), }
  cycle.blocks[1] = {
    ..cycle.blocks[1],
    instructions: [],
    terminator: Jump(edge(1)),
  }
  let after = cycle.specialize_state(knowledge)
  assert_eq(after.blocks.length(), 2)
  assert_true(after.blocks[1].terminator is Jump({ target: 1, .. }))
}

///|
fn specialization_chain_fixture() -> (Program, StackKnowledge) {
  let (source, knowledge) = specialization_fixture()
  let base = check_block([], [], [])
  let unit = source.symbols[1].type_
  let result = check_reg(3, Semantic(unit))
  let predecessor = check_reg(4, State)
  let selector = check_reg(5, State)
  let program = {
    ..source,
    symbols: [..source.symbols, { name: "v", type_: unit, }],
    actions: [
      ..source.actions,
      { rhs: [4], lhs: 5, inputs: [], callable: true, },
    ],
    diagnostics: [..source.diagnostics, source.diagnostics[0]],
    blocks: source.blocks[:4].to_owned(),
  }
  guard! program.blocks[3].terminator is CaseState(original_selector, _)
  program.blocks[3] = {
    ..program.blocks[3],
    terminator: CaseState(original_selector, [
      (1, Body::jump(edge(4))),
      (2, Body::jump(edge(4))),
    ]),
  }
  program.blocks.append([
    {
      ..base,
      origin: Run(4),
      specialize_state: true,
      lookahead: Present,
      instructions: [Push({ symbol: Some(4), fields: [State], }, [State(4)])],
      terminator: Jump(edge(5)),
    },
    {
      ..base,
      hint: IfCells(1),
      lookahead: Present,
      instructions: [
        Action(1, [], result),
        Pop({ symbol: Some(4), fields: [State], }, [None]),
        Peek(0, { symbol: None, fields: [State], }, [Some(predecessor)]),
      ],
      terminator: Jump({ target: 6, arguments: [Reg(predecessor)], }),
    },
    {
      ..base,
      hint: IfKnownState,
      parameters: [selector],
      lookahead: Present,
      terminator: CaseState(Reg(selector), [
        (1, Body::jump(edge(7))),
        (2, Body::jump(edge(8))),
      ]),
    },
    {
      ..base,
      lookahead: Present,
      instructions: [Push({ symbol: Some(5), fields: [State], }, [State(5)])],
      terminator: Stop,
    },
    {
      ..base,
      lookahead: Present,
      instructions: [Push({ symbol: Some(5), fields: [State], }, [State(6)])],
      terminator: Stop,
    },
  ])
  let words = [
    ..knowledge.long[:4],
    [{ symbol: 4, predecessors: Set([1, 2]), }],
    [{ symbol: 5, predecessors: Set([1]), }],
    [{ symbol: 5, predecessors: Set([2]), }],
  ]
  let knowledge : StackKnowledge = {
    transitions: [
      [(1, 1), (2, 2)],
      [(3, 3), (4, 4), (5, 5)],
      [(3, 3), (4, 4), (5, 6)],
      [],
      [],
      [],
      [],
    ],
    short: words,
    long: words,
    production_sites: [[3], [4]],
    entry_origins: Array::makei(7, _ => Set([0])),
  }
  (program, knowledge)
}

///|
test "a specialized unit chain retains contexts useful only in its successor" {
  let (program, knowledge) = specialization_chain_fixture()
  let after = program.specialize_state(knowledge)
  for state in [3, 4] {
    assert_eq(
      after.blocks.filter(b => b.origin is Run(s) && s == state).length(),
      2,
    )
  }
  ignore(after.stack_flow(knowledge))
}

///|
test "specialization candidates retain complete dependencies and can be rejected without changing the source" {
  let (source, knowledge) = specialization_chain_fixture()
  let plan = source.state_specializations(knowledge)
  let group = plan.groups
    .search_by(labels => {
      labels.any(label => {
        plan.versions.any(v => v.label == label && v.original == 1)
      })
    })
    .unwrap()
  let selected = plan.within_growth([group], 1024)
  assert_eq(selected, [group])
  let after = plan.apply(selected, knowledge)
  for state in [3, 4] {
    assert_eq(
      after.blocks.filter(b => b.origin is Run(s) && s == state).length(),
      2,
    )
  }
  // Admission cannot keep the first run while dropping the successor which
  // supplies its only benefit. Every affordable trial contains the whole chain.
  for budget in 0..<100 {
    let accepted = plan.within_growth([group], budget)
    let program = plan.apply(accepted, knowledge)
    let copies = program.blocks.filter(b => b.origin is Run(3)).length()
    assert_eq(copies, if accepted.is_empty() { 1 } else { 2 })
    assert_eq(program.blocks.filter(b => b.origin is Run(4)).length(), copies)
  }
  let rejected = plan.apply([], knowledge)
  assert_eq(rejected.blocks.length(), source.blocks.length())
  for index, block in rejected.blocks {
    assert_true(block.instructions == source.blocks[index].instructions)
    assert_true(block.terminator == source.blocks[index].terminator)
  }
  let all = plan.candidates()
  assert_true(plan.savings(all) > 0)
  assert_eq(plan.savings(all), plan.savings([..all, ..all]))
  assert_eq(plan.savings([]), 0)
  let forward = plan.apply(all, knowledge)
  let reverse = plan.apply(all.rev(), knowledge)
  assert_eq(forward.blocks.length(), reverse.blocks.length())
  for index, block in forward.blocks {
    assert_true(block.instructions == reverse.blocks[index].instructions)
    assert_true(block.terminator == reverse.blocks[index].terminator)
  }
  assert_true(
    try {
      ignore(plan.apply([-1], knowledge))
      false
    } catch {
      InvalidProgram(_) => true
    },
  )
}

///|
test "a bounded expansion never retains a half-specialized entry" {
  let (source, knowledge) = specialization_fixture()
  let blocks = source.blocks.copy()
  // Pure bindings deliberately exceed the expansion bound before the goto.
  // The caller must fall back as a whole, without consuming retained budget.
  let padding = Array::makei(STATE_INLINE_GROWTH, i => {
    Bind([(check_reg(100 + i, State), State(1))])
  })
  blocks[2] = {
    ..blocks[2],
    instructions: [..padding, ..blocks[2].instructions],
  }
  let source = { ..source, blocks, }
  let plan = source.state_specializations(knowledge)
  assert_true(plan.candidates().is_empty())
  assert_eq(plan.apply([], knowledge).blocks.length(), source.blocks.length())
}

///|
test "a saved deeper selector does not become the current state" {
  let (program, knowledge) = specialization_fixture()
  let saved = check_reg(20, State)
  let machine = StackMachineFact::{
    word: [{ symbol: 4, predecessors: Set([1, 2]), }],
    exact: false,
    current: Set([4, 5]),
    registers: Map([(saved.id, { states: Set([1, 2]), depth: Some(1), })]),
    empty_token: false,
    tokens: Set([Terminal(1)]),
  }
  let branch = StackFlowPass::new(program, knowledge)
    .state_branch(machine, Reg(saved), 1)
    .unwrap()
  assert_true(branch.value(Reg(saved)).states == Set([1]))
  assert_true(branch.current == Set([4, 5]))
}
