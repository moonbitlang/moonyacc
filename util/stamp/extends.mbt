// Use qualified trait operations; aliases cover the compiler migration period.

///|
#deprecated("Use == / != or Eq::equal instead")
#doc(hidden)
pub extend Stamp with Eq::{not_equal, equal}

///|
#deprecated("Use Hash::hash or Hash::hash_combine instead")
#doc(hidden)
pub extend Stamp with Hash::{hash, hash_combine}
