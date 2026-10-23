
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
type YYObj = Error

///|
priv suberror YYObj_Void

///|
priv suberror YYObj_Int {
  YYObj_Int(Int)
}

///|
priv suberror YYObj_Unit {
  YYObj_Unit(Unit)
}

///|
priv suberror YYObj_Array__Int__Int__ {
  YYObj_Array__Int__Int__(Array[(Int, Int)])
}

///|
priv suberror YYObj__Int__Int_ {
  YYObj__Int__Int_((Int, Int))
}

///|
priv suberror YYObj__Int__Int__Int_ {
  YYObj__Int__Int__Int_((Int, Int, Int))
}

///|
type YYSymbol = Int

///|
// file:///./parser.mbty
// 17|       e=expr EOF { (e, $startpos(e), $endpos(e)) }
fn yy_action_0(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_Int(e)
  let _start_pos_of_item0 = _args[0].1
  let _end_pos_of_item0 = _args[0].2
  YYObj__Int__Int__Int_(
    ({();  (e, _start_pos_of_item0, _end_pos_of_item0) 
    })
  )
}

///|
// file:///./parser.mbty
// 25|    atom { $1 }
fn yy_action_2(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_1(_last_pos, _args[0:3])
  guard! _sub_action_0_result is YYObj_Int(_dollar1)
  YYObj_Int(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./parser.mbty
// 32|    LPAREN expr RPAREN { $2 }
fn yy_action_1(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj_Int(_dollar2)
  YYObj_Int(
    ({();  _dollar2 
    })
  )
}

///|
// file:///./parser.mbty
// 25|    atom { $1 }
fn yy_action_4(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_3(_last_pos, _args[0:1])
  guard! _sub_action_0_result is YYObj_Int(_dollar1)
  YYObj_Int(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./parser.mbty
// 31|    NUMBER { $1 }
fn yy_action_3(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_Int(_dollar1)
  YYObj_Int(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./parser.mbty
// 26|    expr PLUS expr { $1 + $3 }
fn yy_action_5(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_Int(_dollar1)
  guard! _args[2].0 is YYObj_Int(_dollar3)
  YYObj_Int(
    ({();  _dollar1 + _dollar3 
    })
  )
}

///|
// file:///./parser.mbty
// 27|    expr STAR expr { $1 * $3 }
fn yy_action_6(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_Int(_dollar1)
  guard! _args[2].0 is YYObj_Int(_dollar3)
  YYObj_Int(
    ({();  _dollar1 * _dollar3 
    })
  )
}

///|
// file:///./parser.mbty
// 28|    expr EQ expr { reductions.val += 1; $1 + $3 }
fn yy_action_7(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_Int(_dollar1)
  guard! _args[2].0 is YYObj_Int(_dollar3)
  YYObj_Int(
    ({();  reductions.val += 1; _dollar1 + _dollar3 
    })
  )
}

///|
// file:///./parser.mbty
// 19|                  prefix x=anchored EOF { x + [$loc(x)]}
fn yy_action_9(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_8(_last_pos, _args[0:1])
  guard! _args[1].0 is YYObj_Array__Int__Int__(x)
  let _start_pos_of_item1 = _args[1].1
  let _end_pos_of_item1 = _args[1].2
  YYObj_Array__Int__Int__(
    ({();  x + [(_start_pos_of_item1, _end_pos_of_item1)]
    })
  )
}

///|
// file:///./parser.mbty
// 21|                LPAREN { ()}
fn yy_action_8(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj_Unit(
    ({();  ()
    })
  )
}

///|
// file:///./parser.mbty
// 19|                  prefix x=anchored EOF { x + [$loc(x)]}
fn yy_action_11(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_10(_last_pos, _args[0:0])
  guard! _args[0].0 is YYObj_Array__Int__Int__(x)
  let _start_pos_of_item1 = _args[0].1
  let _end_pos_of_item1 = _args[0].2
  YYObj_Array__Int__Int__(
    ({();  x + [(_start_pos_of_item1, _end_pos_of_item1)]
    })
  )
}

///|
// file:///./parser.mbty
// 21|                               { ()}
fn yy_action_10(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj_Unit(
    ({();  ()
    })
  )
}

///|
// file:///./parser.mbty
// 20|                               e=empty NUMBER { [e, $loc, $sloc]}
fn yy_action_13(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_12(_last_pos, _args[0:0])
  guard! _sub_action_0_result is YYObj__Int__Int_(e)
  let _start_pos = _last_pos
  let _end_pos = _args[0].2
  let _symbol_start_pos = if _args[0].1 != _args[0].2 {
    _args[0].1
  } else {
    _args[0].2
  }
  YYObj_Array__Int__Int__(
    ({();  [e, (_start_pos, _end_pos), (_symbol_start_pos, _end_pos)]
    })
  )
}

///|
// file:///./parser.mbty
// 22|                             { $loc}
fn yy_action_12(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _start_pos = _last_pos
  let _end_pos = _last_pos
  YYObj__Int__Int_(
    ({();  (_start_pos, _end_pos)
    })
  )
}

///|
fn yy_input(token : Token, _start_pos : Int, _end_pos : Int) -> (
  YYSymbol, YYObj
) {
  match token {
    NUMBER(data) => (1, YYObj_Int(data))
    PLUS => (2, YYObj_Void)
    STAR => (3, YYObj_Void)
    EQ => (4, YYObj_Void)
    LPAREN => (5, YYObj_Void)
    RPAREN => (6, YYObj_Void)
    EOF => (7, YYObj_Void)
  }
}

///|
priv struct YYContext {
  mut states : @list.List[Int]
  data : Array[(YYObj, Int, Int)]
  initial_position : Int
  mut error_stack : @list.List[Int]
  mut lookahead : (Int, (YYObj, Int, Int), Token?)?
  mut _yy_result : YYObj
  read_token : (() -> (Token, Int, Int))
  mut _yy_p0_0 : Int
  mut _yy_p1_0 : YYObj
  mut _yy_p2_0 : Int
  mut _yy_p2_1 : Int
}

///|
#inline(never)
fn yy_stop(_env : YYContext) -> Int raise ParseError {
  let (_, _data, token) = _env.lookahead.unwrap()
  yy_error(_env.error_stack, token, (_data.1, _data.2))
  panic()
}

///|
#inline(never)
fn yy_shift(_env : YYContext, state : Int) -> Unit {
  let data = _env.lookahead.unwrap().1
  _env.states = @list.cons(state, _env.states)
  _env.data.push(data)
  _env.lookahead = None
  _env.error_stack = _env.states
}

///|
#inline(never)
fn yy_read_token(_env : YYContext) -> Unit {
  let (token, sp, ep) = (_env.read_token)()
  let (symbol, payload) = yy_input(token, sp, ep)
  _env.lookahead = Some((symbol, (payload, sp, ep), Some(token)))
}

///|
#inline(never)
fn yy_pop(_env : YYContext, count : Int) -> Unit {
  for _ in 0..<count {
    ignore(_env.data.unsafe_pop())
    _env.states = _env.states.unsafe_tail()
  }
}

///|
fn yy_parse(
  read_token : (() -> (Token, Int, Int)), start_pos : Int, entry : Int,
  initial_state : Int
) -> YYObj raise ParseError {
  let initial_position = start_pos
  let states : @list.List[Int] = @list.List([initial_state])
  let _env = YYContext::{
    states: states, data: [], initial_position: initial_position,
    error_stack: states, lookahead: None, _yy_result: YYObj_Void,
    read_token: read_token, _yy_p0_0: 0, _yy_p1_0: YYObj_Void,
    _yy_p2_0: initial_position, _yy_p2_1: initial_position
  }
  for pc = entry {
    let next = match pc / 32 {
      0 => _yy_chunk_0(_env, pc)
      1 => _yy_chunk_1(_env, pc)
      _ => panic()
    }
    if next < 0 {
      return _env._yy_result
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
          continue match _env.lookahead.unwrap().0 {
              1 => 27
              5 => 28
              _ => 26
            }
        })
      1 =>
        ({
          ()
          // run state 3
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().0 {
              7 => 30
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
          continue match _env.lookahead.unwrap().0 {
              1 => 27
              _ => 26
            }
        })
      3 =>
        ({
          ()
          // run state 6
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().0 {
              7 => 31
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
          let _yy_next = match _env.lookahead.unwrap().0 {
            1 => 32
            5 => 33
            _ => 26
          }
          if _yy_next / 32 == 0 {
            continue _yy_next
          } else {
            return _yy_next
          }
        })
      5 =>
        ({
          ()
          // run state 10
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          let _yy_next = match _env.lookahead.unwrap().0 {
            1 => 32
            5 => 33
            _ => 26
          }
          if _yy_next / 32 == 0 {
            continue _yy_next
          } else {
            return _yy_next
          }
        })
      6 =>
        ({
          ()
          // run state 11
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          let _yy_next = match _env.lookahead.unwrap().0 {
            2 => 35
            3 => 36
            4 => 37
            6 => 38
            _ => 26
          }
          if _yy_next / 32 == 0 {
            continue _yy_next
          } else {
            return _yy_next
          }
        })
      7 =>
        ({
          ()
          // run state 12
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          let _yy_next = match _env.lookahead.unwrap().0 {
            1 => 32
            5 => 33
            _ => 26
          }
          if _yy_next / 32 == 0 {
            continue _yy_next
          } else {
            return _yy_next
          }
        })
      8 =>
        ({
          ()
          // run state 13
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          let _yy_next = match _env.lookahead.unwrap().0 {
            2 => 35
            3 => 36
            6 | 7 => 18
            _ => 26
          }
          if _yy_next / 32 == 0 {
            continue _yy_next
          } else {
            return _yy_next
          }
        })
      9 =>
        ({
          ()
          // run state 14
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          let _yy_next = match _env.lookahead.unwrap().0 {
            1 => 32
            5 => 33
            _ => 26
          }
          if _yy_next / 32 == 0 {
            continue _yy_next
          } else {
            return _yy_next
          }
        })
      10 =>
        ({
          ()
          // run state 16
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          let _yy_next = match _env.lookahead.unwrap().0 {
            1 => 32
            5 => 33
            _ => 26
          }
          if _yy_next / 32 == 0 {
            continue _yy_next
          } else {
            return _yy_next
          }
        })
      11 =>
        ({
          ()
          // run state 17
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          let _yy_next = match _env.lookahead.unwrap().0 {
            2 | 4 | 6 | 7 => 21
            3 => 36
            _ => 26
          }
          if _yy_next / 32 == 0 {
            continue _yy_next
          } else {
            return _yy_next
          }
        })
      12 =>
        ({
          ()
          // run state 20
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          let _yy_next = match _env.lookahead.unwrap().0 {
            2 => 35
            3 => 36
            4 => 37
            7 => 39
            _ => 26
          }
          if _yy_next / 32 == 0 {
            continue _yy_next
          } else {
            return _yy_next
          }
        })
      13 =>
        ({
          ()
          // reduce anchored -> NUMBER
          _env._yy_p2_1 = _env.data[_env.data.length() - 1].2
          _env._yy_p2_0 = if _env.data.length() == 1 {
            _env.initial_position
          } else {
            _env.data[_env.data.length() - 2].2
          }
          _env._yy_p1_0 = yy_action_13(
            _env._yy_p2_0, _env.data[_env.data.length() - 1:]
          )
          ignore(_env.data.unsafe_pop())
          _env.states = _env.states.unsafe_tail()
          _env._yy_p0_0 = _env.states.unsafe_head()
          continue 14
        })
      14 =>
        ({
          ()
          // goto anchored
          let (_yy_state, _yy_target) = match _env._yy_p0_0 {
            0 => (3, 1)
            5 => (6, 3)
            _ => panic()
          }
          _env.states = @list.cons(_yy_state, _env.states)
          _env.data.push((_env._yy_p1_0, _env._yy_p2_0, _env._yy_p2_1))
          continue _yy_target
        })
      15 =>
        ({
          ()
          // reduce inline_positions -> anchored EOF
          _env._yy_p2_1 = _env.data[_env.data.length() - 1].2
          _env._yy_p2_0 = if _env.data.length() == 2 {
            _env.initial_position
          } else {
            _env.data[_env.data.length() - 3].2
          }
          _env._yy_p1_0 = yy_action_11(
            _env._yy_p2_0, _env.data[_env.data.length() - 2:]
          )
          yy_pop(_env, 2)
          _env._yy_p0_0 = _env.states.unsafe_head()
          continue 16
        })
      16 =>
        ({
          ()
          // goto inline_positions
          match _env._yy_p0_0 {
            0 => ()
            _ => panic()
          }
          _env.states = @list.cons(1, _env.states)
          _env.data.push((_env._yy_p1_0, _env._yy_p2_0, _env._yy_p2_1))
          continue 29
        })
      17 =>
        ({
          ()
          // reduce inline_positions -> LPAREN anchored EOF
          _env._yy_p2_0 = _env.data[_env.data.length() - 3].1
          _env._yy_p2_1 = _env.data[_env.data.length() - 1].2
          let _yy_r68 = if _env.data.length() == 3 {
            _env.initial_position
          } else {
            _env.data[_env.data.length() - 4].2
          }
          _env._yy_p1_0 = yy_action_9(
            _yy_r68, _env.data[_env.data.length() - 3:]
          )
          yy_pop(_env, 3)
          _env._yy_p0_0 = _env.states.unsafe_head()
          continue 16
        })
      18 =>
        ({
          ()
          // reduce expr -> expr EQ expr
          _env._yy_p2_0 = _env.data[_env.data.length() - 3].1
          _env._yy_p2_1 = _env.data[_env.data.length() - 1].2
          let _yy_r80 = if _env.data.length() == 3 {
            _env.initial_position
          } else {
            _env.data[_env.data.length() - 4].2
          }
          _env._yy_p1_0 = yy_action_7(
            _yy_r80, _env.data[_env.data.length() - 3:]
          )
          yy_pop(_env, 3)
          _env._yy_p0_0 = _env.states.unsafe_head()
          continue 19
        })
      19 =>
        ({
          ()
          // goto expr
          let (_yy_state, _yy_target) = match _env._yy_p0_0 {
            8 => (20, 12)
            10 => (11, 6)
            12 => (13, 8)
            14 => (15, 20)
            16 => (17, 11)
            _ => panic()
          }
          _env.states = @list.cons(_yy_state, _env.states)
          _env.data.push((_env._yy_p1_0, _env._yy_p2_0, _env._yy_p2_1))
          continue _yy_target
        })
      20 =>
        ({
          ()
          // reduce expr -> expr STAR expr
          _env._yy_p2_0 = _env.data[_env.data.length() - 3].1
          _env._yy_p2_1 = _env.data[_env.data.length() - 1].2
          let _yy_r92 = if _env.data.length() == 3 {
            _env.initial_position
          } else {
            _env.data[_env.data.length() - 4].2
          }
          _env._yy_p1_0 = yy_action_6(
            _yy_r92, _env.data[_env.data.length() - 3:]
          )
          yy_pop(_env, 3)
          _env._yy_p0_0 = _env.states.unsafe_head()
          continue 19
        })
      21 =>
        ({
          ()
          // reduce expr -> expr PLUS expr
          _env._yy_p2_0 = _env.data[_env.data.length() - 3].1
          _env._yy_p2_1 = _env.data[_env.data.length() - 1].2
          let _yy_r104 = if _env.data.length() == 3 {
            _env.initial_position
          } else {
            _env.data[_env.data.length() - 4].2
          }
          _env._yy_p1_0 = yy_action_5(
            _yy_r104, _env.data[_env.data.length() - 3:]
          )
          yy_pop(_env, 3)
          _env._yy_p0_0 = _env.states.unsafe_head()
          continue 19
        })
      22 =>
        ({
          ()
          // reduce expr -> NUMBER
          let _yy_data107 = _env.data[_env.data.length() - 1]
          _env._yy_p2_0 = _yy_data107.1
          _env._yy_p2_1 = _yy_data107.2
          let _yy_r110 = if _env.data.length() == 1 {
            _env.initial_position
          } else {
            _env.data[_env.data.length() - 2].2
          }
          _env._yy_p1_0 = yy_action_4(
            _yy_r110, _env.data[_env.data.length() - 1:]
          )
          ignore(_env.data.unsafe_pop())
          _env.states = _env.states.unsafe_tail()
          _env._yy_p0_0 = _env.states.unsafe_head()
          continue 19
        })
      23 =>
        ({
          ()
          // reduce expr -> LPAREN expr RPAREN
          _env._yy_p2_0 = _env.data[_env.data.length() - 3].1
          _env._yy_p2_1 = _env.data[_env.data.length() - 1].2
          let _yy_r122 = if _env.data.length() == 3 {
            _env.initial_position
          } else {
            _env.data[_env.data.length() - 4].2
          }
          _env._yy_p1_0 = yy_action_2(
            _yy_r122, _env.data[_env.data.length() - 3:]
          )
          yy_pop(_env, 3)
          _env._yy_p0_0 = _env.states.unsafe_head()
          continue 19
        })
      24 =>
        ({
          ()
          // reduce start -> expr EOF
          _env._yy_p2_0 = _env.data[_env.data.length() - 2].1
          _env._yy_p2_1 = _env.data[_env.data.length() - 1].2
          let _yy_r131 = if _env.data.length() == 2 {
            _env.initial_position
          } else {
            _env.data[_env.data.length() - 3].2
          }
          _env._yy_p1_0 = yy_action_0(
            _yy_r131, _env.data[_env.data.length() - 2:]
          )
          yy_pop(_env, 2)
          _env._yy_p0_0 = _env.states.unsafe_head()
          continue 25
        })
      25 =>
        ({
          ()
          // goto start
          match _env._yy_p0_0 {
            8 => ()
            _ => panic()
          }
          _env.states = @list.cons(9, _env.states)
          _env.data.push((_env._yy_p1_0, _env._yy_p2_0, _env._yy_p2_1))
          return 34
        })
      26 =>
        ({
          ()
          return yy_stop(_env)
        })
      27 =>
        ({
          ()
          // shift NUMBER into state 2
          yy_shift(_env, 2)
          continue 13
        })
      28 =>
        ({
          ()
          // shift LPAREN into state 5
          yy_shift(_env, 5)
          continue 2
        })
      29 =>
        ({
          ()
          let _yy_r139 = _env.data[_env.data.length() - 1].0
          _env._yy_result = _yy_r139
          return -1
        })
      30 =>
        ({
          ()
          // shift EOF into state 4
          yy_shift(_env, 4)
          continue 15
        })
      31 =>
        ({
          ()
          // shift EOF into state 7
          yy_shift(_env, 7)
          continue 17
        })
      _ => panic()
    }
  }
}

///|
#inline(never)
fn _yy_chunk_1(_env : YYContext, _entry : Int) -> Int {
  match _entry {
    32 =>
      ({
        ()
        // shift NUMBER into state 18
        yy_shift(_env, 18)
        return 22
      })
    33 =>
      ({
        ()
        // shift LPAREN into state 10
        yy_shift(_env, 10)
        return 5
      })
    34 =>
      ({
        ()
        let _yy_r152 = _env.data[_env.data.length() - 1].0
        _env._yy_result = _yy_r152
        return -1
      })
    35 =>
      ({
        ()
        // shift PLUS into state 16
        yy_shift(_env, 16)
        return 10
      })
    36 =>
      ({
        ()
        // shift STAR into state 14
        yy_shift(_env, 14)
        return 9
      })
    37 =>
      ({
        ()
        // shift EQ into state 12
        yy_shift(_env, 12)
        return 7
      })
    38 =>
      ({
        ()
        // shift RPAREN into state 19
        yy_shift(_env, 19)
        return 23
      })
    39 =>
      ({
        ()
        // shift EOF into state 21
        yy_shift(_env, 21)
        return 24
      })
    _ => panic()
  }
}

///|
pub fn start(read_token : (() -> (Token, Int, Int)), start_pos : Int) -> (
  Int, Int, Int
) raise ParseError {
  let result = yy_parse(read_token, start_pos, 4, 8)
  guard! result is YYObj__Int__Int__Int_(result)
  result
}

///|
pub fn inline_positions(read_token : (() -> (Token, Int, Int)), start_pos : Int) -> Array[
  (Int, Int)
] raise ParseError {
  let result = yy_parse(read_token, start_pos, 0, 0)
  guard! result is YYObj_Array__Int__Int__(result)
  result
}

///|
let yy_diag_rows : FixedArray[Int] = [
  0, -2, -25, 9, -26, 12, 17, -27, 20, -2, 29, 36, 45, 52, 61, -28, 68, 75, -29,
  -28, 86, -30
]

///|
let yy_diag_data : FixedArray[Int] = [
  4, 1, 4, 5, 7, 9, 3, 10, 5, 1, 7, 6, 2, 1, 4, 10, 8, 1, 7, 9, 4, 1, 20, 5, 12,
  8, 11, 11, 22, 3, 1, 20, 5, 12, 11, 13, 4, 2, 18, 3, 16, 4, 14, 6, 21, 3, 1,
  20, 5, 12, 11, 15, 4, 2, 18, 3, 16, 6, 27, 7, 27, 3, 1, 20, 5, 12, 11, 17, 3,
  1, 20, 5, 12, 11, 19, 5, 2, 27, 3, 16, 4, 27, 6, 27, 7, 27, 4, 2, 18, 3, 16,
  4, 14, 7, 23
]

///|
let yy_diag_reductions : FixedArray[(Int, Int)] = [
  (1, 10), (2, 9), (3, 9), (3, 11), (1, 11), (2, 8)
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
      if code < 24 {
        (2, code - 2, 0)
      } else {
        let (count, lhs) = yy_diag_reductions[code - 24]
        (3, count, lhs)
      }
  }
}

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
  for (symbol, kind) in ([
    (1, TK_NUMBER), (2, TK_PLUS), (3, TK_STAR), (4, TK_EQ), (5, TK_LPAREN),
    (6, TK_RPAREN), (7, TK_EOF)
  ] : Array[(Int, TokenKind)]) {
    if yy_expected(stack, symbol) {
      expected.push(kind)
    }
  }
  raise UnexpectedToken(token.unwrap(), loc, expected)
}
