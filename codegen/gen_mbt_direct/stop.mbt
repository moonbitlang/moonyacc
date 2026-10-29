///|
fn Emitter::stop_body(self : Emitter) -> @mbt_ast.Block {
  body(
    [
      Eval(
        call("_yy_error", [
          self.snapshot_states(),
          self.cached("token"),
          Tuple([self.cached_position(), self.cached_position(end=true)]),
        ]),
      ),
    ],
    result=call("panic", []),
  )
}

///|
/// All syntax errors inspect the same cached token and last-shift snapshot.
/// Share the emitted error body across the checked IR error exits.
fn Emitter::stop_item(self : Emitter) -> @mbt_ast.Item {
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_stop",
        [typed("_env", type_("YYContext"))],
        self.stop_body(),
        result=type_("Int"),
        effect=Raises(type_("ParseError")),
      ),
    ),
    attributes=[{ name: "inline", arguments: [Positional(Ident("never"))], }],
  )
}
