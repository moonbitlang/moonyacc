///|
pub(all) enum Token {
  NUMBER(Int)
  MARK
  EOF
}

///|
pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    NUMBER(_) => TK_NUMBER
    MARK => TK_MARK
    EOF => TK_EOF
  }
}

///|
pub(all) enum TokenKind {
  TK_NUMBER
  TK_MARK
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
      TK_MARK => "MARK"
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
    TK_MARK => Repr("MARK")
    TK_EOF => Repr("EOF")
  }
}

///|
pub suberror ParseError {
  UnexpectedToken(Token, ((Int, Int), (Int, Int)), Array[TokenKind])
  UnexpectedEndOfInput((Int, Int), Array[TokenKind])
}

///|
type YYObj = Error

///|
priv suberror YYObj_Void

///|
priv suberror YYObj_Json {
  YYObj_Json(Json)
}

///|
type YYState = Int

///|
type YYAction = (((Int, Int), ArrayView[(YYObj, (Int, Int), (Int, Int))]) -> YYObj)

///|
priv enum YYDecision {
  Accept
  Shift(YYState)
  Reduce(Int, YYSymbol, YYReduction)
  ReduceNoLookahead(Int, YYSymbol, YYReduction)
  Error
}

///|
priv struct YYReduction {
  action : YYAction
  start_before_rhs : Bool
}

///|
type YYSymbol = Int

///|
// file:///./parser.mbty
// 8|       prefix atom EOF { () }
fn yy_action_1(
  _last_pos : (Int, Int), _args : ArrayView[(YYObj, (Int, Int), (Int, Int))]
) -> YYObj {
  let _sub_action_0_result = yy_action_0(_args[0].2, _args[1:2])
  yy_json_cst_action("start", 0, 0, _args[0].1, _args[2].2, _args)
}

///|
// file:///./parser.mbty
// 10|              NUMBER { () }
fn yy_action_0(
  _last_pos : (Int, Int), _args : ArrayView[(YYObj, (Int, Int), (Int, Int))]
) -> YYObj {
  yy_json_cst_action("atom", 2, 0, _args[0].1, _args[0].2, _args)
}

///|
// file:///./parser.mbty
// 9|                 MARK { () }
fn yy_action_2(
  _last_pos : (Int, Int), _args : ArrayView[(YYObj, (Int, Int), (Int, Int))]
) -> YYObj {
  yy_json_cst_action("prefix", 1, 1, _args[0].1, _args[0].2, _args)
}

///|
// file:///./parser.mbty
// 9|        { () }
fn yy_action_3(
  _last_pos : (Int, Int), _args : ArrayView[(YYObj, (Int, Int), (Int, Int))]
) -> YYObj {
  yy_json_cst_action("prefix", 1, 0, _last_pos, _last_pos, _args)
}

///|
// file:///./parser.mbty
// 11|               empty NUMBER EOF { () }
fn yy_action_5(
  _last_pos : (Int, Int), _args : ArrayView[(YYObj, (Int, Int), (Int, Int))]
) -> YYObj {
  let _sub_action_0_result = yy_action_4(_last_pos, _args[0:0])
  yy_json_cst_action("leading_empty", 3, 0, _last_pos, _args[1].2, _args)
}

///|
// file:///./parser.mbty
// 12|               { () }
fn yy_action_4(
  _last_pos : (Int, Int), _args : ArrayView[(YYObj, (Int, Int), (Int, Int))]
) -> YYObj {
  yy_json_cst_action("empty", 4, 0, _last_pos, _last_pos, _args)
}

///|
let yy_reduction_1 : YYReduction = {
  action: yy_action_1, start_before_rhs: false
}

///|
let yy_reduction_2 : YYReduction = {
  action: yy_action_2, start_before_rhs: false
}

///|
let yy_reduction_3 : YYReduction = {action: yy_action_3, start_before_rhs: true}

///|
let yy_reduction_5 : YYReduction = {action: yy_action_5, start_before_rhs: true}

