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
      ),
    ],
    width=24,
  )
  inspect(
    output.source,
    content=(
      #|///|
      #|let table = [
      #|  10, 20 + 1, f(30),
      #|  (40, 50)
      #|]
      #|
    ),
  )
}
