///|
fn Emitter::context_item(self : Emitter) -> @mbt_ast.Item {
  let fields = self.stack_storage().map(pair => pair.0)
  fields.append(self.snapshots.storage().map(pair => pair.0))
  fields.append(self.lookahead_storage().map(pair => pair.0))
  fields.append([
    { name: "_yy_result", type_: Option(type_("YYResult")), mutable: true, },
  ])
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
  let fields = self.stack_storage().map(pair => (pair.0.name, pair.1))
  fields.append(self.snapshots.storage().map(pair => (pair.0.name, pair.1)))
  fields.append(self.lookahead_storage().map(pair => (pair.0.name, pair.1)))
  fields.push(("_yy_result", Ident("None")))
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
  let statements = self
    .stack_storage()
    .map(pair => {
      if pair.0.mutable {
        @mbt_ast.Stmt::LetMut(pair.0.name, Some(pair.0.type_), pair.1)
      } else {
        binding(pair.0.name, pair.1, type_=pair.0.type_)
      }
    })
  statements.append(self.snapshots.local_storage())
  statements.append(
    self
    .lookahead_storage()
    .map(pair => LetMut(pair.0.name, Some(pair.0.type_), pair.1)),
  )
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
