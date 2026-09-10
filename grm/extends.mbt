// Use qualified trait operations; aliases cover the compiler migration period.

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend Associativity with Eq::{not_equal, equal}

///|
#deprecated("Use comparison operators or Compare::compare instead")
#doc(hidden)
pub extend Nonterminal with Compare::{op_lt, op_le, op_ge, compare, op_gt}

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend Nonterminal with Eq::{not_equal, equal}

///|
#deprecated("Use Hash::hash or Hash::hash_combine instead")
#doc(hidden)
pub extend Nonterminal with Hash::{hash, hash_combine}

///|
#deprecated("Use Show::to_string or Show::output instead")
#doc(hidden)
pub extend Nonterminal with Show::{to_string, output}

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend Nullability with Eq::{not_equal, equal}

///|
#deprecated("Use comparison operators or Compare::compare instead")
#doc(hidden)
pub extend Production with Compare::{op_lt, op_le, op_ge, compare, op_gt}

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend Production with Eq::{not_equal, equal}

///|
#deprecated("Use Hash::hash or Hash::hash_combine instead")
#doc(hidden)
pub extend Production with Hash::{hash, hash_combine}

///|
#deprecated("Use Show::to_string or Show::output instead")
#doc(hidden)
pub extend Production with Show::{to_string, output}

///|
#deprecated("Use comparison operators or Compare::compare instead")
#doc(hidden)
pub extend Symbol with Compare::{op_lt, op_le, op_ge, compare, op_gt}

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend Symbol with Eq::{not_equal, equal}

///|
#deprecated("Use Hash::hash or Hash::hash_combine instead")
#doc(hidden)
pub extend Symbol with Hash::{hash, hash_combine}

///|
#deprecated("Use Show::to_string or Show::output instead")
#doc(hidden)
pub extend Symbol with Show::{to_string, output}

///|
#deprecated("Use comparison operators or Compare::compare instead")
#doc(hidden)
pub extend Terminal with Compare::{op_lt, op_le, op_ge, compare, op_gt}

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend Terminal with Eq::{not_equal, equal}

///|
#deprecated("Use Hash::hash or Hash::hash_combine instead")
#doc(hidden)
pub extend Terminal with Hash::{hash, hash_combine}

///|
#deprecated("Use Show::to_string or Show::output instead")
#doc(hidden)
pub extend Terminal with Show::{to_string, output}
