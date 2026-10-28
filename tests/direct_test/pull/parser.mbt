
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
priv enum YYStack {
  YYEmpty
  YYCell_10(YYStack, Int, Array[(Int, Int)], Int, Int)
  YYCell_9(YYStack, Int, Array[(Int, Int)], Int)
  YYCell_11(YYStack, Int, Int, Int, Int)
  YYCell_8(YYStack, Int, (Int, Int, Int), Int)
  YYCell_3_void(YYStack, Int, Int, Int)
  YYCell_5_void(YYStack, Int, Int, Int)
  YYCell_1(YYStack, Int, Int, Int, Int)
  YYCell_7_void(YYStack, Int, Int, Int)
  YYCell_2_void(YYStack, Int, Int, Int)
  YYCell_4_void(YYStack, Int, Int, Int)
  YYCell_6_void(YYStack, Int, Int, Int)
}

///|
priv enum YYResult {
  YYAccept_0((Int, Int, Int))
  YYAccept_1(Array[(Int, Int)])
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
priv struct YYContext {
  mut stack : YYStack
  mut state : Int
  mut error_stack : YYStack
  mut error_state : Int
  mut error_depth : Int
  mut error_suffix_0 : Int
  mut lookahead : YYLookahead?
  mut _yy_result : YYResult?
  initial_position : Int
  read_token : (() -> (Token, Int, Int))
  mut _yy_state_0 : Int
  mut _yy_value_1_0 : Array[(Int, Int)]?
  mut _yy_position_0 : Int
  mut _yy_position_1 : Int
  mut _yy_value_3_0 : Int
  mut _yy_value_4_0 : (Int, Int, Int)?
}

///|
#inline(never)
fn yy_stop(_env : YYContext) -> Int raise ParseError {
  yy_error(
    ({
      ()
      let mut _yy_error_states = yy_stack_states(
        _env.error_stack, _env.error_state
      )
      if _env.error_depth > 0 {
        _yy_error_states = @list.cons(_env.error_suffix_0, _yy_error_states)
      }
      _yy_error_states
    }), _env.lookahead.unwrap().token,
    (_env.lookahead.unwrap().start, _env.lookahead.unwrap().end)
  )
  panic()
}

///|
#inline(never)
fn yy_shift(_env : YYContext, target : Int) -> Unit {
  match _env.lookahead.unwrap().token.unwrap() {
    NUMBER(_value) =>
      ({
        ()
        _env.stack = YYCell_1(
          _env.stack, _env.state, _value, _env.lookahead.unwrap().start,
          _env.lookahead.unwrap().end
        )
        _env.state = target
      })
    PLUS =>
      ({
        ()
        _env.stack = YYCell_2_void(
          _env.stack, _env.state, _env.lookahead.unwrap().start,
          _env.lookahead.unwrap().end
        )
        _env.state = target
      })
    STAR =>
      ({
        ()
        _env.stack = YYCell_3_void(
          _env.stack, _env.state, _env.lookahead.unwrap().start,
          _env.lookahead.unwrap().end
        )
        _env.state = target
      })
    EQ =>
      ({
        ()
        _env.stack = YYCell_4_void(
          _env.stack, _env.state, _env.lookahead.unwrap().start,
          _env.lookahead.unwrap().end
        )
        _env.state = target
      })
    LPAREN =>
      ({
        ()
        _env.stack = YYCell_5_void(
          _env.stack, _env.state, _env.lookahead.unwrap().start,
          _env.lookahead.unwrap().end
        )
        _env.state = target
      })
    RPAREN =>
      ({
        ()
        _env.stack = YYCell_6_void(
          _env.stack, _env.state, _env.lookahead.unwrap().start,
          _env.lookahead.unwrap().end
        )
        _env.state = target
      })
    EOF =>
      ({
        ()
        _env.stack = YYCell_7_void(
          _env.stack, _env.state, _env.lookahead.unwrap().start,
          _env.lookahead.unwrap().end
        )
        _env.state = target
      })
  }
  _env.lookahead = None
  _env.error_stack = _env.stack
  _env.error_state = _env.state
  _env.error_depth = 0
}

///|
#inline(never)
fn yy_read_token(_env : YYContext) -> Unit {
  let (token, sp, ep) = (_env.read_token)()
  _env.lookahead = Some(
    YYLookahead::{
      symbol: yy_symbol(token), token: Some(token), start: sp, end: ep
    }
  )
}

///|
fn yy_parse(
  read_token : (() -> (Token, Int, Int)), start_pos : Int, entry : Int,
  initial_state : Int
) -> YYResult raise ParseError {
  let initial_position = start_pos
  let _env = YYContext::{
    stack: YYEmpty, state: initial_state, error_stack: YYEmpty,
    error_state: initial_state, error_depth: 0, error_suffix_0: 0,
    lookahead: None, _yy_result: None, initial_position: initial_position,
    read_token: read_token, _yy_state_0: 0, _yy_value_1_0: None,
    _yy_position_0: initial_position, _yy_position_1: initial_position,
    _yy_value_3_0: 0, _yy_value_4_0: None
  }
  for pc = entry {
    let next = match pc / 64 {
      0 => _yy_chunk_0(_env, pc)
      _ => panic()
    }
    if next < 0 {
      return _env._yy_result.unwrap()
    }
    continue next
  }
}

///|
#inline(never)
fn _yy_chunk_0(_env : YYContext, _entry : Int) -> Int raise ParseError {
  for pc = _entry {
    match pc {
      0 =>
        ({
          ()
          // run state 0
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              1 => 40
              3 => 27
              5 => 28
              _ => 26
            }
        })
      1 =>
        ({
          ()
          // run state 2
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              1 => 30
              _ => 26
            }
        })
      2 =>
        ({
          ()
          // run state 5
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              7 => 31
              _ => 26
            }
        })
      3 =>
        ({
          ()
          // run state 7
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              1 => 41
              3 => 27
              _ => 26
            }
        })
      4 =>
        ({
          ()
          // run state 8
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              7 => 32
              _ => 26
            }
        })
      5 =>
        ({
          ()
          // run state 10
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              1 => 42
              5 => 33
              _ => 26
            }
        })
      6 =>
        ({
          ()
          // run state 12
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              1 => 43
              5 => 33
              _ => 26
            }
        })
      7 =>
        ({
          ()
          // run state 13
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              2 => 35
              3 => 36
              4 => 37
              6 => 38
              _ => 26
            }
        })
      8 =>
        ({
          ()
          // run state 14
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              1 => 44
              5 => 33
              _ => 26
            }
        })
      9 =>
        ({
          ()
          // run state 15
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              2 => 35
              3 => 36
              6 | 7 => 19
              _ => 26
            }
        })
      10 =>
        ({
          ()
          // run state 16
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              1 => 45
              5 => 33
              _ => 26
            }
        })
      11 =>
        ({
          ()
          // run state 18
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              1 => 46
              5 => 33
              _ => 26
            }
        })
      12 =>
        ({
          ()
          // run state 19
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              2 | 4 | 6 | 7 => 22
              3 => 36
              _ => 26
            }
        })
      13 =>
        ({
          ()
          // run state 22
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              2 => 35
              3 => 36
              4 => 37
              7 => 39
              _ => 26
            }
        })
      14 =>
        ({
          ()
          // reduce anchored -> STAR NUMBER
          guard! _env.stack is YYCell_1(
            _yy_tail1, _yy_saved1, _yy_r46, _yy_r47, _yy_read48
          )
          _env._yy_position_1 = _yy_read48
          guard! _yy_tail1 is YYCell_3_void(
            _yy_tail0, _yy_saved0, _yy_r44, _yy_r45
          )
          _env._yy_position_0 = if _yy_tail0 is YYEmpty {
            _env.initial_position
          } else {
            yy_stack_end(_yy_tail0)
          }
          _env._yy_value_1_0 = Some(yy_action_15())
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 15
        })
      15 =>
        ({
          ()
          // goto anchored
          let (_yy_state, _yy_target) = match _env._yy_state_0 {
            0 => (5, 2)
            7 => (8, 4)
            _ => panic()
          }
          _env.stack = YYCell_10(
            _env.stack, _env.state, _env._yy_value_1_0.unwrap(),
            _env._yy_position_0, _env._yy_position_1
          )
          _env.state = _yy_state
          continue _yy_target
        })
      16 =>
        ({
          ()
          // reduce inline_positions -> anchored EOF
          guard! _env.stack is YYCell_7_void(
            _yy_tail1, _yy_saved1, _yy_r62, _yy_read63
          )
          _env._yy_position_1 = _yy_read63
          guard! _yy_tail1 is YYCell_10(
            _yy_tail0, _yy_saved0, _yy_r58, _yy_r59, _yy_r60
          )
          _env._yy_position_0 = if _yy_tail0 is YYEmpty {
            _env.initial_position
          } else {
            yy_stack_end(_yy_tail0)
          }
          _env._yy_value_1_0 = Some(yy_action_11(_yy_r58, _yy_r59, _yy_r60))
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 17
        })
      17 =>
        ({
          ()
          // goto inline_positions
          match _env._yy_state_0 {
            0 => ()
            _ => panic()
          }
          _env.stack = YYCell_9(
            _env.stack, _env.state, _env._yy_value_1_0.unwrap(),
            _env._yy_position_1
          )
          _env.state = 1
          continue 29
        })
      18 =>
        ({
          ()
          // reduce inline_positions -> LPAREN anchored EOF
          guard! _env.stack is YYCell_7_void(
            _yy_tail2, _yy_saved2, _yy_r74, _yy_read75
          )
          _env._yy_position_1 = _yy_read75
          guard! _yy_tail2 is YYCell_10(
            _yy_tail1, _yy_saved1, _yy_r70, _yy_r71, _yy_r72
          )
          guard! _yy_tail1 is YYCell_5_void(
            _yy_tail0, _yy_saved0, _yy_read68, _yy_r69
          )
          _env._yy_position_0 = _yy_read68
          _env._yy_value_1_0 = Some(yy_action_9(_yy_r70, _yy_r71, _yy_r72))
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 17
        })
      19 =>
        ({
          ()
          // reduce expr -> expr EQ expr
          guard! _env.stack is YYCell_11(
            _yy_tail2, _yy_saved2, _yy_r85, _yy_r86, _yy_read87
          )
          _env._yy_position_1 = _yy_read87
          guard! _yy_tail2 is YYCell_4_void(
            _yy_tail1, _yy_saved1, _yy_r83, _yy_r84
          )
          guard! _yy_tail1 is YYCell_11(
            _yy_tail0, _yy_saved0, _yy_r79, _yy_read80, _yy_r81
          )
          _env._yy_position_0 = _yy_read80
          _env._yy_value_3_0 = yy_action_7(_yy_r79, _yy_r85)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 20
        })
      20 =>
        ({
          ()
          // goto expr
          let (_yy_state, _yy_target) = match _env._yy_state_0 {
            10 => (22, 13)
            12 => (13, 7)
            14 => (15, 9)
            16 => (17, 21)
            18 => (19, 12)
            _ => panic()
          }
          _env.stack = YYCell_11(
            _env.stack, _env.state, _env._yy_value_3_0, _env._yy_position_0,
            _env._yy_position_1
          )
          _env.state = _yy_state
          continue _yy_target
        })
      21 =>
        ({
          ()
          // reduce expr -> expr STAR expr
          guard! _env.stack is YYCell_11(
            _yy_tail2, _yy_saved2, _yy_r97, _yy_r98, _yy_read99
          )
          _env._yy_position_1 = _yy_read99
          guard! _yy_tail2 is YYCell_3_void(
            _yy_tail1, _yy_saved1, _yy_r95, _yy_r96
          )
          guard! _yy_tail1 is YYCell_11(
            _yy_tail0, _yy_saved0, _yy_r91, _yy_read92, _yy_r93
          )
          _env._yy_position_0 = _yy_read92
          _env._yy_value_3_0 = yy_action_6(_yy_r91, _yy_r97)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 20
        })
      22 =>
        ({
          ()
          // reduce expr -> expr PLUS expr
          guard! _env.stack is YYCell_11(
            _yy_tail2, _yy_saved2, _yy_r109, _yy_r110, _yy_read111
          )
          _env._yy_position_1 = _yy_read111
          guard! _yy_tail2 is YYCell_2_void(
            _yy_tail1, _yy_saved1, _yy_r107, _yy_r108
          )
          guard! _yy_tail1 is YYCell_11(
            _yy_tail0, _yy_saved0, _yy_r103, _yy_read104, _yy_r105
          )
          _env._yy_position_0 = _yy_read104
          _env._yy_value_3_0 = yy_action_5(_yy_r103, _yy_r109)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 20
        })
      23 =>
        ({
          ()
          // reduce expr -> LPAREN expr RPAREN
          guard! _env.stack is YYCell_6_void(
            _yy_tail2, _yy_saved2, _yy_r128, _yy_read129
          )
          _env._yy_position_1 = _yy_read129
          guard! _yy_tail2 is YYCell_11(
            _yy_tail1, _yy_saved1, _yy_r124, _yy_r125, _yy_r126
          )
          guard! _yy_tail1 is YYCell_5_void(
            _yy_tail0, _yy_saved0, _yy_read122, _yy_r123
          )
          _env._yy_position_0 = _yy_read122
          _env._yy_value_3_0 = yy_action_2(_yy_r124)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 20
        })
      24 =>
        ({
          ()
          // reduce start -> expr EOF
          guard! _env.stack is YYCell_7_void(
            _yy_tail1, _yy_saved1, _yy_r137, _yy_read138
          )
          _env._yy_position_1 = _yy_read138
          guard! _yy_tail1 is YYCell_11(
            _yy_tail0, _yy_saved0, _yy_r133, _yy_read134, _yy_r135
          )
          _env._yy_position_0 = _yy_read134
          _env._yy_value_4_0 = Some(
            yy_action_0(_yy_r133, _env._yy_position_0, _yy_r135)
          )
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 25
        })
      25 =>
        ({
          ()
          // goto start
          match _env._yy_state_0 {
            10 => ()
            _ => panic()
          }
          _env.stack = YYCell_8(
            _env.stack, _env.state, _env._yy_value_4_0.unwrap(),
            _env._yy_position_1
          )
          _env.state = 11
          continue 34
        })
      26 =>
        ({
          ()
          return yy_stop(_env)
        })
      27 =>
        ({
          ()
          // shift STAR into state 2
          yy_shift(_env, 2)
          continue 1
        })
      28 =>
        ({
          ()
          // shift LPAREN into state 7
          yy_shift(_env, 7)
          continue 3
        })
      29 =>
        ({
          ()
          let _yy_r151 = match _env.stack {
            YYCell_9(_, _, _value, _) => _value
            _ => panic()
          }
          _env._yy_result = Some(YYAccept_1(_yy_r151))
          return -1
        })
      30 =>
        ({
          ()
          // shift NUMBER into state 3
          yy_shift(_env, 3)
          continue 14
        })
      31 =>
        ({
          ()
          // shift EOF into state 6
          yy_shift(_env, 6)
          continue 16
        })
      32 =>
        ({
          ()
          // shift EOF into state 9
          yy_shift(_env, 9)
          continue 18
        })
      33 =>
        ({
          ()
          // shift LPAREN into state 12
          yy_shift(_env, 12)
          continue 6
        })
      34 =>
        ({
          ()
          let _yy_r167 = match _env.stack {
            YYCell_8(_, _, _value, _) => _value
            _ => panic()
          }
          _env._yy_result = Some(YYAccept_0(_yy_r167))
          return -1
        })
      35 =>
        ({
          ()
          // shift PLUS into state 18
          yy_shift(_env, 18)
          continue 11
        })
      36 =>
        ({
          ()
          // shift STAR into state 16
          yy_shift(_env, 16)
          continue 10
        })
      37 =>
        ({
          ()
          // shift EQ into state 14
          yy_shift(_env, 14)
          continue 8
        })
      38 =>
        ({
          ()
          // shift RPAREN into state 21
          yy_shift(_env, 21)
          continue 23
        })
      39 =>
        ({
          ()
          // shift EOF into state 23
          yy_shift(_env, 23)
          continue 24
        })
      40 =>
        ({
          ()
          // shift NUMBER into state 4
          guard! _env.lookahead.unwrap().token.unwrap() is NUMBER(
            _yy_token_value
          )
          let _yy_r183 = _yy_token_value
          let _yy_r184 = _env.lookahead.unwrap().start
          let _yy_r185 = _env.lookahead.unwrap().end
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 4
          _env.error_depth = 1
          let _yy_r189 = if _env.stack is YYEmpty {
            _env.initial_position
          } else {
            yy_stack_end(_env.stack)
          }
          let _yy_r190 = yy_action_13(_yy_r189, _yy_r185, _yy_r184)
          let _yy_r191 = _env.state
          _env.stack = YYCell_10(
            _env.stack, _env.state, _yy_r190, _yy_r189, _yy_r185
          )
          _env.state = 5
          continue 2
        })
      41 =>
        ({
          ()
          // shift NUMBER into state 4
          guard! _env.lookahead.unwrap().token.unwrap() is NUMBER(
            _yy_token_value
          )
          let _yy_r211 = _yy_token_value
          let _yy_r212 = _env.lookahead.unwrap().start
          let _yy_r213 = _env.lookahead.unwrap().end
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 4
          _env.error_depth = 1
          let _yy_r217 = if _env.stack is YYEmpty {
            _env.initial_position
          } else {
            yy_stack_end(_env.stack)
          }
          let _yy_r218 = yy_action_13(_yy_r217, _yy_r213, _yy_r212)
          let _yy_r219 = _env.state
          _env.stack = YYCell_10(
            _env.stack, _env.state, _yy_r218, _yy_r217, _yy_r213
          )
          _env.state = 8
          continue 4
        })
      42 =>
        ({
          ()
          // shift NUMBER into state 20
          guard! _env.lookahead.unwrap().token.unwrap() is NUMBER(
            _yy_token_value
          )
          let _yy_r233 = _yy_token_value
          let _yy_r234 = _env.lookahead.unwrap().start
          let _yy_r235 = _env.lookahead.unwrap().end
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 20
          _env.error_depth = 1
          let _yy_r240 = yy_action_4(_yy_r233)
          let _yy_r241 = _env.state
          _env.stack = YYCell_11(
            _env.stack, _env.state, _yy_r240, _yy_r234, _yy_r235
          )
          _env.state = 22
          continue 13
        })
      43 =>
        ({
          ()
          // shift NUMBER into state 20
          guard! _env.lookahead.unwrap().token.unwrap() is NUMBER(
            _yy_token_value
          )
          let _yy_r252 = _yy_token_value
          let _yy_r253 = _env.lookahead.unwrap().start
          let _yy_r254 = _env.lookahead.unwrap().end
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 20
          _env.error_depth = 1
          let _yy_r259 = yy_action_4(_yy_r252)
          let _yy_r260 = _env.state
          _env.stack = YYCell_11(
            _env.stack, _env.state, _yy_r259, _yy_r253, _yy_r254
          )
          _env.state = 13
          continue 7
        })
      44 =>
        ({
          ()
          // shift NUMBER into state 20
          guard! _env.lookahead.unwrap().token.unwrap() is NUMBER(
            _yy_token_value
          )
          let _yy_r283 = _yy_token_value
          let _yy_r284 = _env.lookahead.unwrap().start
          let _yy_r285 = _env.lookahead.unwrap().end
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 20
          _env.error_depth = 1
          let _yy_r290 = yy_action_4(_yy_r283)
          let _yy_r291 = _env.state
          _env.stack = YYCell_11(
            _env.stack, _env.state, _yy_r290, _yy_r284, _yy_r285
          )
          _env.state = 15
          continue 9
        })
      45 =>
        ({
          ()
          // shift NUMBER into state 20
          guard! _env.lookahead.unwrap().token.unwrap() is NUMBER(
            _yy_token_value
          )
          let _yy_r308 = _yy_token_value
          let _yy_r309 = _env.lookahead.unwrap().start
          let _yy_r310 = _env.lookahead.unwrap().end
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 20
          _env.error_depth = 1
          let _yy_r315 = yy_action_4(_yy_r308)
          let _yy_r316 = _env.state
          _env.stack = YYCell_11(
            _env.stack, _env.state, _yy_r315, _yy_r309, _yy_r310
          )
          _env.state = 17
          continue 21
        })
      46 =>
        ({
          ()
          // shift NUMBER into state 20
          guard! _env.lookahead.unwrap().token.unwrap() is NUMBER(
            _yy_token_value
          )
          let _yy_r327 = _yy_token_value
          let _yy_r328 = _env.lookahead.unwrap().start
          let _yy_r329 = _env.lookahead.unwrap().end
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 20
          _env.error_depth = 1
          let _yy_r334 = yy_action_4(_yy_r327)
          let _yy_r335 = _env.state
          _env.stack = YYCell_11(
            _env.stack, _env.state, _yy_r334, _yy_r328, _yy_r329
          )
          _env.state = 19
          continue 12
        })
      _ => panic()
    }
  }
}

