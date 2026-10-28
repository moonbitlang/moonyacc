
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
priv enum YYStack {
  YYEmpty
  YYCell_10(YYStack, Int, Int)
  YYCell_8_void(YYStack, Int)
  YYCell_9(YYStack, Int, Int)
  YYCell_7(YYStack, Int, Int)
  YYCell_4_void(YYStack, Int)
  YYCell_2_void(YYStack, Int)
  YYCell_3_void(YYStack, Int)
  YYCell_5_void(YYStack, Int)
  YYCell_6_void(YYStack, Int)
}

///|
priv enum YYResult {
  YYAccept_0(Int)
  YYAccept_1(Int)
}

///|
priv struct YYLookahead {
  symbol : Int
  token : Token?
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
priv struct YYContext {
  mut stack : YYStack
  mut state : Int
  mut error_stack : YYStack
  mut error_state : Int
  mut error_depth : Int
  mut error_suffix_0 : Int
  mut lookahead : YYLookahead?
  mut _yy_result : YYResult?
  tokens : Array[(Token, Unit, Unit)]
  mut cursor : Int
  mut _yy_state_0 : Int
  mut _yy_value_1_0 : Int
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
    }), _env.lookahead.unwrap().token, ((), ())
  )
  panic()
}

///|
#inline(never)
fn yy_shift(_env : YYContext, target : Int) -> Unit {
  match _env.lookahead.unwrap().token.unwrap() {
    PLUS =>
      ({
        ()
        _env.stack = YYCell_2_void(_env.stack, _env.state)
        _env.state = target
      })
    STAR =>
      ({
        ()
        _env.stack = YYCell_3_void(_env.stack, _env.state)
        _env.state = target
      })
    LPAREN =>
      ({
        ()
        _env.stack = YYCell_4_void(_env.stack, _env.state)
        _env.state = target
      })
    RPAREN =>
      ({
        ()
        _env.stack = YYCell_5_void(_env.stack, _env.state)
        _env.state = target
      })
    EOF =>
      ({
        ()
        _env.stack = YYCell_6_void(_env.stack, _env.state)
        _env.state = target
      })
    _ => panic()
  }
  _env.lookahead = None
  _env.error_stack = _env.stack
  _env.error_state = _env.state
  _env.error_depth = 0
}

///|
#inline(never)
fn yy_read_token(_env : YYContext) -> Unit {
  if _env.cursor < _env.tokens.length() {
    let (token, _, _) = _env.tokens[_env.cursor]
    _env.cursor += 1
    _env.lookahead = Some(
      YYLookahead::{symbol: yy_symbol(token), token: Some(token)}
    )
  } else {
    _env.lookahead = Some(YYLookahead::{symbol: 0, token: None})
  }
}

