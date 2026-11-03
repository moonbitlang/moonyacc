///|
fn type_(name : String) -> @elab.TypeExpr {
  @mbt_common.named_type(name, [])
}

///|
fn call(name : String, args : Array[@mbt_ast.Expr]) -> @mbt_ast.Expr {
  @mbt_common.call(name, args)
}

///|
fn dot_call(
  receiver : @mbt_ast.Expr,
  name : String,
  args : Array[@mbt_ast.Expr],
) -> @mbt_ast.Expr {
  MethodCall(receiver, name, args.map(x => @mbt_ast.Argument::Positional(x)))
}

///|
fn component(expr : @mbt_ast.Expr, index : Int32) -> @mbt_ast.Expr {
  Field(expr, Tuple(index))
}

///|
fn body(
  statements : Array[@mbt_ast.Stmt],
  result? : @mbt_ast.Expr,
) -> @mbt_ast.Block {
  { statements, result, }
}

///|
fn value_block(value : @mbt_ast.Expr) -> @mbt_ast.Block {
  @mbt_common.value_block(value)
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
fn typed(name : String, type_ : @elab.TypeExpr) -> @mbt_ast.Parameter {
  Positional(name, Some(type_))
}

///|
fn token_id(token : @direct_ir.Token) -> Int32 {
  match token {
    Terminal(id) => id
    EndOfInput => 0
  }
}