///|
pub fn start(read_token : (() -> (Token, Int, Int)), start_pos : Int) -> (
  Int, Int, Int
) raise ParseError {
  match yy_parse(read_token, start_pos, 5, 10) {
    YYAccept_0(result) => result
    _ => panic()
  }
}

///|
pub fn inline_positions(read_token : (() -> (Token, Int, Int)), start_pos : Int) -> Array[
  (Int, Int)
] raise ParseError {
  match yy_parse(read_token, start_pos, 0, 0) {
    YYAccept_1(result) => result
    _ => panic()
  }
}

///|
fn yy_stack_tail(stack : YYStack) -> YYStack {
  match stack {
    YYCell_10(tail, _, _, _, _) => tail
    YYCell_9(tail, _, _, _) => tail
    YYCell_11(tail, _, _, _, _) => tail
    YYCell_8(tail, _, _, _) => tail
    YYCell_3_void(tail, _, _, _) => tail
    YYCell_5_void(tail, _, _, _) => tail
    YYCell_1(tail, _, _, _, _) => tail
    YYCell_7_void(tail, _, _, _) => tail
    YYCell_2_void(tail, _, _, _) => tail
    YYCell_4_void(tail, _, _, _) => tail
    YYCell_6_void(tail, _, _, _) => tail
    YYEmpty => panic()
  }
}

