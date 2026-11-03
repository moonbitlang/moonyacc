///|
pub(all) enum Token {
  NUMBER(Int)
  TEXT(String)
}

///|
pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    NUMBER(_) => TK_NUMBER
    TEXT(_) => TK_TEXT
  }
}

///|
pub(all) enum TokenKind {
  TK_NUMBER
  TK_TEXT
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
      TK_TEXT => "TEXT"
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
    TK_TEXT => Repr("TEXT")
  }
}

///|
pub suberror ParseError {
  UnexpectedToken(Token, (Int, Int), Array[TokenKind])
  UnexpectedEndOfInput(Int, Array[TokenKind])
}

///|
// file:///./parser.mbty
// 6|       items {$1}
fn yy_action_0(_value_0 : Array[(String, Int, Int)]) -> Array[
  (String, Int, Int)
] {
  let _dollar1 = _value_0
  ({(); _dollar1
  })
}

///|
// file:///./parser.mbty
// 8|    n=NUMBER rest=items {[(Show::to_string(n), $startpos(n), $endpos(n)), ..rest]}
fn yy_action_1(
  _value_0 : Int, _value_1 : Array[(String, Int, Int)], _start_0 : Int,
  _end_0 : Int
) -> Array[(String, Int, Int)] {
  let n = _value_0
  let rest = _value_1
  let _start_pos_of_item0 = _start_0
  let _end_pos_of_item0 = _end_0
  ({(); [(Show::to_string(n), _start_pos_of_item0, _end_pos_of_item0), ..rest]
  })
}

///|
// file:///./parser.mbty
// 9|    t=TEXT rest=items {[(t, $startpos(t), $endpos(t)), ..rest]}
fn yy_action_2(
  _value_0 : String, _value_1 : Array[(String, Int, Int)], _start_0 : Int,
  _end_0 : Int
) -> Array[(String, Int, Int)] {
  let t = _value_0
  let rest = _value_1
  let _start_pos_of_item0 = _start_0
  let _end_pos_of_item0 = _end_0
  ({(); [(t, _start_pos_of_item0, _end_pos_of_item0), ..rest]
  })
}

///|
// file:///./parser.mbty
// 10|    {[]}
fn yy_action_3() -> Array[(String, Int, Int)] {
  ({(); []
  })
}

///|
priv enum YYResult {
  YYAccept_0(Array[(String, Int, Int)])
}

///|
priv struct YYStateStack {
  values : Array[Int]
  mut depth : Int
}

