
let events : Ref[Array[String]] = Ref([])

///|
pub(all) enum Token {
  NUMBER(Int)
  A
  B
  LP
  RP
  EOF
}

///|
pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    NUMBER(_) => TK_NUMBER
    A => TK_A
    B => TK_B
    LP => TK_LP
    RP => TK_RP
    EOF => TK_EOF
  }
}

///|
pub(all) enum TokenKind {
  TK_NUMBER
  TK_A
  TK_B
  TK_LP
  TK_RP
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
      TK_A => "A"
      TK_B => "B"
      TK_LP => "LP"
      TK_RP => "RP"
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
    TK_A => Repr("A")
    TK_B => Repr("B")
    TK_LP => Repr("LP")
    TK_RP => Repr("RP")
    TK_EOF => Repr("EOF")
  }
}

///|
pub suberror ParseError {
  UnexpectedToken(Token, (Int, Int), Array[TokenKind])
}

///|
// file:///./parser.mbty
// 12|       p=prefix v=value padding EOF { events.val.push("start"); (p + v, $startpos(v), $endpos(v))}
fn yy_action_0(_value_0 : Int, _value_1 : Int, _start_1 : Int, _end_1 : Int) -> (
  Int, Int, Int
) {
  let p = _value_0
  let v = _value_1
  let _start_pos_of_item1 = _start_1
  let _end_pos_of_item1 = _end_1
  ({();  events.val.push("start"); (p + v, _start_pos_of_item1, _end_pos_of_item1)
  })
}

///|
// file:///./parser.mbty
// 22|                 { events.val.push("epsilon"); ()}
fn yy_action_1() -> Unit {
  ({();  events.val.push("epsilon"); ()
  })
}

///|
// file:///./parser.mbty
// 17|              factor { events.val.push("value"); $1 + 1}
fn yy_action_2(_value_0 : Int) -> Int {
  let _dollar1 = _value_0
  ({();  events.val.push("value"); _dollar1 + 1
  })
}

///|
// file:///./parser.mbty
// 18|               atom { events.val.push("factor"); $1 * 2}
fn yy_action_3(_value_0 : Int) -> Int {
  let _dollar1 = _value_0
  ({();  events.val.push("factor"); _dollar1 * 2
  })
}

///|
// file:///./parser.mbty
// 20|    NUMBER { events.val.push("number"); $1}
fn yy_action_4(_value_0 : Int) -> Int {
  let _dollar1 = _value_0
  ({();  events.val.push("number"); _dollar1
  })
}

///|
// file:///./parser.mbty
// 21|    LP value RP { events.val.push("paren"); $2 + 3}
fn yy_action_5(_value_1 : Int) -> Int {
  let _dollar2 = _value_1
  ({();  events.val.push("paren"); _dollar2 + 3
  })
}

///|
// file:///./parser.mbty
// 14|    A { events.val.push("prefix-a"); 0}
fn yy_action_6() -> Int {
  ({();  events.val.push("prefix-a"); 0
  })
}

///|
// file:///./parser.mbty
// 15|    B { events.val.push("prefix-b"); 100}
fn yy_action_7() -> Int {
  ({();  events.val.push("prefix-b"); 100
  })
}

///|
// file:///./parser.mbty
// 16|    { events.val.push("prefix-empty"); 1000}
fn yy_action_8() -> Int {
  ({();  events.val.push("prefix-empty"); 1000
  })
}

///|
priv enum YYResult {
  YYAccept_0((Int, Int, Int))
}

///|
priv struct YYStateStack {
  values : Array[Int]
  mut depth : Int
  mut checkpoint : Int
}

