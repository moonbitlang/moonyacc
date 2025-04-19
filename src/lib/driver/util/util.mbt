///|
pub fn path_basename(path : String) -> String {
  if path.rev_find("/") is Some(lastSlashIndex) {
    path.substring(start=lastSlashIndex + 1)
    // Fallback to windows path separator
  } else if path.rev_find("\\") is Some(lastBackslashIndex) {
    return path.substring(start=lastBackslashIndex + 1)
  } else {
    return path
  }
}
