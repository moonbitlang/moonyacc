///|
fn Emitter::action_call(
  self : Emitter,
  id : Int32,
  args : Array[@direct_ir.ActionArgument],
  before : @direct_ir.Value,
) -> @mbt_ast.Expr {
  let action = (self.meta.production_meta)(id).action
  guard! action.arity == args.length()
  guard! action.type_ ==
    self.program.symbols[self.program.actions[id].lhs].type_
  self.support.typed_action_call(action, parameter => {
    match parameter {
      Value(index, type_) => {
        guard! self.program.symbols[self.program.actions[id].rhs[index]].type_ ==
          type_
        self.value(args[index].value)
      }
      Position(BeforeRhs) => self.value(before)
      Position(StartOf(index)) => self.value(args[index].start)
      Position(EndOf(index)) => self.value(args[index].end)
      Position(FirstNonEmpty(_)) => abort("non-atomic action input")
    }
  })
}

///|
fn Emitter::action_binding(
  self : Emitter,
  id : Int32,
  args : Array[@direct_ir.ActionArgument],
  before : @direct_ir.Value,
  result : @direct_ir.Register,
) -> Array[@mbt_ast.Stmt] {
  let call = self.action_call(id, args, before)
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
