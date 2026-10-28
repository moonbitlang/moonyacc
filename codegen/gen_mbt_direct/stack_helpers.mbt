///|
fn Emitter::stack_projection(self : Emitter, name : String) -> @mbt_ast.Item {
  let arms = self.cells.map(cell => {
    let pattern = cell.pattern(
      if name == "tail" {
        Bind("tail")
      } else {
        Any
      },
      if name == "saved" {
        Bind("saved")
      } else {
        Any
      },
      Any,
      Any,
      if name == "end" {
        Bind("end")
      } else {
        Any
      },
    )
    (pattern, value_block(@mbt_ast.Expr::Ident(name)))
  })
  arms.push((Constructor("YYEmpty", []), value_block(call("panic", []))))
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_stack_" + name,
        [typed("stack", type_("YYStack"))],
        value_block(Match(Ident("stack"), arms)),
        result=match name {
          "tail" => type_("YYStack")
          "saved" => type_("Int")
          _ => self.meta.position_data_type
        },
      ),
    ),
  )
}

///|
fn stack_drop_item() -> @mbt_ast.Item {
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_stack_drop",
        [typed("stack", type_("YYStack")), typed("count", type_("Int"))],
        body([
          For(
            [("stack", Ident("stack")), ("remaining", Ident("count"))],
            None,
            [],
            body([
              Eval(
                If(
                  Binary(LessEqual, Ident("remaining"), Int(0)),
                  body([Return(Ident("stack"))]),
                  None,
                ),
              ),
              Continue([
                call("yy_stack_tail", [Ident("stack")]),
                Binary(Subtract, Ident("remaining"), Int(1)),
              ]),
            ]),
          ),
        ]),
        result=type_("YYStack"),
      ),
    ),
  )
}

///|
fn stack_state_item() -> @mbt_ast.Item {
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_stack_state",
        [
          typed("stack", type_("YYStack")),
          typed("state", type_("Int")),
          typed("count", type_("Int")),
        ],
        body([
          For(
            [
              ("stack", Ident("stack")),
              ("state", Ident("state")),
              ("remaining", Ident("count")),
            ],
            None,
            [],
            body([
              Eval(
                If(
                  Binary(LessEqual, Ident("remaining"), Int(0)),
                  body([Return(Ident("state"))]),
                  None,
                ),
              ),
              Continue([
                call("yy_stack_tail", [Ident("stack")]),
                call("yy_stack_saved", [Ident("stack")]),
                Binary(Subtract, Ident("remaining"), Int(1)),
              ]),
            ]),
          ),
        ]),
        result=type_("Int"),
      ),
    ),
  )
}

///|
/// Project the last-shift snapshot only on the error path. The initial state
/// is included, and semantic actions are never replayed by this projection.
fn stack_states_item() -> @mbt_ast.Item {
  let list = @mbt_common.named_type("@list.List", [type_("Int")])
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_stack_states",
        [typed("stack", type_("YYStack")), typed("state", type_("Int"))],
        body(
          [
            binding(
              "states",
              Array([]),
              type_=@mbt_common.named_type("Array", [type_("Int")]),
            ),
            For(
              [("stack", Ident("stack")), ("state", Ident("state"))],
              None,
              [],
              body([
                Eval(dot_call(Ident("states"), "push", [Ident("state")])),
                Eval(
                  If(
                    Is(Ident("stack"), Constructor("YYEmpty", [])),
                    body([Break(None)]),
                    None,
                  ),
                ),
                Continue([
                  call("yy_stack_tail", [Ident("stack")]),
                  call("yy_stack_saved", [Ident("stack")]),
                ]),
              ]),
            ),
            LetMut("result", Some(list), call("@list.List", [Array([])])),
            For(
              [
                (
                  "i",
                  Binary(
                    Subtract,
                    dot_call(Ident("states"), "length", []),
                    Int(1),
                  ),
                ),
              ],
              Some(Binary(GreaterEqual, Ident("i"), Int(0))),
              [("i", Binary(Subtract, Ident("i"), Int(1)))],
              body([
                Assign(
                  Ident("result"),
                  call("@list.cons", [
                    Index(Ident("states"), Ident("i")),
                    Ident("result"),
                  ]),
                ),
              ]),
            ),
          ],
          result=Ident("result"),
        ),
        result=list,
      ),
    ),
  )
}

///|
fn Emitter::stack_helper_items(self : Emitter) -> Array[@mbt_ast.Item] {
  let needed = self.stack_helpers
  if needed.contains("drop") ||
    needed.contains("state") ||
    needed.contains("states") {
    needed.add("tail")
  }
  if needed.contains("state") || needed.contains("states") {
    needed.add("saved")
  }
  let items = []
  for name in ["tail", "saved", "end"] {
    if needed.contains(name) {
      items.push(self.stack_projection(name))
    }
  }
  if needed.contains("drop") {
    items.push(stack_drop_item())
  }
  if needed.contains("state") {
    items.push(stack_state_item())
  }
  if needed.contains("states") {
    items.push(stack_states_item())
  }
  items
}
