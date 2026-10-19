///|
/// Select both the pushed LR state and the emitted PC before mutating either
/// stack. The missing-state arm still panics before the common push.
fn Emitter::goto_selection(
  self : Emitter,
  plan : GotoPlan,
) -> (@mbt_ast.Stmt, @mbt_ast.Expr, @mbt_ast.Expr) {
  let groups = grouped_cases(plan.choices, (a, b) => a == b)
  if groups is [(pattern, target)] {
    return (
      Eval(
        Match(self.value(plan.selector), [
          (pattern, value_block(Unit)),
          (Any, value_block(call("panic", []))),
        ]),
      ),
      self.value(target.state),
      Int(self.layout.pc(target.label)),
    )
  }
  let choices = groups.map(p => {
    (
      p.0,
      value_block(
        @mbt_ast.Expr::Tuple([
          self.value(p.1.state),
          Int(self.layout.pc(p.1.label)),
        ]),
      ),
    )
  })
  choices.push((Any, value_block(call("panic", []))))
  (
    Let(
      Tuple([Bind("_yy_state"), Bind("_yy_target")]),
      None,
      Match(self.value(plan.selector), choices),
    ),
    Ident("_yy_state"),
    Ident("_yy_target"),
  )
}

///|
fn Emitter::goto_finish(
  self : Emitter,
  plan : GotoPlan,
  chunk : Int,
) -> @mbt_ast.Block {
  let (selection, state, target) = self.goto_selection(plan)
  let statements = [selection]
  statements.append(
    self.push_values(
      state,
      self.value(plan.data.0),
      self.value(plan.data.1),
      self.value(plan.data.2),
    ),
  )
  let finish = self.transfer(target, plan.choices.map(p => p.1.label), chunk)
  statements.append(finish.statements)
  { statements, result: finish.result, }
}
