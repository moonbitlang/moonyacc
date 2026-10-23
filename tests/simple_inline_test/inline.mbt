///|
pub(all) enum Token {
  A
  B
}

///|
pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    A => TK_A
    B => TK_B
  }
}

///|
pub(all) enum TokenKind {
  TK_A
  TK_B
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
      TK_A => "A"
      TK_B => "B"
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
    TK_A => Repr("A")
    TK_B => Repr("B")
  }
}

///|
pub suberror ParseError {
  UnexpectedToken(Token, (Unit, Unit), Array[TokenKind])
  UnexpectedEndOfInput(Unit, Array[TokenKind])
}

///|
type YYObj = Error

///|
priv suberror YYObj_Void

///|
priv suberror YYObj_String {
  YYObj_String(String)
}

///|
type YYState = ((YYSymbol) -> YYDecision)

///|
type YYAction = ((ArrayView[YYObj]) -> YYObj)

///|
priv enum YYDecision {
  Accept
  Shift(YYState)
  Reduce(Int, YYSymbol, YYAction)
  ReduceNoLookahead(Int, YYSymbol, YYAction)
  Error
}

///|
priv enum YYSymbol {
  T_A
  T_B
  NT_start
  NT_b
  EOI
}

///|
// Workaround for EOI unused warning
fn init {
  match (EOI : YYSymbol) {
    EOI => ()
    _ => ()
  }
}

///|
// file:///./inline.mbty
// 14|    a=a b=b x x b { let _ = ($loc, $sloc, $loc(a)); a + b + $3 + $4 + $5 }
fn yy_action_2(_args : ArrayView[YYObj]) -> YYObj {
  let _sub_action_0_result = yy_action_0(_args[0:1])
  let _sub_action_1_result = yy_action_1(_args[2:3])
  let _sub_action_2_result = yy_action_1(_args[3:4])
  guard! _sub_action_0_result is YYObj_String(a)
  guard! _args[1] is YYObj_String(b)
  let _start_pos = ()
  let _end_pos = ()
  let _symbol_start_pos = ()
  let _start_pos_of_item0 = ()
  let _end_pos_of_item0 = ()
  guard! _sub_action_1_result is YYObj_String(_dollar3)
  guard! _sub_action_2_result is YYObj_String(_dollar4)
  guard! _args[4] is YYObj_String(_dollar5)
  YYObj_String(
    ({();  let _ = ((_start_pos, _end_pos), (_symbol_start_pos, _end_pos), (_start_pos_of_item0, _end_pos_of_item0)); a + b + _dollar3 + _dollar4 + _dollar5 
    })
  )
}

///|
// file:///./inline.mbty
// 14|    a=a b=b x x b { let _ = ($loc, $sloc, $loc(a)); a + b + $3 + $4 + $5 }
fn yy_action_4(_args : ArrayView[YYObj]) -> YYObj {
  let _sub_action_0_result = yy_action_0(_args[0:1])
  let _sub_action_1_result = yy_action_1(_args[2:3])
  let _sub_action_2_result = yy_action_3(_args[3:4])
  guard! _sub_action_0_result is YYObj_String(a)
  guard! _args[1] is YYObj_String(b)
  let _start_pos = ()
  let _end_pos = ()
  let _symbol_start_pos = ()
  let _start_pos_of_item0 = ()
  let _end_pos_of_item0 = ()
  guard! _sub_action_1_result is YYObj_String(_dollar3)
  guard! _sub_action_2_result is YYObj_String(_dollar4)
  guard! _args[4] is YYObj_String(_dollar5)
  YYObj_String(
    ({();  let _ = ((_start_pos, _end_pos), (_symbol_start_pos, _end_pos), (_start_pos_of_item0, _end_pos_of_item0)); a + b + _dollar3 + _dollar4 + _dollar5 
    })
  )
}

///|
// file:///./inline.mbty
// 14|    a=a b=b x x b { let _ = ($loc, $sloc, $loc(a)); a + b + $3 + $4 + $5 }
fn yy_action_5(_args : ArrayView[YYObj]) -> YYObj {
  let _sub_action_0_result = yy_action_0(_args[0:1])
  let _sub_action_1_result = yy_action_3(_args[2:3])
  let _sub_action_2_result = yy_action_1(_args[3:4])
  guard! _sub_action_0_result is YYObj_String(a)
  guard! _args[1] is YYObj_String(b)
  let _start_pos = ()
  let _end_pos = ()
  let _symbol_start_pos = ()
  let _start_pos_of_item0 = ()
  let _end_pos_of_item0 = ()
  guard! _sub_action_1_result is YYObj_String(_dollar3)
  guard! _sub_action_2_result is YYObj_String(_dollar4)
  guard! _args[4] is YYObj_String(_dollar5)
  YYObj_String(
    ({();  let _ = ((_start_pos, _end_pos), (_symbol_start_pos, _end_pos), (_start_pos_of_item0, _end_pos_of_item0)); a + b + _dollar3 + _dollar4 + _dollar5 
    })
  )
}

