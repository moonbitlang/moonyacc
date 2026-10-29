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
priv enum YYResult {
  YYAccept_0(Json)
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
  let stack : YYStateStack = YYStateStack::{
    values: [initial_state], depth: 1, checkpoint: 1, saved_prefix: 1, undo: []
  }
  let mut error_depth : Int = 0
  let mut error_suffix_0 : Int = 0
  let mut error_suffix_1 : Int = 0
  let mut _yy_token_symbol : Int = 0
  let mut _yy_token_token : Token? = None
  let mut _yy_token_value : Json = Json::null()
  for pc = entry {
    match pc {
      0 =>
        ({
          ()
          // run state 0
          ({
            ()
            let (token, _, _) = read_token()
            _yy_token_symbol = yy_symbol(token)
            _yy_token_token = Some(token)
            _yy_token_value = yy_input_json(token)
          })
          match _yy_token_symbol {
            1 =>
              ({
                ()
                let _yy_r35 = _yy_token_value
                _yy_token_token = None
                _yy_token_value = Json::null()
                yy_stack_checkpoint(stack)
                error_suffix_0 = 2
                error_depth = 1
                let _yy_r52 = yy_action_1(_yy_r35)
                let _yy_bind0 = _yy_r52
                let _yy_r68 = _yy_bind0
                ({
                  ()
                  let (token, _, _) = read_token()
                  _yy_token_symbol = yy_symbol(token)
                  _yy_token_token = Some(token)
                  _yy_token_value = yy_input_json(token)
                })
                match _yy_token_symbol {
                  3 =>
                    ({
                      ()
                      let _yy_r71 = _yy_token_value
                      _yy_token_token = None
                      _yy_token_value = Json::null()
                      yy_stack_checkpoint(stack)
                      error_suffix_0 = 3
                      error_suffix_1 = 4
                      error_depth = 2
                      let _yy_r75 = yy_action_0(_yy_r68, _yy_r71)
                      let _yy_bind0 = _yy_r75
                      let _yy_r77 = _yy_bind0
                      return YYAccept_0(_yy_r77)
                    })
                  _ =>
                    ({
                      ()
                      yy_stack_push(stack, 3)
                      continue 1
                    })
                }
              })
            _ =>
              ({
                ()
                continue 1
              })
          }
        })
      1 =>
        ({
          ()
          yy_error(
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
            }), _yy_token_token, ((), ())
          )
          panic()
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