///|
fn yy_parse(
  read_token : (() -> (Token, Int, Int)), start_pos : Int, _entry : Int,
  initial_state : Int
) -> YYResult raise ParseError {
  let initial_position = start_pos
  let stack : YYStateStack = YYStateStack::{
    values: [initial_state], depth: 1, checkpoint: 1
  }
  let mut state : Int = initial_state
  let _yy_stack_0 : Array[Int] = []
  let mut _yy_depth_0 : Int = 0
  let _yy_stack_1 : Array[Int] = []
  let mut _yy_depth_1 : Int = 0
  let mut error_depth : Int = 0
  let mut error_suffix_0 : Int = 0
  let mut error_suffix_1 : Int = 0
  let mut _yy_token_token : Token? = None
  let mut _yy_token_ready : Bool = false
  let mut _yy_token_start : Int = 0
  let mut _yy_token_end : Int = 0
  let mut _yy_value_0_0 : Int = 0
  let mut _yy_position_0 : Int = initial_position
  let mut _yy_position_1 : Int = initial_position
  let mut _yy_state_0 : Int = 0
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
              let (token, sp, ep) = read_token()
              _yy_token_token = Some(token)
              _yy_token_start = sp
              _yy_token_end = ep
              _yy_token_ready = true
            })
            match _yy_token_token {
              Some(NUMBER(_)) | Some(LP) =>
                ({
                  ()
                  let _yy_r152 = yy_action_8()
                  _yy_value_0_0 = _yy_r152
                  break _yy_scope_1~
                })
              Some(A) =>
                ({
                  ()
                  _yy_token_token = None
                  _yy_token_ready = false
                  _yy_token_start = 0
                  _yy_token_end = 0
                  error_suffix_0 = 3
                  error_depth = 1
                  let _yy_r291 = yy_action_6()
                  _yy_value_0_0 = _yy_r291
                  break _yy_scope_1~
                })
              Some(B) =>
                ({
                  ()
                  _yy_token_token = None
                  _yy_token_ready = false
                  _yy_token_start = 0
                  _yy_token_end = 0
                  error_suffix_0 = 2
                  error_depth = 1
                  let _yy_r304 = yy_action_7()
                  _yy_value_0_0 = _yy_r304
                  break _yy_scope_1~
                })
              _ =>
                ({
                  ()
                  break _yy_scope_5~
                })
            }
          }
          // run state 4
          if _yy_depth_0 == _yy_stack_0.length() {
            _yy_stack_0.push(_yy_value_0_0)
          } else {
            _yy_stack_0[_yy_depth_0] = _yy_value_0_0
          }
          _yy_depth_0 += 1
          yy_stack_push_unprotected(stack, 4)
          state = 4
          if !_yy_token_ready {
            let (token, sp, ep) = read_token()
            _yy_token_token = Some(token)
            _yy_token_start = sp
            _yy_token_end = ep
            _yy_token_ready = true
          }
          match _yy_token_token {
            Some(NUMBER(_yy_r133)) =>
              ({
                ()
                let _yy_r134 = _yy_token_start
                let _yy_r135 = _yy_token_end
                _yy_token_token = None
                _yy_token_ready = false
                _yy_token_start = 0
                _yy_token_end = 0
                yy_stack_checkpoint(stack)
                error_suffix_0 = 8
                error_depth = 1
                let _yy_r317 = yy_action_4(_yy_r133)
                _yy_value_0_0 = _yy_r317
                _yy_position_0 = _yy_r134
                _yy_position_1 = _yy_r135
                break _yy_scope_4~
              })
            Some(LP) =>
              ({
                ()
                let _yy_r137 = _yy_token_start
                _yy_position_0 = _yy_r137
                break _yy_scope_2~
              })
            _ =>
              ({
                ()
                break _yy_scope_5~
              })
          }
        }
        _yy_loop_6~: for _yy_cycle = () {
          // run state 5
          if _yy_depth_1 == _yy_stack_1.length() {
            _yy_stack_1.push(_yy_position_0)
          } else {
            _yy_stack_1[_yy_depth_1] = _yy_position_0
          }
          _yy_depth_1 += 1
          yy_stack_push_unprotected(stack, 5)
          state = 5
          _yy_token_token = None
          _yy_token_ready = false
          _yy_token_start = 0
          _yy_token_end = 0
          yy_stack_checkpoint(stack)
          error_depth = 0
          ({
            ()
            let (token, sp, ep) = read_token()
            _yy_token_token = Some(token)
            _yy_token_start = sp
            _yy_token_end = ep
            _yy_token_ready = true
          })
          match _yy_token_token {
            Some(NUMBER(_yy_r139)) =>
              ({
                ()
                _yy_token_token = None
                _yy_token_ready = false
                _yy_token_start = 0
                _yy_token_end = 0
                error_suffix_0 = 8
                error_depth = 1
                let _yy_r330 = yy_action_4(_yy_r139)
                _yy_value_0_0 = _yy_r330
                break _yy_scope_3~
              })
            Some(LP) =>
              ({
                ()
                let _yy_r143 = _yy_token_start
                _yy_position_0 = _yy_r143
                continue _yy_loop_6~ ()
              })
            _ =>
              ({
                ()
                break _yy_scope_5~
              })
          }
        }
      }
      _yy_loop_7~: for _yy_cycle = () {
        _yy_scope_8~: while true {
          // run state 9
          let _yy_r258 = yy_action_3(_yy_value_0_0)
          let _yy_r390 = yy_action_2(_yy_r258)
          ({
            ()
            let (token, sp, ep) = read_token()
            _yy_token_token = Some(token)
            _yy_token_start = sp
            _yy_token_end = ep
            _yy_token_ready = true
          })
          match _yy_token_token {
            Some(RP) =>
              ({
                ()
                let _yy_r401 = _yy_token_end
                _yy_token_token = None
                _yy_token_ready = false
                _yy_token_start = 0
                _yy_token_end = 0
                yy_stack_checkpoint(stack)
                error_suffix_0 = 6
                error_suffix_1 = 7
                error_depth = 2
                let _yy_r429 = _yy_stack_1[_yy_depth_1 - 1]
                let _yy_r438 = yy_action_5(_yy_r390)
                _yy_depth_1 -= 1
                stack.depth -= 1
                state = stack.values[stack.depth - 1]
                let _yy_r439 = state
                _yy_state_0 = _yy_r439
                _yy_value_0_0 = _yy_r438
                _yy_position_0 = _yy_r429
                _yy_position_1 = _yy_r401
                break _yy_scope_8~
              })
            _ =>
              ({
                ()
                break _yy_scope_5~
              })
          }
        }
        // goto atom
        match _yy_state_0 {
          4 =>
            ({
              ()
              break _yy_scope_4~
            })
          5 =>
            ({
              ()
              continue _yy_loop_7~ ()
            })
          _ => panic()
        }
      }
    }
    // run state 9
    let _yy_r248 = yy_action_3(_yy_value_0_0)
    let _yy_r358 = yy_action_2(_yy_r248)
    ({
      ()
      let (token, sp, ep) = read_token()
      _yy_token_token = Some(token)
      _yy_token_start = sp
      _yy_token_end = ep
      _yy_token_ready = true
    })
    match _yy_token_token {
      Some(EOF) =>
        ({
          ()
          ignore(yy_action_1())
          _yy_token_token = None
          _yy_token_ready = false
          _yy_token_start = 0
          _yy_token_end = 0
          let _yy_r409 = _yy_stack_0[_yy_depth_0 - 1]
          let _yy_r422 = yy_action_0(
            _yy_r409, _yy_r358, _yy_position_0, _yy_position_1
          )
          _yy_depth_0 -= 1
          stack.depth -= 1
          state = stack.values[stack.depth - 1]
          let _yy_bind0 = _yy_r422
          let _yy_r440 = _yy_bind0
          return YYAccept_0(_yy_r440)
        })
      _ =>
        ({
          ()
          break _yy_scope_5~
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
    }), _yy_token_token, (_yy_token_start, _yy_token_end)
  )
  panic()
}

