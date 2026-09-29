///|
pub fn token_items(
  terminals : Array[@grm.Terminal],
  terminal_meta : (String) -> @codegen.TerminalMeta,
  derive_map~ : @array_multimap.T[String, String],
) -> Array[@mbt_ast.Item] {
  let token_traits = derive_map.get("Token")
  let kind_traits = derive_map.get("TokenKind")
  let items = [
    @mbt_ast.item(
      Enum(
        "Token",
        terminals.map(t => {
          let type_ = terminal_meta(t.name).data_type
          ctor(
            t.name,
            if type_ is Constr(pkg=None, "Unit", []) {
              []
            } else {
              [type_]
            },
          )
        }),
        token_traits.map(t => named_type(t, [])),
      ),
      visibility=PublicAll,
    ),
  ]
  items.append(derived_extensions("Token", token_traits))
  let kind_arms = terminals.map(t => {
    let pattern = if terminal_meta(t.name).data_type
      is Constr(pkg=None, "Unit", []) {
      pat(t.name, [])
    } else {
      pat(t.name, [Any])
    }
    (pattern, value_block(Ident("TK_" + t.name)))
  })
  items.push(
    @mbt_ast.item(
      Function(
        @mbt_ast.function(
          "Token::kind",
          [typed("self", named_type("Token", []))],
          value_block(Match(Ident("self"), kind_arms)),
          result=named_type("TokenKind", []),
        ),
      ),
      visibility=Public,
    ),
  )
  items.push(
    @mbt_ast.item(
      Enum(
        "TokenKind",
        terminals.map(t => ctor("TK_" + t.name, [])),
        kind_traits.map(t => named_type(t, [])),
      ),
      visibility=PublicAll,
    ),
  )
  items.append(derived_extensions("TokenKind", kind_traits))
  items.push(extension("TokenKind", "Show", ["output", "to_string"]))
  items.push(
    @mbt_ast.item(
      Impl(
        named_type("Show", []),
        named_type("TokenKind", []),
        @mbt_ast.function(
          "output",
          [Positional("self", None), Positional("logger", None)],
          value_block(
            call("Logger::write_string", [
              Ident("logger"),
              Match(
                Ident("self"),
                terminals.map(t => {
                  (
                    pat("TK_" + t.name, []),
                    value_block(
                      String(terminal_meta(t.name).image.unwrap_or(t.name)),
                    ),
                  )
                }),
              ),
            ]),
          ),
        ),
      ),
      visibility=Public,
    ),
  )
  items.push(extension("TokenKind", "Debug", ["to_repr"]))
  items.push(
    @mbt_ast.item(
      Impl(
        named_type("Debug", []),
        named_type("TokenKind", []),
        @mbt_ast.function(
          "to_repr",
          [Positional("self", None)],
          value_block(
            Match(
              Ident("self"),
              terminals.map(t => {
                let name = match terminal_meta(t.name).image {
                  Some(image) =>
                    if image is ['\"', .. rest] && rest is [.. rest, '\"'] {
                      rest.to_owned()
                    } else {
                      image
                    }
                  None => t.name
                }
                (
                  pat("TK_" + t.name, []),
                  value_block(call("Repr", [String(name)])),
                )
              }),
            ),
          ),
        ),
      ),
      visibility=Public,
    ),
  )
  items
}

///|
pub fn Context::prelude(
  self : Context,
  external_tokens~ : Bool,
) -> Array[@mbt_ast.Item] {
  let items = []
  if !self.meta.header.is_empty() {
    items.push(
      @mbt_ast.item(
        Verbatim(
          @mbt_ast.fragment(
            self.meta.header.iter().to_array(),
            source=self.filename,
          ),
        ),
      ),
    )
  }
  if !external_tokens {
    items.append(
      token_items(
        self.grammar.terminals,
        self.meta.terminal_meta,
        derive_map=self.meta.derive_map,
      ),
    )
  }
  let position = self.meta.position_data_type
  let errors = [
    ctor("UnexpectedToken", [
      named_type("Token", []),
      Tuple([position, position]),
      named_type("Array", [named_type("TokenKind", [])]),
    ]),
  ]
  if self.input_mode is Array {
    errors.push(
      ctor("UnexpectedEndOfInput", [
        position,
        named_type("Array", [named_type("TokenKind", [])]),
      ]),
    )
  }
  let error_traits = self.meta.derive_map.get("ParseError")
  items.push(
    @mbt_ast.item(
      Suberror("ParseError", errors, error_traits.map(t => named_type(t, []))),
      visibility=Public,
    ),
  )
  items.append(derived_extensions("ParseError", error_traits))
  items.push(@mbt_ast.item(TypeAlias("YYObj", named_type("Error", []))))
  if self.mode is Default || self.input_mode is Array {
    items.push(
      @mbt_ast.item(Suberror("YYObj_Void", [], []), visibility=Private),
    )
  }
  let types = @sorted_set.SortedSet([])
  match self.mode {
    Default => {
      for terminal in self.grammar.terminals {
        let type_ = (self.meta.terminal_meta)(terminal.name).data_type
        if !(type_ is Constr(pkg=None, "Unit", [])) {
          types.add(type_)
        }
      }
      for _, action in self.actions {
        for (subject, _) in action.bindings {
          if subject is Data(_, type_~) &&
            !(type_ is Constr(pkg=None, "Unit", [])) {
            types.add(type_)
          }
        }
        types.add(action.type_)
      }
    }
    JsonCst => types.add(named_type("Json", []))
  }
  for type_ in types {
    let name = "YYObj_" + type_ident(type_)
    items.push(
      @mbt_ast.item(
        Suberror(name, [ctor(name, [type_])], []),
        visibility=Private,
      ),
    )
  }
  items
}

///|
pub fn Context::input_function(
  self : Context,
  engine : Engine,
) -> @mbt_ast.Item {
  let arms = self.grammar.terminals.map(t => {
    let type_ = (self.meta.terminal_meta)(t.name).data_type
    let unit = type_ is Constr(pkg=None, "Unit", [])
    let pattern = pat(t.name, if unit { [] } else { [Bind("data")] })
    let payload : @mbt_ast.Expr = match self.mode {
      Default =>
        if unit {
          Ident("YYObj_Void")
        } else {
          call("YYObj_" + type_ident(type_), [Ident("data")])
        }
      JsonCst =>
        call("YYObj_Json", [
          Map([
            (String("type"), String("TERMINAL")),
            (String("name"), String(t.name)),
            (
              String("data"),
              if unit {
                call("Json::null", [])
              } else {
                call("ToJson::to_json", [Ident("data")])
              },
            ),
            (String("start"), call("ToJson::to_json", [Ident("_start_pos")])),
            (String("end"), call("ToJson::to_json", [Ident("_end_pos")])),
          ]),
        ])
    }
    (pattern, value_block(Tuple([engine.terminal(t), payload])))
  })
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_input",
        [
          typed("token", named_type("Token", [])),
          typed("_start_pos", self.meta.position_data_type),
          typed("_end_pos", self.meta.position_data_type),
        ],
        value_block(Match(Ident("token"), arms)),
        result=Tuple([named_type("YYSymbol", []), named_type("YYObj", [])]),
      ),
    ),
  )
}

///|
pub fn Context::footer(self : Context) -> Array[@mbt_ast.Item] {
  if self.meta.footer.is_empty() {
    []
  } else {
    [
      @mbt_ast.item(
        Verbatim(
          @mbt_ast.fragment(
            self.meta.footer.iter().to_array(),
            source=self.filename,
          ),
        ),
      ),
    ]
  }
}
