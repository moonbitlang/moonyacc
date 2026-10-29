
let reductions : Ref[Int] = Ref(0)

///|
pub(all) enum Token {
  NUMBER(Int)
  PLUS
  STAR
  EQ
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
    EQ => TK_EQ
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
  TK_EQ
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
      TK_EQ => "EQ"
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
    TK_EQ => Repr("EQ")
    TK_LPAREN => Repr("LPAREN")
    TK_RPAREN => Repr("RPAREN")
    TK_EOF => Repr("EOF")
  }
}

///|
pub suberror ParseError {
  UnexpectedToken(Token, (Int, Int), Array[TokenKind])
  UnexpectedEndOfInput(Int, Array[TokenKind])
}

///|
// file:///./parser.mbty
// 17|       e=expr EOF { (e, $startpos(e), $endpos(e))}
fn yy_action_0(_value_0 : Int, _start_0 : Int, _end_0 : Int) -> (Int, Int, Int) {
  let e = _value_0
  let _start_pos_of_item0 = _start_0
  let _end_pos_of_item0 = _end_0
  ({();  (e, _start_pos_of_item0, _end_pos_of_item0)
  })
}

///|
// file:///./parser.mbty
// 28|    atom { $1}
fn yy_action_2(_value_1 : Int) -> Int {
  let _sub_action_0_result = yy_action_1(_value_1)
  let _dollar1 = _sub_action_0_result
  ({();  _dollar1
  })
}

///|
// file:///./parser.mbty
// 35|    LPAREN expr RPAREN { $2}
fn yy_action_1(_value_1 : Int) -> Int {
  let _dollar2 = _value_1
  ({();  _dollar2
  })
}

///|
// file:///./parser.mbty
// 28|    atom { $1}
fn yy_action_4(_value_0 : Int) -> Int {
  let _sub_action_0_result = yy_action_3(_value_0)
  let _dollar1 = _sub_action_0_result
  ({();  _dollar1
  })
}

///|
// file:///./parser.mbty
// 34|    NUMBER { $1}
fn yy_action_3(_value_0 : Int) -> Int {
  let _dollar1 = _value_0
  ({();  _dollar1
  })
}

///|
// file:///./parser.mbty
// 29|    expr PLUS expr { $1 + $3}
fn yy_action_5(_value_0 : Int, _value_2 : Int) -> Int {
  let _dollar1 = _value_0
  let _dollar3 = _value_2
  ({();  _dollar1 + _dollar3
  })
}

///|
// file:///./parser.mbty
// 30|    expr STAR expr { $1 * $3}
fn yy_action_6(_value_0 : Int, _value_2 : Int) -> Int {
  let _dollar1 = _value_0
  let _dollar3 = _value_2
  ({();  _dollar1 * _dollar3
  })
}

///|
// file:///./parser.mbty
// 31|    expr EQ expr { reductions.val += 1; $1 + $3}
fn yy_action_7(_value_0 : Int, _value_2 : Int) -> Int {
  let _dollar1 = _value_0
  let _dollar3 = _value_2
  ({();  reductions.val += 1; _dollar1 + _dollar3
  })
}

///|
// file:///./parser.mbty
// 19|                  prefix x=anchored EOF { x + [$loc(x)]}
fn yy_action_9(_value_1 : Array[(Int, Int)], _start_1 : Int, _end_1 : Int) -> Array[
  (Int, Int)
] {
  let _sub_action_0_result = yy_action_8()
  let x = _value_1
  let _start_pos_of_item1 = _start_1
  let _end_pos_of_item1 = _end_1
  ({();  x + [(_start_pos_of_item1, _end_pos_of_item1)]
  })
}

///|
// file:///./parser.mbty
// 23|                LPAREN { ()}
fn yy_action_8() -> Unit {
  ({();  ()
  })
}

///|
// file:///./parser.mbty
// 19|                  prefix x=anchored EOF { x + [$loc(x)]}
fn yy_action_11(_value_0 : Array[(Int, Int)], _start_0 : Int, _end_0 : Int) -> Array[
  (Int, Int)
] {
  let _sub_action_0_result = yy_action_10()
  let x = _value_0
  let _start_pos_of_item1 = _start_0
  let _end_pos_of_item1 = _end_0
  ({();  x + [(_start_pos_of_item1, _end_pos_of_item1)]
  })
}

