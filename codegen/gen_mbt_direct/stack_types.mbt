///|
/// Symbols with equal value types still have distinct constructors, as in
/// Menhir's symbol-indexed cells. A missing value is a distinct checked shape.
/// The cached state describes the top of the stack; every cell saves its
/// predecessor's state. Push and pop preserve this relation. Constructor
/// patterns check the shape obligation carried by Menhir's stack GADT.
priv struct StackCell {
  symbol : Int32
  has_value : Bool
  start : Bool
  end : Bool
} derive(Eq)

///|
fn is_unit(type_ : @elab.TypeExpr) -> Bool {
  type_ is Constr(pkg=None, "Unit", [])
}

///|
fn position_reads(program : @direct_ir.Program) -> (Set[Int32], Set[Int32]) {
  let starts = Set([])
  let ends = Set([])
  for block in program.blocks {
    for instruction in block.instructions {
      match instruction {
        Peek(_, cell, regs) | Pop(cell, regs) =>
          if cell.symbol is Some(symbol) {
            for i, reg in regs {
              if reg is Some(_) {
                match cell.fields[i] {
                  Start => starts.add(symbol)
                  End => ends.add(symbol)
                  _ => ()
                }
              }
            }
          }
        _ => ()
      }
    }
  }
  (starts, ends)
}

///|
fn stack_cells(
  program : @direct_ir.Program,
  positions : Bool,
  reads_previous : Bool,
) -> Array[StackCell] {
  let (starts, ends) = if positions {
    position_reads(program)
  } else {
    (Set([]), Set([]))
  }
  let cells = []
  for block in program.blocks {
    for instruction in block.instructions {
      if instruction is Push(cell, _) {
        guard! cell.symbol is Some(symbol)
        let layout = StackCell::{
          symbol,
          has_value: cell.fields.contains(Semantic) &&
          !is_unit(program.symbols[symbol].type_),
          start: starts.contains(symbol),
          end: positions && (reads_previous || ends.contains(symbol)),
        }
        if !cells.contains(layout) {
          cells.push(layout)
        }
      }
    }
  }
  cells
}

///|
fn StackCell::name(self : StackCell) -> String {
  "YYCell_\{self.symbol}" + (if self.has_value { "" } else { "_void" })
}

///|
fn Emitter::cell_layout(self : Emitter, cell : @direct_ir.Cell) -> StackCell {
  guard! cell.symbol is Some(symbol)
  let has_value = cell.fields.contains(Semantic) &&
    !is_unit(self.program.symbols[symbol].type_)
  self.cells[self.cells
  .search_by(cell => cell.symbol == symbol && cell.has_value == has_value)
  .unwrap()]
}

///|
fn StackCell::pattern(
  cell : StackCell,
  tail : @mbt_ast.Pattern,
  state : @mbt_ast.Pattern,
  value : @mbt_ast.Pattern,
  start : @mbt_ast.Pattern,
  end : @mbt_ast.Pattern,
) -> @mbt_ast.Pattern {
  let fields = [tail, state]
  if cell.has_value {
    fields.push(value)
  }
  if cell.start {
    fields.push(start)
  }
  if cell.end {
    fields.push(end)
  }
  Constructor(cell.name(), fields)
}

///|
fn StackCell::construct(
  cell : StackCell,
  tail : @mbt_ast.Expr,
  state : @mbt_ast.Expr,
  value : @mbt_ast.Expr,
  start : @mbt_ast.Expr,
  end : @mbt_ast.Expr,
) -> @mbt_ast.Expr {
  let fields = [tail, state]
  if cell.has_value {
    fields.push(value)
  }
  if cell.start {
    fields.push(start)
  }
  if cell.end {
    fields.push(end)
  }
  call(cell.name(), fields)
}

///|
fn Emitter::stack_item(self : Emitter) -> @mbt_ast.Item {
  let constructors : Array[@mbt_ast.Constructor] = [
    { name: "YYEmpty", arguments: [], },
  ]
  for cell in self.cells {
    let fields = [type_("YYStack"), type_("Int")]
    if cell.has_value {
      fields.push(self.program.symbols[cell.symbol].type_)
    }
    if cell.start {
      fields.push(self.meta.position_data_type)
    }
    if cell.end {
      fields.push(self.meta.position_data_type)
    }
    constructors.push({ name: cell.name(), arguments: fields, })
  }
  @mbt_ast.item(Enum("YYStack", constructors, []), visibility=Private)
}

///|
fn Emitter::stack_call(
  self : Emitter,
  name : String,
  args : Array[@mbt_ast.Expr],
) -> @mbt_ast.Expr {
  self.stack_helpers.add(name)
  call("yy_stack_" + name, args)
}

///|
fn Emitter::stack_at(self : Emitter, depth : Int32) -> @mbt_ast.Expr {
  if depth == 0 {
    self.machine("stack")
  } else {
    self.stack_call("drop", [self.machine("stack"), Int(depth)])
  }
}

///|
fn Emitter::state_at(self : Emitter, depth : Int32) -> @mbt_ast.Expr {
  if depth == 0 {
    self.machine("state")
  } else {
    self.stack_call("state", [
      self.machine("stack"),
      self.machine("state"),
      Int(depth),
    ])
  }
}