///|
pub fn start(read_token : (() -> (Token, Int, Int)), start_pos : Int) -> (
  Int, Int, Int
) raise ParseError {
  match yy_parse(read_token, start_pos, 0, 0) {
    YYAccept_0(result) => result
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
  0, -2, -18, -18, 13, 24, 35, -19, -20, -21, -22, 38, 43, -24
]

///|
let yy_diag_data : FixedArray[Int] = [
  6, 1, 16, 2, 5, 3, 4, 4, 16, 7, 3, 8, 6, 5, 1, 10, 4, 7, 9, 13, 10, 12, 11,
  11, 5, 1, 10, 4, 7, 9, 8, 10, 12, 11, 11, 1, 5, 9, 2, 6, 22, 12, 14, 1, 6, 15
]

///|
let yy_diag_reductions : FixedArray[(Int, Int)] = [
  (0, 8), (1, 8), (3, 11), (1, 11), (1, 10), (1, 9), (0, 12), (4, 7)
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
      if code < 16 {
        (2, code - 2, 0)
      } else {
        let (count, lhs) = yy_diag_reductions[code - 16]
        (3, count, lhs)
      }
  }
}

///|
let yy_terminals : ReadOnlyArray[(Int, TokenKind)] = [
  (1, TK_NUMBER), (2, TK_A), (3, TK_B), (4, TK_LP), (5, TK_RP), (6, TK_EOF)
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
fn _yy_error(stack : @list.List[Int], token : Token?, loc : (Int, Int)) -> Unit raise ParseError {
  let expected = []
  for i in 0..<yy_terminals.length() {
    let (symbol, kind) = yy_terminals[i]
    if yy_expected(stack, symbol) {
      expected.push(kind)
    }
  }
  raise UnexpectedToken(token.unwrap(), loc, expected)
}