///|
fn yy_stack_saved(stack : YYStack) -> Int {
  match stack {
    YYCell_10(_, saved, _, _, _) => saved
    YYCell_9(_, saved, _, _) => saved
    YYCell_11(_, saved, _, _, _) => saved
    YYCell_8(_, saved, _, _) => saved
    YYCell_3_void(_, saved, _, _) => saved
    YYCell_5_void(_, saved, _, _) => saved
    YYCell_1(_, saved, _, _, _) => saved
    YYCell_7_void(_, saved, _, _) => saved
    YYCell_2_void(_, saved, _, _) => saved
    YYCell_4_void(_, saved, _, _) => saved
    YYCell_6_void(_, saved, _, _) => saved
    YYEmpty => panic()
  }
}

///|
fn yy_stack_end(stack : YYStack) -> Int {
  match stack {
    YYCell_10(_, _, _, _, end) => end
    YYCell_9(_, _, _, end) => end
    YYCell_11(_, _, _, _, end) => end
    YYCell_8(_, _, _, end) => end
    YYCell_3_void(_, _, _, end) => end
    YYCell_5_void(_, _, _, end) => end
    YYCell_1(_, _, _, _, end) => end
    YYCell_7_void(_, _, _, end) => end
    YYCell_2_void(_, _, _, end) => end
    YYCell_4_void(_, _, _, end) => end
    YYCell_6_void(_, _, _, end) => end
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
  raise UnexpectedToken(token.unwrap(), loc, expected)
}
