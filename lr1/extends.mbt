// Use qualified trait operations; aliases cover the compiler migration period.

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend ConflictLocation with Eq::{not_equal, equal}

///|
#deprecated("Use Hash::hash or Hash::hash_combine instead")
#doc(hidden)
pub extend ConflictLocation with Hash::{hash, hash_combine}

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend Decision with Eq::{not_equal, equal}

///|
#deprecated("Use comparison operators or Compare::compare instead")
#doc(hidden)
pub extend EncodedLR0Item with Compare::{op_lt, op_le, op_ge, compare, op_gt}

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend EncodedLR0Item with Eq::{not_equal, equal}

///|
#deprecated("Use Hash::hash or Hash::hash_combine instead")
#doc(hidden)
pub extend EncodedLR0Item with Hash::{hash, hash_combine}

///|
#deprecated("Use Default::default instead")
#doc(hidden)
pub extend EncodedLR0ItemSet with Default::{default}

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend EncodedLR0ItemSet with Eq::{not_equal, equal}

///|
#deprecated("Use Hash::hash or Hash::hash_combine instead")
#doc(hidden)
pub extend EncodedLR0ItemSet with Hash::{hash, hash_combine}

///|
#deprecated("Use comparison operators or Compare::compare instead")
#doc(hidden)
pub extend LR0Item with Compare::{op_lt, op_le, op_ge, compare, op_gt}

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend LR0Item with Eq::{not_equal, equal}

///|
#deprecated("Use Hash::hash or Hash::hash_combine instead")
#doc(hidden)
pub extend LR0Item with Hash::{hash, hash_combine}

///|
#deprecated("Use comparison operators or Compare::compare instead")
#doc(hidden)
pub extend LR1Item with Compare::{op_lt, op_le, op_ge, compare, op_gt}

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend LR1Item with Eq::{not_equal, equal}

///|
#deprecated("Use Show::to_string or Show::output instead")
#doc(hidden)
pub extend LR1Item with Show::{to_string, output}

///|
#deprecated("Use Show::to_string or Show::output instead")
#doc(hidden)
pub extend LR1ItemGroup with Show::{to_string, output}

///|
#deprecated("Use comparison operators or Compare::compare instead")
#doc(hidden)
pub extend LR1State with Compare::{op_lt, op_le, op_ge, compare, op_gt}

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend LR1State with Eq::{not_equal, equal}

///|
#deprecated("Use Hash::hash or Hash::hash_combine instead")
#doc(hidden)
pub extend LR1State with Hash::{hash, hash_combine}

///|
#deprecated("Use comparison operators or Compare::compare instead")
#doc(hidden)
pub extend Lookahead with Compare::{op_lt, op_le, op_ge, compare, op_gt}

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend Lookahead with Eq::{not_equal, equal}

///|
#deprecated("Use Hash::hash or Hash::hash_combine instead")
#doc(hidden)
pub extend Lookahead with Hash::{hash, hash_combine}

///|
#deprecated("Use Show::to_string or Show::output instead")
#doc(hidden)
pub extend Lookahead with Show::{to_string, output}
