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

pub impl Show for TokenKind with fn output(self, logger) {
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

