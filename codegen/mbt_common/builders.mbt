///|
pub fn named_type(
  name : String,
  arguments : Array[@elab.TypeExpr],
) -> @elab.TypeExpr {
  if name.has_prefix("@") && name.find(".") is Some(dot) {
    Constr(
      pkg=Some(name[1:dot].to_owned()),
      name[dot + 1:].to_owned(),
      arguments,
    )
  } else {
    Constr(pkg=None, name, arguments)
  }
}

///|
pub fn call(name : String, arguments : Array[@mbt_ast.Expr]) -> @mbt_ast.Expr {
  apply(Ident(name), arguments)
}

///|
fn apply(
  callee : @mbt_ast.Expr,
  arguments : Array[@mbt_ast.Expr],
) -> @mbt_ast.Expr {
  Call(callee, arguments.map(x => @mbt_ast.Argument::Positional(x)))
}

///|
fn dot_call(
  receiver : @mbt_ast.Expr,
  name : String,
  arguments : Array[@mbt_ast.Expr],
) -> @mbt_ast.Expr {
  MethodCall(
    receiver,
    name,
    arguments.map(x => @mbt_ast.Argument::Positional(x)),
  )
}

///|
fn component(value : @mbt_ast.Expr, index : Int) -> @mbt_ast.Expr {
  Field(value, Tuple(index))
}

///|
pub fn value_block(value : @mbt_ast.Expr) -> @mbt_ast.Block {
  { statements: [], result: Some(value), }
}

///|
fn statements(
  body : Array[@mbt_ast.Stmt],
  result? : @mbt_ast.Expr,
) -> @mbt_ast.Block {
  { statements: body, result, }
}

///|
fn typed(name : String, type_ : @elab.TypeExpr) -> @mbt_ast.Parameter {
  Positional(name, Some(type_))
}

///|
fn binding(
  name : String,
  value : @mbt_ast.Expr,
  type_? : @elab.TypeExpr,
) -> @mbt_ast.Stmt {
  Let(Bind(name), type_, value)
}

///|
fn ctor(
  name : String,
  arguments : Array[@elab.TypeExpr],
) -> @mbt_ast.Constructor {
  { name, arguments, }
}

///|
fn pat(name : String, arguments : Array[@mbt_ast.Pattern]) -> @mbt_ast.Pattern {
  Constructor(name, arguments)
}

///|
pub fn type_ident(type_ : @elab.TypeExpr) -> String {
  match type_ {
    Constr(pkg~, name, args) => {
      let primary = match pkg {
        None => name
        Some(pkg) => "_" + pkg.replace_all(old="/", new="_") + "_" + name
      }
      if args.is_empty() {
        primary
      } else {
        primary + "_" + args.iter().map(type_ident).join("__") + "_"
      }
    }
    Param(_) => panic()
    Option(type_) =>
      if type_ is Arrow(_) {
        "_" + type_ident(type_) + "__"
      } else {
        type_ident(type_) + "_"
      }
    Tuple(types) => "_" + types.iter().map(type_ident).join("__") + "_"
    Arrow(args, result) =>
      "_" +
      args.iter().map(type_ident).join("__") +
      "_____" +
      type_ident(result)
  }
}

///|
fn extension(
  type_ : String,
  trait_ : String,
  methods : Array[String],
) -> @mbt_ast.Item {
  let message = "Use " +
    methods.map(m => trait_ + "::" + m).join(" or ") +
    " instead"
  @mbt_ast.item(
    Extend(named_type(type_, []), named_type(trait_, []), methods),
    visibility=Public,
    attributes=[
      { name: "deprecated", arguments: [Positional(String(message))], },
      { name: "doc", arguments: [Positional(Ident("hidden"))], },
    ],
  )
}

///|
fn derived_extensions(
  name : String,
  traits : Array[String],
) -> Array[@mbt_ast.Item] {
  let items = []
  for trait_ in traits {
    let methods = match trait_ {
      "Eq" => ["equal", "not_equal"]
      "Compare" => ["compare", "op_ge", "op_gt", "op_le", "op_lt"]
      "Hash" => ["hash", "hash_combine"]
      "Show" => ["output", "to_string"]
      "Debug" | "@debug.Debug" => ["to_repr"]
      "ToJson" => ["to_json"]
      "Default" => ["default"]
      "FromJson" | "@json.FromJson" => ["from_json"]
      "Arbitrary" | "@quickcheck.Arbitrary" => ["arbitrary"]
      _ => []
    }
    if !methods.is_empty() {
      items.push(extension(name, trait_, methods))
    }
  }
  items
}
