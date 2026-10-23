///|
/// Bound Wasm function size/local counts without relying on tail calls.
const BLOCKS_PER_CHUNK = 32

///|
priv struct Emitter {
  program : @direct_ir.Program
  meta : @codegen.MetaProvider
  support : @mbt_common.Context
  input_mode : @codegen.InputMode
  layout : BlockLayout
  gotos : Map[Int32, GotoPlan]
  chunked : Bool
  consumes_input : Bool
  saves_snapshot : Bool
  slots : Map[Int32, (Int32, Int32)]
  maxima : Array[Int32]
  chunk_loops : Set[Int32]
  chunk_errors : Set[Int32]
}

///|
fn Emitter::new(
  program : @direct_ir.Program,
  meta : @codegen.MetaProvider,
  support : @mbt_common.Context,
  input_mode : @codegen.InputMode,
) -> Emitter {
  let (gotos, omitted) = plan_gotos(
    program.blocks,
    program.entries.map(e => e.block),
  )
  let self = Emitter::{
    program,
    meta,
    support,
    input_mode,
    layout: BlockLayout::new(program.blocks, omitted~),
    gotos,
    // Keep shared runtime helpers when compaction leaves just one chunk.
    chunked: program.blocks.length() > BLOCKS_PER_CHUNK,
    consumes_input: program.blocks
    .iter()
    .any(b => b.instructions.iter().any(i => i is ConsumeLookahead)),
    saves_snapshot: program.blocks
    .iter()
    .any(b => b.instructions.iter().any(i => i is SaveErrorSnapshot)),
    slots: {},
    maxima: [0, 0, 0],
    chunk_loops: Set([]),
    chunk_errors: Set([]),
  }
  for block in program.blocks {
    self.allocate_parameters(block.parameters)
  }
  for pc, label in self.layout.blocks {
    self.plan_control(label, pc / BLOCKS_PER_CHUNK)
  }
  coalesce_results(program.blocks, self.slots)
  self
}

///|
fn Emitter::chunk_count(self : Emitter) -> Int32 {
  (self.layout.blocks.length() + BLOCKS_PER_CHUNK - 1) / BLOCKS_PER_CHUNK
}

///|
/// Block parameters do not coexist. Reuse slots by physical representation.
fn Emitter::allocate_parameters(
  self : Emitter,
  parameters : Array[@direct_ir.Register],
) -> Unit {
  let counts = [0, 0, 0]
  for parameter in parameters {
    let kind = match parameter.type_ {
      State => 0
      Semantic(_) => 1
      Position => 2
    }
    self.slots[parameter.id] = (kind, counts[kind])
    counts[kind] += 1
    self.maxima[kind] = Int32::max(self.maxima[kind], counts[kind])
  }
}

///|
fn Emitter::plan_control(self : Emitter, label : Int32, chunk : Int32) -> Unit {
  let block = self.program.blocks[label]
  if block.terminator is Stop(_) {
    self.chunk_errors.add(chunk)
  }
  let targets = match self.gotos.get(label) {
    Some(plan) => plan.choices.map(p => p.1.label)
    None => successors(block.terminator)
  }
  if targets
    .iter()
    .any(target => self.layout.pc(target) / BLOCKS_PER_CHUNK == chunk) {
    self.chunk_loops.add(chunk)
  }
}

///|
fn Emitter::machine(self : Emitter, name : String) -> @mbt_ast.Expr {
  if self.chunked {
    Field(Ident("_env"), Named(name))
  } else {
    Ident(name)
  }
}

///|
fn Emitter::register(
  self : Emitter,
  reg : @direct_ir.Register,
) -> @mbt_ast.Expr {
  match self.slots.get(reg.id) {
    Some((kind, index)) => self.machine("_yy_p\{kind}_\{index}")
    None => Ident("_yy_r\{reg.id}")
  }
}

///|
fn Emitter::value(self : Emitter, value : @direct_ir.Value) -> @mbt_ast.Expr {
  match value {
    Reg(reg) => self.register(reg)
    State(id) => Int(id)
  }
}

///|
fn Emitter::slot_type(self : Emitter, kind : Int32) -> @elab.TypeExpr {
  match kind {
    0 => type_("Int")
    1 => type_("YYObj")
    _ => self.meta.position_data_type
  }
}

///|
fn slot_initial(kind : Int32) -> @mbt_ast.Expr {
  match kind {
    0 => Int(0)
    1 => Ident("YYObj_Void")
    _ => Ident("initial_position")
  }
}
