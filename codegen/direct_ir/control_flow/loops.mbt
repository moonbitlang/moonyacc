///|
priv struct NaturalLoop {
  nodes : Array[Int32]
  parent : Int32?
}

///|
/// Global natural loops are discovered before any region is cut. In particular
/// a natural loop whose header is also an entry of an irreducible SCC remains
/// a loop, rather than becoming a back edge through that SCC's dispatcher.
priv struct LoopForest {
  loops : Map[Int32, NaturalLoop]
  owner : Array[Int32?]
}

///|
fn Graph::loop_forest(self : Graph) -> LoopForest {
  let dom = self.dominators()
  let members : Map[Int32, Set[Int32]] = Map([])
  for latch, targets in self.successors {
    for header in targets {
      if !dom.dominates(header, latch) {
        continue
      }
      let loop_ = members.get_or_init(header, () => Set([header]))
      let pending = [latch]
      while pending.pop() is Some(node) {
        if loop_.contains(node) {
          continue
        }
        guard! dom.dominates(header, node)
        loop_.add(node)
        pending.append(self.predecessors[node])
      }
    }
  }
  let loops = Map([])
  for header, member_set in members {
    let nodes = member_set.to_array()
    nodes.sort()
    let mut ancestor = dom.parent[header]
    while ancestor != dom.root &&
          !members
          .get(ancestor)
          .map(nodes => nodes.contains(header))
          .unwrap_or(false) {
      ancestor = dom.parent[ancestor]
    }
    loops[header] = NaturalLoop::{
      nodes,
      parent: if ancestor == dom.root {
        None
      } else {
        Some(ancestor)
      },
    }
  }
  let headers = loops.keys().to_array()
  headers.sort_by((a, b) => {
    let order = loops[a].nodes.length() - loops[b].nodes.length()
    if order == 0 {
      a - b
    } else {
      order
    }
  })
  let owner : Array[Int32?] = Array::make(self.successors.length(), None)
  for header in headers {
    for node in loops[header].nodes {
      if owner[node] is None {
        owner[node] = Some(header)
      }
    }
  }
  { loops, owner, }
}

///|
priv enum FlowUnit {
  Node(Int32)
  Natural(Int32)
}

///|
fn FlowUnit::entry(self : FlowUnit) -> Int32 {
  match self {
    Node(node) | Natural(node) => node
  }
}

///|
fn FlowUnit::nodes(self : FlowUnit, forest : LoopForest) -> Array[Int32] {
  match self {
    Node(node) => [node]
    Natural(header) => forest.loops[header].nodes
  }
}

///|
fn LoopForest::units(
  self : LoopForest,
  nodes : Array[Int32],
) -> Array[FlowUnit] {
  let allowed = Set(nodes)
  let complete : Map[Int32, Bool] = Map([])
  fn fits(header : Int32) -> Bool {
    complete.get_or_init(header, () => {
      self.loops[header].nodes.all(n => allowed.contains(n))
    })
  }
  let seen = Set([])
  let units = []
  for node in nodes {
    if seen.contains(node) {
      continue
    }
    let unit_ = if self.owner[node] is Some(owner) && fits(owner) {
      let mut header = owner
      while self.loops[header].parent is Some(parent) && fits(parent) {
        header = parent
      }
      Natural(header)
    } else {
      Node(node)
    }
    units.push(unit_)
    for item in unit_.nodes(self) {
      seen.add(item)
    }
  }
  units
}
