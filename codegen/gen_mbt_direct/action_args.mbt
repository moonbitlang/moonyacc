///|
fn value_uses(
  block : @direct_ir.Block,
  uses_before : (Int32) -> Bool,
) -> Map[Int32, Int32] {
  let uses : Map[Int32, Int32] = Map([])
  fn use_(v : @direct_ir.Value) {
    if v is Reg(r) {
      uses[r.id] = uses.get(r.id).unwrap_or(0) + 1
    }
  }
  fn edge(e : @direct_ir.Edge) {
    for v in e.arguments {
      use_(v)
    }
  }
  for instruction in block.instructions {
    match instruction {
      Bind(pairs) =>
        for (_, v) in pairs {
          use_(v)
        }
      Push(_, values) | SaveErrorSnapshot(values) =>
        for v in values {
          use_(v)
        }
      Action(id, args, last, _) => {
        for arg in args {
          use_(arg.value)
          use_(arg.start)
          use_(arg.end)
        }
        if uses_before(id) {
          use_(last)
        }
      }
      _ => ()
    }
  }
  match block.terminator {
    Jump(e) => edge(e)
    CaseToken(arms, fallback) => {
      for (_, e) in arms {
        edge(e)
      }
      edge(fallback)
    }
    CaseState(v, arms) => {
      use_(v)
      for (_, e) in arms {
        edge(e)
      }
    }
    Return(_, v) => use_(v)
    Stop(_) | Unreachable => ()
  }
  uses
}

///|
fn unused_previous_positions(
  block : @direct_ir.Block,
  uses_before : (Int32) -> Bool,
) -> Set[Int32] {
  let uses = value_uses(block, uses_before)
  let unused = Set([])
  for instruction in block.instructions {
    if instruction is ReadPreviousPosition(_, reg) && !uses.contains(reg.id) {
      unused.add(reg.id)
    }
  }
  unused
}

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
      @mbt_ast.Stmt::Eval(call)
    } else {
      self.bind_register(result, call)
    },
  ]
}