///|
// file:///./parser.mbty
// 23|                               { ()}
fn yy_action_10() -> Unit {
  ({();  ()
  })
}

///|
// file:///./parser.mbty
// 21|    e=empty NUMBER { [e, $loc, $sloc]}
fn yy_action_13(_before_rhs : Int, _end_0 : Int, _start_0 : Int) -> Array[
  (Int, Int)
] {
  let _sub_action_0_result = yy_action_12(_before_rhs)
  let e = _sub_action_0_result
  let _start_pos = _before_rhs
  let _end_pos = _end_0
  let _symbol_start_pos = if _start_0 != _end_0 {
    _start_0
  } else {
    _end_0
  }
  ({();  [e, (_start_pos, _end_pos), (_symbol_start_pos, _end_pos)]
  })
}

///|
// file:///./parser.mbty
// 24|                             { $loc}
fn yy_action_12(_before_rhs : Int) -> (Int, Int) {
  let _start_pos = _before_rhs
  let _end_pos = _before_rhs
  ({();  (_start_pos, _end_pos)
  })
}

///|
// file:///./parser.mbty
// 22|    unit_prefix STAR NUMBER { []}
fn yy_action_15() -> Array[(Int, Int)] {
  let _sub_action_0_result = yy_action_14()
  ({();  []
  })
}

///|
// file:///./parser.mbty
// 25|                     { ()}
fn yy_action_14() -> Unit {
  ({();  ()
  })
}

