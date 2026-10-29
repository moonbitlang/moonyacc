
let marked : Ref[Int] = Ref(0)

///|
pub(all) enum Token {
  NUMBER(Int)
  PLUS
  STAR
  LPAREN
  RPAREN
  EOF
}

///|
pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    NUMBER(_) => TK_NUMBER
    PLUS => TK_PLUS
    STAR => TK_STAR
    LPAREN => TK_LPAREN
    RPAREN => TK_RPAREN
    EOF => TK_EOF
  }
}

///|
pub(all) enum TokenKind {
  TK_NUMBER
  TK_PLUS
  TK_STAR
  TK_LPAREN
  TK_RPAREN
  TK_EOF
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
      TK_NUMBER => "NUMBER"
      TK_PLUS => "PLUS"
      TK_STAR => "STAR"
      TK_LPAREN => "LPAREN"
      TK_RPAREN => "RPAREN"
      TK_EOF => "EOF"
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
    TK_NUMBER => Repr("NUMBER")
    TK_PLUS => Repr("PLUS")
    TK_STAR => Repr("STAR")
    TK_LPAREN => Repr("LPAREN")
    TK_RPAREN => Repr("RPAREN")
    TK_EOF => Repr("EOF")
  }
}

///|
pub suberror ParseError {
  UnexpectedToken(Token, (Unit, Unit), Array[TokenKind])
  UnexpectedEndOfInput(Unit, Array[TokenKind])
}

///|
// file:///./parser.mbty
// 14|       marker expr EOF { $2}
fn yy_action_0(_value_1 : Int) -> Int {
  let _dollar2 = _value_1
  ({();  _dollar2
  })
}

///|
// file:///./parser.mbty
// 18|    NUMBER { $1}
fn yy_action_1(_value_0 : Int) -> Int {
  let _dollar1 = _value_0
  ({();  _dollar1
  })
}

///|
// file:///./parser.mbty
// 19|    expr PLUS expr { $1 + $3}
fn yy_action_2(_value_0 : Int, _value_2 : Int) -> Int {
  let _dollar1 = _value_0
  let _dollar3 = _value_2
  ({();  _dollar1 + _dollar3
  })
}

///|
// file:///./parser.mbty
// 20|    expr STAR expr { $1 * $3}
fn yy_action_3(_value_0 : Int, _value_2 : Int) -> Int {
  let _dollar1 = _value_0
  let _dollar3 = _value_2
  ({();  _dollar1 * _dollar3
  })
}

///|
// file:///./parser.mbty
// 21|    LPAREN expr RPAREN { $2}
fn yy_action_4(_value_1 : Int) -> Int {
  let _dollar2 = _value_1
  ({();  _dollar2
  })
}

///|
// file:///./parser.mbty
// 15|                { marked.val += 1; ()}
fn yy_action_5() -> Unit {
  ({();  marked.val += 1; ()
  })
}

///|
// file:///./parser.mbty
// 23|       { ignore($loc); 42}
fn yy_action_6() -> Int {
  let _start_pos = ()
  let _end_pos = ()
  ({();  ignore((_start_pos, _end_pos)); 42
  })
}

///|
priv enum YYResult {
  YYAccept_0(Int)
  YYAccept_1(Int)
}

///|
priv struct YYStateStack {
  values : Array[Int]
  mut depth : Int
  mut checkpoint : Int
  mut saved_prefix : Int
  undo : Array[Int]
}

///|
fn yy_symbol(token : Token) -> Int {
  match token {
    NUMBER(_) => 1
    PLUS => 2
    STAR => 3
    LPAREN => 4
    RPAREN => 5
    EOF => 6
  }
}

