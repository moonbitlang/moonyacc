
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
priv enum YYResult {
  YYAccept_0(Item)
  YYAccept_1(Mapper)
  YYAccept_2(String)
  YYAccept_3((Int, Int, Int, Int))
}

///|
priv struct YYStateStack {
  values : Array[Int]
  mut depth : Int
  mut checkpoint : Int
}

///|
fn yy_parse(
  tokens : Array[(Token, Pos, Pos)], _entry : Int, initial_state : Int,
  initial_pos? : Pos
) -> YYResult raise ParseError {
  let mut cursor = 0
  let initial_position = initial_pos.unwrap_or_else(() => tokens[0].1)
  let mut last_pos = initial_position
  let stack : YYStateStack = YYStateStack::{
    values: [initial_state], depth: 1, checkpoint: 1
  }
  let mut state : Int = initial_state
  let _yy_stack_0 : Array[Int] = []
  let mut _yy_depth_0 : Int = 0
  let _yy_stack_1 : Array[String] = []
  let mut _yy_depth_1 : Int = 0
  let _yy_stack_2 : Array[Pos] = []
  let mut _yy_depth_2 : Int = 0
  let _yy_stack_3 : Array[Pos] = []
  let mut _yy_depth_3 : Int = 0
  let mut error_depth : Int = 0
  let mut error_suffix_0 : Int = 0
  let mut error_suffix_1 : Int = 0
  let mut _yy_token_token : Token? = None
  let mut _yy_token_start : Pos? = None
  let mut _yy_token_end : Pos? = None
  let mut _yy_value_0_0 : String = ""
  let mut _yy_state_0 : Int = 0
  _yy_scope_8~: while true {
    _yy_scope_7~: while true {
      _yy_scope_6~: while true {
        _yy_scope_5~: while true {
          _yy_scope_4~: while true {
            _yy_scope_3~: while true {
              _yy_scope_2~: while true {
                _yy_scope_1~: while true {
                  _yy_scope_0~: while true {
                    match _entry {
                      0 =>
                        ({
                          ()
                          break _yy_scope_7~
                        })
                      1 =>
                        ({
                          ()
                          break _yy_scope_2~
                        })
                      2 =>
                        ({
                          ()
                          break _yy_scope_1~
                        })
                      3 =>
                        ({
                          ()
                          break _yy_scope_0~
                        })
                      _ => panic()
                    }
                  }
                  // run state 23
                  ({
                    ()
                    if cursor < tokens.length() {
                      let (token, sp, ep) = tokens[cursor]
                      cursor += 1
                      _yy_token_token = Some(token)
                      _yy_token_start = Some(sp)
                      _yy_token_end = Some(ep)
                    } else {
                      _yy_token_token = None
                      _yy_token_start = Some(last_pos)
                      _yy_token_end = Some(last_pos)
                    }
                  })
                  match _yy_token_token {
                    Some(TEXT(_)) =>
                      ({
                        ()
                        ignore(yy_action_6())
                        yy_stack_push_unprotected(stack, 25)
                        state = 25
                        match _yy_token_token {
                          Some(TEXT(_yy_r644)) =>
                            ({
                              ()
                              _yy_value_0_0 = _yy_r644
                              break _yy_scope_3~
                            })
                          _ =>
                            ({
                              ()
                              break _yy_scope_8~
                            })
                        }
                      })
                    _ =>
                      ({
                        ()
                        break _yy_scope_8~
                      })
                  }
                }
                // run state 18
                ({
                  ()
                  if cursor < tokens.length() {
                    let (token, sp, ep) = tokens[cursor]
                    cursor += 1
                    _yy_token_token = Some(token)
                    _yy_token_start = Some(sp)
                    _yy_token_end = Some(ep)
                  } else {
                    _yy_token_token = None
                    _yy_token_start = Some(last_pos)
                    _yy_token_end = Some(last_pos)
                  }
                })
                match _yy_token_token {
                  Some(NUMBER(_yy_r315)) =>
                    ({
                      ()
                      last_pos = _yy_token_end.unwrap()
                      _yy_token_token = None
                      _yy_token_start = None
                      _yy_token_end = None
                      error_suffix_0 = 20
                      error_depth = 1
                      let _yy_r483 = yy_action_8(_yy_r315)
                      let _yy_bind0 = _yy_r483
                      let _yy_r640 = _yy_bind0
                      ({
                        ()
                        if cursor < tokens.length() {
                          let (token, sp, ep) = tokens[cursor]
                          cursor += 1
                          _yy_token_token = Some(token)
                          _yy_token_start = Some(sp)
                          _yy_token_end = Some(ep)
                        } else {
                          _yy_token_token = None
                          _yy_token_start = Some(last_pos)
                          _yy_token_end = Some(last_pos)
                        }
                      })
                      match _yy_token_token {
                        Some(EOF) =>
                          ({
                            ()
                            last_pos = _yy_token_end.unwrap()
                            _yy_token_token = None
                            _yy_token_start = None
                            _yy_token_end = None
                            let _yy_r641 = yy_action_7(_yy_r640)
                            let _yy_bind0 = _yy_r641
                            let _yy_r642 = _yy_bind0
                            return YYAccept_1(_yy_r642)
                          })
                        _ =>
                          ({
                            ()
                            break _yy_scope_8~
                          })
                      }
                    })
                  _ =>
                    ({
                      ()
                      break _yy_scope_8~
                    })
                }
              }
              // run state 13
              ({
                ()
                if cursor < tokens.length() {
                  let (token, sp, ep) = tokens[cursor]
                  cursor += 1
                  _yy_token_token = Some(token)
                  _yy_token_start = Some(sp)
                  _yy_token_end = Some(ep)
                } else {
                  _yy_token_token = None
                  _yy_token_start = Some(last_pos)
                  _yy_token_end = Some(last_pos)
                }
              })
              match _yy_token_token {
                Some(TEXT(_yy_r308)) =>
                  ({
                    ()
                    _yy_value_0_0 = _yy_r308
                    break _yy_scope_3~
                  })
                _ =>
                  ({
                    ()
                    break _yy_scope_8~
                  })
              }
            }
            // run state 17
            last_pos = _yy_token_end.unwrap()
            _yy_token_token = None
            _yy_token_start = None
            _yy_token_end = None
            yy_stack_checkpoint(stack)
            error_suffix_0 = 17
            error_depth = 1
            let _yy_r473 = yy_action_9(_yy_value_0_0)
            let _yy_r474 = state
            _yy_state_0 = _yy_r474
            _yy_value_0_0 = _yy_r473
            break _yy_scope_4~
          }
          // goto word
          match _yy_state_0 {
            13 =>
              ({
                ()
                break _yy_scope_6~
              })
            25 =>
              ({
                ()
                break _yy_scope_5~
              })
            _ => panic()
          }
        }
        // run state 26
        if _yy_depth_1 == _yy_stack_1.length() {
          _yy_stack_1.push(_yy_value_0_0)
        } else {
          _yy_stack_1[_yy_depth_1] = _yy_value_0_0
        }
        _yy_depth_1 += 1
        yy_stack_push_unprotected(stack, 26)
        state = 26
        ({
          ()
          if cursor < tokens.length() {
            let (token, sp, ep) = tokens[cursor]
            cursor += 1
            _yy_token_token = Some(token)
            _yy_token_start = Some(sp)
            _yy_token_end = Some(ep)
          } else {
            _yy_token_token = None
            _yy_token_start = Some(last_pos)
            _yy_token_end = Some(last_pos)
          }
        })
        match _yy_token_token {
          Some(NUMBER(_yy_r326)) =>
            ({
              ()
              let _yy_r327 = _yy_token_start.unwrap()
              let _yy_r328 = _yy_token_end.unwrap()
              last_pos = _yy_token_end.unwrap()
              _yy_token_token = None
              _yy_token_start = None
              _yy_token_end = None
              yy_stack_checkpoint(stack)
              error_suffix_0 = 28
              error_depth = 1
              let _yy_r515 = yy_action_4(_yy_r326)
              let _yy_bind0 = _yy_r515
              let _yy_bind1 = _yy_r327
              let _yy_bind2 = _yy_r328
              let _yy_r647 = _yy_bind0
              let _yy_r648 = _yy_bind1
              let _yy_r649 = _yy_bind2
              let _yy_r650 = yy_action_5(_yy_r647)
              let _yy_bind0 = _yy_r650
              let _yy_bind1 = _yy_r648
              let _yy_bind2 = _yy_r649
              let _yy_r651 = _yy_bind0
              let _yy_r652 = _yy_bind1
              let _yy_r653 = _yy_bind2
              if _yy_depth_0 == _yy_stack_0.length() {
                _yy_stack_0.push(_yy_r651)
              } else {
                _yy_stack_0[_yy_depth_0] = _yy_r651
              }
              _yy_depth_0 += 1
              if _yy_depth_2 == _yy_stack_2.length() {
                _yy_stack_2.push(_yy_r652)
              } else {
                _yy_stack_2[_yy_depth_2] = _yy_r652
              }
              _yy_depth_2 += 1
              if _yy_depth_3 == _yy_stack_3.length() {
                _yy_stack_3.push(_yy_r653)
              } else {
                _yy_stack_3[_yy_depth_3] = _yy_r653
              }
              _yy_depth_3 += 1
              yy_stack_push_unprotected(stack, 29)
              state = 29
              ({
                ()
                if cursor < tokens.length() {
                  let (token, sp, ep) = tokens[cursor]
                  cursor += 1
                  _yy_token_token = Some(token)
                  _yy_token_start = Some(sp)
                  _yy_token_end = Some(ep)
                } else {
                  _yy_token_token = None
                  _yy_token_start = Some(last_pos)
                  _yy_token_end = Some(last_pos)
                }
              })
              match _yy_token_token {
                Some(FLAG(_)) =>
                  ({
                    ()
                    let _yy_r654 = yy_action_3(_yy_r653)
                    let _yy_bind0 = _yy_r654
                    let _yy_r655 = _yy_bind0
                    let _yy_r656 = _yy_stack_0[_yy_depth_0 - 1]
                    let _yy_r657 = _yy_stack_2[_yy_depth_2 - 1]
                    let _yy_r658 = _yy_stack_3[_yy_depth_3 - 1]
                    let _yy_r659 = yy_action_2(
                      _yy_r657, _yy_r658, _yy_r655, _yy_r656
                    )
                    _yy_depth_0 -= 1
                    _yy_depth_2 -= 1
                    _yy_depth_3 -= 1
                    stack.depth -= 1
                    state = stack.values[stack.depth - 1]
                    let _yy_bind0 = _yy_r659
                    let _yy_r660 = _yy_bind0
                    if _yy_depth_0 == _yy_stack_0.length() {
                      _yy_stack_0.push(_yy_r660)
                    } else {
                      _yy_stack_0[_yy_depth_0] = _yy_r660
                    }
                    _yy_depth_0 += 1
                    yy_stack_push_unprotected(stack, 31)
                    state = 31
                    match _yy_token_token {
                      Some(FLAG(_yy_r661)) =>
                        ({
                          ()
                          last_pos = _yy_token_end.unwrap()
                          _yy_token_token = None
                          _yy_token_start = None
                          _yy_token_end = None
                          yy_stack_checkpoint(stack)
                          error_suffix_0 = 32
                          error_depth = 1
                          let _yy_r664 = yy_action_1(_yy_r661)
                          let _yy_bind0 = _yy_r664
                          let _yy_r665 = _yy_bind0
                          ({
                            ()
                            if cursor < tokens.length() {
                              let (token, sp, ep) = tokens[cursor]
                              cursor += 1
                              _yy_token_token = Some(token)
                              _yy_token_start = Some(sp)
                              _yy_token_end = Some(ep)
                            } else {
                              _yy_token_token = None
                              _yy_token_start = Some(last_pos)
                              _yy_token_end = Some(last_pos)
                            }
                          })
                          match _yy_token_token {
                            Some(EOF) =>
                              ({
                                ()
                                last_pos = _yy_token_end.unwrap()
                                _yy_token_token = None
                                _yy_token_start = None
                                _yy_token_end = None
                                let _yy_r666 = _yy_stack_1[_yy_depth_1 - 1]
                                let _yy_r667 = _yy_stack_0[_yy_depth_0 - 1]
                                let _yy_r668 = yy_action_0(
                                  _yy_r666, _yy_r667, _yy_r665
                                )
                                _yy_depth_0 -= 1
                                _yy_depth_1 -= 1
                                stack.depth -= 3
                                state = stack.values[stack.depth - 1]
                                let _yy_bind0 = _yy_r668
                                let _yy_r669 = _yy_bind0
                                return YYAccept_0(_yy_r669)
                              })
                            _ =>
                              ({
                                ()
                                break _yy_scope_8~
                              })
                          }
                        })
                      _ =>
                        ({
                          ()
                          break _yy_scope_8~
                        })
                    }
                  })
                _ =>
                  ({
                    ()
                    break _yy_scope_8~
                  })
              }
            })
          _ =>
            ({
              ()
              break _yy_scope_8~
            })
        }
      }
      // run state 15
      ({
        ()
        if cursor < tokens.length() {
          let (token, sp, ep) = tokens[cursor]
          cursor += 1
          _yy_token_token = Some(token)
          _yy_token_start = Some(sp)
          _yy_token_end = Some(ep)
        } else {
          _yy_token_token = None
          _yy_token_start = Some(last_pos)
          _yy_token_end = Some(last_pos)
        }
      })
      match _yy_token_token {
        Some(EOF) =>
          ({
            ()
            last_pos = _yy_token_end.unwrap()
            _yy_token_token = None
            _yy_token_start = None
            _yy_token_end = None
            let _yy_r463 = yy_action_10(_yy_value_0_0)
            let _yy_bind0 = _yy_r463
            let _yy_r639 = _yy_bind0
            return YYAccept_2(_yy_r639)
          })
        _ =>
          ({
            ()
            break _yy_scope_8~
          })
      }
    }
    // run state 0
    ({
      ()
      if cursor < tokens.length() {
        let (token, sp, ep) = tokens[cursor]
        cursor += 1
        _yy_token_token = Some(token)
        _yy_token_start = Some(sp)
        _yy_token_end = Some(ep)
      } else {
        _yy_token_token = None
        _yy_token_start = Some(last_pos)
        _yy_token_end = Some(last_pos)
      }
    })
    match _yy_token_token {
      Some(NUMBER(_yy_r286)) =>
        ({
          ()
          last_pos = _yy_token_end.unwrap()
          _yy_token_token = None
          _yy_token_start = None
          _yy_token_end = None
          error_suffix_0 = 2
          error_depth = 1
          ({
            ()
            if cursor < tokens.length() {
              let (token, sp, ep) = tokens[cursor]
              cursor += 1
              _yy_token_token = Some(token)
              _yy_token_start = Some(sp)
              _yy_token_end = Some(ep)
            } else {
              _yy_token_token = None
              _yy_token_start = Some(last_pos)
              _yy_token_end = Some(last_pos)
            }
          })
          match _yy_token_token {
            Some(NUMBER(_yy_r338)) =>
              ({
                ()
                last_pos = _yy_token_end.unwrap()
                _yy_token_token = None
                _yy_token_start = None
                _yy_token_end = None
                error_suffix_0 = 2
                error_suffix_1 = 3
                error_depth = 2
                let _yy_r393 = yy_action_16(_yy_r286, _yy_r338)
                let _yy_bind0 = _yy_r393
                let _yy_r578 = _yy_bind0
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_r578)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_r578
                }
                _yy_depth_0 += 1
                yy_stack_push_unprotected(stack, 4)
                state = 4
                ({
                  ()
                  if cursor < tokens.length() {
                    let (token, sp, ep) = tokens[cursor]
                    cursor += 1
                    _yy_token_token = Some(token)
                    _yy_token_start = Some(sp)
                    _yy_token_end = Some(ep)
                  } else {
                    _yy_token_token = None
                    _yy_token_start = Some(last_pos)
                    _yy_token_end = Some(last_pos)
                  }
                })
                match _yy_token_token {
                  Some(NUMBER(_yy_r579)) =>
                    ({
                      ()
                      last_pos = _yy_token_end.unwrap()
                      _yy_token_token = None
                      _yy_token_start = None
                      _yy_token_end = None
                      yy_stack_checkpoint(stack)
                      error_suffix_0 = 5
                      error_depth = 1
                      let _yy_r582 = yy_action_15(_yy_r579)
                      let _yy_bind0 = _yy_r582
                      let _yy_r583 = _yy_bind0
                      if _yy_depth_0 == _yy_stack_0.length() {
                        _yy_stack_0.push(_yy_r583)
                      } else {
                        _yy_stack_0[_yy_depth_0] = _yy_r583
                      }
                      _yy_depth_0 += 1
                      yy_stack_push_unprotected(stack, 6)
                      state = 6
                      ({
                        ()
                        if cursor < tokens.length() {
                          let (token, sp, ep) = tokens[cursor]
                          cursor += 1
                          _yy_token_token = Some(token)
                          _yy_token_start = Some(sp)
                          _yy_token_end = Some(ep)
                        } else {
                          _yy_token_token = None
                          _yy_token_start = Some(last_pos)
                          _yy_token_end = Some(last_pos)
                        }
                      })
                      match _yy_token_token {
                        Some(NUMBER(_)) =>
                          ({
                            ()
                            let _yy_r585 = _yy_token_start.unwrap()
                            last_pos = _yy_token_end.unwrap()
                            _yy_token_token = None
                            _yy_token_start = None
                            _yy_token_end = None
                            yy_stack_checkpoint(stack)
                            error_suffix_0 = 7
                            error_depth = 1
                            ({
                              ()
                              if cursor < tokens.length() {
                                let (token, sp, ep) = tokens[cursor]
                                cursor += 1
                                _yy_token_token = Some(token)
                                _yy_token_start = Some(sp)
                                _yy_token_end = Some(ep)
                              } else {
                                _yy_token_token = None
                                _yy_token_start = Some(last_pos)
                                _yy_token_end = Some(last_pos)
                              }
                            })
                            match _yy_token_token {
                              Some(NUMBER(_yy_r587)) =>
                                ({
                                  ()
                                  last_pos = _yy_token_end.unwrap()
                                  _yy_token_token = None
                                  _yy_token_start = None
                                  _yy_token_end = None
                                  error_suffix_0 = 7
                                  error_suffix_1 = 8
                                  error_depth = 2
                                  let _yy_r590 = yy_action_14(
                                    _yy_r587, _yy_r585
                                  )
                                  let _yy_bind0 = _yy_r590
                                  let _yy_r591 = _yy_bind0
                                  if _yy_depth_0 == _yy_stack_0.length() {
                                    _yy_stack_0.push(_yy_r591)
                                  } else {
                                    _yy_stack_0[_yy_depth_0] = _yy_r591
                                  }
                                  _yy_depth_0 += 1
                                  yy_stack_push_unprotected(stack, 9)
                                  state = 9
                                  ({
                                    ()
                                    if cursor < tokens.length() {
                                      let (token, sp, ep) = tokens[cursor]
                                      cursor += 1
                                      _yy_token_token = Some(token)
                                      _yy_token_start = Some(sp)
                                      _yy_token_end = Some(ep)
                                    } else {
                                      _yy_token_token = None
                                      _yy_token_start = Some(last_pos)
                                      _yy_token_end = Some(last_pos)
                                    }
                                  })
                                  match _yy_token_token {
                                    Some(NUMBER(_yy_r592)) =>
                                      ({
                                        ()
                                        last_pos = _yy_token_end.unwrap()
                                        _yy_token_token = None
                                        _yy_token_start = None
                                        _yy_token_end = None
                                        yy_stack_checkpoint(stack)
                                        error_suffix_0 = 10
                                        error_depth = 1
                                        let _yy_r595 = yy_action_13(_yy_r592)
                                        let _yy_bind0 = _yy_r595
                                        let _yy_r596 = _yy_bind0
                                        ({
                                          ()
                                          if cursor < tokens.length() {
                                            let (token, sp, ep) = tokens[cursor]
                                            cursor += 1
                                            _yy_token_token = Some(token)
                                            _yy_token_start = Some(sp)
                                            _yy_token_end = Some(ep)
                                          } else {
                                            _yy_token_token = None
                                            _yy_token_start = Some(last_pos)
                                            _yy_token_end = Some(last_pos)
                                          }
                                        })
                                        match _yy_token_token {
                                          Some(EOF) =>
                                            ({
                                              ()
                                              last_pos = _yy_token_end.unwrap()
                                              _yy_token_token = None
                                              _yy_token_start = None
                                              _yy_token_end = None
                                              let _yy_r597 = _yy_stack_0[_yy_depth_0 -
                                                3]
                                              let _yy_r598 = _yy_stack_0[_yy_depth_0 -
                                                2]
                                              let _yy_r599 = _yy_stack_0[_yy_depth_0 -
                                                1]
                                              let _yy_r600 = yy_action_11(
                                                _yy_r597, _yy_r598, _yy_r599,
                                                _yy_r596
                                              )
                                              _yy_depth_0 -= 3
                                              stack.depth -= 3
                                              state = stack.values[stack.depth -
                                                1]
                                              let _yy_bind0 = _yy_r600
                                              let _yy_r601 = _yy_bind0
                                              return YYAccept_3(_yy_r601)
                                            })
                                          _ =>
                                            ({
                                              ()
                                              break _yy_scope_8~
                                            })
                                        }
                                      })
                                    _ =>
                                      ({
                                        ()
                                        break _yy_scope_8~
                                      })
                                  }
                                })
                              _ =>
                                ({
                                  ()
                                  break _yy_scope_8~
                                })
                            }
                          })
                        _ =>
                          ({
                            ()
                            break _yy_scope_8~
                          })
                      }
                    })
                  _ =>
                    ({
                      ()
                      break _yy_scope_8~
                    })
                }
              })
            _ =>
              ({
                ()
                break _yy_scope_8~
              })
          }
        })
      _ =>
        ({
          ()
          break _yy_scope_8~
        })
    }
  }
  _yy_error(
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
    }), _yy_token_token, (_yy_token_start.unwrap(), _yy_token_end.unwrap())
  )
  panic()
}

///|
pub fn item(tokens : Array[(Token, Pos, Pos)], initial_pos? : Pos) -> Item raise ParseError {
  match yy_parse(tokens, 3, 23, initial_pos?) {
    YYAccept_0(result) => result
    _ => panic()
  }
}

///|
pub fn function(tokens : Array[(Token, Pos, Pos)], initial_pos? : Pos) -> Mapper raise ParseError {
  match yy_parse(tokens, 2, 18, initial_pos?) {
    YYAccept_1(result) => result
    _ => panic()
  }
}

///|
pub fn text(tokens : Array[(Token, Pos, Pos)], initial_pos? : Pos) -> String raise ParseError {
  match yy_parse(tokens, 1, 13, initial_pos?) {
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
fn yy_stack_push_unprotected(stack : YYStateStack, state : Int) -> Unit {
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
}

///|
fn yy_stack_snapshot(stack : YYStateStack) -> @list.List[Int] {
  let mut states : @list.List[Int] = @list.List([])
  for i = 0; i < stack.checkpoint; i = i + 1 {
    states = @list.cons(stack.values[i], states)
  }
  states
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
fn _yy_error(stack : @list.List[Int], token : Token?, loc : (Pos, Pos)) -> Unit raise ParseError {
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
