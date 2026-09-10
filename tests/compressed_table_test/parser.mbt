
pub(all) enum Token {
  NUMBER(Int)
  LPAREN
  RPAREN
  EOF
}

pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    NUMBER(_) => TK_NUMBER
    LPAREN => TK_LPAREN
    RPAREN => TK_RPAREN
    EOF => TK_EOF
  }
}

pub(all) enum TokenKind {
  TK_NUMBER
  TK_LPAREN
  TK_RPAREN
  TK_EOF
}

pub impl Show for TokenKind with fn output(self, logger) {
  logger.write_string(
    match self {
      TK_NUMBER => "NUMBER"
      TK_LPAREN => "LPAREN"
      TK_RPAREN => "RPAREN"
      TK_EOF => "EOF"
    }
  )
}

pub impl Debug for TokenKind with fn to_repr(self) {
    match self {
      TK_NUMBER => Repr("NUMBER")
      TK_LPAREN => Repr("LPAREN")
      TK_RPAREN => Repr("RPAREN")
      TK_EOF => Repr("EOF")
    }
}

pub suberror ParseError {
  UnexpectedToken(Token, (Int, Int), Array[TokenKind])
  UnexpectedEndOfInput(Int, Array[TokenKind])
}

type YYObj = Error

priv suberror YYObj_Void

priv suberror YYObj_Json {
 YYObj_Json(Json)
}
type YYState = Int

type YYAction = (Int, ArrayView[(YYObj, Int, Int)]) -> YYObj

priv enum YYDecision {
  Accept
  Shift(YYState)
  Reduce(Int, YYSymbol, YYAction)
  ReduceNoLookahead(Int, YYSymbol, YYAction)
  Error
}

type YYSymbol = Int

// file:///./parser.mbty
// 11|    NUMBER                { $1 }
fn yy_action_0(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _start_pos = if _args.length() == 0 { _last_pos } else { _args[0].1 }
  let _end_pos = if _args.length() == 0 { _last_pos } else { _args[_args.length() - 1].2 }
  YYObj_Json({(); {
  "type": "NONTERMINAL",
  "name": "start",
  "rule_index": 0,
  "clause_index": 0,
  "children": args_to_json(_args),
  "start": _start_pos.to_json(),
  "end": _end_pos.to_json(),
}
})
}

// file:///./parser.mbty
// 12|    LPAREN start RPAREN   { $2 }
fn yy_action_1(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _start_pos = if _args.length() == 0 { _last_pos } else { _args[0].1 }
  let _end_pos = if _args.length() == 0 { _last_pos } else { _args[_args.length() - 1].2 }
  YYObj_Json({(); {
  "type": "NONTERMINAL",
  "name": "start",
  "rule_index": 0,
  "clause_index": 1,
  "children": args_to_json(_args),
  "start": _start_pos.to_json(),
  "end": _end_pos.to_json(),
}
})
}

fn yy_input(token : Token, _start_pos : Int, _end_pos : Int) -> (YYSymbol, YYObj) {
  match token {
    NUMBER(data) => (1, YYObj_Json({
      "type": "TERMINAL",
      "name": "NUMBER",
      "data": data.to_json(),
      "start": _start_pos.to_json(),
      "end": _end_pos.to_json()
    }))
    LPAREN => (2, YYObj_Json({
      "type": "TERMINAL",
      "name": "LPAREN",
      "data": Json::null(),
      "start": _start_pos.to_json(),
      "end": _end_pos.to_json()
    }))
    RPAREN => (3, YYObj_Json({
      "type": "TERMINAL",
      "name": "RPAREN",
      "data": Json::null(),
      "start": _start_pos.to_json(),
      "end": _end_pos.to_json()
    }))
    EOF => (4, YYObj_Json({
      "type": "TERMINAL",
      "name": "EOF",
      "data": Json::null(),
      "start": _start_pos.to_json(),
      "end": _end_pos.to_json()
    }))
  }
}

let yy_prod_lhs_table : FixedArray[Int] = [5, 5]

let yy_prod_len_table : FixedArray[Int] = [1, 3]

let yy_prod_act_table : FixedArray[YYAction] = [yy_action_0, yy_action_1]

fn yy_decompress(input : FixedArray[Int]) -> FixedArray[Int] {
  let output = []
  let mut last = 0
  for val in input {
    if val < 0 {
      let count = -val - 1
      for _ in 0..<count {
        output.push(last)
      }
    } else {
      output.push(val)
      last = val
    }
  }
  FixedArray::from_array(output)
}

let yy_state_table : FixedArray[Int] = yy_decompress([0, 7, 4, 0, -2, 3, 0, 1, 0, -7, 7, 4, 0, -2, 5, 0, -4, 6, 0, -3, 11, 0, -2, 11, 0, -3, 10, 0, -2, 10, 0, -3])

fn yy_state(state : YYState, symbol : YYSymbol) -> YYDecision {
  let encoded = yy_state_table[state * 7 + symbol]
  match encoded {
    0 => Error
    1 => Accept
    2..=7 => Shift(encoded - 2)
    8..=9 =>
      Reduce(
        yy_prod_len_table[encoded - 8],
        yy_prod_lhs_table[encoded - 8],
        yy_prod_act_table[encoded - 8],
      )
    10..<_ =>
      ReduceNoLookahead(
        yy_prod_len_table[encoded - 10],
        yy_prod_lhs_table[encoded - 10],
        yy_prod_act_table[encoded - 10],
      )
    _ => panic()
  }
}

fn[T] yy_parse(
  tokens : Array[(Token, Int, Int)],
  start : YYState,
  return_ : (YYObj) -> T,
  initial_pos? : Int,
) -> T raise ParseError {
  let mut cursor = 0
  let mut state_stack : @list.List[YYState] = @list.cons(start, @list.empty())
  let data_stack : Array[(YYObj, Int, Int)] = []
  let mut last_pos = initial_pos.unwrap_or(tokens[0].1)
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
  for term in ([(1, TK_NUMBER), (2, TK_LPAREN), (3, TK_RPAREN), (4, TK_EOF)] : Array[(YYSymbol, TokenKind)]) {
    try_add(term.0, term.1)
  }
  match token {
    None => raise UnexpectedEndOfInput(loc.1, expected)
    Some(token) => raise UnexpectedToken(token, loc, expected)
  }
}

pub fn start(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Json raise ParseError {
  yy_parse(
    tokens,
    0,
    (it) => {
      guard! it is YYObj_Json(result)
      result
    },
    initial_pos?,
  )
}

fn args_to_json(args : ArrayView[(YYObj, Int, Int)]) -> Json {
  Json::array(args.iter().map((it) => {
    guard! it.0 is YYObj_Json(json)
    json
  }).to_array())
}
