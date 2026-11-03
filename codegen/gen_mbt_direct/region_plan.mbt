///|
/// Competing region cuts share one global analysis and the same storage facts.
/// A more aggressive grouping must improve control transfers and must not
/// increase the actual emitted AST; it never receives guessed LR facts.
fn Emitter::choose_partitions(
  self : Emitter,
  prepared : @direct_ir.PreparedProgram,
  analysis : @control_flow.Analysis,
) -> Emitter {
  let mut current = self
  let policies = if self.locality {
    [@control_flow.WholeLoops, Joins, FixedSuccessors]
  } else {
    [@control_flow.WholeLoops]
  }
  for partitioning in policies {
    let control = analysis.plan(costs=self.block_estimates, partitioning~) catch {
      InvalidControl(message) => abort(message)
    }
    let before = current.control.transfer_cost()
    let after = control.transfer_cost()
    if !after.no_worse_than(before) || !improved_transfers(before, after) {
      continue
    }
    let candidate = Emitter::{
      ..Emitter::with_plan(
        prepared,
        self.meta,
        self.support,
        self.input_mode,
        control,
        optimize_resources=self.optimize_resources,
      ),
      block_estimates: self.block_estimates,
      resources: self.resources,
      locality: self.locality,
    }.select_resources()
    if candidate.structured_cost() <= current.structured_cost() {
      current = candidate
    }
  }
  current
}
