///|
pub suberror LexError {
  UnexpectedEndOfFile
  Unrecognized(Char, Int)
}

///|
struct Lexer {
  base : StringView
  mut rest : StringView
  // 0 %%
  // %% 1
  // %% %% 2
  mut phase : Int
}

///|
fn source_offset(base : StringView, view : StringView) -> Int {
  view.start_offset() - base.start_offset()
}

///|
fn skip_nested_comment(input : StringView) -> StringView raise LexError {
  for input = input, depth = 1 {
    lexmatch input with longest {
      (re"^[(][*]", after=rest) => continue rest, depth + 1
      (re"^[*][)]", after=rest) =>
        if depth == 1 {
          break rest
        } else {
          continue rest, depth - 1
        }
      (re"^.", after=rest) => continue rest, depth
      re"^$" => raise UnexpectedEndOfFile
    }
  }
}

///|
fn scan_angle_code(input : StringView) -> (StringView, String) raise LexError {
  let buf = StringBuilder()
  for input = input {
    lexmatch input with longest {
      (re"^>", after=rest) => break (rest, buf.to_string())
      (re"^." as ch, after=rest) => {
        buf.write_char(ch)
        continue rest
      }
      re"^$" => raise UnexpectedEndOfFile
    }
  }
}

///|
fn scan_percent_code(input : StringView) -> (StringView, String) raise LexError {
  let buf = StringBuilder()
  for input = input {
    lexmatch input with longest {
      (re"^%[}]", after=rest) => break (rest, buf.to_string())
      (re"^." as ch, after=rest) => {
        buf.write_char(ch)
        continue rest
      }
      re"^$" => raise UnexpectedEndOfFile
    }
  }
}

///|
fn scan_action_code(
  input : StringView,
  base : StringView,
  code_base : Int,
) -> (StringView, String, Array[@ast.SubstItem]) raise LexError {
  let buf = StringBuilder()
  let subst : Array[@ast.SubstItem] = []
  for input = input, depth = 1 {
    lexmatch input with longest {
      (re"^[{]", after=rest) => {
        buf.write_char('{')
        continue rest, depth + 1
      }
      (re"^[}]", after=rest) =>
        if depth == 1 {
          break (rest, buf.to_string(), subst)
        } else {
          buf.write_char('}')
          continue rest, depth - 1
        }
      ((re"^\$" + (re"[0-9]+" as digits)) as raw, after=rest) => {
        buf.write_string(raw.to_owned())
        let index = @string.parse_int(digits, base=10) catch {
          err => abort(Show::to_string(err))
        }
        subst.push({
          start: source_offset(base, input) - code_base,
          end: source_offset(base, rest) - code_base,
          desc: Dollar(index),
        })
        continue rest, depth
      }
      (
        (
          re"^\$" +
          (re"(?:startpos|endpos|loc)" as kind) +
          re"\([ \t]*" +
          (re"(?:\$[0-9]+|[A-Za-z_][A-Za-z0-9_]*)" as argument) +
          re"[ \t]*\)"
        ) as raw,
        after=rest,
      ) => {
        buf.write_string(raw.to_owned())
        let arg : @ast.ClauseItemIdent = if argument.has_prefix("$") {
          let index = @string.parse_int(argument[1:], base=10) catch {
            err => abort(Show::to_string(err))
          }
          Dollar(index)
        } else {
          Name(argument.to_owned())
        }
        subst.push({
          start: source_offset(base, input) - code_base,
          end: source_offset(base, rest) - code_base,
          desc: match kind {
            "startpos" => StartPosOf(arg)
            "endpos" => EndPosOf(arg)
            "loc" => LocOf(arg)
            _ => panic()
          },
        })
        continue rest, depth
      }
      (
        (re"^\$" + (re"(?:startpos|endpos|loc|symbolstartpos|sloc)" as kind)) as raw,
        after=rest,
      ) => {
        buf.write_string(raw.to_owned())
        subst.push({
          start: source_offset(base, input) - code_base,
          end: source_offset(base, rest) - code_base,
          desc: match kind {
            "startpos" => StartPos
            "endpos" => EndPos
            "loc" => Loc
            "symbolstartpos" => SymbolStartPos
            "sloc" => Sloc
            _ => panic()
          },
        })
        continue rest, depth
      }
      (re"^\$[A-Za-z_][A-Za-z0-9_]*" as raw, after=rest) => {
        buf.write_string(raw.to_owned())
        continue rest, depth
      }
      (re"^." as ch, after=rest) => {
        buf.write_char(ch)
        continue rest, depth
      }
      re"^$" => raise UnexpectedEndOfFile
    }
  }
}

///|
pub fn new_lexer(input : String) -> Lexer {
  let base = input[:]
  { base, rest: base, phase: 0, }
}

