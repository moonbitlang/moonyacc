///|
test "emission represents field calls and expression grouping structurally" {
  let int : @elab.TypeExpr = Constr(pkg=None, "Int", [])
  let env : @elab.TypeExpr = Constr(pkg=None, "Env", [])
  let value = @mbt_ast.Expr::Binary(
    Subtract,
    Int(10),
    Binary(Subtract, Int(5), Int(2)),
  )
  let output = @mbt_ast.render([
    @mbt_ast.item(
      Function(
        @mbt_ast.function(
          "run",
          [Positional("env", Some(env))],
          {
            statements: [Let(Bind("value"), None, value)],
            result: Some(
              Call(Field(Ident("env"), Named("read")), [
                Positional(Ident("value")),
              ]),
            ),
          },
          result=int,
        ),
      ),
      visibility=Public,
    ),
  ])
  inspect(
    output.source,
    content=(
      #|///|
      #|pub fn run(env : Env) -> Int {
      #|  let value = 10 - (5 - 2)
      #|  (env.read)(value)
      #|}
      #|
    ),
  )
}

///|
test "delimited lists group by width regardless of expression kind" {
  let output = @mbt_ast.render(
    [
      @mbt_ast.item(
        Global(
          "table",
          None,
          Array([
            Int(10),
            Binary(Add, Int(20), Int(1)),
            Call(Ident("f"), [Positional(Int(30))]),
            Tuple([Int(40), Int(50)]),
          ]),
        ),
        attributes=[
          { name: "inline", arguments: [Positional(Ident("never"))], },
        ],
      ),
    ],
    width=24,
  )
  inspect(
    output.source,
    content=(
      #|///|
      #|#inline(never)
      #|let table = [
      #|  10, 20 + 1, f(30),
      #|  (40, 50)
      #|]
      #|
    ),
  )
}

///|
test "attributes stay on one line regardless of width" {
  let items = [
    @mbt_ast.item(Global("value", None, Int(0)), attributes=[
      {
        name: "deprecated",
        arguments: [
          Positional(
            String(
              "Use Compare::compare or Compare::op_ge or Compare::op_gt or Compare::op_le or Compare::op_lt instead",
            ),
          ),
        ],
      },
      { name: "doc", arguments: [Positional(Ident("hidden"))], },
    ]),
  ]
  let expected =
    #|///|
    #|#deprecated("Use Compare::compare or Compare::op_ge or Compare::op_gt or Compare::op_le or Compare::op_lt instead")
    #|#doc(hidden)
    #|let value = 0
    #|
  assert_eq(@mbt_ast.render(items).source, expected)
  for width in [1, 24, 80, 120] {
    assert_eq(@mbt_ast.render(items, width~).source, expected)
  }
}

///|
test "attributes flatten nested arguments and escape string line breaks" {
  let output = @mbt_ast.render(
    [
      @mbt_ast.item(Global("value", None, Int(0)), attributes=[
        { name: "flag", arguments: [], },
        {
          name: "custom",
          arguments: [
            Positional(Ident("enabled")),
            Labelled(
              "values",
              Array([
                Int(1),
                Call(Ident("f"), [Positional(Tuple([Int(2), Int(3)]))]),
                Binary(Add, Int(4), Int(5)),
              ]),
            ),
            ForwardOptional("option"),
          ],
        },
        {
          name: "deprecated",
          arguments: [
            Positional(String("line one\nline two\r\n\"quoted\"\\path")),
          ],
        },
      ]),
    ],
    width=1,
  )
  inspect(
    output.source,
    content=(
      #|///|
      #|#flag
      #|#custom(enabled, values=[1, f((2, 3)), 4 + 5], option?)
      #|#deprecated("line one\nline two\r\n\"quoted\"\\path")
      #|let value = 0
      #|
    ),
  )
}

///|
test "panic attributes reject expressions with hard line breaks" {
  @mbt_ast.render([
    @mbt_ast.item(Global("value", None, Int(0)), attributes=[
      {
        name: "custom",
        arguments: [
          Positional(Block({ statements: [], result: Some(Int(1)), })),
        ],
      },
    ]),
  ])
  |> ignore
}

///|
test "panic attributes reject literal line feeds" {
  @mbt_ast.render([
    @mbt_ast.item(Global("value", None, Int(0)), attributes=[
      { name: "custom\nattribute", arguments: [], },
    ]),
  ])
  |> ignore
}

///|
test "panic attributes reject literal carriage returns" {
  @mbt_ast.render([
    @mbt_ast.item(Global("value", None, Int(0)), attributes=[
      { name: "custom", arguments: [Positional(Ident("value\rname"))], },
    ]),
  ])
  |> ignore
}
