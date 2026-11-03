///|
priv struct Graph {
  successors : Array[Array[Int32]]
  predecessors : Array[Array[Int32]]
  roots : Set[Int32]
}

///|
fn Graph::new(source : @direct_ir.Program) -> Graph {
  let successors = source.blocks.map(b => {
    let targets = Set::from_iter(b.terminator.successors().iter()).to_array()
    targets.sort()
    targets
  })
  let predecessors : Array[Array[Int32]] = successors.map(_ => [])
  for node, targets in successors {
    for target in targets {
      predecessors[target].push(node)
    }
  }
  let graph = {
    successors,
    predecessors,
    roots: Set(source.entries.map(e => e.block)),
  }
  // Give unreachable source components private analysis roots once, before
  // computing dominance. Region planning must not invent new dominance facts.
  let nodes = source.blocks.mapi((i, _) => i)
  for component in graph.components(nodes) {
    if graph.entries(component).is_empty() {
      graph.roots.add(component[0])
    }
  }
  graph
}

///|
fn Graph::entries(self : Graph, nodes : Array[Int32]) -> Array[Int32] {
  let members = Set(nodes)
  nodes.filter(n => {
    self.roots.contains(n) ||
    self.predecessors[n].any(p => !members.contains(p))
  })
}

///|
/// Iterative DFS avoids using the generator's call stack for long CFG paths.
fn Graph::postorder(self : Graph, nodes : Array[Int32]) -> Array[Int32] {
  let allowed = Set(nodes)
  let seen = Set([])
  let order = []
  for root in nodes {
    if seen.contains(root) {
      continue
    }
    seen.add(root)
    let work = [(root, 0)]
    while work.pop() is Some((node, index)) {
      if index == self.successors[node].length() {
        order.push(node)
      } else {
        work.push((node, index + 1))
        let next = self.successors[node][index]
        if allowed.contains(next) && !seen.contains(next) {
          seen.add(next)
          work.push((next, 0))
        }
      }
    }
  }
  order
}

///|
/// Kosaraju's decomposition, in source-to-sink condensation order. The same
/// operation is used on induced subgraphs after removing a natural-loop head.
fn Graph::components(self : Graph, nodes : Array[Int32]) -> Array[Array[Int32]] {
  let allowed = Set(nodes)
  let seen = Set([])
  let components = []
  let order = self.postorder(nodes)
  for i = order.length() - 1; i >= 0; i = i - 1 {
    let root = order[i]
    if seen.contains(root) {
      continue
    }
    seen.add(root)
    let component = []
    let work = [root]
    while work.pop() is Some(node) {
      component.push(node)
      for prev in self.predecessors[node] {
        if allowed.contains(prev) && !seen.contains(prev) {
          seen.add(prev)
          work.push(prev)
        }
      }
    }
    component.sort()
    components.push(component)
  }
  components
}

///|
fn Graph::cyclic(self : Graph, nodes : Array[Int32]) -> Bool {
  nodes.length() > 1 || self.successors[nodes[0]].contains(nodes[0])
}
