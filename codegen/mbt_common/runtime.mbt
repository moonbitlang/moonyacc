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
          [
            self.meta.position_data_type,
            named_type("ArrayView", [self.data_type()]),
          ],
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
            named_type("YYAction", []),
          ]),
          ctor("ReduceNoLookahead", [
            named_type("Int", []),
            named_type("YYSymbol", []),
            named_type("YYAction", []),
          ]),
          ctor("Error", []),
        ],
        [],
      ),
      visibility=Private,
    ),
  ]
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
  body.append([
    LetMut(
      "state_stack",
      Some(named_type("@list.List", [named_type("YYState", [])])),
      call("@list.cons", [Ident("start"), call("@list.empty", [])]),
    ),
    binding(
      "data_stack",
      Array([]),
      type_=named_type("Array", [self.data_type()]),
    ),
    LetMut(
      "last_pos",
      None,
      if self.input_mode is Array {
        dot_call(Ident("initial_pos"), "unwrap_or_else", [
          Lambda([], value_block(component(Index(Ident("tokens"), Int(0)), 1))),
        ])
      } else {
        Ident("start_pos")
      },
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
  let read_statements : Array[@mbt_ast.Stmt] = [
    Let(
      Tuple([Bind("token"), Bind("start_pos"), Bind("end_pos")]),
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
      call("yy_input", [Ident("token"), Ident("start_pos"), Ident("end_pos")]),
    ),
    Assign(
      Ident("lookahead"),
      call("Some", [
        Tuple([
          Ident("symbol"),
          Tuple([Ident("data"), Ident("start_pos"), Ident("end_pos")]),
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
                    Tuple([
                      Ident("YYObj_Void"),
                      Ident("last_pos"),
                      Ident("last_pos"),
                    ]),
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
        component(dot_call(Ident("data_stack"), "unsafe_pop", []), 0),
      ]),
    ),
  ])
  let shift = statements([
    Assert(Is(Ident("lookahead"), pat("Some", [Bind("la")]))),
    Eval(dot_call(Ident("data_stack"), "push", [component(Ident("la"), 1)])),
    Assign(
      Ident("state_stack"),
      call("@list.cons", [Ident("next_state"), Ident("state_stack")]),
    ),
    Assign(Ident("last_shifted_state_stack"), Ident("state_stack")),
    Assign(Ident("state"), Ident("next_state")),
    Assign(Ident("last_pos"), component(component(Ident("la"), 1), 2)),
    Assign(Ident("lookahead"), Ident("None")),
  ])
  let reduce_pattern : @mbt_ast.Pattern = Or([
    pat("Reduce", [Bind("count"), Bind("symbol"), Bind("action")]),
    pat("ReduceNoLookahead", [Bind("count"), Bind("symbol"), Bind("action")]),
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
        [
          binding(
            "args",
            Slice(
              Ident("data_stack"),
              Some(
                Binary(
                  Subtract,
                  dot_call(Ident("data_stack"), "length", []),
                  Ident("count"),
                ),
              ),
              None,
            ),
          ),
          binding("data", call("action", [Ident("last_pos"), Ident("args")])),
          Let(
            Tuple([Bind("start_pos"), Bind("end_pos")]),
            None,
            If(
              Binary(Equal, dot_call(Ident("args"), "length", []), Int(0)),
              value_block(Tuple([Ident("last_pos"), Ident("last_pos")])),
              Some(
                value_block(
                  Tuple([
                    component(Index(Ident("args"), Int(0)), 1),
                    component(
                      Index(
                        Ident("args"),
                        Binary(
                          Subtract,
                          dot_call(Ident("args"), "length", []),
                          Int(1),
                        ),
                      ),
                      2,
                    ),
                  ]),
                ),
              ),
            ),
          ),
          ForEach(
            [Any],
            Range(Int(0), Ident("count"), false),
            statements([
              Eval(
                call("ignore", [dot_call(Ident("data_stack"), "unsafe_pop", [])]),
              ),
              Assign(
                Ident("state_stack"),
                dot_call(Ident("state_stack"), "unsafe_tail", []),
              ),
            ]),
          ),
          Assign(
            Ident("state"),
            dot_call(Ident("state_stack"), "unsafe_head", []),
          ),
          Eval(
            dot_call(Ident("data_stack"), "push", [
              Tuple([Ident("data"), Ident("start_pos"), Ident("end_pos")]),
            ]),
          ),
        ],
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
        Tuple([
          Any,
          Tuple([Any, Bind("start_pos"), Bind("end_pos")]),
          Bind("token"),
        ]),
        None,
        dot_call(Ident("lookahead"), "unwrap", []),
      ),
    ],
    result=call("error", [
      Ident("last_shifted_state_stack"),
      Ident("token"),
      Tuple([Ident("start_pos"), Ident("end_pos")]),
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
