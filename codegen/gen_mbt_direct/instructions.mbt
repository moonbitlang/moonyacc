///|
fn Emitter::bindings(
  self : Emitter,
  depth : Int,
  cell : @direct_ir.Cell,
  registers : Array[@direct_ir.Register?],
) -> Array[@mbt_ast.Stmt] {
  let statements = []
  let data : Array[@direct_ir.Register?] = [None, None, None]
  for i, reg in registers {
    if reg is Some(reg) {
      match cell.fields[i] {
        State => {
          let states = if depth == 0 {
            self.machine("states")
          } else {
            dot_call(self.machine("states"), "drop", [Int(depth)])
          }
          statements.push(
            self.bind_register(reg, dot_call(states, "unsafe_head", [])),
          )
        }
        field =>
          data[match field {
            Semantic => 0
            Start => 1
            End => 2
            State => panic()
          }] = Some(reg)
      }
    }
  }
  let read : @mbt_ast.Expr = Index(
    self.machine("data"),
    Binary(
      Subtract,
      dot_call(self.machine("data"), "length", []),
      Int(depth + 1),
    ),
  )
  statements.append(self.bind_data(data, read))
  statements
}

///|
fn Emitter::instruction(
  self : Emitter,
  instruction : @direct_ir.Instruction,
) -> Array[@mbt_ast.Stmt] {
  match instruction {
    EnsureLookahead => [self.read_lookahead()]
    Input(_, value, start, end) =>
      self.bind_data(
        [Some(value), Some(start), Some(end)],
        component(dot_call(self.machine("lookahead"), "unwrap", []), 1),
      )
    ConsumeLookahead =>
      [
        Assign(
          self.machine("last_pos"),
          component(
            component(dot_call(self.machine("lookahead"), "unwrap", []), 1),
            2,
          ),
        ),
        Assign(self.machine("lookahead"), Ident("None")),
      ]
    SaveErrorSnapshot =>
      [Assign(self.machine("error_stack"), self.machine("states"))]
    ReadLastPosition(reg) => [self.bind_register(reg, self.machine("last_pos"))]
    Bind(pairs) => {
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
      statements.append([
        Eval(call("ignore", [dot_call(self.machine("data"), "unsafe_pop", [])])),
        Assign(
          self.machine("states"),
          dot_call(self.machine("states"), "unsafe_tail", []),
        ),
      ])
      statements
    }
    Peek(depth, cell, registers) => self.bindings(depth, cell, registers)
    Action(id, args, last_pos, result) =>
      [self.bind_register(result, self.action_call(id, args, last_pos))]
  }
}

///|
fn Emitter::push_cell(
  self : Emitter,
  cell : @direct_ir.Cell,
  values : Array[@direct_ir.Value],
) -> Array[@mbt_ast.Stmt] {
  let fields : Array[@mbt_ast.Expr] = [
    Int(0),
    Ident("YYObj_Void"),
    self.machine("last_pos"),
    self.machine("last_pos"),
  ]
  for i, field in cell.fields {
    let index = match field {
      State => 0
      Semantic => 1
      Start => 2
      End => 3
    }
    fields[index] = self.value(values[i])
  }
  self.push_values(fields[0], fields[1], fields[2], fields[3])
}

///|
fn Emitter::push_values(
  self : Emitter,
  state : @mbt_ast.Expr,
  value : @mbt_ast.Expr,
  start : @mbt_ast.Expr,
  end : @mbt_ast.Expr,
) -> Array[@mbt_ast.Stmt] {
  [
    Assign(
      self.machine("states"),
      call("@list.cons", [state, self.machine("states")]),
    ),
    Eval(dot_call(self.machine("data"), "push", [Tuple([value, start, end])])),
  ]
}

///|
fn Emitter::action_call(
  self : Emitter,
  id : Int,
  args : Array[@direct_ir.ActionArgument],
  last_pos : @direct_ir.Value,
) -> @mbt_ast.Expr {
  let action = self.support.action_id((self.meta.production_meta)(id).action)
  call("yy_action_\{action}", [
    self.value(last_pos),
    Array(
      args.map(a => {
        @mbt_ast.Expr::Tuple([
          self.value(a.value),
          self.value(a.start),
          self.value(a.end),
        ])
      }),
    ),
  ])
}

///|
fn Emitter::jump(
  self : Emitter,
  edge : @direct_ir.Edge,
  chunk : Int,
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
  chunk : Int,
) -> @mbt_ast.Block {
  match terminator {
    Jump(edge) => self.jump(edge, chunk)
    CaseToken(arms, fallback) =>
      self.branch_jump(
        component(dot_call(self.machine("lookahead"), "unwrap", []), 0),
        branch_patterns(arms.map(p => (token_id(p.0), p.1))),
        chunk,
        fallback~,
      )
    CaseState(value, arms) =>
      self.branch_jump(self.value(value), branch_patterns(arms), chunk)
    Return(_, value) =>
      if self.chunked {
        body([
          Assign(self.machine("_yy_result"), self.value(value)),
          Return(Int(-1)),
        ])
      } else {
        body([Return(self.value(value))])
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
