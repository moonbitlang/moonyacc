///|
fn Emitter::instruction(
  self : Emitter,
  instruction : @direct_ir.Instruction,
  checkpoint : @direct_ir.CheckpointFact,
  preserve~ : Bool,
) -> Array[@mbt_ast.Stmt] {
  match instruction {
    EnsureLookahead => [self.read_lookahead()]
    LoadLookahead => [self.read_lookahead(ready=false)]
    RefineLookahead(_) => []
    ConsumeLookahead => self.consume_lookahead()
    SaveErrorSnapshot(suffix) => self.save_snapshot(suffix, checkpoint)
    ReadPreviousPosition(depth, reg) =>
      if self.erased_register(reg) {
        []
      } else {
        [self.bind_register(reg, self.previous_position(depth, reg))]
      }
    Bind(pairs) => {
      let pairs = pairs.filter(p => !self.erased_register(p.0))
      let statements = []
      for i, (_, value) in pairs {
        statements.push(binding("_yy_bind\{i}", self.value(value)))
      }
      for i, (reg, _) in pairs {
        statements.push(self.bind_register(reg, Ident("_yy_bind\{i}")))
      }
      statements
    }
    Push(cell, values) => self.push_cell(cell, values, checkpoint, preserve~)
    Pop(cell, registers) => {
      let statements = self.bindings(0, cell, registers)
      statements.append(self.pop_cells([cell]))
      statements
    }
    Peek(depth, cell, registers) => self.bindings(depth, cell, registers)
    Action(id, inputs, result) => self.action_binding(id, inputs, result)
  }
}

///|
fn Emitter::push_cell(
  self : Emitter,
  cell : @direct_ir.Cell,
  values : Array[@direct_ir.Value],
  checkpoint : @direct_ir.CheckpointFact,
  preserve~ : Bool,
) -> Array[@mbt_ast.Stmt] {
  let symbol = cell.symbol.unwrap()
  let statements : Array[@mbt_ast.Stmt] = []
  for (field, lane) in self.stack.symbols[symbol] {
    let index = cell.fields.search(field).unwrap()
    let depth = self.machine(lane_depth(lane))
    statements.push(
      array_stack_write(
        self.machine(lane_name(lane)),
        depth,
        self.value(values[index]),
      ),
    )
    statements.push(Augment(depth, Add, Int(1)))
  }
  let state = self.value(values[cell.fields.search(State).unwrap()])
  let helper = if !checkpoint.needs_journal(preserve~) {
    "yy_stack_push_unprotected"
  } else {
    "yy_stack_push"
  }
  statements.push(Eval(call(helper, [self.machine("stack"), state])))
  if self.cache_state {
    statements.push(Assign(self.machine("state"), state))
  }
  statements
}

///|
fn Emitter::jump(
  self : Emitter,
  edge : @direct_ir.Edge,
  routes : Map[Int32, @control_flow.Transfer],
) -> @mbt_ast.Block {
  let statements = self.copies(edge)
  statements.append(self.control_transfer(edge.target, routes[edge.target]))
  body(statements)
}

///|
fn Emitter::terminator(
  self : Emitter,
  terminator : @direct_ir.Terminator,
  routes : Map[Int32, @control_flow.Transfer],
  checkpoint : @direct_ir.CheckpointFact,
) -> @mbt_ast.Block {
  match terminator {
    Jump(edge) => self.jump(edge, routes)
    CaseToken(arms, fallback) =>
      self.token_cases(arms, fallback, routes, checkpoint)
    CaseState(value, arms) =>
      self.branch_bodies(
        self.value(value),
        grouped_cases(arms, (a, b) => a == b),
        routes,
        checkpoint,
      )
    Return(entry, value) =>
      if self.shared_context {
        body([
          Assign(
            self.machine("_yy_result"),
            call("Some", [call("YYAccept_\{entry}", [self.value(value)])]),
          ),
          Return(Int(-1)),
        ])
      } else {
        body([Return(call("YYAccept_\{entry}", [self.value(value)]))])
      }
    Stop =>
      if self.shared_context {
        body([Return(self.resource_call("yy_stop"))])
      } else {
        self.stop_body()
      }
    Unreachable => value_block(call("panic", []))
  }
}
