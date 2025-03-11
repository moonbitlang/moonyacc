///|
struct Lexbuf {
  content : String
  mut pos : Int
}

///|
pub fn Lexbuf::from_string(content : String) -> Lexbuf {
  { content, pos: 0 }
}

// NOTE: MoonBit do have unboxed Option[Char] optimization
///|
fn next(self : Lexbuf) -> Char? {
  if self.pos < self.content.length() {
    let ch = self.content[self.pos]
    self.pos += 1
    Some(ch)
  } else {
    None
  }
}

///|
fn substring(self : Lexbuf, start : Int, end : Int) -> String {
  self.content.substring(start~, end~)
}

///|
typealias LexTagAction = Array[Array[Int]]

///|
typealias LexState = Int

///|
typealias LexInput = Int

///|
pub(all) struct LexEngine {
  graph : Array[(LexState) -> (LexState, LexTagAction)]
  end_nodes : Array[(Int, Array[((Int, Int), (Int, Int))])?]
  start_tags : Array[Int]
  code_blocks_n : Int
}

///|
pub fn run(self : LexEngine, lexbuf : Lexbuf) -> (Int, Array[(Int, Int)]) {
  let mut state = 0
  let mut tagState : Array[Array[Int]] = []
  let backtrace = Array::make(self.code_blocks_n, None)
  for tag in self.start_tags {
    while tagState.length() <= tag {
      tagState.push([])
    }
    tagState[tag].push(lexbuf.pos)
  }
  while state != -1 {
    match self.end_nodes[state] {
      Some(t) => backtrace[t.0] = Some((lexbuf.pos, state, tagState))
      _ => ()
    }
    let b = match lexbuf.next() {
      Some(b) => b.to_int()
      None => -1
    }
    let next = self.graph[state](b)
    state = next.0
    let new_tagState : Array[Array[Int]] = []
    for i = 0; i < next.1.length(); i = i + 1 {
      new_tagState.push([])
      for j = 0; j < next.1[i].length(); j = j + 1 {
        let t = next.1[i][j]
        if t == -1 {
          new_tagState[i].push(lexbuf.pos)
        } else {
          new_tagState[i].push(tagState[i][t])
        }
      }
    }
    tagState = new_tagState
  }
  for index, b in backtrace {
    match b {
      Some((p, state, tagState)) => {
        lexbuf.pos = p
        let captures = self.end_nodes[state].unwrap().1.map(fn {
          ((b_t, b_r), (e_t, e_r)) => (tagState[b_t][b_r], tagState[e_t][e_r])
        })
        break (index, captures)
      }
      None => ()
    }
  } else {
    (self.code_blocks_n, [])
  }
}

///|
pub type! LexError {
  UnexpectedEndOfFile
  Unrecognized(String)
}

///|
struct Lexer {
  buf : Lexbuf
  // 0 %%
  // %% 1
  // %% %% 2
  phase : Ref[Int]
}

///|
let token_tag_action_row_0 : Array[Int] = []

///|
let token_tag_action_row_2 : Array[Int] = [-1]

///|
let token_tag_action_row_1 : Array[Int] = [0]

///|
let token_tag_action_row_3 : Array[Int] = [-1, 0]

///|
let token_tag_action_13 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_0 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_2,
]

///|
let token_tag_action_1 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_14 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_3 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_27 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_2,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_11 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_8 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_2,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_26 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_7 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_2,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_9 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_12 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_2,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_6 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_5 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_15 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_33 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_28 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_1, token_tag_action_row_2,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_17 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_2,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_19 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_40 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_18 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_41 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_2,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_30 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_34 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_21 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_43 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_2,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_23 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_39 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_20 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_35 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_2,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_29 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_22 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_42 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_32 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_36 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_2,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_31 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_25 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_37 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_24 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_4 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_38 : Array[Array[Int]] = [
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_1, token_tag_action_row_2,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_2 : Array[Array[Int]] = [
  token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_0,
  token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_0,
  token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_0,
  token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_0,
  token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_0,
  token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_0,
  token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_0,
  token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_0,
  token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_0,
  token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_2, token_tag_action_row_0,
  token_tag_action_row_3, token_tag_action_row_2, token_tag_action_row_2, token_tag_action_row_0,
]

///|
let token_tag_action_16 : Array[Array[Int]] = [
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
]

///|
let token_tag_action_10 : Array[Array[Int]] = [
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0, token_tag_action_row_0,
  token_tag_action_row_1, token_tag_action_row_2, token_tag_action_row_0, token_tag_action_row_0,
]

///|
fn token_state_0(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    -1 => (1, token_tag_action_0)
    0..=8 => (14, token_tag_action_1)
    9..=10 => (10, token_tag_action_2)
    11..=31 => (14, token_tag_action_1)
    32 => (10, token_tag_action_2)
    33 => (14, token_tag_action_1)
    34 => (9, token_tag_action_3)
    35..=36 => (14, token_tag_action_1)
    37 => (15, token_tag_action_4)
    38..=39 => (14, token_tag_action_1)
    40 => (3, token_tag_action_1)
    41..=44 => (14, token_tag_action_1)
    45 => (11, token_tag_action_5)
    46 => (14, token_tag_action_1)
    47 => (4, token_tag_action_1)
    48..=57 => (14, token_tag_action_1)
    58 => (5, token_tag_action_6)
    59 => (8, token_tag_action_7)
    60 => (7, token_tag_action_8)
    61 => (6, token_tag_action_9)
    62..=64 => (14, token_tag_action_1)
    65..=90 => (12, token_tag_action_10)
    91..=94 => (14, token_tag_action_1)
    95 => (12, token_tag_action_10)
    96 => (14, token_tag_action_1)
    97..=122 => (12, token_tag_action_10)
    123 => (2, token_tag_action_11)
    124 => (13, token_tag_action_12)
    125..=1114111 => (14, token_tag_action_1)
    _ => (-1, [])
  }
}

///|
fn token_state_1(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_2(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_3(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    42 => (16, token_tag_action_13)
    _ => (-1, [])
  }
}

///|
fn token_state_4(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    42 => (17, token_tag_action_13)
    _ => (-1, [])
  }
}

