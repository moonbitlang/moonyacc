///|
fn Emitter::parse_parameters(self : Emitter) -> Array[@mbt_ast.Parameter] {
  match self.input_mode {
    Array =>
      [
        typed("tokens", self.tokens_type()),
        typed("_entry", type_("Int")),
        typed(
          if !self.needs_initial_state {
            "_initial_state"
          } else {
            "initial_state"
          },
          type_("Int"),
        ),
        ..if self.support.input_layout is Located {
          [
            @mbt_ast.Parameter::Optional(
              "initial_pos",
              self.meta.position_data_type,
              None,
            ),
          ]
        } else {
          []
        },
      ]
    Pull =>
      [
        typed("read_token", Arrow([], self.support.input_type())),
        ..if self.support.input_layout is Located {
          [typed("start_pos", self.meta.position_data_type)]
        } else {
          []
        },
        typed("_entry", type_("Int")),
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
  if self.input_mode is Array && !self.shared_context {
    statements.push(@mbt_ast.Stmt::LetMut("cursor", None, Int(0)))
  }
  if self.support.input_layout is TokenOnly {
    // Unit is the initial position even for an empty input; no first-token
    // access or dummy position argument is required by this ABI.
    return statements
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
  if !self.shared_context &&
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
  if self.shared_context {
    statements.push(self.context_binding())
    statements.push(self.region_dispatch())
  } else {
    statements.append(self.local_storage())
    let code = self.region_body(0, no_comments)
    statements.append(code.statements)
    if code.result is Some(value) {
      statements.push(Eval(value))
    }
  }
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_parse",
        self.parse_parameters(),
        body(statements),
        result=type_("YYResult"),
        effect=if self.region_errors.is_empty() {
          Default
        } else {
          Raises(type_("ParseError"))
        },
      ),
    ),
  )
}
