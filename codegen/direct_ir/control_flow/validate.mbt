///|
priv enum Destination {
  Block(Int32)
  Choice(Set[Int32])
  Gate
}

///|
fn first(control : Control) -> Destination raise InvalidControl {
  match control {
    Run(label, _) => Block(label)
    Sequence(nodes) => {
      require(!nodes.is_empty(), "empty control sequence")
      first(nodes[0])
    }
    Scope(_, body) | Loop(_, body) => first(body)
    Dispatch(_, entries, _) => Choice(Set(entries))
    Switch(cases) => Choice(Set(cases.map(p => p.0)))
    Select(_) => Gate
  }
}

///|
priv struct ControlCheck {
  plan : Plan
  region : Int32
  blocks : Set[Int32]
  scopes : Set[Int32]
  used_breaks : Set[Int32]
  selectors : Ref[Int32]
  breaks : Map[Int32, Destination]
  loops : Map[Int32, Destination]
  selector : Set[Int32]?
}

///|
fn ControlCheck::route(
  self : ControlCheck,
  target : Int32,
  route : Transfer,
) -> Unit raise InvalidControl {
  require(
    target >= 0 && target < self.plan.source.blocks.length(),
    "invalid target",
  )
  match route {
    Exit => {
      require(
        self.plan.owner[target] != self.region,
        "local edge escapes its region",
      )
      require(self.plan.addresses[target] >= 0, "exit targets a private block")
    }
    Break(id) | Enter(id) => {
      guard self.breaks.get(id) is Some(destination) else {
        raise InvalidControl("break outside its lexical scope")
      }
      self.used_breaks.add(id)
      self.destination(target, route, destination)
    }
    Continue(id) | Dispatch(id) => {
      guard self.loops.get(id) is Some(destination) else {
        raise InvalidControl("continue outside its lexical loop")
      }
      self.destination(target, route, destination)
    }
  }
}

///|
fn ControlCheck::destination(
  _self : ControlCheck,
  target : Int32,
  route : Transfer,
  destination : Destination,
) -> Unit raise InvalidControl {
  match (route, destination) {
    (Break(_) | Continue(_), Block(label)) =>
      require(target == label, "structured edge changes its CFG destination")
    (Enter(_), Choice(entries)) | (Dispatch(_), Choice(entries)) =>
      require(entries.contains(target), "unknown dispatcher entry")
    _ => raise InvalidControl("wrong kind of structured transfer")
  }
}

///|
fn ControlCheck::scope(
  self : ControlCheck,
  id : Int32,
) -> Unit raise InvalidControl {
  require(id >= 0, "invalid scope identifier")
  require(!self.scopes.contains(id), "duplicate scope identifier")
  self.scopes.add(id)
}

///|
/// Independently resolve lexical continuations and compare every source edge.
/// A Run executes the original instructions and branch tree unchanged, so
/// these edge checks establish a weak bisimulation modulo administrative
/// scopes. Scope bodies must not fall through and accidentally iterate.
fn ControlCheck::node(
  self : ControlCheck,
  control : Control,
  next : Destination?,
) -> Bool raise InvalidControl {
  match control {
    Run(label, routes) => {
      require(
        label >= 0 && label < self.plan.source.blocks.length(),
        "invalid Run",
      )
      require(self.plan.owner[label] == self.region, "Run in the wrong region")
      require(!self.blocks.contains(label), "duplicated source block")
      self.blocks.add(label)
      let targets = Set(self.plan.source.blocks[label].terminator.successors())
      require(routes.length() == targets.length(), "incomplete route map")
      for target in targets {
        guard routes.get(target) is Some(route) else {
          raise InvalidControl("missing CFG edge")
        }
        self.route(target, route)
      }
      false
    }
    Select(arms) => {
      self.selectors.val += 1
      require(
        Set(arms.map(p => p.0)) == Set(self.plan.regions[self.region].entries) &&
        arms.length() == self.plan.regions[self.region].entries.length(),
        "entry selector differs from region interface",
      )
      for (target, route) in arms {
        self.route(target, route)
      }
      false
    }
    Sequence(nodes) => {
      require(!nodes.is_empty(), "empty sequence")
      let mut completes = true
      for index, node in nodes {
        require(completes, "unreachable lexical continuation")
        let continuation = if index + 1 < nodes.length() {
          Some(first(nodes[index + 1]))
        } else {
          next
        }
        completes = self.node(node, continuation)
      }
      completes
    }
    Scope(id, body) => {
      self.scope(id)
      guard next is Some(destination) else {
        raise InvalidControl("forward scope has no continuation")
      }
      let breaks = self.breaks.copy()
      breaks[id] = destination
      require(!{ ..self, breaks, }.node(body, None), "scope body falls through")
      require(self.used_breaks.contains(id), "unused forward scope")
      true
    }
    Loop(id, body) => {
      self.scope(id)
      let destination = first(body)
      require(destination is Block(_), "loop has no unique header")
      let loops = self.loops.copy()
      loops[id] = destination
      require(!{ ..self, loops, }.node(body, None), "loop body falls through")
      false
    }
    Dispatch(id, entries, body) => {
      self.scope(id)
      let headers = Set(entries)
      require(
        !entries.is_empty() && headers.length() == entries.length(),
        "invalid dispatch",
      )
      require(
        first(body) is Choice(selected) && selected == headers,
        "wrong dispatcher header",
      )
      let loops = self.loops.copy()
      loops[id] = Choice(headers)
      require(
        !{ ..self, loops, selector: Some(headers), }.node(body, None),
        "dispatcher falls through",
      )
      false
    }
    Switch(cases) => {
      require(
        self.selector == Some(Set(cases.map(p => p.0))),
        "selector outside its dispatcher",
      )
      require(
        Set(cases.map(p => p.0)).length() == cases.length(),
        "duplicate dispatcher case",
      )
      for (label, body) in cases {
        require(
          first(body) is Block(entry) && entry == label,
          "dispatch selects wrong block",
        )
        require(!self.node(body, None), "dispatch branch falls through")
      }
      false
    }
  }
}

///|
pub fn Plan::validate(self : Plan) -> Unit raise InvalidControl {
  let count = self.source.blocks.length()
  require(
    self.owner.length() == count && self.addresses.length() == count,
    "invalid tables",
  )
  require(self.stride > 0, "invalid address stride")
  let members = Set([])
  for index, region in self.regions {
    require(!region.entries.is_empty(), "region has no entry")
    require(region.entries.length() <= self.stride, "entry address overflow")
    for node in region.members {
      require(
        node >= 0 && node < count && !members.contains(node),
        "invalid partition",
      )
      members.add(node)
      require(self.owner[node] == index, "inconsistent region ownership")
    }
    for offset, entry in region.entries {
      require(region.members.contains(entry), "entry not in its region")
      require(
        self.addresses[entry] == index * self.stride + offset,
        "invalid entry address",
      )
    }
    let check = ControlCheck::{
      plan: self,
      region: index,
      blocks: Set([]),
      scopes: Set([]),
      used_breaks: Set([]),
      selectors: Ref(0),
      breaks: Map([]),
      loops: Map([]),
      selector: None,
    }
    require(first(region.control) is Gate, "region bypasses its entry selector")
    require(!check.node(region.control, None), "region falls through")
    require(check.selectors.val == 1, "duplicated entry selector")
    require(check.blocks == Set(region.members), "region loses a source block")
  }
  require(members.length() == count, "partition loses a source block")
  for entry in self.source.entries {
    require(self.addresses[entry.block] >= 0, "parser entry is not exported")
  }
}
