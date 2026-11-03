///|
fn ResourceAnalyzer::block(
  self : ResourceAnalyzer,
  block : @mbt_ast.Block,
) -> ResourceEffect {
  let effect = block.statements.fold(init=ResourceEffect::empty(), (
    effect,
    stmt,
  ) => effect.then(self.statement(stmt)))
  effect.then(
    block.result
    .map(value => self.expr(value))
    .unwrap_or(ResourceEffect::empty()),
  )
}

///|
fn ResourceAnalyzer::loop_effect(
  self : ResourceAnalyzer,
  effect : ResourceEffect,
) -> ResourceEffect {
  ignore(self)
  // Zero iterations are possible. Retaining every incoming dependency also
  // conservatively handles local breaks and loop-carried scalar values.
  { ..effect, kills: Set([]), }
}

///|
fn ResourceAnalyzer::statement(
  self : ResourceAnalyzer,
  stmt : @mbt_ast.Stmt,
) -> ResourceEffect {
  match stmt {
    Let(pattern, _, value) => {
      self.pattern(pattern)
      self.expr(value)
    }
    LetMut(name, _, value) => {
      if name == "_env" {
        self.supported = false
      }
      self.expr(value)
    }
    Assign(dest, value) =>
      if self.catalog.place(dest) is Some(id) {
        self.direct.add(id)
        self.access_count += 1
        self
        .expr(value)
        .then({
          ..ResourceEffect::empty(),
          kills: Set([id]),
          writes: Set([id]),
        })
      } else {
        self.expr(dest).then(self.expr(value))
      }
    Augment(dest, _, value) => {
      let effect = self.expr(dest).then(self.expr(value))
      if self.catalog.place(dest) is Some(id) {
        self.access_count += 1
        effect.then({
          ..ResourceEffect::empty(),
          kills: Set([id]),
          writes: Set([id]),
        })
      } else {
        effect
      }
    }
    Eval(value) | Assert(value) => self.expr(value)
    Return(value) | Raise(value) => { ..self.expr(value), exits: true, }
    Continue(values) | ContinueTo(_, values) =>
      { ..self.expressions(values), exits: true, }
    Break(value) | BreakTo(_, value) =>
      {
        ..value
        .map(value => self.expr(value))
        .unwrap_or(ResourceEffect::empty()),
        exits: true,
      }
    LabelledLoop(_, loop_) => self.statement(loop_)
    Guard(condition, no) =>
      self.expr(condition).then(self.block(no).choice(ResourceEffect::empty()))
    While(condition, body) =>
      self.loop_effect(self.expr(condition).then(self.block(body)))
    For(initial, condition, steps, body) => {
      for (name, _) in initial {
        if name == "_env" {
          self.supported = false
        }
      }
      let iteration = condition
        .map(value => self.expr(value))
        .unwrap_or(ResourceEffect::empty())
        .then(self.block(body))
        .then(self.expressions(steps.map(pair => pair.1)))
      self
      .expressions(initial.map(pair => pair.1))
      .then(self.loop_effect(iteration))
    }
    ForEach(patterns, value, body) => {
      for pattern in patterns {
        self.pattern(pattern)
      }
      self.expr(value).then(self.loop_effect(self.block(body)))
    }
    LocalFunction(function) => {
      let effect = self.block(function.body)
      if !effect.reads.is_empty() || !effect.writes.is_empty() {
        self.supported = false
      }
      ResourceEffect::empty()
    }
    Comment(_) => ResourceEffect::empty()
  }
}
