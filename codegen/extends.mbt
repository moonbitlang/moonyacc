// Use qualified trait operations; aliases cover the compiler migration period.

///|
#deprecated("Use SourceMapBuilder::add_mapping instead")
#doc(hidden)
pub extend SourceMap with SourceMapBuilder::{add_mapping}

///|
#deprecated("Use ToJson::to_json instead")
#doc(hidden)
pub extend SourceMap with ToJson::{to_json}

///|
#deprecated("Use ToJson::to_json instead")
#doc(hidden)
pub extend SourceMapping with ToJson::{to_json}
