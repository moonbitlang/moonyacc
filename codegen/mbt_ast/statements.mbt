///|
fn block_doc(block : Block) -> Doc {
  let docs = block.statements.map(stmt_doc)
  if block.result is Some(expr) {
    docs.push(expr_doc(expr))
  }
  if docs.is_empty() {
    return text("{ () }")
  }
  cat([
    text("{"),
    Nest(cat([HardLine, join_docs(docs, HardLine)])),
    HardLine,
    text("}"),
  ])
}

///|
/// Lambda and match bodies are expressions. A result alone needs no block;
/// otherwise use the same unambiguous block expression as Expr.Block.
fn body_expr_doc(body : Block) -> Doc {
  if body.statements.is_empty() && body.result is Some(expr) {
    expr_doc(expr)
  } else {
    expr_doc(Block(body))
  }
}

///|
fn assignment_target(expr : Expr) -> Doc {
  guard! expr is (Ident(_) | Field(_) | Index(_))
  expr_doc(expr)
}

///|
fn bindings_doc(bindings : Array[(String, Expr)]) -> Doc {
  join_docs(
    bindings.map(p => cat([text(p.0 + " = "), expr_doc(p.1)])),
    cat([text(","), SoftLine(" ")]),
  )
}

///|
fn stmt_doc(statement : Stmt) -> Doc {
  fn annotation(type_ : @elab.TypeExpr?) -> Doc {
    type_.map(t => cat([text(" : "), type_doc(t)])).unwrap_or(text(""))
  }
  match statement {
    Let(pattern, type_, value) =>
      cat([
        text("let "),
        pattern_doc(pattern),
        annotation(type_),
        text(" = "),
        expr_doc(value),
      ])
    LetMut(name, type_, value) =>
      cat([
        text("let mut " + name),
        annotation(type_),
        text(" = "),
        expr_doc(value),
      ])
    Assign(target, value) =>
      cat([assignment_target(target), text(" = "), expr_doc(value)])
    Augment(target, op, value) => {
      let (operator, _, _) = binary_info(op)
      guard! op
        is (Add
        | Subtract
        | Multiply
        | Divide
        | Modulo
        | BitAnd
        | BitOr
        | BitXor
        | ShiftLeft
        | ShiftRight)
      cat([
        assignment_target(target),
        text(" " + operator + "= "),
        expr_doc(value),
      ])
    }
    Eval(expr) => expr_doc(expr)
    Return(expr) => cat([text("return "), expr_doc(expr)])
    Raise(expr) => cat([text("raise "), expr_doc(expr)])
    Continue(args) =>
      if args.is_empty() {
        text("continue")
      } else {
        Group(
          cat([
            text("continue "),
            Nest(
              join_docs(
                args.map(x => expr_doc(x)),
                cat([text(","), SoftLine(" ")]),
              ),
            ),
          ]),
        )
      }
    ContinueTo(label, args) =>
      Group(
        cat([
          text("continue " + label + "~"),
          if args.is_empty() {
            text("")
          } else {
            cat([
              text(" "),
              Nest(
                join_docs(
                  args.map(x => expr_doc(x)),
                  cat([text(","), SoftLine(" ")]),
                ),
              ),
            ])
          },
        ]),
      )
    BreakTo(label, value) =>
      cat([
        text("break " + label + "~"),
        value.map(x => cat([text(" "), expr_doc(x)])).unwrap_or(text("")),
      ])
    LabelledLoop(label, statement) => {
      guard! statement is (For(_) | ForEach(_) | While(_))
      cat([text(label + "~: "), stmt_doc(statement)])
    }
    Break(value) =>
      cat([
        text("break"),
        value.map(x => cat([text(" "), expr_doc(x)])).unwrap_or(text("")),
      ])
    Assert(condition) => cat([text("guard! "), expr_doc(condition)])
    Guard(condition, otherwise) =>
      cat([
        text("guard "),
        expr_doc(condition),
        text(" else "),
        block_doc(otherwise),
      ])
    While(condition, body) =>
      cat([text("while "), expr_doc(condition), text(" "), block_doc(body)])
    For(initial, condition, updates, body) => {
      let parts = [text("for "), bindings_doc(initial)]
      if condition is Some(expr) {
        parts.push(text("; "))
        parts.push(expr_doc(expr))
      }
      if !updates.is_empty() {
        if condition is None {
          parts.push(text(";"))
        }
        parts.push(text("; "))
        parts.push(bindings_doc(updates))
      }
      cat([Group(cat(parts)), text(" "), block_doc(body)])
    }
    ForEach(patterns, values, body) =>
      cat([
        text("for "),
        join_docs(patterns.map(p => pattern_doc(p)), text(", ")),
        text(" in "),
        expr_doc(values),
        text(" "),
        block_doc(body),
      ])
    LocalFunction(f) => function_doc(f, "")
    Comment(comment) =>
      join_docs(
        comment
        .replace_all(old="\r\n", new="\n")
        .replace_all(old="\r", new="\n")
        .split("\n")
        .map(s => text("// " + s.to_owned()))
        .to_array(),
        HardLine,
      )
  }
}
