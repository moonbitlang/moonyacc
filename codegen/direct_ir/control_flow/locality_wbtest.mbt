///|
test "fixed continuations stay together across SCCs without splitting a small loop" {
  let edges = [[1, 2], [3], [3], [4], [3]]
  // Exceed the whole-parser shortcut while keeping the relevant CFG small.
  for _ in 0..<REGION_NODES {
    edges.push([])
  }
  let source = graph_program(edges, [0])
  let costs = Array::make(edges.length(), 1)
  costs[0] = 300
  costs[1] = 280
  costs[2] = 10
  costs[3] = 100
  costs[4] = 100
  let fixed = plan(source, costs~, partitioning=FixedSuccessors)
  fixed.validate()
  assert_eq(fixed.owner[1], fixed.owner[3])
  assert_eq(fixed.owner[2], fixed.owner[3])
  assert_eq(fixed.owner[3], fixed.owner[4])
  for region in fixed.regions {
    assert_true(region.members.length() <= REGION_NODES)
    assert_true(
      region.members.fold(init=0, (n, label) => n + costs[label]) <= REGION_COST,
    )
  }
  assert_true(
    fixed.transfer_cost().fixed_exits <
    plan(source, costs~).transfer_cost().fixed_exits,
  )
}

///|
test "locality plans preserve cyclic interfaces under node and cost limits" {
  let source = graph_program(Array::makei(150, i => [(i + 1) % 150]), [0, 75])
  for cost in [0, 10, REGION_COST, REGION_COST + 1] {
    let fixed = plan(
      source,
      costs=Array::make(150, cost),
      partitioning=FixedSuccessors,
    )
    fixed.validate()
    for region in fixed.regions {
      assert_true(region.members.length() <= REGION_NODES)
      assert_true(
        region.members.length() == 1 ||
        region.members.length() * cost <= REGION_COST,
      )
    }
  }
}

///|
test "layout candidates include fixed cross-region continuations outside local dispatchers" {
  let source = graph_program(
    Array::makei(150, i => if i < 149 { [i + 1] } else { [] }),
    [0],
  )
  let divided = plan(source, costs=Array::make(150, 1))
  assert_eq(loop_counts(divided.regions[0].control), (0, 0))
  let candidates = divided.continuation_candidates()
  assert_false(candidates.is_empty())
  for label in candidates {
    assert_true(label > 0 && label < 149)
    assert_true(divided.owner[label - 1] != divided.owner[label])
  }
  assert_true(divided.transfer_cost().fixed_exits > 0)
}
