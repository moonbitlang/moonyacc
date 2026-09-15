// Use qualified trait operations; aliases cover the compiler migration period.

///|
#deprecated("Use comparison operators or Compare::compare instead")
#doc(hidden)
pub extend SmallIntSet with Compare::{op_lt, op_le, op_ge, compare, op_gt}

///|
#deprecated("Use Debug::to_repr instead")
#doc(hidden)
pub extend SmallIntSet with Debug::{to_repr}

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend SmallIntSet with Eq::{not_equal, equal}

///|
#deprecated("Use Hash::hash or Hash::hash_combine instead")
#doc(hidden)
pub extend SmallIntSet with Hash::{hash, hash_combine}

///|
#deprecated("Use Show::to_string or Show::output instead")
#doc(hidden)
pub extend SmallIntSet with Show::{to_string, output}
