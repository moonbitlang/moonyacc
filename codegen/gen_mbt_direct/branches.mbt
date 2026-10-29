///|
fn[T] grouped_cases(
  arms : Array[(Int32, T)],
  same : (T, T) -> Bool,
) -> Array[(@mbt_ast.Pattern, T)] {
  let groups : Array[(Array[@mbt_ast.Pattern], T)] = []
  for (pattern, value) in arms {
    let mut found = false
    for (patterns, existing) in groups {
      if same(existing, value) {
        patterns.push(Int(pattern))
        found = true
        break
      }
    }
    if !found {
      groups.push(([Int(pattern)], value))
    }
  }
  groups.map(p => {
    (if p.0.length() == 1 { p.0[0] } else { @mbt_ast.Pattern::Or(p.0) }, p.1)
  })
}

///|
/// Factor a shared control transfer out of branches once parameter copies are
/// proven to be identities. State IDs in the stack are not block labels.
fn Emitter::branch_jump(
  self : Emitter,
  value : @mbt_ast.Expr,
  branches : Array[(@mbt_ast.Pattern, @direct_ir.Edge)],
  chunk : Int32,
  fallback? : @direct_ir.Edge,
  exhaustive~ : Bool = false,
) -> @mbt_ast.Block {
  let edges = branches.map(p => p.1)
  if fallback is Some(edge) {
    edges.push(edge)
  }
  if edges.is_empty() || edges.iter().any(e => !self.copies(e).is_empty()) {
    let arms = branches.map(p => (p.0, self.jump(p.1, chunk)))
    if !exhaustive {
      arms.push(
        (
          Any,
          match fallback {
            Some(e) => self.jump(e, chunk)
            None => value_block(call("panic", []))
          },
        ),
      )
    }
    return value_block(Match(value, arms))
  }
  let arms = branches.map(p => {
    (p.0, value_block(@mbt_ast.Expr::Int(self.layout.pc(p.1.target))))
  })
  if !exhaustive {
    arms.push(
      (
        Any,
        value_block(
          match fallback {
            Some(e) => Int(self.layout.pc(e.target))
            None => call("panic", [])
          },
        ),
      ),
    )
  }
  self.transfer(Match(value, arms), edges.map(e => e.target), chunk)
}

///|
fn Emitter::transfer(
  self : Emitter,
  next : @mbt_ast.Expr,
  targets : Array[Int32],
  chunk : Int32,
) -> @mbt_ast.Block {
  let within = targets
    .iter()
    .all(target => self.layout.pc(target) / self.blocks_per_chunk == chunk)
  let outside = targets
    .iter()
    .all(target => self.layout.pc(target) / self.blocks_per_chunk != chunk)
  if !self.chunked || within {
    return body([Continue([next])])
  }
  if outside {
    return body([Return(next)])
  }
  body([
    binding("_yy_next", next),
    Eval(
      If(
        Binary(
          Equal,
          Binary(Divide, Ident("_yy_next"), Int(self.blocks_per_chunk)),
          Int(chunk),
        ),
        body([Continue([Ident("_yy_next")])]),
        Some(body([Return(Ident("_yy_next"))])),
      ),
    ),
  ])
}

///|
fn Emitter::inline_body(
  self : Emitter,
  code : @direct_ir.Body,
  chunk : Int32,
) -> @mbt_ast.Block {
  let block : @direct_ir.Block = {
    hint: NoHint,
    origin: Helper,
    parameters: [],
    lookahead: Any,
    instructions: code.instructions,
    terminator: code.terminator,
  }
  let statements = self.block_instructions(block)
  let finish = self.terminator(code.terminator, chunk)
  statements.append(finish.statements)
  { statements, result: finish.result, }
}

///|
fn Emitter::branch_bodies(
  self : Emitter,
  value : @mbt_ast.Expr,
  branches : Array[(@mbt_ast.Pattern, @direct_ir.Body)],
  chunk : Int32,
  fallback? : @direct_ir.Body,
  exhaustive~ : Bool = false,
) -> @mbt_ast.Block {
  if branches.all(p => p.1.edge() is Some(_)) &&
    fallback.map(b => b.edge() is Some(_)).unwrap_or(true) {
    let fallback = match fallback {
      Some(body) => body.edge()
      None => None
    }
    return self.branch_jump(
      value,
      branches.map(p => (p.0, p.1.edge().unwrap())),
      chunk,
      fallback?,
      exhaustive~,
    )
  }
  let arms = branches.map(p => (p.0, self.inline_body(p.1, chunk)))
  if !exhaustive {
    arms.push(
      (
        Any,
        match fallback {
          Some(body) => self.inline_body(body, chunk)
          None => value_block(call("panic", []))
        },
      ),
    )
  }
  value_block(Match(value, arms))
}
