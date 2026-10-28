///|
fn Emitter::bindings(
  self : Emitter,
  depth : Int32,
  cell : @direct_ir.Cell,
  registers : Array[@direct_ir.Register?],
) -> Array[@mbt_ast.Stmt] {
  let statements = []
  let wanted : Array[(@direct_ir.Field, @direct_ir.Register)] = []
  for i, reg in registers {
    if reg is Some(reg) && !self.erased_register(reg) {
      if cell.fields[i] is State {
        statements.push(self.bind_register(reg, self.state_at(depth)))
      } else {
        wanted.push((cell.fields[i], reg))
      }
    }
  }
  guard cell.symbol is Some(symbol) else { return statements }
  let fields = wanted.map(p => p.0)
  let arms : Array[(@mbt_ast.Pattern, @mbt_ast.Block)] = []
  for layout in self.cells {
    if layout.symbol != symbol ||
      (fields.contains(Semantic) && !layout.has_value) ||
      (fields.contains(Start) && !layout.start) ||
      (fields.contains(End) && !layout.end) {
      continue
    }
    let pattern = layout.pattern(
      Any,
      Any,
      if fields.contains(Semantic) {
        Bind("_value")
      } else {
        Any
      },
      if fields.contains(Start) {
        Bind("_start")
      } else {
        Any
      },
      if fields.contains(End) {
        Bind("_end")
      } else {
        Any
      },
    )
    let values = fields.map(field => {
      @mbt_ast.Expr::Ident(
        match field {
          Semantic => "_value"
          Start => "_start"
          End => "_end"
          State => abort("unexpected state field")
        },
      )
    })
    let result : @mbt_ast.Expr = match values {
      [] => Unit
      [single] => single
      _ => Tuple(values)
    }
    arms.push((pattern, value_block(result)))
  }
  arms.push((Any, value_block(call("panic", []))))
  let read : @mbt_ast.Expr = Match(self.stack_at(depth), arms)
  match wanted {
    [] => statements.push(Eval(read))
    [(_, reg)] => statements.push(self.bind_register(reg, read))
    _ => {
      statements.push(
        Let(
          Tuple(wanted.map(p => @mbt_ast.Pattern::Bind("_yy_read\{p.1.id}"))),
          None,
          read,
        ),
      )
      for (_, reg) in wanted {
        statements.push(self.bind_register(reg, Ident("_yy_read\{reg.id}")))
      }
    }
  }
  statements
}

///|
fn Emitter::pop_one(self : Emitter) -> Array[@mbt_ast.Stmt] {
  [
    binding("_yy_tail", self.stack_call("tail", [self.machine("stack")])),
    Assign(
      self.machine("state"),
      self.stack_call("saved", [self.machine("stack")]),
    ),
    Assign(self.machine("stack"), Ident("_yy_tail")),
  ]
}
