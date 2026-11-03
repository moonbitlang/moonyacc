///|
priv struct Emitter {
  program : @direct_ir.Program
  meta : @codegen.MetaProvider
  support : @mbt_common.Context
  flow : @direct_ir.StackFlow
  demand : @direct_ir.StorageDemand
  checkpoints : @direct_ir.CheckpointFlow
  input_mode : @codegen.InputMode
  optimize_resources : Bool
  locality : Bool
  cache_ready : Bool
  cache_json : Bool
  control : @control_flow.Plan
  block_estimates : Array[Int32]
  resources : ResourcePlan?
  resource_locals : Set[Int32]
  resource_written : Set[Int32]
  resource_entry_writes : Map[Int32, Set[Int32]]
  resource_regions : Array[RegionalResources]
  shared_context : Bool
  has_stack : Bool
  diagnostics : Bool
  journal : Bool
  physical_saves : Bool
  needs_initial_state : Bool
  cache_state : Bool
  consumes_input : Bool
  snapshots : SnapshotPlan
  needs_initial_position : Bool
  slots : Map[Int32, (Int32, Int32)]
  slot_types : Array[SlotType]
  stack : StackStorage
  maxima : Array[Int32]
  local_slots : Set[(Int32, Int32)]
  region_errors : Set[Int32]
}

///|
fn Emitter::new(
  prepared : @direct_ir.PreparedProgram,
  meta : @codegen.MetaProvider,
  support : @mbt_common.Context,
  input_mode : @codegen.InputMode,
  optimize_resources~ : Bool = false,
  locality~ : Bool = false,
) -> Emitter {
  let analysis = @control_flow.analyze(prepared.program)
  let isolated = analysis.isolate() catch {
    InvalidControl(message) => abort(message)
  }
  let probe = Emitter::with_plan(
    prepared,
    meta,
    support,
    input_mode,
    isolated,
    optimize_resources~,
  )
  let resources = if optimize_resources {
    probe.analyze_resources()
  } else {
    None
  }
  let probe = Emitter::{ ..probe, resources, }.select_resources()
  let costs = probe.block_costs()
  let control = analysis.plan(costs~) catch {
    InvalidControl(message) => abort(message)
  }
  let ordinary = Emitter::{
    ..Emitter::with_plan(
      prepared,
      meta,
      support,
      input_mode,
      control,
      optimize_resources~,
    ),
    block_estimates: costs,
    resources,
    locality,
  }.select_resources()
  ordinary.choose_partitions(prepared, analysis)
}

///|
fn Emitter::with_plan(
  prepared : @direct_ir.PreparedProgram,
  meta : @codegen.MetaProvider,
  support : @mbt_common.Context,
  input_mode : @codegen.InputMode,
  control : @control_flow.Plan,
  optimize_resources~ : Bool = false,
) -> Emitter {
  let program = prepared.program
  let flow = prepared.flow
  let demand = prepared.demand
  let needs_initial_position = support.tracks_positions() &&
    flow.previous_initial.iter().any(id => demand.registers.contains(id))
  let has_stack = program.blocks.any(b => {
    b.all_instructions().any(i => i is (Push(_) | Pop(_)))
  })
  let reads_state = program.blocks.any(b => {
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
  })
  let diagnostics = program.blocks.any(b => b.terminator.can_stop())
  let self = Emitter::{
    program,
    meta,
    support,
    flow,
    demand,
    checkpoints: prepared.checkpoints,
    input_mode,
    optimize_resources,
    locality: false,
    cache_ready: program.blocks.any(b => {
      b.all_instructions().any(i => i is EnsureLookahead)
    }),
    cache_json: support.is_json_cst() &&
    program.blocks.any(b => {
      b.terminator
      .token_patterns()
      .any(p => {
        p is BindToken(_, value, _, _) && demand.registers.contains(value.id)
      })
    }),
    control,
    block_estimates: [],
    resources: None,
    resource_locals: Set([]),
    resource_written: Set([]),
    resource_entry_writes: Map([]),
    resource_regions: [],
    shared_context: control.regions.length() > 1,
    has_stack,
    cache_state: has_stack && reads_state,
    diagnostics,
    journal: prepared.checkpoints.requires_journal(program),
    physical_saves: prepared.checkpoints.requires_save(program),
    needs_initial_state: has_stack || reads_state || diagnostics,
    consumes_input: program.blocks
    .iter()
    .any(b => b.all_instructions().iter().any(i => i is ConsumeLookahead)),
    snapshots: SnapshotPlan::new(program.blocks),
    needs_initial_position,
    slots: {},
    slot_types: [],
    stack: StackStorage::new(program, demand, meta.position_data_type),
    maxima: [],
    local_slots: Set([]),
    region_errors: Set([]),
  }
  for block in program.blocks {
    self.allocate_parameters(block.parameters)
  }
  for index, region in control.regions {
    if region.members.any(label => program.blocks[label].terminator.can_stop()) {
      self.region_errors.add(index)
    }
  }
  coalesce_results(program.blocks, self.slots)
  self
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
fn Emitter::machine(self : Emitter, name : String) -> @mbt_ast.Expr {
  if self.shared_context &&
    self.resources is Some(plan) &&
    plan.catalog.names.get(name) is Some(id) &&
    self.resource_locals.contains(id) {
    return Ident(resource_local(id))
  }
  if self.shared_context {
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
