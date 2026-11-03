///|
fn resource_fixture() -> ResourceAnalyzer {
  let catalog = ResourceCatalog::new([
    { name: "counter", type_: type_("Int"), mutable: true, },
    { name: "ready", type_: type_("Bool"), mutable: true, },
    { name: "token", type_: Option(type_("Token")), mutable: true, },
  ])
  {
    catalog,
    helpers: Map([]),
    direct: Set([]),
    access_count: 0,
    supported: true,
  }
}

///|
test "resource effects distinguish definite definitions and helper may-writes" {
  let analyzer = resource_fixture()
  assert_eq(analyzer.catalog.fields.length(), 2)
  let counter = analyzer.catalog.stored(0)
  let ready = analyzer.catalog.stored(1)
  let conditional = analyzer.block(
    body([Eval(If(Ident("condition"), body([Assign(counter, Int(7))]), None))]),
  )
  assert_true(conditional.kills.is_empty())
  assert_true(conditional.observed() == Set([0]))
  let overwrite = analyzer.block(body([Assign(counter, Int(7))]))
  assert_true(overwrite.observed().is_empty())
  let increment = analyzer.block(body([Augment(counter, Add, Int(1))]))
  assert_true(increment.observed() == Set([0]))
  analyzer.helpers["maybe_update"] = conditional
  let effect = analyzer.block(
    body([
      Assign(counter, Int(2)),
      Eval(call("maybe_update", [Ident("_env")])),
      Eval(counter),
      Eval(If(ready, body([Return(Int(0))]), None)),
      Assign(ready, Bool(true)),
    ]),
  )
  assert_true(effect.reads == Set([1]))
  assert_true(effect.kills == Set([0]))
  assert_true(effect.writes == Set([0, 1]))
  assert_true(analyzer.supported)
  ignore(analyzer.expr(call("unknown", [Ident("_env")])))
  assert_false(analyzer.supported)
}

///|
test "a labelled join does not turn a conditional write into a definite kill" {
  let analyzer = resource_fixture()
  let counter = analyzer.catalog.stored(0)
  let ready = analyzer.catalog.stored(1)
  let effect = analyzer.expr(
    LabelledBlock(
      "done",
      body([
        Eval(If(ready, body([BreakTo("done", None)]), None)),
        Assign(counter, Int(7)),
      ]),
    ),
  )
  assert_true(effect.reads == Set([1]))
  assert_true(effect.kills.is_empty())
  assert_true(effect.writes == Set([0]))
}

///|
test "resource liveness joins loops and rejects a missing edge dependency" {
  let analyzer = resource_fixture()
  let counter = analyzer.catalog.stored(0)
  let ready = analyzer.catalog.stored(1)
  let effects = [
    analyzer.block(body([Assign(counter, Int(0))])),
    analyzer.block(body([Eval(ready)])),
    analyzer.block(
      body([Augment(counter, Add, Int(1)), Assign(ready, Bool(true))]),
    ),
    analyzer.block(body([Eval(counter)])),
  ]
  let plan = ResourcePlan::solve(
    analyzer.catalog,
    Map([]),
    effects,
    effects.map(_ => Set([0, 1])),
    [[1], [2, 3], [1], []],
  )
  assert_true(plan.live[0] == Set([1]))
  assert_true(plan.live[1] == Set([0, 1]))
  assert_true(plan.live[2] == Set([0]))
  assert_true(plan.live[3] == Set([0]))
  let acyclic = plan.written_before([0, 1])
  assert_true(acyclic[0].is_empty())
  assert_true(acyclic[1] == Set([0]))
  let missing = acyclic.copy()
  missing[1] = Set([])
  assert_false(plan.valid_writes([0, 1], missing))
  let cyclic = plan.written_before([1, 2])
  assert_true(cyclic[1] == Set([0, 1]))
  let invalid = { ..plan, live: plan.live.copy(), }
  invalid.live[1] = Set([1])
  assert_false(invalid.valid())
}

///|
test "emitted helper synchronization preserves concrete local and frame values" {
  let analyzer = resource_fixture()
  let counter = analyzer.catalog.stored(0)
  let may_write = analyzer.block(
    body([Eval(If(Ident("condition"), body([Assign(counter, Int(9))]), None))]),
  )
  let always_write = analyzer.block(body([Assign(counter, Int(9))]))
  let observe = analyzer.block(body([Eval(counter)]))
  for
    (effect, writes, reads, expected, expected_saves) in [
      (may_write, false, false, 7, 1),
      (may_write, true, false, 9, 1),
      (always_write, true, false, 9, 0),
      (observe, false, true, 7, 1),
    ] {
    let plan = ResourcePlan::solve(
      analyzer.catalog,
      Map([("helper", effect)]),
      [],
      [],
      [],
    )
    let frame = Ref(2)
    let saves = Ref(0)
    let locals = Map([(resource_local(0), 7)])
    // Interpret the materializer's small AST protocol independently of its
    // read/write equations. The helper may leave a previously stale frame intact.
    fn evaluate(expr : @mbt_ast.Expr) -> Int32 raise {
      match expr {
        Ident(name) => locals[name]
        Field(Ident("_env"), Named("counter")) => frame.val
        Call(Ident("helper"), _) => {
          if reads {
            assert_eq(frame.val, 7)
          }
          if writes {
            frame.val = 9
          }
          0
        }
        Block(block) => {
          for stmt in block.statements {
            match stmt {
              Let(Bind(name), _, value) => locals[name] = evaluate(value)
              Assign(Ident(name), value) => locals[name] = evaluate(value)
              Assign(Field(Ident("_env"), Named("counter")), value) => {
                frame.val = evaluate(value)
                saves.val += 1
              }
              _ => fail("unexpected synchronization statement")
            }
          }
          evaluate(block.result.unwrap())
        }
        _ => fail("unexpected synchronization expression")
      }
    }
    ignore(evaluate(plan.invoke("helper", Set([0]), Set([0]))))
    assert_eq(frame.val, expected)
    assert_eq(locals[resource_local(0)], expected)
    assert_eq(saves.val, expected_saves)
  }
}
