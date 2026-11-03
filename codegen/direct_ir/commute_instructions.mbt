// The absorbed-count contract follows Menhir's commute_pushes. Unlike Menhir's
// rare PEEK, RHS peeks are common here: prefix read depths are adjusted by the
// number of pushes actually absorbed, not by the speculative train length.

///|
fn PushCommuter::body(
  self : PushCommuter,
  body : Body,
  env : PushEnv,
  path : Set[Int32],
) -> Commuted {
  self.sequence(body.instructions[:], body.terminator, env, path)
}

///|
fn PushCommuter::sequence(
  self : PushCommuter,
  instructions : ArrayView[Instruction],
  terminator : Terminator,
  env : PushEnv,
  path : Set[Int32],
) -> Commuted {
  guard instructions is [instruction, .. rest] else {
    self.finish(terminator, env, path)
  }
  let rewritten = instruction.map_values(v => env.value(v), r => r)
  match rewritten {
    Push(_) if pushes_vanish(rest, terminator) =>
      self.sequence(rest, terminator, env, path).prepend(instruction, None)
    Push(cell, values) if cell.fields.contains(State) => {
      env.pushes.push({ cell, values, })
      let result = self.sequence(rest, terminator, env, path)
      if result.absorbed == 0 {
        result.prepend(instruction, Some(rewritten))
      } else {
        { ..result.prepend(instruction, None), absorbed: result.absorbed - 1, }
      }
    }
    Pop(cell, regs) if env.pushes.last() is Some(top) && top.cell == cell => {
      guard top.read(cell, regs) is Some(bindings) else {
        self.barrier(instructions, terminator, env, path)
      }
      ignore(env.pushes.pop())
      env.bind(bindings)
      let result = self.sequence(rest, terminator, env, path)
      { ..result.prepend(instruction, None), absorbed: result.absorbed + 1, }
    }
    Peek(depth, cell, regs) if depth < env.pushes.length() => {
      guard env.pushes[env.pushes.length() - depth - 1].read(cell, regs)
        is Some(bindings) else {
        self.barrier(instructions, terminator, env, path)
      }
      env.bind(bindings)
      let result = self.sequence(rest, terminator, env, path)
      result.prepend(instruction, None)
    }
    ReadPreviousPosition(depth, reg) if depth < env.pushes.length() => {
      let cell = env.pushes[env.pushes.length() - depth - 1]
      guard cell.read({ symbol: cell.cell.symbol, fields: [End], }, [Some(reg)])
        is Some(bindings) else {
        self.barrier(instructions, terminator, env, path)
      }
      env.bind(bindings)
      let result = self.sequence(rest, terminator, env, path)
      result.prepend(instruction, None)
    }
    Bind(bindings) => {
      env.bind(bindings)
      self.sequence(rest, terminator, env, path).prepend(instruction, None)
    }
    Peek(depth, cell, regs) => {
      if depth == env.pushes.length() &&
        cell.symbol is None &&
        env.prefix_state is Some(state) {
        for i, field in cell.fields {
          if field is State && regs[i] is Some(reg) {
            env.bind([(reg, state)])
          }
        }
      }
      let result = self.sequence(rest, terminator, env, path)
      result.prepend(
        instruction,
        Some(Peek(depth - result.absorbed, cell, regs)),
      )
    }
    ReadPreviousPosition(depth, reg) => {
      let result = self.sequence(rest, terminator, env, path)
      result.prepend(
        instruction,
        Some(ReadPreviousPosition(depth - result.absorbed, reg)),
      )
    }
    SaveErrorSnapshot(suffix) => {
      let pending = env.pushes.copy()
      let result = self.sequence(rest, terminator, env, path)
      let moved = pending[pending.length() - result.absorbed:].map(p => {
        p.values[p.cell.fields.search(State).unwrap()]
      })
      result.prepend(instruction, Some(SaveErrorSnapshot([..moved, ..suffix])))
    }
    Pop(_, _) if env.pushes.is_empty() => {
      let next = { ..env, prefix_state: None, }
      self
      .sequence(rest, terminator, next, path)
      .prepend(instruction, Some(rewritten))
    }
    Pop(_) | Push(_) => self.barrier(instructions, terminator, env, path)
    // Lexer calls, extraction and actions stay in their original order. SSA
    // definitions cannot overwrite a value carried by a delayed push.
    _ =>
      self
      .sequence(rest, terminator, env, path)
      .prepend(instruction, Some(rewritten))
  }
}

///|
fn PushCommuter::barrier(
  self : PushCommuter,
  instructions : ArrayView[Instruction],
  terminator : Terminator,
  env : PushEnv,
  path : Set[Int32],
) -> Commuted {
  let prefix_state = match env.pushes.last() {
    Some(cell) => cell.cell.fields.search(State).map(i => cell.values[i])
    None => env.prefix_state
  }
  let reset = { ..env, pushes: [], prefix_state, }
  // This instruction is emitted literally; otherwise a partial PUSH would
  // repeatedly re-enter this barrier. Continue optimizing its successor.
  guard! instructions is [instruction, .. rest]
  let rewritten = instruction.map_values(v => env.value(v), r => r)
  let next = match rewritten {
    Push(_) | Pop(_) => { ..reset, prefix_state: None, }
    _ => reset
  }
  let result = self.sequence(rest, terminator, next, path)
  { ..result.prepend(instruction, Some(rewritten)), absorbed: 0, }
}
