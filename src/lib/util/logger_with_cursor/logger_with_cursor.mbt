///|
struct LoggerWithCursor {
  logger : &Logger
  mut cursor : Int
}

///|
pub fn new(logger : &Logger, cursor? : Int = 0) -> LoggerWithCursor {
  { logger, cursor }
}

///|
pub fn LoggerWithCursor::cursor(self : LoggerWithCursor) -> Int {
  self.cursor
}

///|
pub impl Logger for LoggerWithCursor with write_char(self, char) {
  self.logger.write_char(char)
  self.cursor += 1
}

///|
pub impl Logger for LoggerWithCursor with write_string(self, str) {
  self.logger.write_string(str)
  self.cursor += str.length()
}

///|
pub impl Logger for LoggerWithCursor with write_substring(self, str, start, len) {
  self.logger.write_substring(str, start, len)
  self.cursor += len
}