///|
priv enum YYResult {
  YYAccept_0((Int, Int, Int))
  YYAccept_1(Array[(Int, Int)])
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
    EQ => 4
    LPAREN => 5
    RPAREN => 6
    EOF => 7
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
  let stack : YYStateStack = YYStateStack::{
    values: [initial_state], depth: 1, checkpoint: 1, saved_prefix: 1, undo: []
  }
  let mut state : Int = initial_state
  let _yy_stack_0 : Array[Int] = []
  let mut _yy_depth_0 : Int = 0
  let _yy_stack_1 : Array[Int] = []
  let mut _yy_depth_1 : Int = 0
  let _yy_stack_2 : Array[Int] = []
  let mut _yy_depth_2 : Int = 0
  let mut error_depth : Int = 0
  let mut error_suffix_0 : Int = 0
  let mut error_suffix_1 : Int = 0
  let mut _yy_token_symbol : Int = 0
  let mut _yy_token_token : Token? = None
  let mut _yy_token_ready : Bool = false
  let mut _yy_token_start : Int = 0
  let mut _yy_token_end : Int = 0
  let mut _yy_value_0_0 : Array[(Int, Int)]? = None
  let mut _yy_position_0 : Int = initial_position
  let mut _yy_position_1 : Int = initial_position
  let mut _yy_value_2_0 : Int = 0
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
              let (token, sp, ep) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_start = sp
              _yy_token_end = ep
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_start = last_pos
              _yy_token_end = last_pos
              _yy_token_ready = true
            }
          })
          match _yy_token_symbol {
            1 =>
              ({
                ()
                let _yy_r182 = _yy_token_start
                let _yy_r183 = _yy_token_end
                _yy_position_0 = _yy_r182
                _yy_position_1 = _yy_r183
                continue 3
              })
            3 =>
              ({
                ()
                continue 2
              })
            5 =>
              ({
                ()
                let _yy_r188 = _yy_token_start
                let _yy_r189 = _yy_token_end
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_r188)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_r188
                }
                _yy_depth_0 += 1
                if _yy_depth_1 == _yy_stack_1.length() {
                  _yy_stack_1.push(_yy_r189)
                } else {
                  _yy_stack_1[_yy_depth_1] = _yy_r189
                }
                _yy_depth_1 += 1
                yy_stack_push(stack, 7)
                state = 7
                last_pos = _yy_token_end
                _yy_token_token = None
                _yy_token_ready = false
                _yy_token_start = 0
                _yy_token_end = 0
                yy_stack_checkpoint(stack)
                error_depth = 0
                ({
                  ()
                  if cursor < tokens.length() {
                    let (token, sp, ep) = tokens[cursor]
                    cursor += 1
                    _yy_token_symbol = yy_symbol(token)
                    _yy_token_token = Some(token)
                    _yy_token_start = sp
                    _yy_token_end = ep
                    _yy_token_ready = true
                  } else {
                    _yy_token_symbol = 0
                    _yy_token_token = None
                    _yy_token_start = last_pos
                    _yy_token_end = last_pos
                    _yy_token_ready = true
                  }
                })
                match _yy_token_symbol {
                  1 =>
                    ({
                      ()
                      let _yy_r274 = _yy_token_start
                      let _yy_r275 = _yy_token_end
                      _yy_position_0 = _yy_r274
                      _yy_position_1 = _yy_r275
                      continue 3
                    })
                  3 =>
                    ({
                      ()
                      continue 2
                    })
                  _ =>
                    ({
                      ()
                      continue 17
                    })
                }
              })
            _ =>
              ({
                ()
                continue 17
              })
          }
        })
      1 =>
        ({
          ()
          // run state 1
          return YYAccept_1(_yy_value_0_0.unwrap())
        })
      2 =>
        ({
          ()
          // run state 2
          last_pos = _yy_token_end
          _yy_token_token = None
          _yy_token_ready = false
          _yy_token_start = 0
          _yy_token_end = 0
          yy_stack_checkpoint(stack)
          error_suffix_0 = 2
          error_depth = 1
          ({
            ()
            if cursor < tokens.length() {
              let (token, sp, ep) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_start = sp
              _yy_token_end = ep
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_start = last_pos
              _yy_token_end = last_pos
              _yy_token_ready = true
            }
          })
          match _yy_token_symbol {
            1 =>
              ({
                ()
                let _yy_r193 = _yy_token_end
                last_pos = _yy_token_end
                _yy_token_token = None
                _yy_token_ready = false
                _yy_token_start = 0
                _yy_token_end = 0
                yy_stack_checkpoint(stack)
                error_suffix_0 = 2
                error_suffix_1 = 3
                error_depth = 2
                let _yy_r301 = if stack.depth == 1 {
                  initial_position
                } else {
                  _yy_stack_1[_yy_depth_1 - 1]
                }
                let _yy_r302 = yy_action_15()
                let _yy_r303 = state
                _yy_state_0 = _yy_r303
                _yy_value_0_0 = Some(_yy_r302)
                _yy_position_0 = _yy_r301
                _yy_position_1 = _yy_r193
                continue 18
              })
            _ =>
              ({
                ()
                yy_stack_push(stack, 2)
                state = 2
                continue 17
              })
          }
        })
      3 =>
        ({
          ()
          // run state 4
          last_pos = _yy_token_end
          _yy_token_token = None
          _yy_token_ready = false
          _yy_token_start = 0
          _yy_token_end = 0
          yy_stack_checkpoint(stack)
          error_suffix_0 = 4
          error_depth = 1
          let _yy_r311 = if stack.depth == 1 {
            initial_position
          } else {
            _yy_stack_1[_yy_depth_1 - 1]
          }
          let _yy_r312 = yy_action_13(_yy_r311, _yy_position_1, _yy_position_0)
          let _yy_r313 = state
          _yy_state_0 = _yy_r313
          _yy_value_0_0 = Some(_yy_r312)
          _yy_position_0 = _yy_r311
          continue 18
        })
      4 =>
        ({
          ()
          // run state 5
          if !_yy_token_ready {
            if cursor < tokens.length() {
              let (token, sp, ep) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_start = sp
              _yy_token_end = ep
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_start = last_pos
              _yy_token_end = last_pos
              _yy_token_ready = true
            }
          }
          match _yy_token_symbol {
            7 =>
              ({
                ()
                last_pos = _yy_token_end
                _yy_token_token = None
                _yy_token_ready = false
                _yy_token_start = 0
                _yy_token_end = 0
                yy_stack_checkpoint(stack)
                error_suffix_0 = 5
                error_suffix_1 = 6
                error_depth = 2
                let _yy_r325 = yy_action_11(
                  _yy_value_0_0.unwrap(), _yy_position_0, _yy_position_1
                )
                _yy_value_0_0 = Some(_yy_r325)
                continue 1
              })
            _ =>
              ({
                ()
                yy_stack_push(stack, 5)
                state = 5
                continue 17
              })
          }
        })
      5 =>
        ({
          ()
          // run state 8
          if !_yy_token_ready {
            if cursor < tokens.length() {
              let (token, sp, ep) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_start = sp
              _yy_token_end = ep
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_start = last_pos
              _yy_token_end = last_pos
              _yy_token_ready = true
            }
          }
          match _yy_token_symbol {
            7 =>
              ({
                ()
                last_pos = _yy_token_end
                _yy_token_token = None
                _yy_token_ready = false
                _yy_token_start = 0
                _yy_token_end = 0
                yy_stack_checkpoint(stack)
                error_suffix_0 = 8
                error_suffix_1 = 9
                error_depth = 2
                let _yy_r341 = yy_action_9(
                  _yy_value_0_0.unwrap(), _yy_position_0, _yy_position_1
                )
                _yy_depth_0 -= 1
                _yy_depth_1 -= 1
                stack.depth -= 1
                state = stack.values[stack.depth - 1]
                _yy_value_0_0 = Some(_yy_r341)
                continue 19
              })
            _ =>
              ({
                ()
                yy_stack_push(stack, 8)
                state = 8
                continue 17
              })
          }
        })
      6 =>
        ({
          ()
          // run state 10
          ({
            ()
            if cursor < tokens.length() {
              let (token, sp, ep) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_start = sp
              _yy_token_end = ep
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_start = last_pos
              _yy_token_end = last_pos
              _yy_token_ready = true
            }
          })
          match _yy_token_symbol {
            1 =>
              ({
                ()
                guard! _yy_token_token.unwrap() is NUMBER(_yy_token_value)
                let _yy_r206 = _yy_token_value
                let _yy_r207 = _yy_token_start
                let _yy_r208 = _yy_token_end
                _yy_value_2_0 = _yy_r206
                _yy_position_0 = _yy_r207
                _yy_position_1 = _yy_r208
                continue 15
              })
            5 =>
              ({
                ()
                let _yy_r210 = _yy_token_start
                let _yy_r211 = _yy_token_end
                _yy_position_0 = _yy_r210
                _yy_position_1 = _yy_r211
                continue 7
              })
            _ =>
              ({
                ()
                continue 17
              })
          }
        })
      7 =>
        ({
          ()
          // run state 12
          if _yy_depth_0 == _yy_stack_0.length() {
            _yy_stack_0.push(_yy_position_0)
          } else {
            _yy_stack_0[_yy_depth_0] = _yy_position_0
          }
          _yy_depth_0 += 1
          if _yy_depth_1 == _yy_stack_1.length() {
            _yy_stack_1.push(_yy_position_1)
          } else {
            _yy_stack_1[_yy_depth_1] = _yy_position_1
          }
          _yy_depth_1 += 1
          yy_stack_push(stack, 12)
          state = 12
          last_pos = _yy_token_end
          _yy_token_token = None
          _yy_token_ready = false
          _yy_token_start = 0
          _yy_token_end = 0
          yy_stack_checkpoint(stack)
          error_depth = 0
          ({
            ()
            if cursor < tokens.length() {
              let (token, sp, ep) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_start = sp
              _yy_token_end = ep
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_start = last_pos
              _yy_token_end = last_pos
              _yy_token_ready = true
            }
          })
          match _yy_token_symbol {
            1 =>
              ({
                ()
                guard! _yy_token_token.unwrap() is NUMBER(_yy_token_value)
                let _yy_r213 = _yy_token_value
                let _yy_r214 = _yy_token_start
                let _yy_r215 = _yy_token_end
                _yy_value_2_0 = _yy_r213
                _yy_position_0 = _yy_r214
                _yy_position_1 = _yy_r215
                continue 15
              })
            5 =>
              ({
                ()
                let _yy_r217 = _yy_token_start
                let _yy_r218 = _yy_token_end
                _yy_position_0 = _yy_r217
                _yy_position_1 = _yy_r218
                continue 7
              })
            _ =>
              ({
                ()
                continue 17
              })
          }
        })
      8 =>
        ({
          ()
          // run state 13
          if !_yy_token_ready {
            if cursor < tokens.length() {
              let (token, sp, ep) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_start = sp
              _yy_token_end = ep
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_start = last_pos
              _yy_token_end = last_pos
              _yy_token_ready = true
            }
          }
          match _yy_token_symbol {
            2 =>
              ({
                ()
                if _yy_depth_2 == _yy_stack_2.length() {
                  _yy_stack_2.push(_yy_value_2_0)
                } else {
                  _yy_stack_2[_yy_depth_2] = _yy_value_2_0
                }
                _yy_depth_2 += 1
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_position_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_position_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 13)
                state = 13
                continue 13
              })
            3 =>
              ({
                ()
                if _yy_depth_2 == _yy_stack_2.length() {
                  _yy_stack_2.push(_yy_value_2_0)
                } else {
                  _yy_stack_2[_yy_depth_2] = _yy_value_2_0
                }
                _yy_depth_2 += 1
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_position_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_position_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 13)
                state = 13
                continue 11
              })
            4 =>
              ({
                ()
                if _yy_depth_2 == _yy_stack_2.length() {
                  _yy_stack_2.push(_yy_value_2_0)
                } else {
                  _yy_stack_2[_yy_depth_2] = _yy_value_2_0
                }
                _yy_depth_2 += 1
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_position_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_position_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 13)
                state = 13
                continue 9
              })
            6 =>
              ({
                ()
                let _yy_r230 = _yy_token_end
                last_pos = _yy_token_end
                _yy_token_token = None
                _yy_token_ready = false
                _yy_token_start = 0
                _yy_token_end = 0
                yy_stack_checkpoint(stack)
                error_suffix_0 = 13
                error_suffix_1 = 21
                error_depth = 2
                let _yy_r349 = _yy_stack_0[_yy_depth_0 - 1]
                let _yy_r358 = yy_action_2(_yy_value_2_0)
                _yy_depth_0 -= 1
                _yy_depth_1 -= 1
                stack.depth -= 1
                state = stack.values[stack.depth - 1]
                let _yy_r359 = state
                _yy_state_0 = _yy_r359
                _yy_value_2_0 = _yy_r358
                _yy_position_0 = _yy_r349
                _yy_position_1 = _yy_r230
                continue 20
              })
            _ =>
              ({
                ()
                if _yy_depth_2 == _yy_stack_2.length() {
                  _yy_stack_2.push(_yy_value_2_0)
                } else {
                  _yy_stack_2[_yy_depth_2] = _yy_value_2_0
                }
                _yy_depth_2 += 1
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_position_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_position_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 13)
                state = 13
                continue 17
              })
          }
        })
      9 =>
        ({
          ()
          // run state 14
          yy_stack_push(stack, 14)
          state = 14
          last_pos = _yy_token_end
          _yy_token_token = None
          _yy_token_ready = false
          _yy_token_start = 0
          _yy_token_end = 0
          yy_stack_checkpoint(stack)
          error_depth = 0
          ({
            ()
            if cursor < tokens.length() {
              let (token, sp, ep) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_start = sp
              _yy_token_end = ep
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_start = last_pos
              _yy_token_end = last_pos
              _yy_token_ready = true
            }
          })
          match _yy_token_symbol {
            1 =>
              ({
                ()
                guard! _yy_token_token.unwrap() is NUMBER(_yy_token_value)
                let _yy_r231 = _yy_token_value
                let _yy_r232 = _yy_token_start
                let _yy_r233 = _yy_token_end
                _yy_value_2_0 = _yy_r231
                _yy_position_0 = _yy_r232
                _yy_position_1 = _yy_r233
                continue 15
              })
            5 =>
              ({
                ()
                let _yy_r235 = _yy_token_start
                let _yy_r236 = _yy_token_end
                _yy_position_0 = _yy_r235
                _yy_position_1 = _yy_r236
                continue 7
              })
            _ =>
              ({
                ()
                continue 17
              })
          }
        })
      10 =>
        ({
          ()
          // run state 15
          if !_yy_token_ready {
            if cursor < tokens.length() {
              let (token, sp, ep) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_start = sp
              _yy_token_end = ep
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_start = last_pos
              _yy_token_end = last_pos
              _yy_token_ready = true
            }
          }
          match _yy_token_symbol {
            2 =>
              ({
                ()
                if _yy_depth_2 == _yy_stack_2.length() {
                  _yy_stack_2.push(_yy_value_2_0)
                } else {
                  _yy_stack_2[_yy_depth_2] = _yy_value_2_0
                }
                _yy_depth_2 += 1
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_position_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_position_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 15)
                state = 15
                continue 13
              })
            3 =>
              ({
                ()
                if _yy_depth_2 == _yy_stack_2.length() {
                  _yy_stack_2.push(_yy_value_2_0)
                } else {
                  _yy_stack_2[_yy_depth_2] = _yy_value_2_0
                }
                _yy_depth_2 += 1
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_position_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_position_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 15)
                state = 15
                continue 11
              })
            6 | 7 =>
              ({
                ()
                let _yy_r364 = _yy_stack_2[_yy_depth_2 - 1]
                let _yy_r365 = _yy_stack_0[_yy_depth_0 - 1]
                let _yy_r374 = yy_action_7(_yy_r364, _yy_value_2_0)
                _yy_depth_2 -= 1
                _yy_depth_0 -= 1
                stack.depth -= 2
                state = stack.values[stack.depth - 1]
                let _yy_r375 = state
                _yy_state_0 = _yy_r375
                _yy_value_2_0 = _yy_r374
                _yy_position_0 = _yy_r365
                continue 20
              })
            _ =>
              ({
                ()
                if _yy_depth_2 == _yy_stack_2.length() {
                  _yy_stack_2.push(_yy_value_2_0)
                } else {
                  _yy_stack_2[_yy_depth_2] = _yy_value_2_0
                }
                _yy_depth_2 += 1
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_position_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_position_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 15)
                state = 15
                continue 17
              })
          }
        })
      11 =>
        ({
          ()
          // run state 16
          yy_stack_push(stack, 16)
          state = 16
          last_pos = _yy_token_end
          _yy_token_token = None
          _yy_token_ready = false
          _yy_token_start = 0
          _yy_token_end = 0
          yy_stack_checkpoint(stack)
          error_depth = 0
          ({
            ()
            if cursor < tokens.length() {
              let (token, sp, ep) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_start = sp
              _yy_token_end = ep
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_start = last_pos
              _yy_token_end = last_pos
              _yy_token_ready = true
            }
          })
          match _yy_token_symbol {
            1 =>
              ({
                ()
                guard! _yy_token_token.unwrap() is NUMBER(_yy_token_value)
                let _yy_r243 = _yy_token_value
                let _yy_r244 = _yy_token_start
                let _yy_r245 = _yy_token_end
                _yy_value_2_0 = _yy_r243
                _yy_position_0 = _yy_r244
                _yy_position_1 = _yy_r245
                continue 15
              })
            5 =>
              ({
                ()
                let _yy_r247 = _yy_token_start
                let _yy_r248 = _yy_token_end
                _yy_position_0 = _yy_r247
                _yy_position_1 = _yy_r248
                continue 7
              })
            _ =>
              ({
                ()
                continue 17
              })
          }
        })
      12 =>
        ({
          ()
          // run state 17
          let _yy_r380 = _yy_stack_2[_yy_depth_2 - 1]
          let _yy_r381 = _yy_stack_0[_yy_depth_0 - 1]
          let _yy_r390 = yy_action_6(_yy_r380, _yy_value_2_0)
          _yy_depth_2 -= 1
          _yy_depth_0 -= 1
          stack.depth -= 2
          state = stack.values[stack.depth - 1]
          let _yy_r391 = state
          let _yy_arg0 = _yy_r391
          let _yy_arg1 = _yy_r390
          let _yy_arg2 = _yy_r381
          let _yy_arg3 = _yy_position_0
          _yy_state_0 = _yy_arg0
          _yy_value_2_0 = _yy_arg1
          _yy_position_0 = _yy_arg2
          _yy_position_1 = _yy_arg3
          continue 20
        })
      13 =>
        ({
          ()
          // run state 18
          yy_stack_push(stack, 18)
          state = 18
          last_pos = _yy_token_end
          _yy_token_token = None
          _yy_token_ready = false
          _yy_token_start = 0
          _yy_token_end = 0
          yy_stack_checkpoint(stack)
          error_depth = 0
          ({
            ()
            if cursor < tokens.length() {
              let (token, sp, ep) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_start = sp
              _yy_token_end = ep
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_start = last_pos
              _yy_token_end = last_pos
              _yy_token_ready = true
            }
          })
          match _yy_token_symbol {
            1 =>
              ({
                ()
                guard! _yy_token_token.unwrap() is NUMBER(_yy_token_value)
                let _yy_r249 = _yy_token_value
                let _yy_r250 = _yy_token_start
                let _yy_r251 = _yy_token_end
                _yy_value_2_0 = _yy_r249
                _yy_position_0 = _yy_r250
                _yy_position_1 = _yy_r251
                continue 15
              })
            5 =>
              ({
                ()
                let _yy_r253 = _yy_token_start
                let _yy_r254 = _yy_token_end
                _yy_position_0 = _yy_r253
                _yy_position_1 = _yy_r254
                continue 7
              })
            _ =>
              ({
                ()
                continue 17
              })
          }
        })
      14 =>
        ({
          ()
          // run state 19
          if !_yy_token_ready {
            if cursor < tokens.length() {
              let (token, sp, ep) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_start = sp
              _yy_token_end = ep
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_start = last_pos
              _yy_token_end = last_pos
              _yy_token_ready = true
            }
          }
          match _yy_token_symbol {
            2 | 4 | 6 | 7 =>
              ({
                ()
                let _yy_r396 = _yy_stack_2[_yy_depth_2 - 1]
                let _yy_r397 = _yy_stack_0[_yy_depth_0 - 1]
                let _yy_r406 = yy_action_5(_yy_r396, _yy_value_2_0)
                _yy_depth_2 -= 1
                _yy_depth_0 -= 1
                stack.depth -= 2
                state = stack.values[stack.depth - 1]
                let _yy_r407 = state
                _yy_state_0 = _yy_r407
                _yy_value_2_0 = _yy_r406
                _yy_position_0 = _yy_r397
                continue 20
              })
            3 =>
              ({
                ()
                if _yy_depth_2 == _yy_stack_2.length() {
                  _yy_stack_2.push(_yy_value_2_0)
                } else {
                  _yy_stack_2[_yy_depth_2] = _yy_value_2_0
                }
                _yy_depth_2 += 1
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_position_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_position_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 19)
                state = 19
                continue 11
              })
            _ =>
              ({
                ()
                if _yy_depth_2 == _yy_stack_2.length() {
                  _yy_stack_2.push(_yy_value_2_0)
                } else {
                  _yy_stack_2[_yy_depth_2] = _yy_value_2_0
                }
                _yy_depth_2 += 1
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_position_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_position_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 19)
                state = 19
                continue 17
              })
          }
        })
      15 =>
        ({
          ()
          // run state 20
          last_pos = _yy_token_end
          _yy_token_token = None
          _yy_token_ready = false
          _yy_token_start = 0
          _yy_token_end = 0
          yy_stack_checkpoint(stack)
          error_suffix_0 = 20
          error_depth = 1
          let _yy_r416 = yy_action_4(_yy_value_2_0)
          let _yy_r417 = state
          _yy_state_0 = _yy_r417
          _yy_value_2_0 = _yy_r416
          continue 20
        })
      16 =>
        ({
          ()
          // run state 22
          if !_yy_token_ready {
            if cursor < tokens.length() {
              let (token, sp, ep) = tokens[cursor]
              cursor += 1
              _yy_token_symbol = yy_symbol(token)
              _yy_token_token = Some(token)
              _yy_token_start = sp
              _yy_token_end = ep
              _yy_token_ready = true
            } else {
              _yy_token_symbol = 0
              _yy_token_token = None
              _yy_token_start = last_pos
              _yy_token_end = last_pos
              _yy_token_ready = true
            }
          }
          match _yy_token_symbol {
            2 =>
              ({
                ()
                if _yy_depth_2 == _yy_stack_2.length() {
                  _yy_stack_2.push(_yy_value_2_0)
                } else {
                  _yy_stack_2[_yy_depth_2] = _yy_value_2_0
                }
                _yy_depth_2 += 1
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_position_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_position_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 22)
                state = 22
                continue 13
              })
            3 =>
              ({
                ()
                if _yy_depth_2 == _yy_stack_2.length() {
                  _yy_stack_2.push(_yy_value_2_0)
                } else {
                  _yy_stack_2[_yy_depth_2] = _yy_value_2_0
                }
                _yy_depth_2 += 1
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_position_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_position_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 22)
                state = 22
                continue 11
              })
            4 =>
              ({
                ()
                if _yy_depth_2 == _yy_stack_2.length() {
                  _yy_stack_2.push(_yy_value_2_0)
                } else {
                  _yy_stack_2[_yy_depth_2] = _yy_value_2_0
                }
                _yy_depth_2 += 1
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_position_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_position_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 22)
                state = 22
                continue 9
              })
            7 =>
              ({
                ()
                last_pos = _yy_token_end
                _yy_token_token = None
                _yy_token_ready = false
                _yy_token_start = 0
                _yy_token_end = 0
                yy_stack_checkpoint(stack)
                error_suffix_0 = 22
                error_suffix_1 = 23
                error_depth = 2
                let _yy_r429 = yy_action_0(
                  _yy_value_2_0, _yy_position_0, _yy_position_1
                )
                let _yy_bind0 = _yy_r429
                let _yy_r431 = _yy_bind0
                return YYAccept_0(_yy_r431)
              })
            _ =>
              ({
                ()
                if _yy_depth_2 == _yy_stack_2.length() {
                  _yy_stack_2.push(_yy_value_2_0)
                } else {
                  _yy_stack_2[_yy_depth_2] = _yy_value_2_0
                }
                _yy_depth_2 += 1
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_position_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_position_0
                }
                _yy_depth_0 += 1
                yy_stack_push(stack, 22)
                state = 22
                continue 17
              })
          }
        })
      17 =>
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
            }), _yy_token_token, (_yy_token_start, _yy_token_end)
          )
          panic()
        })
      18 =>
        ({
          ()
          // goto anchored
          continue match _yy_state_0 {
              0 => 4
              7 => 5
              _ => panic()
            }
        })
      19 =>
        ({
          ()
          // goto inline_positions
          continue 1
        })
      20 =>
        ({
          ()
          // goto expr
          match _yy_state_0 {
            10 =>
              ({
                ()
                continue 16
              })
            12 =>
              ({
                ()
                continue 8
              })
            14 =>
              ({
                ()
                continue 10
              })
            16 =>
              ({
                ()
                _yy_position_0 = _yy_position_1
                continue 12
              })
            18 =>
              ({
                ()
                continue 14
              })
            _ => panic()
          }
        })
      _ => panic()
    }
  }
}

