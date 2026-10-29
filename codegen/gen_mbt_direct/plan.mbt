///|
priv struct Emitter {
  program : @direct_ir.Program
  meta : @codegen.MetaProvider
  support : @mbt_common.Context
  flow : @direct_ir.StackFlow
  demand : @direct_ir.StorageDemand
  input_mode : @codegen.InputMode
  cache_ready : Bool
  cache_json : Bool
  layout : BlockLayout
  blocks_per_chunk : Int32
  chunked : Bool
  has_stack : Bool
  cache_state : Bool
  consumes_input : Bool
  snapshots : SnapshotPlan
  needs_initial_position : Bool
  slots : Map[Int32, (Int32, Int32)]
  slot_types : Array[SlotType]
  stack : StackStorage
  maxima : Array[Int32]
  chunk_loops : Set[Int32]
  chunk_errors : Set[Int32]
}

///|
fn Emitter::new(
  prepared : @direct_ir.PreparedProgram,
  meta : @codegen.MetaProvider,
  support : @mbt_common.Context,
  input_mode : @codegen.InputMode,
) -> Emitter {
  let program = prepared.program
  let flow = prepared.flow
  let demand = prepared.demand
  let needs_initial_position = support.tracks_positions() &&
    flow.previous_initial.iter().any(id => demand.registers.contains(id))
  let layout = BlockLayout::new(program.blocks)
  let blocks_per_chunk = dispatch_width(program.blocks, layout)
  let has_stack = program.blocks.any(b => {
    b.all_instructions().any(i => i is (Push(_) | Pop(_)))
  })
  let self = Emitter::{
    program,
    meta,
    support,
    flow,
    demand,
    input_mode,
    cache_ready: program.blocks.any(b => {
      b.all_instructions().any(i => i is EnsureLookahead)
    }),
    cache_json: support.is_json_cst() &&
    program.blocks.any(b => b.all_instructions().any(i => i is Input(_))),
    layout,
    blocks_per_chunk,
    // Keep shared runtime helpers when compaction leaves just one chunk.
    chunked: program.blocks.length() > BLOCKS_PER_CHUNK,
    has_stack,
    cache_state: has_stack &&
    program.blocks.any(b => {
      b
      .all_instructions()
      .any(i => {
        match i {
          Peek(0, cell, regs) | Pop(cell, regs) =>
            cell.fields
            .mapi((index, field) => {
              field is State &&
              regs[index]
              .map(r => demand.registers.contains(r.id))
              .unwrap_or(false)
            })
            .any(x => x)
          _ => false
        }
      })
    }),
    consumes_input: program.blocks
    .iter()
    .any(b => b.all_instructions().iter().any(i => i is ConsumeLookahead)),
    snapshots: SnapshotPlan::new(program.blocks),
    needs_initial_position,
    slots: {},
    slot_types: [],
    stack: StackStorage::new(program, demand, meta.position_data_type),
    maxima: [],
    chunk_loops: Set([]),
    chunk_errors: Set([]),
  }
  for block in program.blocks {
    self.allocate_parameters(block.parameters)
  }
  for pc, label in self.layout.blocks {
    self.plan_control(label, pc / self.blocks_per_chunk)
  }
  coalesce_results(program.blocks, self.slots)
  self
}

///|
fn Emitter::chunk_count(self : Emitter) -> Int32 {
  (self.layout.blocks.length() + self.blocks_per_chunk - 1) /
  self.blocks_per_chunk
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
  if terminator_stops(block.terminator) {
    self.chunk_errors.add(chunk)
  }
  let targets = successors(block.terminator)
  if targets
    .iter()
    .any(target => self.layout.pc(target) / self.blocks_per_chunk == chunk) {
    self.chunk_loops.add(chunk)
  }
}

///|
fn terminator_stops(term : @direct_ir.Terminator) -> Bool {
  term is Stop || term.bodies().any(body => terminator_stops(body.terminator))
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
  if self.unit_register(reg) {
    return Unit
  }
  guard self.demand.registers.contains(reg.id) else {
    abort("reading an unallocated register")
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
  self.unit_register(reg) || !self.demand.registers.contains(reg.id)
}

///|
fn Emitter::unit_register(self : Emitter, reg : @direct_ir.Register) -> Bool {
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
