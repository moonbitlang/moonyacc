///|
pub(all) enum Token {
  P
  A
  B
  C
}

///|
pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    P => TK_P
    A => TK_A
    B => TK_B
    C => TK_C
  }
}

///|
pub(all) enum TokenKind {
  TK_P
  TK_A
  TK_B
  TK_C
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
      TK_P => "P"
      TK_A => "A"
      TK_B => "B"
      TK_C => "C"
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
    TK_P => Repr("P")
    TK_A => Repr("A")
    TK_B => Repr("B")
    TK_C => Repr("C")
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
priv suberror YYObj_Array__Int__Int__ {
  YYObj_Array__Int__Int__(Array[(Int, Int)])
}

///|
priv suberror YYObj__Int__Int_ {
  YYObj__Int__Int_((Int, Int))
}

///|
type YYState = ((YYSymbol) -> YYDecision)

///|
type YYAction = ((Int, ArrayView[(YYObj, Int, Int)]) -> YYObj)

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
priv enum YYSymbol {
  T_P
  T_A
  T_B
  T_C
  NT_multi
  NT_empty_before
  NT_empty_after
  NT_all_empty
  NT_nested
  NT_propagated
  NT_wrapper
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
// file:///./parser.mbty
// 7|       P x=pair C { [x, $loc(x), $loc($3), $loc, $sloc] }
fn yy_action_1(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_0(_args[0].2, _args[1:3])
  guard! _sub_action_0_result is YYObj__Int__Int_(x)
  let _start_pos_of_item1 = _args[1].1
  let _end_pos_of_item1 = _args[2].2
  let _start_pos_of_item2 = _args[3].1
  let _end_pos_of_item2 = _args[3].2
  let _start_pos = _args[0].1
  let _end_pos = _args[3].2
  let _symbol_start_pos = if _args[0].1 != _args[0].2 {
    _args[0].1
  } else {
    if _args[1].1 != _args[2].2 {
      _args[1].1
    } else {
      if _args[3].1 != _args[3].2 {
        _args[3].1
      } else {
        _args[3].2
      }
    }
  }
  YYObj_Array__Int__Int__(
    ({();  [x, (_start_pos_of_item1, _end_pos_of_item1), (_start_pos_of_item2, _end_pos_of_item2), (_start_pos, _end_pos), (_symbol_start_pos, _end_pos)] 
    })
  )
}

///|
// file:///./parser.mbty
// 9|              x=empty C { [x, $loc(x), $loc, $sloc] }
fn yy_action_3(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_2(_last_pos, _args[0:0])
  guard! _sub_action_0_result is YYObj__Int__Int_(x)
  let _start_pos_of_item0 = _last_pos
  let _end_pos_of_item0 = _last_pos
  let _start_pos = _last_pos
  let _end_pos = _args[0].2
  let _symbol_start_pos = if _args[0].1 != _args[0].2 {
    _args[0].1
  } else {
    _args[0].2
  }
  YYObj_Array__Int__Int__(
    ({();  [x, (_start_pos_of_item0, _end_pos_of_item0), (_start_pos, _end_pos), (_symbol_start_pos, _end_pos)] 
    })
  )
}

///|
// file:///./parser.mbty
// 10|             P x=empty { [x, $loc(x), $loc, $sloc] }
fn yy_action_4(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_2(_args[0].2, _args[1:1])
  guard! _sub_action_0_result is YYObj__Int__Int_(x)
  let _start_pos_of_item1 = _args[0].2
  let _end_pos_of_item1 = _args[0].2
  let _start_pos = _args[0].1
  let _end_pos = _args[0].2
  let _symbol_start_pos = if _args[0].1 != _args[0].2 {
    _args[0].1
  } else {
    _args[0].2
  }
  YYObj_Array__Int__Int__(
    ({();  [x, (_start_pos_of_item1, _end_pos_of_item1), (_start_pos, _end_pos), (_symbol_start_pos, _end_pos)] 
    })
  )
}

///|
// file:///./parser.mbty
// 11|           x=empty { [x, $loc(x), $loc, $sloc] }
fn yy_action_5(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_2(_last_pos, _args[0:0])
  guard! _sub_action_0_result is YYObj__Int__Int_(x)
  let _start_pos_of_item0 = _last_pos
  let _end_pos_of_item0 = _last_pos
  let _start_pos = _last_pos
  let _end_pos = _last_pos
  let _symbol_start_pos = _last_pos
  YYObj_Array__Int__Int__(
    ({();  [x, (_start_pos_of_item0, _end_pos_of_item0), (_start_pos, _end_pos), (_symbol_start_pos, _end_pos)] 
    })
  )
}

///|
// file:///./parser.mbty
// 13|        P x=outer y=empty C { x + [y, $loc(x), $loc(y), $loc($4), $loc, $sloc] }
fn yy_action_7(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_2(_args[2].2, _args[3:3])
  let _sub_action_1_result = yy_action_6(_args[0].2, _args[1:3])
  guard! _sub_action_1_result is YYObj_Array__Int__Int__(x)
  guard! _sub_action_0_result is YYObj__Int__Int_(y)
  let _start_pos_of_item1 = _args[0].2
  let _end_pos_of_item1 = _args[2].2
  let _start_pos_of_item2 = _args[2].2
  let _end_pos_of_item2 = _args[2].2
  let _start_pos_of_item3 = _args[3].1
  let _end_pos_of_item3 = _args[3].2
  let _start_pos = _args[0].1
  let _end_pos = _args[3].2
  let _symbol_start_pos = if _args[0].1 != _args[0].2 {
    _args[0].1
  } else {
    if _args[0].2 != _args[2].2 {
      _args[0].2
    } else {
      if _args[3].1 != _args[3].2 {
        _args[3].1
      } else {
        _args[3].2
      }
    }
  }
  YYObj_Array__Int__Int__(
    ({();  x + [y, (_start_pos_of_item1, _end_pos_of_item1), (_start_pos_of_item2, _end_pos_of_item2), (_start_pos_of_item3, _end_pos_of_item3), (_start_pos, _end_pos), (_symbol_start_pos, _end_pos)] 
    })
  )
}

///|
// file:///./parser.mbty
// 14|            P x=wrapper C { x + [$loc(x), $loc($3)] }
fn yy_action_8(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  guard! _args[1].0 is YYObj_Array__Int__Int__(x)
  let _start_pos_of_item1 = _args[1].1
  let _end_pos_of_item1 = _args[1].2
  let _start_pos_of_item2 = _args[2].1
  let _end_pos_of_item2 = _args[2].2
  YYObj_Array__Int__Int__(
    ({();  x + [(_start_pos_of_item1, _end_pos_of_item1), (_start_pos_of_item2, _end_pos_of_item2)] 
    })
  )
}

///|
// file:///./parser.mbty
// 15|                              x=outer { x + [$loc, $sloc] }
fn yy_action_9(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_6(_last_pos, _args[0:2])
  guard! _sub_action_0_result is YYObj_Array__Int__Int__(x)
  let _start_pos = _last_pos
  let _end_pos = _args[1].2
  let _symbol_start_pos = if _last_pos != _args[1].2 {
    _last_pos
  } else {
    _args[1].2
  }
  YYObj_Array__Int__Int__(
    ({();  x + [(_start_pos, _end_pos), (_symbol_start_pos, _end_pos)] 
    })
  )
}

///|
// file:///./parser.mbty
// 19|                                    e=empty p=pair { [e, p, $loc, $sloc] }
fn yy_action_6(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _sub_action_0_result = yy_action_2(_last_pos, _args[0:0])
  let _sub_action_1_result = yy_action_0(_last_pos, _args[0:2])
  guard! _sub_action_0_result is YYObj__Int__Int_(e)
  guard! _sub_action_1_result is YYObj__Int__Int_(p)
  let _start_pos = _last_pos
  let _end_pos = _args[1].2
  let _symbol_start_pos = if _args[0].1 != _args[1].2 {
    _args[0].1
  } else {
    _args[1].2
  }
  YYObj_Array__Int__Int__(
    ({();  [e, p, (_start_pos, _end_pos), (_symbol_start_pos, _end_pos)] 
    })
  )
}

///|
// file:///./parser.mbty
// 17|                            A B { ($startpos, $endpos) }
fn yy_action_0(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _start_pos = _args[0].1
  let _end_pos = _args[1].2
  YYObj__Int__Int_(
    ({();  (_start_pos, _end_pos) 
    })
  )
}

///|
// file:///./parser.mbty
// 18|                             { $loc }
fn yy_action_2(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _start_pos = _last_pos
  let _end_pos = _last_pos
  YYObj__Int__Int_(
    ({();  (_start_pos, _end_pos) 
    })
  )
}

///|
let yy_reduction_1 : YYReduction = {
  action: yy_action_1, start_before_rhs: false
}

///|
let yy_reduction_3 : YYReduction = {action: yy_action_3, start_before_rhs: true}

///|
let yy_reduction_4 : YYReduction = {
  action: yy_action_4, start_before_rhs: false
}

///|
let yy_reduction_5 : YYReduction = {action: yy_action_5, start_before_rhs: true}

///|
let yy_reduction_7 : YYReduction = {
  action: yy_action_7, start_before_rhs: false
}

///|
let yy_reduction_8 : YYReduction = {
  action: yy_action_8, start_before_rhs: false
}

///|
let yy_reduction_9 : YYReduction = {action: yy_action_9, start_before_rhs: true}

///|
fn yy_input(token : Token, _start_pos : Int, _end_pos : Int) -> (
  YYSymbol, YYObj
) {
  match token {
    P => (T_P, YYObj_Void)
    A => (T_A, YYObj_Void)
    B => (T_B, YYObj_Void)
    C => (T_C, YYObj_Void)
  }
}

///|
// [5, propagated → • P wrapper C, $]
// [12, propagated_prime → • propagated, $]
fn yy_state_0(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_propagated => Shift(yy_state_1)
    T_P => Shift(yy_state_2)
    _ => Error
  }
}

///|
// [12, propagated_prime → propagated •, $]
fn yy_state_1(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

///|
// [5, propagated → P • wrapper C, $]
// [6, wrapper → • A B, C]
fn yy_state_2(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_A => Shift(yy_state_3)
    NT_wrapper => Shift(yy_state_5)
    _ => Error
  }
}

///|
// [6, wrapper → A • B, C]
fn yy_state_3(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_B => Shift(yy_state_4)
    _ => Error
  }
}

