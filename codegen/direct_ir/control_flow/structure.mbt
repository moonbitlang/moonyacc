///|
priv struct Structurer {
  graph : Graph
  forest : LoopForest
  mut next_scope : Int32
}

///|
priv enum Prefix {
  Entries(Array[Int32])
  Header(FlowUnit)
  Headers(Array[FlowUnit])
}

///|
fn Structurer::fresh(self : Structurer) -> Int32 {
  let id = self.next_scope
  self.next_scope += 1
  id
}

///|
fn Structurer::run(
  self : Structurer,
  label : Int32,
  routes : Map[Int32, Transfer],
  fallthrough? : Int32,
) -> Control {
  let selected = Map([])
  for target in self.graph.successors[label] {
    let route = routes.get(target).unwrap_or(Exit)
    selected[target] = if fallthrough == Some(target) &&
      route is (Next | Break(_)) {
      Next
    } else {
      route
    }
  }
  Run(label, selected)
}

///|
fn Structurer::prefix(
  self : Structurer,
  prefix : Prefix,
  routes : Map[Int32, Transfer],
  fallthrough? : Int32,
) -> Control {
  match prefix {
    Entries(entries) =>
      Select(
        entries.map(node => {
          let route = routes[node]
          (
            node,
            if fallthrough == Some(node) && route is (Next | Break(_)) {
              Next
            } else {
              route
            },
          )
        }),
      )
    Header(unit_) => self.unit(unit_, routes, fallthrough?)
    Headers(units) =>
      Switch(
        units.map(unit_ => {
          (unit_.entry(), self.unit(unit_, routes, fallthrough?))
        }),
      )
  }
}

///|
fn Structurer::unit(
  self : Structurer,
  unit_ : FlowUnit,
  routes : Map[Int32, Transfer],
  fallthrough? : Int32,
) -> Control {
  match unit_ {
    Node(node) => self.run(node, routes, fallthrough?)
    Natural(header) => {
      let id = self.fresh()
      let nested = routes.copy()
      nested[header] = Continue(id)
      let remaining = self.forest.loops[header].nodes.filter(node => {
        node != header
      })
      let body = if remaining.is_empty() {
        self.run(header, nested)
      } else {
        self.sequence(remaining, nested, Header(Node(header)))
      }
      Loop(id, body)
    }
  }
}

///|
/// Natural loops are already contracted into units. Remaining cycles can
/// retain a local dispatcher without routing natural-loop back edges through
/// it. All transfers still refer to the original source block labels.
fn Structurer::component(
  self : Structurer,
  quotient : Quotient,
  component : Array[Int32],
  routes : Map[Int32, Transfer],
  fallthrough? : Int32,
) -> Control {
  if !quotient.graph.cyclic(component) {
    return self.unit(quotient.units[component[0]], routes, fallthrough?)
  }
  let id = self.fresh()
  let headers = quotient.graph.entries(component)
  guard! !headers.is_empty()
  let nested = routes.copy()
  let header_set = Set(headers)
  let remaining = []
  for node in component {
    if !header_set.contains(node) {
      remaining.append(quotient.units[node].nodes(self.forest))
    }
  }
  match headers {
    [header] => {
      let unit_ = quotient.units[header]
      nested[unit_.entry()] = Continue(id)
      let body = if remaining.is_empty() {
        self.unit(unit_, nested)
      } else {
        self.sequence(remaining, nested, Header(unit_))
      }
      Loop(id, body)
    }
    _ => {
      let units = headers.map(header => quotient.units[header])
      let entries = units.map(unit_ => unit_.entry())
      for entry in entries {
        nested[entry] = Dispatch(id)
      }
      let body = if remaining.is_empty() {
        self.prefix(Headers(units), nested)
      } else {
        self.sequence(remaining, nested, Headers(units))
      }
      Dispatch(id, entries, body)
    }
  }
}
