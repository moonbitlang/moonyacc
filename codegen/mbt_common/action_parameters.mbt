///|
fn parameter_base_name(parameter : @elab.ActionInput) -> String {
  match parameter {
    Value(index, _) => "_value_\{index}"
    Position(BeforeRhs) => "_before_rhs"
    Position(StartOf(index)) => "_start_\{index}"
    Position(EndOf(index)) => "_end_\{index}"
    Position(FirstNonEmpty(_)) => abort("non-atomic action parameter")
  }
}

///|
fn action_parameter_plans(
  actions : Iter[@elab.Action],
  tracks_positions : Bool,
) -> Map[@stamp.Stamp, ActionPlan] {
  let plans : Map[@stamp.Stamp, ActionPlan] = Map([])
  for action in actions {
    plans[action.stamp] = ActionPlan::new(
      action,
      action.inputs(tracks_positions~),
    )
  }
  plans
}

///|
pub fn Context::action_parameters(
  self : Context,
  action : @elab.Action,
) -> Array[@elab.ActionInput] {
  self.typed_actions[action.stamp].parameters.map(pair => pair.0)
}

///|
pub fn Context::typed_action_call(
  self : Context,
  action : @elab.Action,
  argument : (@elab.ActionInput) -> @mbt_ast.Expr,
) -> @mbt_ast.Expr {
  call(
    "yy_action_\{self.action_id(action)}",
    self.action_parameters(action).map(argument),
  )
}
