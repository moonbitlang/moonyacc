///|
#derive(ToJson)
pub(all) struct SourceMap {
  mappings : Array[SourceMapping]
}

///|
pub fn SourceMap::new() -> SourceMap {
  { mappings: [], }
}

///|
#derive(ToJson)
pub(all) struct SourceMapping {
  source : String
  original_offset : Int32
  generated_offset : Int32
  length : Int32
}

///|
pub trait SourceMapBuilder {
  fn add_mapping(Self, String, Int32, Int32, Int32) -> Unit
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
