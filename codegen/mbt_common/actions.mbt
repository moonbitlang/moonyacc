///|
pub fn Context::action_items(self : Context) -> Array[@mbt_ast.Item] {
  let items = []
  for _, action in self.actions {
    let body : Array[@mbt_ast.Stmt] = []
    for index, sub in action.sub_actions {
      let last = if sub.start == 0 {
        @mbt_ast.Expr::Ident("_last_pos")
      } else {
        component(Index(Ident("_args"), Int(sub.start - 1)), 2)
      }
      body.push(
        binding(
          "_sub_action_\{index}_result",
          call("yy_action_\{self.action_id(sub.action)}", [
            last,
            Slice(Ident("_args"), Some(Int(sub.start)), Some(Int(sub.end))),
          ]),
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
    let empty_args : @mbt_ast.Expr = Binary(
      Equal,
      dot_call(Ident("_args"), "length", []),
      Int(0),
    )
    let last_index : @mbt_ast.Expr = Binary(
      Subtract,
      dot_call(Ident("_args"), "length", []),
      Int(1),
    )
    // JSON CST positions are computed by the shared helper. Subactions above
    // still run in their original order before the enclosing action.
    let bindings = if action.body is JsonCst(_) { [] } else { action.bindings }
    for (subject, name) in bindings {
      match subject {
        Data(index, type_~) =>
          unbox(name, component(Index(Ident("_args"), Int(index)), 0), type_)
        SubAction(index~, type_~) =>
          unbox(name, Ident("_sub_action_\{index}_result"), type_)
        StartPos =>
          body.push(
            binding(
              name,
              If(
                empty_args,
                value_block(Ident("_last_pos")),
                Some(value_block(component(Index(Ident("_args"), Int(0)), 1))),
              ),
            ),
          )
        EndPos =>
          body.push(
            binding(
              name,
              If(
                empty_args,
                value_block(Ident("_last_pos")),
                Some(
                  value_block(component(Index(Ident("_args"), last_index), 2)),
                ),
              ),
            ),
          )
        StartPosOf(index) | EndPosOf(index) =>
          body.push(
            binding(
              name,
              if action.arity == 0 {
                Ident("_last_pos")
              } else {
                component(
                  Index(Ident("_args"), Int(index)),
                  if subject is StartPosOf(_) {
                    1
                  } else {
                    2
                  },
                )
              },
            ),
          )
        SymbolStartPos => {
          self.needs_symbol_start = true
          body.push(
            binding(
              name,
              call("_get_symbol_start_pos", [Ident("_args"), Ident("_last_pos")]),
            ),
          )
        }
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
            [
              typed("_last_pos", self.meta.position_data_type),
              typed("_args", named_type("ArrayView", [self.data_type()])),
            ],
            statements(body, result=self.action_body(action)),
            result=named_type("YYObj", []),
          ),
        ),
        comments~,
      ),
    )
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
    JsonCst(name~, rule_index~, clause_index~) =>
      return call("yy_json_cst_action", [
        String(name),
        Int(rule_index),
        Int(clause_index),
        Ident("_last_pos"),
        Ident("_args"),
      ])
  }
  call("YYObj_" + type_ident(action.type_), [value])
}

///|
fn Context::json_cst_action(self : Context) -> @mbt_ast.Item {
  let positions : @mbt_ast.Expr = If(
    Binary(Equal, dot_call(Ident("_args"), "length", []), Int(0)),
    value_block(Tuple([Ident("_last_pos"), Ident("_last_pos")])),
    Some(
      value_block(
        Tuple([
          component(Index(Ident("_args"), Int(0)), 1),
          component(
            Index(
              Ident("_args"),
              Binary(Subtract, dot_call(Ident("_args"), "length", []), Int(1)),
            ),
            2,
          ),
        ]),
      ),
    ),
  )
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_json_cst_action",
        [
          // Accept JSON literals so each wrapper can pass constant metadata.
          typed("name", named_type("Json", [])),
          typed("rule_index", named_type("Json", [])),
          typed("clause_index", named_type("Json", [])),
          typed("_last_pos", self.meta.position_data_type),
          typed("_args", named_type("ArrayView", [self.data_type()])),
        ],
        statements(
          [Let(Tuple([Bind("start_pos"), Bind("end_pos")]), None, positions)],
          result=call("YYObj_Json", [
            Map([
              (String("type"), String("NONTERMINAL")),
              (String("name"), Ident("name")),
              (String("rule_index"), Ident("rule_index")),
              (String("clause_index"), Ident("clause_index")),
              (String("children"), call("args_to_json", [Ident("_args")])),
              (String("start"), call("ToJson::to_json", [Ident("start_pos")])),
              (String("end"), call("ToJson::to_json", [Ident("end_pos")])),
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
  let position = self.meta.position_data_type
  if self.needs_symbol_start {
    let body = statements(
      [
        For(
          [("i", Int(0))],
          Some(Binary(Less, Ident("i"), dot_call(Ident("args"), "length", []))),
          [("i", Binary(Add, Ident("i"), Int(1)))],
          statements([
            Let(
              Tuple([Any, Bind("start_pos"), Bind("end_pos")]),
              None,
              Index(Ident("args"), Ident("i")),
            ),
            Eval(
              If(
                Binary(Equal, Ident("start_pos"), Ident("end_pos")),
                statements([Continue([])]),
                None,
              ),
            ),
            Return(Ident("start_pos")),
          ]),
        ),
      ],
      result=component(
        Index(
          Ident("args"),
          Binary(Subtract, dot_call(Ident("args"), "length", []), Int(1)),
        ),
        2,
      ),
    )
    items.push(
      @mbt_ast.item(
        Function(
          @mbt_ast.function(
            "_get_symbol_start_pos",
            [
              typed("args", named_type("ArrayView", [self.data_type()])),
              typed("last_pos", position),
            ],
            value_block(
              If(
                Binary(Equal, dot_call(Ident("args"), "length", []), Int(0)),
                value_block(Ident("last_pos")),
                Some(body),
              ),
            ),
            result=position,
          ),
        ),
      ),
    )
  }
  if self.mode is JsonCst {
    items.push(self.json_cst_action())
    let decode : @mbt_ast.Expr = Lambda(
      [Positional("it", None)],
      statements(
        [
          Assert(
            Is(component(Ident("it"), 0), pat("YYObj_Json", [Bind("json")])),
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
