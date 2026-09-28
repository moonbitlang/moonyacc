///|
fn quoted(value : String, quote : Char) -> String {
  let buffer = StringBuilder()
  buffer.write_char(quote)
  for c in value {
    if c == quote || c == '\\' {
      buffer.write_char('\\')
      buffer.write_char(c)
    } else {
      match c {
        '\n' => buffer.write_string("\\n")
        '\r' => buffer.write_string("\\r")
        '\t' => buffer.write_string("\\t")
        _ =>
          if c < ' ' || c == '\u007f' {
            let digits = [
              "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d",
              "e", "f",
            ]
            let code = c.to_int()
            buffer.write_string(
              "\\u{" + digits[code >> 4] + digits[code & 15] + "}",
            )
          } else {
            buffer.write_char(c)
          }
      }
    }
  }
  buffer.write_char(quote)
  buffer.to_string()
}

///|
fn type_doc(type_ : @elab.TypeExpr) -> Doc {
  match type_ {
    Constr(pkg~, name, args) => {
      let name = match pkg {
        None => name
        Some(pkg) => "@\{pkg}.\{name}"
      }
      if args.is_empty() {
        text(name)
      } else {
        cat([text(name), delimited("[", "]", args.map(type_doc))])
      }
    }
    Param(name) => text(name)
    Option(type_) => cat([type_doc(type_), text("?")])
    Tuple(types) => delimited("(", ")", types.map(type_doc))
    // Parenthesizing arrow types makes them safe in every type position,
    // including function results and optional function types.
    Arrow(args, result) =>
      parens(
        cat([
          delimited("(", ")", args.map(type_doc)),
          text(" -> "),
          type_doc(result),
        ]),
      )
  }
}

///|
fn parameter_doc(parameter : Parameter) -> Doc {
  fn annotated(name : String, type_ : @elab.TypeExpr?) -> Doc {
    match type_ {
      None => text(name)
      Some(type_) => cat([text(name + " : "), type_doc(type_)])
    }
  }
  match parameter {
    Positional(name, type_) => annotated(name, type_)
    Labelled(name, type_) => annotated(name + "~", type_)
    Optional(name, type_, default_) => {
      let doc = annotated(name + "?", Some(type_))
      match default_ {
        None => doc
        Some(expr) => cat([doc, text(" = "), expr_doc(expr)])
      }
    }
  }
}

///|
fn argument_doc(argument : Argument) -> Doc {
  match argument {
    Positional(expr) => expr_doc(expr)
    Labelled(name, expr) => cat([text(name + "="), expr_doc(expr)])
    ForwardOptional(name) => text(name + "?")
  }
}

///|
fn pattern_doc(pattern : Pattern, nested? : Bool = false) -> Doc {
  match pattern {
    Any => text("_")
    Bind(name) => text(name)
    Int(value) => text(Show::to_string(value))
    Bool(value) => text(Show::to_string(value))
    String(value) => text(quoted(value, '"'))
    Tuple(patterns) =>
      delimited("(", ")", patterns.map(p => pattern_doc(p, nested=true)))
    Constructor(name, arguments) =>
      if arguments.is_empty() {
        text(name)
      } else {
        cat([
          text(name),
          delimited("(", ")", arguments.map(p => pattern_doc(p, nested=true))),
        ])
      }
    Or(patterns) => {
      guard! !patterns.is_empty()
      let doc = join_docs(
        patterns.map(p => pattern_doc(p, nested=true)),
        text(" | "),
      )
      if nested {
        parens(doc)
      } else {
        doc
      }
    }
    As(pattern, name) => {
      let doc = cat([pattern_doc(pattern, nested=true), text(" as " + name)])
      if nested {
        parens(doc)
      } else {
        doc
      }
    }
    Rest => text("..")
    Range(start, end, inclusive) =>
      text(
        Show::to_string(start) +
        (if inclusive { "..=" } else { "..<" }) +
        end.map(Show::to_string).unwrap_or("_"),
      )
  }
}

///|
/// Binding powers follow MoonBit's operator classes. && and || associate right.
fn binary_info(op : BinaryOp) -> (String, Int, Bool) {
  match op {
    Or => ("||", 10, true)
    And => ("&&", 20, true)
    BitOr => ("|", 30, false)
    BitXor => ("^", 40, false)
    BitAnd => ("&", 50, false)
    Equal => ("==", 60, false)
    NotEqual => ("!=", 60, false)
    Less => ("<", 60, false)
    LessEqual => ("<=", 60, false)
    Greater => (">", 60, false)
    GreaterEqual => (">=", 60, false)
    ShiftLeft => ("<<", 70, false)
    ShiftRight => (">>", 70, false)
    Add => ("+", 80, false)
    Subtract => ("-", 80, false)
    Multiply => ("*", 90, false)
    Divide => ("/", 90, false)
    Modulo => ("%", 90, false)
  }
}

///|
fn accessor(field : Accessor) -> String {
  match field {
    Named(name) => name
    Tuple(index) => {
      guard! index >= 0
      Show::to_string(index)
    }
  }
}

