///|
fn ResourcePlan::access_count(
  self : ResourcePlan,
  block : @mbt_ast.Block,
) -> Int32 {
  let analyzer = ResourceAnalyzer::{
    catalog: self.catalog,
    helpers: self.helpers,
    direct: Set([]),
    access_count: 0,
    supported: true,
  }
  ignore(analyzer.block(block))
  guard! analyzer.supported
  analyzer.access_count
}

///|
/// Promotion is a placement choice, not a correctness requirement. Charge the
/// actual region's declarations, helper synchronization and live-out stores.
/// Retain a scalar only if frame accesses decrease without increasing emitted
/// AST work. A fixed order bounds the search; no grammar or profile is queried.
fn Emitter::select_resources(self : Emitter) -> Emitter {
  guard self.resources is Some(plan) && self.shared_context else { return self }
  let scopes = self.control.regions.mapi((region, _) => {
    let available = self.regional_resources(region)
    let mut scope = { ..available, used: Set([]), }
    let original = self.render_region(region, true, scope)
    let mut cost = emission_cost(original)
    let mut accesses = plan.access_count(original)
    let ids = available.used.to_array()
    ids.sort()
    for id in ids {
      let selected = scope.used.copy()
      selected.add(id)
      let candidate = { ..scope, used: selected, }
      let code = self.render_region(region, true, candidate)
      let next_cost = emission_cost(code)
      if next_cost > cost {
        continue
      }
      let next_accesses = plan.access_count(code)
      if next_accesses < accesses {
        scope = candidate
        cost = next_cost
        accesses = next_accesses
      }
    }
    scope
  })
  { ..self, resource_regions: scopes, }
}
