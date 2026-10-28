
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
let amount_events : Ref[Array[String]] = Ref([])
let amount_spans : Ref[Array[(Int, Int, Int)]] = Ref([])
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
// 34|      mark word amount flag EOF { Item::{ text: $2, count: $3, enabled: $4 }}
fn yy_action_0(_value_1 : String, _value_2 : Int, _value_3 : Bool) -> Item {
  let _dollar2 = _value_1
  let _dollar3 = _value_2
  let _dollar4 = _value_3
  ({();  Item::{ text: _dollar2, count: _dollar3, enabled: _dollar4 }
  })
}

///|
// file:///./parser.mbty
// 50|              FLAG { $1}
fn yy_action_1(_value_0 : Bool) -> Bool {
  let _dollar1 = _value_0
  ({();  _dollar1
  })
}

///|
// file:///./parser.mbty
// 37|               decoded_amount amount_end { amount_events.val.push("amount")
// 38|  amount_spans.val.push(($startpos($1).offset, $endpos($1).offset, $2))
// 39|  $1
// 40|}
fn yy_action_2(_start_0 : Pos, _end_0 : Pos, _value_1 : Int, _value_0 : Int) -> Int {
  let _start_pos_of_item0 = _start_0
  let _end_pos_of_item0 = _end_0
  let _dollar2 = _value_1
  let _dollar1 = _value_0
  ({();  amount_events.val.push("amount")
  amount_spans.val.push((_start_pos_of_item0.offset, _end_pos_of_item0.offset, _dollar2))
  _dollar1

  })
}

///|
// file:///./parser.mbty
// 47|                   { amount_events.val.push("end")
// 48|  $endpos.offset
// 49|}
fn yy_action_3(_before_rhs : Pos) -> Int {
  let _end_pos = _before_rhs
  ({();  amount_events.val.push("end")
  _end_pos.offset

  })
}

///|
// file:///./parser.mbty
// 41|                                 NUMBER { amount_events.val.push("encode")
// 42|  ("decode", $1)
// 43|}
fn yy_action_4(_value_0 : Int) -> (String, Int) {
  let _dollar1 = _value_0
  ({();  amount_events.val.push("encode")
  ("decode", _dollar1)

  })
}

///|
// file:///./parser.mbty
// 44|                       encoded_amount { amount_events.val.push($1.0)
// 45|  $1.1
// 46|}
fn yy_action_5(_value_0 : (String, Int)) -> Int {
  let _dollar1 = _value_0
  ({();  amount_events.val.push(_dollar1.0)
  _dollar1.1

  })
}

///|
// file:///./parser.mbty
// 35|              { visits.val += 1; ()}
fn yy_action_6() -> Unit {
  ({();  visits.val += 1; ()
  })
}

///|
// file:///./parser.mbty
// 51|          closure EOF { $1}
fn yy_action_7(_value_0 : Mapper) -> Mapper {
  let _dollar1 = _value_0
  ({();  _dollar1
  })
}

///|
// file:///./parser.mbty
// 52|                   NUMBER { let n = $1; x => x + n}
fn yy_action_8(_value_0 : Int) -> Mapper {
  let _dollar1 = _value_0
  ({();  let n = _dollar1; x => x + n
  })
}

///|
// file:///./parser.mbty
// 36|                TEXT { if $1 == "reenter" { nested_text() } else { $1 }}
fn yy_action_9(_value_0 : String) -> String {
  let _dollar1 = _value_0
  ({();  if _dollar1 == "reenter" { nested_text() } else { _dollar1 }
  })
}

///|
// file:///./parser.mbty
// 53|      word EOF { $1}
fn yy_action_10(_value_0 : String) -> String {
  let _dollar1 = _value_0
  ({();  _dollar1
  })
}

