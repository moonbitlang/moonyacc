///|
/// Diagnostics observe the last shift, not the current reduction stack. A
/// checkpoint journal saves overwritten integer states once per checkpoint.
/// Both buffers are bounded by the maximum materialized LR depth. Semantic
/// arrays are independent and are never retained by diagnostic snapshots.
fn state_stack_item(
  saves : Bool,
  diagnostics~ : Bool,
  journal~ : Bool,
) -> @mbt_ast.Item {
  let fields : Array[@mbt_ast.Field] = [
    {
      name: "values",
      type_: @mbt_common.named_type("Array", [type_("Int")]),
      mutable: false,
    },
    { name: "depth", type_: type_("Int"), mutable: true, },
  ]
  if diagnostics {
    fields.push({ name: "checkpoint", type_: type_("Int"), mutable: saves, })
  }
  if journal {
    fields.append([
      { name: "saved_prefix", type_: type_("Int"), mutable: true, },
      {
        name: "undo",
        type_: @mbt_common.named_type("Array", [type_("Int")]),
        mutable: false,
      },
    ])
  }
  @mbt_ast.item(Struct("YYStateStack", fields), visibility=Private)
}

///|
fn stack_field(name : String) -> @mbt_ast.Expr {
  Field(Ident("stack"), Named(name))
}

///|
fn state_write(
  stack : @mbt_ast.Expr,
  state : @mbt_ast.Expr,
) -> Array[@mbt_ast.Stmt] {
  let depth = @mbt_ast.Expr::Field(stack, Named("depth"))
  [
    array_stack_write(Field(stack, Named("values")), depth, state),
    Augment(depth, Add, Int(1)),
  ]
}

///|
fn state_push_item(journal~ : Bool) -> @mbt_ast.Item {
  let depth = stack_field("depth")
  let saved_prefix = stack_field("saved_prefix")
  let values = stack_field("values")
  let undo = stack_field("undo")
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        if journal {
          "yy_stack_push"
        } else {
          "yy_stack_push_unprotected"
        },
        [typed("stack", type_("YYStateStack")), typed("state", type_("Int"))],
        body(
          [
            // Preserve the checkpoint's entire overwritten suffix, including cells
            // popped without a subsequent push. Subsequent writes only extend it.
            ..if journal {
              [
                @mbt_ast.Stmt::While(
                  Binary(Greater, saved_prefix, depth),
                  body([
                    Augment(saved_prefix, Subtract, Int(1)),
                    array_stack_write(
                      undo,
                      Binary(
                        Subtract,
                        Binary(
                          Subtract,
                          stack_field("checkpoint"),
                          saved_prefix,
                        ),
                        Int(1),
                      ),
                      Index(values, saved_prefix),
                    ),
                  ]),
                ),
              ]
            } else {
              []
            },
            ..state_write(Ident("stack"), Ident("state")),
          ],
        ),
        result=type_("Unit"),
      ),
    ),
  )
}

///|
fn state_checkpoint_item(journal~ : Bool) -> @mbt_ast.Item {
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_stack_checkpoint",
        [typed("stack", type_("YYStateStack"))],
        body(
          [
            Assign(stack_field("checkpoint"), stack_field("depth")),
            ..if journal {
              [
                @mbt_ast.Stmt::Assign(
                  stack_field("saved_prefix"),
                  stack_field("depth"),
                ),
              ]
            } else {
              []
            },
          ],
        ),
        result=type_("Unit"),
      ),
    ),
  )
}

///|
fn state_snapshot_item(journal~ : Bool) -> @mbt_ast.Item {
  let list = @mbt_common.named_type("@list.List", [type_("Int")])
  let i = @mbt_ast.Expr::Ident("i")
  let value = if !journal {
    @mbt_ast.Expr::Index(stack_field("values"), i)
  } else {
    @mbt_ast.Expr::If(
      Binary(Less, i, stack_field("saved_prefix")),
      value_block(Index(stack_field("values"), i)),
      Some(
        value_block(
          Index(
            stack_field("undo"),
            Binary(
              Subtract,
              Binary(Subtract, stack_field("checkpoint"), i),
              Int(1),
            ),
          ),
        ),
      ),
    )
  }
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_stack_snapshot",
        [typed("stack", type_("YYStateStack"))],
        body(
          [
            LetMut("states", Some(list), call("@list.List", [Array([])])),
            For(
              [("i", Int(0))],
              Some(Binary(Less, i, stack_field("checkpoint"))),
              [("i", Binary(Add, i, Int(1)))],
              body([
                Assign(
                  Ident("states"),
                  call("@list.cons", [value, Ident("states")]),
                ),
              ]),
            ),
          ],
          result=Ident("states"),
        ),
        result=list,
      ),
    ),
  )
}
