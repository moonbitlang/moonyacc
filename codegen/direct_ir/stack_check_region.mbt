///|
/// Crossing a block boundary is allowed only after its original terminator has
/// independently selected the next label. Edge arguments are all read before
/// binding any of the next block's fresh parameters.
fn StackCheck::enter(
  self : StackCheck,
  terminator : Terminator,
  label : Int32,
  parameters : Array[Register],
) -> Unit raise InvalidProgram {
  guard self.terminator(terminator) is CheckJump(edge) else {
    raise InvalidProgram("stack region crosses an unknown branch")
  }
  require(edge.target == label, "stack region follows a wrong branch")
  require(
    edge.arguments.length() == parameters.length(),
    "stack region edge arity",
  )
  for i, parameter in parameters {
    self.bind_value(parameter, edge.arguments[i])
  }
}

///|
fn stack_check_region_run(
  segments : Array[(Int32, Block)],
  incoming_state? : Int32,
) -> (StackCheckStack, Array[StackCheckEvent], StackCheckTerminator) raise InvalidProgram {
  require(!segments.is_empty(), "empty stack region")
  let machine = StackCheck::new(incoming_state?)
  let first = segments[0].1
  for parameter in first.parameters {
    machine.bind_value(parameter, SymParameter(parameter))
  }
  for index, (label, block) in segments {
    if index > 0 {
      machine.enter(segments[index - 1].1.terminator, label, block.parameters)
    }
    for instruction in block.instructions {
      machine.instruction(instruction)
    }
  }
  (
    machine.stack(),
    machine.trace,
    machine.terminator(segments[segments.length() - 1].1.terminator),
  )
}

///|
/// Segments retain SSA-freshened source blocks and their original terminators.
/// The caller proves the seed for every redirected incoming edge separately;
/// it grants no assumption about prefix height, symbols or other state values.
fn check_stack_region(
  segments : Array[(Int32, Block)],
  after : Block,
  incoming_state? : Int32,
) -> Bool {
  guard !segments.is_empty() else { false }
  let before = segments[0].1
  if segments.length() == 1 {
    return check_stack_rewrite(before, after, incoming_state?)
  }
  if before.parameters != after.parameters ||
    before.lookahead != after.lookahead ||
    (incoming_state is Some(state) && state < 0) {
    return false
  }
  try
    stack_check_region_run(segments, incoming_state?) ==
    stack_check_run(after, incoming_state?)
  catch {
    InvalidProgram(_) => false
  }
}
