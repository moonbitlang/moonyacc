///|
pub fn path_basename(path : String) -> String {
  if path.rev_find("/") is Some(lastSlashIndex) {
    path[lastSlashIndex + 1:].to_owned()
    // Fallback to windows path separator
  } else if path.rev_find("\\") is Some(lastBackslashIndex) {
    return path[lastBackslashIndex + 1:].to_owned()
  } else {
    return path
  }
}
