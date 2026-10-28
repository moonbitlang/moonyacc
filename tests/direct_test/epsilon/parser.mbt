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
priv enum YYStack {
  YYEmpty
  YYCell_2_void(YYStack, Int, Int)
  YYCell_1(YYStack, Int, Int, Int)
}

///|
priv enum YYResult {
  YYAccept_0(Int)
  YYAccept_1(Unit)
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

  }
}

///|
fn yy_parse(
  tokens : Array[(Token, Int, Int)], entry : Int, initial_state : Int,
  initial_pos? : Int
) -> YYResult raise ParseError {
  let mut cursor = 0
  let initial_position = initial_pos.unwrap_or_else(() => tokens[0].1)
  let last_pos = initial_position
  let mut stack : YYStack = YYEmpty
  let mut state : Int = initial_state
  let error_stack : YYStack = YYEmpty
  let error_state = initial_state
  let mut lookahead : YYLookahead? = None
  let mut _yy_state_0 : Int = 0
  let mut _yy_position_0 : Int = initial_position
  let mut _yy_position_1 : Int = initial_position
  let mut _yy_value_2_0 : Int = 0
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
              0 => 2
              _ => 6
            }
        })
      1 =>
        ({
          ()
          // run state 2
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
              0 => 4
              _ => 6
            }
        })
      2 =>
        ({
          ()
          // reduce unit ->
          _yy_position_0 = if stack is YYEmpty {
            initial_position
          } else {
            yy_stack_end(stack)
          }
          yy_action_1()
          _yy_state_0 = state
          _yy_position_1 = _yy_position_0
          continue 3
        })
      3 =>
        ({
          ()
          // goto unit
          match _yy_state_0 {
            0 => ()
            _ => panic()
          }
          stack = YYCell_2_void(stack, state, _yy_position_1)
          state = 1
          continue 7
        })
      4 =>
        ({
          ()
          // reduce position ->
          _yy_position_0 = if stack is YYEmpty {
            initial_position
          } else {
            yy_stack_end(stack)
          }
          _yy_value_2_0 = yy_action_0(_yy_position_0)
          _yy_state_0 = state
          _yy_position_1 = _yy_position_0
          continue 5
        })
      5 =>
        ({
          ()
          // goto position
          match _yy_state_0 {
            2 => ()
            _ => panic()
          }
          stack = YYCell_1(stack, state, _yy_value_2_0, _yy_position_1)
          state = 3
          continue 8
        })
      6 =>
        ({
          ()
          yy_error(
            yy_stack_states(error_stack, error_state), lookahead.unwrap().token,
            (lookahead.unwrap().start, lookahead.unwrap().end)
          )
          panic()
        })
      7 =>
        ({
          ()
          match stack {
            YYCell_2_void(_, _, _) => ()
            _ => panic()
          }
          return YYAccept_1(())
        })
      8 =>
        ({
          ()
          let _yy_r21 = match stack {
            YYCell_1(_, _, _value, _) => _value
            _ => panic()
          }
          return YYAccept_0(_yy_r21)
        })
      _ => panic()
    }
  }
}

///|
pub fn position(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Int raise ParseError {
  match yy_parse(tokens, 1, 2, initial_pos?) {
    YYAccept_0(result) => result
    _ => panic()
  }
}

///|
pub fn unit(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Unit raise ParseError {
  match yy_parse(tokens, 0, 0, initial_pos?) {
    YYAccept_1(result) => result
    _ => panic()
  }
}

///|
fn yy_stack_tail(stack : YYStack) -> YYStack {
  match stack {
    YYCell_2_void(tail, _, _) => tail
    YYCell_1(tail, _, _, _) => tail
    YYEmpty => panic()
  }
}

///|
fn yy_stack_saved(stack : YYStack) -> Int {
  match stack {
    YYCell_2_void(_, saved, _) => saved
    YYCell_1(_, saved, _, _) => saved
    YYEmpty => panic()
  }
}

///|
fn yy_stack_end(stack : YYStack) -> Int {
  match stack {
    YYCell_2_void(_, _, end) => end
    YYCell_1(_, _, _, end) => end
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
