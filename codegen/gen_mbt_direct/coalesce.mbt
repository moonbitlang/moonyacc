///|
/// A parameterless block cannot read old parameter slots. Its result registers
/// can therefore be defined directly in distinct slots of its Jump successor.
/// Each register gets at most one slot, even if passed more than once.
fn coalesce_results(
  blocks : Array[@direct_ir.Block],
  slots : Map[Int32, (Int32, Int32)],
) -> Unit {
  for block in blocks {
    if block.parameters.is_empty() && block.terminator is Jump(edge) {
      let parameters = blocks[edge.target].parameters
      for i, value in edge.arguments {
        if value is Reg(reg) && !slots.contains(reg.id) {
          slots[reg.id] = slots[parameters[i].id]
        }
      }
    }
  }
}

///|
fn Emitter::bind_register(
  self : Emitter,
  reg : @direct_ir.Register,
  value : @mbt_ast.Expr,
) -> @mbt_ast.Stmt {
  if self.slots.contains(reg.id) {
    Assign(self.register(reg), value)
  } else {
    binding("_yy_r\{reg.id}", value)
  }
}

///|
fn Emitter::bind_data(
  self : Emitter,
  data : Array[@direct_ir.Register?],
  read : @mbt_ast.Expr,
) -> Array[@mbt_ast.Stmt] {
  if !self.support.tracks_positions() {
    let statements = []
    for index, reg in data {
      if reg is Some(reg) {
        statements.push(
          self.bind_register(reg, if index == 0 { read } else { Unit }),
        )
      }
    }
    return statements
  }
  let registers = data.filter_map(r => r)
  if registers.is_empty() {
    return []
  }
  let statements = []
  let read = if registers.length() == 1 {
    read
  } else if registers.iter().any(r => self.slots.contains(r.id)) {
    let name = "_yy_data\{registers[0].id}"
    statements.push(binding(name, read))
    Ident(name)
  } else {
    return [
      Let(
        Tuple(
          data.map(r => {
            match r {
              Some(reg) => @mbt_ast.Pattern::Bind("_yy_r\{reg.id}")
              None => Any
            }
          }),
        ),
        None,
        read,
      ),
    ]
  }
  for index, reg in data {
    if reg is Some(reg) {
      statements.push(self.bind_register(reg, component(read, index)))
    }
  }
  statements
}