///|
// [6, wrapper → A B •, C]
fn yy_state_4(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_wrapper, yy_reduction_9)
}

///|
// [5, propagated → P wrapper • C, $]
fn yy_state_5(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_C => Shift(yy_state_6)
    _ => Error
  }
}

///|
// [5, propagated → P wrapper C •, $]
fn yy_state_6(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_propagated, yy_reduction_8)
}

///|
// [4, nested → • P A B C, $]
// [11, nested_prime → • nested, $]
fn yy_state_7(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_nested => Shift(yy_state_8)
    T_P => Shift(yy_state_9)
    _ => Error
  }
}

///|
// [11, nested_prime → nested •, $]
fn yy_state_8(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

///|
// [4, nested → P • A B C, $]
fn yy_state_9(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_A => Shift(yy_state_10)
    _ => Error
  }
}

///|
// [4, nested → P A • B C, $]
fn yy_state_10(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_B => Shift(yy_state_11)
    _ => Error
  }
}

///|
// [4, nested → P A B • C, $]
fn yy_state_11(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_C => Shift(yy_state_12)
    _ => Error
  }
}

///|
// [4, nested → P A B C •, $]
fn yy_state_12(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_nested, yy_reduction_7)
}

///|
// [3, all_empty → •, $]
// [10, all_empty_prime → • all_empty, $]
fn yy_state_13(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_all_empty => Shift(yy_state_14)
    EOI => Reduce(0, NT_all_empty, yy_reduction_5)
    _ => Error
  }
}

