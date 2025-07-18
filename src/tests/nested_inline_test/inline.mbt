
pub(all) enum Token {
  A
  B
}

pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    A => TK_A
    B => TK_B
  }
}

pub(all) enum TokenKind {
  TK_A
  TK_B
}

pub impl Show for TokenKind with output(self, logger) {
  logger.write_string(
    match self {
      TK_A => "A"
      TK_B => "B"
    }
  )
}

pub suberror ParseError {
  UnexpectedToken(Token, (Unit, Unit), Array[TokenKind])
  UnexpectedEndOfInput(Unit, Array[TokenKind])
}

typealias Error as YYObj

priv suberror YYObj_Void

priv suberror YYObj_String String

typealias (YYSymbol) -> YYDecision as YYState

typealias (Unit, ArrayView[(YYObj, Unit, Unit)]) -> YYObj as YYAction

priv enum YYDecision {
  Accept
  Shift(YYState)
  Reduce(Int, YYSymbol, YYAction)
  ReduceNoLookahead(Int, YYSymbol, YYAction)
  Error
}

priv enum YYSymbol {
  T_A
  T_B
  NT_start
  EOI
}

// Workaround for EOI unused warning
fn init {
  match (EOI : YYSymbol) {
    EOI => ()
    _ => ()
  }
}

// file:///./inline.mbty
// 13|    x { $1 }
fn yy_action_0(_last_pos : Unit, _args : ArrayView[(YYObj, Unit, Unit)]) -> YYObj {
  let _sub_action_0_result = yy_action_1(_last_pos, _args[0:1])
  guard _sub_action_0_result is YYObj_String(_dollar1)
  YYObj_String({();  _dollar1 })
}

// file:///./inline.mbty
// 18|    A y B { "a" + $2 + "b" }
fn yy_action_2(_last_pos : Unit, _args : ArrayView[(YYObj, Unit, Unit)]) -> YYObj {
  let _sub_action_0_result = yy_action_3(_args[0].2, _args[1:3])
  guard _sub_action_0_result is YYObj_String(_dollar2)
  YYObj_String({();  "a" + _dollar2 + "b" })
}

// file:///./inline.mbty
// 13|    x { $1 }
fn yy_action_4(_last_pos : Unit, _args : ArrayView[(YYObj, Unit, Unit)]) -> YYObj {
  let _sub_action_0_result = yy_action_2(_last_pos, _args[0:4])
  guard _sub_action_0_result is YYObj_String(_dollar1)
  YYObj_String({();  _dollar1 })
}

// file:///./inline.mbty
// 17|    A { "a" }
fn yy_action_1(_last_pos : Unit, _args : ArrayView[(YYObj, Unit, Unit)]) -> YYObj {
  YYObj_String({();  "a" })
}

// file:///./inline.mbty
// 18|    A y B { "a" + $2 + "b" }
fn yy_action_5(_last_pos : Unit, _args : ArrayView[(YYObj, Unit, Unit)]) -> YYObj {
  let _sub_action_0_result = yy_action_6(_args[0].2, _args[1:3])
  guard _sub_action_0_result is YYObj_String(_dollar2)
  YYObj_String({();  "a" + _dollar2 + "b" })
}

// file:///./inline.mbty
// 13|    x { $1 }
fn yy_action_7(_last_pos : Unit, _args : ArrayView[(YYObj, Unit, Unit)]) -> YYObj {
  let _sub_action_0_result = yy_action_5(_last_pos, _args[0:4])
  guard _sub_action_0_result is YYObj_String(_dollar1)
  YYObj_String({();  _dollar1 })
}

// file:///./inline.mbty
// 23|    B B { "yb" }
fn yy_action_3(_last_pos : Unit, _args : ArrayView[(YYObj, Unit, Unit)]) -> YYObj {
  YYObj_String({();  "yb" })
}

// file:///./inline.mbty
// 22|    A A { "ya" }
fn yy_action_6(_last_pos : Unit, _args : ArrayView[(YYObj, Unit, Unit)]) -> YYObj {
  YYObj_String({();  "ya" })
}

fn yy_input(token : Token, _start_pos : Unit, _end_pos : Unit) -> (YYSymbol, YYObj) {
  match token {
    A => (T_A, YYObj_Void)
    B => (T_B, YYObj_Void)
  }
}

// [0, start → • A, $]
// [1, start → • A A A B, $]
// [2, start → • A B B B, $]
// [3, start_prime → • start, $]
fn yy_state_0(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_start => Shift(yy_state_1)
    T_A => Shift(yy_state_2)
    _ => Error
  }
}

// [3, start_prime → start •, $]
fn yy_state_1(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

// [0, start → A •, $]
// [1, start → A • A A B, $]
// [2, start → A • B B B, $]
fn yy_state_2(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_B => Shift(yy_state_3)
    T_A => Shift(yy_state_6)
    EOI => Reduce(1, NT_start, yy_action_0)
    _ => Error
  }
}

// [2, start → A B • B B, $]
fn yy_state_3(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_B => Shift(yy_state_4)
    _ => Error
  }
}

