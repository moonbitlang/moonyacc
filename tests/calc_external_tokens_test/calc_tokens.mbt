pub(all) enum Token {
  NUMBER(Int)
  PLUS
  MINUS
  STAR
  LPAREN
  RPAREN
} derive(Debug)

#deprecated("Use Debug::to_repr instead")
#doc(hidden)
pub extend Token with Debug::{to_repr}

pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    NUMBER(_) => TK_NUMBER
    PLUS => TK_PLUS
    MINUS => TK_MINUS
    STAR => TK_STAR
    LPAREN => TK_LPAREN
    RPAREN => TK_RPAREN
  }
}

pub(all) enum TokenKind {
  TK_NUMBER
  TK_PLUS
  TK_MINUS
  TK_STAR
  TK_LPAREN
  TK_RPAREN
}

#deprecated("Use Show::to_string or Show::output instead")
#doc(hidden)
pub extend TokenKind with Show::{output, to_string}

pub impl Show for TokenKind with fn output(self, logger) {
  Logger::write_string(logger,
    match self {
      TK_NUMBER => "NUMBER"
      TK_PLUS => "\"+\""
      TK_MINUS => "\"-\""
      TK_STAR => "\"*\""
      TK_LPAREN => "\"(\""
      TK_RPAREN => "\")\""
    }
  )
}

#deprecated("Use Debug::to_repr instead")
#doc(hidden)
pub extend TokenKind with Debug::{to_repr}

pub impl Debug for TokenKind with fn to_repr(self) {
    match self {
      TK_NUMBER => Repr("NUMBER")
      TK_PLUS => Repr("+")
      TK_MINUS => Repr("-")
      TK_STAR => Repr("*")
      TK_LPAREN => Repr("(")
      TK_RPAREN => Repr(")")
    }
}

