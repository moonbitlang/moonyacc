
pub(all) struct Pos {
  offset : Int
}
pub(all) struct Item {
  text : String
  count : Int
  enabled : Bool
}
pub type Mapper = (Int) -> Int
let visits : Ref[Int] = Ref(0)
let _value_0 = 40
let _sub_action_0_result = 100
fn nested_text() -> String {
  let p = Pos::{ offset: 0 }
  try! text([(TEXT("nested"), p, p), (EOF, p, p)])
}

///|
pub(all) enum Token {
  NUMBER(Int)
  TEXT(String)
  FLAG(Bool)
  EOF
}

///|
pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    NUMBER(_) => TK_NUMBER
    TEXT(_) => TK_TEXT
    FLAG(_) => TK_FLAG
    EOF => TK_EOF
  }
}

///|
pub(all) enum TokenKind {
  TK_NUMBER
  TK_TEXT
  TK_FLAG
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
      TK_TEXT => "TEXT"
      TK_FLAG => "FLAG"
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
    TK_TEXT => Repr("TEXT")
    TK_FLAG => Repr("FLAG")
    TK_EOF => Repr("EOF")
  }
}

///|
pub suberror ParseError {
  UnexpectedToken(Token, (Pos, Pos), Array[TokenKind])
  UnexpectedEndOfInput(Pos, Array[TokenKind])
}

///|
// file:///./parser.mbty
// 32|      mark word amount flag EOF { Item::{ text: $2, count: $3, enabled: $4 }}
fn yy_action_0(_value_1 : String, _value_2 : Int, _value_3 : Bool) -> Item {
  let _dollar2 = _value_1
  let _dollar3 = _value_2
  let _dollar4 = _value_3
  ({();  Item::{ text: _dollar2, count: _dollar3, enabled: _dollar4 }
  })
}

///|
// file:///./parser.mbty
// 36|              FLAG { $1}
fn yy_action_1(_value_0 : Bool) -> Bool {
  let _dollar1 = _value_0
  ({();  _dollar1
  })
}

///|
// file:///./parser.mbty
// 35|               NUMBER { $1}
fn yy_action_2(_value_0 : Int) -> Int {
  let _dollar1 = _value_0
  ({();  _dollar1
  })
}

///|
// file:///./parser.mbty
// 33|              { visits.val += 1; ()}
fn yy_action_3() -> Unit {
  ({();  visits.val += 1; ()
  })
}

///|
// file:///./parser.mbty
// 37|          closure EOF { $1}
fn yy_action_4(_value_0 : Mapper) -> Mapper {
  let _dollar1 = _value_0
  ({();  _dollar1
  })
}

///|
// file:///./parser.mbty
// 38|                   NUMBER { let n = $1; x => x + n}
fn yy_action_5(_value_0 : Int) -> Mapper {
  let _dollar1 = _value_0
  ({();  let n = _dollar1; x => x + n
  })
}

///|
// file:///./parser.mbty
// 34|                TEXT { if $1 == "reenter" { nested_text() } else { $1 }}
fn yy_action_6(_value_0 : String) -> String {
  let _dollar1 = _value_0
  ({();  if _dollar1 == "reenter" { nested_text() } else { _dollar1 }
  })
}

///|
// file:///./parser.mbty
// 39|      word EOF { $1}
fn yy_action_7(_value_0 : String) -> String {
  let _dollar1 = _value_0
  ({();  _dollar1
  })
}

///|
// file:///./parser.mbty
// 41|         named_input global_input position_input inline_input EOF { ($1, $2, $3, $4)}
fn yy_action_8(_value_0 : Int, _value_1 : Int, _value_2 : Int, _value_3 : Int) -> (
  Int, Int, Int, Int
) {
  let _dollar1 = _value_0
  let _dollar2 = _value_1
  let _dollar3 = _value_2
  let _dollar4 = _value_3
  ({();  (_dollar1, _dollar2, _dollar3, _dollar4)
  })
}

///|
// file:///./parser.mbty
// 45|                     forwarded_number { _sub_action_0_result + $1}
fn yy_action_10(_value_0 : Int) -> Int {
  let _sub_action_0_result_1 = yy_action_9(_value_0)
  let _dollar1 = _sub_action_0_result_1
  ({();  _sub_action_0_result + _dollar1
  })
}

