///|
fn graph_plan(source : @direct_ir.Program) -> Plan raise InvalidControl {
  plan(source, costs=Array::make(source.blocks.length(), 1))
}

///|
fn graph_program(
  edges : Array[Array[Int32]],
  roots : Array[Int32],
) -> @direct_ir.Program {
  let unit = @direct_ir.ValueType::Semantic(Constr(pkg=None, "Unit", []))
  guard! unit is Semantic(type_)
  {
    blocks: edges.map(targets => {
      specialize_state: false,
      hint: NoHint,
      origin: Helper,
      parameters: [],
      lookahead: Any,
      instructions: [],
      terminator: if targets.is_empty() {
        Unreachable
      } else {
        CaseState(
          State(0),
          targets.map(t => {
            (t, @direct_ir.Body::jump({ target: t, arguments: [], }))
          }),
        )
      },
    }),
    entries: roots.map(block => {
      name: "entry\{block}",
      block,
      state: 0,
      result_type: type_,
    }),
    symbols: [{ name: "#", type_, }],
    terminal_count: 0,
    actions: [],
    diagnostics: edges.map(_ => { default_: None, actions: [], gotos: [], }),
  }
}

///|
fn loop_counts(control : Control) -> (Int32, Int32) {
  let children = match control {
    Sequence(nodes) => nodes
    Loop(_, body) | Scope(_, body) => [body]
    Dispatch(_, _, body) => [body]
    Switch(cases) => cases.map(p => p.1)
    _ => []
  }
  let mut loops = if control is Loop(_) { 1 } else { 0 }
  let mut dispatches = if control is Dispatch(_) { 1 } else { 0 }
  for child in children {
    let (a, b) = loop_counts(child)
    loops += a
    dispatches += b
  }
  (loops, dispatches)
}

///|
test "all three-node CFGs preserve every edge with single and multiple entries" {
  for bits in 0..<512 {
    let edges = Array::makei(3, from => {
      let targets = []
      for target in 0..<3 {
        if (bits & (1 << (from * 3 + target))) != 0 {
          targets.push(target)
        }
      }
      targets
    })
    for roots in [[0], [0, 1, 2]] {
      let source = graph_program(edges, roots)
      source.validate()
      graph_plan(source).validate() catch {
        InvalidControl(message) =>
          fail("graph \{bits}, \{roots.length()} roots: \{message}")
      }
    }
  }
}

///|
test "natural nested loops and irreducible components use different control forms" {
  let nested = graph_plan(graph_program([[1, 4], [2], [1, 3], [0], []], [0]))
  assert_eq(nested.regions.length(), 1)
  assert_eq(loop_counts(nested.regions[0].control), (2, 0))
  let irreducible = graph_plan(graph_program([[1, 2], [2, 3], [1, 3], []], [0]))
  assert_eq(loop_counts(irreducible.regions[0].control), (0, 1))
}

///|
test "the control checker rejects a well-scoped transfer to the wrong successor" {
  let original = graph_plan(graph_program([[1, 2], [3], [3], []], [0]))
  fn corrupt(control : Control) -> Control {
    match control {
      Run(0, routes) => {
        let wrong = routes.copy()
        wrong[1] = routes[2]
        Run(0, wrong)
      }
      Sequence(nodes) => Sequence(nodes.map(corrupt))
      Scope(id, body) => Scope(id, corrupt(body))
      Loop(id, body) => Loop(id, corrupt(body))
      Dispatch(id, entries, body) => Dispatch(id, entries, corrupt(body))
      Switch(cases) => Switch(cases.map(p => (p.0, corrupt(p.1))))
      other => other
    }
  }
  let regions = original.regions.map(r => { ..r, control: corrupt(r.control), })
  let invalid = { ..original, regions, }
  assert_true(
    try {
      invalid.validate()
      false
    } catch {
      _ => true
    },
  )
}

///|
test "partition budgets retain cross-region entry interfaces on a long cycle" {
  let source = graph_program(Array::makei(150, i => [(i + 1) % 150]), [0, 75])
  let result = graph_plan(source)
  assert_true(result.regions.length() > 1)
  for region in result.regions {
    assert_true(region.members.length() <= REGION_NODES)
  }
  result.validate()
}

///|
test "partition uses target costs and retains indivisible oversized blocks" {
  let small = graph_program([[1], [2], []], [0])
  // A complete small parser needs no inter-region ABI, even when its whole
  // body is larger than the inlining budget used for regional helpers.
  assert_eq(plan(small, costs=[REGION_COST, 1, 2147483647]).regions.length(), 1)
  let source = graph_program(
    Array::makei(REGION_NODES + 1, i => {
      if i < REGION_NODES {
        [i + 1]
      } else {
        []
      }
    }),
    [0],
  )
  assert_eq(
    plan(source, costs=Array::make(source.blocks.length(), 0)).regions.length(),
    2,
  )
  let costs = Array::make(source.blocks.length(), REGION_COST)
  costs[0] = 2147483647
  let weighted = plan(source, costs~)
  assert_eq(weighted.regions.length(), source.blocks.length())
  weighted.validate()
  let isolated = isolate(source)
  assert_eq(isolated.regions.length(), source.blocks.length())
  for label, region in isolated.regions {
    assert_true(region.members == [label])
    assert_eq(isolated.address(label), label)
  }
  let invalid = Array::make(source.blocks.length(), 0)
  invalid[0] = -1
  for costs in [[0], invalid] {
    assert_true(
      try {
        ignore(plan(source, costs~))
        false
      } catch {
        InvalidControl(_) => true
      },
    )
  }
}

///|
test "duplicating a shared continuation removes an administrative loop selector" {
  let source = graph_program([[1, 2], [2], [1, 3], []], [0])
  let source = {
    ..source,
    blocks: source.blocks.mapi((i, block) => {
      let selector : @direct_ir.Register = { id: i, type_: State, }
      {
        ..block,
        instructions: [
          Peek(0, { symbol: None, fields: [State], }, [Some(selector)]),
        ],
        terminator: match block.terminator {
          CaseState(_, arms) => CaseState(Reg(selector), arms)
          other => other
        },
      }
    }),
  }
  let before = graph_plan(source)
  assert_true(before.continuation_candidates().contains(1))
  let after = graph_plan(source.duplicate_continuations([1]).program)
  assert_true(
    after.transfer_cost().selectors < before.transfer_cost().selectors,
  )
  assert_eq(after.transfer_cost().exits, 0)
  after.validate()
}
