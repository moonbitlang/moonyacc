///|
pub fn Context::runtime_types(
  self : Context,
  engine : Engine,
) -> Array[@mbt_ast.Item] {
  let state_type : @elab.TypeExpr = match engine {
    Code => Arrow([named_type("YYSymbol", [])], named_type("YYDecision", []))
    Table => named_type("Int", [])
  }
  let items = [
    @mbt_ast.item(TypeAlias("YYState", state_type)),
    @mbt_ast.item(
      TypeAlias(
        "YYAction",
        Arrow(
          if self.pass_before_rhs {
            [
              self.meta.position_data_type,
              named_type("ArrayView", [self.data_type()]),
            ]
          } else {
            [named_type("ArrayView", [self.data_type()])]
          },
          named_type("YYObj", []),
        ),
      ),
    ),
    @mbt_ast.item(
      Enum(
        "YYDecision",
        [
          ctor("Accept", []),
          ctor("Shift", [named_type("YYState", [])]),
          ctor("Reduce", [
            named_type("Int", []),
            named_type("YYSymbol", []),
            self.reduction_type(),
          ]),
          ctor("ReduceNoLookahead", [
            named_type("Int", []),
            named_type("YYSymbol", []),
            self.reduction_type(),
          ]),
          ctor("Error", []),
        ],
        [],
      ),
      visibility=Private,
    ),
  ]
  if self.override_span_start {
    items.push(
      @mbt_ast.item(
        Struct("YYReduction", [
          { name: "action", type_: named_type("YYAction", []), mutable: false, },
          {
            name: "start_before_rhs",
            type_: named_type("Bool", []),
            mutable: false,
          },
        ]),
        visibility=Private,
      ),
    )
  }
  if engine is Table {
    items.push(@mbt_ast.item(TypeAlias("YYSymbol", named_type("Int", []))))
  }
  items
}

