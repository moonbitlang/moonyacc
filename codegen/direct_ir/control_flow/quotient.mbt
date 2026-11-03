///|
priv struct Quotient {
  graph : Graph
  units : Array[FlowUnit]
  owner : Map[Int32, Int32]
}

///|
fn Graph::quotient(
  self : Graph,
  forest : LoopForest,
  nodes : Array[Int32],
) -> Quotient {
  let units = forest.units(nodes)
  let owner = Map([])
  for id, unit_ in units {
    for node in unit_.nodes(forest) {
      owner[node] = id
    }
  }
  let successors = units.mapi((id, unit_) => {
    let targets = Set([])
    for node in unit_.nodes(forest) {
      for next in self.successors[node] {
        if owner.get(next) is Some(target) && (target != id || unit_ is Node(_)) {
          targets.add(target)
        }
      }
    }
    let targets = targets.to_array()
    targets.sort()
    targets
  })
  let predecessors : Array[Array[Int32]] = units.map(_ => [])
  for source, targets in successors {
    for target in targets {
      predecessors[target].push(source)
    }
  }
  let roots = Set([])
  for id, unit_ in units {
    for node in unit_.nodes(forest) {
      if self.roots.contains(node) ||
        self.predecessors[node].any(p => !owner.contains(p)) {
        // A complete natural loop has no incoming edge below its header.
        guard! node == unit_.entry()
        roots.add(id)
      }
    }
  }
  { graph: { successors, predecessors, roots, }, units, owner, }
}
