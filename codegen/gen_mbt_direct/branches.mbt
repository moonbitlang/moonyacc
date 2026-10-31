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
fn Emitter::inline_body(
  self : Emitter,
  code : @direct_ir.Body,
  routes : Map[Int32, @control_flow.Transfer],
  checkpoint : @direct_ir.CheckpointFact,
) -> @mbt_ast.Block {
  let block : @direct_ir.Block = {
    specialize_state: false,
    hint: NoHint,
    origin: Helper,
    parameters: [],
    lookahead: Any,
    instructions: code.instructions,
    terminator: code.terminator,
  }
  let (statements, checkpoint) = self.block_instructions(block, checkpoint)
  let finish = self.terminator(code.terminator, routes, checkpoint)
  statements.append(finish.statements)
  { statements, result: finish.result, }
}

///|
fn Emitter::branch_bodies(
  self : Emitter,
  value : @mbt_ast.Expr,
  branches : Array[(@mbt_ast.Pattern, @direct_ir.Body)],
  routes : Map[Int32, @control_flow.Transfer],
  checkpoint : @direct_ir.CheckpointFact,
  fallback? : @direct_ir.Body,
  exhaustive~ : Bool = false,
) -> @mbt_ast.Block {
  let arms = branches.map(p => (p.0, self.inline_body(p.1, routes, checkpoint)))
  if !exhaustive {
    arms.push(
      (
        Any,
        match fallback {
          Some(body) => self.inline_body(body, routes, checkpoint)
          None => value_block(call("panic", []))
        },
      ),
    )
  }
  value_block(Match(value, arms))
}
