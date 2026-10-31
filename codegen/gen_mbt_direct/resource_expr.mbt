///|
fn ResourceAnalyzer::expressions(
  self : ResourceAnalyzer,
  values : Array[@mbt_ast.Expr],
) -> ResourceEffect {
  values.fold(init=ResourceEffect::empty(), (effect, value) => {
    effect.then(self.expr(value))
  })
}

///|
fn ResourceAnalyzer::arguments(
  self : ResourceAnalyzer,
  args : Array[@mbt_ast.Argument],
) -> ResourceEffect {
  args.fold(init=ResourceEffect::empty(), (effect, arg) => {
    effect.then(
      match arg {
        Positional(value) | Labelled(_, value) => self.expr(value)
        ForwardOptional("_env") => {
          self.supported = false
          ResourceEffect::empty()
        }
        ForwardOptional(_) => ResourceEffect::empty()
      },
    )
  })
}

///|
fn ResourceAnalyzer::pattern(
  self : ResourceAnalyzer,
  pattern : @mbt_ast.Pattern,
) -> Unit {
  match pattern {
    Bind("_env") | As(_, "_env") => self.supported = false
    Tuple(parts) | Constructor(_, parts) | Or(parts) =>
      for part in parts {
        self.pattern(part)
      }
    As(part, _) => self.pattern(part)
    _ => ()
  }
}

///|
/// Analyze target AST, never rendered source. The frame is private and cannot
/// escape: only registered helpers may receive it. New captures/aliases disable
/// promotion until their effects have an explicit owner.
fn ResourceAnalyzer::expr(
  self : ResourceAnalyzer,
  expr : @mbt_ast.Expr,
) -> ResourceEffect {
  if self.catalog.place(expr) is Some(id) {
    self.direct.add(id)
    self.access_count += 1
    return { ..ResourceEffect::empty(), reads: Set([id]), }
  }
  match expr {
    Ident("_env") | Verbatim(_) => {
      self.supported = false
      ResourceEffect::empty()
    }
    // Reading another frame field does not export the frame itself. Buffers,
    // tokens and the lexer closure have a separate ownership protocol.
    Field(Ident("_env"), Named(_)) => ResourceEffect::empty()
    Ident(_) | Int(_) | Bool(_) | String(_) | Char(_) | Unit =>
      ResourceEffect::empty()
    Call(Ident(name), [Positional(Ident("_env"))]) if self.helpers.get(name)
      is Some(effect) => effect
    Call(callee, args) | MethodCall(callee, _, args) =>
      self.expr(callee).then(self.arguments(args))
    Field(value, _) | Unary(_, value) | Ascribe(value, _) => self.expr(value)
    Is(value, pattern) => {
      self.pattern(pattern)
      self.expr(value)
    }
    Binary(And | Or, left, right) =>
      self.expr(left).then(self.expr(right).choice(ResourceEffect::empty()))
    Index(left, right) | Binary(_, left, right) | Range(left, right, _) =>
      self.expr(left).then(self.expr(right))
    Slice(value, first, last) =>
      self
      .expr(value)
      .then(
        first.map(value => self.expr(value)).unwrap_or(ResourceEffect::empty()),
      )
      .then(
        last.map(value => self.expr(value)).unwrap_or(ResourceEffect::empty()),
      )
    Tuple(values) | Array(values) => self.expressions(values)
    Map(pairs) =>
      pairs.fold(init=ResourceEffect::empty(), (effect, pair) => {
        effect.then(self.expr(pair.0)).then(self.expr(pair.1))
      })
    Record(_, fields) => self.expressions(fields.map(pair => pair.1))
    Lambda(_, body) => {
      let effect = self.block(body)
      if !effect.reads.is_empty() || !effect.writes.is_empty() {
        self.supported = false
      }
      ResourceEffect::empty()
    }
    If(condition, yes, no) =>
      self
      .expr(condition)
      .then(
        self
        .block(yes)
        .choice(
          no.map(body => self.block(body)).unwrap_or(ResourceEffect::empty()),
        ),
      )
    Match(value, arms) => {
      let branches = arms.map(pair => {
        self.pattern(pair.0)
        self.block(pair.1)
      })
      let joined = if branches.is_empty() {
        ResourceEffect::empty()
      } else {
        branches[1:].fold(init=branches[0], (left, right) => left.choice(right))
      }
      self.expr(value).then(joined)
    }
    Block(body) => self.block(body)
  }
}
