///|
pub(all) enum ActionCalls {
  Indirect
  Direct
}

///|
/// A subaction needs the caller's anchor only when its slice starts at zero.
/// Later slices obtain their anchor from the preceding RHS item instead.
fn before_rhs_actions(actions : Iter[@elab.Action]) -> Set[@stamp.Stamp] {
  let memo : Map[@stamp.Stamp, Bool] = Map([])
  let needed = Set([])
  fn visit(action : @elab.Action) -> Bool {
    if memo.get(action.stamp) is Some(result) {
      return result
    }
    let own = match action.body {
      JsonCst(_) =>
        action.span.0.uses_before_rhs() || action.span.1.uses_before_rhs()
      _ =>
        action.bindings.any(binding => {
          match binding.0 {
            Position(position) => position.uses_before_rhs()
            _ => false
          }
        })
    }
    let result = own ||
      action.sub_actions.any(sub => sub.start == 0 && visit(sub.action))
    memo[action.stamp] = result
    if result {
      needed.add(action.stamp)
    }
    result
  }
  for action in actions {
    ignore(visit(action))
  }
  needed
}

///|
pub fn Context::action_uses_before_rhs(
  self : Context,
  action : @elab.Action,
) -> Bool {
  match self.action_calls {
    Indirect => self.pass_before_rhs
    Direct => self.before_rhs_actions.contains(action.stamp)
  }
}

///|
pub fn Context::action_call(
  self : Context,
  action : @elab.Action,
  before : @mbt_ast.Expr,
  args : @mbt_ast.Expr,
) -> @mbt_ast.Expr {
  call(
    "yy_action_\{self.action_id(action)}",
    if self.action_uses_before_rhs(action) {
      [before, args]
    } else {
      [args]
    },
  )
}
