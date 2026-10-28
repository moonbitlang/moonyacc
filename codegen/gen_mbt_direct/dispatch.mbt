///|
fn Emitter::block_body(
  self : Emitter,
  pc : Int32,
  no_comments : Bool,
) -> @mbt_ast.Block {
  let label = self.layout.blocks[pc]
  let block = self.program.blocks[label]
  let statements : Array[@mbt_ast.Stmt] = []
  if !no_comments {
    let comment = match block.origin {
      Run(state) => Some("run state \{state}")
      Shift(state, token) =>
        Some("shift \{self.program.symbols[token].name} into state \{state}")
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
  statements.append(self.block_instructions(block))
  let chunk = pc / BLOCKS_PER_CHUNK
  let finish = match self.gotos.get(label) {
    Some(plan) => self.goto_finish(plan, chunk)
    None => self.terminator(block.terminator, chunk)
  }
  statements.append(finish.statements)
  { statements, result: finish.result, }
}

///|
fn Emitter::dispatch(
  self : Emitter,
  first : Int32,
  last : Int32,
  pc : @mbt_ast.Expr,
  no_comments : Bool,
) -> @mbt_ast.Expr {
  let arms = []
  for label in first..<last {
    arms.push(
      (@mbt_ast.Pattern::Int(label), self.block_body(label, no_comments)),
    )
  }
  arms.push((Any, value_block(call("panic", []))))
  Match(pc, arms)
}

///|
/// Chunks return a label to this outer loop; they never call each other.
fn Emitter::chunk_dispatch(self : Emitter) -> @mbt_ast.Stmt {
  let arms = []
  for chunk in 0..<self.chunk_count() {
    arms.push(
      (
        @mbt_ast.Pattern::Int(chunk),
        value_block(call("_yy_chunk_\{chunk}", [Ident("_env"), Ident("pc")])),
      ),
    )
  }
  arms.push((Any, value_block(call("panic", []))))
  For(
    [("pc", Ident("entry"))],
    None,
    [],
    body([
      binding(
        "next",
        Match(Binary(Divide, Ident("pc"), Int(BLOCKS_PER_CHUNK)), arms),
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
fn Emitter::chunk_item(
  self : Emitter,
  chunk : Int32,
  no_comments : Bool,
) -> @mbt_ast.Item {
  let first = chunk * BLOCKS_PER_CHUNK
  let last = if first + BLOCKS_PER_CHUNK < self.layout.blocks.length() {
    first + BLOCKS_PER_CHUNK
  } else {
    self.layout.blocks.length()
  }
  let chunk_body = if self.chunk_loops.contains(chunk) {
    body([
      For(
        [("pc", Ident("_entry"))],
        None,
        [],
        value_block(self.dispatch(first, last, Ident("pc"), no_comments)),
      ),
    ])
  } else {
    value_block(self.dispatch(first, last, Ident("_entry"), no_comments))
  }
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "_yy_chunk_\{chunk}",
        [typed("_env", type_("YYContext")), typed("_entry", type_("Int"))],
        chunk_body,
        result=type_("Int"),
        effect=if self.chunk_errors.contains(chunk) {
          Raises(type_("ParseError"))
        } else {
          Default
        },
      ),
    ),
    attributes=[{ name: "inline", arguments: [Positional(Ident("never"))], }],
  )
}
