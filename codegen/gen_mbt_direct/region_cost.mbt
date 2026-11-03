///|
/// Measure the actual target lowering in a valid isolated-block plan. This
/// includes batched pops, erased operands, parallel copies, token bindings,
/// checkpoint operations and the region entry/exit ABI. Grouping can amortize
/// that ABI; helper bodies and user actions stay shared and are not expanded.
fn Emitter::block_costs(self : Emitter) -> Array[Int32] {
  guard! self.control.regions.length() == self.program.blocks.length()
  for label, region in self.control.regions {
    guard! region.members == [label]
  }
  self.program.blocks.mapi((label, _) => {
    emission_cost(self.region_body(label, true))
  })
}

///|
/// Executable AST nodes are a deterministic size estimate, not CPU cycles or
/// final machine instructions. Names, source locations and whitespace cost
/// nothing. Count all alternatives, since they all occupy generated code.
fn emission_cost(block : @mbt_ast.Block) -> Int32 {
  block.statements.fold(init=0, (n, stmt) => n + statement_cost(stmt)) +
  block.result.map(expression_cost).unwrap_or(0)
}

///|
fn pattern_cost(pattern : @mbt_ast.Pattern) -> Int32 {
  match pattern {
    Any | Rest => 0
    Bind(_) | Int(_) | Bool(_) | String(_) | Range(_) => 1
    Tuple(parts) | Constructor(_, parts) =>
      1 + parts.fold(init=0, (n, p) => n + pattern_cost(p))
    Or(parts) => parts.fold(init=0, (n, p) => n + pattern_cost(p))
    As(pattern, _) => 1 + pattern_cost(pattern)
  }
}

///|
fn argument_cost(argument : @mbt_ast.Argument) -> Int32 {
  match argument {
    Positional(expr) | Labelled(_, expr) => expression_cost(expr)
    ForwardOptional(_) => 0
  }
}

///|
fn expression_cost(expr : @mbt_ast.Expr) -> Int32 {
  match expr {
    Ident(_) | Int(_) | Bool(_) | String(_) | Char(_) | Unit => 0
    Call(callee, args) | MethodCall(callee, _, args) =>
      1 +
      expression_cost(callee) +
      args.fold(init=0, (n, a) => n + argument_cost(a))
    Field(expr, _) | Unary(_, expr) => 1 + expression_cost(expr)
    Index(a, b) | Binary(_, a, b) | Range(a, b, _) =>
      1 + expression_cost(a) + expression_cost(b)
    Slice(expr, start, end) =>
      1 +
      expression_cost(expr) +
      start.map(expression_cost).unwrap_or(0) +
      end.map(expression_cost).unwrap_or(0)
    Tuple(values) | Array(values) =>
      1 + values.fold(init=0, (n, v) => n + expression_cost(v))
    Map(pairs) =>
      1 +
      pairs.fold(init=0, (n, p) => {
        n + expression_cost(p.0) + expression_cost(p.1)
      })
    Record(_, fields) =>
      1 + fields.fold(init=0, (n, p) => n + expression_cost(p.1))
    Ascribe(expr, _) => expression_cost(expr)
    Is(expr, pattern) => 1 + expression_cost(expr) + pattern_cost(pattern)
    Lambda(parameters, body) => 1 + parameters.length() + emission_cost(body)
    If(condition, yes, no) =>
      1 +
      expression_cost(condition) +
      emission_cost(yes) +
      no.map(emission_cost).unwrap_or(0)
    Match(value, arms) =>
      1 +
      expression_cost(value) +
      arms.fold(init=0, (n, p) => n + pattern_cost(p.0) + emission_cost(p.1))
    Block(block) | LabelledBlock(_, block) => emission_cost(block)
    Verbatim(_) => abort("region cost must not inspect user code")
  }
}

///|
fn statement_cost(stmt : @mbt_ast.Stmt) -> Int32 {
  match stmt {
    Comment(_) => 0
    Eval(expr) => expression_cost(expr)
    Let(pattern, _, expr) => pattern_cost(pattern) + expression_cost(expr)
    LetMut(_, _, expr) | Return(expr) | Raise(expr) | Assert(expr) =>
      1 + expression_cost(expr)
    Assign(dest, value) | Augment(dest, _, value) =>
      1 + expression_cost(dest) + expression_cost(value)
    Continue(values) | ContinueTo(_, values) =>
      1 + values.fold(init=0, (n, v) => n + expression_cost(v))
    Break(value) | BreakTo(_, value) =>
      1 + value.map(expression_cost).unwrap_or(0)
    LabelledLoop(_, loop_) => statement_cost(loop_)
    Guard(condition, body) | While(condition, body) =>
      1 + expression_cost(condition) + emission_cost(body)
    For(initial, condition, steps, body) =>
      1 +
      initial.fold(init=0, (n, p) => n + 1 + expression_cost(p.1)) +
      condition.map(expression_cost).unwrap_or(0) +
      steps.fold(init=0, (n, p) => n + 1 + expression_cost(p.1)) +
      emission_cost(body)
    ForEach(patterns, value, body) =>
      1 +
      patterns.fold(init=0, (n, p) => n + pattern_cost(p)) +
      expression_cost(value) +
      emission_cost(body)
    LocalFunction(function) =>
      1 + function.parameters.length() + emission_cost(function.body)
  }
}