///|
// [10, all_empty_prime → all_empty •, $]
fn yy_state_14(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

///|
// [2, empty_after → • P, $]
// [9, empty_after_prime → • empty_after, $]
fn yy_state_15(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_empty_after => Shift(yy_state_16)
    T_P => Shift(yy_state_17)
    _ => Error
  }
}

///|
// [9, empty_after_prime → empty_after •, $]
fn yy_state_16(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

///|
// [2, empty_after → P •, $]
fn yy_state_17(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_empty_after, yy_reduction_4)
}

///|
// [1, empty_before → • C, $]
// [8, empty_before_prime → • empty_before, $]
fn yy_state_18(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_empty_before => Shift(yy_state_19)
    T_C => Shift(yy_state_20)
    _ => Error
  }
}

///|
// [8, empty_before_prime → empty_before •, $]
fn yy_state_19(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

///|
// [1, empty_before → C •, $]
fn yy_state_20(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_empty_before, yy_reduction_3)
}

///|
// [0, multi → • P A B C, $]
// [7, multi_prime → • multi, $]
fn yy_state_21(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_multi => Shift(yy_state_22)
    T_P => Shift(yy_state_23)
    _ => Error
  }
}

///|
// [7, multi_prime → multi •, $]
fn yy_state_22(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

///|
// [0, multi → P • A B C, $]
fn yy_state_23(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_A => Shift(yy_state_24)
    _ => Error
  }
}

