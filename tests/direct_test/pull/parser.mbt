
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
priv suberror YYObj__Int__Int__Int_ {
  YYObj__Int__Int__Int_((Int, Int, Int))
}

///|
type YYSymbol = Int

///|
// file:///./parser.mbty
// 16|       e=expr EOF { (e, $startpos(e), $endpos(e)) }
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
// 19|    atom { $1 }
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
// 26|    LPAREN expr RPAREN { $2 }
fn yy_action_1(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj_Int(_dollar2)
  YYObj_Int(
    ({();  _dollar2 
    })
  )
}

///|
// file:///./parser.mbty
// 19|    atom { $1 }
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
// 25|    NUMBER { $1 }
fn yy_action_3(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_Int(_dollar1)
  YYObj_Int(
    ({();  _dollar1 
    })
  )
}

///|
// file:///./parser.mbty
// 20|    expr PLUS expr { $1 + $3 }
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
// 21|    expr STAR expr { $1 * $3 }
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
// 22|    expr EQ expr { reductions.val += 1; $1 + $3 }
fn yy_action_7(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_Int(_dollar1)
  guard! _args[2].0 is YYObj_Int(_dollar3)
  YYObj_Int(
    ({();  reductions.val += 1; _dollar1 + _dollar3 
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
  mut last_pos : Int
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
  let (_, (_, sp, ep), token) = _env.lookahead.unwrap()
  yy_error(_env.error_stack, token, (sp, ep))
  panic()
}

///|
#inline(never)
fn yy_shift(_env : YYContext, state : Int) -> Unit {
  let data = _env.lookahead.unwrap().1
  _env.states = @list.cons(state, _env.states)
  _env.data.push(data)
  _env.last_pos = data.2
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
  let last_pos = start_pos
  let states : @list.List[Int] = @list.List([initial_state])
  let _env = YYContext::{
    states: states, data: [], last_pos: last_pos, error_stack: states,
    lookahead: None, _yy_result: YYObj_Void, read_token: read_token,
    _yy_p0_0: 0, _yy_p1_0: YYObj_Void, _yy_p2_0: last_pos, _yy_p2_1: last_pos
  }
  for pc = entry {
    let next = match pc / 32 {
      0 => _yy_chunk_0(_env, pc)
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
              1 => 24
              5 => 25
              _ => 23
            }
        })
      1 =>
        ({
          ()
          // run state 2
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().0 {
              1 => 24
              5 => 25
              _ => 23
            }
        })
      2 =>
        ({
          ()
          // run state 3
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().0 {
              2 => 27
              3 => 28
              4 => 29
              6 => 30
              _ => 23
            }
        })
      3 =>
        ({
          ()
          // run state 4
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().0 {
              1 => 24
              5 => 25
              _ => 23
            }
        })
      4 =>
        ({
          ()
          // run state 5
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().0 {
              2 => 27
              3 => 28
              6 | 7 => 9
              _ => 23
            }
        })
      5 =>
        ({
          ()
          // run state 6
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().0 {
              1 => 24
              5 => 25
              _ => 23
            }
        })
      6 =>
        ({
          ()
          // run state 8
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().0 {
              1 => 24
              5 => 25
              _ => 23
            }
        })
      7 =>
        ({
          ()
          // run state 9
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().0 {
              2 | 4 | 6 | 7 => 12
              3 => 28
              _ => 23
            }
        })
      8 =>
        ({
          ()
          // run state 12
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().0 {
              2 => 27
              3 => 28
              4 => 29
              7 => 31
              _ => 23
            }
        })
      9 =>
        ({
          ()
          // reduce expr -> expr EQ expr
          _env._yy_p2_0 = _env.data[_env.data.length() - 3].1
          _env._yy_p2_1 = _env.data[_env.data.length() - 1].2
          let _yy_r36 = _env.last_pos
          _env._yy_p1_0 = yy_action_7(
            _yy_r36, _env.data[_env.data.length() - 3:]
          )
          yy_pop(_env, 3)
          _env._yy_p0_0 = _env.states.unsafe_head()
          continue 10
        })
      10 =>
        ({
          ()
          // goto expr
          continue match _env._yy_p0_0 {
              0 => 17
              2 => 18
              4 => 19
              6 => 20
              8 => 21
              _ => panic()
            }
        })
      11 =>
        ({
          ()
          // reduce expr -> expr STAR expr
          _env._yy_p2_0 = _env.data[_env.data.length() - 3].1
          _env._yy_p2_1 = _env.data[_env.data.length() - 1].2
          let _yy_r48 = _env.last_pos
          _env._yy_p1_0 = yy_action_6(
            _yy_r48, _env.data[_env.data.length() - 3:]
          )
          yy_pop(_env, 3)
          _env._yy_p0_0 = _env.states.unsafe_head()
          continue 10
        })
      12 =>
        ({
          ()
          // reduce expr -> expr PLUS expr
          _env._yy_p2_0 = _env.data[_env.data.length() - 3].1
          _env._yy_p2_1 = _env.data[_env.data.length() - 1].2
          let _yy_r60 = _env.last_pos
          _env._yy_p1_0 = yy_action_5(
            _yy_r60, _env.data[_env.data.length() - 3:]
          )
          yy_pop(_env, 3)
          _env._yy_p0_0 = _env.states.unsafe_head()
          continue 10
        })
      13 =>
        ({
          ()
          // reduce expr -> NUMBER
          let _yy_data63 = _env.data[_env.data.length() - 1]
          _env._yy_p2_0 = _yy_data63.1
          _env._yy_p2_1 = _yy_data63.2
          let _yy_r66 = _env.last_pos
          _env._yy_p1_0 = yy_action_4(
            _yy_r66, _env.data[_env.data.length() - 1:]
          )
          ignore(_env.data.unsafe_pop())
          _env.states = _env.states.unsafe_tail()
          _env._yy_p0_0 = _env.states.unsafe_head()
          continue 10
        })
      14 =>
        ({
          ()
          // reduce expr -> LPAREN expr RPAREN
          _env._yy_p2_0 = _env.data[_env.data.length() - 3].1
          _env._yy_p2_1 = _env.data[_env.data.length() - 1].2
          let _yy_r78 = _env.last_pos
          _env._yy_p1_0 = yy_action_2(
            _yy_r78, _env.data[_env.data.length() - 3:]
          )
          yy_pop(_env, 3)
          _env._yy_p0_0 = _env.states.unsafe_head()
          continue 10
        })
      15 =>
        ({
          ()
          // reduce start -> expr EOF
          _env._yy_p2_0 = _env.data[_env.data.length() - 2].1
          _env._yy_p2_1 = _env.data[_env.data.length() - 1].2
          let _yy_r87 = _env.last_pos
          _env._yy_p1_0 = yy_action_0(
            _yy_r87, _env.data[_env.data.length() - 2:]
          )
          yy_pop(_env, 2)
          _env._yy_p0_0 = _env.states.unsafe_head()
          continue 16
        })
      16 =>
        ({
          ()
          // goto start
          continue match _env._yy_p0_0 {
              0 => 22
              _ => panic()
            }
        })
      17 =>
        ({
          ()
          _env.states = @list.cons(12, _env.states)
          _env.data.push((_env._yy_p1_0, _env._yy_p2_0, _env._yy_p2_1))
          continue 8
        })
      18 =>
        ({
          ()
          _env.states = @list.cons(3, _env.states)
          _env.data.push((_env._yy_p1_0, _env._yy_p2_0, _env._yy_p2_1))
          continue 2
        })
      19 =>
        ({
          ()
          _env.states = @list.cons(5, _env.states)
          _env.data.push((_env._yy_p1_0, _env._yy_p2_0, _env._yy_p2_1))
          continue 4
        })
      20 =>
        ({
          ()
          _env.states = @list.cons(7, _env.states)
          _env.data.push((_env._yy_p1_0, _env._yy_p2_0, _env._yy_p2_1))
          continue 11
        })
      21 =>
        ({
          ()
          _env.states = @list.cons(9, _env.states)
          _env.data.push((_env._yy_p1_0, _env._yy_p2_0, _env._yy_p2_1))
          continue 7
        })
      22 =>
        ({
          ()
          _env.states = @list.cons(1, _env.states)
          _env.data.push((_env._yy_p1_0, _env._yy_p2_0, _env._yy_p2_1))
          continue 26
        })
      23 =>
        ({
          ()
          return yy_stop(_env)
        })
      24 =>
        ({
          ()
          // shift NUMBER into state 10
          yy_shift(_env, 10)
          continue 13
        })
      25 =>
        ({
          ()
          // shift LPAREN into state 2
          yy_shift(_env, 2)
          continue 1
        })
      26 =>
        ({
          ()
          let _yy_r95 = _env.data[_env.data.length() - 1].0
          _env._yy_result = _yy_r95
          return -1
        })
      27 =>
        ({
          ()
          // shift PLUS into state 8
          yy_shift(_env, 8)
          continue 6
        })
      28 =>
        ({
          ()
          // shift STAR into state 6
          yy_shift(_env, 6)
          continue 5
        })
      29 =>
        ({
          ()
          // shift EQ into state 4
          yy_shift(_env, 4)
          continue 3
        })
      30 =>
        ({
          ()
          // shift RPAREN into state 11
          yy_shift(_env, 11)
          continue 14
        })
      31 =>
        ({
          ()
          // shift EOF into state 13
          yy_shift(_env, 13)
          continue 15
        })
      _ => panic()
    }
  }
}