///|
// file:///./inline.mbty
// 26|    A { "a" }
fn yy_action_1(_args : ArrayView[YYObj]) -> YYObj {
  YYObj_String(
    ({();  "a" 
    })
  )
}

///|
// file:///./inline.mbty
// 14|    a=a b=b x x b { let _ = ($loc, $sloc, $loc(a)); a + b + $3 + $4 + $5 }
fn yy_action_6(_args : ArrayView[YYObj]) -> YYObj {
  let _sub_action_0_result = yy_action_0(_args[0:1])
  let _sub_action_1_result = yy_action_3(_args[2:3])
  let _sub_action_2_result = yy_action_3(_args[3:4])
  guard! _sub_action_0_result is YYObj_String(a)
  guard! _args[1] is YYObj_String(b)
  let _start_pos = ()
  let _end_pos = ()
  let _symbol_start_pos = ()
  let _start_pos_of_item0 = ()
  let _end_pos_of_item0 = ()
  guard! _sub_action_1_result is YYObj_String(_dollar3)
  guard! _sub_action_2_result is YYObj_String(_dollar4)
  guard! _args[4] is YYObj_String(_dollar5)
  YYObj_String(
    ({();  let _ = ((_start_pos, _end_pos), (_symbol_start_pos, _end_pos), (_start_pos_of_item0, _end_pos_of_item0)); a + b + _dollar3 + _dollar4 + _dollar5 
    })
  )
}

///|
// file:///./inline.mbty
// 27|    B { "b" }
fn yy_action_3(_args : ArrayView[YYObj]) -> YYObj {
  YYObj_String(
    ({();  "b" 
    })
  )
}

///|
// file:///./inline.mbty
// 18|    A { "a" }
fn yy_action_0(_args : ArrayView[YYObj]) -> YYObj {
  YYObj_String(
    ({();  "a" 
    })
  )
}

///|
// file:///./inline.mbty
// 22|    B { "b" }
fn yy_action_7(_args : ArrayView[YYObj]) -> YYObj {
  YYObj_String(
    ({();  "b" 
    })
  )
}

///|
fn yy_input(token : Token) -> (YYSymbol, YYObj) {
  match token {
    A => (T_A, YYObj_Void)
    B => (T_B, YYObj_Void)
  }
}

///|
// [0, start → • A b A A b, $]
// [1, start → • A b A B b, $]
// [2, start → • A b B A b, $]
// [3, start → • A b B B b, $]
// [5, start_prime → • start, $]
fn yy_state_0(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_start => Shift(yy_state_1)
    T_A => Shift(yy_state_2)
    _ => Error
  }
}

///|
// [5, start_prime → start •, $]
fn yy_state_1(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

///|
// [0, start → A • b A A b, $]
// [1, start → A • b A B b, $]
// [2, start → A • b B A b, $]
// [3, start → A • b B B b, $]
// [4, b → • B, A / B]
fn yy_state_2(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_B => Shift(yy_state_3)
    NT_b => Shift(yy_state_4)
    _ => Error
  }
}

///|
// [4, b → B •, $ / A / B]
fn yy_state_3(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_b, yy_action_7)
}

///|
// [0, start → A b • A A b, $]
// [1, start → A b • A B b, $]
// [2, start → A b • B A b, $]
// [3, start → A b • B B b, $]
fn yy_state_4(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_B => Shift(yy_state_5)
    T_A => Shift(yy_state_10)
    _ => Error
  }
}

///|
// [2, start → A b B • A b, $]
// [3, start → A b B • B b, $]
fn yy_state_5(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_B => Shift(yy_state_6)
    T_A => Shift(yy_state_8)
    _ => Error
  }
}

///|
// [3, start → A b B B • b, $]
// [4, b → • B, $]
fn yy_state_6(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_B => Shift(yy_state_3)
    NT_b => Shift(yy_state_7)
    _ => Error
  }
}

///|
// [3, start → A b B B b •, $]
fn yy_state_7(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_start, yy_action_6)
}

///|
// [2, start → A b B A • b, $]
// [4, b → • B, $]
fn yy_state_8(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_B => Shift(yy_state_3)
    NT_b => Shift(yy_state_9)
    _ => Error
  }
}

///|
// [2, start → A b B A b •, $]
fn yy_state_9(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_start, yy_action_5)
}

///|
// [0, start → A b A • A b, $]
// [1, start → A b A • B b, $]
fn yy_state_10(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_B => Shift(yy_state_11)
    T_A => Shift(yy_state_13)
    _ => Error
  }
}

