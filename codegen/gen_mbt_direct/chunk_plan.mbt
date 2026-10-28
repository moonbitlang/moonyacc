///|
/// Large parsers retain small Wasm functions and bounded local counts.
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
  fn edge_fits(edge : @direct_ir.Edge) -> Bool {
    spend(edge.arguments.length()) && spend(1)
  }
  for label in layout.blocks {
    let block = blocks[label]
    if !spend(block.instructions.length()) ||
      !spend(block.parameters.length()) ||
      !spend(1) {
      return BLOCKS_PER_CHUNK
    }
    match block.terminator {
      Jump(edge) => if !edge_fits(edge) { return BLOCKS_PER_CHUNK }
      CaseToken(arms, fallback) => {
        for (_, edge) in arms {
          if !edge_fits(edge) {
            return BLOCKS_PER_CHUNK
          }
        }
        if !edge_fits(fallback) {
          return BLOCKS_PER_CHUNK
        }
      }
      CaseState(_, arms) =>
        for (_, edge) in arms {
          if !edge_fits(edge) {
            return BLOCKS_PER_CHUNK
          }
        }
      Return(_) | Stop(_) | Unreachable => ()
    }
  }
  SMALL_BLOCKS_PER_CHUNK
}
