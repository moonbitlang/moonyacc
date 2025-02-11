///|
pub fn path_basename(path : String) -> String {
  let lastSlashIndex = path.last_index_of("/")
  if lastSlashIndex == -1 {
    // Fallback to windows path separator
    let lastBackslashIndex = path.last_index_of("\\")
    if lastBackslashIndex == -1 {
      return path
    } else {
      return path.substring(start=lastBackslashIndex + 1)
    }
  } else {
    path.substring(start=lastSlashIndex + 1)
  }
}
