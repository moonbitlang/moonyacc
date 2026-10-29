///|
/// Cold-path functions simulate LR decisions without executing semantic actions.
fn diagnostic_items(
  program : @direct_ir.Program,
  position : @elab.TypeExpr,
  input_mode : @codegen.InputMode,
) -> Array[@mbt_ast.Item] {
  let items = diagnostic_table_items(program.diagnostics)
  items.append([
    terminal_array(program),
    expected_function(),
    error_function(position, input_mode),
  ])
  items
}

///|
fn expected_step() -> @mbt_ast.Expr {
  Match(Ident("kind"), [
    (Int(0), body([Return(Bool(false))])),
    (Int(1), body([Return(Bool(true))])),
    (
      Int(2),
      body([
        Eval(
          If(
            Binary(Equal, Ident("symbol"), Ident("terminal")),
            body([Return(Bool(true))]),
            None,
          ),
        ),
        Continue([
          call("@list.cons", [Ident("arg"), Ident("stack")]),
          Ident("terminal"),
        ]),
      ]),
    ),
    (
      Int(3),
      body([
        Continue([
          dot_call(Ident("stack"), "drop", [Ident("arg")]),
          Ident("lhs"),
        ]),
      ]),
    ),
    (Any, value_block(call("panic", []))),
  ])
}

///|
fn expected_function() -> @mbt_ast.Item {
  let simulation : @mbt_ast.Stmt = For(
    [("stack", Ident("stack")), ("symbol", Ident("terminal"))],
    None,
    [],
    body(
      [
        Guard(
          Is(Ident("stack"), Constructor("More", [Bind("state"), Rest])),
          body([Return(Bool(false))]),
        ),
        Let(
          Tuple([Bind("kind"), Bind("arg"), Bind("lhs")]),
          None,
          call("yy_diagnostic", [Ident("state"), Ident("symbol")]),
        ),
      ],
      result=expected_step(),
    ),
  )
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_expected",
        [
          typed("stack", @mbt_common.named_type("@list.List", [type_("Int")])),
          typed("terminal", type_("Int")),
        ],
        body([simulation]),
        result=type_("Bool"),
      ),
    ),
  )
}

///|
fn terminal_array(program : @direct_ir.Program) -> @mbt_ast.Item {
  let terminals : Array[@mbt_ast.Expr] = []
  for i = 1; i <= program.terminal_count; i = i + 1 {
    terminals.push(Tuple([Int(i), Ident("TK_" + program.symbols[i].name)]))
  }
  @mbt_ast.item(
    Global(
      "yy_terminals",
      Some(
        @mbt_common.named_type("ReadOnlyArray", [
          Tuple([type_("Int"), type_("TokenKind")]),
        ]),
      ),
      Array(terminals),
    ),
  )
}

///|
fn collect_expected() -> Array[@mbt_ast.Stmt] {
  [
    binding("expected", Array([])),
    ForEach(
      [Bind("i")],
      Range(Int(0), dot_call(Ident("yy_terminals"), "length", []), false),
      body([
        Let(
          Tuple([Bind("symbol"), Bind("kind")]),
          None,
          Index(Ident("yy_terminals"), Ident("i")),
        ),
        Eval(
          If(
            call("yy_expected", [Ident("stack"), Ident("symbol")]),
            value_block(dot_call(Ident("expected"), "push", [Ident("kind")])),
            None,
          ),
        ),
      ]),
    ),
  ]
}

///|
fn error_body(input_mode : @codegen.InputMode) -> @mbt_ast.Block {
  let statements = collect_expected()
  match input_mode {
    Array =>
      body(
        statements,
        result=Match(Ident("token"), [
          (
            Constructor("None", []),
            body([
              Raise(
                call("UnexpectedEndOfInput", [
                  component(Ident("loc"), 1),
                  Ident("expected"),
                ]),
              ),
            ]),
          ),
          (
            Constructor("Some", [Bind("token")]),
            body([
              Raise(
                call("UnexpectedToken", [
                  Ident("token"),
                  Ident("loc"),
                  Ident("expected"),
                ]),
              ),
            ]),
          ),
        ]),
      )
    Pull => {
      statements.push(
        Raise(
          call("UnexpectedToken", [
            dot_call(Ident("token"), "unwrap", []),
            Ident("loc"),
            Ident("expected"),
          ]),
        ),
      )
      body(statements)
    }
  }
}

///|
fn error_function(
  position : @elab.TypeExpr,
  input_mode : @codegen.InputMode,
) -> @mbt_ast.Item {
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        // Keep the public error family available even for an infallible parser.
        // The cold helper may then be unused and eliminated by the compiler.
        "_yy_error",
        [
          typed("stack", @mbt_common.named_type("@list.List", [type_("Int")])),
          typed("token", Option(type_("Token"))),
          typed("loc", Tuple([position, position])),
        ],
        error_body(input_mode),
        result=type_("Unit"),
        effect=Raises(type_("ParseError")),
      ),
    ),
  )
}