///|
fn expr_doc(expr : Expr, minimum? : Int = 0) -> Doc {
  let (doc, precedence) : (Doc, Int) = match expr {
    Ident(name) => (text(name), 140)
    Int(value) =>
      (text(Show::to_string(value)), if value < 0 { 120 } else { 140 })
    Bool(value) => (text(Show::to_string(value)), 140)
    String(value) => (text(quoted(value, '"')), 140)
    Char(value) => (text(quoted(String::from_array([value]), '\'')), 140)
    Unit => (text("()"), 140)
    Call(callee, arguments) => {
      // a.f() is method dispatch in MoonBit; (a.f)() calls a stored function.
      let callee_doc = if callee is Field(_) {
        parens(expr_doc(callee))
      } else {
        expr_doc(callee, minimum=130)
      }
      (cat([callee_doc, delimited("(", ")", arguments.map(argument_doc))]), 130)
    }
    MethodCall(receiver, name, arguments) =>
      (
        cat([
          expr_doc(receiver, minimum=130),
          text("." + name),
          delimited("(", ")", arguments.map(argument_doc)),
        ]),
        130,
      )
    Field(receiver, field) =>
      (cat([expr_doc(receiver, minimum=130), text("." + accessor(field))]), 130)
    Index(array, index) =>
      (
        cat([
          expr_doc(array, minimum=130),
          text("["),
          expr_doc(index),
          text("]"),
        ]),
        130,
      )
    Slice(array, start, end) =>
      (
        cat([
          expr_doc(array, minimum=130),
          text("["),
          start.map(x => expr_doc(x)).unwrap_or(text("")),
          text(":"),
          end.map(x => expr_doc(x)).unwrap_or(text("")),
          text("]"),
        ]),
        130,
      )
    Range(start, end, inclusive) =>
      (
        cat([
          expr_doc(start, minimum=120),
          text(if inclusive { "..=" } else { "..<" }),
          expr_doc(end, minimum=120),
        ]),
        110,
      )
    Binary(op, left, right) => {
      let (operator, power, right_assoc) = binary_info(op)
      (
        Group(
          cat([
            expr_doc(left, minimum=power + (if right_assoc { 1 } else { 0 })),
            text(" " + operator),
            Nest(
              cat([
                SoftLine(" "),
                expr_doc(
                  right,
                  minimum=power + (if right_assoc { 0 } else { 1 }),
                ),
              ]),
            ),
          ]),
        ),
        power,
      )
    }
    Unary(op, expr) =>
      (
        cat([
          text(
            match op {
              Negate => "-"
              Not => "!"
            },
          ),
          expr_doc(expr, minimum=121),
        ]),
        120,
      )
    Tuple(values) => (delimited("(", ")", values.map(x => expr_doc(x))), 140)
    Array(values) => (delimited("[", "]", values.map(x => expr_doc(x))), 140)
    Map(entries) =>
      (
        delimited(
          "{",
          "}",
          entries.map(p => cat([expr_doc(p.0), text(": "), expr_doc(p.1)])),
        ),
        140,
      )
    Record(type_, fields) => {
      guard! type_ is Some(_) || !fields.is_empty()
      let prefix = type_
        .map(t => cat([type_doc(t), text("::")]))
        .unwrap_or(text(""))
      (
        cat([
          prefix,
          delimited(
            "{",
            "}",
            fields.map(p => cat([text(p.0 + ": "), expr_doc(p.1)])),
          ),
        ]),
        140,
      )
    }
    Ascribe(expr, type_) =>
      (parens(cat([expr_doc(expr), text(" : "), type_doc(type_)])), 140)
    Is(expr, pattern) =>
      (
        cat([
          expr_doc(expr, minimum=110),
          text(" is "),
          pattern_doc(pattern, nested=true),
        ]),
        100,
      )
    Lambda(parameters, body) =>
      (
        Group(
          cat([
            delimited("(", ")", parameters.map(parameter_doc)),
            text(" =>"),
            Nest(cat([SoftLine(" "), body_expr_doc(body)])),
          ]),
        ),
        0,
      )
    If(condition, yes, no) => {
      let doc = cat([
        text("if "),
        expr_doc(condition),
        text(" "),
        block_doc(yes),
      ])
      (
        match no {
          None => doc
          Some(no) => cat([doc, text(" else "), block_doc(no)])
        },
        0,
      )
    }
    Match(value, arms) =>
      (
        cat([
          text("match "),
          expr_doc(value),
          text(" {"),
          Nest(
            cat([
              HardLine,
              join_docs(
                arms.map(a => {
                  Group(
                    cat([
                      pattern_doc(a.0),
                      text(" =>"),
                      Nest(cat([SoftLine(" "), body_expr_doc(a.1)])),
                    ]),
                  )
                }),
                HardLine,
              ),
            ]),
          ),
          HardLine,
          text("}"),
        ]),
        0,
      )
    Block(body) =>
      // A leading unit makes every block unambiguous with record literals,
      // without inspecting which statements or final expression it contains.
      (
        parens(
          block_doc({
            statements: [Eval(Unit), ..body.statements],
            result: body.result,
          }),
        ),
        140,
      )
    Verbatim(fragment) =>
      (cat([text("({(); "), fragment_doc(fragment), HardLine, text("})")]), 140)
  }
  if precedence < minimum {
    parens(doc)
  } else {
    doc
  }
}