///|
pub fn Lexer::next_token(self : Lexer) -> (Token, Int, Int) raise LexError {
  for input = self.rest {
    let start = source_offset(self.base, input)
    lexmatch input with longest {
      (re"^[ \t\r\n]+", after=rest) => continue rest
      (re"^[(][*][)]", after=rest) => continue rest
      (re"^[(][*]", after=rest) => continue skip_nested_comment(rest)
      (re"^/[*]([^/]|/[^*])*[*]/", after=rest) => continue rest
      (re"^//[^\r\n]*(?:\r|\n)?", after=rest) => continue rest
      (
        re"^@" +
        (re"[A-Za-z_][A-Za-z0-9_]*(?:/[A-Za-z_][A-Za-z0-9_]*)*" as pkg) +
        re"\." +
        (re"[A-Za-z_][A-Za-z0-9_]*" as id),
        after=rest,
      ) => {
        self.rest = rest
        break (
          PKG_AND_IDENT((pkg.to_owned(), id.to_owned())),
          start,
          source_offset(self.base, rest),
        )
      }
      (re"^[A-Za-z_][A-Za-z0-9_]*" as ident, after=rest) => {
        self.rest = rest
        break (IDENT(ident.to_owned()), start, source_offset(self.base, rest))
      }
      (re"^%start", after=rest) => {
        self.rest = rest
        break (PERCENT_START, start, source_offset(self.base, rest))
      }
      (re"^%token", after=rest) => {
        self.rest = rest
        break (PERCENT_TOKEN, start, source_offset(self.base, rest))
      }
      (re"^%type", after=rest) => {
        self.rest = rest
        break (PERCENT_TYPE, start, source_offset(self.base, rest))
      }
      (re"^%position", after=rest) => {
        self.rest = rest
        break (PERCENT_POSITION, start, source_offset(self.base, rest))
      }
      (re"^%left", after=rest) => {
        self.rest = rest
        break (PERCENT_LEFT, start, source_offset(self.base, rest))
      }
      (re"^%right", after=rest) => {
        self.rest = rest
        break (PERCENT_RIGHT, start, source_offset(self.base, rest))
      }
      (re"^%nonassoc", after=rest) => {
        self.rest = rest
        break (PERCENT_NONASSOC, start, source_offset(self.base, rest))
      }
      (re"^%prec", after=rest) => {
        self.rest = rest
        break (PERCENT_PREC, start, source_offset(self.base, rest))
      }
      (re"^%derive", after=rest) => {
        self.rest = rest
        break (PERCENT_DERIVE, start, source_offset(self.base, rest))
      }
      (re"^%inline", after=rest) => {
        self.rest = rest
        break (PERCENT_INLINE, start, source_offset(self.base, rest))
      }
      (re"^%%", after=rest) => {
        self.phase += 1
        if self.phase == 1 {
          self.rest = rest
          break (PERCENT_PERCENT, start, source_offset(self.base, rest))
        } else {
          let code_start = source_offset(self.base, rest)
          let code = rest.to_owned()
          let eof = rest[rest.length():]
          let end = source_offset(self.base, eof)
          self.rest = eof
          break (
            PERCENT_PERCENT_CODE_EOF((code, code_start, end - code_start)),
            start,
            end,
          )
        }
      }
      (re"^->", after=rest) => {
        self.rest = rest
        break (ARROW, start, source_offset(self.base, rest))
      }
      (re"^:", after=rest) => {
        self.rest = rest
        break (COLON, start, source_offset(self.base, rest))
      }
      (re"^\|", after=rest) => {
        self.rest = rest
        break (BAR, start, source_offset(self.base, rest))
      }
      (re"^=", after=rest) => {
        self.rest = rest
        break (EQ, start, source_offset(self.base, rest))
      }
      (re"^;", after=rest) => {
        self.rest = rest
        break (SEMI, start, source_offset(self.base, rest))
      }
      (re"^%[{]", after=rest) => {
        let code_start = source_offset(self.base, rest)
        let (rest, code) = scan_percent_code(rest)
        let end = source_offset(self.base, rest)
        self.rest = rest
        break (
          PERCENT_LBRACE_CODE_PERCENT_RBRACE(
            (code, code_start, end - code_start),
          ),
          start,
          end,
        )
      }
      (re"^<", after=rest) => {
        let (rest, code) = scan_angle_code(rest)
        self.rest = rest
        break (LANGLE_CODE_RANGLE(code), start, source_offset(self.base, rest))
      }
      (re"^\[", after=rest) => {
        self.rest = rest
        break (LBRACKET, start, source_offset(self.base, rest))
      }
      (re"^\]", after=rest) => {
        self.rest = rest
        break (RBRACKET, start, source_offset(self.base, rest))
      }
      (re"^\(", after=rest) => {
        self.rest = rest
        break (LPAREN, start, source_offset(self.base, rest))
      }
      (re"^\)", after=rest) => {
        self.rest = rest
        break (RPAREN, start, source_offset(self.base, rest))
      }
      (re"^,", after=rest) => {
        self.rest = rest
        break (COMMA, start, source_offset(self.base, rest))
      }
      (re"^\?", after=rest) => {
        self.rest = rest
        break (QUESTION, start, source_offset(self.base, rest))
      }
      (re"^[{]", after=rest) => {
        let code_base = source_offset(self.base, rest)
        let (rest, code, subst) = scan_action_code(rest, self.base, code_base)
        self.rest = rest
        break (
          LBRACE_CODE_RBRACE((code, code_base, subst)),
          start,
          source_offset(self.base, rest),
        )
      }
      (re"^\"[^\"]+\"" as string, after=rest) => {
        self.rest = rest
        break (STRING(string.to_owned()), start, source_offset(self.base, rest))
      }
      (re"^." as ch, after=rest) => {
        self.rest = rest
        raise Unrecognized(ch, start)
      }
      re"^$" => {
        self.rest = input
        break (EOF, start, start)
      }
    }
  }
}
