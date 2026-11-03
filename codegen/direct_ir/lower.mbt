///|
/// Lower only the resolved LR automaton. Keep allocation and construction phases
/// explicit: reductions and gotos must have labels before any state targets them.
pub fn lower(
  grammar : @grm.Grammar,
  automaton : @lr1.Automaton,
  meta : @codegen.MetaProvider,
  mode~ : @codegen.Mode,
) -> Program {
  let lowering = Lowering::new(grammar, automaton, meta, mode)
  lowering.reserve_reductions()
  lowering.lower_gotos()
  lowering.lower_reductions()
  lowering.lower_states()
  lowering.program
}
