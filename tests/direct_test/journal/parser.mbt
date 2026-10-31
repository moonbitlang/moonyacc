///|
pub(all) enum Token {
  NUMBER
  N
  EOF
  BAD
  LP
}

///|
pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    NUMBER => TK_NUMBER
    N => TK_N
    EOF => TK_EOF
    BAD => TK_BAD
    LP => TK_LP
  }
}

///|
pub(all) enum TokenKind {
  TK_NUMBER
  TK_N
  TK_EOF
  TK_BAD
  TK_LP
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
      TK_N => "N"
      TK_EOF => "EOF"
      TK_BAD => "BAD"
      TK_LP => "LP"
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
    TK_N => Repr("N")
    TK_EOF => Repr("EOF")
    TK_BAD => Repr("BAD")
    TK_LP => Repr("LP")
  }
}

///|
pub suberror ParseError {
  UnexpectedToken(Token, (Unit, Unit), Array[TokenKind])
  UnexpectedEndOfInput(Unit, Array[TokenKind])
}

///|
// file:///./parser.mbty
// 4|       a b EOF { ()}
fn yy_action_0() -> Unit {
  ({();  ()
  })
}

///|
// file:///./parser.mbty
// 6|           N { ()}
fn yy_action_1() -> Unit {
  ({();  ()
  })
}

///|
// file:///./parser.mbty
// 6|                     { ()}
fn yy_action_2() -> Unit {
  ({();  ()
  })
}

///|
// file:///./parser.mbty
// 4|                       LP a BAD { ()}
fn yy_action_3() -> Unit {
  ({();  ()
  })
}

///|
// file:///./parser.mbty
// 5|           NUMBER a { ()}
fn yy_action_4() -> Unit {
  ({();  ()
  })
}

///|
// file:///./parser.mbty
// 5|                            NUMBER { ()}
fn yy_action_5() -> Unit {
  ({();  ()
  })
}

