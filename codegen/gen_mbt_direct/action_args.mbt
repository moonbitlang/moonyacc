///|
priv struct StackRead {
  symbol : Int
  depth : Int
  field : @direct_ir.Field
}

///|
priv struct ActionArguments {
  slices : Set[Int]
  unused : Set[Int]
}

///|
fn value_uses(block : @direct_ir.Block) -> Map[Int, Int] {
  let uses : Map[Int, Int] = Map([])
  fn use_(v : @direct_ir.Value) {
    if v is Reg(r) {
      uses[r.id] = uses.get(r.id).unwrap_or(0) + 1
    }
  }
  fn edge(e : @direct_ir.Edge) {
    for v in e.arguments {
      use_(v)
    }
  }
  for instruction in block.instructions {
    match instruction {
      Bind(pairs) =>
        for (_, v) in pairs {
          use_(v)
        }
      Push(_, values) =>
        for v in values {
          use_(v)
        }
      Action(_, args, last, _) => {
        for arg in args {
          use_(arg.value)
          use_(arg.start)
          use_(arg.end)
        }
        use_(last)
      }
      _ => ()
    }
  }
  match block.terminator {
    Jump(e) => edge(e)
    CaseToken(arms, fallback) => {
      for (_, e) in arms {
        edge(e)
      }
      edge(fallback)
    }
    CaseState(v, arms) => {
      use_(v)
      for (_, e) in arms {
        edge(e)
      }
    }
    Return(_, v) => use_(v)
    Stop(_) | Unreachable => ()
  }
  uses
}

///|
fn matches_read(
  reads : Map[Int, StackRead],
  value : @direct_ir.Value,
  symbol : Int,
  depth : Int,
  field : @direct_ir.Field,
) -> Bool {
  guard value is Reg(reg) && reads.get(reg.id) is Some(read) else { false }
  read.symbol == symbol && read.depth == depth && read.field == field
}

///|
fn stack_arguments(
  reads : Map[Int, StackRead],
  rhs : Array[Int],
  args : Array[@direct_ir.ActionArgument],
) -> Bool {
  if args.is_empty() || args.length() != rhs.length() {
    return false
  }
  for i, arg in args {
    let depth = rhs.length() - i - 1
    if !matches_read(reads, arg.value, rhs[i], depth, Semantic) ||
      !matches_read(reads, arg.start, rhs[i], depth, Start) ||
      !matches_read(reads, arg.end, rhs[i], depth, End) {
      return false
    }
  }
  true
}

///|
/// Fuse a contiguous RHS read with the existing ArrayView action ABI. Any
/// intervening effect invalidates the proof; escaping position values stay bound.
fn action_arguments(
  block : @direct_ir.Block,
  actions : Array[@direct_ir.ActionSignature],
) -> ActionArguments {
  let reads : Map[Int, StackRead] = Map([])
  let slices = Set([])
  let replaced : Map[Int, Int] = Map([])
  for index, instruction in block.instructions {
    match instruction {
      Peek(depth, cell, regs) =>
        if cell.symbol is Some(symbol) {
          for i, reg in regs {
            if reg is Some(reg) {
              reads[reg.id] = { symbol, depth, field: cell.fields[i], }
            }
          }
        }
      ReadLastPosition(_) => ()
      Action(id, args, _, _) => {
        if stack_arguments(reads, actions[id].rhs, args) {
          slices.add(index)
          for arg in args {
            for value in [arg.value, arg.start, arg.end] {
              guard! value is Reg(reg)
              replaced[reg.id] = replaced.get(reg.id).unwrap_or(0) + 1
            }
          }
        }
        reads.clear()
      }
      _ => reads.clear()
    }
  }
  let uses = value_uses(block)
  let unused = Set([])
  for id, count in replaced {
    if uses.get(id) == Some(count) {
      unused.add(id)
    }
  }
  { slices, unused, }
}

///|
fn Emitter::stack_action(
  self : Emitter,
  id : Int,
  count : Int,
  last : @direct_ir.Value,
  result : @direct_ir.Register,
) -> @mbt_ast.Stmt {
  let action = self.support.action_id((self.meta.production_meta)(id).action)
  let start : @mbt_ast.Expr = Binary(
    Subtract,
    dot_call(self.machine("data"), "length", []),
    Int(count),
  )
  self.bind_register(
    result,
    call("yy_action_\{action}", [
      self.value(last),
      Slice(self.machine("data"), Some(start), None),
    ]),
  )
}