///|
fn yy_parse(
  tokens : Array[(Token, Int, Int)], _entry : Int, initial_state : Int,
  initial_pos? : Int
) -> YYResult {
  let mut cursor = 0
  let initial_position = initial_pos.unwrap_or_else(() => tokens[0].1)
  let mut last_pos = initial_position
  let stack : YYStateStack = YYStateStack::{values: [initial_state], depth: 1}
  let mut state : Int = initial_state
  let _yy_stack_0 : Array[String] = []
  let mut _yy_depth_0 : Int = 0
  let _yy_stack_1 : Array[Int] = []
  let mut _yy_depth_1 : Int = 0
  let _yy_stack_2 : Array[Int] = []
  let mut _yy_depth_2 : Int = 0
  let _yy_stack_3 : Array[Int] = []
  let mut _yy_depth_3 : Int = 0
  let mut _yy_token_token : Token? = None
  let mut _yy_token_start : Int = 0
  let mut _yy_token_end : Int = 0
  let mut _yy_value_0_0 : String = ""
  let mut _yy_position_0 : Int = initial_position
  let mut _yy_position_1 : Int = initial_position
  let mut _yy_value_2_0 : Array[(String, Int, Int)]? = None
  let mut _yy_value_3_0 : Int = 0
  let mut _yy_state_0 : Int = 0
  let mut _yy_control : Int = 0
  _yy_scope_2~: {
    _yy_scope_0~: {
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
      match _yy_token_token {
        None =>
          ({
            ()
            let _yy_r73 = yy_action_3()
            _yy_value_2_0 = Some(_yy_r73)
            break _yy_scope_2~
          })
        Some(NUMBER(_yy_r53)) =>
          ({
            ()
            let _yy_r54 = _yy_token_start
            let _yy_r55 = _yy_token_end
            _yy_value_3_0 = _yy_r53
            _yy_position_0 = _yy_r54
            _yy_position_1 = _yy_r55
            _yy_control = 3
            break _yy_scope_0~
          })
        Some(TEXT(_yy_r56)) =>
          ({
            ()
            let _yy_r57 = _yy_token_start
            let _yy_r58 = _yy_token_end
            _yy_value_0_0 = _yy_r56
            _yy_position_0 = _yy_r57
            _yy_position_1 = _yy_r58
            _yy_control = 1
            break _yy_scope_0~
          })
      }
    }
    _yy_scope_1~: {
      _yy_loop_3~: for _yy_cycle = () {
        match _yy_control {
          1 =>
            ({
              ()
              _yy_loop_4~: for _yy_cycle = () {
                // run state 2
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_value_0_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_value_0_0
                }
                _yy_depth_0 += 1
                if _yy_depth_1 == _yy_stack_1.length() {
                  _yy_stack_1.push(_yy_position_0)
                } else {
                  _yy_stack_1[_yy_depth_1] = _yy_position_0
                }
                _yy_depth_1 += 1
                if _yy_depth_2 == _yy_stack_2.length() {
                  _yy_stack_2.push(_yy_position_1)
                } else {
                  _yy_stack_2[_yy_depth_2] = _yy_position_1
                }
                _yy_depth_2 += 1
                yy_stack_push_unprotected(stack, 2)
                state = 2
                last_pos = _yy_token_end
                _yy_token_token = None
                _yy_token_start = 0
                _yy_token_end = 0
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
                match _yy_token_token {
                  None =>
                    ({
                      ()
                      let _yy_r81 = yy_action_3()
                      _yy_value_2_0 = Some(_yy_r81)
                      _yy_control = 2
                      break _yy_scope_1~
                    })
                  Some(NUMBER(_yy_r60)) =>
                    ({
                      ()
                      let _yy_r61 = _yy_token_start
                      let _yy_r62 = _yy_token_end
                      _yy_value_3_0 = _yy_r60
                      _yy_position_0 = _yy_r61
                      _yy_position_1 = _yy_r62
                      _yy_control = 3
                      continue _yy_loop_3~ ()
                    })
                  Some(TEXT(_yy_r63)) =>
                    ({
                      ()
                      let _yy_r64 = _yy_token_start
                      let _yy_r65 = _yy_token_end
                      _yy_value_0_0 = _yy_r63
                      _yy_position_0 = _yy_r64
                      _yy_position_1 = _yy_r65
                      continue _yy_loop_4~ ()
                    })
                }
              }
            })
          3 =>
            ({
              ()
              _yy_loop_5~: for _yy_cycle = () {
                // run state 4
                if _yy_depth_3 == _yy_stack_3.length() {
                  _yy_stack_3.push(_yy_value_3_0)
                } else {
                  _yy_stack_3[_yy_depth_3] = _yy_value_3_0
                }
                _yy_depth_3 += 1
                if _yy_depth_1 == _yy_stack_1.length() {
                  _yy_stack_1.push(_yy_position_0)
                } else {
                  _yy_stack_1[_yy_depth_1] = _yy_position_0
                }
                _yy_depth_1 += 1
                if _yy_depth_2 == _yy_stack_2.length() {
                  _yy_stack_2.push(_yy_position_1)
                } else {
                  _yy_stack_2[_yy_depth_2] = _yy_position_1
                }
                _yy_depth_2 += 1
                yy_stack_push_unprotected(stack, 4)
                state = 4
                last_pos = _yy_token_end
                _yy_token_token = None
                _yy_token_start = 0
                _yy_token_end = 0
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
                match _yy_token_token {
                  None =>
                    ({
                      ()
                      let _yy_r101 = yy_action_3()
                      _yy_value_2_0 = Some(_yy_r101)
                      _yy_control = 4
                      break _yy_scope_1~
                    })
                  Some(NUMBER(_yy_r66)) =>
                    ({
                      ()
                      let _yy_r67 = _yy_token_start
                      let _yy_r68 = _yy_token_end
                      _yy_value_3_0 = _yy_r66
                      _yy_position_0 = _yy_r67
                      _yy_position_1 = _yy_r68
                      continue _yy_loop_5~ ()
                    })
                  Some(TEXT(_yy_r69)) =>
                    ({
                      ()
                      let _yy_r70 = _yy_token_start
                      let _yy_r71 = _yy_token_end
                      _yy_value_0_0 = _yy_r69
                      _yy_position_0 = _yy_r70
                      _yy_position_1 = _yy_r71
                      _yy_control = 1
                      continue _yy_loop_3~ ()
                    })
                }
              }
            })
          _ => panic()
        }
      }
    }
    _yy_loop_6~: for _yy_cycle = () {
      match _yy_control {
        2 =>
          ({
            ()
            // run state 3
            let _yy_r87 = _yy_stack_0[_yy_depth_0 - 1]
            let _yy_r88 = _yy_stack_1[_yy_depth_1 - 1]
            let _yy_r89 = _yy_stack_2[_yy_depth_2 - 1]
            let _yy_r94 = yy_action_2(
              _yy_r87, _yy_value_2_0.unwrap(), _yy_r88, _yy_r89
            )
            _yy_depth_0 -= 1
            _yy_depth_1 -= 1
            _yy_depth_2 -= 1
            stack.depth -= 1
            state = stack.values[stack.depth - 1]
            let _yy_r95 = state
            _yy_state_0 = _yy_r95
            _yy_value_2_0 = Some(_yy_r94)
          })
        4 =>
          ({
            ()
            // run state 5
            let _yy_r107 = _yy_stack_3[_yy_depth_3 - 1]
            let _yy_r108 = _yy_stack_1[_yy_depth_1 - 1]
            let _yy_r109 = _yy_stack_2[_yy_depth_2 - 1]
            let _yy_r114 = yy_action_1(
              _yy_r107, _yy_value_2_0.unwrap(), _yy_r108, _yy_r109
            )
            _yy_depth_3 -= 1
            _yy_depth_1 -= 1
            _yy_depth_2 -= 1
            stack.depth -= 1
            state = stack.values[stack.depth - 1]
            let _yy_r115 = state
            _yy_state_0 = _yy_r115
            _yy_value_2_0 = Some(_yy_r114)
          })
        _ => panic()
      }
      // goto items
      match _yy_state_0 {
        0 =>
          ({
            ()
            break _yy_scope_2~
          })
        2 =>
          ({
            ()
            _yy_control = 2
            continue _yy_loop_6~ ()
          })
        4 =>
          ({
            ()
            _yy_control = 4
            continue _yy_loop_6~ ()
          })
        _ => panic()
      }
    }
  }
  // run state 6
  let _yy_r124 = yy_action_0(_yy_value_2_0.unwrap())
  let _yy_bind0 = _yy_r124
  let _yy_r125 = _yy_bind0
  return YYAccept_0(_yy_r125)
}

