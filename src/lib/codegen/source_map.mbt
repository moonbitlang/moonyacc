///|
pub(all) struct SourceMap {
  mappings : Array[SourceMapping]
} derive(ToJson)

///|
pub fn SourceMap::new() -> SourceMap {
  { mappings: [] }
}

///|
pub(all) struct SourceMapping {
  source : String
  original_utf8_pos : Int
  generated_utf8_pos : Int
  utf8_length : Int
} derive(ToJson)

///|
pub trait SourceMapBuilder {
  add_mapping(Self, String, Int, Int, Int) -> Unit
}

///|
pub impl SourceMapBuilder for SourceMap with add_mapping(
  self,
  source,
  original_offset_in_utf8,
  generated_offset_in_utf8,
  length_in_utf8
) {
  self.mappings.push({
    source,
    original_utf8_pos: original_offset_in_utf8,
    generated_utf8_pos: generated_offset_in_utf8,
    utf8_length: length_in_utf8,
  })
}
