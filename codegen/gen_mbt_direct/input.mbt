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
  let arms = []
  for symbol in 1..<=self.program.terminal_count {
    arms.push(
      (self.token_pattern(symbol, Any), value_block(@mbt_ast.Expr::Int(symbol))),
    )
  }
  let items = [
    @mbt_ast.item(
      Function(
        @mbt_ast.function(
          "yy_symbol",
          [typed("token", type_("Token"))],
          value_block(Match(Ident("token"), arms)),
          result=type_("Int"),
        ),
      ),
    ),
  ]
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
fn Emitter::cache(
  self : Emitter,
  symbol : @mbt_ast.Expr,
  token : @mbt_ast.Expr,
  value : @mbt_ast.Expr,
  start : @mbt_ast.Expr,
  end : @mbt_ast.Expr,
) -> @mbt_ast.Expr {
  let fields : Array[(String, @mbt_ast.Expr)] = [
    ("symbol", symbol),
    ("token", token),
  ]
  if self.cache_json {
    fields.push(("value", value))
  }
  if self.support.tracks_positions() {
    fields.append([("start", start), ("end", end)])
  }
  call("Some", [Record(Some(type_("YYLookahead")), fields)])
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
  read.push(
    Assign(
      self.machine("lookahead"),
      self.cache(
        call("yy_symbol", [Ident("token")]),
        call("Some", [Ident("token")]),
        payload,
        Ident("sp"),
        Ident("ep"),
      ),
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
          body([
            Assign(
              self.machine("lookahead"),
              self.cache(
                Int(0),
                Ident("None"),
                call("Json::null", []),
                self.machine("last_pos"),
                self.machine("last_pos"),
              ),
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
fn Emitter::input_bindings(
  self : Emitter,
  symbol : Int32,
  value : @direct_ir.Register,
  start : @direct_ir.Register,
  end : @direct_ir.Register,
) -> Array[@mbt_ast.Stmt] {
  let statements = []
  if !self.erased_register(value) {
    if self.support.is_json_cst() {
      statements.push(self.bind_register(value, self.cached("value")))
    } else {
      let token = dot_call(self.cached("token"), "unwrap", [])
      let pattern = self.token_pattern(symbol, Bind("_yy_token_value"))
      statements.push(
        if self.program.terminal_count == 1 {
          Let(pattern, None, token)
        } else {
          Assert(Is(token, pattern))
        },
      )
      statements.push(self.bind_register(value, Ident("_yy_token_value")))
    }
  }
  if !self.erased_register(start) {
    statements.push(self.bind_register(start, self.cached_position()))
  }
  if !self.erased_register(end) {
    statements.push(self.bind_register(end, self.cached_position(end=true)))
  }
  statements
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
