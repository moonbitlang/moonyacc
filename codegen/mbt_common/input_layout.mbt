///|
pub fn input_type(
  layout : @codegen.InputLayout,
  position : @elab.TypeExpr,
) -> @elab.TypeExpr {
  let token = named_type("Token", [])
  match layout {
    Located => Tuple([token, position, position])
    TokenOnly => token
  }
}

///|
pub fn Context::input_type(self : Context) -> @elab.TypeExpr {
  input_type(self.input_layout, self.meta.position_data_type)
}
