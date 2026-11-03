///|
pub(all) enum ActionCalls {
  Indirect
  Direct
}

///|
pub fn Context::action_uses_before_rhs(
  self : Context,
  action : @elab.Action,
) -> Bool {
  match self.action_calls {
    Indirect => self.pass_before_rhs
    Direct => self.typed_actions[action.stamp].contains(Position(BeforeRhs))
  }
}

///|
fn Context::action_call(
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