///|
fn yy_input(token : Token, _start_pos : (Int, Int), _end_pos : (Int, Int)) -> (
  YYSymbol, YYObj
) {
  match token {
    NUMBER(data) =>
      (
        1,
        YYObj_Json(
          {
            "type": "TERMINAL", "name": "NUMBER", "data": ToJson::to_json(data),
            "start": ToJson::to_json(_start_pos),
            "end": ToJson::to_json(_end_pos)
          }
        )
      )
    MARK =>
      (
        2,
        YYObj_Json(
          {
            "type": "TERMINAL", "name": "MARK", "data": Json::null(),
            "start": ToJson::to_json(_start_pos),
            "end": ToJson::to_json(_end_pos)
          }
        )
      )
    EOF =>
      (
        3,
        YYObj_Json(
          {
            "type": "TERMINAL", "name": "EOF", "data": Json::null(),
            "start": ToJson::to_json(_start_pos),
            "end": ToJson::to_json(_end_pos)
          }
        )
      )
  }
}

///|
let yy_prod_lhs_table : ReadOnlyArray[Int] = [4, 5, 5, 6]

///|
let yy_prod_len_table : ReadOnlyArray[Int] = [3, 0, 1, 2]

///|
let yy_prod_act_table : ReadOnlyArray[YYReduction] = [
  yy_reduction_1, yy_reduction_3, yy_reduction_2, yy_reduction_5
]

///|
let yy_state_table : ReadOnlyArray[Int] = [
  0, 4, 0, 0, 0, 0, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0,
  0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 8, 0, 7, 9, 0, 0, 0, 1, 0, 0, 0, 0, 0,
  0, 0, 0, 0, 18, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11,
  0, 0, 0, 0, 0, 16, 0, 0, 0, 0, 0, 0, 0, 0
]

///|
fn yy_state(state : YYState, symbol : YYSymbol) -> YYDecision {
  let encoded = yy_state_table[state * 9 + symbol]
  match encoded {
    0 => Error
    1 => Accept
    2..=11 => Shift(encoded - 2)
    12..=15 =>
      Reduce(
        yy_prod_len_table[encoded - 12], yy_prod_lhs_table[encoded - 12],
        yy_prod_act_table[encoded - 12]
      )
    16..<_ =>
      ReduceNoLookahead(
        yy_prod_len_table[encoded - 16], yy_prod_lhs_table[encoded - 16],
        yy_prod_act_table[encoded - 16]
      )
    _ => panic()
  }
}

