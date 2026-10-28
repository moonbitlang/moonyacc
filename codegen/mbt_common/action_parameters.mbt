///|
/// Inputs of a semantic action, derived from the elaborated binding subjects.
/// Positions here are leaves of PositionExpr, never a second position model.
pub(all) enum ActionParameter {
  Value(Int32, @elab.TypeExpr)
  Position(@elab.PositionExpr)
} derive(Eq)

///|
pub extend ActionParameter with Eq::{equal, not_equal}

///|
fn ActionParameter::rebase(
  self : ActionParameter,
  offset : Int32,
) -> ActionParameter {
  match self {
    Value(index, type_) => Value(index + offset, type_)
    Position(position) => Position(position.rebase(offset))
  }
}

///|
fn ActionParameter::name(self : ActionParameter) -> String {
  match self {
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
  fn visit(action : @elab.Action) -> ActionPlan {
    if plans.get(action.stamp) is Some(parameters) {
      return parameters
    }
    let parameters : Array[ActionParameter] = []
    fn add(parameter : ActionParameter) {
      match parameter {
        Value(_, Constr(pkg=None, "Unit", [])) => return
        Position(_) if !tracks_positions => return
        Value(index, type_) => {
          guard! index >= 0 && index < action.arity
          for previous in parameters {
            if previous is Value(other, previous_type) && other == index {
              guard! previous_type == type_
            }
          }
        }
        Position(StartOf(index) | EndOf(index)) => {
          guard! index >= 0 && index < action.arity
        }
        _ => ()
      }
      if !parameters.contains(parameter) {
        parameters.push(parameter)
      }
    }
    fn position(position : @elab.PositionExpr) {
      for atom in position.inputs() {
        add(Position(atom))
      }
    }
    for sub in action.sub_actions {
      for (parameter, _) in visit(sub.action).parameters {
        add(parameter.rebase(sub.start))
      }
    }
    match action.body {
      JsonCst(_) => {
        for index in 0..<action.arity {
          add(Value(index, named_type("Json", [])))
        }
        position(action.span.0)
        position(action.span.1)
      }
      _ =>
        for (subject, _) in action.bindings {
          match subject {
            Data(index, type_~) => add(Value(index, type_))
            Position(expr) => position(expr)
            SubAction(_) => ()
          }
        }
    }
    let plan = ActionPlan::new(action, parameters)
    plans[action.stamp] = plan
    plan
  }
  for action in actions {
    ignore(visit(action))
  }
  plans
}

///|
pub fn Context::action_parameters(
  self : Context,
  action : @elab.Action,
) -> Array[ActionParameter] {
  self.typed_actions[action.stamp].parameters.map(pair => pair.0)
}

///|
pub fn Context::typed_action_call(
  self : Context,
  action : @elab.Action,
  argument : (ActionParameter) -> @mbt_ast.Expr,
) -> @mbt_ast.Expr {
  call(
    "yy_action_\{self.action_id(action)}",
    self.action_parameters(action).map(argument),
  )
}