///|
fn yy_parse(
  tokens : Array[(Token, Unit, Unit)], entry : Int, initial_state : Int,
  initial_pos? : Unit
) -> YYResult raise ParseError {
  ignore(initial_pos.unwrap_or_else(() => tokens[0].1))
  let _env = YYContext::{
    stack: YYEmpty, state: initial_state, error_stack: YYEmpty,
    error_state: initial_state, error_depth: 0, error_suffix_0: 0,
    lookahead: None, _yy_result: None, tokens: tokens, cursor: 0,
    _yy_state_0: 0, _yy_value_1_0: 0
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
              0 => 9
              _ => 19
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
              1 | 4 => 11
              _ => 19
            }
        })
      2 =>
        ({
          ()
          // run state 4
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              1 => 27
              4 => 22
              _ => 19
            }
        })
      3 =>
        ({
          ()
          // run state 5
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              1 => 28
              4 => 22
              _ => 19
            }
        })
      4 =>
        ({
          ()
          // run state 6
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              2 => 23
              3 => 24
              5 => 25
              _ => 19
            }
        })
      5 =>
        ({
          ()
          // run state 8
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              1 => 29
              4 => 22
              _ => 19
            }
        })
      6 =>
        ({
          ()
          // run state 10
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              1 => 30
              4 => 22
              _ => 19
            }
        })
      7 =>
        ({
          ()
          // run state 11
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              2 | 5 | 6 => 16
              3 => 24
              _ => 19
            }
        })
      8 =>
        ({
          ()
          // run state 13
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              2 => 23
              3 => 24
              6 => 26
              _ => 19
            }
        })
      9 =>
        ({
          ()
          // reduce empty ->
          _env._yy_value_1_0 = yy_action_6()
          _env._yy_state_0 = _env.state
          continue 10
        })
      10 =>
        ({
          ()
          // goto empty
          match _env._yy_state_0 {
            0 => ()
            _ => panic()
          }
          _env.stack = YYCell_10(_env.stack, _env.state, _env._yy_value_1_0)
          _env.state = 1
          continue 20
        })
      11 =>
        ({
          ()
          // reduce marker ->
          yy_action_5()
          _env._yy_state_0 = _env.state
          continue 12
        })
      12 =>
        ({
          ()
          // goto marker
          match _env._yy_state_0 {
            2 => ()
            _ => panic()
          }
          _env.stack = YYCell_8_void(_env.stack, _env.state)
          _env.state = 4
          continue 2
        })
      13 =>
        ({
          ()
          // reduce expr -> LPAREN expr RPAREN
          guard! _env.stack is YYCell_5_void(_yy_tail2, _yy_saved2)
          guard! _yy_tail2 is YYCell_9(_yy_tail1, _yy_saved1, _yy_r46)
          guard! _yy_tail1 is YYCell_4_void(_yy_tail0, _yy_saved0)
          _env._yy_value_1_0 = yy_action_4(_yy_r46)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 14
        })
      14 =>
        ({
          ()
          // goto expr
          let (_yy_state, _yy_target) = match _env._yy_state_0 {
            4 => (13, 8)
            5 => (6, 4)
            8 => (9, 15)
            10 => (11, 7)
            _ => panic()
          }
          _env.stack = YYCell_9(_env.stack, _env.state, _env._yy_value_1_0)
          _env.state = _yy_state
          continue _yy_target
        })
      15 =>
        ({
          ()
          // reduce expr -> expr STAR expr
          guard! _env.stack is YYCell_9(_yy_tail2, _yy_saved2, _yy_r61)
          guard! _yy_tail2 is YYCell_3_void(_yy_tail1, _yy_saved1)
          guard! _yy_tail1 is YYCell_9(_yy_tail0, _yy_saved0, _yy_r55)
          _env._yy_value_1_0 = yy_action_3(_yy_r55, _yy_r61)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 14
        })
      16 =>
        ({
          ()
          // reduce expr -> expr PLUS expr
          guard! _env.stack is YYCell_9(_yy_tail2, _yy_saved2, _yy_r73)
          guard! _yy_tail2 is YYCell_2_void(_yy_tail1, _yy_saved1)
          guard! _yy_tail1 is YYCell_9(_yy_tail0, _yy_saved0, _yy_r67)
          _env._yy_value_1_0 = yy_action_2(_yy_r67, _yy_r73)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 14
        })
      17 =>
        ({
          ()
          // reduce start -> marker expr EOF
          guard! _env.stack is YYCell_6_void(_yy_tail2, _yy_saved2)
          guard! _yy_tail2 is YYCell_9(_yy_tail1, _yy_saved1, _yy_r88)
          guard! _yy_tail1 is YYCell_8_void(_yy_tail0, _yy_saved0)
          _env._yy_value_1_0 = yy_action_0(_yy_r88)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 18
        })
      18 =>
        ({
          ()
          // goto start
          match _env._yy_state_0 {
            2 => ()
            _ => panic()
          }
          _env.stack = YYCell_7(_env.stack, _env.state, _env._yy_value_1_0)
          _env.state = 3
          continue 21
        })
      19 =>
        ({
          ()
          return yy_stop(_env)
        })
      20 =>
        ({
          ()
          let _yy_r97 = match _env.stack {
            YYCell_10(_, _, _value) => _value
            _ => panic()
          }
          _env._yy_result = Some(YYAccept_1(_yy_r97))
          return -1
        })
      21 =>
        ({
          ()
          let _yy_r98 = match _env.stack {
            YYCell_7(_, _, _value) => _value
            _ => panic()
          }
          _env._yy_result = Some(YYAccept_0(_yy_r98))
          return -1
        })
      22 =>
        ({
          ()
          // shift LPAREN into state 5
          yy_shift(_env, 5)
          continue 3
        })
      23 =>
        ({
          ()
          // shift PLUS into state 10
          yy_shift(_env, 10)
          continue 6
        })
      24 =>
        ({
          ()
          // shift STAR into state 8
          yy_shift(_env, 8)
          continue 5
        })
      25 =>
        ({
          ()
          // shift RPAREN into state 7
          yy_shift(_env, 7)
          continue 13
        })
      26 =>
        ({
          ()
          // shift EOF into state 14
          yy_shift(_env, 14)
          continue 17
        })
      27 =>
        ({
          ()
          // shift NUMBER into state 12
          guard! _env.lookahead.unwrap().token.unwrap() is NUMBER(
            _yy_token_value
          )
          let _yy_r117 = _yy_token_value
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 12
          _env.error_depth = 1
          let _yy_r124 = yy_action_1(_yy_r117)
          let _yy_r125 = _env.state
          _env.stack = YYCell_9(_env.stack, _env.state, _yy_r124)
          _env.state = 13
          continue 8
        })
      28 =>
        ({
          ()
          // shift NUMBER into state 12
          guard! _env.lookahead.unwrap().token.unwrap() is NUMBER(
            _yy_token_value
          )
          let _yy_r136 = _yy_token_value
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 12
          _env.error_depth = 1
          let _yy_r143 = yy_action_1(_yy_r136)
          let _yy_r144 = _env.state
          _env.stack = YYCell_9(_env.stack, _env.state, _yy_r143)
          _env.state = 6
          continue 4
        })
      29 =>
        ({
          ()
          // shift NUMBER into state 12
          guard! _env.lookahead.unwrap().token.unwrap() is NUMBER(
            _yy_token_value
          )
          let _yy_r164 = _yy_token_value
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 12
          _env.error_depth = 1
          let _yy_r171 = yy_action_1(_yy_r164)
          let _yy_r172 = _env.state
          _env.stack = YYCell_9(_env.stack, _env.state, _yy_r171)
          _env.state = 9
          continue 15
        })
      30 =>
        ({
          ()
          // shift NUMBER into state 12
          guard! _env.lookahead.unwrap().token.unwrap() is NUMBER(
            _yy_token_value
          )
          let _yy_r183 = _yy_token_value
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 12
          _env.error_depth = 1
          let _yy_r190 = yy_action_1(_yy_r183)
          let _yy_r191 = _env.state
          _env.stack = YYCell_9(_env.stack, _env.state, _yy_r190)
          _env.state = 11
          continue 7
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
fn yy_stack_tail(stack : YYStack) -> YYStack {
  match stack {
    YYCell_10(tail, _, _) => tail
    YYCell_8_void(tail, _) => tail
    YYCell_9(tail, _, _) => tail
    YYCell_7(tail, _, _) => tail
    YYCell_4_void(tail, _) => tail
    YYCell_2_void(tail, _) => tail
    YYCell_3_void(tail, _) => tail
    YYCell_5_void(tail, _) => tail
    YYCell_6_void(tail, _) => tail
    YYEmpty => panic()
  }
}

///|
fn yy_stack_saved(stack : YYStack) -> Int {
  match stack {
    YYCell_10(_, saved, _) => saved
    YYCell_8_void(_, saved) => saved
    YYCell_9(_, saved, _) => saved
    YYCell_7(_, saved, _) => saved
    YYCell_4_void(_, saved) => saved
    YYCell_2_void(_, saved) => saved
    YYCell_3_void(_, saved) => saved
    YYCell_5_void(_, saved) => saved
    YYCell_6_void(_, saved) => saved
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
