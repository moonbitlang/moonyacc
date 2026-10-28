///|
fn Emitter::instruction(
  self : Emitter,
  instruction : @direct_ir.Instruction,
) -> Array[@mbt_ast.Stmt] {
  match instruction {
    EnsureLookahead => [self.read_lookahead()]
    Input(token, value, start, end) =>
      self.input_bindings(token, value, start, end)
    ConsumeLookahead => {
      let statements : Array[@mbt_ast.Stmt] = []
      if self.input_mode is Array && self.support.tracks_positions() {
        statements.push(
          Assign(self.machine("last_pos"), self.cached_position(end=true)),
        )
      }
      statements.push(Assign(self.machine("lookahead"), Ident("None")))
      statements
    }
    SaveErrorSnapshot(suffix) => self.save_snapshot(suffix)
    ReadPreviousPosition(depth, reg) =>
      if self.erased_register(reg) {
        []
      } else {
        [self.bind_register(reg, self.previous_position(depth))]
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
      statements.append(self.pop_one())
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
  let fields : Array[@mbt_ast.Expr?] = [None, None, None, None]
  for i, field in cell.fields {
    let index = match field {
      State => 0
      Semantic => 1
      Start => 2
      End => 3
    }
    fields[index] = Some(self.value(values[i]))
  }
  let layout = self.cell_layout(cell)
  let start = if layout.start {
    fields[2].unwrap_or_else(() => self.previous_position(0))
  } else {
    @mbt_ast.Expr::Unit
  }
  let end = if layout.end {
    fields[3].unwrap_or_else(() => self.previous_position(0))
  } else {
    @mbt_ast.Expr::Unit
  }
  self.push_values(
    cell,
    fields[0].unwrap_or(Int(0)),
    fields[1].unwrap_or(Unit),
    start,
    end,
  )
}

///|
fn Emitter::push_values(
  self : Emitter,
  cell : @direct_ir.Cell,
  state : @mbt_ast.Expr,
  value : @mbt_ast.Expr,
  start : @mbt_ast.Expr,
  end : @mbt_ast.Expr,
) -> Array[@mbt_ast.Stmt] {
  [
    Assign(
      self.machine("stack"),
      self
      .cell_layout(cell)
      .construct(
        self.machine("stack"),
        self.machine("state"),
        value,
        start,
        end,
      ),
    ),
    Assign(self.machine("state"), state),
  ]
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
    if self.chunked && pc / BLOCKS_PER_CHUNK != chunk {
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
      self.branch_jump(
        self.cached("symbol"),
        branch_patterns(arms.map(p => (token_id(p.0), p.1))),
        chunk,
        fallback~,
      )
    CaseState(value, arms) =>
      self.branch_jump(self.value(value), branch_patterns(arms), chunk)
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
    Stop(_) =>
      if self.chunked {
        body([Return(call("yy_stop", [Ident("_env")]))])
      } else {
        self.stop_body()
      }
    Unreachable => value_block(call("panic", []))
  }
}
