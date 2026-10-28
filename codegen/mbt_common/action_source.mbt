///|
fn action_comments(action : @elab.Action) -> Array[String] {
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
  comments
}

///|
fn Context::user_action(self : Context, action : @elab.Action) -> @mbt_ast.Expr {
  match action.body {
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
    JsonCst(_) => abort("expected user action")
  }
}

///|
fn Context::json_arguments(
  self : Context,
  action : @elab.Action,
  position : (@elab.PositionExpr) -> @mbt_ast.Expr,
  children : @mbt_ast.Expr,
) -> Array[@mbt_ast.Expr] {
  guard! action.body is JsonCst(name~, rule_index~, clause_index~)
  let args : Array[@mbt_ast.Expr] = [
    String(name),
    Int(rule_index),
    Int(clause_index),
  ]
  if self.tracks_positions() {
    args.push(position(action.span.0))
    args.push(position(action.span.1))
  }
  args.push(children)
  args
}

///|
fn Context::json_cst_object(
  self : Context,
  children : @mbt_ast.Expr,
) -> @mbt_ast.Expr {
  Map([
    (String("type"), String("NONTERMINAL")),
    (String("name"), Ident("name")),
    (String("rule_index"), Ident("rule_index")),
    (String("clause_index"), Ident("clause_index")),
    (String("children"), children),
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
  ])
}
