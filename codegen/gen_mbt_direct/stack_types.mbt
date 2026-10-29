///|
priv struct StackLane {
  field : @direct_ir.Field
  type_ : @elab.TypeExpr
}

///|
/// Project the checked logical stack onto homogeneous arrays. Equal semantic
/// types share an array; start and end positions have independent demand.
/// Symbol identities and offsets are proved by StackFlow, not runtime tags.
priv struct StackStorage {
  lanes : Array[StackLane]
  symbols : Array[Array[(@direct_ir.Field, Int32)]]
}

///|
fn is_unit(type_ : @elab.TypeExpr) -> Bool {
  type_ is Constr(pkg=None, "Unit", [])
}

///|
fn StackStorage::new(
  program : @direct_ir.Program,
  demand : @direct_ir.StorageDemand,
  position : @elab.TypeExpr,
) -> StackStorage {
  let lanes : Array[StackLane] = []
  let symbols = program.symbols.map(_ => [])
  let pushed = Set([])
  for block in program.blocks {
    for instruction in block.all_instructions() {
      if instruction is Push({ symbol: Some(symbol), .. }, _) {
        pushed.add(symbol)
      }
    }
  }
  for symbol in pushed {
    for field in [@direct_ir.Field::Semantic, Start, End] {
      if !demand.fields[symbol].contains(field) {
        continue
      }
      let type_ = if field is Semantic {
        program.symbols[symbol].type_
      } else {
        position
      }
      let lane = match
        lanes.search_by(lane => lane.field == field && lane.type_ == type_) {
        Some(lane) => lane
        None => {
          let lane = lanes.length()
          lanes.push({ field, type_, })
          lane
        }
      }
      symbols[symbol].push((field, lane))
    }
  }
  { lanes, symbols, }
}

///|
fn lane_name(lane : Int32) -> String {
  "_yy_stack_\{lane}"
}

///|
fn lane_depth(lane : Int32) -> String {
  "_yy_depth_\{lane}"
}

///|
fn StackStorage::lane(
  self : StackStorage,
  symbol : Int32,
  field : @direct_ir.Field,
) -> Int32 {
  self.symbols[symbol][self.symbols[symbol]
  .search_by(p => p.0 == field)
  .unwrap()].1
}

///|
fn StackStorage::above(
  self : StackStorage,
  symbols : Array[Int32],
  lane : Int32,
) -> Int32 {
  symbols.fold(init=0, (n, symbol) => {
    n + self.symbols[symbol].filter(p => p.1 == lane).length()
  })
}

///|
fn Emitter::stack_storage(
  self : Emitter,
) -> Array[(@mbt_ast.Field, @mbt_ast.Expr)] {
  let fields : Array[(@mbt_ast.Field, @mbt_ast.Expr)] = if !self.has_stack {
    if self.chunked && self.needs_initial_state {
      [
        (
          { name: "initial_state", type_: type_("Int"), mutable: false, },
          Ident("initial_state"),
        ),
      ]
    } else {
      []
    }
  } else {
    let initial : Array[(String, @mbt_ast.Expr)] = [
      ("values", Array([Ident("initial_state")])),
      ("depth", Int(1)),
    ]
    if self.diagnostics {
      initial.append([
        ("checkpoint", Int(1)),
        ("saved_prefix", Int(1)),
        ("undo", Array([])),
      ])
    }
    [
      (
        { name: "stack", type_: type_("YYStateStack"), mutable: false, },
        Record(Some(type_("YYStateStack")), initial),
      ),
    ]
  }

  if self.cache_state {
    fields.push(
      (
        { name: "state", type_: type_("Int"), mutable: true, },
        Ident("initial_state"),
      ),
    )
  }
  for lane, info in self.stack.lanes {
    fields.push(
      (
        {
          name: lane_name(lane),
          type_: @mbt_common.named_type("Array", [info.type_]),
          mutable: false,
        },
        Array([]),
      ),
    )
    fields.push(
      ({ name: lane_depth(lane), type_: type_("Int"), mutable: true, }, Int(0)),
    )
  }
  fields
}

///|
fn Emitter::lane_read(
  self : Emitter,
  lane : Int32,
  above : Int32,
) -> @mbt_ast.Expr {
  let array = self.machine(lane_name(lane))
  Index(array, Binary(Subtract, self.machine(lane_depth(lane)), Int(above + 1)))
}

///|
/// Buffers retain their high-water length; the separate logical depth is the
/// projection of the proved LR stack. This avoids shrinking/regrowing storage
/// on every reduction and works uniformly on native and GC targets.
fn array_stack_write(
  array : @mbt_ast.Expr,
  index : @mbt_ast.Expr,
  value : @mbt_ast.Expr,
) -> @mbt_ast.Stmt {
  Eval(
    If(
      Binary(Equal, index, dot_call(array, "length", [])),
      body([Eval(dot_call(array, "push", [value]))]),
      Some(body([Assign(Index(array, index), value)])),
    ),
  )
}

///|
fn Emitter::state_at(self : Emitter, depth : Int32) -> @mbt_ast.Expr {
  if !self.has_stack {
    guard! depth == 0
    return self.machine("initial_state")
  }
  if depth == 0 && self.cache_state {
    return self.machine("state")
  }
  self.stored_state_at(depth)
}

///|
fn Emitter::stored_state_at(self : Emitter, depth : Int32) -> @mbt_ast.Expr {
  let stack = self.machine("stack")
  Index(
    Field(stack, Named("values")),
    Binary(Subtract, Field(stack, Named("depth")), Int(depth + 1)),
  )
}
