pub(all) typealias Position = Unit

pub(all) enum Token {
  LETTER(Char)
  LBRACE
  RBRACE
}

pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    LETTER(_) => TK_LETTER
    LBRACE => TK_LBRACE
    RBRACE => TK_RBRACE
  }
}

pub(all) enum TokenKind {
  TK_LETTER
  TK_LBRACE
  TK_RBRACE
}

pub impl Show for TokenKind with output(self, logger) {
  logger.write_string(
    match self {
      TK_LETTER => "LETTER"
      TK_LBRACE => "\"{\""
      TK_RBRACE => "\"}\""
    }
  )
}

pub type! ParseError {
  UnexpectedToken(Token, (Position, Position), Array[TokenKind])
  UnexpectedEndOfInput(Position, Array[TokenKind])
}

typealias YYObj = Error

priv type! YYObj_Void

priv type! YYObj_Char Char

priv type! YYObj_String String

priv type! YYObj__immut_list_T_Char_ @immut/list.T[Char]

typealias YYState = (YYSymbol) -> YYDecision

typealias YYAction = (Position, ArrayView[(YYObj, Position, Position)]) -> YYObj

priv enum YYDecision {
  Accept
  Shift(YYState)
  Reduce(Int, YYSymbol, YYAction)
  ReduceNoLookahead(Int, YYSymbol, YYAction)
  Error
}

priv enum YYSymbol {
  T_LETTER
  T_LBRACE
  T_RBRACE
  NT_start
  NT_list__LETTER
  NT_delimited__LBRACE_list__LETTER_RBRACE
  EOI
}

// Workaround for EOI unused warning
fn init {
  match (EOI : YYSymbol) {
    EOI => ()
    _ => ()
  }
}

fn yy_action_0(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__immut_list_T_Char_(_dollar2)
  YYObj__immut_list_T_Char_({();  _dollar2 })
}

fn yy_action_1(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__immut_list_T_Char_(_dollar1)
  YYObj_String({();  _dollar1.iter().map(fn (it) { String::make(1, it) }).join("") })
}

fn yy_action_2(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj__immut_list_T_Char_({();  Nil })
}

fn yy_action_3(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_Char(_dollar1)
  guard _args[1].0 is YYObj__immut_list_T_Char_(_dollar2)
  YYObj__immut_list_T_Char_({();  Cons(_dollar1, _dollar2) })
}

fn yy_input(token : Token, _start_pos : Position, _end_pos : Position) -> (YYSymbol, YYObj) {
  match token {
    LETTER(data) => (T_LETTER, YYObj_Char(data))
    LBRACE => (T_LBRACE, YYObj_Void)
    RBRACE => (T_RBRACE, YYObj_Void)
  }
}

// [0, start → • delimited__LBRACE_list__LETTER_RBRACE, $]
// [3, delimited__LBRACE_list__LETTER_RBRACE → • LBRACE list__LETTER RBRACE, $]
// [4, start_prime → • start, $]
fn yy_state_0(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_start => Shift(yy_state_1)
    T_LBRACE => Shift(yy_state_2)
    NT_delimited__LBRACE_list__LETTER_RBRACE => Shift(yy_state_7)
    _ => Error
  }
}

// [4, start_prime → start •, $]
fn yy_state_1(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

// [1, list__LETTER → •, RBRACE]
// [2, list__LETTER → • LETTER list__LETTER, RBRACE]
// [3, delimited__LBRACE_list__LETTER_RBRACE → LBRACE • list__LETTER RBRACE, $]
fn yy_state_2(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_list__LETTER => Shift(yy_state_3)
    T_LETTER => Shift(yy_state_5)
    T_RBRACE => Reduce(0, NT_list__LETTER, yy_action_2)
    _ => Error
  }
}

// [3, delimited__LBRACE_list__LETTER_RBRACE → LBRACE list__LETTER • RBRACE, $]
fn yy_state_3(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACE => Shift(yy_state_4)
    _ => Error
  }
}

// [3, delimited__LBRACE_list__LETTER_RBRACE → LBRACE list__LETTER RBRACE •, $]
fn yy_state_4(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_delimited__LBRACE_list__LETTER_RBRACE, yy_action_0)
}

// [1, list__LETTER → •, RBRACE]
// [2, list__LETTER → • LETTER list__LETTER, RBRACE]
// [2, list__LETTER → LETTER • list__LETTER, RBRACE]
fn yy_state_5(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LETTER => Shift(yy_state_5)
    NT_list__LETTER => Shift(yy_state_6)
    T_RBRACE => Reduce(0, NT_list__LETTER, yy_action_2)
    _ => Error
  }
}

// [2, list__LETTER → LETTER list__LETTER •, RBRACE]
fn yy_state_6(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_list__LETTER, yy_action_3)
}

// [0, start → delimited__LBRACE_list__LETTER_RBRACE •, $]
fn yy_state_7(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_start, yy_action_1)
}

fn yy_parse[T](
  tokens : Array[(Token, Position, Position)],
  start : YYState,
  return_ : (YYObj) -> T,
  initial_pos? : Position,
) -> T!ParseError {
  let mut cursor = 0
  let mut state_stack : @immut/list.T[YYState] = Cons(start, Nil)
  let data_stack : Array[(YYObj, Position, Position)] = []
  let mut last_pos = initial_pos.or(tokens[0].1)
  let mut state = start
  let mut lookahead : Option[(YYSymbol, (YYObj, Position, Position), Token?)] = None
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
        state_stack = Cons(next_state, state_stack)
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
              state_stack = state_stack.tail()
            }
            state = state_stack.unsafe_head()
            data_stack.push((data, start_pos, end_pos))
            match state(symbol) {
              Accept => return return_(data_stack.unsafe_pop().0)
              Shift(next_state) => {
                state_stack = Cons(next_state, state_stack)
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
        error!(last_shifted_state_stack, token, (start_pos, end_pos))
      }
    }
  }
  panic()
}

fn error(stack : @immut/list.T[YYState], token : Token?, loc : (Position, Position)) -> Unit!ParseError {
  let expected = []
  fn try_add(symbol : YYSymbol, kind : TokenKind) {
    fn go(stack : @immut/list.T[YYState]) {
      match stack {
        Nil => ()
        Cons(state, _) => {
          match state(symbol) {
            Accept | Shift(_) => expected.push(kind)
            Reduce(count, symbol, _) | ReduceNoLookahead(count, symbol, _) => {
              fn inner_go(stack : @immut/list.T[YYState], count, symbol) {
                let stack = stack.drop(count)
                guard stack is Cons(state, _)
                match state(symbol) {
                  Shift(state) => go(Cons(state, stack))
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
  for term in ([(T_LETTER, TK_LETTER), (T_LBRACE, TK_LBRACE), (T_RBRACE, TK_RBRACE)] : Array[(YYSymbol, TokenKind)]) {
    try_add(term.0, term.1)
  }
  match token {
    None => raise UnexpectedEndOfInput(loc.1, expected)
    Some(token) => raise UnexpectedToken(token, loc, expected)
  }
}

pub fn start(tokens : Array[(Token, Position, Position)], initial_pos? : Position) -> String!ParseError {
  yy_parse!(
    tokens,
    yy_state_0,
    fn {
      YYObj_String(result) => result
      _ => panic()
    },
    initial_pos?,
  )
}