///|
fn token_state_5(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_6(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_7(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_8(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_9(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    0..=33 => (18, token_tag_action_14)
    35..=1114111 => (18, token_tag_action_14)
    _ => (-1, [])
  }
}

///|
fn token_state_10(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    -1 => (1, token_tag_action_0)
    0..=8 => (14, token_tag_action_1)
    9..=10 => (10, token_tag_action_2)
    11..=31 => (14, token_tag_action_1)
    32 => (10, token_tag_action_2)
    33 => (14, token_tag_action_1)
    34 => (9, token_tag_action_3)
    35..=36 => (14, token_tag_action_1)
    37 => (15, token_tag_action_4)
    38..=39 => (14, token_tag_action_1)
    40 => (3, token_tag_action_1)
    41..=44 => (14, token_tag_action_1)
    45 => (11, token_tag_action_5)
    46 => (14, token_tag_action_1)
    47 => (4, token_tag_action_1)
    48..=57 => (14, token_tag_action_1)
    58 => (5, token_tag_action_6)
    59 => (8, token_tag_action_7)
    60 => (7, token_tag_action_8)
    61 => (6, token_tag_action_9)
    62..=64 => (14, token_tag_action_1)
    65..=90 => (12, token_tag_action_10)
    91..=94 => (14, token_tag_action_1)
    95 => (12, token_tag_action_10)
    96 => (14, token_tag_action_1)
    97..=122 => (12, token_tag_action_10)
    123 => (2, token_tag_action_11)
    124 => (13, token_tag_action_12)
    125..=1114111 => (14, token_tag_action_1)
    _ => (-1, [])
  }
}

///|
fn token_state_11(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    62 => (19, token_tag_action_15)
    _ => (-1, [])
  }
}

///|
fn token_state_12(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (20, token_tag_action_16)
    65..=90 => (20, token_tag_action_16)
    95 => (20, token_tag_action_16)
    97..=122 => (20, token_tag_action_16)
    _ => (-1, [])
  }
}

///|
fn token_state_13(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_14(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_15(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    37 => (22, token_tag_action_17)
    100 => (29, token_tag_action_18)
    105 => (21, token_tag_action_19)
    108 => (26, token_tag_action_20)
    110 => (24, token_tag_action_21)
    112 => (23, token_tag_action_22)
    114 => (30, token_tag_action_23)
    115 => (28, token_tag_action_24)
    116 => (27, token_tag_action_25)
    123 => (25, token_tag_action_26)
    _ => (-1, [])
  }
}

///|
fn token_state_16(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    41 => (31, token_tag_action_13)
    _ => (-1, [])
  }
}

///|
fn token_state_17(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    0..=41 => (34, token_tag_action_13)
    42 => (33, token_tag_action_13)
    43..=46 => (34, token_tag_action_13)
    47 => (32, token_tag_action_13)
    48..=1114111 => (34, token_tag_action_13)
    _ => (-1, [])
  }
}

///|
fn token_state_18(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    0..=33 => (18, token_tag_action_14)
    34 => (35, token_tag_action_27)
    35..=1114111 => (18, token_tag_action_14)
    _ => (-1, [])
  }
}

///|
fn token_state_19(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    0..=8 => (37, token_tag_action_28)
    9..=10 => (36, token_tag_action_15)
    11..=31 => (37, token_tag_action_28)
    32 => (36, token_tag_action_15)
    33..=57 => (37, token_tag_action_28)
    59..=1114111 => (37, token_tag_action_28)
    _ => (-1, [])
  }
}

///|
fn token_state_20(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (20, token_tag_action_16)
    65..=90 => (20, token_tag_action_16)
    95 => (20, token_tag_action_16)
    97..=122 => (20, token_tag_action_16)
    _ => (-1, [])
  }
}

///|
fn token_state_21(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    110 => (38, token_tag_action_19)
    _ => (-1, [])
  }
}

///|
fn token_state_22(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_23(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    111 => (40, token_tag_action_29)
    114 => (39, token_tag_action_30)
    _ => (-1, [])
  }
}

///|
fn token_state_24(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    111 => (41, token_tag_action_21)
    _ => (-1, [])
  }
}

///|
fn token_state_25(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_26(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    101 => (42, token_tag_action_20)
    _ => (-1, [])
  }
}

///|
fn token_state_27(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    111 => (44, token_tag_action_31)
    121 => (43, token_tag_action_32)
    _ => (-1, [])
  }
}

///|
fn token_state_28(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    116 => (45, token_tag_action_24)
    _ => (-1, [])
  }
}

///|
fn token_state_29(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    101 => (46, token_tag_action_18)
    _ => (-1, [])
  }
}

///|
fn token_state_30(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    105 => (47, token_tag_action_23)
    _ => (-1, [])
  }
}

///|
fn token_state_31(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_32(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    0..=41 => (48, token_tag_action_13)
    43..=1114111 => (48, token_tag_action_13)
    _ => (-1, [])
  }
}

///|
fn token_state_33(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    0..=41 => (34, token_tag_action_13)
    42 => (33, token_tag_action_13)
    43..=46 => (34, token_tag_action_13)
    47 => (49, token_tag_action_13)
    48..=1114111 => (34, token_tag_action_13)
    _ => (-1, [])
  }
}

///|
fn token_state_34(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    0..=41 => (34, token_tag_action_13)
    42 => (33, token_tag_action_13)
    43..=46 => (34, token_tag_action_13)
    47 => (32, token_tag_action_13)
    48..=1114111 => (34, token_tag_action_13)
    _ => (-1, [])
  }
}

///|
fn token_state_35(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_36(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    0..=8 => (37, token_tag_action_28)
    9..=10 => (36, token_tag_action_15)
    11..=31 => (37, token_tag_action_28)
    32 => (36, token_tag_action_15)
    33..=57 => (37, token_tag_action_28)
    59..=1114111 => (37, token_tag_action_28)
    _ => (-1, [])
  }
}

///|
fn token_state_37(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    0..=57 => (50, token_tag_action_33)
    59..=1114111 => (50, token_tag_action_33)
    _ => (-1, [])
  }
}

