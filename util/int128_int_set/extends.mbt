// Use qualified trait operations; aliases cover the compiler migration period.

///|
#deprecated("Use comparison operators or Compare::compare instead")
#doc(hidden)
pub extend Int128IntSet with Compare::{op_lt, op_le, op_ge, compare, op_gt}

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend Int128IntSet with Eq::{not_equal, equal}

///|
#deprecated("Use Hash::hash or Hash::hash_combine instead")
#doc(hidden)
pub extend Int128IntSet with Hash::{hash, hash_combine}

///|
#deprecated("Use Show::to_string or Show::output instead")
#doc(hidden)
pub extend Int128IntSet with Show::{to_string, output}