///|
// file:///./parser.mbty
// 46|                                 NUMBER { $1}
fn yy_action_9(_value_0 : Int) -> Int {
  let _dollar1 = _value_0
  ({();  _dollar1
  })
}

///|
// file:///./parser.mbty
// 44|                       NUMBER _start_0=NUMBER { $startpos($1).offset}
fn yy_action_11(_value_1 : Int, _start_0_1 : Pos) -> Int {
  let _start_0 = _value_1
  let _start_pos_of_item0 = _start_0_1
  ({();  _start_pos_of_item0.offset
  })
}

///|
// file:///./parser.mbty
// 43|                     NUMBER { _value_0 + $1}
fn yy_action_12(_value_0_1 : Int) -> Int {
  let _dollar1 = _value_0_1
  ({();  _value_0 + _dollar1
  })
}

///|
// file:///./parser.mbty
// 42|                    a=NUMBER _value_0=NUMBER { a + $1}
fn yy_action_13(_value_0_1 : Int, _value_1 : Int) -> Int {
  let a = _value_0_1
  let _value_0 = _value_1
  let _dollar1 = _value_0_1
  ({();  a + _dollar1
  })
}

///|
priv enum YYStack {
  YYEmpty
  YYCell_14(YYStack, Int, Int, Pos, Pos)
  YYCell_15(YYStack, Int, Int, Pos, Pos)
  YYCell_16(YYStack, Int, Int, Pos, Pos)
  YYCell_17(YYStack, Int, Int, Pos, Pos)
  YYCell_13(YYStack, Int, (Int, Int, Int, Int), Pos)
  YYCell_12(YYStack, Int, String, Pos)
  YYCell_7(YYStack, Int, String, Pos, Pos)
  YYCell_11(YYStack, Int, Mapper, Pos, Pos)
  YYCell_10(YYStack, Int, Mapper, Pos)
  YYCell_6_void(YYStack, Int, Pos, Pos)
  YYCell_8(YYStack, Int, Int, Pos, Pos)
  YYCell_9(YYStack, Int, Bool, Pos, Pos)
  YYCell_5(YYStack, Int, Item, Pos)
  YYCell_1(YYStack, Int, Int, Pos, Pos)
  YYCell_4_void(YYStack, Int, Pos, Pos)
  YYCell_2(YYStack, Int, String, Pos, Pos)
  YYCell_3(YYStack, Int, Bool, Pos, Pos)
}

///|
priv enum YYResult {
  YYAccept_0(Item)
  YYAccept_1(Mapper)
  YYAccept_2(String)
  YYAccept_3((Int, Int, Int, Int))
}

///|
priv struct YYLookahead {
  symbol : Int
  token : Token?
  start : Pos
  end : Pos
}

///|
fn yy_symbol(token : Token) -> Int {
  match token {
    NUMBER(_) => 1
    TEXT(_) => 2
    FLAG(_) => 3
    EOF => 4
  }
}

///|
priv struct YYContext {
  mut stack : YYStack
  mut state : Int
  mut error_stack : YYStack
  mut error_state : Int
  mut lookahead : YYLookahead?
  mut _yy_result : YYResult?
  initial_position : Pos
  mut last_pos : Pos
  tokens : Array[(Token, Pos, Pos)]
  mut cursor : Int
  mut _yy_state_0 : Int
  mut _yy_value_1_0 : Int
  mut _yy_position_0 : Pos
  mut _yy_position_1 : Pos
  mut _yy_value_3_0 : (Int, Int, Int, Int)?
  mut _yy_value_4_0 : String
  mut _yy_value_5_0 : Mapper?
  mut _yy_value_6_0 : Bool
  mut _yy_value_7_0 : Item?
}

