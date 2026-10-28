///|
priv struct ReductionPlan {
  action : Int32
  args : Array[@direct_ir.ActionArgument]
  before : @direct_ir.Register
  result : @direct_ir.Register
  predecessor : @direct_ir.Register
}

///|
/// Recognize the whole read/action/pop sequence, not its Origin annotation.
/// Borrowing a typed suffix is safe only across these pure reads and one action;
/// the actual stack is updated after that action, preserving its effect order.
fn reduction_plan(
  block : @direct_ir.Block,
  actions : Array[@direct_ir.ActionSignature],
) -> ReductionPlan? {
  guard block.parameters.is_empty() else { None }
  let instructions = block.instructions
  let mut action_index = -1
  for i, instruction in instructions {
    if instruction is Action(_) {
      action_index = i
      break
    }
  }
  guard action_index > 0 &&
    instructions[action_index] is Action(id, args, Reg(before), result) else {
    None
  }
  let rhs = actions[id].rhs
  let n = rhs.length()
  guard action_index == n + 1 && instructions.length() == 2 * n + 3 else {
    None
  }
  guard instructions[n] is ReadPreviousPosition(depth, reg) &&
    depth == n &&
    reg == before else {
    None
  }
  for i, symbol in rhs {
    guard instructions[i]
      is Peek(depth, cell, [None, Some(value), Some(start), Some(end)]) &&
      depth == n - i - 1 &&
      cell.symbol == Some(symbol) &&
      cell.fields == [State, Semantic, Start, End] &&
      args[i].value == Reg(value) &&
      args[i].start == Reg(start) &&
      args[i].end == Reg(end) else {
      return None
    }
    guard instructions[n + 2 + i] is Pop(cell, [None, None, None, None]) &&
      cell.symbol == Some(rhs[n - i - 1]) &&
      cell.fields == [State, Semantic, Start, End] else {
      return None
    }
  }
  guard instructions[2 * n + 2] is Peek(0, cell, [Some(predecessor)]) &&
    cell.symbol is None &&
    cell.fields == [State] else {
    None
  }
  Some({ action: id, args, before, result, predecessor, })
}

///|
fn Emitter::rhs_pattern(
  self : Emitter,
  value : @direct_ir.Value,
  assignments : Array[@mbt_ast.Stmt],
) -> @mbt_ast.Pattern {
  guard! value is Reg(reg)
  if self.erased_register(reg) {
    return Any
  }
  if self.slots.contains(reg.id) {
    let name = "_yy_read\{reg.id}"
    assignments.push(self.bind_register(reg, Ident(name)))
    Bind(name)
  } else {
    Bind("_yy_r\{reg.id}")
  }
}

///|
fn Emitter::reduction_instructions(
  self : Emitter,
  plan : ReductionPlan,
  unused : Set[Int32],
) -> Array[@mbt_ast.Stmt] {
  let statements = []
  let rhs = self.program.actions[plan.action].rhs
  let mut stack = self.machine("stack")
  for i in rhs.length()>..0 {
    let cell : @direct_ir.Cell = {
      symbol: Some(rhs[i]),
      fields: [State, Semantic, Start, End],
    }
    let assigns = []
    let arg = plan.args[i]
    let pattern = self
      .cell_layout(cell)
      .pattern(
        Bind("_yy_tail\{i}"),
        Bind("_yy_saved\{i}"),
        self.rhs_pattern(arg.value, assigns),
        self.rhs_pattern(arg.start, assigns),
        self.rhs_pattern(arg.end, assigns),
      )
    statements.push(@mbt_ast.Stmt::Assert(Is(stack, pattern)))
    statements.append(assigns)
    stack = Ident("_yy_tail\{i}")
  }
  if !self.erased_register(plan.before) && !unused.contains(plan.before.id) {
    statements.push(
      self.bind_register(plan.before, self.previous_position_at(stack)),
    )
  }
  statements.append(
    self.action_binding(plan.action, plan.args, Reg(plan.before), plan.result),
  )
  if !rhs.is_empty() {
    statements.append([
      Assign(self.machine("stack"), stack),
      Assign(self.machine("state"), Ident("_yy_saved0")),
    ])
  }
  statements.push(self.bind_register(plan.predecessor, self.machine("state")))
  statements
}
