///|
pub(all) enum Token {
  VALUE(Char)
}

///|
pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    VALUE(_) => TK_VALUE
  }
}

///|
pub(all) enum TokenKind {
  TK_VALUE
}

///|
#deprecated("Use Show::output or Show::to_string instead")
#doc(hidden)
pub extend TokenKind with Show::{output, to_string}

///|
pub impl Show for TokenKind with fn output(self, logger) {
  Logger::write_string(
    logger,
    match self {
      TK_VALUE => "VALUE"
    }
  )
}

///|
#deprecated("Use Debug::to_repr instead")
#doc(hidden)
pub extend TokenKind with Debug::{to_repr}

///|
pub impl Debug for TokenKind with fn to_repr(self) {
  match self {
    TK_VALUE => Repr("VALUE")
  }
}

///|
pub suberror ParseError {
  UnexpectedToken(Token, (Int, Int), Array[TokenKind])
  UnexpectedEndOfInput(Int, Array[TokenKind])
}

///|
// file:///./parser.mbty
// 5|       VALUE { $1}
fn yy_action_0(_value_0 : Char) -> Char {
  let _dollar1 = _value_0
  ({();  _dollar1
  })
}

///|
priv enum YYResult {
  YYAccept_0(Char)
}

///|
fn yy_symbol(token : Token) -> Int {
  match token {
    VALUE(_) => 1
  }
}

///|
fn yy_parse(
  tokens : Array[(Token, Int, Int)], entry : Int, initial_state : Int,
  initial_pos? : Int
) -> YYResult raise ParseError {
  let mut cursor = 0
  let initial_position = initial_pos.unwrap_or_else(() => tokens[0].1)
  let mut last_pos = initial_position
  let mut error_depth : Int = 0
  let mut error_suffix_0 : Int = 0
  let mut _yy_token_symbol : Int = 0
  let mut _yy_token_token : Token? = None
  let mut _yy_token_start : Int = 0
  let mut _yy_token_end : Int = 0
  match entry {
    0 =>
      ({
        ()
        // run state 0
        ({
          ()
          if cursor < tokens.length() {
            let (token, sp, ep) = tokens[cursor]
            cursor += 1
            _yy_token_symbol = yy_symbol(token)
            _yy_token_token = Some(token)
            _yy_token_start = sp
            _yy_token_end = ep
          } else {
            _yy_token_symbol = 0
            _yy_token_token = None
            _yy_token_start = last_pos
            _yy_token_end = last_pos
          }
        })
        match _yy_token_symbol {
          1 =>
            ({
              ()
              let VALUE(_yy_token_value) = _yy_token_token.unwrap()
              let _yy_r16 = _yy_token_value
              last_pos = _yy_token_end
              _yy_token_token = None
              _yy_token_start = 0
              _yy_token_end = 0
              error_suffix_0 = 2
              error_depth = 1
              let _yy_r27 = yy_action_0(_yy_r16)
              let _yy_bind0 = _yy_r27
              let _yy_r29 = _yy_bind0
              return YYAccept_0(_yy_r29)
            })
          _ =>
            ({
              ()
              yy_error(
                ({
                  ()
                  let mut _yy_error_states = @list.List([initial_state])
                  if error_depth > 0 {
                    _yy_error_states = @list.cons(
                      error_suffix_0, _yy_error_states
                    )
                  }
                  _yy_error_states
                }), _yy_token_token, (_yy_token_start, _yy_token_end)
              )
              panic()
            })
        }
      })
    _ => panic()
  }
}

///|
pub fn start(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Char raise ParseError {
  match yy_parse(tokens, 0, 0, initial_pos?) {
    YYAccept_0(result) => result
  }
}

///|
let yy_diag_rows : FixedArray[Int] = [0, -2, -6]

///|
let yy_diag_data : FixedArray[Int] = [2, 1, 4, 2, 3]

///|
let yy_diag_reductions : FixedArray[(Int, Int)] = [(1, 2)]

///|
fn yy_diag_lookup(state : Int, symbol : Int) -> Int {
  let row = yy_diag_rows[state]
  if row < 0 {
    return -row - 1
  }
  for lo = 0, hi = yy_diag_data[row]; lo < hi {
    let mid = lo + (hi - lo) / 2
    let entry = row + 1 + mid * 2
    let key = yy_diag_data[entry]
    if symbol < key {
      continue lo, mid
    }
    if symbol > key {
      continue mid + 1, hi
    }
    return yy_diag_data[entry + 1]
  }
  0
}

///|
fn yy_diagnostic(state : Int, symbol : Int) -> (Int, Int, Int) {
  let code = yy_diag_lookup(state, symbol)
  match code {
    0 => (0, 0, 0)
    1 => (1, 0, 0)
    _ =>
      if code < 5 {
        (2, code - 2, 0)
      } else {
        let (count, lhs) = yy_diag_reductions[code - 5]
        (3, count, lhs)
      }
  }
}

///|
let yy_terminals : ReadOnlyArray[(Int, TokenKind)] = [(1, TK_VALUE)]

///|
fn yy_expected(stack : @list.List[Int], terminal : Int) -> Bool {
  for stack = stack, symbol = terminal {
    guard stack is More(state, ..) else {
      return false
    }
    let (kind, arg, lhs) = yy_diagnostic(state, symbol)
    match kind {
      0 =>
        ({
          ()
          return false
        })
      1 =>
        ({
          ()
          return true
        })
      2 =>
        ({
          ()
          if symbol == terminal {
            return true
          }
          continue @list.cons(arg, stack), terminal
        })
      3 =>
        ({
          ()
          continue stack.drop(arg), lhs
        })
      _ => panic()
    }
  }
}

///|
fn yy_error(stack : @list.List[Int], token : Token?, loc : (Int, Int)) -> Unit raise ParseError {
  let expected = []
  for i in 0..<yy_terminals.length() {
    let (symbol, kind) = yy_terminals[i]
    if yy_expected(stack, symbol) {
      expected.push(kind)
    }
  }
  match token {
    None =>
      ({
        ()
        raise UnexpectedEndOfInput(loc.1, expected)
      })
    Some(token) =>
      ({
        ()
        raise UnexpectedToken(token, loc, expected)
      })
  }
}
