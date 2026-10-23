///|
/// Substitute only stable IR values. No instruction (in particular no action,
/// input read, stack mutation or snapshot) is moved or duplicated.
fn Program::thread_edge(self : Program, original : Edge) -> Edge {
  let seen = Set([])
  for edge = original {
    if seen.contains(edge.target) {
      // Leave pure forwarding cycles intact, including parameter permutations.
      return original
    }
    seen.add(edge.target)
    let block = self.blocks[edge.target]
    guard block.instructions.is_empty() && block.terminator is Jump(next) else {
      return edge
    }
    let values : Map[Int32, Value] = Map([])
    for i, parameter in block.parameters {
      values[parameter.id] = edge.arguments[i]
    }
    continue {
        target: next.target,
        arguments: next.arguments.map(v => {
          match v {
            Reg(reg) => values[reg.id]
            State(_) => v
          }
        }),
      }
  }
}

///|
/// Requires a validated program. Remove empty forwarding blocks and unreachable
/// blocks; retain the order of every effectful instruction.
pub fn Program::simplify(self : Program) -> Program {
  let blocks = self.blocks.map(b => {
    ..b,
    terminator: b.terminator.map_edges(e => self.thread_edge(e)),
  })
  let entries = self.entries.map(e => {
    let target = self.thread_edge({ target: e.block, arguments: [], })
    // Public entries have no block arguments. Keep an initializer block when
    // threading would require passing constants to the destination.
    if target.arguments.is_empty() {
      { ..e, block: target.target, }
    } else {
      e
    }
  })
  Program::{ ..self, blocks, entries, }.compact()
}

///|
fn Program::compact(self : Program) -> Program {
  let reachable = Set([])
  let pending = self.entries.map(e => e.block)
  while pending.pop() is Some(label) {
    if !reachable.contains(label) {
      reachable.add(label)
      pending.append(self.blocks[label].terminator.successors())
    }
  }
  let labels : Map[Int32, Int32] = Map([])
  for label, _ in self.blocks {
    if reachable.contains(label) {
      labels[label] = labels.length()
    }
  }
  let blocks = []
  for label, block in self.blocks {
    if reachable.contains(label) {
      blocks.push({
        ..block,
        terminator: block.terminator.map_edges(e => {
          ..e,
          target: labels[e.target],
        }),
      })
    }
  }
  {
    ..self,
    blocks,
    entries: self.entries.map(e => { ..e, block: labels[e.block], }),
  }
}
