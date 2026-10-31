///|
// Menhir's NeededRegisters solves demand before choosing function interfaces.
// Here the same CFG equations apply to scalar frame fields in target lowering;
// logical registers and stack invariants retain their existing analyses.
fn ResourcePlan::solve(
  catalog : ResourceCatalog,
  helpers : Map[String, ResourceEffect],
  effects : Array[ResourceEffect],
  accesses : Array[Set[Int32]],
  successors : Array[Array[Int32]],
) -> ResourcePlan {
  let live = effects.map(_ => Set([]))
  let predecessors = effects.map(_ => Set([]))
  for source, next in successors {
    for target in next {
      predecessors[target].add(source)
    }
  }
  let pending = effects.mapi((id, _) => id)
  let queued = Set(pending)
  while pending.pop() is Some(label) {
    queued.remove(label)
    let after = successors[label].fold(init=Set([]), (set, target) => {
      resource_union(set, live[target])
    })
    let before = effects[label].before(after)
    if before != live[label] {
      live[label] = before
      for source in predecessors[label] {
        if !queued.contains(source) {
          queued.add(source)
          pending.push(source)
        }
      }
    }
  }
  let plan = { catalog, helpers, effects, accesses, successors, live, }
  guard! plan.valid()
  plan
}

///|
/// Check the fixed-point equations independently of worklist scheduling.
fn ResourcePlan::valid(self : ResourcePlan) -> Bool {
  self.effects
  .mapi((label, effect) => {
    let after = self.successors[label].fold(init=Set([]), (set, target) => {
      resource_union(set, self.live[target])
    })
    effect.before(after) == self.live[label]
  })
  .all(ok => ok)
}

///|
/// Regions start with a clean frame. Internal edges accumulate may-writes;
/// incoming edges from other regions reload their values and start clean.
/// Helper writes remain conservative here even when a reload has synchronized
/// them. This never assumes that a possibly modified value is clean.
fn ResourcePlan::written_before(
  self : ResourcePlan,
  members : Array[Int32],
) -> Map[Int32, Set[Int32]] {
  let before : Map[Int32, Set[Int32]] = Map([])
  for label in members {
    before[label] = Set([])
  }
  let pending = members.copy()
  let queued = Set(members)
  while pending.pop() is Some(label) {
    queued.remove(label)
    let after = resource_union(before[label], self.effects[label].writes)
    for target in self.successors[label] {
      if before.get(target) is Some(old) {
        let next = resource_union(old, after)
        if next != old {
          before[target] = next
          if !queued.contains(target) {
            queued.add(target)
            pending.push(target)
          }
        }
      }
    }
  }
  guard! self.valid_writes(members, before)
  before
}

///|
fn ResourcePlan::valid_writes(
  self : ResourcePlan,
  members : Array[Int32],
  before : Map[Int32, Set[Int32]],
) -> Bool {
  let region = Set(members)
  for label in members {
    guard before.get(label) is Some(incoming) else { return false }
    let after = resource_union(incoming, self.effects[label].writes)
    for target in self.successors[label] {
      if region.contains(target) {
        guard before.get(target) is Some(next) else { return false }
        if after.iter().any(id => !next.contains(id)) {
          return false
        }
      }
    }
  }
  true
}

///|
fn Emitter::analyze_resources(self : Emitter) -> ResourcePlan? {
  let catalog = ResourceCatalog::new(self.context_storage().map(pair => pair.0))
  let analyzer = ResourceAnalyzer::{
    catalog,
    helpers: Map([]),
    direct: Set([]),
    access_count: 0,
    supported: true,
  }
  // These bodies and the final emitted helpers have the same lowering owner.
  // User actions and lexer callbacks never receive the private parser frame.
  let items = self.shared_helpers()
  for item in items {
    guard! item.declaration is Function(function)
    // Access paths below are relative to this exact frame binding. A new
    // helper ABI must be modeled before it can participate in promotion.
    guard function.parameters
      is [Positional("_env", Some(Constr(pkg=None, "YYContext", [])))] else {
      return None
    }
    let effect = analyzer.block(function.body)
    analyzer.helpers[function.name] = { ..effect, exits: false, }
  }
  let accesses = []
  let effects = self.program.blocks.mapi((label, _) => {
    analyzer.direct.clear()
    let effect = analyzer.block(
      self.block_body(label, self.control.transfers(label), true),
    )
    accesses.push(analyzer.direct.copy())
    effect
  })
  if !analyzer.supported {
    return None
  }
  Some(
    ResourcePlan::solve(
      catalog,
      analyzer.helpers,
      effects,
      accesses,
      self.program.blocks.map(block => block.terminator.successors()),
    ),
  )
}
