///|
priv enum Move {
  Store(@direct_ir.Register, @direct_ir.Value)
  Save(Int32, @direct_ir.Value)
  Restore(@direct_ir.Register, Int32)
}

///|
/// Identity elimination and independent assignment preserve a parallel copy.
/// If any remaining destination is also read, retain the snapshot-first form.
fn parallel_moves(
  moves : Array[(@direct_ir.Register, @direct_ir.Value)],
  slot : (@direct_ir.Register) -> (Int32, Int32)?,
) -> Array[Move] {
  let moves = moves.filter(p => {
    guard slot(p.0) is Some(destination) else { false }
    match p.1 {
      Reg(reg) => slot(reg) != Some(destination)
      State(_) => true
    }
  })
  let destinations = Set::from_iter(moves.iter().map(p => slot(p.0).unwrap()))
  let needs_snapshot = moves
    .iter()
    .any(p => {
      match p.1 {
        Reg(reg) =>
          slot(reg).map(s => destinations.contains(s)).unwrap_or(false)
        State(_) => false
      }
    })
  if !needs_snapshot {
    return moves.map(p => Store(p.0, p.1))
  }
  let result = []
  for i, (_, value) in moves {
    result.push(Save(i, value))
  }
  for i, (reg, _) in moves {
    result.push(Restore(reg, i))
  }
  result
}

///|
fn Emitter::copies(
  self : Emitter,
  edge : @direct_ir.Edge,
) -> Array[@mbt_ast.Stmt] {
  let parameters = self.program.blocks[edge.target].parameters
  let moves = edge.arguments.mapi((i, value) => (parameters[i], value))
  parallel_moves(moves, reg => self.slots.get(reg.id)).map(step => {
    match step {
      Store(reg, value) => self.store(reg, self.value(value))
      Save(i, value) => binding("_yy_arg\{i}", self.value(value))
      Restore(reg, i) => self.store(reg, Ident("_yy_arg\{i}"))
    }
  })
}
