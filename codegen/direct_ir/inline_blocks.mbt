// In-degree and hint policy follow Menhir's StackLangTransform.Inline.

///|
fn Program::in_degree(self : Program) -> Array[Int32] {
  let degree = Array::make(self.blocks.length(), 0)
  fn visit(term : Terminator, state_case : Bool) {
    match term {
      Jump(edge) =>
        degree[edge.target] = Int32::min(
          2,
          degree[edge.target] + (if state_case { 2 } else { 1 }),
        )
      CaseToken(arms, fallback) => {
        for (_, body) in arms {
          visit(body.terminator, state_case)
        }
        visit(fallback.terminator, state_case)
      }
      CaseState(_, arms) =>
        for (_, body) in arms {
          visit(body.terminator, true)
        }
      Return(_) | Stop | Unreachable => ()
    }
  }
  for entry in self.entries {
    degree[entry.block] = 2
  }
  for block in self.blocks {
    visit(block.terminator, false)
  }
  degree
}

///|
fn inline_permitted(
  owner : InlineHint,
  target : InlineHint,
  cautious : Bool,
) -> Bool {
  match target {
    IfKnownState => false
    Always | IfCells(_) => !cautious
    NoHint => !cautious || owner is NoHint
  }
}

///|
priv struct BlockInliner {
  program : Program
  degree : Array[Int32]
  supply : RegisterSupply
  cautious : Bool
}

///|
fn BlockInliner::body(
  self : BlockInliner,
  body : Body,
  owner : InlineHint,
  path : Set[Int32],
) -> Body {
  let instructions = body.instructions.copy()
  let mut terminator = body.terminator
  while terminator is Jump(edge) {
    let target = self.program.blocks[edge.target]
    if self.degree[edge.target] != 1 ||
      path.contains(edge.target) ||
      !inline_permitted(owner, target.hint, self.cautious) {
      break
    }
    path.add(edge.target)
    let copy = self.supply.clone_block(target)
    instructions.push(
      Bind(copy.parameters.mapi((i, reg) => (reg, edge.arguments[i]))),
    )
    instructions.append(copy.instructions)
    terminator = copy.terminator
  }
  let terminator = match terminator {
    CaseToken(arms, fallback) =>
      CaseToken(
        arms.map(p => (p.0, self.body(p.1, owner, path.copy()))),
        self.body(fallback, owner, path.copy()),
      )
    // Keeping state cases small preserves sharing and their type refinements.
    _ => terminator
  }
  { instructions, terminator, }
}

///|
pub fn Program::inline_blocks(
  self : Program,
  cautious~ : Bool,
) -> Program raise InvalidProgram {
  let inliner = BlockInliner::{
    program: self,
    degree: self.in_degree(),
    supply: RegisterSupply::new(self),
    cautious,
  }
  let blocks = self.blocks.mapi((label, block) => {
    let body = inliner.body(
      { instructions: block.instructions, terminator: block.terminator, },
      block.hint,
      Set([label]),
    )
    { ..block, instructions: body.instructions, terminator: body.terminator, }
  })
  let program = Program::{ ..self, blocks, }.compact()
  program.validate()
  program
}
