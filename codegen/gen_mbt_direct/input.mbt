///|
fn Emitter::token_pattern(
  self : Emitter,
  symbol : Int32,
  value : @mbt_ast.Pattern,
) -> @mbt_ast.Pattern {
  let name = self.program.symbols[symbol].name
  let unit = is_unit((self.meta.terminal_meta)(name).data_type)
  Constructor(name, if unit { [] } else { [value] })
}

///|
fn Emitter::token_items(self : Emitter) -> Array[@mbt_ast.Item] {
  let items = []
  if self.support.is_json_cst() {
    let parameters = [typed("token", type_("Token"))]
    if self.support.tracks_positions() {
      parameters.append([
        typed("sp", self.meta.position_data_type),
        typed("ep", self.meta.position_data_type),
      ])
    }
    let arms = []
    for symbol in 1..<=self.program.terminal_count {
      let name = self.program.symbols[symbol].name
      arms.push(
        (
          self.token_pattern(symbol, Bind("value")),
          value_block(
            @mbt_common.token_json(
              name,
              if is_unit((self.meta.terminal_meta)(name).data_type) {
                None
              } else {
                Some(Ident("value"))
              },
              if self.support.tracks_positions() {
                Ident("sp")
              } else {
                Unit
              },
              if self.support.tracks_positions() {
                Ident("ep")
              } else {
                Unit
              },
            ),
          ),
        ),
      )
    }
    items.push(
      @mbt_ast.item(
        Function(
          @mbt_ast.function(
            "yy_input_json",
            parameters,
            value_block(Match(Ident("token"), arms)),
            result=type_("Json"),
          ),
        ),
      ),
    )
  }
  items
}

///|
fn Emitter::read_token_body(self : Emitter) -> @mbt_ast.Block {
  let read : Array[@mbt_ast.Stmt] = [
    Let(
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
  // JsonCst conversions keep their original timing, including on rejected tokens.
  let payload = if self.support.is_json_cst() {
    let args : Array[@mbt_ast.Expr] = [Ident("token")]
    if self.support.tracks_positions() {
      args.append([Ident("sp"), Ident("ep")])
    }
    call("yy_input_json", args)
  } else {
    @mbt_ast.Expr::Unit
  }
  if self.support.is_json_cst() && !self.cache_json {
    read.push(Eval(call("ignore", [payload])))
  }
  read.append(
    self.cache(
      call("Some", [Ident("token")]),
      payload,
      Ident("sp"),
      Ident("ep"),
    ),
  )
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
          body(
            self.cache(
              Ident("None"),
              call("Json::null", []),
              self.machine("last_pos"),
              self.machine("last_pos"),
            ),
          ),
        ),
      ),
    )
  } else {
    body(read)
  }
}

///|
fn Emitter::read_lookahead(
  self : Emitter,
  ready~ : Bool = true,
) -> @mbt_ast.Stmt {
  let read = if self.shared_context {
    value_block(call("yy_read_token", [Ident("_env")]))
  } else {
    self.read_token_body()
  }
  if ready {
    Eval(If(Unary(Not, self.machine("_yy_token_ready")), read, None))
  } else {
    Eval(Block(read))
  }
}

///|
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