///|
// file:///./parser.mbty
// 55|         named_input global_input position_input inline_input EOF { ($1, $2, $3, $4)}
fn yy_action_11(_value_0 : Int, _value_1 : Int, _value_2 : Int, _value_3 : Int) -> (
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
// 59|                     forwarded_number { _sub_action_0_result + $1}
fn yy_action_13(_value_0 : Int) -> Int {
  let _sub_action_0_result_1 = yy_action_12(_value_0)
  let _dollar1 = _sub_action_0_result_1
  ({();  _sub_action_0_result + _dollar1
  })
}

///|
// file:///./parser.mbty
// 60|                                 NUMBER { $1}
fn yy_action_12(_value_0 : Int) -> Int {
  let _dollar1 = _value_0
  ({();  _dollar1
  })
}

///|
// file:///./parser.mbty
// 58|                       NUMBER _start_0=NUMBER { $startpos($1).offset}
fn yy_action_14(_value_1 : Int, _start_0_1 : Pos) -> Int {
  let _start_0 = _value_1
  let _start_pos_of_item0 = _start_0_1
  ({();  _start_pos_of_item0.offset
  })
}

///|
// file:///./parser.mbty
// 57|                     NUMBER { _value_0 + $1}
fn yy_action_15(_value_0_1 : Int) -> Int {
  let _dollar1 = _value_0_1
  ({();  _value_0 + _dollar1
  })
}

///|
// file:///./parser.mbty
// 56|                    a=NUMBER _value_0=NUMBER { a + $1}
fn yy_action_16(_value_0_1 : Int, _value_1 : Int) -> Int {
  let a = _value_0_1
  let _value_0 = _value_1
  let _dollar1 = _value_0_1
  ({();  a + _dollar1
  })
}

///|
priv enum YYStack {
  YYEmpty
  YYCell_17(YYStack, Int, Int, Pos, Pos)
  YYCell_19(YYStack, Int, Int, Pos, Pos)
  YYCell_16(YYStack, Int, (Int, Int, Int, Int), Pos)
  YYCell_15(YYStack, Int, String, Pos)
  YYCell_13(YYStack, Int, Mapper, Pos)
  YYCell_6_void(YYStack, Int, Pos, Pos)
  YYCell_11(YYStack, Int, Int, Pos, Pos)
  YYCell_8(YYStack, Int, Int, Pos, Pos)
  YYCell_5(YYStack, Int, Item, Pos)
  YYCell_1(YYStack, Int, Int, Pos, Pos)
  YYCell_4_void(YYStack, Int, Pos, Pos)
  YYCell_18(YYStack, Int, Int, Pos, Pos)
  YYCell_20(YYStack, Int, Int, Pos, Pos)
  YYCell_7(YYStack, Int, String, Pos, Pos)
  YYCell_14(YYStack, Int, Mapper, Pos, Pos)
  YYCell_10(YYStack, Int, Int, Pos, Pos)
  YYCell_12(YYStack, Int, Bool, Pos, Pos)
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
  mut error_depth : Int
  mut error_suffix_0 : Int
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
  mut _yy_value_6_0 : Item?
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
    EOF =>
      ({
        ()
        _env.stack = YYCell_4_void(
          _env.stack, _env.state, _env.lookahead.unwrap().start,
          _env.lookahead.unwrap().end
        )
        _env.state = target
      })
    _ => panic()
  }
  _env.last_pos = _env.lookahead.unwrap().end
  _env.lookahead = None
  _env.error_stack = _env.stack
  _env.error_state = _env.state
  _env.error_depth = 0
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
    error_state: initial_state, error_depth: 0, error_suffix_0: 0,
    lookahead: None, _yy_result: None, initial_position: initial_position,
    last_pos: initial_position, tokens: tokens, cursor: 0, _yy_state_0: 0,
    _yy_value_1_0: 0, _yy_position_0: initial_position,
    _yy_position_1: initial_position, _yy_value_3_0: None, _yy_value_4_0: "",
    _yy_value_5_0: None, _yy_value_6_0: None
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
              1 => 36
              _ => 35
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
              1 => 38
              _ => 35
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
              1 => 48
              _ => 35
            }
        })
      3 =>
        ({
          ()
          // run state 6
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              1 => 39
              _ => 35
            }
        })
      4 =>
        ({
          ()
          // run state 7
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              1 => 40
              _ => 35
            }
        })
      5 =>
        ({
          ()
          // run state 9
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              1 => 49
              _ => 35
            }
        })
      6 =>
        ({
          ()
          // run state 11
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              4 => 41
              _ => 35
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
              2 => 50
              _ => 35
            }
        })
      8 =>
        ({
          ()
          // run state 15
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              4 => 43
              _ => 35
            }
        })
      9 =>
        ({
          ()
          // run state 18
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              1 => 51
              _ => 35
            }
        })
      10 =>
        ({
          ()
          // run state 21
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              4 => 45
              _ => 35
            }
        })
      11 =>
        ({
          ()
          // run state 23
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              2 => 27
              _ => 35
            }
        })
      12 =>
        ({
          ()
          // run state 25
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              2 => 52
              _ => 35
            }
        })
      13 =>
        ({
          ()
          // run state 26
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              1 => 53
              _ => 35
            }
        })
      14 =>
        ({
          ()
          // run state 29
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              3 => 29
              _ => 35
            }
        })
      15 =>
        ({
          ()
          // run state 31
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              3 => 54
              _ => 35
            }
        })
      16 =>
        ({
          ()
          // run state 33
          if _env.lookahead is None {
            yy_read_token(_env)
          }
          continue match _env.lookahead.unwrap().symbol {
              4 => 47
              _ => 35
            }
        })
      17 =>
        ({
          ()
          // reduce named_input -> NUMBER NUMBER
          guard! _env.stack is YYCell_1(
            _yy_tail1, _yy_saved1, _yy_r118, _yy_r119, _yy_read120
          )
          _env._yy_position_1 = _yy_read120
          guard! _yy_tail1 is YYCell_1(
            _yy_tail0, _yy_saved0, _yy_r115, _yy_read116, _yy_r117
          )
          _env._yy_position_0 = _yy_read116
          _env._yy_value_1_0 = yy_action_16(_yy_r115, _yy_r118)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 18
        })
      18 =>
        ({
          ()
          // goto named_input
          match _env._yy_state_0 {
            0 => ()
            _ => panic()
          }
          _env.stack = YYCell_17(
            _env.stack, _env.state, _env._yy_value_1_0, _env._yy_position_0,
            _env._yy_position_1
          )
          _env.state = 4
          continue 2
        })
      19 =>
        ({
          ()
          // reduce position_input -> NUMBER NUMBER
          guard! _env.stack is YYCell_1(
            _yy_tail1, _yy_saved1, _yy_r133, _yy_r134, _yy_read135
          )
          _env._yy_position_1 = _yy_read135
          guard! _yy_tail1 is YYCell_1(
            _yy_tail0, _yy_saved0, _yy_r130, _yy_read131, _yy_r132
          )
          _env._yy_position_0 = _yy_read131
          _env._yy_value_1_0 = yy_action_14(_yy_r133, _env._yy_position_0)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 20
        })
      20 =>
        ({
          ()
          // goto position_input
          match _env._yy_state_0 {
            6 => ()
            _ => panic()
          }
          _env.stack = YYCell_19(
            _env.stack, _env.state, _env._yy_value_1_0, _env._yy_position_0,
            _env._yy_position_1
          )
          _env.state = 9
          continue 5
        })
      21 =>
        ({
          ()
          // reduce hygiene -> named_input global_input position_input inline_input EOF
          guard! _env.stack is YYCell_4_void(
            _yy_tail4, _yy_saved4, _yy_r158, _yy_read159
          )
          _env._yy_position_1 = _yy_read159
          guard! _yy_tail4 is YYCell_20(
            _yy_tail3, _yy_saved3, _yy_r154, _yy_r155, _yy_r156
          )
          guard! _yy_tail3 is YYCell_19(
            _yy_tail2, _yy_saved2, _yy_r151, _yy_r152, _yy_r153
          )
          guard! _yy_tail2 is YYCell_18(
            _yy_tail1, _yy_saved1, _yy_r148, _yy_r149, _yy_r150
          )
          guard! _yy_tail1 is YYCell_17(
            _yy_tail0, _yy_saved0, _yy_r145, _yy_read146, _yy_r147
          )
          _env._yy_position_0 = _yy_read146
          _env._yy_value_3_0 = Some(
            yy_action_11(_yy_r145, _yy_r148, _yy_r151, _yy_r154)
          )
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 22
        })
      22 =>
        ({
          ()
          // goto hygiene
          match _env._yy_state_0 {
            0 => ()
            _ => panic()
          }
          _env.stack = YYCell_16(
            _env.stack, _env.state, _env._yy_value_3_0.unwrap(),
            _env._yy_position_1
          )
          _env.state = 1
          continue 37
        })
      23 =>
        ({
          ()
          // reduce text -> word EOF
          guard! _env.stack is YYCell_4_void(
            _yy_tail1, _yy_saved1, _yy_r167, _yy_read168
          )
          _env._yy_position_1 = _yy_read168
          guard! _yy_tail1 is YYCell_7(
            _yy_tail0, _yy_saved0, _yy_r163, _yy_read164, _yy_r165
          )
          _env._yy_position_0 = _yy_read164
          _env._yy_value_4_0 = yy_action_10(_yy_r163)
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 24
        })
      24 =>
        ({
          ()
          // goto text
          match _env._yy_state_0 {
            13 => ()
            _ => panic()
          }
          _env.stack = YYCell_15(
            _env.stack, _env.state, _env._yy_value_4_0, _env._yy_position_1
          )
          _env.state = 14
          continue 42
        })
      25 =>
        ({
          ()
          // reduce function -> closure EOF
          guard! _env.stack is YYCell_4_void(
            _yy_tail1, _yy_saved1, _yy_r188, _yy_read189
          )
          _env._yy_position_1 = _yy_read189
          guard! _yy_tail1 is YYCell_14(
            _yy_tail0, _yy_saved0, _yy_r184, _yy_read185, _yy_r186
          )
          _env._yy_position_0 = _yy_read185
          _env._yy_value_5_0 = Some(yy_action_7(_yy_r184))
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 26
        })
      26 =>
        ({
          ()
          // goto function
          match _env._yy_state_0 {
            18 => ()
            _ => panic()
          }
          _env.stack = YYCell_13(
            _env.stack, _env.state, _env._yy_value_5_0.unwrap(),
            _env._yy_position_1
          )
          _env.state = 19
          continue 44
        })
      27 =>
        ({
          ()
          // reduce mark ->
          _env._yy_position_0 = if _env.stack is YYEmpty {
            _env.initial_position
          } else {
            yy_stack_end(_env.stack)
          }
          yy_action_6()
          _env._yy_state_0 = _env.state
          _env._yy_position_1 = _env._yy_position_0
          continue 28
        })
      28 =>
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
          continue 12
        })
      29 =>
        ({
          ()
          // reduce amount_end ->
          _env._yy_position_0 = if _env.stack is YYEmpty {
            _env.initial_position
          } else {
            yy_stack_end(_env.stack)
          }
          _env._yy_value_1_0 = yy_action_3(_env._yy_position_0)
          _env._yy_state_0 = _env.state
          _env._yy_position_1 = _env._yy_position_0
          continue 30
        })
      30 =>
        ({
          ()
          // goto amount_end
          match _env._yy_state_0 {
            29 => ()
            _ => panic()
          }
          _env.stack = YYCell_11(
            _env.stack, _env.state, _env._yy_value_1_0, _env._yy_position_0,
            _env._yy_position_1
          )
          _env.state = 30
          continue 31
        })
      31 =>
        ({
          ()
          // reduce amount -> decoded_amount amount_end
          guard! _env.stack is YYCell_11(
            _yy_tail1, _yy_saved1, _yy_r214, _yy_r215, _yy_read216
          )
          _env._yy_position_1 = _yy_read216
          guard! _yy_tail1 is YYCell_10(
            _yy_tail0, _yy_saved0, _yy_r211, _yy_read212, _yy_r213
          )
          _env._yy_position_0 = _yy_read212
          _env._yy_value_1_0 = yy_action_2(
            _env._yy_position_0, _yy_r213, _yy_r214, _yy_r211
          )
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 32
        })
      32 =>
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
          _env.state = 31
          continue 15
        })
      33 =>
        ({
          ()
          // reduce item -> mark word amount flag EOF
          guard! _env.stack is YYCell_4_void(
            _yy_tail4, _yy_saved4, _yy_r239, _yy_read240
          )
          _env._yy_position_1 = _yy_read240
          guard! _yy_tail4 is YYCell_12(
            _yy_tail3, _yy_saved3, _yy_r235, _yy_r236, _yy_r237
          )
          guard! _yy_tail3 is YYCell_8(
            _yy_tail2, _yy_saved2, _yy_r232, _yy_r233, _yy_r234
          )
          guard! _yy_tail2 is YYCell_7(
            _yy_tail1, _yy_saved1, _yy_r229, _yy_r230, _yy_r231
          )
          guard! _yy_tail1 is YYCell_6_void(
            _yy_tail0, _yy_saved0, _yy_read227, _yy_r228
          )
          _env._yy_position_0 = _yy_read227
          _env._yy_value_6_0 = Some(yy_action_0(_yy_r229, _yy_r232, _yy_r235))
          _env.stack = _yy_tail0
          _env.state = _yy_saved0
          _env._yy_state_0 = _env.state
          continue 34
        })
      34 =>
        ({
          ()
          // goto item
          match _env._yy_state_0 {
            23 => ()
            _ => panic()
          }
          _env.stack = YYCell_5(
            _env.stack, _env.state, _env._yy_value_6_0.unwrap(),
            _env._yy_position_1
          )
          _env.state = 24
          continue 46
        })
      35 =>
        ({
          ()
          return yy_stop(_env)
        })
      36 =>
        ({
          ()
          // shift NUMBER into state 2
          yy_shift(_env, 2)
          continue 1
        })
      37 =>
        ({
          ()
          let _yy_r247 = match _env.stack {
            YYCell_16(_, _, _value, _) => _value
            _ => panic()
          }
          _env._yy_result = Some(YYAccept_3(_yy_r247))
          return -1
        })
      38 =>
        ({
          ()
          // shift NUMBER into state 3
          yy_shift(_env, 3)
          continue 17
        })
      39 =>
        ({
          ()
          // shift NUMBER into state 7
          yy_shift(_env, 7)
          continue 4
        })
      40 =>
        ({
          ()
          // shift NUMBER into state 8
          yy_shift(_env, 8)
          continue 19
        })
      41 =>
        ({
          ()
          // shift EOF into state 12
          yy_shift(_env, 12)
          continue 21
        })
      42 =>
        ({
          ()
          let _yy_r269 = match _env.stack {
            YYCell_15(_, _, _value, _) => _value
            _ => panic()
          }
          _env._yy_result = Some(YYAccept_2(_yy_r269))
          return -1
        })
      43 =>
        ({
          ()
          // shift EOF into state 16
          yy_shift(_env, 16)
          continue 23
        })
      44 =>
        ({
          ()
          let _yy_r276 = match _env.stack {
            YYCell_13(_, _, _value, _) => _value
            _ => panic()
          }
          _env._yy_result = Some(YYAccept_1(_yy_r276))
          return -1
        })
      45 =>
        ({
          ()
          // shift EOF into state 22
          yy_shift(_env, 22)
          continue 25
        })
      46 =>
        ({
          ()
          let _yy_r280 = match _env.stack {
            YYCell_5(_, _, _value, _) => _value
            _ => panic()
          }
          _env._yy_result = Some(YYAccept_0(_yy_r280))
          return -1
        })
      47 =>
        ({
          ()
          // shift EOF into state 34
          yy_shift(_env, 34)
          continue 33
        })
      48 =>
        ({
          ()
          // shift NUMBER into state 5
          guard! _env.lookahead.unwrap().token.unwrap() is NUMBER(
            _yy_token_value
          )
          let _yy_r296 = _yy_token_value
          let _yy_r297 = _env.lookahead.unwrap().start
          let _yy_r298 = _env.lookahead.unwrap().end
          _env.last_pos = _env.lookahead.unwrap().end
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 5
          _env.error_depth = 1
          let _yy_r303 = yy_action_15(_yy_r296)
          let _yy_r304 = _env.state
          _env.stack = YYCell_18(
            _env.stack, _env.state, _yy_r303, _yy_r297, _yy_r298
          )
          _env.state = 6
          continue 3
        })
      49 =>
        ({
          ()
          // shift NUMBER into state 10
          guard! _env.lookahead.unwrap().token.unwrap() is NUMBER(
            _yy_token_value
          )
          let _yy_r318 = _yy_token_value
          let _yy_r319 = _env.lookahead.unwrap().start
          let _yy_r320 = _env.lookahead.unwrap().end
          _env.last_pos = _env.lookahead.unwrap().end
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 10
          _env.error_depth = 1
          let _yy_r325 = yy_action_13(_yy_r318)
          let _yy_r326 = _env.state
          _env.stack = YYCell_20(
            _env.stack, _env.state, _yy_r325, _yy_r319, _yy_r320
          )
          _env.state = 11
          continue 6
        })
      50 =>
        ({
          ()
          // shift TEXT into state 17
          guard! _env.lookahead.unwrap().token.unwrap() is TEXT(_yy_token_value)
          let _yy_r337 = _yy_token_value
          let _yy_r338 = _env.lookahead.unwrap().start
          let _yy_r339 = _env.lookahead.unwrap().end
          _env.last_pos = _env.lookahead.unwrap().end
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 17
          _env.error_depth = 1
          let _yy_r344 = yy_action_9(_yy_r337)
          let _yy_r345 = _env.state
          _env.stack = YYCell_7(
            _env.stack, _env.state, _yy_r344, _yy_r338, _yy_r339
          )
          _env.state = 15
          continue 8
        })
      51 =>
        ({
          ()
          // shift NUMBER into state 20
          guard! _env.lookahead.unwrap().token.unwrap() is NUMBER(
            _yy_token_value
          )
          let _yy_r356 = _yy_token_value
          let _yy_r357 = _env.lookahead.unwrap().start
          let _yy_r358 = _env.lookahead.unwrap().end
          _env.last_pos = _env.lookahead.unwrap().end
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 20
          _env.error_depth = 1
          let _yy_r363 = yy_action_8(_yy_r356)
          let _yy_r364 = _env.state
          _env.stack = YYCell_14(
            _env.stack, _env.state, _yy_r363, _yy_r357, _yy_r358
          )
          _env.state = 21
          continue 10
        })
      52 =>
        ({
          ()
          // shift TEXT into state 17
          guard! _env.lookahead.unwrap().token.unwrap() is TEXT(_yy_token_value)
          let _yy_r375 = _yy_token_value
          let _yy_r376 = _env.lookahead.unwrap().start
          let _yy_r377 = _env.lookahead.unwrap().end
          _env.last_pos = _env.lookahead.unwrap().end
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 17
          _env.error_depth = 1
          let _yy_r382 = yy_action_9(_yy_r375)
          let _yy_r383 = _env.state
          _env.stack = YYCell_7(
            _env.stack, _env.state, _yy_r382, _yy_r376, _yy_r377
          )
          _env.state = 26
          continue 13
        })
      53 =>
        ({
          ()
          // shift NUMBER into state 28
          guard! _env.lookahead.unwrap().token.unwrap() is NUMBER(
            _yy_token_value
          )
          let _yy_r391 = _yy_token_value
          let _yy_r392 = _env.lookahead.unwrap().start
          let _yy_r393 = _env.lookahead.unwrap().end
          _env.last_pos = _env.lookahead.unwrap().end
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 28
          _env.error_depth = 1
          let _yy_r398 = yy_action_4(_yy_r391)
          let _yy_r399 = _env.state
          let _yy_r411 = yy_action_5(_yy_r398)
          let _yy_r412 = _env.state
          _env.stack = YYCell_10(
            _env.stack, _env.state, _yy_r411, _yy_r392, _yy_r393
          )
          _env.state = 29
          continue 14
        })
      54 =>
        ({
          ()
          // shift FLAG into state 32
          guard! _env.lookahead.unwrap().token.unwrap() is FLAG(_yy_token_value)
          let _yy_r420 = _yy_token_value
          let _yy_r421 = _env.lookahead.unwrap().start
          let _yy_r422 = _env.lookahead.unwrap().end
          _env.last_pos = _env.lookahead.unwrap().end
          _env.lookahead = None
          _env.error_stack = _env.stack
          _env.error_state = _env.state
          _env.error_suffix_0 = 32
          _env.error_depth = 1
          let _yy_r427 = yy_action_1(_yy_r420)
          let _yy_r428 = _env.state
          _env.stack = YYCell_12(
            _env.stack, _env.state, _yy_r427, _yy_r421, _yy_r422
          )
          _env.state = 33
          continue 16
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
    YYCell_17(tail, _, _, _, _) => tail
    YYCell_19(tail, _, _, _, _) => tail
    YYCell_16(tail, _, _, _) => tail
    YYCell_15(tail, _, _, _) => tail
    YYCell_13(tail, _, _, _) => tail
    YYCell_6_void(tail, _, _, _) => tail
    YYCell_11(tail, _, _, _, _) => tail
    YYCell_8(tail, _, _, _, _) => tail
    YYCell_5(tail, _, _, _) => tail
    YYCell_1(tail, _, _, _, _) => tail
    YYCell_4_void(tail, _, _, _) => tail
    YYCell_18(tail, _, _, _, _) => tail
    YYCell_20(tail, _, _, _, _) => tail
    YYCell_7(tail, _, _, _, _) => tail
    YYCell_14(tail, _, _, _, _) => tail
    YYCell_10(tail, _, _, _, _) => tail
    YYCell_12(tail, _, _, _, _) => tail
    YYEmpty => panic()
  }
}

