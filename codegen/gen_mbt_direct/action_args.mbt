///|
fn Emitter::action_call(
  self : Emitter,
  id : Int32,
  inputs : Array[@direct_ir.Value],
) -> @mbt_ast.Expr {
  let action = (self.meta.production_meta)(id).action
  let signature = self.program.actions[id]
  guard! action.arity == signature.rhs.length()
  guard! action.type_ == self.program.symbols[signature.lhs].type_
  guard! inputs.length() == signature.inputs.length()
  self.support.typed_action_call(action, parameter => {
    self.value(inputs[signature.inputs.search(parameter).unwrap()])
  })
}

///|
fn Emitter::action_binding(
  self : Emitter,
  id : Int32,
  inputs : Array[@direct_ir.Value],
  result : @direct_ir.Register,
) -> Array[@mbt_ast.Stmt] {
  let call = self.action_call(id, inputs)
  [
    if self.erased_register(result) {
      @mbt_ast.Stmt::Eval(
        @mbt_ast.Expr::Call(Ident("ignore"), [Positional(call)]),
      )
    } else {
      self.bind_register(result, call)
    },
  ]
}
