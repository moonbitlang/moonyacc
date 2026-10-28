///|
fn Context::parameter_value(
  self : Context,
  action : @elab.Action,
  parameter : ActionParameter,
) -> @mbt_ast.Expr {
  match parameter {
    Value(_, Constr(pkg=None, "Unit", [])) => Unit
    Position(_) if !self.tracks_positions() => Unit
    _ => Ident(self.typed_actions[action.stamp].parameter_name(parameter))
  }
}

///|
fn Context::typed_position(
  self : Context,
  action : @elab.Action,
  position : @elab.PositionExpr,
) -> @mbt_ast.Expr {
  self.position_expression(position, atom => {
    self.parameter_value(action, Position(atom))
  })
}

///|
pub fn Context::typed_action_items(self : Context) -> Array[@mbt_ast.Item] {
  let items = []
  for _, action in self.actions {
    let plan = self.typed_actions[action.stamp]
    let body : Array[@mbt_ast.Stmt] = []
    for index, sub in action.sub_actions {
      body.push(
        binding(
          plan.subactions[index],
          self.typed_action_call(sub.action, parameter => {
            self.parameter_value(action, parameter.rebase(sub.start))
          }),
        ),
      )
    }
    if !(action.body is JsonCst(_)) {
      for (subject, name) in action.bindings {
        let value = match subject {
          Data(index, type_~) =>
            self.parameter_value(action, Value(index, type_))
          SubAction(index~, ..) => @mbt_ast.Expr::Ident(plan.subactions[index])
          Position(position) => self.typed_position(action, position)
        }
        body.push(binding(name, value))
      }
    }
    let value = if action.body is JsonCst(_) {
      let children = @mbt_ast.Expr::Array(
        Array::makei(action.arity, index => {
          self.parameter_value(action, Value(index, named_type("Json", [])))
        }),
      )
      call(
        "yy_json_cst_action",
        self.json_arguments(
          action,
          position => self.typed_position(action, position),
          children,
        ),
      )
    } else {
      self.user_action(action)
    }
    items.push(
      @mbt_ast.item(
        Function(
          @mbt_ast.function(
            "yy_action_\{self.action_id(action)}",
            plan.parameters.map(pair => {
              let (parameter, name) = pair
              typed(
                name,
                match parameter {
                  Value(_, type_) => type_
                  Position(_) => self.meta.position_data_type
                },
              )
            }),
            statements(body, result=value),
            result=action.type_,
          ),
        ),
        comments=action_comments(action),
      ),
    )
  }
  items
}

///|
pub fn Context::is_json_cst(self : Context) -> Bool {
  self.mode is JsonCst
}

///|
pub fn Context::typed_action_runtime(self : Context) -> Array[@mbt_ast.Item] {
  if !self.is_json_cst() {
    return []
  }
  let parameters = [
    typed("name", named_type("Json", [])),
    typed("rule_index", named_type("Json", [])),
    typed("clause_index", named_type("Json", [])),
  ]
  if self.tracks_positions() {
    parameters.push(typed("start_pos", self.meta.position_data_type))
    parameters.push(typed("end_pos", self.meta.position_data_type))
  }
  parameters.push(
    typed("children", named_type("Array", [named_type("Json", [])])),
  )
  [
    @mbt_ast.item(
      Function(
        @mbt_ast.function(
          "yy_json_cst_action",
          parameters,
          value_block(
            self.json_cst_object(call("Json::array", [Ident("children")])),
          ),
          result=named_type("Json", []),
        ),
      ),
      attributes=[{ name: "inline", arguments: [Positional(Ident("never"))], }],
    ),
  ]
}