///|
// [0, multi → P A • B C, $]
fn yy_state_24(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_B => Shift(yy_state_25)
    _ => Error
  }
}

///|
// [0, multi → P A B • C, $]
fn yy_state_25(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_C => Shift(yy_state_26)
    _ => Error
  }
}

///|
// [0, multi → P A B C •, $]
fn yy_state_26(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_multi, yy_reduction_1)
}

///|
fn[T] yy_parse(
  tokens : Array[(Token, Int, Int)], start : YYState, return_ : ((YYObj) -> T),
  initial_pos? : Int
) -> T raise ParseError {
  let mut cursor = 0
  let initial_position = initial_pos.unwrap_or_else(() => tokens[0].1)
  let mut state_stack : @list.List[YYState] = @list.List([start])
  let data_stack : Array[(YYObj, Int, Int)] = []
  let mut state = start
  let mut lookahead : (YYSymbol, (YYObj, Int, Int), Token?)? = None
  let mut last_shifted_state_stack = state_stack
  let mut last_pos = initial_position
  while true {
    let decision = match state(EOI) {
      (ReduceNoLookahead(_) | Accept) as t => t
      _ =>
        match lookahead {
          Some(la) => state(la.0)
          None =>
            if cursor < tokens.length() {
              let (token, start_pos, end_pos) = tokens[cursor]
              cursor += 1
              let (symbol, data) = yy_input(token, start_pos, end_pos)
              lookahead = Some(
                (symbol, (data, start_pos, end_pos), Some(token))
              )
              state(symbol)
            } else {
              lookahead = Some((EOI, (YYObj_Void, last_pos, last_pos), None))
              state(EOI)
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
            match state(symbol) {
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
fn error(stack : @list.List[YYState], token : Token?, loc : (Int, Int)) -> Unit raise ParseError {
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
  for term in ([(T_P, TK_P), (T_A, TK_A), (T_B, TK_B), (T_C, TK_C)] : Array[
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
pub fn multi(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Array[
  (Int, Int)
] raise ParseError {
  yy_parse(
    tokens, yy_state_21,
    (it) =>
      ({
        ()
        guard! it is YYObj_Array__Int__Int__(result)
        result
      }), initial_pos?
  )
}

///|
pub fn empty_before(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Array[
  (Int, Int)
] raise ParseError {
  yy_parse(
    tokens, yy_state_18,
    (it) =>
      ({
        ()
        guard! it is YYObj_Array__Int__Int__(result)
        result
      }), initial_pos?
  )
}

///|
pub fn empty_after(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Array[
  (Int, Int)
] raise ParseError {
  yy_parse(
    tokens, yy_state_15,
    (it) =>
      ({
        ()
        guard! it is YYObj_Array__Int__Int__(result)
        result
      }), initial_pos?
  )
}

///|
pub fn all_empty(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Array[
  (Int, Int)
] raise ParseError {
  yy_parse(
    tokens, yy_state_13,
    (it) =>
      ({
        ()
        guard! it is YYObj_Array__Int__Int__(result)
        result
      }), initial_pos?
  )
}

///|
pub fn nested(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Array[
  (Int, Int)
] raise ParseError {
  yy_parse(
    tokens, yy_state_7,
    (it) =>
      ({
        ()
        guard! it is YYObj_Array__Int__Int__(result)
        result
      }), initial_pos?
  )
}

///|
pub fn propagated(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Array[
  (Int, Int)
] raise ParseError {
  yy_parse(
    tokens, yy_state_0,
    (it) =>
      ({
        ()
        guard! it is YYObj_Array__Int__Int__(result)
        result
      }), initial_pos?
  )
}
