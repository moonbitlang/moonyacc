///|
fn Emitter::context_item(self : Emitter) -> @mbt_ast.Item {
  let fields : Array[@mbt_ast.Field] = [
    { name: "stack", type_: type_("YYStack"), mutable: true, },
    { name: "state", type_: type_("Int"), mutable: true, },
    {
      name: "error_stack",
      type_: type_("YYStack"),
      mutable: self.saves_snapshot,
    },
    { name: "error_state", type_: type_("Int"), mutable: self.saves_snapshot, },
    { name: "lookahead", type_: self.lookahead_type(), mutable: true, },
    { name: "_yy_result", type_: Option(type_("YYResult")), mutable: true, },
  ]
  if self.needs_initial_position {
    fields.push({
      name: "initial_position",
      type_: self.meta.position_data_type,
      mutable: false,
    })
  }
  if self.input_mode is Array && self.support.tracks_positions() {
    fields.push({
      name: "last_pos",
      type_: self.meta.position_data_type,
      mutable: self.consumes_input,
    })
  }
  match self.input_mode {
    Array =>
      fields.append([
        { name: "tokens", type_: self.tokens_type(), mutable: false, },
        { name: "cursor", type_: type_("Int"), mutable: true, },
      ])
    Pull =>
      fields.push({
        name: "read_token",
        type_: Arrow([], self.located_type()),
        mutable: false,
      })
  }
  for kind, count in self.maxima {
    for index in 0..<count {
      fields.push({
        name: self.slot_name(kind, index),
        type_: self.slot_types[kind].type_,
        mutable: true,
      })
    }
  }
  @mbt_ast.item(Struct("YYContext", fields), visibility=Private)
}

///|
fn Emitter::context_binding(self : Emitter) -> @mbt_ast.Stmt {
  let fields : Array[(String, @mbt_ast.Expr)] = [
    ("stack", Ident("YYEmpty")),
    ("state", Ident("initial_state")),
    ("error_stack", Ident("YYEmpty")),
    ("error_state", Ident("initial_state")),
    ("lookahead", Ident("None")),
    ("_yy_result", Ident("None")),
  ]
  if self.needs_initial_position {
    fields.push(("initial_position", Ident("initial_position")))
  }
  if self.input_mode is Array && self.support.tracks_positions() {
    fields.push(("last_pos", Ident("initial_position")))
  }
  match self.input_mode {
    Array => fields.append([("tokens", Ident("tokens")), ("cursor", Int(0))])
    Pull => fields.push(("read_token", Ident("read_token")))
  }
  for kind, count in self.maxima {
    for index in 0..<count {
      fields.push((self.slot_name(kind, index), self.slot_types[kind].initial))
    }
  }
  binding("_env", Record(Some(type_("YYContext")), fields))
}

///|
fn Emitter::local_storage(self : Emitter) -> Array[@mbt_ast.Stmt] {
  let statements : Array[@mbt_ast.Stmt] = [
    LetMut("stack", Some(type_("YYStack")), Ident("YYEmpty")),
    LetMut("state", Some(type_("Int")), Ident("initial_state")),
    if self.saves_snapshot {
      LetMut("error_stack", Some(type_("YYStack")), Ident("YYEmpty"))
    } else {
      binding("error_stack", Ident("YYEmpty"), type_=type_("YYStack"))
    },
    if self.saves_snapshot {
      LetMut("error_state", None, Ident("initial_state"))
    } else {
      binding("error_state", Ident("initial_state"))
    },
    LetMut("lookahead", Some(self.lookahead_type()), Ident("None")),
  ]
  for kind, count in self.maxima {
    for index in 0..<count {
      statements.push(
        LetMut(
          self.slot_name(kind, index),
          Some(self.slot_types[kind].type_),
          self.slot_types[kind].initial,
        ),
      )
    }
  }
  statements
}

///|
fn Emitter::tokens_type(self : Emitter) -> @elab.TypeExpr {
  @mbt_common.named_type("Array", [self.located_type()])
}

///|
fn Emitter::located_type(self : Emitter) -> @elab.TypeExpr {
  Tuple([
    type_("Token"),
    self.meta.position_data_type,
    self.meta.position_data_type,
  ])
}

///|
fn Emitter::lookahead_type(_self : Emitter) -> @elab.TypeExpr {
  Option(type_("YYLookahead"))
}

///|
/// A nominal cache keeps token transport separate from generic tuple values.
fn Emitter::lookahead_item(self : Emitter) -> @mbt_ast.Item {
  let fields : Array[@mbt_ast.Field] = [
    { name: "symbol", type_: type_("Int"), mutable: false, },
    { name: "token", type_: Option(type_("Token")), mutable: false, },
  ]
  if self.cache_json {
    fields.push({ name: "value", type_: type_("Json"), mutable: false, })
  }
  if self.support.tracks_positions() {
    fields.append([
      { name: "start", type_: self.meta.position_data_type, mutable: false, },
      { name: "end", type_: self.meta.position_data_type, mutable: false, },
    ])
  }
  @mbt_ast.item(Struct("YYLookahead", fields), visibility=Private)
}

///|
fn Emitter::cached(self : Emitter, name : String) -> @mbt_ast.Expr {
  Field(dot_call(self.machine("lookahead"), "unwrap", []), Named(name))
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
fn Emitter::result_item(self : Emitter) -> @mbt_ast.Item {
  @mbt_ast.item(
    Enum(
      "YYResult",
      self.program.entries.mapi((index, entry) => @mbt_ast.Constructor::{
        name: "YYAccept_\{index}",
        arguments: [entry.result_type],
      }),
      [],
    ),
    visibility=Private,
  )
}
