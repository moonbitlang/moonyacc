
let reductions : Ref[Int] = Ref(0)

///|
pub(all) enum Token {
  NUMBER(Int)
  EQ
  NE
  LPAREN
  RPAREN
}
///|
pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    NUMBER(_) => TK_NUMBER
    EQ => TK_EQ
    NE => TK_NE
    LPAREN => TK_LPAREN
    RPAREN => TK_RPAREN
  }
}

///|
pub(all) enum TokenKind {
  TK_NUMBER
  TK_EQ
  TK_NE
  TK_LPAREN
  TK_RPAREN
}

///|
#deprecated("Use Show::to_string or Show::output instead")
#doc(hidden)
pub extend TokenKind with Show::{output, to_string}
///|
pub impl Show for TokenKind with fn output(self, logger) {
  Logger::write_string(logger,
    match self {
      TK_NUMBER => "NUMBER"
      TK_EQ => "EQ"
      TK_NE => "NE"
      TK_LPAREN => "LPAREN"
      TK_RPAREN => "RPAREN"
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
      TK_EQ => Repr("EQ")
      TK_NE => Repr("NE")
      TK_LPAREN => Repr("LPAREN")
      TK_RPAREN => Repr("RPAREN")
    }
}

///|
pub suberror ParseError {
  UnexpectedToken(Token, (Int, Int), Array[TokenKind])
  UnexpectedEndOfInput(Int, Array[TokenKind])
}

///|
type YYObj = Error

///|
priv suberror YYObj_Void

///|
priv suberror YYObj_Int {
  YYObj_Int(Int)
}

///|
type YYState = Int
///|
type YYAction = (Int, ArrayView[(YYObj, Int, Int)]) -> YYObj
///|
priv enum YYDecision {
  Accept
  Shift(YYState)
  Reduce(Int, YYSymbol, YYAction)
  ReduceNoLookahead(Int, YYSymbol, YYAction)
  Error
}

///|
type YYSymbol = Int

///|
// file:///./parser.mbty
// 14|       expr { $1 }
fn yy_action_0(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_Int(_dollar1)
  YYObj_Int({();  _dollar1 })
}

///|
// file:///./parser.mbty
// 17|    NUMBER { $1 }
fn yy_action_1(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_Int(_dollar1)
  YYObj_Int({();  _dollar1 })
}

///|
// file:///./parser.mbty
// 18|    expr EQ expr { reductions.val += 1; $1 + $3 }
fn yy_action_2(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_Int(_dollar1)
  guard! _args[2].0 is YYObj_Int(_dollar3)
  YYObj_Int({();  reductions.val += 1; _dollar1 + _dollar3 })
}

///|
// file:///./parser.mbty
// 19|    expr NE expr { reductions.val += 1; $1 + $3 }
fn yy_action_3(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[0].0 is YYObj_Int(_dollar1)
  guard! _args[2].0 is YYObj_Int(_dollar3)
  YYObj_Int({();  reductions.val += 1; _dollar1 + _dollar3 })
}

///|
// file:///./parser.mbty
// 20|    LPAREN expr RPAREN { $2 }
fn yy_action_4(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj_Int(_dollar2)
  YYObj_Int({();  _dollar2 })
}

///|
fn yy_input(token : Token, _start_pos : Int, _end_pos : Int) -> (YYSymbol, YYObj) {
  match token {
    NUMBER(data) => (1, YYObj_Int(data))
    EQ => (2, YYObj_Void)
    NE => (3, YYObj_Void)
    LPAREN => (4, YYObj_Void)
    RPAREN => (5, YYObj_Void)
  }
}

///|
let yy_prod_lhs_table : FixedArray[Int] = [6, 7, 7, 7, 7]

///|
let yy_prod_len_table : FixedArray[Int] = [1, 1, 3, 3, 3]

///|
let yy_prod_act_table : FixedArray[YYAction] = [yy_action_0, yy_action_1, yy_action_2, yy_action_3, yy_action_4]

///|
let yy_state_table : FixedArray[Int] = [0, 11, 0, 0, 4, 0, 3, 12, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 0, 4, 0, 0, 5, 0, 0, 0, 9, 7, 0, 6, 0, 0, 0, 22, 0, 22, 22, 0, 22, 0, 0, 0, 0, 11, 0, 0, 4, 0, 0, 8, 0, 16, 0, 0, 0, 0, 16, 0, 0, 0, 0, 11, 0, 0, 4, 0, 0, 10, 0, 15, 0, 0, 0, 0, 15, 0, 0, 0, 19, 0, 19, 19, 0, 19, 0, 0, 0, 13, 0, 9, 7, 0, 0, 0, 0, 0]

///|
fn yy_state(state : YYState, symbol : YYSymbol) -> YYDecision {
  let encoded = yy_state_table[state * 9 + symbol]
  match encoded {
    0 => Error
    1 => Accept
    2..=12 => Shift(encoded - 2)
    13..=17 =>
      Reduce(
        yy_prod_len_table[encoded - 13],
        yy_prod_lhs_table[encoded - 13],
        yy_prod_act_table[encoded - 13],
      )
    18..<_ =>
      ReduceNoLookahead(
        yy_prod_len_table[encoded - 18],
        yy_prod_lhs_table[encoded - 18],
        yy_prod_act_table[encoded - 18],
      )
    _ => panic()
  }
}

///|
fn[T] yy_parse(
  tokens : Array[(Token, Int, Int)],
  start : YYState,
  return_ : (YYObj) -> T,
  initial_pos? : Int,
) -> T raise ParseError {
  let mut cursor = 0
  let mut state_stack : @list.List[YYState] = @list.cons(start, @list.empty())
  let data_stack : Array[(YYObj, Int, Int)] = []
  let mut last_pos = initial_pos.unwrap_or_else(fn() { tokens[0].1 })
  let mut state = start
  let mut lookahead : Option[(YYSymbol, (YYObj, Int, Int), Token?)] = None
  let mut last_shifted_state_stack = state_stack
  while true {
    let decision = match yy_state(state, 0) {
      ReduceNoLookahead(_) | Accept as t => t
      _ => {
        match lookahead {
          Some(la) => yy_state(state, la.0)
          None => {
            if cursor < tokens.length() {
              let (token, start_pos, end_pos) = tokens[cursor]
              cursor += 1
              let (symbol, data) = yy_input(token, start_pos, end_pos)
              lookahead = Some((symbol, (data, start_pos, end_pos), Some(token)))
              yy_state(state, symbol)
            } else {
              lookahead = Some((0, (YYObj_Void, last_pos, last_pos), None))
              yy_state(state, 0)
            }
          }
        }
      }
    }
    match decision {
      Accept => return return_(data_stack.unsafe_pop().0)
      Shift(next_state) => {
        guard! lookahead is Some(la)
        data_stack.push(la.1)
        state_stack = @list.cons(next_state, state_stack)
        last_shifted_state_stack = state_stack
        state = next_state
        last_pos = la.1.2
        lookahead = None
      }
      Reduce(count, symbol, action)
      | ReduceNoLookahead(count, symbol, action) => {
        for count = count, symbol = symbol, action = action {
          let args = data_stack[data_stack.length() - count:]
          let data = action(last_pos, args)
          let (start_pos, end_pos) = if args.length() == 0 {
            (last_pos, last_pos)
          } else {
            (args[0].1, args[args.length() - 1].2)
          }
          for _ in 0..<count {
            ignore(data_stack.unsafe_pop())
            state_stack = state_stack.unsafe_tail()
          }
          state = state_stack.unsafe_head()
          data_stack.push((data, start_pos, end_pos))
          match yy_state(state, symbol) {
            Accept => return return_(data_stack.unsafe_pop().0)
            Shift(next_state) => {
              state_stack = @list.cons(next_state, state_stack)
              state = next_state
              break ()
            }
            Reduce(count, symbol, action)
            | ReduceNoLookahead(count, symbol, action) => continue count, symbol, action
            _ => panic()
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

///|
fn error(stack : @list.List[YYState], token : Token?, loc : (Int, Int)) -> Unit raise ParseError {
  let expected = []
  fn try_add(symbol : YYSymbol, kind : TokenKind) {
    fn go(stack : @list.List[YYState]) {
      match stack {
        Empty => ()
        More(state, ..) => {
          match yy_state(state, symbol) {
            Accept | Shift(_) => expected.push(kind)
            Reduce(count, symbol, _) | ReduceNoLookahead(count, symbol, _) => {
              fn inner_go(stack : @list.List[YYState], count, symbol) {
                let stack = stack.drop(count)
                guard! stack is More(state, ..)
                match yy_state(state, symbol) {
                  Shift(state) => go(@list.cons(state, stack))
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
  for term in ([(1, TK_NUMBER), (2, TK_EQ), (3, TK_NE), (4, TK_LPAREN), (5, TK_RPAREN)] : Array[(YYSymbol, TokenKind)]) {
    try_add(term.0, term.1)
  }
  match token {
    None => raise UnexpectedEndOfInput(loc.1, expected)
    Some(token) => raise UnexpectedToken(token, loc, expected)
  }
}

///|
pub fn start(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Int raise ParseError {
  yy_parse(
    tokens,
    0,
    (it) => {
      guard! it is YYObj_Int(result)
      result
    },
    initial_pos?,
  )
}
