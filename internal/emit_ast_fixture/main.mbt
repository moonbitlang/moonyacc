///|
fn type_(name : String) -> @elab.TypeExpr {
  Constr(pkg=None, name, [])
}

///|
fn body(expr : @mbt_ast.Expr) -> @mbt_ast.Block {
  { statements: [], result: Some(expr), }
}

///|
fn value_function(
  name : String,
  result : @elab.TypeExpr,
  expr : @mbt_ast.Expr,
) -> @mbt_ast.Item {
  @mbt_ast.item(
    Function(@mbt_ast.function(name, [], body(expr), result~)),
    visibility=Public,
  )
}

///|
fn main {
  let int = type_("Int")
  let string = type_("String")
  let env = type_("Env")
  let items : Array[@mbt_ast.Item] = [
    @mbt_ast.item(
      Struct("Env", [
        { name: "read", type_: Arrow([int], int), mutable: false, },
        { name: "value", type_: int, mutable: true, },
      ]),
      visibility=PublicAll,
    ),
    @mbt_ast.item(
      Function(
        @mbt_ast.function(
          "make_env",
          [Positional("value", Some(int))],
          body(
            Record(Some(env), [
              (
                "read",
                Lambda(
                  [Positional("x", None)],
                  body(Binary(Multiply, Ident("x"), Int(2))),
                ),
              ),
              ("value", Ident("value")),
            ]),
          ),
          result=env,
        ),
      ),
      visibility=Public,
    ),
    @mbt_ast.item(
      Global(
        "table",
        Some(Constr(pkg=None, "FixedArray", [int])),
        Array([Int(10), Int(20), Int(30)]),
      ),
    ),
    value_function("table_value", int, Index(Ident("table"), Int(1))),
    @mbt_ast.item(
      Function(
        @mbt_ast.function(
          "Env::read",
          [Positional("_self", Some(env)), Positional("x", Some(int))],
          body(Binary(Add, Ident("x"), Int(1000))),
          result=int,
        ),
      ),
    ),
    @mbt_ast.item(
      Function(
        @mbt_ast.function(
          "from_field",
          [Positional("env", Some(env))],
          body(Call(Field(Ident("env"), Named("read")), [Positional(Int(3))])),
          result=int,
        ),
      ),
      visibility=Public,
      attributes=[{ name: "inline", arguments: [Positional(Ident("never"))], }],
    ),
    @mbt_ast.item(
      Function(
        @mbt_ast.function(
          "from_method",
          [Positional("env", Some(env))],
          body(MethodCall(Ident("env"), "read", [Positional(Int(3))])),
          result=int,
        ),
      ),
      visibility=Public,
    ),
    value_function(
      "identity_reader",
      Arrow([int], int),
      Lambda([Positional("x", None)], {
        statements: [Comment("A commented body still returns a scalar.")],
        result: Some(Ident("x")),
      }),
    ),
    value_function(
      "grouping",
      int,
      Binary(Subtract, Int(10), Binary(Subtract, Int(5), Int(2))),
    ),
    value_function(
      "bit_precedence",
      type_("Bool"),
      Binary(Equal, Binary(BitAnd, Int(6), Int(3)), Int(2)),
    ),
    value_function(
      "literal",
      string,
      String("quote:\" slash:\\ interp:\\{x} 😀\r\n\u0000"),
    ),
    value_function("char_literal", type_("Char"), Char('\'')),
    @mbt_ast.item(TypeAlias("Reader", Arrow([int], int)), visibility=Public),
    value_function(
      "make_reader",
      Arrow([int], int),
      Lambda([Positional("x", None)], body(Binary(Add, Ident("x"), Int(1)))),
    ),
    @mbt_ast.item(
      Function(
        @mbt_ast.function(
          "identity",
          [Positional("x", Some(Param("T")))],
          body(Ident("x")),
          result=Param("T"),
          type_parameters=[{ name: "T", bounds: [], }],
        ),
      ),
      visibility=Public,
    ),
    @mbt_ast.item(
      Function(
        @mbt_ast.function(
          "sum_squares",
          [Positional("n", Some(int))],
          {
            statements: [
              LetMut("total", None, Int(0)),
              For(
                [("i", Int(0))],
                Some(Binary(Less, Ident("i"), Ident("n"))),
                [("i", Binary(Add, Ident("i"), Int(1)))],
                {
                  statements: [
                    Augment(
                      Ident("total"),
                      Add,
                      Binary(Multiply, Ident("i"), Ident("i")),
                    ),
                  ],
                  result: None,
                },
              ),
            ],
            result: Some(Ident("total")),
          },
          result=int,
        ),
      ),
      visibility=Public,
    ),
    @mbt_ast.item(
      Function(
        @mbt_ast.function(
          "sum_tail",
          [Positional("values", Some(Constr(pkg=None, "Array", [int])))],
          {
            statements: [
              LetMut("total", None, Int(0)),
              ForEach([Bind("x")], Slice(Ident("values"), Some(Int(1)), None), {
                statements: [Augment(Ident("total"), Add, Ident("x"))],
                result: None,
              }),
            ],
            result: Some(Ident("total")),
          },
          result=int,
        ),
      ),
      visibility=Public,
    ),
    @mbt_ast.item(
      Function(
        @mbt_ast.function(
          "walk",
          [Positional("n", Some(int))],
          {
            statements: [
              For([("i", Int(0)), ("total", Int(0))], None, [], {
                statements: [
                  Eval(
                    If(
                      Binary(GreaterEqual, Ident("i"), Ident("n")),
                      { statements: [Return(Ident("total"))], result: None, },
                      None,
                    ),
                  ),
                  Continue([
                    Binary(Add, Ident("i"), Int(1)),
                    Binary(Add, Ident("total"), Ident("i")),
                  ]),
                ],
                result: None,
              }),
            ],
            result: None,
          },
          result=int,
        ),
      ),
      visibility=Public,
    ),
    @mbt_ast.item(
      Suberror("Failure", [{ name: "Failed", arguments: [int], }], []),
      visibility=Public,
    ),
    @mbt_ast.item(
      Function(
        @mbt_ast.function(
          "positive",
          [Positional("x", Some(int))],
          {
            statements: [
              Guard(Binary(GreaterEqual, Ident("x"), Int(0)), {
                statements: [
                  Raise(Call(Ident("Failed"), [Positional(Ident("x"))])),
                ],
                result: None,
              }),
            ],
            result: Some(Ident("x")),
          },
          result=int,
          effect=Raises(type_("Failure")),
        ),
      ),
      visibility=Public,
    ),
    @mbt_ast.item(
      Function(
        @mbt_ast.function(
          "bump",
          [Positional("env", Some(env))],
          {
            statements: [
              Assign(
                Field(Ident("env"), Named("value")),
                Binary(Add, Field(Ident("env"), Named("value")), Int(1)),
              ),
            ],
            result: Some(Field(Ident("env"), Named("value"))),
          },
          result=int,
        ),
      ),
      visibility=Public,
    ),
    @mbt_ast.item(
      Enum("Flag", [{ name: "Ready", arguments: [], }], []),
      visibility=Private,
    ),
    @mbt_ast.item(
      Impl(
        type_("Show"),
        type_("Flag"),
        @mbt_ast.function(
          "output",
          [Positional("_self", None), Positional("logger", None)],
          body(
            Call(Ident("Logger::write_string"), [
              Positional(Ident("logger")),
              Positional(String("ready")),
            ]),
          ),
        ),
      ),
    ),
    value_function(
      "show_ready",
      string,
      Call(Ident("Show::to_string"), [Positional(Ident("Ready"))]),
    ),
    @mbt_ast.item(
      Function(
        @mbt_ast.function(
          "loop_result",
          [Positional("n", Some(int))],
          {
            statements: [
              LetMut("total", None, Int(0)),
              Comment("Nested loop exits\r\nkeep their target"),
              LabelledLoop(
                "outer",
                While(Binary(Less, Ident("total"), Ident("n")), {
                  statements: [
                    While(Bool(true), {
                      statements: [
                        Augment(Ident("total"), Add, Int(1)),
                        Eval(
                          If(
                            Binary(Equal, Ident("total"), Int(3)),
                            {
                              statements: [BreakTo("outer", None)],
                              result: None,
                            },
                            None,
                          ),
                        ),
                        ContinueTo("outer", []),
                      ],
                      result: None,
                    }),
                  ],
                  result: None,
                }),
              ),
              LocalFunction(
                @mbt_ast.function(
                  "finish",
                  [Positional("value", Some(int))],
                  body(
                    Match(Ident("value"), [
                      (Or([Int(0), Int(1)]), body(Int(0))),
                      (Any, body(Ident("value"))),
                    ]),
                  ),
                  result=int,
                ),
              ),
            ],
            result: Some(Call(Ident("finish"), [Positional(Ident("total"))])),
          },
          result=int,
        ),
      ),
      visibility=Public,
    ),
    value_function(
      "user_code",
      int,
      Verbatim(
        @mbt_ast.Fragment([
          Text("let x = 2\r\nx * ", None),
          Splice(Binary(Add, Int(20), Int(1)), None),
          Text(" // keep this comment", None),
        ]),
      ),
    ),
  ]
  println(@mbt_ast.render(items).source)
}
