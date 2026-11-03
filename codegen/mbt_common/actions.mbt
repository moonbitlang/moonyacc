///|
pub fn Context::action_items(self : Context) -> Array[@mbt_ast.Item] {
  let items = []
  for _, action in self.actions {
    let body : Array[@mbt_ast.Stmt] = []
    for index, sub in action.sub_actions {
      let last = if sub.start == 0 {
        @mbt_ast.Expr::Ident("_last_pos")
      } else {
        self.data_position(Index(Ident("_args"), Int(sub.start - 1)), 2)
      }
      body.push(
        binding(
          "_sub_action_\{index}_result",
          self.action_call(
            sub.action,
            last,
            Slice(Ident("_args"), Some(Int(sub.start)), Some(Int(sub.end))),
          ),
        ),
      )
    }
    fn unbox(name : String, value : @mbt_ast.Expr, type_ : @elab.TypeExpr) {
      if type_ is Constr(pkg=None, "Unit", []) {
        body.push(binding(name, Unit))
      } else {
        body.push(
          Assert(Is(value, pat("YYObj_" + type_ident(type_), [Bind(name)]))),
        )
      }
    }
    // Only source-used position bindings are emitted. JSON CST obtains its
    // enclosing extent directly from the production's normalized span.
    let bindings = if action.body is JsonCst(_) { [] } else { action.bindings }
    for (subject, name) in bindings {
      match subject {
        Data(index, type_~) =>
          unbox(name, self.data_value(Index(Ident("_args"), Int(index))), type_)
        SubAction(index~, type_~) =>
          unbox(name, Ident("_sub_action_\{index}_result"), type_)
        Position(position) =>
          body.push(binding(name, self.position_expr(position)))
      }
    }
    items.push(
      @mbt_ast.item(
        Function(
          @mbt_ast.function(
            "yy_action_\{self.action_id(action)}",
            if self.action_uses_before_rhs(action) {
              [
                typed("_last_pos", self.meta.position_data_type),
                typed("_args", named_type("ArrayView", [self.data_type()])),
              ]
            } else {
              [typed("_args", named_type("ArrayView", [self.data_type()]))]
            },
            statements(body, result=self.action_body(action)),
            result=named_type("YYObj", []),
          ),
        ),
        comments=action_comments(action),
      ),
    )
  }

  items
}

///|
fn Context::action_body(self : Context, action : @elab.Action) -> @mbt_ast.Expr {
  if action.body is JsonCst(_) {
    call(
      "yy_json_cst_action",
      self.json_arguments(
        action,
        position => self.position_expr(position),
        Ident("_args"),
      ),
    )
  } else {
    call("YYObj_" + type_ident(action.type_), [self.user_action(action)])
  }
}

///|
fn Context::json_cst_action(self : Context) -> @mbt_ast.Item {
  let parameters = [
    typed("name", named_type("Json", [])),
    typed("rule_index", named_type("Json", [])),
    typed("clause_index", named_type("Json", [])),
  ]
  if self.tracks_positions() {
    parameters.push(typed("start_pos", self.meta.position_data_type))
    parameters.push(typed("end_pos", self.meta.position_data_type))
  }
  parameters.push(typed("_args", named_type("ArrayView", [self.data_type()])))
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_json_cst_action",
        parameters,
        value_block(
          call("YYObj_Json", [
            self.json_cst_object(call("args_to_json", [Ident("_args")])),
          ]),
        ),
        result=named_type("YYObj", []),
      ),
    ),
    // Keep the shared construction code from being copied into every wrapper.
    attributes=[{ name: "inline", arguments: [Positional(Ident("never"))], }],
  )
}

///|
pub fn Context::action_runtime(self : Context) -> Array[@mbt_ast.Item] {
  let items = []
  if self.mode is JsonCst {
    items.push(self.json_cst_action())
    let decode : @mbt_ast.Expr = Lambda(
      [Positional("it", None)],
      statements(
        [
          Assert(
            Is(self.data_value(Ident("it")), pat("YYObj_Json", [Bind("json")])),
          ),
        ],
        result=Ident("json"),
      ),
    )
    let values = dot_call(
      dot_call(dot_call(Ident("args"), "iter", []), "map", [decode]),
      "to_array",
      [],
    )
    items.push(
      @mbt_ast.item(
        Function(
          @mbt_ast.function(
            "args_to_json",
            [typed("args", named_type("ArrayView", [self.data_type()]))],
            value_block(call("Json::array", [values])),
            result=named_type("Json", []),
          ),
        ),
      ),
    )
  }
  items
}
