///|
/// Entry wrapper for the existing code/table runtime ABI. The backend supplies
/// its state representation and semantic-value constructor; syntax is shared.
pub fn entry_point(
  name~ : String,
  result~ : @elab.TypeExpr,
  position~ : @elab.TypeExpr,
  state~ : @mbt_ast.Expr,
  unbox~ : String,
  input_mode~ : @codegen.InputMode,
) -> @mbt_ast.Item {
  let token : @elab.TypeExpr = Constr(pkg=None, "Token", [])
  let located : @elab.TypeExpr = Tuple([token, position, position])
  let decode : @mbt_ast.Expr = Lambda([Positional("it", None)], {
    statements: [Assert(Is(Ident("it"), Constructor(unbox, [Bind("result")])))],
    result: Some(Ident("result")),
  })
  let (parameters, arguments) = match input_mode {
    Array =>
      (
        [
          @mbt_ast.Parameter::Positional(
            "tokens",
            Some(Constr(pkg=None, "Array", [located])),
          ),
          Optional("initial_pos", position, None),
        ],
        [
          @mbt_ast.Argument::Positional(Ident("tokens")),
          Positional(state),
          Positional(decode),
          ForwardOptional("initial_pos"),
        ],
      )
    Pull =>
      (
        [
          @mbt_ast.Parameter::Positional("read_token", Some(Arrow([], located))),
          Positional("start_pos", Some(position)),
        ],
        [
          @mbt_ast.Argument::Positional(Ident("read_token")),
          Positional(Ident("start_pos")),
          Positional(state),
          Positional(decode),
        ],
      )
  }
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        name,
        parameters,
        { statements: [], result: Some(Call(Ident("yy_parse"), arguments)), },
        result~,
        effect=Raises(Constr(pkg=None, "ParseError", [])),
      ),
    ),
    visibility=Public,
  )
}