///|
fn yy_parse(
  tokens : Array[(Token, Unit, Unit)], entry : Int, initial_state : Int,
  initial_pos? : Unit
) -> YYResult raise ParseError {
  let mut cursor = 0
  ignore(initial_pos.unwrap_or_else(() => tokens[0].1))
  let stack : YYStateStack = YYStateStack::{
    values: [initial_state], depth: 1, checkpoint: 1, saved_prefix: 1, undo: []
  }
  let mut state : Int = initial_state
  let _yy_stack_0 : Array[Int] = []
  let mut _yy_depth_0 : Int = 0
  let mut error_depth : Int = 0
  let mut error_suffix_0 : Int = 0
  let mut error_suffix_1 : Int = 0
  let mut _yy_token_symbol : Int = 0
  let mut _yy_token_token : Token? = None
  let mut _yy_token_ready : Bool = false
  let mut _yy_value_0_0 : Int = 0
  let mut _yy_state_0 : Int = 0
  for pc = entry {
    match pc {
      0 =>
        ({
          ()
          // run state 0
          ({
            ()
            if cursor < tokens.length() {
              let (token, _, _) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_ready = true
            }
          })
          match _yy_token_symbol {
            0 =>
              ({
                ()
                let _yy_r169 = yy_action_6()
                let _yy_bind0 = _yy_r169
                let _yy_r254 = _yy_bind0
                return YYAccept_1(_yy_r254)
              })
            _ =>
              ({
                ()
                continue 11
              })
          }
        })
      1 =>
        ({
          ()
          // run state 2
          ({
            ()
            if cursor < tokens.length() {
              let (token, _, _) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_ready = true
            }
          })
          match _yy_token_symbol {
            1 | 4 =>
              ({
                ()
                ignore(yy_action_5())
                yy_stack_push(stack, 4)
                state = 4
                match _yy_token_symbol {
                  1 =>
                    ({
                      ()
                      guard! _yy_token_token.unwrap() is NUMBER(_yy_token_value)
                      let _yy_r260 = _yy_token_value
                      _yy_value_0_0 = _yy_r260
                      continue 9
                    })
                  4 =>
                    ({
                      ()
                      continue 3
                    })
                  _ =>
                    ({
                      ()
                      continue 11
                    })
                }
              })
            _ =>
              ({
                ()
                continue 11
              })
          }
        })
      2 =>
        ({
          ()
          // run state 3
          return YYAccept_0(_yy_value_0_0)
        })
      3 =>
        ({
          ()
          // run state 5
          yy_stack_push(stack, 5)
          state = 5
          _yy_token_token = None
          _yy_token_ready = false
          yy_stack_checkpoint(stack)
          error_depth = 0
          ({
            ()
            if cursor < tokens.length() {
              let (token, _, _) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_ready = true
            }
          })
          match _yy_token_symbol {
            1 =>
              ({
                ()
                guard! _yy_token_token.unwrap() is NUMBER(_yy_token_value)
                let _yy_r123 = _yy_token_value
                _yy_value_0_0 = _yy_r123
                continue 9
              })
            4 =>
              ({
                ()
                continue 3
              })
            _ =>
              ({
                ()
                continue 11
              })
          }
        })
      4 =>
        ({
          ()
          // run state 6
          if !_yy_token_ready {
            if cursor < tokens.length() {
              let (token, _, _) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_ready = true
            }
          }
          match _yy_token_symbol {
            2 =>
              ({
                ()
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_value_0_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_value_0_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 6)
                state = 6
                continue 7
              })
            3 =>
              ({
                ()
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_value_0_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_value_0_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 6)
                state = 6
                continue 5
              })
            5 =>
              ({
                ()
                _yy_token_token = None
                _yy_token_ready = false
                yy_stack_checkpoint(stack)
                error_suffix_0 = 6
                error_suffix_1 = 7
                error_depth = 2
                let _yy_r194 = yy_action_4(_yy_value_0_0)
                stack.depth -= 1
                state = stack.values[stack.depth - 1]
                let _yy_r195 = state
                _yy_state_0 = _yy_r195
                _yy_value_0_0 = _yy_r194
                continue 12
              })
            _ =>
              ({
                ()
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_value_0_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_value_0_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 6)
                state = 6
                continue 11
              })
          }
        })
      5 =>
        ({
          ()
          // run state 8
          yy_stack_push(stack, 8)
          state = 8
          _yy_token_token = None
          _yy_token_ready = false
          yy_stack_checkpoint(stack)
          error_depth = 0
          ({
            ()
            if cursor < tokens.length() {
              let (token, _, _) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_ready = true
            }
          })
          match _yy_token_symbol {
            1 =>
              ({
                ()
                guard! _yy_token_token.unwrap() is NUMBER(_yy_token_value)
                let _yy_r138 = _yy_token_value
                _yy_value_0_0 = _yy_r138
                continue 9
              })
            4 =>
              ({
                ()
                continue 3
              })
            _ =>
              ({
                ()
                continue 11
              })
          }
        })
      6 =>
        ({
          ()
          // run state 9
          let _yy_r200 = _yy_stack_0[_yy_depth_0 - 1]
          let _yy_r210 = yy_action_3(_yy_r200, _yy_value_0_0)
          _yy_depth_0 -= 1
          stack.depth -= 2
          state = stack.values[stack.depth - 1]
          let _yy_r211 = state
          _yy_state_0 = _yy_r211
          _yy_value_0_0 = _yy_r210
          continue 12
        })
      7 =>
        ({
          ()
          // run state 10
          yy_stack_push(stack, 10)
          state = 10
          _yy_token_token = None
          _yy_token_ready = false
          yy_stack_checkpoint(stack)
          error_depth = 0
          ({
            ()
            if cursor < tokens.length() {
              let (token, _, _) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_ready = true
            }
          })
          match _yy_token_symbol {
            1 =>
              ({
                ()
                guard! _yy_token_token.unwrap() is NUMBER(_yy_token_value)
                let _yy_r144 = _yy_token_value
                _yy_value_0_0 = _yy_r144
                continue 9
              })
            4 =>
              ({
                ()
                continue 3
              })
            _ =>
              ({
                ()
                continue 11
              })
          }
        })
      8 =>
        ({
          ()
          // run state 11
          if !_yy_token_ready {
            if cursor < tokens.length() {
              let (token, _, _) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_ready = true
            }
          }
          match _yy_token_symbol {
            2 | 5 | 6 =>
              ({
                ()
                let _yy_r216 = _yy_stack_0[_yy_depth_0 - 1]
                let _yy_r226 = yy_action_2(_yy_r216, _yy_value_0_0)
                _yy_depth_0 -= 1
                stack.depth -= 2
                state = stack.values[stack.depth - 1]
                let _yy_r227 = state
                _yy_state_0 = _yy_r227
                _yy_value_0_0 = _yy_r226
                continue 12
              })
            3 =>
              ({
                ()
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_value_0_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_value_0_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 11)
                state = 11
                continue 5
              })
            _ =>
              ({
                ()
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_value_0_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_value_0_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 11)
                state = 11
                continue 11
              })
          }
        })
      9 =>
        ({
          ()
          // run state 12
          _yy_token_token = None
          _yy_token_ready = false
          yy_stack_checkpoint(stack)
          error_suffix_0 = 12
          error_depth = 1
          let _yy_r236 = yy_action_1(_yy_value_0_0)
          let _yy_r237 = state
          _yy_state_0 = _yy_r237
          _yy_value_0_0 = _yy_r236
          continue 12
        })
      10 =>
        ({
          ()
          // run state 13
          if !_yy_token_ready {
            if cursor < tokens.length() {
              let (token, _, _) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_ready = true
            }
          }
          match _yy_token_symbol {
            2 =>
              ({
                ()
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_value_0_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_value_0_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 13)
                state = 13
                continue 7
              })
            3 =>
              ({
                ()
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_value_0_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_value_0_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 13)
                state = 13
                continue 5
              })
            6 =>
              ({
                ()
                _yy_token_token = None
                _yy_token_ready = false
                yy_stack_checkpoint(stack)
                error_suffix_0 = 13
                error_suffix_1 = 14
                error_depth = 2
                let _yy_r252 = yy_action_0(_yy_value_0_0)
                stack.depth -= 1
                state = stack.values[stack.depth - 1]
                _yy_value_0_0 = _yy_r252
                continue 13
              })
            _ =>
              ({
                ()
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_value_0_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_value_0_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 13)
                state = 13
                continue 11
              })
          }
        })
      11 =>
        ({
          ()
          yy_error(
            ({
              ()
              let mut _yy_error_states = yy_stack_snapshot(stack)
              if error_depth > 0 {
                _yy_error_states = @list.cons(error_suffix_0, _yy_error_states)
              }
              if error_depth > 1 {
                _yy_error_states = @list.cons(error_suffix_1, _yy_error_states)
              }
              _yy_error_states
            }), _yy_token_token, ((), ())
          )
          panic()
        })
      12 =>
        ({
          ()
          // goto expr
          continue match _yy_state_0 {
              4 => 10
              5 => 4
              8 => 6
              10 => 8
              _ => panic()
            }
        })
      13 =>
        ({
          ()
          // goto start
          continue 2
        })
      _ => panic()
    }
  }
}

