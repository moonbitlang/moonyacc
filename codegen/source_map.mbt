///|
pub(all) struct SourceMap {
  mappings : Array[SourceMapping]
} derive(ToJson)

///|
pub fn SourceMap::new() -> SourceMap {
  { mappings: [], }
}

///|
pub(all) struct SourceMapping {
  source : String
  original_offset : Int
  generated_offset : Int
  length : Int
} derive(ToJson)

///|
pub trait SourceMapBuilder {
  fn add_mapping(Self, String, Int, Int, Int) -> Unit
}

///|
pub impl SourceMapBuilder for SourceMap with fn add_mapping(
  self,
  source,
  original_offset,
  generated_offset,
  length,
) {
  self.mappings.push({ source, original_offset, generated_offset, length, })
}
