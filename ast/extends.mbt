// Use qualified trait operations; aliases cover the compiler migration period.

///|
#deprecated("Use ToJson::to_json instead")
#doc(hidden)
pub extend ClauseAction with ToJson::{to_json}

///|
#deprecated("Use ToJson::to_json instead")
#doc(hidden)
pub extend ClauseItem with ToJson::{to_json}

///|
#deprecated("Use comparison operators or Compare::compare instead")
#doc(hidden)
pub extend ClauseItemIdent with Compare::{op_lt, op_le, op_ge, compare, op_gt}

///|
#deprecated("Use Debug::to_repr instead")
#doc(hidden)
pub extend ClauseItemIdent with Debug::{to_repr}

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend ClauseItemIdent with Eq::{not_equal, equal}

///|
#deprecated("Use ToJson::to_json instead")
#doc(hidden)
pub extend ClauseItemIdent with ToJson::{to_json}

///|
#deprecated("Use ToJson::to_json instead")
#doc(hidden)
pub extend ClauseWithoutAction with ToJson::{to_json}

///|
#deprecated("Use ToJson::to_json instead")
#doc(hidden)
pub extend CodeWithSubst with ToJson::{to_json}

///|
#deprecated("Use ToJson::to_json instead")
#doc(hidden)
pub extend Declaration with ToJson::{to_json}

///|
#deprecated("Use ToJson::to_json instead")
#doc(hidden)
pub extend ParserSpec with ToJson::{to_json}

///|
#deprecated("Use ToJson::to_json instead")
#doc(hidden)
pub extend PrecSymbol with ToJson::{to_json}

///|
#deprecated("Use ToJson::to_json instead")
#doc(hidden)
pub extend Rule with ToJson::{to_json}

///|
#deprecated("Use Debug::to_repr instead")
#doc(hidden)
pub extend SubstItem with Debug::{to_repr}

///|
#deprecated("Use ToJson::to_json instead")
#doc(hidden)
pub extend SubstItem with ToJson::{to_json}

///|
#deprecated("Use comparison operators or Compare::compare instead")
#doc(hidden)
pub extend SubstItemDesc with Compare::{op_lt, op_le, op_ge, compare, op_gt}

///|
#deprecated("Use Debug::to_repr instead")
#doc(hidden)
pub extend SubstItemDesc with Debug::{to_repr}

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend SubstItemDesc with Eq::{not_equal, equal}

///|
#deprecated("Use ToJson::to_json instead")
#doc(hidden)
pub extend SubstItemDesc with ToJson::{to_json}

///|
#deprecated("Use ToJson::to_json instead")
#doc(hidden)
pub extend SymbolWithLoc with ToJson::{to_json}

///|
#deprecated("Use ToJson::to_json instead")
#doc(hidden)
pub extend Term with ToJson::{to_json}

///|
#deprecated("Use Debug::to_repr instead")
#doc(hidden)
pub extend TypeExpr with Debug::{to_repr}

///|
#deprecated("Use ToJson::to_json instead")
#doc(hidden)
pub extend TypeExpr with ToJson::{to_json}
