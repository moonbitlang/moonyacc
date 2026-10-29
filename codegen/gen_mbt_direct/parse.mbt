///|
fn Emitter::parse_parameters(self : Emitter) -> Array[@mbt_ast.Parameter] {
  match self.input_mode {
    Array =>
      [
        typed("tokens", self.tokens_type()),
        typed("entry", type_("Int")),
        typed(
          if !self.needs_initial_state {
            "_initial_state"
          } else {
            "initial_state"
          },
          type_("Int"),
        ),
        Optional("initial_pos", self.meta.position_data_type, None),
      ]
    Pull =>
      [
        typed("read_token", Arrow([], self.located_type())),
        typed("start_pos", self.meta.position_data_type),
        typed("entry", type_("Int")),
        typed(
          if !self.needs_initial_state {
            "_initial_state"
          } else {
            "initial_state"
          },
          type_("Int"),
        ),
      ]
  }
}

///|
fn Emitter::initial_state(self : Emitter) -> Array[@mbt_ast.Stmt] {
  let statements = []
  if self.input_mode is Array && !self.chunked {
    statements.push(@mbt_ast.Stmt::LetMut("cursor", None, Int(0)))
  }
  let position = match self.input_mode {
    Array =>
      dot_call(Ident("initial_pos"), "unwrap_or_else", [
        Lambda([], value_block(component(Index(Ident("tokens"), Int(0)), 1))),
      ])
    Pull => @mbt_ast.Expr::Ident("start_pos")
  }
  statements.push(
    if self.support.tracks_positions() {
      binding("initial_position", position)
    } else {
      // Evaluating the array fallback preserves empty-input validation.
      Eval(call("ignore", [position]))
    },
  )
  if !self.chunked &&
    self.input_mode is Array &&
    self.support.tracks_positions() {
    let position = @mbt_ast.Expr::Ident("initial_position")
    statements.push(
      if self.consumes_input {
        LetMut("last_pos", None, position)
      } else {
        binding("last_pos", position)
      },
    )
  }
  statements
}

///|
fn Emitter::parse_item(self : Emitter, no_comments : Bool) -> @mbt_ast.Item {
  let statements = self.initial_state()
  if self.chunked {
    statements.push(self.context_binding())
    statements.push(self.chunk_dispatch())
  } else {
    statements.append(self.local_storage())
    statements.push(
      if self.chunk_loops.contains(0) {
        For(
          [("pc", Ident("entry"))],
          None,
          [],
          value_block(
            self.dispatch(
              0,
              self.layout.blocks.length(),
              Ident("pc"),
              no_comments,
            ),
          ),
        )
      } else {
        Eval(
          self.dispatch(
            0,
            self.layout.blocks.length(),
            Ident("entry"),
            no_comments,
          ),
        )
      },
    )
  }
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_parse",
        self.parse_parameters(),
        body(statements),
        result=type_("YYResult"),
        effect=if self.chunk_errors.is_empty() {
          Default
        } else {
          Raises(type_("ParseError"))
        },
      ),
    ),
  )
}
