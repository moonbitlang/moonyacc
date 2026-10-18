///|
/// Cold-path functions simulate LR decisions without executing semantic actions.
fn diagnostic_items(
  program : @direct_ir.Program,
  position : @elab.TypeExpr,
  input_mode : @codegen.InputMode,
) -> Array[@mbt_ast.Item] {
  let items = diagnostic_chunks(program)
  items.append([
    expected_function(),
    error_function(program, position, input_mode),
  ])
  items
}

///|
fn diagnostic_key(action : @direct_ir.DiagnosticAction) -> (Int, Int, Int) {
  match action {
    Accept => (1, 0, 0)
    Shift(id) => (2, id, 0)
    Reduce(count, lhs) => (3, count, lhs)
  }
}

///|
fn diagnostic_value(key : (Int, Int, Int)) -> @mbt_ast.Expr {
  Tuple([Int(key.0), Int(key.1), Int(key.2)])
}

///|
fn diagnostic_state(state : @direct_ir.DiagnosticState) -> @mbt_ast.Expr {
  if state.default_ is Some(action) {
    return diagnostic_value(diagnostic_key(action))
  }
  let groups : Array[(Array[@mbt_ast.Pattern], (Int, Int, Int))] = []
  let indices : Map[(Int, Int, Int), Int] = Map([])
  fn add(symbol : Int, key : (Int, Int, Int)) {
    if indices.get(key) is Some(index) {
      groups[index].0.push(Int(symbol))
    } else {
      indices[key] = groups.length()
      groups.push(([Int(symbol)], key))
    }
  }
  for (token, action) in state.actions {
    add(token_id(token), diagnostic_key(action))
  }
  for (lhs, target) in state.gotos {
    add(lhs, (2, target, 0))
  }
  let arms = groups.map(p => {
    (
      if p.0.length() == 1 {
        p.0[0]
      } else {
        @mbt_ast.Pattern::Or(p.0)
      },
      value_block(diagnostic_value(p.1)),
    )
  })
  arms.push((Any, value_block(diagnostic_value((0, 0, 0)))))
  Match(Ident("_symbol"), arms)
}

///|
fn diagnostic_function(name : String, value : @mbt_ast.Expr) -> @mbt_ast.Item {
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        name,
        [typed("state", type_("Int")), typed("_symbol", type_("Int"))],
        value_block(value),
        result=Tuple([type_("Int"), type_("Int"), type_("Int")]),
      ),
    ),
    attributes=[{ name: "inline", arguments: [Positional(Ident("never"))], }],
  )
}

///|
fn diagnostic_chunk(
  program : @direct_ir.Program,
  chunk : Int,
  name : String,
) -> @mbt_ast.Item {
  let first = chunk * BLOCKS_PER_CHUNK
  let last = Int::min(first + BLOCKS_PER_CHUNK, program.diagnostics.length())
  let states = []
  for id in first..<last {
    states.push(
      (
        @mbt_ast.Pattern::Int(id),
        value_block(diagnostic_state(program.diagnostics[id])),
      ),
    )
  }
  states.push((Any, value_block(call("panic", []))))
  diagnostic_function(name, Match(Ident("state"), states))
}

///|
fn diagnostic_chunks(program : @direct_ir.Program) -> Array[@mbt_ast.Item] {
  let count = (program.diagnostics.length() + BLOCKS_PER_CHUNK - 1) /
    BLOCKS_PER_CHUNK
  if count == 1 {
    return [diagnostic_chunk(program, 0, "yy_diagnostic")]
  }
  let items = []
  let dispatch = []
  for chunk in 0..<count {
    let name = "_yy_diagnostic_\{chunk}"
    items.push(diagnostic_chunk(program, chunk, name))
    dispatch.push(
      (
        @mbt_ast.Pattern::Int(chunk),
        value_block(call(name, [Ident("state"), Ident("_symbol")])),
      ),
    )
  }
  dispatch.push((Any, value_block(call("panic", []))))
  items.push(
    diagnostic_function(
      "yy_diagnostic",
      Match(Binary(Divide, Ident("state"), Int(BLOCKS_PER_CHUNK)), dispatch),
    ),
  )
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
fn collect_expected(program : @direct_ir.Program) -> Array[@mbt_ast.Stmt] {
  let terminals : Array[@mbt_ast.Expr] = []
  for i = 1; i <= program.terminal_count; i = i + 1 {
    terminals.push(Tuple([Int(i), Ident("TK_" + program.symbols[i].name)]))
  }
  [
    binding("expected", Array([])),
    ForEach(
      [Tuple([Bind("symbol"), Bind("kind")])],
      Ascribe(
        Array(terminals),
        @mbt_common.named_type("Array", [
          Tuple([type_("Int"), type_("TokenKind")]),
        ]),
      ),
      value_block(
        If(
          call("yy_expected", [Ident("stack"), Ident("symbol")]),
          value_block(dot_call(Ident("expected"), "push", [Ident("kind")])),
          None,
        ),
      ),
    ),
  ]
}

///|
fn error_body(
  program : @direct_ir.Program,
  input_mode : @codegen.InputMode,
) -> @mbt_ast.Block {
  let statements = collect_expected(program)
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
  program : @direct_ir.Program,
  position : @elab.TypeExpr,
  input_mode : @codegen.InputMode,
) -> @mbt_ast.Item {
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_error",
        [
          typed("stack", @mbt_common.named_type("@list.List", [type_("Int")])),
          typed("token", Option(type_("Token"))),
          typed("loc", Tuple([position, position])),
        ],
        error_body(program, input_mode),
        result=type_("Unit"),
        effect=Raises(type_("ParseError")),
      ),
    ),
  )
}