///|
fn[T] yy_parse(
  tokens : Array[(Token, (Int, Int), (Int, Int))], start : YYState,
  return_ : ((YYObj) -> T), initial_pos? : (Int, Int)
) -> T raise ParseError {
  let mut cursor = 0
  let initial_position = initial_pos.unwrap_or_else(() => tokens[0].1)
  let mut state_stack : @list.List[YYState] = @list.List([start])
  let data_stack : Array[(YYObj, (Int, Int), (Int, Int))] = []
  let mut state = start
  let mut lookahead : (YYSymbol, (YYObj, (Int, Int), (Int, Int)), Token?)? = None
  let mut last_shifted_state_stack = state_stack
  let mut last_pos = initial_position
  while true {
    let decision = match yy_state(state, 0) {
      (ReduceNoLookahead(_) | Accept) as t => t
      _ =>
        match lookahead {
          Some(la) => yy_state(state, la.0)
          None =>
            if cursor < tokens.length() {
              let (token, start_pos, end_pos) = tokens[cursor]
              cursor += 1
              let (symbol, data) = yy_input(token, start_pos, end_pos)
              lookahead = Some(
                (symbol, (data, start_pos, end_pos), Some(token))
              )
              yy_state(state, symbol)
            } else {
              lookahead = Some((0, (YYObj_Void, last_pos, last_pos), None))
              yy_state(state, 0)
            }
        }
    }
    match decision {
      Accept =>
        ({
          ()
          return return_(data_stack.unsafe_pop().0)
        })
      Shift(next_state) =>
        ({
          ()
          guard! lookahead is Some(la)
          data_stack.push(la.1)
          state_stack = @list.cons(next_state, state_stack)
          last_shifted_state_stack = state_stack
          state = next_state
          last_pos = la.1.2
          lookahead = None
        })
      Reduce(count, symbol, action) | ReduceNoLookahead(count, symbol, action) =>
        ({
          ()
          for count = count, symbol = symbol, action = action {
            let start_index = data_stack.length() - count
            let args = data_stack[start_index:]
            let previous_end = if start_index == 0 {
              initial_position
            } else {
              data_stack[start_index - 1].2
            }
            let start_pos = if action.start_before_rhs {
              previous_end
            } else {
              args[0].1
            }
            let end_pos = if count == 0 {
              previous_end
            } else {
              args[count - 1].2
            }
            let data = (action.action)(previous_end, args)
            for _ in 0..<count {
              ignore(data_stack.unsafe_pop())
              state_stack = state_stack.unsafe_tail()
            }
            state = state_stack.unsafe_head()
            data_stack.push((data, start_pos, end_pos))
            match yy_state(state, symbol) {
              Accept =>
                ({
                  ()
                  return return_(data_stack.unsafe_pop().0)
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
          error(last_shifted_state_stack, token, (_data.1, _data.2))
        })
    }
  }
  panic()
}

///|
fn error(
  stack : @list.List[YYState], token : Token?, loc : ((Int, Int), (Int, Int))
) -> Unit raise ParseError {
  let expected = []
  fn try_add(symbol : YYSymbol, kind : TokenKind) {
    fn go(stack : @list.List[YYState]) {
      match stack {
        Empty => ()
        More(state, ..) =>
          match yy_state(state, symbol) {
            Accept | Shift(_) => expected.push(kind)
            Reduce(count, symbol, _) | ReduceNoLookahead(count, symbol, _) =>
              ({
                ()
                fn inner_go(stack : @list.List[YYState], count, symbol) {
                  let stack = stack.drop(count)
                  guard! stack is More(state, ..)
                  match yy_state(state, symbol) {
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
  for term in ([(1, TK_NUMBER), (2, TK_MARK), (3, TK_EOF)] : Array[
    (YYSymbol, TokenKind)
  ]) {
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
pub fn start(
  tokens : Array[(Token, (Int, Int), (Int, Int))], initial_pos? : (Int, Int)
) -> Json raise ParseError {
  yy_parse(
    tokens, 4,
    (it) =>
      ({
        ()
        guard! it is YYObj_Json(result)
        result
      }), initial_pos?
  )
}

///|
pub fn leading_empty(
  tokens : Array[(Token, (Int, Int), (Int, Int))], initial_pos? : (Int, Int)
) -> Json raise ParseError {
  yy_parse(
    tokens, 0,
    (it) =>
      ({
        ()
        guard! it is YYObj_Json(result)
        result
      }), initial_pos?
  )
}

///|
#inline(never)
fn yy_json_cst_action(
  name : Json, rule_index : Json, clause_index : Json, start_pos : (Int, Int),
  end_pos : (Int, Int), _args : ArrayView[(YYObj, (Int, Int), (Int, Int))]
) -> YYObj {
  YYObj_Json(
    {
      "type": "NONTERMINAL", "name": name, "rule_index": rule_index,
      "clause_index": clause_index, "children": args_to_json(_args),
      "start": ToJson::to_json(start_pos), "end": ToJson::to_json(end_pos)
    }
  )
}

///|
fn args_to_json(args : ArrayView[(YYObj, (Int, Int), (Int, Int))]) -> Json {
  Json::array(
    args.iter().map(
      (it) =>
        ({
          ()
          guard! it.0 is YYObj_Json(json)
          json
        })
    ).to_array()
  )
}
