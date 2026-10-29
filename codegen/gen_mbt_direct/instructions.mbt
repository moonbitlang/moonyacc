///|
fn Emitter::instruction(
  self : Emitter,
  instruction : @direct_ir.Instruction,
) -> Array[@mbt_ast.Stmt] {
  match instruction {
    EnsureLookahead => [self.read_lookahead()]
    LoadLookahead => [self.read_lookahead(ready=false)]
    Input(token, value, start, end) =>
      self.input_bindings(token, value, start, end)
    ConsumeLookahead => self.consume_lookahead()
    SaveErrorSnapshot(suffix) => self.save_snapshot(suffix)
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
    Push(cell, values) => self.push_cell(cell, values)
    Pop(cell, registers) => {
      let statements = self.bindings(0, cell, registers)
      statements.append(self.pop_cells([cell]))
      statements
    }
    Peek(depth, cell, registers) => self.bindings(depth, cell, registers)
    Action(id, args, last_pos, result) =>
      self.action_binding(id, args, last_pos, result)
  }
}

///|
fn Emitter::push_cell(
  self : Emitter,
  cell : @direct_ir.Cell,
  values : Array[@direct_ir.Value],
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
  statements.push(Eval(call("yy_stack_push", [self.machine("stack"), state])))
  if self.cache_state {
    statements.push(Assign(self.machine("state"), state))
  }
  statements
}

///|
fn Emitter::jump(
  self : Emitter,
  edge : @direct_ir.Edge,
  chunk : Int32,
) -> @mbt_ast.Block {
  let statements = self.copies(edge)
  let pc = self.layout.pc(edge.target)
  statements.push(
    if self.chunked && pc / self.blocks_per_chunk != chunk {
      Return(Int(pc))
    } else {
      Continue([Int(pc)])
    },
  )
  body(statements)
}

///|
fn Emitter::terminator(
  self : Emitter,
  terminator : @direct_ir.Terminator,
  chunk : Int32,
) -> @mbt_ast.Block {
  match terminator {
    Jump(edge) => self.jump(edge, chunk)
    CaseToken(arms, fallback) =>
      self.branch_bodies(
        self.cached("symbol"),
        arms.map(p => {
          (
            if p.0 is [token] {
              @mbt_ast.Pattern::Int(token_id(token))
            } else {
              Or(p.0.map(t => @mbt_ast.Pattern::Int(token_id(t))))
            },
            p.1,
          )
        }),
        chunk,
        fallback~,
      )
    CaseState(value, arms) =>
      self.branch_bodies(
        self.value(value),
        grouped_cases(arms, (a, b) => a == b),
        chunk,
      )
    Return(entry, value) =>
      if self.chunked {
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
      if self.chunked {
        body([Return(call("yy_stop", [Ident("_env")]))])
      } else {
        self.stop_body()
      }
    Unreachable => value_block(call("panic", []))
  }
}
