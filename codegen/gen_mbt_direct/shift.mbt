///|
/// Fold the canonical shift sequence only when no extracted value escapes it.
/// The IR checks the token guard; the helper decodes the cached token payload.
fn shift_target(block : @direct_ir.Block) -> Int32? {
  guard block.terminator is Jump(edge) && edge.arguments.is_empty() else {
    None
  }
  match block.instructions {
    [
      Input(token, value, sp, ep),
      Push(cell, [State(target), Reg(v), Reg(s), Reg(e)]),
      ConsumeLookahead,
      SaveErrorSnapshot([]),
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
  let used = Set([])
  for block in self.program.blocks {
    if shift_target(block) is Some(_) &&
      block.instructions[0] is Input(symbol, _, _, _) {
      used.add(symbol)
    }
  }
  let arms = []
  for symbol in 1..<=self.program.terminal_count {
    if !used.contains(symbol) {
      continue
    }
    let value = if self.support.is_json_cst() {
      self.cached("value")
    } else if is_unit(self.program.symbols[symbol].type_) {
      @mbt_ast.Expr::Unit
    } else {
      Ident("_value")
    }
    let cell : @direct_ir.Cell = {
      symbol: Some(symbol),
      fields: [State, Semantic, Start, End],
    }
    arms.push(
      (
        self.token_pattern(
          symbol,
          if self.support.is_json_cst() {
            Any
          } else {
            Bind("_value")
          },
        ),
        body(
          self.push_values(
            cell,
            Ident("target"),
            value,
            self.cached_position(),
            self.cached_position(end=true),
          ),
        ),
      ),
    )
  }
  if arms.length() < self.program.terminal_count {
    arms.push((Any, value_block(call("panic", []))))
  }
  let statements : Array[@mbt_ast.Stmt] = [
    Eval(Match(dot_call(self.cached("token"), "unwrap", []), arms)),
  ]
  if self.input_mode is Array && self.support.tracks_positions() {
    statements.push(
      Assign(self.machine("last_pos"), self.cached_position(end=true)),
    )
  }
  statements.push(Assign(self.machine("lookahead"), Ident("None")))
  statements.append(self.save_snapshot([]))
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_shift",
        [typed("_env", type_("YYContext")), typed("target", type_("Int"))],
        body(statements),
        result=type_("Unit"),
      ),
    ),
    attributes=[{ name: "inline", arguments: [Positional(Ident("never"))], }],
  )
}
