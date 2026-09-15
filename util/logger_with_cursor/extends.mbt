// Use qualified trait operations; aliases cover the compiler migration period.

///|
#deprecated("Use Logger::write_view or Logger::write_string or Logger::write_string_interpolation or Logger::write_char or Logger::write instead")
#doc(hidden)
pub extend LoggerWithCursor with Logger::{
  write_view,
  write_string,
  write_string_interpolation,
  write_char,
  write,
}

///|
#deprecated("Use Logger::write_view instead")
#doc(hidden)
#warnings("-deprecated")
pub extend LoggerWithCursor with Logger::{write_substring}