///|
priv enum YYResult {
  YYAccept_0(Unit)
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
fn yy_parse(
  tokens : Array[(Token, Unit, Unit)], _entry : Int, initial_state : Int,
  initial_pos? : Unit
) -> YYResult raise ParseError {
  let mut cursor = 0
  ignore(initial_pos.unwrap_or_else(() => tokens[0].1))
  let stack : YYStateStack = YYStateStack::{
    values: [initial_state], depth: 1, checkpoint: 1, saved_prefix: 1, undo: []
  }
  let mut state : Int = initial_state
  let mut error_depth : Int = 0
  let mut error_suffix_0 : Int = 0
  let mut _yy_token_token : Token? = None
  let mut _yy_token_ready : Bool = false
  let mut _yy_state_0 : Int = 0
  _yy_scope_7~: while true {
    _yy_scope_6~: while true {
      _yy_scope_5~: while true {
        _yy_scope_4~: while true {
          _yy_scope_3~: while true {
            _yy_scope_2~: while true {
              _yy_scope_1~: while true {
                _yy_scope_0~: while true {
                  break _yy_scope_0~
                }
                // run state 0
                ({
                  ()
                  if cursor < tokens.length() {
                    let (token, _, _) = tokens[cursor]
                    cursor += 1
                    _yy_token_token = Some(token)
                    _yy_token_ready = true
                  } else {
                    _yy_token_token = None
                    _yy_token_ready = true
                  }
                })
                match _yy_token_token {
                  Some(NUMBER) =>
                    ({
                      ()
                      break _yy_scope_1~
                    })
                  Some(LP) =>
                    ({
                      ()
                      yy_stack_push_unprotected(stack, 4)
                      state = 4
                      _yy_token_token = None
                      _yy_token_ready = false
                      yy_stack_checkpoint(stack)
                      error_depth = 0
                      ({
                        ()
                        if cursor < tokens.length() {
                          let (token, _, _) = tokens[cursor]
                          cursor += 1
                          _yy_token_token = Some(token)
                          _yy_token_ready = true
                        } else {
                          _yy_token_token = None
                          _yy_token_ready = true
                        }
                      })
                      match _yy_token_token {
                        Some(NUMBER) =>
                          ({
                            ()
                            break _yy_scope_1~
                          })
                        _ =>
                          ({
                            ()
                            break _yy_scope_6~
                          })
                      }
                    })
                  _ =>
                    ({
                      ()
                      break _yy_scope_6~
                    })
                }
              }
              _yy_loop_8~: for _yy_cycle = () {
                // run state 2
                _yy_token_token = None
                _yy_token_ready = false
                yy_stack_checkpoint(stack)
                error_suffix_0 = 2
                error_depth = 1
                ({
                  ()
                  if cursor < tokens.length() {
                    let (token, _, _) = tokens[cursor]
                    cursor += 1
                    _yy_token_token = Some(token)
                    _yy_token_ready = true
                  } else {
                    _yy_token_token = None
                    _yy_token_ready = true
                  }
                })
                match _yy_token_token {
                  Some(NUMBER) =>
                    ({
                      ()
                      yy_stack_push_unprotected(stack, 2)
                      state = 2
                      continue _yy_loop_8~ ()
                    })
                  Some(N) | Some(EOF) | Some(BAD) =>
                    ({
                      ()
                      ignore(yy_action_5())
                      let _yy_r133 = state
                      _yy_state_0 = _yy_r133
                      break _yy_scope_2~
                    })
                  _ =>
                    ({
                      ()
                      break _yy_scope_6~
                    })
                }
              }
            }
            _yy_loop_9~: for _yy_cycle = () {
              _yy_scope_10~: while true {
                // goto a
                match _yy_state_0 {
                  0 =>
                    ({
                      ()
                      break _yy_scope_3~
                    })
                  2 =>
                    ({
                      ()
                      break _yy_scope_10~
                    })
                  4 =>
                    ({
                      ()
                      break _yy_scope_5~
                    })
                  _ => panic()
                }
              }
              // run state 3
              ignore(yy_action_4())
              stack.depth -= 1
              state = stack.values[stack.depth - 1]
              _yy_state_0 = state
              continue _yy_loop_9~ ()
            }
          }
          // run state 7
          yy_stack_push(stack, 7)
          state = 7
          match _yy_token_token {
            Some(N) =>
              ({
                ()
                _yy_token_token = None
                _yy_token_ready = false
                yy_stack_checkpoint(stack)
                error_suffix_0 = 8
                error_depth = 1
                ignore(yy_action_1())
                break _yy_scope_4~
              })
            Some(EOF) =>
              ({
                ()
                ignore(yy_action_2())
                break _yy_scope_4~
              })
            _ =>
              ({
                ()
                break _yy_scope_6~
              })
          }
        }
        // run state 9
        if !_yy_token_ready {
          if cursor < tokens.length() {
            let (token, _, _) = tokens[cursor]
            cursor += 1
            _yy_token_token = Some(token)
            _yy_token_ready = true
          } else {
            _yy_token_token = None
            _yy_token_ready = true
          }
        }
        match _yy_token_token {
          Some(EOF) =>
            ({
              ()
              _yy_token_token = None
              _yy_token_ready = false
              ignore(yy_action_0())
              stack.depth -= 1
              state = stack.values[stack.depth - 1]
              break _yy_scope_7~
            })
          _ =>
            ({
              ()
              break _yy_scope_6~
            })
        }
      }
      // run state 5
      match _yy_token_token {
        Some(BAD) =>
          ({
            ()
            _yy_token_token = None
            _yy_token_ready = false
            ignore(yy_action_3())
            stack.depth -= 1
            state = stack.values[stack.depth - 1]
            break _yy_scope_7~
          })
        _ =>
          ({
            ()
            break _yy_scope_6~
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
        _yy_error_states
      }), _yy_token_token, ((), ())
    )
    panic()
  }
  // run state 1
  return YYAccept_0(())
}

///|
pub fn start(tokens : Array[(Token, Unit, Unit)], initial_pos? : Unit) -> Unit raise ParseError {
  match yy_parse(tokens, 0, 0, initial_pos?) {
    YYAccept_0(result) => result
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
  0, -2, 9, -15, 20, 25, -16, 28, -18, 35, -16
]

///|
let yy_diag_data : FixedArray[Int] = [
  4, 1, 4, 5, 6, 6, 3, 7, 9, 5, 1, 4, 2, 13, 3, 13, 4, 13, 7, 5, 2, 1, 4, 7, 7,
  1, 4, 8, 3, 2, 10, 3, 16, 8, 11, 1, 3, 12
]

///|
let yy_diag_reductions : FixedArray[(Int, Int)] = [
  (1, 7), (2, 7), (3, 6), (0, 8), (1, 8)
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
      if code < 13 {
        (2, code - 2, 0)
      } else {
        let (count, lhs) = yy_diag_reductions[code - 13]
        (3, count, lhs)
      }
  }
}

///|
let yy_terminals : ReadOnlyArray[(Int, TokenKind)] = [
  (1, TK_NUMBER), (2, TK_N), (3, TK_EOF), (4, TK_BAD), (5, TK_LP)
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
fn _yy_error(stack : @list.List[Int], token : Token?, loc : (Unit, Unit)) -> Unit raise ParseError {
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