///|
fn yy_stack_saved(stack : YYStack) -> Int {
  match stack {
    YYCell_17(_, saved, _, _, _) => saved
    YYCell_19(_, saved, _, _, _) => saved
    YYCell_16(_, saved, _, _) => saved
    YYCell_15(_, saved, _, _) => saved
    YYCell_13(_, saved, _, _) => saved
    YYCell_6_void(_, saved, _, _) => saved
    YYCell_11(_, saved, _, _, _) => saved
    YYCell_8(_, saved, _, _, _) => saved
    YYCell_5(_, saved, _, _) => saved
    YYCell_1(_, saved, _, _, _) => saved
    YYCell_4_void(_, saved, _, _) => saved
    YYCell_18(_, saved, _, _, _) => saved
    YYCell_20(_, saved, _, _, _) => saved
    YYCell_7(_, saved, _, _, _) => saved
    YYCell_14(_, saved, _, _, _) => saved
    YYCell_10(_, saved, _, _, _) => saved
    YYCell_12(_, saved, _, _, _) => saved
    YYEmpty => panic()
  }
}

///|
fn yy_stack_end(stack : YYStack) -> Pos {
  match stack {
    YYCell_17(_, _, _, _, end) => end
    YYCell_19(_, _, _, _, end) => end
    YYCell_16(_, _, _, end) => end
    YYCell_15(_, _, _, end) => end
    YYCell_13(_, _, _, end) => end
    YYCell_6_void(_, _, _, end) => end
    YYCell_11(_, _, _, _, end) => end
    YYCell_8(_, _, _, _, end) => end
    YYCell_5(_, _, _, end) => end
    YYCell_1(_, _, _, _, end) => end
    YYCell_4_void(_, _, _, end) => end
    YYCell_18(_, _, _, _, end) => end
    YYCell_20(_, _, _, _, end) => end
    YYCell_7(_, _, _, _, end) => end
    YYCell_14(_, _, _, _, end) => end
    YYCell_10(_, _, _, _, end) => end
    YYCell_12(_, _, _, _, end) => end
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
  0, -2, 7, -38, 10, -39, 15, 20, -40, 23, -41, 28, -42, 31, -2, 38, -43, -44,
  41, -2, -45, 48, -46, 51, -2, 58, 63, -48, -49, 72, -51, 77, -52, 82, -53
]

///|
let yy_diag_data : FixedArray[Int] = [
  3, 1, 4, 16, 3, 17, 6, 1, 1, 5, 2, 1, 7, 18, 8, 2, 1, 9, 19, 11, 1, 1, 10, 2,
  1, 12, 20, 13, 1, 4, 14, 3, 2, 19, 7, 17, 15, 16, 1, 4, 18, 3, 1, 22, 13, 21,
  14, 23, 1, 4, 24, 3, 2, 46, 5, 26, 6, 27, 2, 2, 19, 7, 28, 4, 1, 30, 8, 33, 9,
  29, 10, 31, 2, 3, 49, 11, 32, 2, 3, 34, 12, 35, 1, 4, 36
]

///|
let yy_diag_reductions : FixedArray[(Int, Int)] = [
  (2, 17), (1, 18), (2, 19), (1, 20), (5, 16), (2, 15), (1, 7), (1, 14),
  (2, 13), (0, 6), (1, 10), (1, 9), (0, 11), (2, 8), (1, 12), (5, 5)
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
      if code < 37 {
        (2, code - 2, 0)
      } else {
        let (count, lhs) = yy_diag_reductions[code - 37]
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
