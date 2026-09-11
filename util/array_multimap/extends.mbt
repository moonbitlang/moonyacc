// Use qualified trait operations; aliases cover the compiler migration period.

///|
#deprecated("Use ToJson::to_json instead")
#doc(hidden)
pub extend T with ToJson::{to_json}