///|
pub fn start(tokens : Array[(Token, Unit, Unit)], initial_pos? : Unit) -> Int raise ParseError {
  match yy_parse(tokens, 1, 2, initial_pos?) {
    YYAccept_0(result) => result
    _ => panic()
  }
}

///|
pub fn empty(tokens : Array[(Token, Unit, Unit)], initial_pos? : Unit) -> Int raise ParseError {
  match yy_parse(tokens, 0, 0, initial_pos?) {
    YYAccept_1(result) => result
    _ => panic()
  }
}

///|
fn yy_stack_push(stack : YYStateStack, state : Int) -> Unit {
  while stack.saved_prefix > stack.depth {
    stack.saved_prefix -= 1
    if stack.checkpoint - stack.saved_prefix - 1 == stack.undo.length() {
      stack.undo.push(stack.values[stack.saved_prefix])
    } else {
      stack.undo[stack.checkpoint - stack.saved_prefix - 1] = stack.values[stack.saved_prefix]
    }
  }
  if stack.depth == stack.values.length() {
    stack.values.push(state)
  } else {
    stack.values[stack.depth] = state
  }
  stack.depth += 1
}

///|
fn yy_stack_checkpoint(stack : YYStateStack) -> Unit {
  stack.checkpoint = stack.depth
  stack.saved_prefix = stack.depth
}

