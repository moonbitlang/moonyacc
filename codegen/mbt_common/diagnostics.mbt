///|
/// Preserve the existing expected-token simulation, including its last-shift
/// stack snapshot and its exclusion of semantic action execution.
fn Context::error_function(self : Context, engine : Engine) -> @mbt_ast.Item {
  let stack_type = named_type("@list.List", [named_type("YYState", [])])
  let inner = @mbt_ast.function(
    "inner_go",
    [
      typed("stack", stack_type),
      Positional("count", None),
      Positional("symbol", None),
    ],
    statements(
      [
        binding("stack", dot_call(Ident("stack"), "drop", [Ident("count")])),
        Assert(Is(Ident("stack"), pat("More", [Bind("state"), Rest]))),
      ],
      result=Match(engine.lookup(Ident("state"), Ident("symbol")), [
        (
          pat("Shift", [Bind("state")]),
          value_block(
            call("go", [call("@list.cons", [Ident("state"), Ident("stack")])]),
          ),
        ),
        (
          Or([
            pat("Reduce", [Bind("count"), Bind("symbol"), Any]),
            pat("ReduceNoLookahead", [Bind("count"), Bind("symbol"), Any]),
          ]),
          value_block(
            call("inner_go", [Ident("stack"), Ident("count"), Ident("symbol")]),
          ),
        ),
        (Any, value_block(call("panic", []))),
      ]),
    ),
  )
  let go = @mbt_ast.function(
    "go",
    [typed("stack", stack_type)],
    value_block(
      Match(Ident("stack"), [
        (pat("Empty", []), value_block(Unit)),
        (
          pat("More", [Bind("state"), Rest]),
          value_block(
            Match(engine.lookup(Ident("state"), Ident("symbol")), [
              (
                Or([pat("Accept", []), pat("Shift", [Any])]),
                value_block(
                  dot_call(Ident("expected"), "push", [Ident("kind")]),
                ),
              ),
              (
                Or([
                  pat("Reduce", [Bind("count"), Bind("symbol"), Any]),
                  pat("ReduceNoLookahead", [Bind("count"), Bind("symbol"), Any]),
                ]),
                statements(
                  [LocalFunction(inner)],
                  result=call("inner_go", [
                    Ident("stack"),
                    Ident("count"),
                    Ident("symbol"),
                  ]),
                ),
              ),
              (pat("Error", []), value_block(Unit)),
            ]),
          ),
        ),
      ]),
    ),
  )
  let try_add = @mbt_ast.function(
    "try_add",
    [
      typed("symbol", named_type("YYSymbol", [])),
      typed("kind", named_type("TokenKind", [])),
    ],
    statements([LocalFunction(go)], result=call("go", [Ident("stack")])),
  )
  let terms : @mbt_ast.Expr = Ascribe(
    Array(
      self.grammar.terminals.map(t => {
        @mbt_ast.Expr::Tuple([engine.terminal(t), Ident("TK_" + t.name)])
      }),
    ),
    named_type("Array", [
      Tuple([named_type("YYSymbol", []), named_type("TokenKind", [])]),
    ]),
  )
  let body = [
    binding("expected", Array([])),
    @mbt_ast.Stmt::LocalFunction(try_add),
    ForEach(
      [Bind("term")],
      terms,
      value_block(
        call("try_add", [
          component(Ident("term"), 0),
          component(Ident("term"), 1),
        ]),
      ),
    ),
  ]
  let end_error = statements([
    Raise(
      call("UnexpectedEndOfInput", [
        component(Ident("loc"), 1),
        Ident("expected"),
      ]),
    ),
  ])
  let token_error = statements([
    Raise(
      call("UnexpectedToken", [Ident("token"), Ident("loc"), Ident("expected")]),
    ),
  ])
  let finish = match self.input_mode {
    Array =>
      value_block(
        Match(Ident("token"), [
          (pat("None", []), end_error),
          (pat("Some", [Bind("token")]), token_error),
        ]),
      )
    Pull => token_error
  }
  body.append(finish.statements)
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "error",
        [
          typed("stack", stack_type),
          typed(
            "token",
            if self.input_mode is Array {
              Option(named_type("Token", []))
            } else {
              named_type("Token", [])
            },
          ),
          typed(
            "loc",
            Tuple([self.meta.position_data_type, self.meta.position_data_type]),
          ),
        ],
        { statements: body, result: finish.result, },
        result=named_type("Unit", []),
        effect=Raises(named_type("ParseError", [])),
      ),
    ),
  )
}
