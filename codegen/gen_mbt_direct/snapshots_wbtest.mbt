///|
fn snapshot_test_block(
  instructions : Array[@direct_ir.Instruction],
) -> @direct_ir.Block {
  {
    origin: Helper,
    parameters: [],
    lookahead: Any,
    instructions,
    terminator: Unreachable,
  }
}

///|
fn snapshot_test_name(expr : @mbt_ast.Expr) -> String {
  match expr {
    Ident(name) | Field(Ident("_env"), Named(name)) => name
    _ => abort("expected parser storage")
  }
}

///|
test "snapshot suffixes use dedicated scalar copies and reconstruct bottom to top" {
  let dynamic : @direct_ir.Register = { id: 0, type_: State, }
  let plan = SnapshotPlan::new([
    snapshot_test_block([SaveErrorSnapshot([State(4)])]),
    snapshot_test_block([SaveErrorSnapshot([State(4), Reg(dynamic), State(6)])]),
    snapshot_test_block([SaveErrorSnapshot([])]),
  ])
  assert_eq(plan.width, 3)
  assert_eq(
    value_uses(
      snapshot_test_block([
        SaveErrorSnapshot([State(4), Reg(dynamic), State(6)]),
      ]),
      _ => false,
    ).get(dynamic.id),
    Some(1),
  )
  let storage = plan.storage()
  assert_eq(storage.map(pair => pair.0.name), [
    "error_stack", "error_state", "error_depth", "error_suffix_0", "error_suffix_1",
    "error_suffix_2",
  ])
  assert_true(storage.all(pair => pair.0.mutable))
  for index in 2..<storage.length() {
    assert_true(storage[index].1 is Int(0))
  }
  assert_eq(plan.local_storage().length(), storage.length())
  for chunked in [false, true] {
    fn machine(name : String) -> @mbt_ast.Expr {
      if chunked {
        Field(Ident("_env"), Named(name))
      } else {
        Ident(name)
      }
    }
    let capture = plan.capture(
      [Int(4), Ident("dynamic_state"), Int(6)],
      machine,
    )
    guard capture
      is [
        Assign(stack_dest, stack_source),
        Assign(state_dest, state_source),
        Assign(first, Int(4)),
        Assign(second, Ident("dynamic_state")),
        Assign(third, Int(6)),
        Assign(depth_dest, Int(3)),
      ] else {
      fail("snapshot capture must only copy its prefix and scalar states")
    }
    assert_eq(
      [stack_dest, state_dest, first, second, third, depth_dest].map(
        snapshot_test_name,
      ),
      [
        "error_stack", "error_state", "error_suffix_0", "error_suffix_1", "error_suffix_2",
        "error_depth",
      ],
    )
    assert_eq(snapshot_test_name(stack_source), "stack")
    assert_eq(snapshot_test_name(state_source), "state")
    // A later ordinary shift hides all old suffix slots without allocating or
    // clearing them, and errors before any shift use the initialized depth 0.
    guard plan.capture([], machine)
      is [Assign(_, _), Assign(_, _), Assign(depth, Int(0))] else {
      fail("empty snapshots must reset the previous suffix depth")
    }
    assert_eq(snapshot_test_name(depth), "error_depth")
    guard plan.states(Ident("prefix"), machine)
      is Block({ statements, result: Some(Ident("_yy_error_states")), }) else {
      fail("missing cold snapshot projection")
    }
    assert_true(
      statements[0] is LetMut("_yy_error_states", None, Ident("prefix")),
    )
    assert_eq(statements.length(), 4)
    for index in 0..<plan.width {
      guard statements[index + 1]
        is Eval(
          If(
            Binary(Greater, depth, Int(limit)),
            {
              statements: [
                Assign(
                  Ident("_yy_error_states"),
                  Call(
                    Ident("@list.cons"),
                    [Positional(state), Positional(Ident("_yy_error_states"))]
                  )
                ),
              ],
              result: None,
            },
            None
          )
        ) else {
        fail("suffix projection must cons each live saved state")
      }
      assert_eq(snapshot_test_name(depth), "error_depth")
      assert_eq(limit, index)
      assert_eq(snapshot_test_name(state), snapshot_slot(index))
    }
  }
}

///|
test "materialized snapshots require no suffix storage or projection" {
  let absent = SnapshotPlan::new([])
  assert_false(absent.saves)
  assert_true(absent.storage().all(pair => !pair.0.mutable))
  let materialized = SnapshotPlan::new([
    snapshot_test_block([SaveErrorSnapshot([])]),
  ])
  assert_true(materialized.saves)
  assert_eq(materialized.width, 0)
  assert_eq(materialized.storage().length(), 2)
  assert_eq(materialized.local_storage().length(), 2)
  assert_eq(materialized.capture([], name => Ident(name)).length(), 2)
  assert_true(
    materialized.states(Ident("prefix"), name => Ident(name)) is Ident("prefix"),
  )
}
