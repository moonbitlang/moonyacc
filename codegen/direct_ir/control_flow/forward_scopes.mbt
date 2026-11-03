///|
priv struct ForwardScopes {
  components : Array[Array[Int32]]
  first : Array[Int32?]
  cyclic : Array[Bool]
  starts : Array[Int32]
  labels : Array[Int32]
  routes : Map[Int32, Transfer]
}

///|
/// Forward scopes end immediately before their target. Their opening is the
/// earliest required predecessor, extended only to prevent crossing scopes.
/// This is Stackifier's lexical-interval rule; no CFG instruction is copied.
fn Structurer::forward_scopes(
  self : Structurer,
  quotient : Quotient,
  prefix : Prefix,
  inherited : Map[Int32, Transfer],
) -> ForwardScopes {
  let components = quotient.graph.components(quotient.units.mapi((i, _) => i))
  let positions = Array::make(quotient.units.length(), 0)
  let first = components.map(component => {
    let entries = quotient.graph.entries(component)
    if !quotient.graph.cyclic(component) {
      Some(quotient.units[component[0]].entry())
    } else if entries is [entry] {
      Some(quotient.units[entry].entry())
    } else {
      None
    }
  })
  let cyclic = components.map(component => {
    quotient.graph.cyclic(component) ||
    quotient.units[component[0]] is Natural(_)
  })
  for index, component in components {
    for unit_ in component {
      positions[unit_] = index + 1
    }
  }
  let starts = Array::makei(components.length() + 1, i => i)
  fn target(from : Int32, cycle : Bool, node : Int32) {
    if quotient.owner.get(node) is Some(unit_) {
      let to = positions[unit_]
      if to != from {
        guard! from < to
        if cycle || to != from + 1 || first[to - 1] != Some(node) {
          starts[to] = Int32::min(starts[to], from)
        }
      }
    }
  }
  fn outgoing(from : Int32, cycle : Bool, unit_ : FlowUnit) {
    for node in unit_.nodes(self.forest) {
      for next in self.graph.successors[node] {
        target(from, cycle, next)
      }
    }
  }
  match prefix {
    Entries(entries) =>
      for entry in entries {
        target(0, false, entry)
      }
    Header(unit_) => outgoing(0, unit_ is Natural(_), unit_)
    Headers(units) =>
      for unit_ in units {
        outgoing(0, unit_ is Natural(_), unit_)
      }
  }
  for index, component in components {
    for unit_ in component {
      outgoing(index + 1, cyclic[index], quotient.units[unit_])
    }
  }
  // Previously normalized intervals are either nested or disjoint. Extending
  // a later interval over any crossing one preserves that invariant.
  for end in 1..<starts.length() {
    let mut scan = end - 1
    while scan > starts[end] {
      starts[end] = Int32::min(starts[end], starts[scan])
      scan -= 1
    }
  }
  let labels = starts.mapi((end, start) => {
    if start < end {
      self.fresh()
    } else {
      -1
    }
  })
  let routes = inherited.copy()
  for index, component in components {
    let route = if labels[index + 1] < 0 {
      Next
    } else if first[index] is None {
      Enter(labels[index + 1])
    } else {
      Break(labels[index + 1])
    }
    for unit_ in component {
      for node in quotient.units[unit_].nodes(self.forest) {
        routes[node] = route
      }
    }
  }
  { components, first, cyclic, starts, labels, routes, }
}

///|
fn sequence_control(nodes : Array[Control]) -> Control {
  guard! !nodes.is_empty()
  if nodes is [node] {
    node
  } else {
    Sequence(nodes)
  }
}

///|
fn Structurer::sequence(
  self : Structurer,
  nodes : Array[Int32],
  inherited : Map[Int32, Transfer],
  prefix : Prefix,
) -> Control {
  let quotient = self.graph.quotient(self.forest, nodes)
  let scopes = self.forward_scopes(quotient, prefix, inherited)
  let count = scopes.components.length()
  let openings : Array[Array[Int32]] = Array::makei(count + 1, _ => [])
  for end = count; end > 0; end = end - 1 {
    if scopes.starts[end] < end {
      openings[scopes.starts[end]].push(end)
    }
  }
  let buffers : Array[Array[Control]] = [[]]
  let closing = []
  for position in 0..<=count {
    while closing.last() == Some(position) {
      let end = closing.pop().unwrap()
      let body = sequence_control(buffers.pop().unwrap())
      buffers.last().unwrap().push(Scope(scopes.labels[end], body))
    }
    for end in openings[position] {
      closing.push(end)
      buffers.push([])
    }
    let next = if position < count { scopes.first[position] } else { None }
    let control = if position == 0 {
      self.prefix(prefix, scopes.routes, fallthrough?=next)
    } else {
      self.component(
        quotient,
        scopes.components[position - 1],
        scopes.routes,
        fallthrough?=if scopes.cyclic[position - 1] { None } else { next },
      )
    }
    buffers.last().unwrap().push(control)
  }
  guard! closing.is_empty() && buffers.length() == 1
  sequence_control(buffers[0])
}
