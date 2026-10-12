// Use qualified trait operations; aliases cover the compiler migration period.

///|
#deprecated("Use Debug::to_repr instead")
#doc(hidden)
pub extend LexError with Debug::{to_repr}

///|
#deprecated("Use Debug::to_repr instead")
#doc(hidden)
pub extend ParseOrLexError with Debug::{to_repr}
