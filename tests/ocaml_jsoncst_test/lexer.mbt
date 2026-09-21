///|
pub(all) struct Lexer {
  base : StringView
  mut rest : StringView
}

///|
let all_keywords : Map[String, Token] = {
  "and": AND,
  "as": AS,
  "assert": ASSERT,
  "begin": BEGIN,
  "class": CLASS,
  "constraint": CONSTRAINT,
  "do": DO,
  "done": DONE,
  "downto": DOWNTO,
  "else": ELSE,
  "end": END,
  "exception": EXCEPTION,
  "external": EXTERNAL,
  "false": FALSE,
  "for": FOR,
  "fun": FUN,
  "function": FUNCTION,
  "functor": FUNCTOR,
  "if": IF,
  "in": IN,
  "include": INCLUDE,
  "inherit": INHERIT,
  "initializer": INITIALIZER,
  "lazy": LAZY,
  "let": LET,
  "match": MATCH,
  "method": METHOD,
  "module": MODULE,
  "mutable": MUTABLE,
  "new": NEW,
  "nonrec": NONREC,
  "object": OBJECT,
  "of": OF,
  "open": OPEN,
  "or": OR,
  "private": PRIVATE,
  "rec": REC,
  "sig": SIG,
  "struct": STRUCT,
  "then": THEN,
  "do": TO,
  "true": TRUE,
  "try": TRY,
  "type": TYPE,
  "val": VAL,
  "virtual": VIRTUAL,
  "when": WHEN,
  "while": WHILE,
  "with": WITH,
}

///|
fn Lexer::emit(
  self : Lexer,
  token : Token,
  start : Int,
  rest : StringView,
) -> (Token, Int, Int) {
  self.rest = rest
  (token, start, rest.start_offset() - self.base.start_offset())
}

///|
pub fn new_lexer(input : String) -> Lexer {
  let base = input[:]
  { base, rest: base, }
}

///|
pub fn Lexer::next_token(self : Lexer) -> (Token, Int, Int) {
  for input = self.rest {
    let start = input.start_offset() - self.base.start_offset()
    lexmatch input with longest {
      (re"^[ \t\u000C\r\n]+", after=rest) => continue rest
      (re"^&&", after=rest) => break self.emit(AMPERAMPER, start, rest)
      (re"^&", after=rest) => break self.emit(AMPERSAND, start, rest)
      (re"^`", after=rest) => break self.emit(BACKQUOTE, start, rest)
      (re"^!", after=rest) => break self.emit(BANG, start, rest)
      (re"^\|", after=rest) => break self.emit(BAR, start, rest)
      (re"^\|\|", after=rest) => break self.emit(BARBAR, start, rest)
      (re"^\|\]", after=rest) => break self.emit(BARRBRACKET, start, rest)
      (re"^<todo1>", after=rest) => break self.emit(CHAR, start, rest)
      (re"^:", after=rest) => break self.emit(COLON, start, rest)
      (re"^::", after=rest) => break self.emit(COLONCOLON, start, rest)
      (re"^:=", after=rest) => break self.emit(COLONEQUAL, start, rest)
      (re"^:>", after=rest) => break self.emit(COLONGREATER, start, rest)
      (re"^,", after=rest) => break self.emit(COMMA, start, rest)
      (re"^\.", after=rest) => break self.emit(DOT, start, rest)
      (re"^\.\.", after=rest) => break self.emit(DOTDOT, start, rest)
      re"^$" => break self.emit(EOF, start, input)
      (re"^=", after=rest) => break self.emit(EQUAL, start, rest)
      (re"^<todo3>", after=rest) => break self.emit(FLOAT, start, rest)
      (re"^>", after=rest) => break self.emit(GREATER, start, rest)
      (re"^>[}]", after=rest) => break self.emit(GREATERRBRACE, start, rest)
      (re"^>\]", after=rest) => break self.emit(GREATERRBRACKET, start, rest)
      (re"^[=<>|&$][!$%&*+\-./:<=>?@^|~]*", after=rest) =>
        break self.emit(INFIXOP0, start, rest)
      (re"^[@^][!$%&*+\-./:<=>?@^|~]*", after=rest) =>
        break self.emit(INFIXOP1, start, rest)
      (re"^[+\-][!$%&*+\-./:<=>?@^|~]*", after=rest) =>
        break self.emit(INFIXOP2, start, rest)
      (re"^[*/%][!$%&*+\-./:<=>?@^|~]*", after=rest) =>
        break self.emit(INFIXOP3, start, rest)
      (re"^<todo8>", after=rest) => break self.emit(INFIXOP4, start, rest)
      (re"^<todo9>", after=rest) => break self.emit(DOTOP, start, rest)
      (re"^[0-9][0-9_]*", after=rest) => break self.emit(INT, start, rest)
      (re"^<todo11>", after=rest) => break self.emit(LABEL, start, rest)
      (re"^[{]", after=rest) => break self.emit(LBRACE, start, rest)
      (re"^[{]<", after=rest) => break self.emit(LBRACELESS, start, rest)
      (re"^\[", after=rest) => break self.emit(LBRACKET, start, rest)
      (re"^\[\|", after=rest) => break self.emit(LBRACKETBAR, start, rest)
      (re"^\[<", after=rest) => break self.emit(LBRACKETLESS, start, rest)
      (re"^\[>", after=rest) => break self.emit(LBRACKETGREATER, start, rest)
      (re"^\[%", after=rest) => break self.emit(LBRACKETPERCENT, start, rest)
      (re"^\[%%", after=rest) =>
        break self.emit(LBRACKETPERCENTPERCENT, start, rest)
      (re"^[a-z][A-Za-z_0-9]*" as word, after=rest) => {
        let token = all_keywords.get(word.to_owned()).unwrap_or(LIDENT)
        break self.emit(token, start, rest)
      }
      (re"^\(", after=rest) => break self.emit(LPAREN, start, rest)
      (re"^\[@", after=rest) => break self.emit(LBRACKETAT, start, rest)
      (re"^\[@@", after=rest) => break self.emit(LBRACKETATAT, start, rest)
      (re"^\[@@@", after=rest) => break self.emit(LBRACKETATATAT, start, rest)
      (re"^<todo13>", after=rest) => break self.emit(OPTLABEL, start, rest)
      (re"^<todo14>", after=rest) => break self.emit(PREFIXOP, start, rest)
      (re"^\?", after=rest) => break self.emit(QUESTION, start, rest)
      (re"^\"", after=rest) => break self.emit(QUOTE, start, rest)
      (re"^[}]", after=rest) => break self.emit(RBRACE, start, rest)
      (re"^\]", after=rest) => break self.emit(RBRACKET, start, rest)
      (re"^\)", after=rest) => break self.emit(RPAREN, start, rest)
      (re"^;", after=rest) => break self.emit(SEMI, start, rest)
      (re"^;;", after=rest) => break self.emit(SEMISEMI, start, rest)
      (re"^#", after=rest) => break self.emit(HASH, start, rest)
      (re"^<todo15>", after=rest) => break self.emit(HASHOP, start, rest)
      (re"^<todo16>", after=rest) => break self.emit(STRING, start, rest)
      (re"^~", after=rest) => break self.emit(TILDE, start, rest)
      (re"^[A-Z][A-Za-z_0-9]*", after=rest) =>
        break self.emit(UIDENT, start, rest)
      (re"^_", after=rest) => break self.emit(UNDERSCORE, start, rest)
      (re"^.", after=_) => panic()
    }
  }
}