///|
#inline(never)
fn yy_stop(_env : YYContext) -> Int raise ParseError {
  yy_error(
    yy_stack_states(_env.error_stack, _env.error_state),
    _env.lookahead.unwrap().token,
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
    TEXT(_value) =>
      ({
        ()
        _env.stack = YYCell_2(
          _env.stack, _env.state, _value, _env.lookahead.unwrap().start,
          _env.lookahead.unwrap().end
        )
        _env.state = target
      })
    FLAG(_value) =>
      ({
        ()
        _env.stack = YYCell_3(
          _env.stack, _env.state, _value, _env.lookahead.unwrap().start,
          _env.lookahead.unwrap().end
        )
        _env.state = target
      })
    EOF =>
      ({
        ()
        _env.stack = YYCell_4_void(
          _env.stack, _env.state, _env.lookahead.unwrap().start,
          _env.lookahead.unwrap().end
        )
        _env.state = target
      })
  }
  _env.last_pos = _env.lookahead.unwrap().end
  _env.lookahead = None
  _env.error_stack = _env.stack
  _env.error_state = _env.state
}

///|
#inline(never)
fn yy_read_token(_env : YYContext) -> Unit {
  if _env.cursor < _env.tokens.length() {
    let (token, sp, ep) = _env.tokens[_env.cursor]
    _env.cursor += 1
    _env.lookahead = Some(
      YYLookahead::{
        symbol: yy_symbol(token), token: Some(token), start: sp, end: ep
      }
    )
  } else {
    _env.lookahead = Some(
      YYLookahead::{
        symbol: 0, token: None, start: _env.last_pos, end: _env.last_pos
      }
    )
  }
}

