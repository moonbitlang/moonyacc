///|
/// Immediate dominators with one synthetic root for all public/private entries.
/// This is scheduling information; the emitted control tree is checked again
/// against every source edge independently of the dominance algorithm.
priv struct Dominators {
  parent : Array[Int32]
  depth : Array[Int32]
  root : Int32
}

///|
fn Graph::dominators(self : Graph) -> Dominators {
  let count = self.successors.length()
  let roots = self.roots.to_array()
  roots.sort()
  let nodes = roots.copy()
  for node in 0..<count {
    if !self.roots.contains(node) {
      nodes.push(node)
    }
  }
  let order = self.postorder(nodes).rev()
  let rank = Array::make(count + 1, 0)
  for i, node in order {
    rank[node] = i + 1
  }
  let parent = Array::make(count + 1, -1)
  parent[count] = count
  fn intersect(left : Int32, right : Int32) -> Int32 {
    let mut left = left
    let mut right = right
    while left != right {
      while rank[left] > rank[right] {
        left = parent[left]
      }
      while rank[right] > rank[left] {
        right = parent[right]
      }
    }
    left
  }
  let mut changed = true
  while changed {
    changed = false
    for node in order {
      let mut before = if self.roots.contains(node) { count } else { -1 }
      for predecessor in self.predecessors[node] {
        if parent[predecessor] >= 0 {
          before = if before < 0 {
            predecessor
          } else {
            intersect(before, predecessor)
          }
        }
      }
      if before >= 0 && before != parent[node] {
        parent[node] = before
        changed = true
      }
    }
  }
  let depth = Array::make(count + 1, 0)
  for node in order {
    guard! parent[node] >= 0 && rank[parent[node]] < rank[node]
    depth[node] = depth[parent[node]] + 1
  }
  { parent, depth, root: count, }
}

///|
fn Dominators::dominates(
  self : Dominators,
  ancestor : Int32,
  node : Int32,
) -> Bool {
  let mut node = node
  while self.depth[node] > self.depth[ancestor] {
    node = self.parent[node]
  }
  node == ancestor
}
