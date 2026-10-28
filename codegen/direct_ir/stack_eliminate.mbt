///|
const STACK_REGION_BLOCKS : Int32 = 16

///|
const STACK_REGION_INSTRUCTIONS : Int32 = 96

///|
/// Do not duplicate token dispatch or read another token. Requiring
/// the complete RHS in the virtual suffix also keeps partially reduced physical
/// RHSs on the existing shared, fused reduction path.
fn stack_inlineable(block : Block, available : Int32) -> Bool {
  let mut count = available
  for instruction in block.instructions {
    match instruction {
      EnsureLookahead | Input(_) | ConsumeLookahead => return false
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
  // Acceptance still observes a materialized result cell in this IR. Keep its
  // reader shared instead of constructing an unread cell before an inlined
  // return; terminal-stack erasure is a separate transformation.
  block.terminator is (Jump(_) | CaseState(_))
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
/// Small push continuations and complete checked shifts may start a region.
/// The token read/consume/snapshot order remains explicit in the latter case.
fn stack_region_root(block : Block) -> Bool {
  guard block.terminator is Jump(_) else { false }
  match block.instructions {
    [Push(cell, _)] => cell.fields == [State, Semantic, Start, End]
    [
      Input(token, value, start, end),
      Push(cell, [_, Reg(v), Reg(s), Reg(e)]),
      ConsumeLookahead,
      SaveErrorSnapshot([]),
    ] =>
      cell.symbol == Some(token) &&
      cell.fields == [State, Semantic, Start, End] &&
      value == v &&
      start == s &&
      end == e
    _ => false
  }
}

///|
priv struct StackRegion {
  block : Block
  resolved_states : Int32
}

///|
fn Program::stack_region(
  self : Program,
  label : Int32,
  root : Block,
  supply : RegisterSupply,
  incoming_state? : Int32,
) -> StackRegion? raise InvalidProgram {
  // Structural eligibility, not Origin: leave canonical reductions shared.
  guard stack_region_root(root) else { None }
  let mut rewrite = StackRewrite::new(incoming_state?)
  let segments = [(label, root)]
  let mut cost = root.instructions.length()
  for instruction in root.instructions {
    rewrite.instruction(instruction)
  }
  let path = Set([label])
  let mut terminator = root.terminator
  let mut resolved_states = 0
  while path.length() < STACK_REGION_BLOCKS {
    guard !rewrite.pending.is_empty() || rewrite.prefix_state is Some(_) else {
      break
    }
    guard rewrite.finish(terminator) is Jump(edge) else { break }
    let target = self.blocks[edge.target]
    guard !path.contains(edge.target) &&
      cost + target.instructions.length() + 1 <= STACK_REGION_INSTRUCTIONS &&
      stack_inlineable(target, rewrite.pending.length()) else {
      break
    }
    let target = supply.clone_block(target)
    let trial = rewrite.copy()
    let bindings = Bind(
      target.parameters.mapi((i, reg) => (reg, edge.arguments[i])),
    )
    trial.instruction(bindings)
    for instruction in target.instructions {
      trial.instruction(instruction)
    }
    // Unknown goto switches remain shared; only enter a state dispatch when
    // its selected edge is already determined by this region.
    guard !(trial.finish(target.terminator) is CaseState(_)) else { break }
    if terminator is CaseState(_) {
      resolved_states += 1
    }
    path.add(edge.target)
    segments.push((edge.target, target))
    cost += target.instructions.length() + 1
    rewrite = trial
    terminator = target.terminator
  }
  guard rewrite.cancelled > 0 else { None }
  let finish = rewrite.finish(terminator)
  if terminator is CaseState(_) && finish is Jump(_) {
    resolved_states += 1
  }
  rewrite.flush()
  let after = { ..root, instructions: rewrite.output, terminator: finish, }
  require(
    check_stack_region(segments, after, incoming_state?),
    "invalid stack rewrite at block \{label}",
  )
  Some({ block: after, resolved_states, })
}

///|
/// Eliminate proven temporary shift/goto cells in bounded straight-line regions.
/// Requires a validated program. Each rewrite is independently checked before
/// replacement. Snapshots capture virtual states; unknown control flow keeps a
/// materialized stack.
pub fn Program::eliminate_stack(self : Program) -> Program raise InvalidProgram {
  let supply = RegisterSupply::new(self)
  let blocks = self.blocks.mapi((label, block) => {
    match self.stack_region(label, block, supply) {
      Some(region) => region.block
      None => block
    }
  })
  Program::{ ..self, blocks, }.compact()
}