///|
fn yy_parse(
  tokens : Array[(Token, Pos, Pos)], entry : Int, initial_state : Int,
  initial_pos? : Pos
) -> YYResult raise ParseError {
  let initial_position = initial_pos.unwrap_or_else(() => tokens[0].1)
  let _env = YYContext::{
    stack: YYEmpty, state: initial_state, error_stack: YYEmpty,
    error_state: initial_state, lookahead: None, _yy_result: None,
    initial_position: initial_position, last_pos: initial_position,
    tokens: tokens, cursor: 0, _yy_state_0: 0, _yy_value_1_0: 0,
    _yy_position_0: initial_position, _yy_position_1: initial_position,
    _yy_value_3_0: None, _yy_value_4_0: "", _yy_value_5_0: None,
    _yy_value_6_0: false, _yy_value_7_0: None
  }
  for pc = entry {
    let next = match pc / 32 {
      0 => _yy_chunk_0(_env, pc)
      1 => _yy_chunk_1(_env, pc)
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
fn _yy_chunk_0(_env : YYContext, _entry : Int) -> Int {
  for pc = _entry {
    match pc {
      0 =>
        ({
          ()
          // run state 0
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          return match _env.lookahead.unwrap().symbol {
            1 => 43
            _ => 42
          }
        })
      1 =>
        ({
          ()
          // run state 2
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          return match _env.lookahead.unwrap().symbol {
            1 => 45
            _ => 42
          }
        })
      2 =>
        ({
          ()
          // run state 4
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          return match _env.lookahead.unwrap().symbol {
            1 => 46
            _ => 42
          }
        })
      3 =>
        ({
          ()
          // run state 6
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          return match _env.lookahead.unwrap().symbol {
            1 => 47
            _ => 42
          }
        })
      4 =>
        ({
          ()
          // run state 7
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          return match _env.lookahead.unwrap().symbol {
            1 => 48
            _ => 42
          }
        })
      5 =>
        ({
          ()
          // run state 9
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          return match _env.lookahead.unwrap().symbol {
            1 => 49
            _ => 42
          }
        })
      6 =>
        ({
          ()
          // run state 11
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          return match _env.lookahead.unwrap().symbol {
            4 => 50
            _ => 42
          }
        })
      7 =>
        ({
          ()
          // run state 13
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          return match _env.lookahead.unwrap().symbol {
            2 => 51
            _ => 42
          }
        })
      8 =>
        ({
          ()
          // run state 15
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          return match _env.lookahead.unwrap().symbol {
            4 => 53
            _ => 42
          }
        })
      9 =>
        ({
          ()
          // run state 18
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          return match _env.lookahead.unwrap().symbol {
            1 => 54
            _ => 42
          }
        })
      10 =>
        ({
          ()
          // run state 21
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          return match _env.lookahead.unwrap().symbol {
            4 => 56
            _ => 42
          }
        })
      11 =>
        ({
          ()
          // run state 23
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          return match _env.lookahead.unwrap().symbol {
            2 => 34
            _ => 42
          }
        })
      12 =>
        ({
          ()
          // run state 25
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          return match _env.lookahead.unwrap().symbol {
            2 => 51
            _ => 42
          }
        })
      13 =>
        ({
          ()
          // run state 26
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          return match _env.lookahead.unwrap().symbol {
            1 => 58
            _ => 42
          }
        })
      14 =>
        ({
          ()
          // run state 28
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          return match _env.lookahead.unwrap().symbol {
            3 => 59
            _ => 42
          }
        })
      15 =>
        ({
          ()
          // run state 30
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          return match _env.lookahead.unwrap().symbol {
            4 => 60
            _ => 42
          }
        })
      16 =>
        ({
          ()
          // reduce named_input -> NUMBER NUMBER
          guard! _env.stack is YYCell_1(
            _yy_tail1, _yy_saved1, _yy_r97, _yy_r98, _yy_read99
          )
          _env._yy_position_1 = _yy_read99
          guard! _yy_tail1 is YYCell_1(
            _yy_tail0, _yy_saved0, _yy_r94, _yy_read95, _yy_r96
          )
          _env._yy_position_0 = _yy_read95
          _env._yy_value_1_0 = yy_action_13(_yy_r94, _yy_r97)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 17
        })
      17 =>
        ({
          ()
          // goto named_input
          match _env._yy_state_0 {
            0 => ()
            _ => panic()
          }
          _env.stack = YYCell_14(
            _env.stack, _env.state, _env._yy_value_1_0, _env._yy_position_0,
            _env._yy_position_1
          )
          _env.state = 4
          continue 2
        })
      18 =>
        ({
          ()
          // reduce global_input -> NUMBER
          guard! _env.stack is YYCell_1(
            _yy_tail0, _yy_saved0, _yy_r103, _yy_read104, _yy_read105
          )
          _env._yy_position_0 = _yy_read104
          _env._yy_position_1 = _yy_read105
          _env._yy_value_1_0 = yy_action_12(_yy_r103)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 19
        })
      19 =>
        ({
          ()
          // goto global_input
          match _env._yy_state_0 {
            4 => ()
            _ => panic()
          }
          _env.stack = YYCell_15(
            _env.stack, _env.state, _env._yy_value_1_0, _env._yy_position_0,
            _env._yy_position_1
          )
          _env.state = 6
          continue 3
        })
      20 =>
        ({
          ()
          // reduce position_input -> NUMBER NUMBER
          guard! _env.stack is YYCell_1(
            _yy_tail1, _yy_saved1, _yy_r112, _yy_r113, _yy_read114
          )
          _env._yy_position_1 = _yy_read114
          guard! _yy_tail1 is YYCell_1(
            _yy_tail0, _yy_saved0, _yy_r109, _yy_read110, _yy_r111
          )
          _env._yy_position_0 = _yy_read110
          _env._yy_value_1_0 = yy_action_11(_yy_r112, _env._yy_position_0)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 21
        })
      21 =>
        ({
          ()
          // goto position_input
          match _env._yy_state_0 {
            6 => ()
            _ => panic()
          }
          _env.stack = YYCell_16(
            _env.stack, _env.state, _env._yy_value_1_0, _env._yy_position_0,
            _env._yy_position_1
          )
          _env.state = 9
          continue 5
        })
      22 =>
        ({
          ()
          // reduce inline_input -> NUMBER
          guard! _env.stack is YYCell_1(
            _yy_tail0, _yy_saved0, _yy_r118, _yy_read119, _yy_read120
          )
          _env._yy_position_0 = _yy_read119
          _env._yy_position_1 = _yy_read120
          _env._yy_value_1_0 = yy_action_10(_yy_r118)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 23
        })
      23 =>
        ({
          ()
          // goto inline_input
          match _env._yy_state_0 {
            9 => ()
            _ => panic()
          }
          _env.stack = YYCell_17(
            _env.stack, _env.state, _env._yy_value_1_0, _env._yy_position_0,
            _env._yy_position_1
          )
          _env.state = 11
          continue 6
        })
      24 =>
        ({
          ()
          // reduce hygiene -> named_input global_input position_input inline_input EOF
          guard! _env.stack is YYCell_4_void(
            _yy_tail4, _yy_saved4, _yy_r137, _yy_read138
          )
          _env._yy_position_1 = _yy_read138
          guard! _yy_tail4 is YYCell_17(
            _yy_tail3, _yy_saved3, _yy_r133, _yy_r134, _yy_r135
          )
          guard! _yy_tail3 is YYCell_16(
            _yy_tail2, _yy_saved2, _yy_r130, _yy_r131, _yy_r132
          )
          guard! _yy_tail2 is YYCell_15(
            _yy_tail1, _yy_saved1, _yy_r127, _yy_r128, _yy_r129
          )
          guard! _yy_tail1 is YYCell_14(
            _yy_tail0, _yy_saved0, _yy_r124, _yy_read125, _yy_r126
          )
          _env._yy_position_0 = _yy_read125
          _env._yy_value_3_0 = Some(
            yy_action_8(_yy_r124, _yy_r127, _yy_r130, _yy_r133)
          )
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 25
        })
      25 =>
        ({
          ()
          // goto hygiene
          match _env._yy_state_0 {
            0 => ()
            _ => panic()
          }
          _env.stack = YYCell_13(
            _env.stack, _env.state, _env._yy_value_3_0.unwrap(),
            _env._yy_position_1
          )
          _env.state = 1
          return 44
        })
      26 =>
        ({
          ()
          // reduce text -> word EOF
          guard! _env.stack is YYCell_4_void(
            _yy_tail1, _yy_saved1, _yy_r146, _yy_read147
          )
          _env._yy_position_1 = _yy_read147
          guard! _yy_tail1 is YYCell_7(
            _yy_tail0, _yy_saved0, _yy_r142, _yy_read143, _yy_r144
          )
          _env._yy_position_0 = _yy_read143
          _env._yy_value_4_0 = yy_action_7(_yy_r142)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 27
        })
      27 =>
        ({
          ()
          // goto text
          match _env._yy_state_0 {
            13 => ()
            _ => panic()
          }
          _env.stack = YYCell_12(
            _env.stack, _env.state, _env._yy_value_4_0, _env._yy_position_1
          )
          _env.state = 14
          return 52
        })
      28 =>
        ({
          ()
          // reduce word -> TEXT
          guard! _env.stack is YYCell_2(
            _yy_tail0, _yy_saved0, _yy_r151, _yy_read152, _yy_read153
          )
          _env._yy_position_0 = _yy_read152
          _env._yy_position_1 = _yy_read153
          _env._yy_value_4_0 = yy_action_6(_yy_r151)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 29
        })
      29 =>
        ({
          ()
          // goto word
          let (_yy_state, _yy_target) = match _env._yy_state_0 {
            13 => (15, 8)
            25 => (26, 13)
            _ => panic()
          }
          _env.stack = YYCell_7(
            _env.stack, _env.state, _env._yy_value_4_0, _env._yy_position_0,
            _env._yy_position_1
          )
          _env.state = _yy_state
          continue _yy_target
        })
      30 =>
        ({
          ()
          // reduce closure -> NUMBER
          guard! _env.stack is YYCell_1(
            _yy_tail0, _yy_saved0, _yy_r157, _yy_read158, _yy_read159
          )
          _env._yy_position_0 = _yy_read158
          _env._yy_position_1 = _yy_read159
          _env._yy_value_5_0 = Some(yy_action_5(_yy_r157))
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 31
        })
      31 =>
        ({
          ()
          // goto closure
          match _env._yy_state_0 {
            18 => ()
            _ => panic()
          }
          _env.stack = YYCell_11(
            _env.stack, _env.state, _env._yy_value_5_0.unwrap(),
            _env._yy_position_0, _env._yy_position_1
          )
          _env.state = 21
          continue 10
        })
      _ => panic()
    }
  }
}

///|
#inline(never)
fn _yy_chunk_1(_env : YYContext, _entry : Int) -> Int raise ParseError {
  for pc = _entry {
    match pc {
      32 =>
        ({
          ()
          // reduce function -> closure EOF
          guard! _env.stack is YYCell_4_void(
            _yy_tail1, _yy_saved1, _yy_r167, _yy_read168
          )
          _env._yy_position_1 = _yy_read168
          guard! _yy_tail1 is YYCell_11(
            _yy_tail0, _yy_saved0, _yy_r163, _yy_read164, _yy_r165
          )
          _env._yy_position_0 = _yy_read164
          _env._yy_value_5_0 = Some(yy_action_4(_yy_r163))
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 33
        })
      33 =>
        ({
          ()
          // goto function
          match _env._yy_state_0 {
            18 => ()
            _ => panic()
          }
          _env.stack = YYCell_10(
            _env.stack, _env.state, _env._yy_value_5_0.unwrap(),
            _env._yy_position_1
          )
          _env.state = 19
          continue 55
        })
      34 =>
        ({
          ()
          // reduce mark ->
          _env._yy_position_0 = if _env.stack is YYEmpty {
            _env.initial_position
          } else {
            yy_stack_end(_env.stack)
          }
          yy_action_3()
          _env._yy_state_0 = _env.state
          _env._yy_position_1 = _env._yy_position_0
          continue 35
        })
      35 =>
        ({
          ()
          // goto mark
          match _env._yy_state_0 {
            23 => ()
            _ => panic()
          }
          _env.stack = YYCell_6_void(
            _env.stack, _env.state, _env._yy_position_0, _env._yy_position_1
          )
          _env.state = 25
          return 12
        })
      36 =>
        ({
          ()
          // reduce amount -> NUMBER
          guard! _env.stack is YYCell_1(
            _yy_tail0, _yy_saved0, _yy_r175, _yy_read176, _yy_read177
          )
          _env._yy_position_0 = _yy_read176
          _env._yy_position_1 = _yy_read177
          _env._yy_value_1_0 = yy_action_2(_yy_r175)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 37
        })
      37 =>
        ({
          ()
          // goto amount
          match _env._yy_state_0 {
            26 => ()
            _ => panic()
          }
          _env.stack = YYCell_8(
            _env.stack, _env.state, _env._yy_value_1_0, _env._yy_position_0,
            _env._yy_position_1
          )
          _env.state = 28
          return 14
        })
      38 =>
        ({
          ()
          // reduce flag -> FLAG
          guard! _env.stack is YYCell_3(
            _yy_tail0, _yy_saved0, _yy_r181, _yy_read182, _yy_read183
          )
          _env._yy_position_0 = _yy_read182
          _env._yy_position_1 = _yy_read183
          _env._yy_value_6_0 = yy_action_1(_yy_r181)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 39
        })
      39 =>
        ({
          ()
          // goto flag
          match _env._yy_state_0 {
            28 => ()
            _ => panic()
          }
          _env.stack = YYCell_9(
            _env.stack, _env.state, _env._yy_value_6_0, _env._yy_position_0,
            _env._yy_position_1
          )
          _env.state = 30
          return 15
        })
      40 =>
        ({
          ()
          // reduce item -> mark word amount flag EOF
          guard! _env.stack is YYCell_4_void(
            _yy_tail4, _yy_saved4, _yy_r200, _yy_read201
          )
          _env._yy_position_1 = _yy_read201
          guard! _yy_tail4 is YYCell_9(
            _yy_tail3, _yy_saved3, _yy_r196, _yy_r197, _yy_r198
          )
          guard! _yy_tail3 is YYCell_8(
            _yy_tail2, _yy_saved2, _yy_r193, _yy_r194, _yy_r195
          )
          guard! _yy_tail2 is YYCell_7(
            _yy_tail1, _yy_saved1, _yy_r190, _yy_r191, _yy_r192
          )
          guard! _yy_tail1 is YYCell_6_void(
            _yy_tail0, _yy_saved0, _yy_read188, _yy_r189
          )
          _env._yy_position_0 = _yy_read188
          _env._yy_value_7_0 = Some(yy_action_0(_yy_r190, _yy_r193, _yy_r196))
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 41
        })
      41 =>
        ({
          ()
          // goto item
          match _env._yy_state_0 {
            23 => ()
            _ => panic()
          }
          _env.stack = YYCell_5(
            _env.stack, _env.state, _env._yy_value_7_0.unwrap(),
            _env._yy_position_1
          )
          _env.state = 24
          continue 57
        })
      42 =>
        ({
          ()
          return yy_stop(_env)
        })
      43 =>
        ({
          ()
          // shift NUMBER into state 2
          yy_shift(_env, 2)
          return 1
        })
      44 =>
        ({
          ()
          let _yy_r208 = match _env.stack {
            YYCell_13(_, _, _value, _) => _value
            _ => panic()
          }
          _env._yy_result = Some(YYAccept_3(_yy_r208))
          return -1
        })
      45 =>
        ({
          ()
          // shift NUMBER into state 3
          yy_shift(_env, 3)
          return 16
        })
      46 =>
        ({
          ()
          // shift NUMBER into state 5
          yy_shift(_env, 5)
          return 18
        })
      47 =>
        ({
          ()
          // shift NUMBER into state 7
          yy_shift(_env, 7)
          return 4
        })
      48 =>
        ({
          ()
          // shift NUMBER into state 8
          yy_shift(_env, 8)
          return 20
        })
      49 =>
        ({
          ()
          // shift NUMBER into state 10
          yy_shift(_env, 10)
          return 22
        })
      50 =>
        ({
          ()
          // shift EOF into state 12
          yy_shift(_env, 12)
          return 24
        })
      51 =>
        ({
          ()
          // shift TEXT into state 17
          yy_shift(_env, 17)
          return 28
        })
      52 =>
        ({
          ()
          let _yy_r230 = match _env.stack {
            YYCell_12(_, _, _value, _) => _value
            _ => panic()
          }
          _env._yy_result = Some(YYAccept_2(_yy_r230))
          return -1
        })
      53 =>
        ({
          ()
          // shift EOF into state 16
          yy_shift(_env, 16)
          return 26
        })
      54 =>
        ({
          ()
          // shift NUMBER into state 20
          yy_shift(_env, 20)
          return 30
        })
      55 =>
        ({
          ()
          let _yy_r237 = match _env.stack {
            YYCell_10(_, _, _value, _) => _value
            _ => panic()
          }
          _env._yy_result = Some(YYAccept_1(_yy_r237))
          return -1
        })
      56 =>
        ({
          ()
          // shift EOF into state 22
          yy_shift(_env, 22)
          continue 32
        })
      57 =>
        ({
          ()
          let _yy_r241 = match _env.stack {
            YYCell_5(_, _, _value, _) => _value
            _ => panic()
          }
          _env._yy_result = Some(YYAccept_0(_yy_r241))
          return -1
        })
      58 =>
        ({
          ()
          // shift NUMBER into state 27
          yy_shift(_env, 27)
          continue 36
        })
      59 =>
        ({
          ()
          // shift FLAG into state 29
          yy_shift(_env, 29)
          continue 38
        })
      60 =>
        ({
          ()
          // shift EOF into state 31
          yy_shift(_env, 31)
          continue 40
        })
      _ => panic()
    }
  }
}

///|
pub fn item(tokens : Array[(Token, Pos, Pos)], initial_pos? : Pos) -> Item raise ParseError {
  match yy_parse(tokens, 11, 23, initial_pos?) {
    YYAccept_0(result) => result
    _ => panic()
  }
}

///|
pub fn function(tokens : Array[(Token, Pos, Pos)], initial_pos? : Pos) -> Mapper raise ParseError {
  match yy_parse(tokens, 9, 18, initial_pos?) {
    YYAccept_1(result) => result
    _ => panic()
  }
}

///|
pub fn text(tokens : Array[(Token, Pos, Pos)], initial_pos? : Pos) -> String raise ParseError {
  match yy_parse(tokens, 7, 13, initial_pos?) {
    YYAccept_2(result) => result
    _ => panic()
  }
}

///|
pub fn hygiene(tokens : Array[(Token, Pos, Pos)], initial_pos? : Pos) -> (
  Int, Int, Int, Int
) raise ParseError {
  match yy_parse(tokens, 0, 0, initial_pos?) {
    YYAccept_3(result) => result
    _ => panic()
  }
}

///|
fn yy_stack_tail(stack : YYStack) -> YYStack {
  match stack {
    YYCell_14(tail, _, _, _, _) => tail
    YYCell_15(tail, _, _, _, _) => tail
    YYCell_16(tail, _, _, _, _) => tail
    YYCell_17(tail, _, _, _, _) => tail
    YYCell_13(tail, _, _, _) => tail
    YYCell_12(tail, _, _, _) => tail
    YYCell_7(tail, _, _, _, _) => tail
    YYCell_11(tail, _, _, _, _) => tail
    YYCell_10(tail, _, _, _) => tail
    YYCell_6_void(tail, _, _, _) => tail
    YYCell_8(tail, _, _, _, _) => tail
    YYCell_9(tail, _, _, _, _) => tail
    YYCell_5(tail, _, _, _) => tail
    YYCell_1(tail, _, _, _, _) => tail
    YYCell_4_void(tail, _, _, _) => tail
    YYCell_2(tail, _, _, _, _) => tail
    YYCell_3(tail, _, _, _, _) => tail
    YYEmpty => panic()
  }
}

///|
fn yy_stack_saved(stack : YYStack) -> Int {
  match stack {
    YYCell_14(_, saved, _, _, _) => saved
    YYCell_15(_, saved, _, _, _) => saved
    YYCell_16(_, saved, _, _, _) => saved
    YYCell_17(_, saved, _, _, _) => saved
    YYCell_13(_, saved, _, _) => saved
    YYCell_12(_, saved, _, _) => saved
    YYCell_7(_, saved, _, _, _) => saved
    YYCell_11(_, saved, _, _, _) => saved
    YYCell_10(_, saved, _, _) => saved
    YYCell_6_void(_, saved, _, _) => saved
    YYCell_8(_, saved, _, _, _) => saved
    YYCell_9(_, saved, _, _, _) => saved
    YYCell_5(_, saved, _, _) => saved
    YYCell_1(_, saved, _, _, _) => saved
    YYCell_4_void(_, saved, _, _) => saved
    YYCell_2(_, saved, _, _, _) => saved
    YYCell_3(_, saved, _, _, _) => saved
    YYEmpty => panic()
  }
}

///|
fn yy_stack_end(stack : YYStack) -> Pos {
  match stack {
    YYCell_14(_, _, _, _, end) => end
    YYCell_15(_, _, _, _, end) => end
    YYCell_16(_, _, _, _, end) => end
    YYCell_17(_, _, _, _, end) => end
    YYCell_13(_, _, _, end) => end
    YYCell_12(_, _, _, end) => end
    YYCell_7(_, _, _, _, end) => end
    YYCell_11(_, _, _, _, end) => end
    YYCell_10(_, _, _, end) => end
    YYCell_6_void(_, _, _, end) => end
    YYCell_8(_, _, _, _, end) => end
    YYCell_9(_, _, _, _, end) => end
    YYCell_5(_, _, _, end) => end
    YYCell_1(_, _, _, _, end) => end
    YYCell_4_void(_, _, _, end) => end
    YYCell_2(_, _, _, _, end) => end
    YYCell_3(_, _, _, _, end) => end
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
  0, -2, 7, -35, 10, -36, 15, 20, -37, 23, -38, 28, -39, 31, -2, 38, -40, -41,
  41, -2, -42, 48, -43, 51, -2, 58, 63, -45, 68, -46, 73, -47
]

///|
let yy_diag_data : FixedArray[Int] = [
  3, 1, 4, 13, 3, 14, 6, 1, 1, 5, 2, 1, 7, 15, 8, 2, 1, 9, 16, 11, 1, 1, 10, 2,
  1, 12, 17, 13, 1, 4, 14, 3, 2, 19, 7, 17, 12, 16, 1, 4, 18, 3, 1, 22, 10, 21,
  11, 23, 1, 4, 24, 3, 2, 43, 5, 26, 6, 27, 2, 2, 19, 7, 28, 2, 1, 29, 8, 30, 2,
  3, 31, 9, 32, 1, 4, 33
]

///|
let yy_diag_reductions : FixedArray[(Int, Int)] = [
  (2, 14), (1, 15), (2, 16), (1, 17), (5, 13), (2, 12), (1, 7), (1, 11),
  (2, 10), (0, 6), (1, 8), (1, 9), (5, 5)
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
      if code < 34 {
        (2, code - 2, 0)
      } else {
        let (count, lhs) = yy_diag_reductions[code - 34]
        (3, count, lhs)
      }
  }
}

///|
let yy_terminals : ReadOnlyArray[(Int, TokenKind)] = [
  (1, TK_NUMBER), (2, TK_TEXT), (3, TK_FLAG), (4, TK_EOF)
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
fn yy_error(stack : @list.List[Int], token : Token?, loc : (Pos, Pos)) -> Unit raise ParseError {
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
