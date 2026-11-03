///|
fn Emitter::token_case_pattern(
  self : Emitter,
  token : @direct_ir.Token,
  payload : @mbt_ast.Pattern,
) -> @mbt_ast.Pattern {
  match token {
    EndOfInput => Constructor("None", [])
    Terminal(symbol) =>
      Constructor("Some", [self.token_pattern(symbol, payload)])
  }
}

///|
fn Emitter::bound_token_pattern(
  self : Emitter,
  pattern : @direct_ir.TokenPattern,
  prefix : Array[@mbt_ast.Stmt],
) -> @mbt_ast.Pattern {
  match pattern {
    Tokens(tokens) => {
      let patterns = tokens.map(t => self.token_case_pattern(t, Any))
      if patterns is [single] {
        single
      } else {
        Or(patterns)
      }
    }
    BindToken(symbol, value, start, end) => {
      let payload = if self.erased_register(value) || self.support.is_json_cst() {
        @mbt_ast.Pattern::Any
      } else if self.slots.contains(value.id) {
        let name = "_yy_token_\{value.id}"
        prefix.push(self.bind_register(value, Ident(name)))
        Bind(name)
      } else {
        Bind("_yy_r\{value.id}")
      }
      // JsonCst conversion already happened during the lexer read, including
      // for rejected tokens. Matching never invokes user conversion code.
      if self.support.is_json_cst() && !self.erased_register(value) {
        prefix.push(self.bind_register(value, self.cached("value")))
      }
      if !self.erased_register(start) {
        prefix.push(self.bind_register(start, self.cached_position()))
      }
      if !self.erased_register(end) {
        prefix.push(self.bind_register(end, self.cached_position(end=true)))
      }
      self.token_case_pattern(Terminal(symbol), payload)
    }
  }
}

///|
fn Emitter::token_cases(
  self : Emitter,
  arms : Array[(@direct_ir.TokenPattern, @direct_ir.Body)],
  fallback : @direct_ir.Body,
  routes : Map[Int32, @control_flow.Transfer],
  checkpoint : @direct_ir.CheckpointFact,
) -> @mbt_ast.Block {
  let exhaustive = self.program.exhaustive_tokens(arms.map(p => p.0))
  let prefixes : Array[Array[@mbt_ast.Stmt]] = arms.map(_ => [])
  let patterns = arms.mapi((i, arm) => {
    self.bound_token_pattern(arm.0, prefixes[i])
  })
  if prefixes.all(p => p.is_empty()) {
    return self.branch_bodies(
      self.cached("token"),
      arms.mapi((i, arm) => (patterns[i], arm.1)),
      routes,
      checkpoint,
      fallback?=if exhaustive { None } else { Some(fallback) },
      exhaustive~,
    )
  }
  let branches = arms.mapi((i, arm) => {
    let code = self.inline_body(arm.1, routes, checkpoint)
    (
      patterns[i],
      @mbt_ast.Block::{
        statements: [..prefixes[i], ..code.statements],
        result: code.result,
      },
    )
  })
  if !exhaustive {
    branches.push((Any, self.inline_body(fallback, routes, checkpoint)))
  }
  value_block(Match(self.cached("token"), branches))
}
