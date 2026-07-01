///|
fn offset_to_line_column(content : String, offset : Int) -> (Int, Int) {
  let mut line = 1
  let mut column = 1
  let mut i = 0
  while i < offset {
    match content.code_unit_at(i) {
      '\r' => {
        line += 1
        column = 1
        if i + 1 < offset &&
          i + 1 < content.length() &&
          content.code_unit_at(i + 1) == '\n' {
          i += 2
        } else {
          i += 1
        }
      }
      '\n' => {
        line += 1
        column = 1
        i += 1
      }
      _ => {
        column += 1
        i += 1
      }
    }
  }
  (line, column)
}
