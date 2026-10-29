///|
/// Partition the optimized CFG for iterative dispatch on every target.
const BLOCKS_PER_CHUNK = 32

///|
const SMALL_BLOCKS_PER_CHUNK = 64

///|
const SMALL_DISPATCH_COST = 512

///|
/// Avoid splitting a small dispatch just past 32 labels, while bounding the
/// larger function by emitted instructions, parameters and branch copies.
fn dispatch_width(
  blocks : Array[@direct_ir.Block],
  layout : BlockLayout,
) -> Int32 {
  if layout.blocks.length() > SMALL_BLOCKS_PER_CHUNK {
    return BLOCKS_PER_CHUNK
  }
  let mut remaining = SMALL_DISPATCH_COST
  fn spend(cost : Int32) -> Bool {
    if cost > remaining {
      false
    } else {
      remaining -= cost
      true
    }
  }
  fn fits(
    instructions : Array[@direct_ir.Instruction],
    term : @direct_ir.Terminator,
  ) -> Bool {
    if !spend(instructions.length()) || !spend(1) {
      return false
    }
    match term {
      Jump(edge) => spend(edge.arguments.length())
      CaseToken(arms, fallback) => {
        for (_, body) in arms {
          if !fits(body.instructions, body.terminator) {
            return false
          }
        }
        fits(fallback.instructions, fallback.terminator)
      }
      CaseState(_, arms) => {
        for (_, body) in arms {
          if !fits(body.instructions, body.terminator) {
            return false
          }
        }
        true
      }
      Return(_) | Stop | Unreachable => true
    }
  }
  for label in layout.blocks {
    let block = blocks[label]
    if !spend(block.parameters.length()) ||
      !fits(block.instructions, block.terminator) {
      return BLOCKS_PER_CHUNK
    }
  }
  SMALL_BLOCKS_PER_CHUNK
}