///|
fn token_state_38(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    108 => (51, token_tag_action_19)
    _ => (-1, [])
  }
}

///|
fn token_state_39(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    101 => (52, token_tag_action_30)
    _ => (-1, [])
  }
}

///|
fn token_state_40(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    115 => (53, token_tag_action_29)
    _ => (-1, [])
  }
}

///|
fn token_state_41(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    110 => (54, token_tag_action_21)
    _ => (-1, [])
  }
}

///|
fn token_state_42(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    102 => (55, token_tag_action_20)
    _ => (-1, [])
  }
}

///|
fn token_state_43(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    112 => (56, token_tag_action_32)
    _ => (-1, [])
  }
}

///|
fn token_state_44(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    107 => (57, token_tag_action_31)
    _ => (-1, [])
  }
}

///|
fn token_state_45(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    97 => (58, token_tag_action_24)
    _ => (-1, [])
  }
}

///|
fn token_state_46(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    114 => (59, token_tag_action_18)
    _ => (-1, [])
  }
}

///|
fn token_state_47(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    103 => (60, token_tag_action_23)
    _ => (-1, [])
  }
}

///|
fn token_state_48(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    0..=41 => (34, token_tag_action_13)
    42 => (33, token_tag_action_13)
    43..=46 => (34, token_tag_action_13)
    47 => (32, token_tag_action_13)
    48..=1114111 => (34, token_tag_action_13)
    _ => (-1, [])
  }
}

///|
fn token_state_49(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    0..=41 => (48, token_tag_action_13)
    43..=1114111 => (48, token_tag_action_13)
    _ => (-1, [])
  }
}

///|
fn token_state_50(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    0..=8 => (61, token_tag_action_28)
    9..=10 => (50, token_tag_action_33)
    11..=31 => (61, token_tag_action_28)
    32 => (50, token_tag_action_33)
    33..=57 => (61, token_tag_action_28)
    59..=1114111 => (61, token_tag_action_28)
    _ => (-1, [])
  }
}

///|
fn token_state_51(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    105 => (62, token_tag_action_19)
    _ => (-1, [])
  }
}

///|
fn token_state_52(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    99 => (63, token_tag_action_34)
    _ => (-1, [])
  }
}

///|
fn token_state_53(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    105 => (64, token_tag_action_29)
    _ => (-1, [])
  }
}

///|
fn token_state_54(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    97 => (65, token_tag_action_21)
    _ => (-1, [])
  }
}

///|
fn token_state_55(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    116 => (66, token_tag_action_35)
    _ => (-1, [])
  }
}

///|
fn token_state_56(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    101 => (67, token_tag_action_36)
    _ => (-1, [])
  }
}

///|
fn token_state_57(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    101 => (68, token_tag_action_31)
    _ => (-1, [])
  }
}

///|
fn token_state_58(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    114 => (69, token_tag_action_24)
    _ => (-1, [])
  }
}

///|
fn token_state_59(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    105 => (70, token_tag_action_18)
    _ => (-1, [])
  }
}

///|
fn token_state_60(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    104 => (71, token_tag_action_23)
    _ => (-1, [])
  }
}

///|
fn token_state_61(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    0..=8 => (61, token_tag_action_28)
    9..=10 => (50, token_tag_action_33)
    11..=31 => (61, token_tag_action_28)
    32 => (50, token_tag_action_33)
    33..=57 => (61, token_tag_action_28)
    59..=1114111 => (61, token_tag_action_28)
    _ => (-1, [])
  }
}

///|
fn token_state_62(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    110 => (72, token_tag_action_19)
    _ => (-1, [])
  }
}

///|
fn token_state_63(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_64(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    116 => (73, token_tag_action_29)
    _ => (-1, [])
  }
}

///|
fn token_state_65(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    115 => (74, token_tag_action_21)
    _ => (-1, [])
  }
}

///|
fn token_state_66(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_67(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_68(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    110 => (75, token_tag_action_37)
    _ => (-1, [])
  }
}

///|
fn token_state_69(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    116 => (76, token_tag_action_38)
    _ => (-1, [])
  }
}

///|
fn token_state_70(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    118 => (77, token_tag_action_18)
    _ => (-1, [])
  }
}

///|
fn token_state_71(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    116 => (78, token_tag_action_39)
    _ => (-1, [])
  }
}

///|
fn token_state_72(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    101 => (79, token_tag_action_40)
    _ => (-1, [])
  }
}

///|
fn token_state_73(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    105 => (80, token_tag_action_29)
    _ => (-1, [])
  }
}

///|
fn token_state_74(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    115 => (81, token_tag_action_21)
    _ => (-1, [])
  }
}

///|
fn token_state_75(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_76(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_77(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    101 => (82, token_tag_action_41)
    _ => (-1, [])
  }
}

///|
fn token_state_78(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_79(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_80(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    111 => (83, token_tag_action_29)
    _ => (-1, [])
  }
}

///|
fn token_state_81(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    111 => (84, token_tag_action_21)
    _ => (-1, [])
  }
}

///|
fn token_state_82(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_83(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    110 => (85, token_tag_action_42)
    _ => (-1, [])
  }
}

///|
fn token_state_84(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    99 => (86, token_tag_action_43)
    _ => (-1, [])
  }
}

