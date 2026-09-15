///|
/// Index completed surrogate pairs once, so converting each offset does not
/// rescan the entire prefix. Offsets are at Unicode character boundaries.
fn scalar_offset_converter(content : String) -> (Int) -> Int {
  let surrogate_ends = []
  let mut utf16_offset = 0
  for char in content {
    let length = char.utf16_len()
    utf16_offset += length
    if length == 2 {
      surrogate_ends.push(utf16_offset)
    }
  }
  fn(offset) {
    match surrogate_ends.binary_search(offset) {
      Ok(index) => offset - index - 1
      Err(index) => offset - index
    }
  }
}

///|
fn write_source_map(
  source_map : @codegen.SourceMap,
  original : String,
  generated : String,
  builder : &@codegen.SourceMapBuilder,
) -> Unit {
  guard !source_map.mappings.is_empty() else { () }
  // The lexer and code generators use UTF-16 string indices. Moon's diagnostic
  // renderer consumes Unicode scalar offsets, including the mapping length.
  let original_offset = scalar_offset_converter(original)
  let generated_offset = scalar_offset_converter(generated)
  for mapping in source_map.mappings {
    let start = generated_offset(mapping.generated_offset)
    let end = generated_offset(mapping.generated_offset + mapping.length)
    @codegen.SourceMapBuilder::add_mapping(
      builder,
      mapping.source,
      original_offset(mapping.original_offset),
      start,
      end - start,
    )
  }
}
