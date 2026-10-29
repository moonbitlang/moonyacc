///|
pub fn TokenPattern::tokens(self : TokenPattern) -> Array[Token] {
  match self {
    Tokens(tokens) => tokens
    BindToken(token, _, _, _) => [Terminal(token)]
  }
}

///|
pub fn TokenPattern::definitions(self : TokenPattern) -> Array[Register] {
  match self {
    Tokens(_) => []
    BindToken(_, value, start, end) => [value, start, end]
  }
}

///|
fn TokenPattern::map_definitions(
  self : TokenPattern,
  f : (Register) -> Register,
) -> TokenPattern {
  match self {
    Tokens(_) => self
    BindToken(token, value, start, end) =>
      BindToken(token, f(value), f(start), f(end))
  }
}

///|
/// Validation establishes disjoint patterns over this finite token universe.
pub fn Program::exhaustive_tokens(
  self : Program,
  patterns : Array[TokenPattern],
) -> Bool {
  let seen = Set([])
  for pattern in patterns {
    for token in pattern.tokens() {
      seen.add(token)
    }
  }
  seen.length() == self.terminal_count + 1
}
