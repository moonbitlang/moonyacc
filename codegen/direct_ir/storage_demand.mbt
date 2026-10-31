///|
/// This least fixed point determines which registers and symbol fields need a
/// representation. State fields remain available to the logical stack proof.
pub(all) struct StorageDemand {
  registers : Set[Int32]
  fields : Array[Set[Field]]
}

///|
pub fn Program::storage_demand(
  self : Program,
  flow : StackFlow,
  positions~ : Bool,
) -> StorageDemand {
  let registers = Set([])
  // Expected-token diagnostics can observe every materialized LR state. This
  // is a stronger observer than Menhir's bare Error exit, so State is always
  // demanded; semantic values and positions are determined by the fixed point.
  let fields : Array[Set[Field]] = self.symbols.map(_ => Set([State]))
  let mut changed = true
  fn use_(value : Value) {
    if value is Reg(reg) && !registers.contains(reg.id) {
      registers.add(reg.id)
      changed = true
    }
  }
  fn field(symbol : Int32, field : Field) {
    if (field is (Start | End) && !positions) ||
      (
        field is Semantic &&
        self.symbols[symbol].type_ is Constr(pkg=None, "Unit", [])
      ) {
      return
    }
    if !fields[symbol].contains(field) {
      fields[symbol].add(field)
      changed = true
    }
  }
  fn body(instructions : Array[Instruction], term : Terminator) {
    for instruction in instructions {
      match instruction {
        Action(_, inputs, _) =>
          for value in inputs {
            use_(value)
          }
        SaveErrorSnapshot(suffix) =>
          for value in suffix {
            use_(value)
          }
        Bind(bindings) =>
          for (reg, value) in bindings {
            if registers.contains(reg.id) {
              use_(value)
            }
          }
        Push(cell, values) => {
          guard! cell.symbol is Some(symbol)
          for i, f in cell.fields {
            if fields[symbol].contains(f) {
              use_(values[i])
            }
          }
        }
        Peek(_, cell, bindings) | Pop(cell, bindings) =>
          if cell.symbol is Some(symbol) {
            for i, reg in bindings {
              if reg is Some(reg) && registers.contains(reg.id) {
                field(symbol, cell.fields[i])
              }
            }
          }
        ReadPreviousPosition(_, reg) if positions && registers.contains(reg.id) =>
          if flow.previous_symbols.get(reg.id) is Some(symbols) {
            for symbol in symbols {
              field(symbol, End)
            }
          }
        _ => ()
      }
    }
    match term {
      Jump(edge) =>
        for i, parameter in self.blocks[edge.target].parameters {
          if registers.contains(parameter.id) {
            use_(edge.arguments[i])
          }
        }
      CaseState(selector, _) | Return(_, selector) => use_(selector)
      _ => ()
    }
    for branch in term.bodies() {
      body(branch.instructions, branch.terminator)
    }
  }
  while changed {
    changed = false
    for block in self.blocks {
      body(block.instructions, block.terminator)
    }
  }
  { registers, fields, }
}
