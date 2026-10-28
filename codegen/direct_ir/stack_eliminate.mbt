///|
const STACK_REGION_BLOCKS : Int32 = 16

///|
const STACK_REGION_INSTRUCTIONS : Int32 = 96

///|
/// Do not duplicate token dispatch or change the last-shift checkpoint. Requiring
/// the complete RHS in the virtual suffix also keeps partially reduced physical
/// RHSs on the existing shared, fused reduction path.
fn stack_inlineable(block : Block, available : Int32) -> Bool {
  let mut count = available
  for instruction in block.instructions {
    match instruction {
      EnsureLookahead | Input(_) | ConsumeLookahead | SaveErrorSnapshot =>
        return false
      Push(cell, _) => {
        if cell.fields != [State, Semantic, Start, End] {
          return false
        }
        count += 1
      }
      Pop(cell, _) => {
        if count == 0 || cell.fields != [State, Semantic, Start, End] {
          return false
        }
        count -= 1
      }
      Peek(depth, cell, _) if cell.symbol is Some(_) =>
        if depth >= count || cell.fields != [State, Semantic, Start, End] {
          return false
        }
      _ => ()
    }
  }
  !(block.terminator is CaseToken(_))
}

///|
fn StackRewrite::finish(
  self : StackRewrite,
  terminator : Terminator,
) -> Terminator {
  let terminator = terminator.map_values(v => self.value(v))
  if terminator is CaseState(State(state), arms) {
    for (pattern, edge) in arms {
      if pattern == state {
        return Jump(edge)
      }
    }
  }
  terminator
}

///|
fn Program::stack_region(
  self : Program,
  label : Int32,
  supply : RegisterSupply,
) -> Block? raise InvalidProgram {
  let root = self.blocks[label]
  // Structural eligibility, not Origin: leave canonical reductions and shifts
  // shared. Only the small goto push continuations start an expansion region.
  guard root.instructions is [Push(cell, _)] &&
    cell.fields == [State, Semantic, Start, End] &&
    root.terminator is Jump(_) else {
    None
  }
  let rewrite = StackRewrite::new()
  let original = root.instructions.copy()
  for instruction in original {
    rewrite.instruction(instruction)
  }
  let path = Set([label])
  let mut terminator = root.terminator
  while !rewrite.pending.is_empty() && path.length() < STACK_REGION_BLOCKS {
    // State specialization and token-branch cloning belong to later passes.
    guard terminator is Jump(edge) else { break }
    let target = self.blocks[edge.target]
    guard !path.contains(edge.target) &&
      original.length() + target.instructions.length() + 1 <=
      STACK_REGION_INSTRUCTIONS &&
      stack_inlineable(target, rewrite.pending.length()) else {
      break
    }
    path.add(edge.target)
    let target = supply.clone_block(target)
    let bindings = Bind(
      target.parameters.mapi((i, reg) => (reg, edge.arguments[i])),
    )
    original.push(bindings)
    rewrite.instruction(bindings)
    original.append(target.instructions)
    for instruction in target.instructions {
      rewrite.instruction(instruction)
    }
    terminator = target.terminator
  }
  guard rewrite.cancelled > 0 else { None }
  rewrite.flush()
  let before = { ..root, instructions: original, terminator, }
  let after = {
    ..root,
    instructions: rewrite.output,
    terminator: rewrite.finish(terminator),
  }
  require(
    check_stack_rewrite(before, after),
    "invalid stack rewrite at block \{label}",
  )
  Some(after)
}

///|
/// Eliminate proven temporary goto cells in bounded straight-line regions.
/// Requires a validated program. Each rewrite is independently checked before
/// replacement; snapshots and unknown control flow retain materialized stacks.
pub fn Program::eliminate_stack(self : Program) -> Program raise InvalidProgram {
  let supply = RegisterSupply::new(self)
  let blocks = self.blocks.mapi((label, block) => {
    self.stack_region(label, supply).unwrap_or(block)
  })
  Program::{ ..self, blocks, }.compact()
}
