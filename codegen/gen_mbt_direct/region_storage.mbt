///|
priv struct RegionalSlots {
  used : Set[(Int32, Int32)]
  incoming : Set[(Int32, Int32)]
  assigned : Set[(Int32, Int32)]
}

///|
/// Block parameters already describe all inter-block value flow. After global
/// storage-demand pruning, their union at region entries is the live-in ABI;
/// an exiting edge needs only its destination's parameters. This is Menhir's
/// needed-register interface adapted to returning, iterative regions.
fn Emitter::regional_slots(self : Emitter, region : Int32) -> RegionalSlots {
  let used = Set([])
  let incoming = Set([])
  let assigned = Set([])
  fn add(registers : Array[@direct_ir.Register], set : Set[(Int32, Int32)]) {
    for reg in registers {
      if self.slots.get(reg.id) is Some(key) {
        set.add(key)
      }
    }
  }
  for entry in self.control.regions[region].entries {
    add(self.program.blocks[entry].parameters, incoming)
  }
  for label in self.control.regions[region].members {
    let block = self.program.blocks[label]
    add(block.parameters, used)
    for instruction in block.all_instructions() {
      add(instruction.definitions(), assigned)
    }
    fn edges(term : @direct_ir.Terminator) {
      if term is Jump(edge) {
        let parameters = self.program.blocks[edge.target].parameters
        add(parameters, used)
        let moves = parallel_moves(
          parameters.mapi((i, p) => (p, edge.arguments[i])),
          r => self.slots.get(r.id),
        )
        for move_ in moves {
          match move_ {
            Store(reg, _) | Restore(reg, _) => add([reg], assigned)
            Save(_) => ()
          }
        }
      }
      for body in term.bodies() {
        edges(body.terminator)
      }
    }
    edges(block.terminator)
  }
  for key in assigned {
    used.add(key)
  }
  // An arbitrary Position has no default value and is stored unwrapped.
  // Keep that existing ABI in the context; semantic slots already have a
  // checked optional representation and need no Default constraint.
  let used = Set::from_iter(
    used
    .iter()
    .filter(key => {
      let slot = self.slot_types[key.0]
      !(slot.logical is Position &&
      value_slot(slot.logical, slot.type_).optional)
    }),
  )
  { used, incoming, assigned, }
}

///|
fn Emitter::region_locals(
  self : Emitter,
  slots : RegionalSlots,
) -> Array[@mbt_ast.Stmt] {
  let keys = slots.used.to_array()
  keys.sort()
  let statements = []
  for (kind, index) as key in keys {
    let slot = self.slot_types[kind]
    let name = self.slot_name(kind, index)
    let empty = if slot.logical is Position {
      value_slot(slot.logical, slot.type_).initial
    } else {
      slot.initial
    }
    let initial = if slots.incoming.contains(key) {
      @mbt_ast.Expr::Field(Ident("_env"), Named(name))
    } else {
      empty
    }
    statements.push(
      if slots.assigned.contains(key) {
        @mbt_ast.Stmt::LetMut(name, Some(slot.type_), initial)
      } else {
        binding(name, initial, type_=slot.type_)
      },
    )
    // Release context references after loading the live-ins, including stale
    // values in slots that this region only defines. A long-running local
    // loop must not retain the previous contents of those physical slots.
    if !(empty is (Int(_) | Bool(_) | Char(_))) {
      statements.push(Assign(Field(Ident("_env"), Named(name)), empty))
    }
  }
  statements
}

///|
fn Emitter::flush_parameters(
  self : Emitter,
  target : Int32,
) -> Array[@mbt_ast.Stmt] {
  let statements = []
  let saved = Set([])
  for parameter in self.program.blocks[target].parameters {
    if self.slots.get(parameter.id) is Some((kind, index) as key) &&
      self.local_slots.contains(key) &&
      !saved.contains(key) {
      saved.add(key)
      let name = self.slot_name(kind, index)
      statements.push(
        @mbt_ast.Stmt::Assign(Field(Ident("_env"), Named(name)), Ident(name)),
      )
    }
  }
  statements
}