///|
pub fn start(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Array[
  (String, Int, Int)
] {
  match yy_parse(tokens, 0, 0, initial_pos?) {
    YYAccept_0(result) => result
  }
}

///|
fn yy_stack_push_unprotected(stack : YYStateStack, state : Int) -> Unit {
  if stack.depth == stack.values.length() {
    stack.values.push(state)
  } else {
    stack.values[stack.depth] = state
  }
  stack.depth += 1
}

///|
let yy_diag_rows : FixedArray[Int] = [0, -2, 11, -11, 20, -11, -12]

///|
let yy_diag_data : FixedArray[Int] = [
  5, 0, 9, 1, 6, 2, 4, 3, 3, 4, 8, 4, 0, 9, 1, 6, 2, 4, 4, 5, 4, 0, 9, 1, 6, 2,
  4, 4, 7
]

///|
let yy_diag_reductions : FixedArray[(Int, Int)] = [(0, 4), (2, 4), (1, 3)]

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
      if code < 9 {
        (2, code - 2, 0)
      } else {
        let (count, lhs) = yy_diag_reductions[code - 9]
        (3, count, lhs)
      }
  }
}

///|
let yy_terminals : ReadOnlyArray[(Int, TokenKind)] = [
  (1, TK_NUMBER), (2, TK_TEXT)
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
