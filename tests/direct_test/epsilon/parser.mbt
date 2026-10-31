///|
pub(all) enum Token {

}

///|
pub fn Token::kind(self : Token) -> TokenKind {
  match self {

  }
}

///|
pub(all) enum TokenKind {

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

  }
}

///|
pub suberror ParseError {
  UnexpectedToken(Token, (Int, Int), Array[TokenKind])
  UnexpectedEndOfInput(Int, Array[TokenKind])
}

///|
// file:///./parser.mbty
// 7|          { $endpos}
fn yy_action_0(_before_rhs : Int) -> Int {
  let _end_pos = _before_rhs
  ({();  _end_pos
  })
}

///|
// file:///./parser.mbty
// 8|      { ()}
fn yy_action_1() -> Unit {
  ({();  ()
  })
}

///|
priv enum YYResult {
  YYAccept_0(Int)
  YYAccept_1(Unit)
}

///|
fn yy_parse(
  tokens : Array[(Token, Int, Int)], _entry : Int, _initial_state : Int,
  initial_pos? : Int
) -> YYResult {
  let mut cursor = 0
  let initial_position = initial_pos.unwrap_or_else(() => tokens[0].1)
  let last_pos = initial_position
  let mut _yy_token_token : Token? = None
  let mut _yy_token_start : Int = 0
  let mut _yy_token_end : Int = 0
  _yy_scope_1~: while true {
    _yy_scope_0~: while true {
      match _entry {
        0 =>
          ({
            ()
            break _yy_scope_1~
          })
        1 =>
          ({
            ()
            break _yy_scope_0~
          })
        _ => panic()
      }
    }
    // run state 2
    ({
      ()
      if cursor < tokens.length() {
        let (token, sp, ep) = tokens[cursor]
        cursor += 1
        _yy_token_token = Some(token)
        _yy_token_start = sp
        _yy_token_end = ep
      } else {
        _yy_token_token = None
        _yy_token_start = last_pos
        _yy_token_end = last_pos
      }
    })
    let _yy_r30 = initial_position
    let _yy_r31 = yy_action_0(_yy_r30)
    let _yy_bind0 = _yy_r31
    let _yy_r33 = _yy_bind0
    return YYAccept_0(_yy_r33)
  }
  // run state 0
  ({
    ()
    if cursor < tokens.length() {
      let (token, sp, ep) = tokens[cursor]
      cursor += 1
      _yy_token_token = Some(token)
      _yy_token_start = sp
      _yy_token_end = ep
    } else {
      _yy_token_token = None
      _yy_token_start = last_pos
      _yy_token_end = last_pos
    }
  })
  ignore(yy_action_1())
  return YYAccept_1(())
}

///|
pub fn position(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Int {
  match yy_parse(tokens, 1, 2, initial_pos?) {
    YYAccept_0(result) => result
    _ => panic()
  }
}

///|
pub fn unit(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Unit {
  match yy_parse(tokens, 0, 0, initial_pos?) {
    YYAccept_1(result) => result
    _ => panic()
  }
}

///|
let yy_diag_rows : FixedArray[Int] = [0, -2, 5, -2]

///|
let yy_diag_data : FixedArray[Int] = [2, 0, 6, 2, 3, 2, 0, 7, 1, 5]

///|
let yy_diag_reductions : FixedArray[(Int, Int)] = [(0, 2), (0, 1)]

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
      if code < 6 {
        (2, code - 2, 0)
      } else {
        let (count, lhs) = yy_diag_reductions[code - 6]
        (3, count, lhs)
      }
  }
}

///|
let yy_terminals : ReadOnlyArray[(Int, TokenKind)] = []

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
fn _yy_error(stack : @list.List[Int], token : Token?, loc : (Int, Int)) -> Unit raise ParseError {
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
