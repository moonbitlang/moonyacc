///|
pub(all) enum Token {
  VALUE(Payload)
  INVALID(Payload)
  EOF
}

///|
pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    VALUE(_) => TK_VALUE
    INVALID(_) => TK_INVALID
    EOF => TK_EOF
  }
}

///|
pub(all) enum TokenKind {
  TK_VALUE
  TK_INVALID
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
      TK_VALUE => "VALUE"
      TK_INVALID => "INVALID"
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
    TK_VALUE => Repr("VALUE")
    TK_INVALID => Repr("INVALID")
    TK_EOF => Repr("EOF")
  }
}

///|
pub suberror ParseError {
  UnexpectedToken(Token, (Unit, Unit), Array[TokenKind])
}

///|
// file:///./parser.mbty
// 7|       value EOF { ()}
fn yy_action_0(_value_0 : Json, _value_1 : Json) -> Json {
  yy_json_cst_action("start", 0, 0, [_value_0, _value_1])
}

///|
// file:///./parser.mbty
// 8|       VALUE { ()}
fn yy_action_1(_value_0 : Json) -> Json {
  yy_json_cst_action("value", 1, 0, [_value_0])
}

///|
priv enum YYStack {
  YYEmpty
  YYCell_4(YYStack, Int, Json)
  YYCell_3(YYStack, Int, Json)
  YYCell_5(YYStack, Int, Json)
}

///|
priv enum YYResult {
  YYAccept_0(Json)
}

///|
priv struct YYLookahead {
  symbol : Int
  token : Token?
  value : Json
}

///|
fn yy_symbol(token : Token) -> Int {
  match token {
    VALUE(_) => 1
    INVALID(_) => 2
    EOF => 3
  }
}

///|
fn yy_input_json(token : Token) -> Json {
  match token {
    VALUE(value) =>
      {
        "type": "TERMINAL", "name": "VALUE", "data": ToJson::to_json(value),
        "start": ToJson::to_json(()), "end": ToJson::to_json(())
      }
    INVALID(value) =>
      {
        "type": "TERMINAL", "name": "INVALID", "data": ToJson::to_json(value),
        "start": ToJson::to_json(()), "end": ToJson::to_json(())
      }
    EOF =>
      {
        "type": "TERMINAL", "name": "EOF", "data": Json::null(),
        "start": ToJson::to_json(()), "end": ToJson::to_json(())
      }
  }
}

