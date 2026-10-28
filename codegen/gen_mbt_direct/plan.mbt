///|
/// Bound Wasm function size/local counts without relying on tail calls.
const BLOCKS_PER_CHUNK = 32

///|
priv struct Emitter {
  program : @direct_ir.Program
  meta : @codegen.MetaProvider
  support : @mbt_common.Context
  input_mode : @codegen.InputMode
  cache_json : Bool
  layout : BlockLayout
  gotos : Map[Int32, GotoPlan]
  chunked : Bool
  consumes_input : Bool
  saves_snapshot : Bool
  needs_initial_position : Bool
  slots : Map[Int32, (Int32, Int32)]
  slot_types : Array[SlotType]
  cells : Array[StackCell]
  stack_helpers : Set[String]
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
  let needs_initial_position = initial_position_needed(program, support, meta)
  let self = Emitter::{
    program,
    meta,
    support,
    input_mode,
    cache_json: support.is_json_cst() &&
    program.blocks.any(b => b.instructions.any(i => i is Input(_))),
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
    needs_initial_position,
    slots: {},
    slot_types: [],
    cells: stack_cells(
      program,
      support.tracks_positions(),
      needs_initial_position,
    ),
    stack_helpers: Set([]),
    maxima: [],
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
  let counts : Map[Int32, Int32] = Map([])
  for parameter in parameters {
    if self.erased_register(parameter) {
      continue
    }
    let kind = match
      self.slot_types.search_by(t => t.logical == parameter.type_) {
      Some(kind) => kind
      None => {
        let kind = self.slot_types.length()
        self.slot_types.push(
          slot_type(parameter.type_, self.meta.position_data_type),
        )
        self.maxima.push(0)
        kind
      }
    }
    let count = counts.get(kind).unwrap_or(0)
    self.slots[parameter.id] = (kind, count)
    counts[kind] = count + 1
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
  if self.erased_register(reg) {
    return Unit
  }
  let value = self.place(reg)
  match self.slots.get(reg.id) {
    Some((kind, _)) if self.slot_types[kind].optional =>
      dot_call(value, "unwrap", [])
    _ => value
  }
}

///|
fn Emitter::erased_register(self : Emitter, reg : @direct_ir.Register) -> Bool {
  match reg.type_ {
    Position => !self.support.tracks_positions()
    Semantic(Constr(pkg=None, "Unit", [])) => true
    _ => false
  }
}

///|
fn Emitter::value(self : Emitter, value : @direct_ir.Value) -> @mbt_ast.Expr {
  match value {
    Reg(reg) => self.register(reg)
    State(id) => Int(id)
  }
}
