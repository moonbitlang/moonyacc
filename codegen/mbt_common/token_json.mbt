///|
pub fn token_json(
  name : String,
  payload : @mbt_ast.Expr?,
  start : @mbt_ast.Expr,
  end : @mbt_ast.Expr,
) -> @mbt_ast.Expr {
  Map([
    (String("type"), String("TERMINAL")),
    (String("name"), String(name)),
    (
      String("data"),
      match payload {
        Some(value) => call("ToJson::to_json", [value])
        None => call("Json::null", [])
      },
    ),
    (String("start"), call("ToJson::to_json", [start])),
    (String("end"), call("ToJson::to_json", [end])),
  ])
}
