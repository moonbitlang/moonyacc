///|
fn Emitter::entry_item(
  self : Emitter,
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
          Positional(Int(entry.block)),
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
          Positional(Int(entry.block)),
          Positional(Int(entry.state)),
        ],
      )
  }
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        entry.name,
        parameters,
        body(
          [
            binding("result", Call(Ident("yy_parse"), arguments)),
            Assert(
              Is(
                Ident("result"),
                Constructor(
                  "YYObj_" + @mbt_common.type_ident(entry.result_type),
                  [Bind("result")],
                ),
              ),
            ),
          ],
          result=Ident("result"),
        ),
        result=entry.result_type,
        effect=Raises(type_("ParseError")),
      ),
    ),
    visibility=Public,
  )
}
