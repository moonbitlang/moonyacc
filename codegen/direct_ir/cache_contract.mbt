///|
/// Strengthen presence contracts using the whole-CFG fixed point. Existing
/// identity contracts remain explicit; every incoming edge is rechecked by
/// Program::validate after all block interfaces have been updated together.
fn StackEntryFact::cache_contract(
  self : StackEntryFact,
  previous : Lookahead,
) -> Lookahead raise InvalidProgram {
  match previous {
    Empty =>
      require(
        self.empty_token && self.tokens.is_empty(),
        "empty-cache contract is not proved",
      )
    Present =>
      require(
        !self.empty_token && !self.tokens.is_empty(),
        "present-cache contract is not proved",
      )
    On(token) =>
      require(
        !self.empty_token && self.tokens == Set([token]),
        "token-identity contract is not proved",
      )
    Any => ()
  }
  if !(previous is Any) {
    return previous
  }
  if self.empty_token && self.tokens.is_empty() {
    Empty
  } else if !self.empty_token {
    Present
  } else {
    Any
  }
}
