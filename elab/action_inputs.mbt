///|
/// Semantic dependencies of an elaborated action. Both optimizer liveness and
/// target calling conventions consume this description; naming belongs to emission.
pub(all) enum ActionInput {
  Value(Int32, TypeExpr)
  Position(PositionExpr)
} derive(Eq)

///|
#deprecated("Use Eq::equal or Eq::not_equal instead")
#doc(hidden)
pub extend ActionInput with Eq::{equal, not_equal}

///|
pub fn ActionInput::rebase(self : ActionInput, offset : Int32) -> ActionInput {
  match self {
    Value(index, type_) => Value(index + offset, type_)
    Position(expr) => Position(expr.rebase(offset))
  }
}

///|
pub fn Action::inputs(
  self : Action,
  tracks_positions~ : Bool,
) -> Array[ActionInput] {
  let result : Array[ActionInput] = []
  fn add(input : ActionInput) {
    match input {
      Value(_, Constr(pkg=None, "Unit", [])) => return
      Position(_) if !tracks_positions => return
      Value(index, type_) => {
        guard! index >= 0 && index < self.arity
        for previous in result {
          if previous is Value(other, previous_type) && index == other {
            guard! type_ == previous_type
          }
        }
      }
      Position(StartOf(index) | EndOf(index)) => {
        guard! index >= 0 && index < self.arity
      }
      _ => ()
    }
    if !result.contains(input) {
      result.push(input)
    }
  }
  fn position(expr : PositionExpr) {
    for leaf in expr.inputs() {
      add(Position(leaf))
    }
  }
  for sub in self.sub_actions {
    for input in sub.action.inputs(tracks_positions~) {
      add(input.rebase(sub.start))
    }
  }
  match self.body {
    JsonCst(_) => {
      for index in 0..<self.arity {
        add(Value(index, Constr(pkg=None, "Json", [])))
      }
      position(self.span.0)
      position(self.span.1)
    }
    _ =>
      for (subject, _) in self.bindings {
        match subject {
          Data(index, type_~) => add(Value(index, type_))
          Position(expr) => position(expr)
          SubAction(_) => ()
        }
      }
  }
  result
}
