// Use qualified trait operations; aliases cover the compiler migration period.

///|
#deprecated("Use Eq::equal or Eq::not_equal instead")
#doc(hidden)
pub extend ValueType with Eq::{equal, not_equal}

///|
#deprecated("Use Eq::equal or Eq::not_equal instead")
#doc(hidden)
pub extend Register with Eq::{equal, not_equal}

///|
#deprecated("Use Eq::equal or Eq::not_equal instead")
#doc(hidden)
pub extend Value with Eq::{equal, not_equal}

///|
#deprecated("Use Eq::equal or Eq::not_equal instead")
#doc(hidden)
pub extend Field with Eq::{equal, not_equal}

///|
#deprecated("Use Eq::equal or Eq::not_equal instead")
#doc(hidden)
pub extend Cell with Eq::{equal, not_equal}

///|
#deprecated("Use Eq::equal or Eq::not_equal instead")
#doc(hidden)
pub extend Token with Eq::{equal, not_equal}

///|
#deprecated("Use Eq::equal or Eq::not_equal instead")
#doc(hidden)
pub extend Lookahead with Eq::{equal, not_equal}

///|
#deprecated("Use Hash::hash or Hash::hash_combine instead")
#doc(hidden)
pub extend Token with Hash::{hash, hash_combine}
