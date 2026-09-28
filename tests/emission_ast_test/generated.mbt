///|
pub(all) struct Env {
  read : ((Int) -> Int)
  mut value : Int
}

///|
pub fn make_env(value : Int) -> Env {
  Env::{read: (x) => x * 2, value: value}
}

///|
let table : FixedArray[Int] = [10, 20, 30]

///|
pub fn table_value() -> Int {
  table[1]
}

///|
fn Env::read(_self : Env, x : Int) -> Int {
  x + 1000
}

///|
#inline(never)
pub fn from_field(env : Env) -> Int {
  (env.read)(3)
}

///|
pub fn from_method(env : Env) -> Int {
  env.read(3)
}

///|
pub fn identity_reader() -> ((Int) -> Int) {
  (x) =>
    ({
      ()
      // A commented body still returns a scalar.
      x
    })
}

///|
pub fn grouping() -> Int {
  10 - (5 - 2)
}

///|
pub fn bit_precedence() -> Bool {
  (6 & 3) == 2
}

///|
pub fn literal() -> String {
  "quote:\" slash:\\ interp:\\{x} 😀\r\n\u{00}"
}

///|
pub fn char_literal() -> Char {
  '\''
}

///|
pub type Reader = ((Int) -> Int)

///|
pub fn make_reader() -> ((Int) -> Int) {
  (x) => x + 1
}

///|
pub fn[T] identity(x : T) -> T {
  x
}

///|
pub fn sum_squares(n : Int) -> Int {
  let mut total = 0
  for i = 0; i < n; i = i + 1 {
    total += i * i
  }
  total
}

///|
pub fn sum_tail(values : Array[Int]) -> Int {
  let mut total = 0
  for x in values[1:] {
    total += x
  }
  total
}

///|
pub fn walk(n : Int) -> Int {
  for i = 0, total = 0 {
    if i >= n {
      return total
    }
    continue i + 1, total + i
  }
}

///|
pub suberror Failure {
  Failed(Int)
}

///|
pub fn positive(x : Int) -> Int raise Failure {
  guard x >= 0 else {
    raise Failed(x)
  }
  x
}

///|
pub fn bump(env : Env) -> Int {
  env.value = env.value + 1
  env.value
}

///|
priv enum Flag {
  Ready
}

///|
impl Show for Flag with fn output(_self, logger) {
  Logger::write_string(logger, "ready")
}

///|
pub fn show_ready() -> String {
  Show::to_string(Ready)
}

///|
pub fn loop_result(n : Int) -> Int {
  let mut total = 0
  // Nested loop exits
  // keep their target
  outer~: while total < n {
    while true {
      total += 1
      if total == 3 {
        break outer~
      }
      continue outer~
    }
  }
  fn finish(value : Int) -> Int {
    match value {
      0 | 1 => 0
      _ => value
    }
  }
  finish(total)
}

///|
pub fn user_code() -> Int {
  ({(); let x = 2
x * (20 + 1) // keep this comment
  })
}

