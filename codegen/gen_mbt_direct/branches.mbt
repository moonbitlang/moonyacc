///|
fn branch_patterns(
  arms : Array[(Int, @direct_ir.Edge)],
) -> Array[(@mbt_ast.Pattern, @direct_ir.Edge)] {
  let groups : Array[(Array[@mbt_ast.Pattern], @direct_ir.Edge)] = []
  for (pattern, edge) in arms {
    let mut found = false
    for (patterns, existing) in groups {
      if existing.target == edge.target && existing.arguments == edge.arguments {
        patterns.push(Int(pattern))
        found = true
        break
      }
    }
    if !found {
      groups.push(([Int(pattern)], edge))
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
  chunk : Int,
  fallback? : @direct_ir.Edge,
) -> @mbt_ast.Block {
  let edges = branches.map(p => p.1)
  if fallback is Some(edge) {
    edges.push(edge)
  }
  if edges.is_empty() || edges.iter().any(e => !self.copies(e).is_empty()) {
    let arms = branches.map(p => (p.0, self.jump(p.1, chunk)))
    arms.push(
      (
        Any,
        match fallback {
          Some(e) => self.jump(e, chunk)
          None => value_block(call("panic", []))
        },
      ),
    )
    return value_block(Match(value, arms))
  }
  let arms = branches.map(p => {
    (p.0, value_block(@mbt_ast.Expr::Int(p.1.target)))
  })
  arms.push(
    (
      Any,
      value_block(
        match fallback {
          Some(e) => Int(e.target)
          None => call("panic", [])
        },
      ),
    ),
  )
  let next : @mbt_ast.Expr = Match(value, arms)
  let within = edges.iter().all(e => e.target / BLOCKS_PER_CHUNK == chunk)
  let outside = edges.iter().all(e => e.target / BLOCKS_PER_CHUNK != chunk)
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
          Binary(Divide, Ident("_yy_next"), Int(BLOCKS_PER_CHUNK)),
          Int(chunk),
        ),
        body([Continue([Ident("_yy_next")])]),
        Some(body([Return(Ident("_yy_next"))])),
      ),
    ),
  ])
}
