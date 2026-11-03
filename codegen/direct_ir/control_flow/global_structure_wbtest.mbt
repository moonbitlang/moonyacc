///|
test "global dominators agree with the set-equation oracle for all three-node CFGs" {
  for bits in 0..<512 {
    let edges = Array::makei(3, from => {
      [0, 1, 2].filter(to => (bits & (1 << (from * 3 + to))) != 0)
    })
    for roots in [[0], [0, 1, 2]] {
      let graph = Graph::new(graph_program(edges, roots))
      let actual = graph.dominators()
      let expected = Array::makei(4, i => {
        if i == 3 {
          Set([3])
        } else {
          Set([0, 1, 2, 3])
        }
      })
      let mut changed = true
      while changed {
        changed = false
        for node in 0..<3 {
          let incoming = graph.predecessors[node].copy()
          if graph.roots.contains(node) {
            incoming.push(3)
          }
          let next = Set::from_iter(
            [0, 1, 2, 3]
            .iter()
            .filter(d => d == node || incoming.all(p => expected[p].contains(d))),
          )
          if next != expected[node] {
            expected[node] = next
            changed = true
          }
        }
      }
      for node in 0..<3 {
        for ancestor in 0..<4 {
          assert_eq(
            actual.dominates(ancestor, node),
            expected[node].contains(ancestor),
          )
        }
      }
    }
  }
}

///|
test "a natural loop at an irreducible entry keeps its own continue" {
  let source = graph_program([[1, 2], [1, 2, 3], [1, 3], []], [0])
  let result = graph_plan(source)
  assert_eq(loop_counts(result.regions[0].control), (1, 1))
  assert_true(result.transfers(1)[1] is Continue(_))
  assert_true(result.transfers(2)[1] is Dispatch(_))
  let nested = graph_plan(graph_program([[1, 3], [0, 2], [1], []], [0]))
  assert_eq(loop_counts(nested.regions[0].control), (2, 0))
}

///|
test "linear code falls through without forward scopes and invalid loop fallthrough is rejected" {
  let source = graph_program([[1], [2], [3], []], [0])
  let result = graph_plan(source)
  guard! result.regions[0].control is Sequence(nodes)
  assert_eq(nodes.length(), 5)
  assert_true(nodes.all(node => node is (Run(_) | Select(_))))
  for label in 0..<3 {
    assert_true(result.transfers(label)[label + 1] is Next)
  }
  let cyclic = graph_plan(graph_program([[0]], [0]))
  fn corrupt(control : Control) -> Control {
    match control {
      Run(label, _) => Run(label, Map([(label, Next)]))
      Sequence(nodes) => Sequence(nodes.map(corrupt))
      Scope(id, body) => Scope(id, corrupt(body))
      Loop(id, body) => Loop(id, corrupt(body))
      Dispatch(id, entries, body) => Dispatch(id, entries, corrupt(body))
      Switch(cases) => Switch(cases.map(p => (p.0, corrupt(p.1))))
      other => other
    }
  }
  let bad = {
    ..cyclic,
    regions: cyclic.regions.map(r => { ..r, control: corrupt(r.control), }),
  }
  assert_true(
    try {
      bad.validate()
      false
    } catch {
      InvalidControl(_) => true
    },
  )
}

///|
test "global joins and bounded partitions preserve larger branching cyclic graphs" {
  let mut seed = 19
  fn next() -> Int32 {
    seed = seed * 1664525 + 1013904223
    seed & 0x7fffffff
  }
  for sample in 0..<96 {
    let count = 70 + sample % 13
    let edges = Array::makei(count, _ => {
      let targets = Set([])
      let degree = next() % 4
      for _ in 0..<degree {
        targets.add(next() % count)
      }
      let targets = targets.to_array()
      targets.sort()
      targets
    })
    let source = graph_program(
      edges,
      if sample % 2 == 0 {
        [0]
      } else {
        [0, count / 2]
      },
    )
    let analysis = analyze(source)
    let whole = build_plan(
      source,
      analysis.graph,
      analysis.forest,
      [source.blocks.mapi((i, _) => i)],
      analysis.whole,
    )
    whole.validate()
    let costs = source.blocks.map(_ => next() % (REGION_COST + 2))
    for partitioning in [Loops, WholeLoops, Joins, FixedSuccessors] {
      let result = analysis.plan(costs~, partitioning~)
      result.validate()
      for region in result.regions {
        assert_true(region.members.length() <= REGION_NODES)
        assert_true(
          region.members.length() == 1 ||
          region.members.fold(init=0, (n, node) => n + costs[node]) <=
          (if partitioning is WholeLoops {
            LOOP_REGION_COST
          } else {
            REGION_COST
          }),
        )
      }
    }
  }
}

///|
test "whole-loop candidate retains a bounded cycle and still splits an oversized one" {
  fn cycle(length : Int32) -> @direct_ir.Program {
    let edges = Array::makei(length, i => [(i + 1) % length])
    for _ in 0..<REGION_NODES {
      edges.push([])
    }
    graph_program(edges, [0])
  }
  let source = cycle(10)
  let costs = source.blocks.mapi((i, _) => if i < 10 { 100 } else { 1 })
  let ordinary = plan(source, costs~)
  let whole = plan(source, costs~, partitioning=WholeLoops)
  assert_true(ordinary.owner[0] != ordinary.owner[9])
  assert_eq(whole.owner[0], whole.owner[9])
  assert_true(whole.transfers(9)[0] is Continue(_))
  let large = cycle(24)
  let bounded = plan(
    large,
    costs=large.blocks.map(_ => 100),
    partitioning=WholeLoops,
  )
  assert_true(bounded.owner[0] != bounded.owner[23])
  bounded.validate()
}

///|
test "entry addresses leave padding while retaining every checked destination" {
  let result = graph_plan(graph_program([[], [], []], [0, 1, 2]))
  assert_eq(result.stride, 4)
  assert_eq(result.addresses, [0, 1, 2])
  result.validate()
  assert_true(
    try {
      { ..result, stride: 3, }.validate()
      false
    } catch {
      InvalidControl(_) => true
    },
  )
}
