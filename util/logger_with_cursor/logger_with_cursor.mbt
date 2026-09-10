///|
struct LoggerWithCursor {
  logger : &Logger
  mut cursor : Int
}

///|
pub fn new(logger : &Logger, cursor? : Int = 0) -> LoggerWithCursor {
  { logger, cursor, }
}

///|
pub fn LoggerWithCursor::cursor(self : LoggerWithCursor) -> Int {
  self.cursor
}

///|
pub impl Logger for LoggerWithCursor with fn write_char(self, char) {
  Logger::write_char(self.logger, char)
  self.cursor += 1
}

///|
pub impl Logger for LoggerWithCursor with fn write_string(self, str) {
  Logger::write_string(self.logger, str)
  self.cursor += str.length()
}

///|
pub impl Logger for LoggerWithCursor with fn write_view(self, view) {
  Logger::write_view(self.logger, view)
  self.cursor += view.length()
}
