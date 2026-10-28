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
priv enum YYStack {
  YYEmpty
  YYCell_2(YYStack, Int, Char)
}

///|
priv enum YYResult {
  YYAccept_0(Char)
}

///|
priv struct YYLookahead {
  symbol : Int
  token : Token?
  start : Int
  end : Int
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
  let mut stack : YYStack = YYEmpty
  let mut state : Int = initial_state
  let mut error_stack : YYStack = YYEmpty
  let mut error_state : Int = initial_state
  let mut error_depth : Int = 0
  let mut error_suffix_0 : Int = 0
  let mut lookahead : YYLookahead? = None
  for pc = entry {
    match pc {
      0 =>
        ({
          ()
          // run state 0
          if lookahead is None {
            if cursor < tokens.length() {
              let (token, sp, ep) = tokens[cursor]
              cursor += 1
              lookahead = Some(
                YYLookahead::{
                  symbol: yy_symbol(token), token: Some(token), start: sp,
                  end: ep
                }
              )
            } else {
              lookahead = Some(
                YYLookahead::{
                  symbol: 0, token: None, start: last_pos, end: last_pos
                }
              )
            }
          }
          continue match lookahead.unwrap().symbol {
              1 => 3
              _ => 1
            }
        })
      1 =>
        ({
          ()
          yy_error(
            ({
              ()
              let mut _yy_error_states = yy_stack_states(
                error_stack, error_state
              )
              if error_depth > 0 {
                _yy_error_states = @list.cons(error_suffix_0, _yy_error_states)
              }
              _yy_error_states
            }), lookahead.unwrap().token,
            (lookahead.unwrap().start, lookahead.unwrap().end)
          )
          panic()
        })
      2 =>
        ({
          ()
          let _yy_r16 = match stack {
            YYCell_2(_, _, _value) => _value
            _ => panic()
          }
          return YYAccept_0(_yy_r16)
        })
      3 =>
        ({
          ()
          // shift VALUE into state 2
          let VALUE(_yy_token_value) = lookahead.unwrap().token.unwrap()
          let _yy_r17 = _yy_token_value
          let _yy_r18 = lookahead.unwrap().start
          let _yy_r19 = lookahead.unwrap().end
          last_pos = lookahead.unwrap().end
          lookahead = None
          error_stack = stack
          error_state = state
          error_suffix_0 = 2
          error_depth = 1
          let _yy_r24 = yy_action_0(_yy_r17)
          let _yy_r25 = state
          stack = YYCell_2(stack, state, _yy_r24)
          state = 1
          continue 2
        })
      _ => panic()
    }
  }
}

///|
pub fn start(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Char raise ParseError {
  match yy_parse(tokens, 0, 0, initial_pos?) {
    YYAccept_0(result) => result
  }
}

///|
fn yy_stack_tail(stack : YYStack) -> YYStack {
  match stack {
    YYCell_2(tail, _, _) => tail
    YYEmpty => panic()
  }
}

///|
fn yy_stack_saved(stack : YYStack) -> Int {
  match stack {
    YYCell_2(_, saved, _) => saved
    YYEmpty => panic()
  }
}

///|
fn yy_stack_states(stack : YYStack, state : Int) -> @list.List[Int] {
  let states : Array[Int] = []
  for stack = stack, state = state {
    states.push(state)
    if stack is YYEmpty {
      break
    }
    continue yy_stack_tail(stack), yy_stack_saved(stack)
  }
  let mut result : @list.List[Int] = @list.List([])
  for i = states.length() - 1; i >= 0; i = i - 1 {
    result = @list.cons(states[i], result)
  }
  result
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
