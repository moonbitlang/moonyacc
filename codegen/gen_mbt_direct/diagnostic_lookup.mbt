///|
fn diagnostic_array(
  name : String,
  values : Array[@mbt_ast.Expr],
  element : @elab.TypeExpr,
) -> @mbt_ast.Item {
  @mbt_ast.item(
    Global(
      name,
      Some(@mbt_common.named_type("FixedArray", [element])),
      Array(values),
    ),
  )
}

///|
fn diagnostic_search_step() -> @mbt_ast.Block {
  body([
    binding(
      "mid",
      Binary(
        Add,
        Ident("lo"),
        Binary(Divide, Binary(Subtract, Ident("hi"), Ident("lo")), Int(2)),
      ),
    ),
    binding(
      "entry",
      Binary(
        Add,
        Binary(Add, Ident("row"), Int(1)),
        Binary(Multiply, Ident("mid"), Int(2)),
      ),
    ),
    binding("key", Index(Ident("yy_diag_data"), Ident("entry"))),
    Eval(
      If(
        Binary(Less, Ident("symbol"), Ident("key")),
        body([Continue([Ident("lo"), Ident("mid")])]),
        None,
      ),
    ),
    Eval(
      If(
        Binary(Greater, Ident("symbol"), Ident("key")),
        body([Continue([Binary(Add, Ident("mid"), Int(1)), Ident("hi")])]),
        None,
      ),
    ),
    Return(Index(Ident("yy_diag_data"), Binary(Add, Ident("entry"), Int(1)))),
  ])
}

///|
fn diagnostic_lookup() -> @mbt_ast.Item {
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_diag_lookup",
        [typed("state", type_("Int")), typed("symbol", type_("Int"))],
        body(
          [
            binding("row", Index(Ident("yy_diag_rows"), Ident("state"))),
            Eval(
              If(
                Binary(Less, Ident("row"), Int(0)),
                body([
                  Return(Binary(Subtract, Unary(Negate, Ident("row")), Int(1))),
                ]),
                None,
              ),
            ),
            For(
              [
                ("lo", Int(0)),
                ("hi", Index(Ident("yy_diag_data"), Ident("row"))),
              ],
              Some(Binary(Less, Ident("lo"), Ident("hi"))),
              [],
              diagnostic_search_step(),
            ),
          ],
          result=Int(0),
        ),
        result=type_("Int"),
      ),
    ),
  )
}

///|
fn diagnostic_decoder(state_count : Int32) -> @mbt_ast.Item {
  let reduce_base = state_count + 2
  let reduction = body(
    [
      Let(
        Tuple([Bind("count"), Bind("lhs")]),
        None,
        Index(
          Ident("yy_diag_reductions"),
          Binary(Subtract, Ident("code"), Int(reduce_base)),
        ),
      ),
    ],
    result=Tuple([Int(3), Ident("count"), Ident("lhs")]),
  )
  let decision : @mbt_ast.Expr = Match(Ident("code"), [
    (Int(0), value_block(Tuple([Int(0), Int(0), Int(0)]))),
    (Int(1), value_block(Tuple([Int(1), Int(0), Int(0)]))),
    (
      Any,
      value_block(
        If(
          Binary(Less, Ident("code"), Int(reduce_base)),
          value_block(
            Tuple([Int(2), Binary(Subtract, Ident("code"), Int(2)), Int(0)]),
          ),
          Some(reduction),
        ),
      ),
    ),
  ])
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_diagnostic",
        [typed("state", type_("Int")), typed("symbol", type_("Int"))],
        body(
          [
            binding(
              "code",
              call("yy_diag_lookup", [Ident("state"), Ident("symbol")]),
            ),
          ],
          result=decision,
        ),
        result=Tuple([type_("Int"), type_("Int"), type_("Int")]),
      ),
    ),
  )
}

///|
fn diagnostic_table_items(
  states : Array[@direct_ir.DiagnosticState],
) -> Array[@mbt_ast.Item] {
  let table = diagnostic_table(states)
  [
    diagnostic_array("yy_diag_rows", table.rows.map(x => Int(x)), type_("Int")),
    diagnostic_array("yy_diag_data", table.data.map(x => Int(x)), type_("Int")),
    diagnostic_array(
      "yy_diag_reductions",
      table.reductions.map(p => Tuple([Int(p.0), Int(p.1)])),
      Tuple([type_("Int"), type_("Int")]),
    ),
    diagnostic_lookup(),
    diagnostic_decoder(states.length()),
  ]
}
