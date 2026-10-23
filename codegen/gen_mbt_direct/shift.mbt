///|
/// Fold the canonical shift sequence only when no extracted value escapes it.
/// The IR still checks the token guard; the helper operates on its boxed payload.
fn shift_target(block : @direct_ir.Block) -> Int32? {
  guard block.terminator is Jump(edge) && edge.arguments.is_empty() else {
    None
  }
  match block.instructions {
    [
      Input(token, value, sp, ep),
      Push(cell, [State(target), Reg(v), Reg(s), Reg(e)]),
      ConsumeLookahead,
      SaveErrorSnapshot,
    ] =>
      if cell.symbol == Some(token) &&
        cell.fields == [State, Semantic, Start, End] &&
        value == v &&
        sp == s &&
        ep == e {
        Some(target)
      } else {
        None
      }
    _ => None
  }
}

///|
fn Emitter::shift_item(self : Emitter) -> @mbt_ast.Item {
  let statements : Array[@mbt_ast.Stmt] = [
    binding(
      "data",
      component(dot_call(self.machine("lookahead"), "unwrap", []), 1),
    ),
    Assign(
      self.machine("states"),
      call("@list.cons", [Ident("state"), self.machine("states")]),
    ),
    Eval(dot_call(self.machine("data"), "push", [Ident("data")])),
  ]
  if self.input_mode is Array && self.support.tracks_positions() {
    statements.push(
      Assign(
        self.machine("last_pos"),
        self.support.data_position(Ident("data"), 2),
      ),
    )
  }
  statements.append([
    Assign(self.machine("lookahead"), Ident("None")),
    Assign(self.machine("error_stack"), self.machine("states")),
  ])
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_shift",
        [typed("_env", type_("YYContext")), typed("state", type_("Int"))],
        body(statements),
        result=type_("Unit"),
      ),
    ),
    attributes=[{ name: "inline", arguments: [Positional(Ident("never"))], }],
  )
}
