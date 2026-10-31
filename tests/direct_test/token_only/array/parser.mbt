
let events : Ref[Array[String]] = Ref([])

///|
pub(all) enum Token {
  NUMBER(Int)
  PLUS
  EOF
}

///|
pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    NUMBER(_) => TK_NUMBER
    PLUS => TK_PLUS
    EOF => TK_EOF
  }
}

///|
pub(all) enum TokenKind {
  TK_NUMBER
  TK_PLUS
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
// 13|       marker expr EOF { $2}
fn yy_action_0(_value_1 : Int) -> Int {
  let _dollar2 = _value_1
  ({();  _dollar2
  })
}

///|
// file:///./parser.mbty
// 17|    expr PLUS expr { events.val.push("add"); $1 + $3}
fn yy_action_1(_value_0 : Int, _value_2 : Int) -> Int {
  let _dollar1 = _value_0
  let _dollar3 = _value_2
  ({();  events.val.push("add"); _dollar1 + _dollar3
  })
}

///|
// file:///./parser.mbty
// 16|    NUMBER { events.val.push("number"); $1}
fn yy_action_2(_value_0 : Int) -> Int {
  let _dollar1 = _value_0
  ({();  events.val.push("number"); _dollar1
  })
}

///|
// file:///./parser.mbty
// 14|                { events.val.push("marker"); ()}
fn yy_action_3() -> Unit {
  ({();  events.val.push("marker"); ()
  })
}

///|
// file:///./parser.mbty
// 18|       { ignore($loc); 42}
fn yy_action_4() -> Int {
  let _start_pos = ()
  let _end_pos = ()
  ({();  ignore((_start_pos, _end_pos)); 42
  })
}

///|
// file:///./parser.mbty
// 19|                EOF { ignore($loc); 42}
fn yy_action_5() -> Int {
  let _start_pos = ()
  let _end_pos = ()
  ({();  ignore((_start_pos, _end_pos)); 42
  })
}

///|
priv enum YYResult {
  YYAccept_0(Int)
  YYAccept_1(Int)
  YYAccept_2(Int)
}

///|
priv struct YYStateStack {
  values : Array[Int]
  mut depth : Int
  mut checkpoint : Int
}

///|
fn yy_parse(tokens : Array[Token], _entry : Int, initial_state : Int) -> YYResult raise ParseError {
  let mut cursor = 0
  let stack : YYStateStack = YYStateStack::{
    values: [initial_state], depth: 1, checkpoint: 1
  }
  let _yy_stack_0 : Array[Int] = []
  let mut _yy_depth_0 : Int = 0
  let mut error_depth : Int = 0
  let mut error_suffix_0 : Int = 0
  let mut _yy_token_token : Token? = None
  let mut _yy_value_0_0 : Int = 0
  _yy_scope_4~: while true {
    _yy_scope_3~: while true {
      _yy_scope_2~: while true {
        _yy_scope_1~: while true {
          _yy_scope_0~: while true {
            match _entry {
              0 =>
                ({
                  ()
                  break _yy_scope_3~
                })
              1 =>
                ({
                  ()
                  break _yy_scope_2~
                })
              2 =>
                ({
                  ()
                  break _yy_scope_0~
                })
              _ => panic()
            }
          }
          // run state 5
          ({
            ()
            if cursor < tokens.length() {
              let token = tokens[cursor]
              cursor += 1
              _yy_token_token = Some(token)
            } else {
              _yy_token_token = None
            }
          })
          match _yy_token_token {
            Some(NUMBER(_)) =>
              ({
                ()
                ignore(yy_action_3())
                yy_stack_push_unprotected(stack, 7)
                match _yy_token_token {
                  Some(NUMBER(_yy_r207)) =>
                    ({
                      ()
                      _yy_token_token = None
                      yy_stack_checkpoint(stack)
                      error_suffix_0 = 8
                      error_depth = 1
                      let _yy_r217 = yy_action_2(_yy_r207)
                      _yy_value_0_0 = _yy_r217
                      break _yy_scope_1~
                    })
                  _ =>
                    ({
                      ()
                      break _yy_scope_4~
                    })
                }
              })
            _ =>
              ({
                ()
                break _yy_scope_4~
              })
          }
        }
        _yy_loop_5~: for _yy_cycle = () {
          // run state 9
          ({
            ()
            if cursor < tokens.length() {
              let token = tokens[cursor]
              cursor += 1
              _yy_token_token = Some(token)
            } else {
              _yy_token_token = None
            }
          })
          match _yy_token_token {
            Some(PLUS) =>
              ({
                ()
                if _yy_depth_0 == _yy_stack_0.length() {
                  _yy_stack_0.push(_yy_value_0_0)
                } else {
                  _yy_stack_0[_yy_depth_0] = _yy_value_0_0
                }
                _yy_depth_0 += 1
                yy_stack_push_unprotected(stack, 9)
                yy_stack_push_unprotected(stack, 10)
                _yy_token_token = None
                yy_stack_checkpoint(stack)
                error_depth = 0
                ({
                  ()
                  if cursor < tokens.length() {
                    let token = tokens[cursor]
                    cursor += 1
                    _yy_token_token = Some(token)
                  } else {
                    _yy_token_token = None
                  }
                })
                match _yy_token_token {
                  Some(NUMBER(_yy_r239)) =>
                    ({
                      ()
                      _yy_token_token = None
                      error_suffix_0 = 8
                      error_depth = 1
                      let _yy_r249 = yy_action_2(_yy_r239)
                      let _yy_bind0 = _yy_r249
                      let _yy_r285 = _yy_bind0
                      let _yy_r286 = _yy_stack_0[_yy_depth_0 - 1]
                      let _yy_r287 = yy_action_1(_yy_r286, _yy_r285)
                      _yy_depth_0 -= 1
                      stack.depth -= 2
                      _yy_value_0_0 = _yy_r287
                      continue _yy_loop_5~ ()
                    })
                  _ =>
                    ({
                      ()
                      break _yy_scope_4~
                    })
                }
              })
            Some(EOF) =>
              ({
                ()
                _yy_token_token = None
                let _yy_r268 = yy_action_0(_yy_value_0_0)
                stack.depth -= 1
                let _yy_bind0 = _yy_r268
                let _yy_r288 = _yy_bind0
                return YYAccept_0(_yy_r288)
              })
            _ =>
              ({
                ()
                break _yy_scope_4~
              })
          }
        }
      }
      // run state 3
      ({
        ()
        if cursor < tokens.length() {
          let token = tokens[cursor]
          cursor += 1
          _yy_token_token = Some(token)
        } else {
          _yy_token_token = None
        }
      })
      match _yy_token_token {
        None =>
          ({
            ()
            let _yy_r122 = yy_action_4()
            return YYAccept_1(_yy_r122)
          })
        _ =>
          ({
            ()
            break _yy_scope_4~
          })
      }
    }
    // run state 0
    ({
      ()
      if cursor < tokens.length() {
        let token = tokens[cursor]
        cursor += 1
        _yy_token_token = Some(token)
      } else {
        _yy_token_token = None
      }
    })
    match _yy_token_token {
      Some(EOF) =>
        ({
          ()
          _yy_token_token = None
          let _yy_r186 = yy_action_5()
          return YYAccept_2(_yy_r186)
        })
      _ =>
        ({
          ()
          break _yy_scope_4~
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

///|
pub fn start(tokens : Array[Token]) -> Int raise ParseError {
  match yy_parse(tokens, 2, 5) {
    YYAccept_0(result) => result
    _ => panic()
  }
}

///|
pub fn empty(tokens : Array[Token]) -> Int raise ParseError {
  match yy_parse(tokens, 1, 3) {
    YYAccept_1(result) => result
    _ => panic()
  }
}

///|
pub fn empty_with_eof(tokens : Array[Token]) -> Int raise ParseError {
  match yy_parse(tokens, 0, 0) {
    YYAccept_2(result) => result
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
  0, -2, -16, 5, -2, 10, -2, 17, -19, 22, 27, -20, -21
]

///|
let yy_diag_data : FixedArray[Int] = [
  2, 3, 4, 8, 3, 2, 0, 16, 7, 6, 3, 1, 17, 4, 8, 5, 9, 2, 1, 10, 6, 11, 2, 2,
  12, 3, 14, 2, 1, 10, 6, 13
]

///|
let yy_diag_reductions : FixedArray[(Int, Int)] = [
  (1, 8), (0, 7), (0, 5), (1, 6), (3, 6), (3, 4)
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
      if code < 15 {
        (2, code - 2, 0)
      } else {
        let (count, lhs) = yy_diag_reductions[code - 15]
        (3, count, lhs)
      }
  }
}

///|
let yy_terminals : ReadOnlyArray[(Int, TokenKind)] = [
  (1, TK_NUMBER), (2, TK_PLUS), (3, TK_EOF)
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
