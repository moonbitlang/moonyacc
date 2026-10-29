///|
fn Emitter::block_body(
  self : Emitter,
  label : Int32,
  routes : Map[Int32, @control_flow.Transfer],
  no_comments : Bool,
) -> @mbt_ast.Block {
  let block = self.program.blocks[label]
  let statements : Array[@mbt_ast.Stmt] = []
  if !no_comments {
    let comment = match block.origin {
      Run(state) => Some("run state \{state}")
      Reduce(production) => {
        let action = self.program.actions[production]
        let rhs = action.rhs
          .map(id => " \{self.program.symbols[id].name}")
          .join("")
        Some("reduce \{self.program.symbols[action.lhs].name} ->\{rhs}")
      }
      Goto(symbol) => Some("goto \{self.program.symbols[symbol].name}")
      Helper => None
    }
    if comment is Some(comment) {
      statements.push(Comment(comment))
    }
  }
  let (code, checkpoint) = self.block_instructions(
    block,
    self.checkpoints.entry(label),
  )
  statements.append(code)
  let finish = self.terminator(block.terminator, routes, checkpoint)
  statements.append(finish.statements)
  { statements, result: finish.result, }
}

///|
/// Every inter-region edge returns to this driver. The number of parser calls
/// on the host stack is independent of input length and LR-stack depth.
fn Emitter::region_dispatch(self : Emitter) -> @mbt_ast.Stmt {
  let arms = self.control.regions.mapi((index, _) => {
    (
      @mbt_ast.Pattern::Int(index),
      value_block(call("_yy_region_\{index}", [Ident("_env"), Ident("pc")])),
    )
  })
  arms.push((Any, value_block(call("panic", []))))
  For(
    [("pc", Ident("_entry"))],
    None,
    [],
    body([
      binding(
        "next",
        Match(Binary(Divide, Ident("pc"), Int(self.control.stride)), arms),
      ),
      Eval(
        If(
          Binary(Less, Ident("next"), Int(0)),
          body([Return(dot_call(self.machine("_yy_result"), "unwrap", []))]),
          None,
        ),
      ),
      Continue([Ident("next")]),
    ]),
  )
}

///|
fn Emitter::region_body(
  self : Emitter,
  region : Int32,
  no_comments : Bool,
) -> @mbt_ast.Block {
  let control = self.control.regions[region].control
  let statements = []
  let scoped = if self.shared_context {
    let slots = self.regional_slots(region)
    statements.append(self.region_locals(slots))
    { ..self, local_slots: slots.used, }
  } else {
    self
  }
  if control.uses_dispatch() {
    statements.push(
      @mbt_ast.Stmt::LetMut("_yy_control", Some(type_("Int")), Int(0)),
    )
  }
  let code = scoped.structured(control, no_comments)
  statements.append(code.statements)
  { statements, result: code.result, }
}

///|
fn Emitter::region_item(
  self : Emitter,
  region : Int32,
  no_comments : Bool,
) -> @mbt_ast.Item {
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "_yy_region_\{region}",
        [typed("_env", type_("YYContext")), typed("_entry", type_("Int"))],
        self.region_body(region, no_comments),
        result=type_("Int"),
        effect=if self.region_errors.contains(region) {
          Raises(type_("ParseError"))
        } else {
          Default
        },
      ),
    ),
    attributes=[{ name: "inline", arguments: [Positional(Ident("never"))], }],
  )
}
