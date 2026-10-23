///|
fn unbound_pop(instruction : @direct_ir.Instruction) -> Bool {
  match instruction {
    Pop(_, regs) => regs.iter().all(r => r is None)
    _ => false
  }
}

///|
fn has_bulk_pop(block : @direct_ir.Block) -> Bool {
  let mut previous = false
  for instruction in block.instructions {
    let pop = unbound_pop(instruction)
    if previous && pop {
      return true
    }
    previous = pop
  }
  false
}

///|
fn Emitter::pop_one(self : Emitter) -> Array[@mbt_ast.Stmt] {
  [
    Eval(call("ignore", [dot_call(self.machine("data"), "unsafe_pop", [])])),
    Assign(
      self.machine("states"),
      dot_call(self.machine("states"), "unsafe_tail", []),
    ),
  ]
}

///|
fn Emitter::pop_cells(self : Emitter, count : Int32) -> Array[@mbt_ast.Stmt] {
  if count == 1 {
    return self.pop_one()
  }
  if self.chunked {
    [Eval(call("yy_pop", [Ident("_env"), Int(count)]))]
  } else {
    [ForEach([Any], Range(Int(0), Int(count), false), body(self.pop_one()))]
  }
}

///|
/// Keep the original per-cell data/state pop order; share the loop, not an
/// action interpreter. The call site supplies a statically known RHS length.
fn Emitter::pop_item(self : Emitter) -> @mbt_ast.Item {
  @mbt_ast.item(
    Function(
      @mbt_ast.function(
        "yy_pop",
        [typed("_env", type_("YYContext")), typed("count", type_("Int"))],
        body([
          ForEach(
            [Any],
            Range(Int(0), Ident("count"), false),
            body(self.pop_one()),
          ),
        ]),
        result=type_("Unit"),
      ),
    ),
    attributes=[{ name: "inline", arguments: [Positional(Ident("never"))], }],
  )
}

///|
fn Emitter::block_instructions(
  self : Emitter,
  block : @direct_ir.Block,
) -> Array[@mbt_ast.Stmt] {
  if self.chunked && shift_target(block) is Some(target) {
    return [Eval(call("yy_shift", [Ident("_env"), Int(target)]))]
  }
  let args = action_arguments(block, self.program.actions)
  let statements = []
  let mut index = 0
  while index < block.instructions.length() {
    let instruction = block.instructions[index]
    if unbound_pop(instruction) {
      let start = index
      while index < block.instructions.length() &&
            unbound_pop(block.instructions[index]) {
        index += 1
      }
      statements.append(self.pop_cells(index - start))
      continue
    }
    match instruction {
      Action(id, values, last, result) if args.slices.contains(index) =>
        statements.push(self.stack_action(id, values.length(), last, result))
      Peek(depth, cell, regs) =>
        statements.append(
          self.bindings(
            depth,
            cell,
            regs.map(r => {
              match r {
                Some(reg) if args.unused.contains(reg.id) => None
                _ => r
              }
            }),
          ),
        )
      _ => statements.append(self.instruction(instruction))
    }
    index += 1
  }
  statements
}
