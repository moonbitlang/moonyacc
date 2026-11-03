///|
// Full target trials include fixed-point proofs and emission. This bound is
// separate from inexpensive IR discovery and never truncates a candidate.
const STATE_LAYOUT_TRIALS = 8

///|
/// The IR owns complete, checked versions; this target owns admission. Every
/// trial starts from the same source and reruns common cleanup, stack/storage
/// proofs and structured lowering. Rejecting it changes neither the accepted
/// selection nor its remaining growth budget.
fn specialize_emitter(
  source : @direct_ir.Program,
  knowledge : @direct_ir.StackKnowledge,
  meta : @codegen.MetaProvider,
  support : @mbt_common.Context,
  input_mode : @codegen.InputMode,
) -> Emitter raise @direct_ir.InvalidProgram {
  let source = source.simplify()
  let plan = source.state_specializations(knowledge)
  fn emit(selected : Array[Int32]) -> Emitter raise @direct_ir.InvalidProgram {
    let prepared = plan.prepare(
      selected,
      knowledge,
      positions=support.tracks_positions(),
    )
    let emitter = Emitter::new(
      prepared,
      meta,
      support,
      input_mode,
      optimize_resources=true,
      locality=true,
    )
    // Assess specialization together with its immediate layout repairs. A
    // small trial bound avoids a nested unbounded target search; the selected
    // program can spend the remaining normal repair budget below.
    repair_layout(emitter, knowledge, max_trials=2)
  }
  let mut selected : Array[Int32] = []
  let mut current = emit(selected)
  let mut cost = current.specialization_cost(0)
  // State specialization deliberately trades code for fewer LR decisions.
  // Give these clones their own emitted-code allowance; the smaller 1/8
  // allowance in repair_layout is only for administrative continuation copies.
  let limit = cost.size + cost.size / 2
  let pending = [plan.candidates()]
  let rejected : Array[Array[Int32]] = []
  let mut trials = 0
  while pending.pop() is Some(batch) && trials < STATE_LAYOUT_TRIALS {
    let proposal = plan.within_budget([..selected, ..batch])
    if proposal.length() == selected.length() {
      continue
    }
    let key = proposal.copy()
    key.sort()
    if !rejected.any(previous => previous == key) {
      trials += 1
      let candidate = Some(emit(proposal)) catch {
        // A restricted abstract domain can fail to prove a rewritten join.
        // Keep the last proved program, as in continuation layout trials.
        @direct_ir.InvalidProgram(_) => None
      }
      if candidate is Some(candidate) {
        let after = candidate.specialization_cost(plan.savings(proposal))
        if cost.admits(after, limit) {
          current = candidate
          selected = proposal
          cost = after
          continue
        }
      }
      rejected.push(key)
    }
    // Credited costs only decrease and the size limit is fixed. A rejected
    // selection cannot become admissible later; split it without re-emitting.
    let tried = batch.filter(id => proposal.contains(id))
    let skipped = batch.filter(id => !proposal.contains(id))
    if !skipped.is_empty() {
      pending.push(skipped)
    }
    if tried.length() > 1 {
      let middle = tried.length() / 2
      pending.push(tried[middle:].to_owned())
      pending.push(tried[:middle].to_owned())
    }
  }
  repair_layout(current, knowledge)
}