///|
pub fn start(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> (
  Int, Int, Int
) raise ParseError {
  match yy_parse(tokens, 6, 10, initial_pos?) {
    YYAccept_0(result) => result
    _ => panic()
  }
}

///|
pub fn inline_positions(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Array[
  (Int, Int)
] raise ParseError {
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
  0, -2, 11, -27, -28, 14, -29, 17, 24, -30, 27, -2, 36, 43, 52, 59, 68, -31,
  75, 82, -32, -31, 93, -33
]

///|
let yy_diag_data : FixedArray[Int] = [
  5, 1, 6, 3, 4, 5, 9, 9, 3, 10, 7, 1, 1, 5, 1, 7, 8, 3, 1, 6, 3, 4, 10, 10, 1,
  7, 11, 4, 1, 22, 5, 14, 8, 13, 11, 24, 3, 1, 22, 5, 14, 11, 15, 4, 2, 20, 3,
  18, 4, 16, 6, 23, 3, 1, 22, 5, 14, 11, 17, 4, 2, 20, 3, 18, 6, 30, 7, 30, 3,
  1, 22, 5, 14, 11, 19, 3, 1, 22, 5, 14, 11, 21, 5, 2, 30, 3, 18, 4, 30, 6, 30,
  7, 30, 4, 2, 20, 3, 18, 4, 16, 7, 25
]

///|
let yy_diag_reductions : FixedArray[(Int, Int)] = [
  (2, 10), (1, 10), (2, 9), (3, 9), (3, 11), (1, 11), (2, 8)
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
      if code < 26 {
        (2, code - 2, 0)
      } else {
        let (count, lhs) = yy_diag_reductions[code - 26]
        (3, count, lhs)
      }
  }
}

///|
let yy_terminals : ReadOnlyArray[(Int, TokenKind)] = [
  (1, TK_NUMBER), (2, TK_PLUS), (3, TK_STAR), (4, TK_EQ), (5, TK_LPAREN),
  (6, TK_RPAREN), (7, TK_EOF)
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
