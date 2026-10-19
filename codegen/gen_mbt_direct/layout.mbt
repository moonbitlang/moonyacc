///|
/// Emitted PCs are separate from IR labels and LR states. Aliased blocks keep
/// their original provenance in the validated IR.
priv struct BlockLayout {
  blocks : Array[Int]
  labels : Array[Int]
}

///|
fn shared_stop(block : @direct_ir.Block) -> Bool {
  block.parameters.is_empty() &&
  block.instructions.is_empty() &&
  block.terminator is Stop(_)
}

///|
fn BlockLayout::new(blocks : Array[@direct_ir.Block]) -> BlockLayout {
  let labels = Array::make(blocks.length(), -1)
  let emitted = []
  let mut stop = None
  for label, block in blocks {
    if shared_stop(block) && stop is Some(pc) {
      labels[label] = pc
      continue
    }
    let pc = emitted.length()
    labels[label] = pc
    emitted.push(label)
    if shared_stop(block) {
      stop = Some(pc)
    }
  }
  { blocks: emitted, labels, }
}

///|
fn BlockLayout::pc(self : BlockLayout, label : Int) -> Int {
  let pc = self.labels[label]
  guard! pc >= 0
  pc
}

///|
fn successors(terminator : @direct_ir.Terminator) -> Array[Int] {
  match terminator {
    Jump(edge) => [edge.target]
    CaseToken(arms, fallback) => {
      let targets = arms.map(p => p.1.target)
      targets.push(fallback.target)
      targets
    }
    CaseState(_, arms) => arms.map(p => p.1.target)
    Return(_) | Stop(_) | Unreachable => []
  }
}