///|
fn Context::parse_function(self : Context, engine : Engine) -> @mbt_ast.Item {
  let position = self.meta.position_data_type
  let located : @elab.TypeExpr = Tuple([
    named_type("Token", []),
    position,
    position,
  ])
  let parameters = match self.input_mode {
    Array =>
      [
        typed("tokens", named_type("Array", [located])),
        typed("start", named_type("YYState", [])),
        typed("return_", Arrow([named_type("YYObj", [])], Param("T"))),
        @mbt_ast.Parameter::Optional("initial_pos", position, None),
      ]
    Pull =>
      [
        typed("read_token", Arrow([], located)),
        typed("start_pos", position),
        typed("start", named_type("YYState", [])),
        typed("return_", Arrow([named_type("YYObj", [])], Param("T"))),
      ]
  }
  let body = []
  if self.input_mode is Array {
    body.push(@mbt_ast.Stmt::LetMut("cursor", None, Int(0)))
  }
  let initial : @mbt_ast.Expr = if self.input_mode is Array {
    dot_call(Ident("initial_pos"), "unwrap_or_else", [
      Lambda([], value_block(component(Index(Ident("tokens"), Int(0)), 1))),
    ])
  } else {
    Ident("start_pos")
  }
  if self.tracks_positions() {
    body.push(binding("initial_position", initial))
  } else {
    // Preserve the entry point's initial-position validation while erasing
    // the internal Unit position fields.
    body.push(Eval(call("ignore", [initial])))
  }
  body.append([
    LetMut(
      "state_stack",
      Some(named_type("@list.List", [named_type("YYState", [])])),
      call("@list.List", [Array([Ident("start")])]),
    ),
    binding(
      "data_stack",
      Array([]),
      type_=named_type("Array", [self.data_type()]),
    ),
    LetMut("state", None, Ident("start")),
    LetMut(
      "lookahead",
      Some(
        Option(
          Tuple([
            named_type("YYSymbol", []),
            self.data_type(),
            if self.input_mode is Array {
              Option(named_type("Token", []))
            } else {
              named_type("Token", [])
            },
          ]),
        ),
      ),
      Ident("None"),
    ),
    LetMut("last_shifted_state_stack", None, Ident("state_stack")),
  ])
  if self.input_mode is Array && self.tracks_positions() {
    body.push(LetMut("last_pos", None, Ident("initial_position")))
  }
  let read_statements : Array[@mbt_ast.Stmt] = [
    Let(
      Tuple([
        Bind("token"),
        if self.tracks_positions() {
          Bind("start_pos")
        } else {
          Any
        },
        if self.tracks_positions() {
          Bind("end_pos")
        } else {
          Any
        },
      ]),
      None,
      if self.input_mode is Array {
        Index(Ident("tokens"), Ident("cursor"))
      } else {
        call("read_token", [])
      },
    ),
  ]
  if self.input_mode is Array {
    read_statements.push(Augment(Ident("cursor"), Add, Int(1)))
  }
  read_statements.append([
    Let(
      Tuple([Bind("symbol"), Bind("data")]),
      None,
      call(
        "yy_input",
        if self.tracks_positions() {
          [Ident("token"), Ident("start_pos"), Ident("end_pos")]
        } else {
          [Ident("token")]
        },
      ),
    ),
    Assign(
      Ident("lookahead"),
      call("Some", [
        Tuple([
          Ident("symbol"),
          self.located_data(Ident("data"), Ident("start_pos"), Ident("end_pos")),
          if self.input_mode is Array {
            call("Some", [Ident("token")])
          } else {
            Ident("token")
          },
        ]),
      ]),
    ),
  ])
  let read = statements(
    read_statements,
    result=engine.lookup(Ident("state"), Ident("symbol")),
  )
  let read = if self.input_mode is Array {
    value_block(
      If(
        Binary(Less, Ident("cursor"), dot_call(Ident("tokens"), "length", [])),
        read,
        Some(
          statements(
            [
              Assign(
                Ident("lookahead"),
                call("Some", [
                  Tuple([
                    engine.eoi(),
                    self.located_data(
                      Ident("YYObj_Void"),
                      Ident("last_pos"),
                      Ident("last_pos"),
                    ),
                    Ident("None"),
                  ]),
                ]),
              ),
            ],
            result=engine.lookup(Ident("state"), engine.eoi()),
          ),
        ),
      ),
    )
  } else {
    read
  }
  let decision : @mbt_ast.Expr = Match(
    engine.lookup(Ident("state"), engine.eoi()),
    [
      (
        As(Or([pat("ReduceNoLookahead", [Any]), pat("Accept", [])]), "t"),
        value_block(Ident("t")),
      ),
      (
        Any,
        value_block(
          Match(Ident("lookahead"), [
            (
              pat("Some", [Bind("la")]),
              value_block(
                engine.lookup(Ident("state"), component(Ident("la"), 0)),
              ),
            ),
            (pat("None", []), read),
          ]),
        ),
      ),
    ],
  )
  let accept = statements([
    @mbt_ast.Stmt::Return(
      call("return_", [
        self.data_value(dot_call(Ident("data_stack"), "unsafe_pop", [])),
      ]),
    ),
  ])
  let shift_statements : Array[@mbt_ast.Stmt] = [
    Assert(Is(Ident("lookahead"), pat("Some", [Bind("la")]))),
    Eval(dot_call(Ident("data_stack"), "push", [component(Ident("la"), 1)])),
    Assign(
      Ident("state_stack"),
      call("@list.cons", [Ident("next_state"), Ident("state_stack")]),
    ),
    Assign(Ident("last_shifted_state_stack"), Ident("state_stack")),
    Assign(Ident("state"), Ident("next_state")),
  ]
  if self.input_mode is Array && self.tracks_positions() {
    shift_statements.push(
      Assign(Ident("last_pos"), component(component(Ident("la"), 1), 2)),
    )
  }
  shift_statements.push(Assign(Ident("lookahead"), Ident("None")))
  let shift = statements(shift_statements)
  let reduce_pattern : @mbt_ast.Pattern = Or([
    pat("Reduce", [Bind("count"), Bind("symbol"), Bind("action")]),
    pat("ReduceNoLookahead", [Bind("count"), Bind("symbol"), Bind("action")]),
  ])
  let reduce_body : Array[@mbt_ast.Stmt] = [
    binding(
      "start_index",
      Binary(
        Subtract,
        dot_call(Ident("data_stack"), "length", []),
        Ident("count"),
      ),
    ),
    binding(
      "args",
      Slice(Ident("data_stack"), Some(Ident("start_index")), None),
    ),
  ]
  if self.tracks_positions() {
    reduce_body.append([
      binding(
        "previous_end",
        If(
          Binary(Equal, Ident("start_index"), Int(0)),
          value_block(Ident("initial_position")),
          Some(
            value_block(
              component(
                Index(
                  Ident("data_stack"),
                  Binary(Subtract, Ident("start_index"), Int(1)),
                ),
                2,
              ),
            ),
          ),
        ),
      ),
      binding(
        "start_pos",
        If(
          if self.override_span_start {
            Field(Ident("action"), Named("start_before_rhs"))
          } else {
            Binary(Equal, Ident("count"), Int(0))
          },
          value_block(Ident("previous_end")),
          Some(value_block(component(Index(Ident("args"), Int(0)), 1))),
        ),
      ),
      binding(
        "end_pos",
        If(
          Binary(Equal, Ident("count"), Int(0)),
          value_block(Ident("previous_end")),
          Some(
            value_block(
              component(
                Index(Ident("args"), Binary(Subtract, Ident("count"), Int(1))),
                2,
              ),
            ),
          ),
        ),
      ),
    ])
  }
  reduce_body.push(
    binding(
      "data",
      apply(
        if self.override_span_start {
          Field(Ident("action"), Named("action"))
        } else {
          Ident("action")
        },
        self.action_arguments(Ident("previous_end"), Ident("args")),
      ),
    ),
  )
  reduce_body.append([
    ForEach(
      [Any],
      Range(Int(0), Ident("count"), false),
      statements([
        Eval(call("ignore", [dot_call(Ident("data_stack"), "unsafe_pop", [])])),
        Assign(
          Ident("state_stack"),
          dot_call(Ident("state_stack"), "unsafe_tail", []),
        ),
      ]),
    ),
    Assign(Ident("state"), dot_call(Ident("state_stack"), "unsafe_head", [])),
    Eval(
      dot_call(Ident("data_stack"), "push", [
        self.located_data(Ident("data"), Ident("start_pos"), Ident("end_pos")),
      ]),
    ),
  ])
  let reduce = statements([
    For(
      [
        ("count", Ident("count")),
        ("symbol", Ident("symbol")),
        ("action", Ident("action")),
      ],
      None,
      [],
      statements(
        reduce_body,
        result=Match(engine.lookup(Ident("state"), Ident("symbol")), [
          (pat("Accept", []), accept),
          (
            pat("Shift", [Bind("next_state")]),
            statements([
              Assign(
                Ident("state_stack"),
                call("@list.cons", [Ident("next_state"), Ident("state_stack")]),
              ),
              Assign(Ident("state"), Ident("next_state")),
              Break(Some(Unit)),
            ]),
          ),
          (
            reduce_pattern,
            statements([
              Continue([Ident("count"), Ident("symbol"), Ident("action")]),
            ]),
          ),
          (Any, value_block(call("panic", []))),
        ]),
      ),
    ),
  ])
  let error = statements(
    [
      Let(
        Tuple([Any, Bind("_data"), Bind("token")]),
        None,
        dot_call(Ident("lookahead"), "unwrap", []),
      ),
    ],
    result=call("error", [
      Ident("last_shifted_state_stack"),
      Ident("token"),
      Tuple([
        self.data_position(Ident("_data"), 1),
        self.data_position(Ident("_data"), 2),
      ]),
    ]),
  )
  body.push(
    While(
      Bool(true),
      statements(
        [binding("decision", decision)],
        result=Match(Ident("decision"), [
          (pat("Accept", []), accept),
          (pat("Shift", [Bind("next_state")]), shift),
          (reduce_pattern, reduce),
          (pat("Error", []), error),
        ]),
      ),
    ),
  )
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_parse",
        parameters,
        statements(body, result=call("panic", [])),
        result=Param("T"),
        effect=Raises(named_type("ParseError", [])),
        type_parameters=[{ name: "T", bounds: [], }],
      ),
    ),
  )
}

///|
pub fn Context::parser_runtime(
  self : Context,
  engine : Engine,
) -> Array[@mbt_ast.Item] {
  [self.parse_function(engine), self.error_function(engine)]
}
