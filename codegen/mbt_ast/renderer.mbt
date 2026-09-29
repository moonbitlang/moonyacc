///|
/// Render source and mappings in one pass. Offsets in Output are UTF-16 units.
pub fn render(items : Array[Item], width? : Int = 80) -> Output {
  let buffer = StringBuilder()
  let output = @logger_with_cursor.new(buffer)
  let source_map = @codegen.SourceMap::new()
  emit(items, output, source_map_builder=source_map, width~)
  { source: buffer.to_string(), source_map, }
}

///|
/// Append complete top-level items at a line boundary. Existing cursor offsets
/// are respected, so legacy and structured emission can coexist during migration.
pub fn emit(
  items : Array[Item],
  output : @logger_with_cursor.LoggerWithCursor,
  source_map_builder? : &@codegen.SourceMapBuilder,
  width? : Int = 80,
) -> Unit {
  guard! width > 0
  for i, item in items {
    if i > 0 {
      Logger::write_char(output, '\n')
    }
    if !write_doc(item_doc(item), output, source_map_builder, width) {
      Logger::write_char(output, '\n')
    }
  }
}

///|
fn visibility(vis : Visibility) -> String {
  match vis {
    Default => ""
    Public => "pub "
    PublicAll => "pub(all) "
    Private => "priv "
  }
}
