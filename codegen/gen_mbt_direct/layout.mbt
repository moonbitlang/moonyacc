///|
/// Emitted PCs are separate from IR labels and LR states. Aliased blocks keep
/// their original provenance in the validated IR.
priv struct BlockLayout {
  blocks : Array[Int32]
  labels : Array[Int32]
}

///|
fn shared_stop(block : @direct_ir.Block) -> Bool {
  block.parameters.is_empty() &&
  block.instructions.is_empty() &&
  block.terminator is Stop
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
fn BlockLayout::pc(self : BlockLayout, label : Int32) -> Int32 {
  let pc = self.labels[label]
  guard! pc >= 0
  pc
}

///|
fn successors(terminator : @direct_ir.Terminator) -> Array[Int32] {
  match terminator {
    Jump(edge) => [edge.target]
    CaseToken(arms, fallback) => {
      let targets = []
      for (_, body) in arms {
        targets.append(successors(body.terminator))
      }
      targets.append(successors(fallback.terminator))
      targets
    }
    CaseState(_, arms) => {
      let targets = []
      for (_, body) in arms {
        targets.append(successors(body.terminator))
      }
      targets
    }
    Return(_) | Stop | Unreachable => []
  }
}
