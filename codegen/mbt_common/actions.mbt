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
          call(
            "yy_action_\{self.action_id(sub.action)}",
            self.action_arguments(
              last,
              Slice(Ident("_args"), Some(Int(sub.start)), Some(Int(sub.end))),
            ),
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
    let clause = action.original_clause_info
    // Normalize preview line endings before splitting; otherwise a trailing
    // CR becomes an extra line when the comment renderer processes it.
    let lines = clause.code
      .replace_all(old="\r\n", new="\n")
      .split("\n")
      .to_array()
    let digits = Show::to_string(clause.line + lines.length()).length()
    let comments = ["file:///./" + clause.file]
    for i, line in lines {
      comments.push(
        Show::to_string(clause.line + i + 1).pad_start(digits, ' ') +
        "|" +
        (if i == 0 { " ".repeat(clause.column) } else { "" }) +
        line.to_owned(),
      )
    }
    items.push(
      @mbt_ast.item(
        Function(
          @mbt_ast.function(
            "yy_action_\{self.action_id(action)}",
            if self.pass_before_rhs {
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
        comments~,
      ),
    )
  }
  if self.override_span_start {
    for _, action in self.reductions {
      // Inlining preserves the end of the physical RHS. Its start is either
      // the first physical symbol or the anchor of an erased epsilon prefix.
      guard! action.span.0 is (BeforeRhs | StartOf(0))
      guard! action.span.1 ==
        (if action.arity == 0 {
          @elab.PositionExpr::BeforeRhs
        } else {
          EndOf(action.arity - 1)
        })
      items.push(
        @mbt_ast.item(
          Global(
            "yy_reduction_\{self.action_id(action)}",
            Some(named_type("YYReduction", [])),
            Record(None, [
              ("action", Ident("yy_action_\{self.action_id(action)}")),
              ("start_before_rhs", Bool(action.span.0 is BeforeRhs)),
            ]),
          ),
        ),
      )
    }
  }
  items
}

///|
fn Context::action_body(self : Context, action : @elab.Action) -> @mbt_ast.Expr {
  let value : @mbt_ast.Expr = match action.body {
    Default => Unit
    User(pieces) => {
      let pieces = pieces.map(piece => {
        match piece {
          Text(text, offset~) =>
            @mbt_ast.Piece::Text(
              text,
              Some({ source: self.filename, offset, length: text.length(), }),
            )
          Reference(reference, offset~, length~) => {
            let expr : @mbt_ast.Expr = match reference {
              Binding(name) => Ident(name)
              Location(start, end) => Tuple([Ident(start), Ident(end)])
            }
            @mbt_ast.Piece::Splice(
              expr,
              Some({ source: self.filename, offset, length, }),
            )
          }
        }
      })
      Verbatim(@mbt_ast.Fragment(pieces))
    }
    JsonCst(name~, rule_index~, clause_index~) => {
      let args : Array[@mbt_ast.Expr] = [
        String(name),
        Int(rule_index),
        Int(clause_index),
      ]
      if self.tracks_positions() {
        args.push(self.position_expr(action.span.0))
        args.push(self.position_expr(action.span.1))
      }
      args.push(Ident("_args"))
      return call("yy_json_cst_action", args)
    }
  }
  call("YYObj_" + type_ident(action.type_), [value])
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
            Map([
              (String("type"), String("NONTERMINAL")),
              (String("name"), Ident("name")),
              (String("rule_index"), Ident("rule_index")),
              (String("clause_index"), Ident("clause_index")),
              (String("children"), call("args_to_json", [Ident("_args")])),
              (
                String("start"),
                call("ToJson::to_json", [
                  if self.tracks_positions() {
                    Ident("start_pos")
                  } else {
                    Unit
                  },
                ]),
              ),
              (
                String("end"),
                call("ToJson::to_json", [
                  if self.tracks_positions() {
                    Ident("end_pos")
                  } else {
                    Unit
                  },
                ]),
              ),
            ]),
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
