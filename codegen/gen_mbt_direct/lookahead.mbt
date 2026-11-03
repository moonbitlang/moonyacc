///|
/// A representation of the IR's lookahead resource, shared by every input mode
/// and grammar. Ready distinguishes an empty cache from cached end-of-input.
fn Emitter::lookahead_storage(
  self : Emitter,
) -> Array[(@mbt_ast.Field, @mbt_ast.Expr)] {
  let fields : Array[(@mbt_ast.Field, @mbt_ast.Expr)] = [
    (
      { name: "_yy_token_token", type_: Option(type_("Token")), mutable: true, },
      Ident("None"),
    ),
  ]
  if self.cache_ready {
    fields.push(
      (
        { name: "_yy_token_ready", type_: type_("Bool"), mutable: true, },
        Bool(false),
      ),
    )
  }
  if self.cache_json {
    fields.push(
      (
        { name: "_yy_token_value", type_: type_("Json"), mutable: true, },
        call("Json::null", []),
      ),
    )
  }
  if self.support.tracks_positions() {
    let slot = value_slot(Position, self.meta.position_data_type)
    for name in ["start", "end"] {
      fields.push(
        (
          { name: "_yy_token_" + name, type_: slot.type_, mutable: true, },
          slot.initial,
        ),
      )
    }
  }
  fields
}

///|
fn Emitter::cached(self : Emitter, name : String) -> @mbt_ast.Expr {
  let value = self.machine("_yy_token_" + name)
  if (name == "start" || name == "end") &&
    value_slot(Position, self.meta.position_data_type).optional {
    dot_call(value, "unwrap", [])
  } else {
    value
  }
}

///|
fn Emitter::cached_position(
  self : Emitter,
  end~ : Bool = false,
) -> @mbt_ast.Expr {
  if !self.support.tracks_positions() {
    return Unit
  }
  self.cached(if end { "end" } else { "start" })
}

///|
/// Captured values are initialized before Ready becomes true. Unknown position
/// types use the same checked unwritten-slot representation as typed registers.
fn Emitter::cache(
  self : Emitter,
  token : @mbt_ast.Expr,
  value : @mbt_ast.Expr,
  start : @mbt_ast.Expr,
  end : @mbt_ast.Expr,
) -> Array[@mbt_ast.Stmt] {
  let statements : Array[@mbt_ast.Stmt] = [
    Assign(self.machine("_yy_token_token"), token),
  ]
  if self.cache_json {
    statements.push(Assign(self.machine("_yy_token_value"), value))
  }
  if self.support.tracks_positions() {
    let slot = value_slot(Position, self.meta.position_data_type)
    for (name, value) in [("start", start), ("end", end)] {
      statements.push(
        Assign(
          self.machine("_yy_token_" + name),
          if slot.optional {
            call("Some", [value])
          } else {
            value
          },
        ),
      )
    }
  }
  if self.cache_ready {
    statements.push(Assign(self.machine("_yy_token_ready"), Bool(true)))
  }
  statements
}

///|
/// Consume also releases cached references. Values captured by token patterns retain
/// their own lifetime; stale payloads never survive merely because Ready=false.
fn Emitter::consume_lookahead(self : Emitter) -> Array[@mbt_ast.Stmt] {
  let statements : Array[@mbt_ast.Stmt] = []
  if self.input_mode is Array && self.support.tracks_positions() {
    statements.push(
      Assign(self.machine("last_pos"), self.cached_position(end=true)),
    )
  }
  for (field, initial) in self.lookahead_storage() {
    statements.push(Assign(self.machine(field.name), initial))
  }
  statements
}
