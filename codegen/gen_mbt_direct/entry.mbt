///|
fn Emitter::entry_item(
  self : Emitter,
  index : Int32,
  entry : @direct_ir.Entry,
) -> @mbt_ast.Item {
  let position = self.meta.position_data_type
  let (parameters, arguments) = match self.input_mode {
    Array =>
      (
        [
          typed("tokens", self.tokens_type()),
          @mbt_ast.Parameter::Optional("initial_pos", position, None),
        ],
        [
          @mbt_ast.Argument::Positional(Ident("tokens")),
          Positional(Int(self.control.address(entry.block))),
          Positional(Int(entry.state)),
          ForwardOptional("initial_pos"),
        ],
      )
    Pull =>
      (
        [
          typed("read_token", Arrow([], self.located_type())),
          typed("start_pos", position),
        ],
        [
          @mbt_ast.Argument::Positional(Ident("read_token")),
          Positional(Ident("start_pos")),
          Positional(Int(self.control.address(entry.block))),
          Positional(Int(entry.state)),
        ],
      )
  }
  let arms : Array[(@mbt_ast.Pattern, @mbt_ast.Block)] = [
    (
      Constructor("YYAccept_\{index}", [Bind("result")]),
      value_block(@mbt_ast.Expr::Ident("result")),
    ),
  ]
  if self.program.entries.length() > 1 {
    arms.push((Any, value_block(call("panic", []))))
  }
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        entry.name,
        parameters,
        value_block(Match(Call(Ident("yy_parse"), arguments), arms)),
        result=entry.result_type,
        effect=if self.region_errors.is_empty() {
          Default
        } else {
          Raises(type_("ParseError"))
        },
      ),
    ),
    visibility=Public,
  )
}
