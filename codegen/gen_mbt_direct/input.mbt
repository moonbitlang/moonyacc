///|
fn Emitter::read_token_body(self : Emitter) -> @mbt_ast.Block {
  let read = [
    @mbt_ast.Stmt::Let(
      Tuple([
        Bind("token"),
        if self.support.tracks_positions() {
          Bind("sp")
        } else {
          Any
        },
        if self.support.tracks_positions() {
          Bind("ep")
        } else {
          Any
        },
      ]),
      None,
      match self.input_mode {
        Array => Index(self.machine("tokens"), self.machine("cursor"))
        Pull => Call(self.machine("read_token"), [])
      },
    ),
  ]
  if self.input_mode is Array {
    read.push(Augment(self.machine("cursor"), Add, Int(1)))
  }
  read.append([
    Let(
      Tuple([Bind("symbol"), Bind("payload")]),
      None,
      call(
        "yy_input",
        if self.support.tracks_positions() {
          [Ident("token"), Ident("sp"), Ident("ep")]
        } else {
          [Ident("token")]
        },
      ),
    ),
    Assign(
      self.machine("lookahead"),
      call("Some", [
        Tuple([
          Ident("symbol"),
          self.support.located_data(Ident("payload"), Ident("sp"), Ident("ep")),
          call("Some", [Ident("token")]),
        ]),
      ]),
    ),
  ])
  if self.input_mode is Array {
    value_block(
      If(
        Binary(
          Less,
          self.machine("cursor"),
          dot_call(self.machine("tokens"), "length", []),
        ),
        body(read),
        Some(
          body([
            Assign(
              self.machine("lookahead"),
              call("Some", [
                Tuple([
                  Int(0),
                  self.support.located_data(
                    Ident("YYObj_Void"),
                    self.machine("last_pos"),
                    self.machine("last_pos"),
                  ),
                  Ident("None"),
                ]),
              ]),
            ),
          ]),
        ),
      ),
    )
  } else {
    body(read)
  }
}

///|
fn Emitter::read_lookahead(self : Emitter) -> @mbt_ast.Stmt {
  let read = if self.chunked {
    value_block(call("yy_read_token", [Ident("_env")]))
  } else {
    self.read_token_body()
  }
  Eval(If(Is(self.machine("lookahead"), Constructor("None", [])), read, None))
}

///|
/// Only callers with an empty cache invoke this helper. Cached reductions pay
/// no call overhead, and chunks do not duplicate the input-mode machinery.
fn Emitter::input_item(self : Emitter) -> @mbt_ast.Item {
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_read_token",
        [typed("_env", type_("YYContext"))],
        self.read_token_body(),
        result=type_("Unit"),
      ),
    ),
    attributes=[{ name: "inline", arguments: [Positional(Ident("never"))], }],
  )
}