///|
fn yy_parse(
  read_token : (() -> (Token, Unit, Unit)), start_pos : Unit, entry : Int,
  initial_state : Int
) -> YYResult raise ParseError {
  ignore(start_pos)
  let mut stack : YYStack = YYEmpty
  let mut state : Int = initial_state
  let mut error_stack : YYStack = YYEmpty
  let mut error_state : Int = initial_state
  let mut error_depth : Int = 0
  let mut error_suffix_0 : Int = 0
  let mut lookahead : YYLookahead? = None
  let mut _yy_state_0 : Int = 0
  let mut _yy_value_1_0 : Json = Json::null()
  for pc = entry {
    match pc {
      0 =>
        ({
          ()
          // run state 0
          if lookahead is None {
            let (token, _, _) = read_token()
            lookahead = Some(
              YYLookahead::{
                symbol: yy_symbol(token), token: Some(token),
                value: yy_input_json(token)
              }
            )
          }
          continue match lookahead.unwrap().symbol {
              1 => 7
              _ => 4
            }
        })
      1 =>
        ({
          ()
          // run state 3
          if lookahead is None {
            let (token, _, _) = read_token()
            lookahead = Some(
              YYLookahead::{
                symbol: yy_symbol(token), token: Some(token),
                value: yy_input_json(token)
              }
            )
          }
          continue match lookahead.unwrap().symbol {
              3 => 6
              _ => 4
            }
        })
      2 =>
        ({
          ()
          // reduce start -> value EOF
          guard! stack is YYCell_3(_yy_tail1, _yy_saved1, _yy_r23)
          guard! _yy_tail1 is YYCell_5(_yy_tail0, _yy_saved0, _yy_r20)
          _yy_value_1_0 = yy_action_0(_yy_r20, _yy_r23)
          stack = _yy_tail0
          state = _yy_saved0
          _yy_state_0 = state
          continue 3
        })
      3 =>
        ({
          ()
          // goto start
          match _yy_state_0 {
            0 => ()
            _ => panic()
          }
          stack = YYCell_4(stack, state, _yy_value_1_0)
          state = 1
          continue 5
        })
      4 =>
        ({
          ()
          yy_error(
            ({
              ()
              let mut _yy_error_states = yy_stack_states(
                error_stack, error_state
              )
              if error_depth > 0 {
                _yy_error_states = @list.cons(error_suffix_0, _yy_error_states)
              }
              _yy_error_states
            }), lookahead.unwrap().token, ((), ())
          )
          panic()
        })
      5 =>
        ({
          ()
          let _yy_r32 = match stack {
            YYCell_4(_, _, _value) => _value
            _ => panic()
          }
          return YYAccept_0(_yy_r32)
        })
      6 =>
        ({
          ()
          // shift EOF into state 4
          let _yy_r33 = lookahead.unwrap().value
          stack = YYCell_3(stack, state, _yy_r33)
          state = 4
          lookahead = None
          error_stack = stack
          error_state = state
          error_depth = 0
          continue 2
        })
      7 =>
        ({
          ()
          // shift VALUE into state 2
          let _yy_r36 = lookahead.unwrap().value
          lookahead = None
          error_stack = stack
          error_state = state
          error_suffix_0 = 2
          error_depth = 1
          let _yy_r43 = yy_action_1(_yy_r36)
          let _yy_r44 = state
          stack = YYCell_5(stack, state, _yy_r43)
          state = 3
          continue 1
        })
      _ => panic()
    }
  }
}

///|
pub fn start(read_token : (() -> (Token, Unit, Unit)), start_pos : Unit) -> Json raise ParseError {
  match yy_parse(read_token, start_pos, 0, 0) {
    YYAccept_0(result) => result
  }
}

///|
fn yy_stack_tail(stack : YYStack) -> YYStack {
  match stack {
    YYCell_4(tail, _, _) => tail
    YYCell_3(tail, _, _) => tail
    YYCell_5(tail, _, _) => tail
    YYEmpty => panic()
  }
}

///|
fn yy_stack_saved(stack : YYStack) -> Int {
  match stack {
    YYCell_4(_, saved, _) => saved
    YYCell_3(_, saved, _) => saved
    YYCell_5(_, saved, _) => saved
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
let yy_diag_rows : FixedArray[Int] = [0, -2, -8, 7, -9]

///|
let yy_diag_data : FixedArray[Int] = [3, 1, 4, 4, 3, 5, 5, 1, 3, 6]

///|
let yy_diag_reductions : FixedArray[(Int, Int)] = [(1, 5), (2, 4)]

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
      if code < 7 {
        (2, code - 2, 0)
      } else {
        let (count, lhs) = yy_diag_reductions[code - 7]
        (3, count, lhs)
      }
  }
}

///|
let yy_terminals : ReadOnlyArray[(Int, TokenKind)] = [
  (1, TK_VALUE), (2, TK_INVALID), (3, TK_EOF)
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
  raise UnexpectedToken(token.unwrap(), loc, expected)
}

///|
#inline(never)
fn yy_json_cst_action(
  name : Json, rule_index : Json, clause_index : Json, children : Array[Json]
) -> Json {
  {
    "type": "NONTERMINAL", "name": name, "rule_index": rule_index,
    "clause_index": clause_index, "children": Json::array(children),
    "start": ToJson::to_json(()), "end": ToJson::to_json(())
  }
}