///|
pub fn start(read_token : (() -> (Token, Int, Int)), start_pos : Int) -> (
  Int, Int, Int
) raise ParseError {
  let result = yy_parse(read_token, start_pos, 0, 0)
  guard! result is YYObj__Int__Int__Int_(result)
  result
}

///|
let yy_diag_rows : FixedArray[Int] = [
  0, -2, 9, 16, 25, 32, 41, -17, 48, 55, -18, -17, 66, -19
]

///|
let yy_diag_data : FixedArray[Int] = [
  4, 1, 12, 5, 4, 8, 3, 9, 14, 3, 1, 12, 5, 4, 9, 5, 4, 2, 10, 3, 8, 4, 6, 6,
  13, 3, 1, 12, 5, 4, 9, 7, 4, 2, 10, 3, 8, 6, 16, 7, 16, 3, 1, 12, 5, 4, 9, 9,
  3, 1, 12, 5, 4, 9, 11, 5, 2, 16, 3, 8, 4, 16, 6, 16, 7, 16, 4, 2, 10, 3, 8, 4,
  6, 7, 15
]

///|
let yy_diag_reductions : FixedArray[(Int, Int)] = [(3, 9), (1, 9), (2, 8)]

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
      if code < 16 {
        (2, code - 2, 0)
      } else {
        let (count, lhs) = yy_diag_reductions[code - 16]
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
