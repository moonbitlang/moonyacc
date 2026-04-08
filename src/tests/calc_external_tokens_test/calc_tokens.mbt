pub(all) enum Token {
  NUMBER(Int)
  PLUS
  MINUS
  STAR
  LPAREN
  RPAREN
} derive(Debug)

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

pub impl Show for TokenKind with output(self, logger) {
  logger.write_string(
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

pub impl Debug for TokenKind with to_repr(self) {
    match self {
      TK_NUMBER => to_repr("NUMBER")
      TK_PLUS => to_repr("+")
      TK_MINUS => to_repr("-")
      TK_STAR => to_repr("*")
      TK_LPAREN => to_repr("(")
      TK_RPAREN => to_repr(")")
    }
}

