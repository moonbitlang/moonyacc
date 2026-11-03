///|
/// Static transfer sites, not predicted execution frequencies. Keeping these
/// separate avoids trading a local selector for a more expensive region exit.
pub struct TransferCost {
  selectors : Int32
  exits : Int32
  entries : Int32
  fixed_exits : Int32
}

///|
pub fn TransferCost::no_worse_than(
  self : TransferCost,
  other : TransferCost,
) -> Bool {
  // Each Exit also executes the outer selector. Permit replacing that choice
  // with a local/entry selector, while never introducing more region exits.
  // Fixed exits are a locality preference, not an additional execution step.
  self.exits <= other.exits &&
  self.exits + self.selectors + self.entries <=
  other.exits + other.selectors + other.entries
}

///|
fn Control::routes_for(self : Control, label : Int32) -> Map[Int32, Transfer]? {
  match self {
    Run(node, routes) => if node == label { Some(routes) } else { None }
    Scope(_, body) | Loop(_, body) | Dispatch(_, _, body) =>
      body.routes_for(label)
    Sequence(nodes) => {
      for node in nodes {
        if node.routes_for(label) is Some(routes) {
          return Some(routes)
        }
      }
      None
    }
    Switch(cases) => {
      for (_, body) in cases {
        if body.routes_for(label) is Some(routes) {
          return Some(routes)
        }
      }
      None
    }
    Select(_) => None
  }
}

///|
pub fn Plan::transfers(self : Plan, label : Int32) -> Map[Int32, Transfer] {
  self.regions[self.owner[label]].control.routes_for(label).unwrap()
}

///|
pub fn Plan::transfer_cost(self : Plan) -> TransferCost {
  let mut selectors = 0
  let mut exits = 0
  let mut entries = 0
  let mut fixed_exits = 0
  fn visit(control : Control) -> Unit {
    match control {
      Run(label, routes) => {
        let fixed = Set::from_iter(
            self.source.blocks[label].terminator.successors().iter(),
          ).length() ==
          1
        for target in self.source.blocks[label].terminator.successors() {
          match routes[target] {
            Enter(_) | Dispatch(_) => selectors += 1
            Exit => {
              exits += 1
              if fixed {
                fixed_exits += 1
              }
            }
            Next | Break(_) | Continue(_) => ()
          }
        }
      }
      Sequence(nodes) =>
        for node in nodes {
          visit(node)
        }
      Scope(_, body) | Loop(_, body) | Dispatch(_, _, body) => visit(body)
      Switch(cases) =>
        for (_, body) in cases {
          visit(body)
        }
      Select(arms) => if arms.length() > 1 { entries += 1 }
    }
  }
  for region in self.regions {
    visit(region.control)
  }
  { selectors, exits, entries, fixed_exits, }
}

///|
/// Multi-entry loop headers and fixed continuations reached across regions
/// are candidates. The IR rewriter checks eligibility; emission owns growth.
pub fn Plan::continuation_candidates(self : Plan) -> Array[Int32] {
  let headers = Set([])
  fn visit(control : Control) -> Unit {
    match control {
      Dispatch(_, entries, body) => {
        for entry in entries {
          headers.add(entry)
        }
        visit(body)
      }
      Sequence(nodes) =>
        for node in nodes {
          visit(node)
        }
      Scope(_, body) | Loop(_, body) => visit(body)
      Switch(cases) =>
        for (_, body) in cases {
          visit(body)
        }
      Run(_, routes) =>
        for target, transfer in routes {
          if transfer is Exit &&
            Set::from_iter(
              self.source.blocks[target].terminator.successors().iter(),
            ).length() ==
            1 {
            headers.add(target)
          }
        }
      Select(_) => ()
    }
  }
  for region in self.regions {
    visit(region.control)
  }
  let labels = headers
    .to_array()
    .filter(label => {
      !self.source.entries.any(e => e.block == label) &&
      !self.source.blocks[label].terminator.successors().contains(label)
    })
  labels.sort()
  labels
}
