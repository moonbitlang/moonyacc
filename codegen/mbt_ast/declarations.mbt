///|
fn function_doc(f : Function, prefix : String) -> Doc {
  let generics = if f.type_parameters.is_empty() {
    text("")
  } else {
    delimited(
      "[",
      "]",
      f.type_parameters.map(p => {
        if p.bounds.is_empty() {
          text(p.name)
        } else {
          cat([
            text(p.name + " : "),
            join_docs(p.bounds.map(type_doc), text(" + ")),
          ])
        }
      }),
    )
  }
  let effect = match f.effect {
    Default => text("")
    NoRaise => text(" noraise")
    Raises(type_) => cat([text(" raise "), type_doc(type_)])
  }
  let signature = Group(
    cat([
      text(prefix + "fn"),
      generics,
      text(" " + f.name),
      delimited("(", ")", f.parameters.map(parameter_doc)),
      f.result.map(t => cat([text(" -> "), type_doc(t)])).unwrap_or(text("")),
      effect,
    ]),
  )
  cat([signature, text(" "), block_doc(f.body)])
}

///|
fn item_doc(item : Item) -> Doc {
  let prefix = visibility(item.visibility)
  let attrs = item.attributes.map(a => {
    cat([
      text("#" + a.name),
      if a.arguments.is_empty() {
        text("")
      } else {
        delimited("(", ")", a.arguments.map(argument_doc))
      },
      HardLine,
    ])
  })
  let declaration = match item.declaration {
    Function(f) => function_doc(f, prefix)
    Struct(name, fields) =>
      cat([
        text(prefix + "struct " + name + " {"),
        Nest(
          cat([
            HardLine,
            join_docs(
              fields.map(f => {
                cat([
                  text((if f.mutable { "mut " } else { "" }) + f.name + " : "),
                  type_doc(f.type_),
                ])
              }),
              HardLine,
            ),
          ]),
        ),
        HardLine,
        text("}"),
      ])
    Enum(name, constructors, _) | Suberror(name, constructors, _) => {
      let keyword = if item.declaration is Suberror(_) {
        "suberror "
      } else {
        "enum "
      }
      let constructors = constructors.map(c => {
        if c.arguments.is_empty() {
          text(c.name)
        } else {
          cat([text(c.name), delimited("(", ")", c.arguments.map(type_doc))])
        }
      })
      let tail = match item.declaration {
        Enum(_, _, deriving) | Suberror(_, _, deriving) =>
          if deriving.is_empty() {
            text("")
          } else {
            cat([text(" derive"), delimited("(", ")", deriving.map(type_doc))])
          }
        _ => text("")
      }
      if constructors.is_empty() && item.declaration is Suberror(_) {
        cat([text(prefix + keyword + name), tail])
      } else {
        cat([
          text(prefix + keyword + name + " {"),
          Nest(cat([HardLine, join_docs(constructors, HardLine)])),
          HardLine,
          text("}"),
          tail,
        ])
      }
    }
    Init(body) => cat([text("fn init "), block_doc(body)])
    Extend(type_, trait_, methods) =>
      cat([
        text(prefix + "extend "),
        type_doc(type_),
        text(" with "),
        type_doc(trait_),
        text("::{"),
        join_docs(methods.map(text), text(", ")),
        text("}"),
      ])
    TypeAlias(name, type_) =>
      cat([text(prefix + "type " + name + " = "), type_doc(type_)])
    Global(name, type_, value) =>
      cat([
        text(prefix + "let " + name),
        type_.map(t => cat([text(" : "), type_doc(t)])).unwrap_or(text("")),
        text(" = "),
        expr_doc(value),
      ])
    Impl(trait_, self_type, f) =>
      cat([
        text(prefix + "impl "),
        type_doc(trait_),
        text(" for "),
        type_doc(self_type),
        text(" with "),
        function_doc(f, ""),
      ])
    Verbatim(fragment) => fragment_doc(fragment)
  }
  if item.declaration is Verbatim(_) {
    guard! item.visibility is Default &&
      item.attributes.is_empty() &&
      item.comments.is_empty()
    declaration
  } else {
    cat(
      [
        text("///|"),
        HardLine,
        ..item.comments.map(comment => {
          cat([stmt_doc(Comment(comment)), HardLine])
        }),
        ..attrs,
        declaration,
      ],
    )
  }
}