///|
// [1, start → A b A B • b, $]
// [4, b → • B, $]
fn yy_state_11(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_B => Shift(yy_state_3)
    NT_b => Shift(yy_state_12)
    _ => Error
  }
}

///|
// [1, start → A b A B b •, $]
fn yy_state_12(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_start, yy_action_4)
}

///|
// [0, start → A b A A • b, $]
// [4, b → • B, $]
fn yy_state_13(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_B => Shift(yy_state_3)
    NT_b => Shift(yy_state_14)
    _ => Error
  }
}

///|
// [0, start → A b A A b •, $]
fn yy_state_14(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_start, yy_action_2)
}

///|
fn[T] yy_parse(
  tokens : Array[(Token, Unit, Unit)], start : YYState,
  return_ : ((YYObj) -> T), initial_pos? : Unit
) -> T raise ParseError {
  let mut cursor = 0
  ignore(initial_pos.unwrap_or_else(() => tokens[0].1))
  let mut state_stack : @list.List[YYState] = @list.List([start])
  let data_stack : Array[YYObj] = []
  let mut state = start
  let mut lookahead : (YYSymbol, YYObj, Token?)? = None
  let mut last_shifted_state_stack = state_stack
  while true {
    let decision = match state(EOI) {
      (ReduceNoLookahead(_) | Accept) as t => t
      _ =>
        match lookahead {
          Some(la) => state(la.0)
          None =>
            if cursor < tokens.length() {
              let (token, _, _) = tokens[cursor]
              cursor += 1
              let (symbol, data) = yy_input(token)
              lookahead = Some((symbol, data, Some(token)))
              state(symbol)
            } else {
              lookahead = Some((EOI, YYObj_Void, None))
              state(EOI)
            }
        }
    }
    match decision {
      Accept =>
        ({
          ()
          return return_(data_stack.unsafe_pop())
        })
      Shift(next_state) =>
        ({
          ()
          guard! lookahead is Some(la)
          data_stack.push(la.1)
          state_stack = @list.cons(next_state, state_stack)
          last_shifted_state_stack = state_stack
          state = next_state
          lookahead = None
        })
      Reduce(count, symbol, action) | ReduceNoLookahead(count, symbol, action) =>
        ({
          ()
          for count = count, symbol = symbol, action = action {
            let start_index = data_stack.length() - count
            let args = data_stack[start_index:]
            let data = action(args)
            for _ in 0..<count {
              ignore(data_stack.unsafe_pop())
              state_stack = state_stack.unsafe_tail()
            }
            state = state_stack.unsafe_head()
            data_stack.push(data)
            match state(symbol) {
              Accept =>
                ({
                  ()
                  return return_(data_stack.unsafe_pop())
                })
              Shift(next_state) =>
                ({
                  ()
                  state_stack = @list.cons(next_state, state_stack)
                  state = next_state
                  break ()
                })
              Reduce(count, symbol, action) | ReduceNoLookahead(
                count, symbol, action
              ) =>
                ({
                  ()
                  continue count, symbol, action
                })
              _ => panic()
            }
          }
        })
      Error =>
        ({
          ()
          let (_, _data, token) = lookahead.unwrap()
          error(last_shifted_state_stack, token, ((), ()))
        })
    }
  }
  panic()
}

///|
fn error(stack : @list.List[YYState], token : Token?, loc : (Unit, Unit)) -> Unit raise ParseError {
  let expected = []
  fn try_add(symbol : YYSymbol, kind : TokenKind) {
    fn go(stack : @list.List[YYState]) {
      match stack {
        Empty => ()
        More(state, ..) =>
          match state(symbol) {
            Accept | Shift(_) => expected.push(kind)
            Reduce(count, symbol, _) | ReduceNoLookahead(count, symbol, _) =>
              ({
                ()
                fn inner_go(stack : @list.List[YYState], count, symbol) {
                  let stack = stack.drop(count)
                  guard! stack is More(state, ..)
                  match state(symbol) {
                    Shift(state) => go(@list.cons(state, stack))
                    Reduce(count, symbol, _) | ReduceNoLookahead(
                      count, symbol, _
                    ) =>
                      inner_go(stack, count, symbol)
                    _ => panic()
                  }
                }
                inner_go(stack, count, symbol)
              })
            Error => ()
          }
      }
    }
    go(stack)
  }
  for term in ([(T_A, TK_A), (T_B, TK_B)] : Array[(YYSymbol, TokenKind)]) {
    try_add(term.0, term.1)
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

///|
pub fn start(tokens : Array[(Token, Unit, Unit)], initial_pos? : Unit) -> String raise ParseError {
  yy_parse(
    tokens, yy_state_0,
    (it) =>
      ({
        ()
        guard! it is YYObj_String(result)
        result
      }), initial_pos?
  )
}