// [2, start → A B B • B, $]
fn yy_state_4(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_B => Shift(yy_state_5)
    _ => Error
  }
}

// [2, start → A B B B •, $]
fn yy_state_5(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_start, yy_action_4)
}

// [1, start → A A • A B, $]
fn yy_state_6(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_A => Shift(yy_state_7)
    _ => Error
  }
}

// [1, start → A A A • B, $]
fn yy_state_7(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_B => Shift(yy_state_8)
    _ => Error
  }
}

// [1, start → A A A B •, $]
fn yy_state_8(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_start, yy_action_7)
}

fn[T] yy_parse(
  tokens : Array[(Token, Unit, Unit)],
  start : YYState,
  return_ : (YYObj) -> T,
  initial_pos? : Unit,
) -> T raise ParseError {
  let mut cursor = 0
  let mut state_stack : @list.T[YYState] = @list.construct(start, @list.empty())
  let data_stack : Array[(YYObj, Unit, Unit)] = []
  let mut last_pos = initial_pos.unwrap_or(tokens[0].1)
  let mut state = start
  let mut lookahead : Option[(YYSymbol, (YYObj, Unit, Unit), Token?)] = None
  let mut last_shifted_state_stack = state_stack
  while true {
    let decision = match state(EOI) {
      ReduceNoLookahead(_) | Accept as t => t
      _ => {
        match lookahead {
          Some(la) => state(la.0)
          None => {
            if cursor < tokens.length() {
              let (token, start_pos, end_pos) = tokens[cursor]
              cursor += 1
              let (symbol, data) = yy_input(token, start_pos, end_pos)
              lookahead = Some((symbol, (data, start_pos, end_pos), Some(token)))
              state(symbol)
            } else {
              lookahead = Some((EOI, (YYObj_Void, last_pos, last_pos), None))
              state(EOI)
            }
          }
        }
      }
    }
    match decision {
      Accept => return return_(data_stack.unsafe_pop().0)
      Shift(next_state) => {
        guard lookahead is Some(la)
        data_stack.push(la.1)
        state_stack = @list.construct(next_state, state_stack)
        last_shifted_state_stack = state_stack
        state = next_state
        last_pos = la.1.2
        lookahead = None
      }
      Reduce(count, symbol, action)
      | ReduceNoLookahead(count, symbol, action) => {
        loop (count, symbol, action) {
          _ => {
            let args = data_stack[data_stack.length() - count:]
            let data = action(last_pos, args)
            let (start_pos, end_pos) = if args.length() == 0 {
              (last_pos, last_pos)
            } else {
              (args[0].1, args[args.length() - 1].2)
            }
            for i in 0..<count {
              ignore(data_stack.unsafe_pop())
              state_stack = state_stack.unsafe_tail()
            }
            state = state_stack.unsafe_head()
            data_stack.push((data, start_pos, end_pos))
            match state(symbol) {
              Accept => return return_(data_stack.unsafe_pop().0)
              Shift(next_state) => {
                state_stack = @list.construct(next_state, state_stack)
                state = next_state
              }
              Reduce(count, symbol, action)
              | ReduceNoLookahead(count, symbol, action) => continue (count, symbol, action)
              _ => panic()
            }
          }
        }
      }
      Error => {
        let (_, (_, start_pos, end_pos), token) = lookahead.unwrap()
        error(last_shifted_state_stack, token, (start_pos, end_pos))
      }
    }
  }
  panic()
}

fn error(stack : @list.T[YYState], token : Token?, loc : (Unit, Unit)) -> Unit raise ParseError {
  let expected = []
  fn try_add(symbol : YYSymbol, kind : TokenKind) {
    fn go(stack : @list.T[YYState]) {
      match stack {
        Empty => ()
        More(state, ..) => {
          match state(symbol) {
            Accept | Shift(_) => expected.push(kind)
            Reduce(count, symbol, _) | ReduceNoLookahead(count, symbol, _) => {
              fn inner_go(stack : @list.T[YYState], count, symbol) {
                let stack = stack.drop(count)
                guard stack is More(state, ..)
                match state(symbol) {
                  Shift(state) => go(@list.construct(state, stack))
                  Reduce(count, symbol, _) | ReduceNoLookahead(count, symbol, _) => inner_go(stack, count, symbol)
                  _ => panic()
                }
              }
              inner_go(stack, count, symbol)
            }
            Error => ()
          }
        }
      }
    }
    go(stack)
  }
  for term in ([(T_A, TK_A), (T_B, TK_B)] : Array[(YYSymbol, TokenKind)]) {
    try_add(term.0, term.1)
  }
  match token {
    None => raise UnexpectedEndOfInput(loc.1, expected)
    Some(token) => raise UnexpectedToken(token, loc, expected)
  }
}

pub fn start(tokens : Array[(Token, Unit, Unit)], initial_pos? : Unit) -> String raise ParseError {
  yy_parse(
    tokens,
    yy_state_0,
    (it) => {
      guard it is YYObj_String(result)
      result
    },
    initial_pos?,
  )
}