///|
fn yy_stack_snapshot(stack : YYStateStack) -> @list.List[Int] {
  let mut states : @list.List[Int] = @list.List([])
  for i = 0; i < stack.checkpoint; i = i + 1 {
    states = @list.cons(
      if i < stack.saved_prefix {
        stack.values[i]
      } else {
        stack.undo[stack.checkpoint - i - 1]
      }, states
    )
  }
  states
}

///|
let yy_diag_rows : FixedArray[Int] = [
  0, -2, 5, -2, 14, 21, 28, -20, 35, -20, 42, 49, -21, 58, -22
]

///|
let yy_diag_data : FixedArray[Int] = [
  2, 0, 17, 10, 3, 4, 1, 18, 4, 18, 7, 5, 8, 6, 3, 1, 14, 4, 7, 9, 15, 3, 1, 14,
  4, 7, 9, 8, 3, 2, 12, 3, 10, 5, 9, 3, 1, 14, 4, 7, 9, 11, 3, 1, 14, 4, 7, 9,
  13, 4, 2, 19, 3, 10, 5, 19, 6, 19, 3, 2, 12, 3, 10, 6, 16
]

///|
let yy_diag_reductions : FixedArray[(Int, Int)] = [
  (0, 10), (0, 8), (3, 9), (1, 9), (3, 7)
]

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
      if code < 17 {
        (2, code - 2, 0)
      } else {
        let (count, lhs) = yy_diag_reductions[code - 17]
        (3, count, lhs)
      }
  }
}

///|
let yy_terminals : ReadOnlyArray[(Int, TokenKind)] = [
  (1, TK_NUMBER), (2, TK_PLUS), (3, TK_STAR), (4, TK_LPAREN), (5, TK_RPAREN),
  (6, TK_EOF)
]

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
fn yy_error(stack : @list.List[Int], token : Token?, loc : (Unit, Unit)) -> Unit raise ParseError {
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
