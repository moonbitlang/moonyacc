///|
priv struct AlphaBlock {
  parameters : Array[ValueType]
  lookahead : Lookahead
  body : Body
}

///|
fn alpha_block(block : Block) -> AlphaBlock {
  let names : Map[Int32, Register] = Map([])
  for id, reg in block.definitions() {
    names[reg.id] = { ..reg, id, }
  }
  fn definition(reg : Register) -> Register {
    names[reg.id]
  }
  let body = Body::{
    instructions: block.instructions,
    terminator: block.terminator,
  }.map_registers(
    v => {
      match v {
        Reg(reg) => Reg(definition(reg))
        State(_) => v
      }
    },
    definition,
  )
  {
    parameters: block.parameters.map(r => r.type_),
    lookahead: block.lookahead,
    body,
  }
}

///|
/// Specialization can leave identical continuations with different SSA names.
/// Alpha equality preserves all operations, state constants, action IDs,
/// argument order and successor labels. Policies/origins are not semantics.
/// The layout owner must recompute stack/storage facts and assess the result:
/// merging contexts can lose useful facts even when the code is equivalent.
pub fn Program::merge_continuations(
  self : Program,
) -> Program raise InvalidProgram {
  self.validate()
  let canonical = self.blocks.map(alpha_block)
  let aliases = self.blocks.mapi((i, _) => i)
  let buckets : Map[(Int32, Int32, Int32), Array[Int32]] = Map([])
  for label, block in self.blocks {
    if self.entries.any(e => e.block == label) {
      continue
    }
    let key = (
      block.parameters.length(),
      block.instructions.length(),
      block.terminator.successors().get(0).unwrap_or(-1),
    )
    let candidates = buckets.get_or_init(key, () => [])
    let item = canonical[label]
    let equivalent = candidates.search_by(other => {
      let previous = canonical[other]
      item.parameters == previous.parameters &&
      item.lookahead == previous.lookahead &&
      item.body == previous.body
    })
    match equivalent {
      Some(index) => aliases[label] = candidates[index]
      None => candidates.push(label)
    }
  }
  let program = Program::{
    ..self,
    blocks: self.blocks.map(block => {
      ..block,
      terminator: block.terminator.map_edges(edge => {
        ..edge,
        target: aliases[edge.target],
      }),
    }),
  }.compact()
  program.validate()
  program
}
