///|
/// Fold the canonical shift sequence only when no extracted value escapes it.
/// The IR still checks the token guard; the helper operates on its boxed payload.
fn shift_target(block : @direct_ir.Block) -> Int? {
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
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_shift",
        [typed("_env", type_("YYContext")), typed("state", type_("Int"))],
        body([
          binding(
            "data",
            component(dot_call(self.machine("lookahead"), "unwrap", []), 1),
          ),
          Assign(
            self.machine("states"),
            call("@list.cons", [Ident("state"), self.machine("states")]),
          ),
          Eval(dot_call(self.machine("data"), "push", [Ident("data")])),
          Assign(self.machine("last_pos"), component(Ident("data"), 2)),
          Assign(self.machine("lookahead"), Ident("None")),
          Assign(self.machine("error_stack"), self.machine("states")),
        ]),
        result=type_("Unit"),
      ),
    ),
    attributes=[{ name: "inline", arguments: [Positional(Ident("never"))], }],
  )
}
