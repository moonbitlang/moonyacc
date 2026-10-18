///|
pub(all) enum Token {

}

///|
pub fn Token::kind(self : Token) -> TokenKind {
  match self {

  }
}

///|
pub(all) enum TokenKind {

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
priv suberror YYObj_Unit {
  YYObj_Unit(Unit)
}

///|
type YYSymbol = Int

///|
// file:///./parser.mbty
// 7|          { $endpos }
fn yy_action_0(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  let _end_pos = if _args.length() == 0 {
    _last_pos
  } else {
    _args[_args.length() - 1].2
  }
  YYObj_Int(
    ({();  _end_pos 
    })
  )
}

///|
// file:///./parser.mbty
// 8|      { () }
fn yy_action_1(_last_pos : Int, _args : ArrayView[(YYObj, Int, Int)]) -> YYObj {
  YYObj_Unit(
    ({();  () 
    })
  )
}

///|
fn yy_input(token : Token, _start_pos : Int, _end_pos : Int) -> (
  YYSymbol, YYObj
) {
  match token {

  }
}

///|
fn yy_parse(
  tokens : Array[(Token, Int, Int)], entry : Int, initial_state : Int,
  initial_pos? : Int
) -> YYObj raise ParseError {
  let mut cursor = 0
  let last_pos = initial_pos.unwrap_or_else(() => tokens[0].1)
  let mut states : @list.List[Int] = @list.List([initial_state])
  let data : Array[(YYObj, Int, Int)] = []
  let error_stack = states
  let mut lookahead : (Int, (YYObj, Int, Int), Token?)? = None
  let mut _yy_p0_0 : Int = 0
  let mut _yy_p1_0 : YYObj = YYObj_Void
  let mut _yy_p2_0 : Int = last_pos
  let mut _yy_p2_1 : Int = last_pos
  for pc = entry {
    match pc {
      0 =>
        ({
          ()
          // run state 0
          if lookahead is None {
            if cursor < tokens.length() {
              let (token, sp, ep) = tokens[cursor]
              cursor += 1
              let (symbol, payload) = yy_input(token, sp, ep)
              lookahead = Some((symbol, (payload, sp, ep), Some(token)))
            } else {
              lookahead = Some((0, (YYObj_Void, last_pos, last_pos), None))
            }
          }
          continue match lookahead.unwrap().0 {
              0 => 2
              _ => 8
            }
        })
      1 =>
        ({
          ()
          // run state 2
          if lookahead is None {
            if cursor < tokens.length() {
              let (token, sp, ep) = tokens[cursor]
              cursor += 1
              let (symbol, payload) = yy_input(token, sp, ep)
              lookahead = Some((symbol, (payload, sp, ep), Some(token)))
            } else {
              lookahead = Some((0, (YYObj_Void, last_pos, last_pos), None))
            }
          }
          continue match lookahead.unwrap().0 {
              0 => 4
              _ => 10
            }
        })
      2 =>
        ({
          ()
          // reduce unit -> 
          _yy_p2_0 = last_pos
          _yy_p1_0 = yy_action_1(_yy_p2_0, [])
          _yy_p0_0 = states.unsafe_head()
          _yy_p2_1 = _yy_p2_0
          continue 3
        })
      3 =>
        ({
          ()
          // goto unit
          continue match _yy_p0_0 {
              0 => 6
              _ => panic()
            }
        })
      4 =>
        ({
          ()
          // reduce position -> 
          _yy_p2_0 = last_pos
          _yy_p1_0 = yy_action_0(_yy_p2_0, [])
          _yy_p0_0 = states.unsafe_head()
          _yy_p2_1 = _yy_p2_0
          continue 5
        })
      5 =>
        ({
          ()
          // goto position
          continue match _yy_p0_0 {
              2 => 7
              _ => panic()
            }
        })
      6 =>
        ({
          ()
          states = @list.cons(1, states)
          data.push((_yy_p1_0, _yy_p2_0, _yy_p2_1))
          continue 9
        })
      7 =>
        ({
          ()
          states = @list.cons(3, states)
          data.push((_yy_p1_0, _yy_p2_0, _yy_p2_1))
          continue 11
        })
      8 =>
        ({
          ()
          let (_, (_, sp, ep), token) = lookahead.unwrap()
          yy_error(error_stack, token, (sp, ep))
          panic()
        })
      9 =>
        ({
          ()
          let _yy_r20 = data[data.length() - 1].0
          return _yy_r20
        })
      10 =>
        ({
          ()
          let (_, (_, sp, ep), token) = lookahead.unwrap()
          yy_error(error_stack, token, (sp, ep))
          panic()
        })
      11 =>
        ({
          ()
          let _yy_r21 = data[data.length() - 1].0
          return _yy_r21
        })
      _ => panic()
    }
  }
}

///|
pub fn position(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Int raise ParseError {
  let result = yy_parse(tokens, 1, 2, initial_pos?)
  guard! result is YYObj_Int(result)
  result
}

///|
pub fn unit(tokens : Array[(Token, Int, Int)], initial_pos? : Int) -> Unit raise ParseError {
  let result = yy_parse(tokens, 0, 0, initial_pos?)
  guard! result is YYObj_Unit(result)
  result
}

///|
#inline(never)
fn yy_diagnostic(state : Int, _symbol : Int) -> (Int, Int, Int) {
  match state {
    0 =>
      match _symbol {
        0 => (3, 0, 2)
        2 => (2, 1, 0)
        _ => (0, 0, 0)
      }
    1 => (1, 0, 0)
    2 =>
      match _symbol {
        0 => (3, 0, 1)
        1 => (2, 3, 0)
        _ => (0, 0, 0)
      }
    3 => (1, 0, 0)
    _ => panic()
  }
}

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
fn yy_error(stack : @list.List[Int], token : Token?, loc : (Int, Int)) -> Unit raise ParseError {
  let expected = []
  for (symbol, kind) in ([] : Array[(Int, TokenKind)]) {
    if yy_expected(stack, symbol) {
      expected.push(kind)
    }
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