///|
fn token_state_85(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn token_state_86(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
let __mbtlex_engine_token : LexEngine = {
  graph: [
    token_state_0, token_state_1, token_state_2, token_state_3, token_state_4, token_state_5,
    token_state_6, token_state_7, token_state_8, token_state_9, token_state_10, token_state_11,
    token_state_12, token_state_13, token_state_14, token_state_15, token_state_16,
    token_state_17, token_state_18, token_state_19, token_state_20, token_state_21,
    token_state_22, token_state_23, token_state_24, token_state_25, token_state_26,
    token_state_27, token_state_28, token_state_29, token_state_30, token_state_31,
    token_state_32, token_state_33, token_state_34, token_state_35, token_state_36,
    token_state_37, token_state_38, token_state_39, token_state_40, token_state_41,
    token_state_42, token_state_43, token_state_44, token_state_45, token_state_46,
    token_state_47, token_state_48, token_state_49, token_state_50, token_state_51,
    token_state_52, token_state_53, token_state_54, token_state_55, token_state_56,
    token_state_57, token_state_58, token_state_59, token_state_60, token_state_61,
    token_state_62, token_state_63, token_state_64, token_state_65, token_state_66,
    token_state_67, token_state_68, token_state_69, token_state_70, token_state_71,
    token_state_72, token_state_73, token_state_74, token_state_75, token_state_76,
    token_state_77, token_state_78, token_state_79, token_state_80, token_state_81,
    token_state_82, token_state_83, token_state_84, token_state_85, token_state_86,
  ],
  end_nodes: [
    None,
    Some((26, [((46, 0), (47, 0))])),
    Some((23, [((40, 0), (41, 0))])),
    Some((25, [((44, 0), (45, 0))])),
    Some((25, [((44, 0), (45, 0))])),
    Some((17, [((28, 0), (29, 0))])),
    Some((19, [((32, 0), (33, 0))])),
    Some((22, [((38, 0), (39, 0))])),
    Some((20, [((34, 0), (35, 0))])),
    Some((25, [((44, 0), (45, 0))])),
    Some((0, [])),
    Some((25, [((44, 0), (45, 0))])),
    Some((4, [((0, 0), (1, 0))])),
    Some((18, [((30, 0), (31, 0))])),
    Some((25, [((44, 0), (45, 0))])),
    Some((25, [((44, 0), (45, 0))])),
    Some((2, [])),
    None,
    None,
    None,
    Some((4, [((0, 0), (1, 0))])),
    None,
    Some((15, [((22, 0), (23, 0))])),
    None,
    None,
    Some((21, [((36, 0), (37, 0))])),
    None,
    None,
    None,
    None,
    None,
    Some((1, [])),
    None,
    None,
    None,
    Some((24, [((42, 0), (43, 0))])),
    None,
    Some((16, [((24, 0), (25, 0)), ((26, 0), (27, 0))])),
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    Some((3, [])),
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    Some((16, [((24, 0), (25, 0)), ((26, 0), (27, 0))])),
    None,
    Some((12, [((16, 0), (17, 0))])),
    None,
    None,
    Some((9, [((10, 0), (11, 0))])),
    Some((7, [((6, 0), (7, 0))])),
    None,
    None,
    None,
    None,
    None,
    None,
    None,
    Some((6, [((4, 0), (5, 0))])),
    Some((5, [((2, 0), (3, 0))])),
    None,
    Some((10, [((12, 0), (13, 0))])),
    Some((14, [((20, 0), (21, 0))])),
    None,
    None,
    Some((13, [((18, 0), (19, 0))])),
    None,
    None,
    Some((8, [((8, 0), (9, 0))])),
    Some((11, [((14, 0), (15, 0))])),
  ],
  start_tags: [
    0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 28, 30, 32, 34, 36, 38, 40, 42,
    44, 46,
  ],
  code_blocks_n: 27,
}

///|
fn token(phase : Ref[Int], lexbuf : Lexbuf) -> (Token, Int, Int)!LexError {
  match __mbtlex_engine_token.run(lexbuf) {
    (0, __mbtlex_captures) => token!(phase, lexbuf)
    (1, __mbtlex_captures) => token!(phase, lexbuf)
    (2, __mbtlex_captures) => {
      comment_star_rparen!(lexbuf)
      token!(phase, lexbuf)
    }
    (3, __mbtlex_captures) => token!(phase, lexbuf)
    (4, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      (IDENT(t), _start_pos_of_t, _end_pos_of_t)
    }
    (5, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      (PERCENT_START, _start_pos_of_t, _end_pos_of_t)
    }
    (6, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      (PERCENT_TOKEN, _start_pos_of_t, _end_pos_of_t)
    }
    (7, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      (PERCENT_TYPE, _start_pos_of_t, _end_pos_of_t)
    }
    (8, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      (PERCENT_POSITION, _start_pos_of_t, _end_pos_of_t)
    }
    (9, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      (PERCENT_LEFT, _start_pos_of_t, _end_pos_of_t)
    }
    (10, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      (PERCENT_RIGHT, _start_pos_of_t, _end_pos_of_t)
    }
    (11, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      (PERCENT_NONASSOC, _start_pos_of_t, _end_pos_of_t)
    }
    (12, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      (PERCENT_PREC, _start_pos_of_t, _end_pos_of_t)
    }
    (13, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      (PERCENT_DERIVE, _start_pos_of_t, _end_pos_of_t)
    }
    (14, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      (PERCENT_INLINE, _start_pos_of_t, _end_pos_of_t)
    }
    (15, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      if phase.val <= 0 {
        phase.val += 1
        (PERCENT_PERCENT, _start_pos_of_t, _end_pos_of_t)
      } else {
        phase.val += 1
        let sb = StringBuilder::new()
        code_eof(sb, lexbuf)
        (
          PERCENT_PERCENT_CODE_EOF(sb.to_string()),
          _start_pos_of_t,
          _end_pos_of_t,
        )
      }
    }
    (16, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      let (_start_pos_of_t2, _end_pos_of_t2) = __mbtlex_captures[1]
      let t2 : String = lexbuf.substring(_start_pos_of_t2, _end_pos_of_t2)
      (ARROW_CODE(t2), _start_pos_of_t, _end_pos_of_t)
    }
    (17, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      (COLON, _start_pos_of_t, _end_pos_of_t)
    }
    (18, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      (BAR, _start_pos_of_t, _end_pos_of_t)
    }
    (19, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      (EQ, _start_pos_of_t, _end_pos_of_t)
    }
    (20, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      (SEMI, _start_pos_of_t, _end_pos_of_t)
    }
    (21, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      let sb = StringBuilder::new()
      code_percent_rbrace!(sb, lexbuf)
      (
        PERCENT_LBRACE_CODE_PERCENT_RBRACE(sb.to_string()),
        _start_pos_of_t,
        _end_pos_of_t,
      )
    }
    (22, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      let sb = StringBuilder::new()
      code_rangle!(sb, lexbuf)
      (LANGLE_CODE_RANGLE(sb.to_string()), _start_pos_of_t, _end_pos_of_t)
    }
    (23, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      let sb = StringBuilder::new()
      let subst = []
      let base = lexbuf.pos
      code_rbrace!(sb, subst, base, lexbuf)
      (
        LBRACE_CODE_RBRACE((sb.to_string(), base, subst)),
        _start_pos_of_t,
        lexbuf.pos,
      )
    }
    (24, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      (STRING(t), _start_pos_of_t, _end_pos_of_t)
    }
    (25, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      raise Unrecognized(t)
    }
    (26, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      (EOF, _start_pos_of_t, _end_pos_of_t)
    }
    _ => abort("lex: fail to match")
  }
}

///|
let comment_star_rparen_tag_action_0 : Array[Array[Int]] = []

///|
fn comment_star_rparen_state_0(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    -1 => (1, comment_star_rparen_tag_action_0)
    0..=39 => (2, comment_star_rparen_tag_action_0)
    40 => (4, comment_star_rparen_tag_action_0)
    41 => (2, comment_star_rparen_tag_action_0)
    42 => (3, comment_star_rparen_tag_action_0)
    43..=1114111 => (2, comment_star_rparen_tag_action_0)
    _ => (-1, [])
  }
}

///|
fn comment_star_rparen_state_1(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn comment_star_rparen_state_2(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn comment_star_rparen_state_3(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    41 => (5, comment_star_rparen_tag_action_0)
    _ => (-1, [])
  }
}

///|
fn comment_star_rparen_state_4(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    42 => (6, comment_star_rparen_tag_action_0)
    _ => (-1, [])
  }
}

///|
fn comment_star_rparen_state_5(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn comment_star_rparen_state_6(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
let __mbtlex_engine_comment_star_rparen : LexEngine = {
  graph: [
    comment_star_rparen_state_0, comment_star_rparen_state_1, comment_star_rparen_state_2,
    comment_star_rparen_state_3, comment_star_rparen_state_4, comment_star_rparen_state_5,
    comment_star_rparen_state_6,
  ],
  end_nodes: [
    None,
    Some((3, [])),
    Some((2, [])),
    Some((2, [])),
    Some((2, [])),
    Some((1, [])),
    Some((0, [])),
  ],
  start_tags: [],
  code_blocks_n: 4,
}

///|
fn comment_star_rparen(lexbuf : Lexbuf) -> Unit!LexError {
  match __mbtlex_engine_comment_star_rparen.run(lexbuf) {
    (0, __mbtlex_captures) => {
      comment_star_rparen!(lexbuf)
      comment_star_rparen!(lexbuf)
    }
    (1, __mbtlex_captures) => ()
    (2, __mbtlex_captures) => comment_star_rparen!(lexbuf)
    (3, __mbtlex_captures) => raise UnexpectedEndOfFile
    _ => abort("lex: fail to match")
  }
}

///|
let code_eof_tag_action_row_0 : Array[Int] = []

///|
let code_eof_tag_action_row_2 : Array[Int] = [-1]

///|
let code_eof_tag_action_row_1 : Array[Int] = [0]

///|
let code_eof_tag_action_0 : Array[Array[Int]] = [
  code_eof_tag_action_row_0, code_eof_tag_action_row_0,
]

///|
let code_eof_tag_action_1 : Array[Array[Int]] = [
  code_eof_tag_action_row_1, code_eof_tag_action_row_2,
]

///|
fn code_eof_state_0(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    -1 => (2, code_eof_tag_action_0)
    0..=1114111 => (1, code_eof_tag_action_1)
    _ => (-1, [])
  }
}

///|
fn code_eof_state_1(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn code_eof_state_2(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
let __mbtlex_engine_code_eof : LexEngine = {
  graph: [code_eof_state_0, code_eof_state_1, code_eof_state_2],
  end_nodes: [None, Some((0, [((0, 0), (1, 0))])), Some((1, []))],
  start_tags: [0],
  code_blocks_n: 2,
}

///|
fn code_eof(sb : StringBuilder, lexbuf : Lexbuf) -> Unit {
  match __mbtlex_engine_code_eof.run(lexbuf) {
    (0, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      sb.write_string(t)
      code_eof(sb, lexbuf)
    }
    (1, __mbtlex_captures) => ()
    _ => abort("lex: fail to match")
  }
}

///|
let code_percent_rbrace_tag_action_row_0 : Array[Int] = []

///|
let code_percent_rbrace_tag_action_row_2 : Array[Int] = [-1]

///|
let code_percent_rbrace_tag_action_row_1 : Array[Int] = [0]

///|
let code_percent_rbrace_tag_action_0 : Array[Array[Int]] = [
  code_percent_rbrace_tag_action_row_0, code_percent_rbrace_tag_action_row_0,
]

///|
let code_percent_rbrace_tag_action_1 : Array[Array[Int]] = [
  code_percent_rbrace_tag_action_row_1, code_percent_rbrace_tag_action_row_2,
]

///|
fn code_percent_rbrace_state_0(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    -1 => (2, code_percent_rbrace_tag_action_0)
    0..=36 => (1, code_percent_rbrace_tag_action_1)
    37 => (3, code_percent_rbrace_tag_action_1)
    38..=1114111 => (1, code_percent_rbrace_tag_action_1)
    _ => (-1, [])
  }
}

///|
fn code_percent_rbrace_state_1(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn code_percent_rbrace_state_2(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn code_percent_rbrace_state_3(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    125 => (4, code_percent_rbrace_tag_action_0)
    _ => (-1, [])
  }
}

///|
fn code_percent_rbrace_state_4(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
let __mbtlex_engine_code_percent_rbrace : LexEngine = {
  graph: [
    code_percent_rbrace_state_0, code_percent_rbrace_state_1, code_percent_rbrace_state_2,
    code_percent_rbrace_state_3, code_percent_rbrace_state_4,
  ],
  end_nodes: [
    None,
    Some((1, [((0, 0), (1, 0))])),
    Some((2, [])),
    Some((1, [((0, 0), (1, 0))])),
    Some((0, [])),
  ],
  start_tags: [0],
  code_blocks_n: 3,
}

///|
fn code_percent_rbrace(sb : StringBuilder, lexbuf : Lexbuf) -> Unit!LexError {
  match __mbtlex_engine_code_percent_rbrace.run(lexbuf) {
    (0, __mbtlex_captures) => ()
    (1, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      sb.write_string(t)
      code_percent_rbrace!(sb, lexbuf)
    }
    (2, __mbtlex_captures) => raise UnexpectedEndOfFile
    _ => abort("lex: fail to match")
  }
}

///|
let code_rangle_tag_action_row_0 : Array[Int] = []

///|
let code_rangle_tag_action_row_2 : Array[Int] = [-1]

///|
let code_rangle_tag_action_row_1 : Array[Int] = [0]

///|
let code_rangle_tag_action_0 : Array[Array[Int]] = [
  code_rangle_tag_action_row_0, code_rangle_tag_action_row_0,
]

///|
let code_rangle_tag_action_1 : Array[Array[Int]] = [
  code_rangle_tag_action_row_1, code_rangle_tag_action_row_2,
]

///|
fn code_rangle_state_0(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    -1 => (2, code_rangle_tag_action_0)
    0..=61 => (1, code_rangle_tag_action_1)
    62 => (3, code_rangle_tag_action_1)
    63..=1114111 => (1, code_rangle_tag_action_1)
    _ => (-1, [])
  }
}

///|
fn code_rangle_state_1(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn code_rangle_state_2(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn code_rangle_state_3(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
let __mbtlex_engine_code_rangle : LexEngine = {
  graph: [
    code_rangle_state_0, code_rangle_state_1, code_rangle_state_2, code_rangle_state_3,
  ],
  end_nodes: [None, Some((1, [((0, 0), (1, 0))])), Some((2, [])), Some((0, []))],
  start_tags: [0],
  code_blocks_n: 3,
}

///|
fn code_rangle(sb : StringBuilder, lexbuf : Lexbuf) -> Unit!LexError {
  match __mbtlex_engine_code_rangle.run(lexbuf) {
    (0, __mbtlex_captures) => ()
    (1, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      sb.write_string(t)
      code_rangle!(sb, lexbuf)
    }
    (2, __mbtlex_captures) => raise UnexpectedEndOfFile
    _ => abort("lex: fail to match")
  }
}

///|
let code_rbrace_tag_action_row_0 : Array[Int] = []

///|
let code_rbrace_tag_action_row_2 : Array[Int] = [-1]

///|
let code_rbrace_tag_action_row_1 : Array[Int] = [0]

///|
let code_rbrace_tag_action_0 : Array[Array[Int]] = [
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
]

///|
let code_rbrace_tag_action_1 : Array[Array[Int]] = [
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_2,
]

///|
let code_rbrace_tag_action_4 : Array[Array[Int]] = [
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1,
  code_rbrace_tag_action_row_2, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
]

///|
let code_rbrace_tag_action_6 : Array[Array[Int]] = [
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1,
  code_rbrace_tag_action_row_2, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
]

///|
let code_rbrace_tag_action_9 : Array[Array[Int]] = [
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_2,
  code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_2, code_rbrace_tag_action_row_1,
  code_rbrace_tag_action_row_2, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
]

///|
let code_rbrace_tag_action_5 : Array[Array[Int]] = [
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1,
  code_rbrace_tag_action_row_2, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
]

///|
let code_rbrace_tag_action_7 : Array[Array[Int]] = [
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_2, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_2,
  code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_2, code_rbrace_tag_action_row_1,
  code_rbrace_tag_action_row_2, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
]

///|
let code_rbrace_tag_action_8 : Array[Array[Int]] = [
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_2,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
]

///|
let code_rbrace_tag_action_10 : Array[Array[Int]] = [
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_1,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
]

///|
let code_rbrace_tag_action_11 : Array[Array[Int]] = [
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_1,
  code_rbrace_tag_action_row_2, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
]

///|
let code_rbrace_tag_action_12 : Array[Array[Int]] = [
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_1,
  code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
]

///|
let code_rbrace_tag_action_13 : Array[Array[Int]] = [
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_2,
  code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_1,
  code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
]

///|
let code_rbrace_tag_action_2 : Array[Array[Int]] = [
  code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_2,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_2, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_2, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_2,
]

///|
let code_rbrace_tag_action_3 : Array[Array[Int]] = [
  code_rbrace_tag_action_row_1, code_rbrace_tag_action_row_2, code_rbrace_tag_action_row_1,
  code_rbrace_tag_action_row_2, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
  code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0, code_rbrace_tag_action_row_0,
]

///|
fn code_rbrace_state_0(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    -1 => (2, code_rbrace_tag_action_0)
    0..=35 => (1, code_rbrace_tag_action_1)
    36 => (5, code_rbrace_tag_action_2)
    37..=122 => (1, code_rbrace_tag_action_1)
    123 => (4, code_rbrace_tag_action_1)
    124 => (1, code_rbrace_tag_action_1)
    125 => (3, code_rbrace_tag_action_1)
    126..=1114111 => (1, code_rbrace_tag_action_1)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_1(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_2(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_3(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_4(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_5(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (10, code_rbrace_tag_action_3)
    65..=90 => (6, code_rbrace_tag_action_4)
    95 => (6, code_rbrace_tag_action_4)
    97..=100 => (6, code_rbrace_tag_action_4)
    101 => (8, code_rbrace_tag_action_5)
    102..=107 => (6, code_rbrace_tag_action_4)
    108 => (7, code_rbrace_tag_action_5)
    109..=114 => (6, code_rbrace_tag_action_4)
    115 => (9, code_rbrace_tag_action_5)
    116..=122 => (6, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_6(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_7(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=110 => (11, code_rbrace_tag_action_4)
    111 => (12, code_rbrace_tag_action_5)
    112..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_8(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=109 => (11, code_rbrace_tag_action_4)
    110 => (13, code_rbrace_tag_action_5)
    111..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_9(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=107 => (11, code_rbrace_tag_action_4)
    108 => (14, code_rbrace_tag_action_6)
    109..=115 => (11, code_rbrace_tag_action_4)
    116 => (16, code_rbrace_tag_action_5)
    117..=120 => (11, code_rbrace_tag_action_4)
    121 => (15, code_rbrace_tag_action_6)
    122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_10(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (10, code_rbrace_tag_action_3)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_11(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_12(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=98 => (11, code_rbrace_tag_action_4)
    99 => (17, code_rbrace_tag_action_7)
    100..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_13(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=99 => (11, code_rbrace_tag_action_4)
    100 => (18, code_rbrace_tag_action_5)
    101..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_14(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=110 => (11, code_rbrace_tag_action_4)
    111 => (19, code_rbrace_tag_action_6)
    112..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_15(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=108 => (11, code_rbrace_tag_action_4)
    109 => (20, code_rbrace_tag_action_6)
    110..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_16(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97 => (21, code_rbrace_tag_action_5)
    98..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_17(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    40 => (22, code_rbrace_tag_action_8)
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_18(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=111 => (11, code_rbrace_tag_action_4)
    112 => (23, code_rbrace_tag_action_5)
    113..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_19(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=98 => (11, code_rbrace_tag_action_4)
    99 => (24, code_rbrace_tag_action_9)
    100..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_20(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97 => (11, code_rbrace_tag_action_4)
    98 => (25, code_rbrace_tag_action_6)
    99..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_21(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=113 => (11, code_rbrace_tag_action_4)
    114 => (26, code_rbrace_tag_action_5)
    115..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_22(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    9 => (27, code_rbrace_tag_action_8)
    32 => (27, code_rbrace_tag_action_8)
    36 => (29, code_rbrace_tag_action_10)
    65..=90 => (28, code_rbrace_tag_action_11)
    95 => (28, code_rbrace_tag_action_11)
    97..=122 => (28, code_rbrace_tag_action_11)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_23(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=110 => (11, code_rbrace_tag_action_4)
    111 => (30, code_rbrace_tag_action_5)
    112..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_24(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_25(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=110 => (11, code_rbrace_tag_action_4)
    111 => (31, code_rbrace_tag_action_6)
    112..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_26(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=115 => (11, code_rbrace_tag_action_4)
    116 => (32, code_rbrace_tag_action_5)
    117..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_27(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    9 => (27, code_rbrace_tag_action_8)
    32 => (27, code_rbrace_tag_action_8)
    36 => (29, code_rbrace_tag_action_10)
    65..=90 => (28, code_rbrace_tag_action_11)
    95 => (28, code_rbrace_tag_action_11)
    97..=122 => (28, code_rbrace_tag_action_11)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_28(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    9 => (34, code_rbrace_tag_action_12)
    32 => (34, code_rbrace_tag_action_12)
    41 => (35, code_rbrace_tag_action_13)
    48..=57 => (33, code_rbrace_tag_action_11)
    65..=90 => (33, code_rbrace_tag_action_11)
    95 => (33, code_rbrace_tag_action_11)
    97..=122 => (33, code_rbrace_tag_action_11)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_29(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (36, code_rbrace_tag_action_11)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_30(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=114 => (11, code_rbrace_tag_action_4)
    115 => (37, code_rbrace_tag_action_7)
    116..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_31(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=107 => (11, code_rbrace_tag_action_4)
    108 => (38, code_rbrace_tag_action_6)
    109..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_32(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=111 => (11, code_rbrace_tag_action_4)
    112 => (39, code_rbrace_tag_action_5)
    113..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_33(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    9 => (34, code_rbrace_tag_action_12)
    32 => (34, code_rbrace_tag_action_12)
    41 => (35, code_rbrace_tag_action_13)
    48..=57 => (33, code_rbrace_tag_action_11)
    65..=90 => (33, code_rbrace_tag_action_11)
    95 => (33, code_rbrace_tag_action_11)
    97..=122 => (33, code_rbrace_tag_action_11)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_34(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    9 => (34, code_rbrace_tag_action_12)
    32 => (34, code_rbrace_tag_action_12)
    41 => (35, code_rbrace_tag_action_13)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_35(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_36(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    9 => (34, code_rbrace_tag_action_12)
    32 => (34, code_rbrace_tag_action_12)
    41 => (35, code_rbrace_tag_action_13)
    48..=57 => (36, code_rbrace_tag_action_11)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_37(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    40 => (22, code_rbrace_tag_action_8)
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_38(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=114 => (11, code_rbrace_tag_action_4)
    115 => (40, code_rbrace_tag_action_6)
    116..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_39(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=110 => (11, code_rbrace_tag_action_4)
    111 => (41, code_rbrace_tag_action_5)
    112..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_40(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=115 => (11, code_rbrace_tag_action_4)
    116 => (42, code_rbrace_tag_action_6)
    117..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_41(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=114 => (11, code_rbrace_tag_action_4)
    115 => (43, code_rbrace_tag_action_7)
    116..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_42(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97 => (44, code_rbrace_tag_action_6)
    98..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_43(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    40 => (22, code_rbrace_tag_action_8)
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_44(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=113 => (11, code_rbrace_tag_action_4)
    114 => (45, code_rbrace_tag_action_6)
    115..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_45(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=115 => (11, code_rbrace_tag_action_4)
    116 => (46, code_rbrace_tag_action_6)
    117..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_46(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=111 => (11, code_rbrace_tag_action_4)
    112 => (47, code_rbrace_tag_action_6)
    113..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_47(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=110 => (11, code_rbrace_tag_action_4)
    111 => (48, code_rbrace_tag_action_6)
    112..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_48(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=114 => (11, code_rbrace_tag_action_4)
    115 => (49, code_rbrace_tag_action_9)
    116..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
fn code_rbrace_state_49(input : LexInput) -> (LexState, LexTagAction) {
  match input {
    48..=57 => (11, code_rbrace_tag_action_4)
    65..=90 => (11, code_rbrace_tag_action_4)
    95 => (11, code_rbrace_tag_action_4)
    97..=122 => (11, code_rbrace_tag_action_4)
    _ => (-1, [])
  }
}

///|
let __mbtlex_engine_code_rbrace : LexEngine = {
  graph: [
    code_rbrace_state_0, code_rbrace_state_1, code_rbrace_state_2, code_rbrace_state_3,
    code_rbrace_state_4, code_rbrace_state_5, code_rbrace_state_6, code_rbrace_state_7,
    code_rbrace_state_8, code_rbrace_state_9, code_rbrace_state_10, code_rbrace_state_11,
    code_rbrace_state_12, code_rbrace_state_13, code_rbrace_state_14, code_rbrace_state_15,
    code_rbrace_state_16, code_rbrace_state_17, code_rbrace_state_18, code_rbrace_state_19,
    code_rbrace_state_20, code_rbrace_state_21, code_rbrace_state_22, code_rbrace_state_23,
    code_rbrace_state_24, code_rbrace_state_25, code_rbrace_state_26, code_rbrace_state_27,
    code_rbrace_state_28, code_rbrace_state_29, code_rbrace_state_30, code_rbrace_state_31,
    code_rbrace_state_32, code_rbrace_state_33, code_rbrace_state_34, code_rbrace_state_35,
    code_rbrace_state_36, code_rbrace_state_37, code_rbrace_state_38, code_rbrace_state_39,
    code_rbrace_state_40, code_rbrace_state_41, code_rbrace_state_42, code_rbrace_state_43,
    code_rbrace_state_44, code_rbrace_state_45, code_rbrace_state_46, code_rbrace_state_47,
    code_rbrace_state_48, code_rbrace_state_49,
  ],
  end_nodes: [
    None,
    Some((6, [((16, 0), (17, 0))])),
    Some((7, [])),
    Some((1, [])),
    Some((0, [])),
    Some((6, [((16, 0), (17, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((2, [((0, 0), (1, 0)), ((2, 0), (3, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((4, [((10, 0), (11, 0)), ((12, 0), (13, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    None,
    Some((5, [((14, 0), (15, 0))])),
    Some((4, [((10, 0), (11, 0)), ((12, 0), (13, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    None,
    None,
    None,
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    None,
    None,
    Some((3, [((4, 0), (5, 0)), ((6, 0), (7, 0)), ((8, 0), (9, 0))])),
    None,
    Some((4, [((10, 0), (11, 0)), ((12, 0), (13, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((4, [((10, 0), (11, 0)), ((12, 0), (13, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((5, [((14, 0), (15, 0))])),
    Some((4, [((10, 0), (11, 0)), ((12, 0), (13, 0))])),
  ],
  start_tags: [0, 4, 10, 14, 16],
  code_blocks_n: 8,
}

///|
fn code_rbrace(
  sb : StringBuilder,
  subst : Array[SubstItem],
  base : Int,
  lexbuf : Lexbuf
) -> Unit!LexError {
  match __mbtlex_engine_code_rbrace.run(lexbuf) {
    (0, __mbtlex_captures) => {
      sb.write_string("{")
      code_rbrace!(sb, subst, base, lexbuf)
      sb.write_string("}")
      code_rbrace!(sb, subst, base, lexbuf)
    }
    (1, __mbtlex_captures) => ()
    (2, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      let (_start_pos_of_t1, _end_pos_of_t1) = __mbtlex_captures[1]
      let t1 : String = lexbuf.substring(_start_pos_of_t1, _end_pos_of_t1)
      sb.write_string(t)
      let index = try {
        @strconv.parse_int!(t1, base=10)
      } catch {
        err => abort(Show::to_string(err))
      }
      subst.push({
        start: _start_pos_of_t - base,
        end: _end_pos_of_t - base,
        desc: Dollar(index),
      })
      code_rbrace!(sb, subst, base, lexbuf)
    }
    (3, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      let (_start_pos_of_t1, _end_pos_of_t1) = __mbtlex_captures[1]
      let t1 : String = lexbuf.substring(_start_pos_of_t1, _end_pos_of_t1)
      let (_start_pos_of_t2, _end_pos_of_t2) = __mbtlex_captures[2]
      let t2 : String = lexbuf.substring(_start_pos_of_t2, _end_pos_of_t2)
      sb.write_string(t)
      let arg : ClauseItemIdent = if t2.starts_with("$") {
        let index = try {
          @strconv.parse_int!(t2.substring(start=1), base=10)
        } catch {
          err => abort(Show::to_string(err))
        }
        Dollar(index)
      } else {
        Name(t2)
      }
      subst.push({
        start: _start_pos_of_t - base,
        end: _end_pos_of_t - base,
        desc: match t1 {
          "startpos" => StartPosOf(arg)
          "endpos" => EndPosOf(arg)
          "loc" => LocOf(arg)
          _ => panic()
        },
      })
      code_rbrace!(sb, subst, base, lexbuf)
    }
    (4, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      ignore(t)
      let (_start_pos_of_t1, _end_pos_of_t1) = __mbtlex_captures[1]
      let t1 : String = lexbuf.substring(_start_pos_of_t1, _end_pos_of_t1)
      sb.write_string(t)
      subst.push({
        start: _start_pos_of_t - base,
        end: _end_pos_of_t - base,
        desc: match t1 {
          "startpos" => StartPos
          "endpos" => EndPos
          "loc" => Loc
          "symbolstartpos" => SymbolStartPos
          "sloc" => Sloc
          _ => panic()
        },
      })
      code_rbrace!(sb, subst, base, lexbuf)
    }
    (5, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      sb.write_string(t)
      code_rbrace!(sb, subst, base, lexbuf)
    }
    (6, __mbtlex_captures) => {
      let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
      let t : String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
      sb.write_string(t)
      code_rbrace!(sb, subst, base, lexbuf)
    }
    (7, __mbtlex_captures) => raise UnexpectedEndOfFile
    _ => abort("lex: fail to match")
  }
}

///|
pub fn new_lexer(input : String) -> Lexer {
  { buf: Lexbuf::from_string(input), phase: { val: 0 } }
}

///|
pub fn next_token(self : Lexer) -> (Token, Int, Int)! {
  token!(self.phase, self.buf)
}
