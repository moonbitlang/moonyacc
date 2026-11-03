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
  input_layout~ : @codegen.InputLayout,
) -> @mbt_ast.Item {
  let input = input_type(input_layout, position)
  let decode : @mbt_ast.Expr = Lambda([Positional("it", None)], {
    statements: [Assert(Is(Ident("it"), Constructor(unbox, [Bind("result")])))],
    result: Some(Ident("result")),
  })
  let (parameters, arguments) : (
    Array[@mbt_ast.Parameter],
    Array[@mbt_ast.Argument],
  ) = match input_mode {
    Array =>
      (
        [
          @mbt_ast.Parameter::Positional(
            "tokens",
            Some(Constr(pkg=None, "Array", [input])),
          ),
          ..if input_layout is Located {
            [@mbt_ast.Parameter::Optional("initial_pos", position, None)]
          } else {
            []
          },
        ],
        [
          @mbt_ast.Argument::Positional(Ident("tokens")),
          Positional(state),
          Positional(decode),
          ..if input_layout is Located {
            [@mbt_ast.Argument::ForwardOptional("initial_pos")]
          } else {
            []
          },
        ],
      )
    Pull =>
      (
        [
          @mbt_ast.Parameter::Positional("read_token", Some(Arrow([], input))),
          ..if input_layout is Located {
            [@mbt_ast.Parameter::Positional("start_pos", Some(position))]
          } else {
            []
          },
        ],
        [
          @mbt_ast.Argument::Positional(Ident("read_token")),
          ..if input_layout is Located {
            [@mbt_ast.Argument::Positional(Ident("start_pos"))]
          } else {
            []
          },
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
