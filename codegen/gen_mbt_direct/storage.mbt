///|
/// The physical parser state lives in fields for chunked programs and locals
/// otherwise. Keep its declaration and initialization together.
fn Emitter::context_item(self : Emitter) -> @mbt_ast.Item {
  let state_stack = @mbt_common.named_type("@list.List", [type_("Int")])
  let data_stack = @mbt_common.named_type("Array", [self.data_type()])
  let fields : Array[@mbt_ast.Field] = [
    { name: "states", type_: state_stack, mutable: true, },
    { name: "data", type_: data_stack, mutable: false, },
    {
      name: "initial_position",
      type_: self.meta.position_data_type,
      mutable: false,
    },
    { name: "error_stack", type_: state_stack, mutable: self.saves_snapshot, },
    { name: "lookahead", type_: self.lookahead_type(), mutable: true, },
    { name: "_yy_result", type_: type_("YYObj"), mutable: true, },
  ]
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
        name: "_yy_p\{kind}_\{index}",
        type_: self.slot_type(kind),
        mutable: true,
      })
    }
  }
  @mbt_ast.item(Struct("YYContext", fields), visibility=Private)
}

///|
fn Emitter::context_binding(self : Emitter) -> @mbt_ast.Stmt {
  let fields : Array[(String, @mbt_ast.Expr)] = [
    ("states", Ident("states")),
    ("data", Array([])),
    ("initial_position", Ident("initial_position")),
    ("error_stack", Ident("states")),
    ("lookahead", Ident("None")),
    ("_yy_result", Ident("YYObj_Void")),
  ]
  if self.input_mode is Array && self.support.tracks_positions() {
    fields.push(("last_pos", Ident("initial_position")))
  }
  match self.input_mode {
    Array => fields.append([("tokens", Ident("tokens")), ("cursor", Int(0))])
    Pull => fields.push(("read_token", Ident("read_token")))
  }
  for kind, count in self.maxima {
    for index in 0..<count {
      fields.push(("_yy_p\{kind}_\{index}", slot_initial(kind)))
    }
  }
  binding("_env", Record(Some(type_("YYContext")), fields))
}

///|
fn Emitter::local_storage(self : Emitter) -> Array[@mbt_ast.Stmt] {
  let statements = [
    binding(
      "data",
      Array([]),
      type_=@mbt_common.named_type("Array", [self.data_type()]),
    ),
    if self.saves_snapshot {
      @mbt_ast.Stmt::LetMut("error_stack", None, Ident("states"))
    } else {
      binding("error_stack", Ident("states"))
    },
    LetMut("lookahead", Some(self.lookahead_type()), Ident("None")),
  ]
  for kind, count in self.maxima {
    for index in 0..<count {
      statements.push(
        LetMut(
          "_yy_p\{kind}_\{index}",
          Some(self.slot_type(kind)),
          slot_initial(kind),
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
fn Emitter::data_type(self : Emitter) -> @elab.TypeExpr {
  self.support.data_type()
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
fn Emitter::lookahead_type(self : Emitter) -> @elab.TypeExpr {
  Option(Tuple([type_("Int"), self.data_type(), Option(type_("Token"))]))
}
