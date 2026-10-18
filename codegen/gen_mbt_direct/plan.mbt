///|
/// Bound Wasm function size/local counts without relying on tail calls.
const BLOCKS_PER_CHUNK = 32

///|
priv struct Emitter {
  program : @direct_ir.Program
  meta : @codegen.MetaProvider
  support : @mbt_common.Context
  input_mode : @codegen.InputMode
  chunked : Bool
  consumes_input : Bool
  saves_snapshot : Bool
  slots : Map[Int, (Int, Int)]
  maxima : Array[Int]
  chunk_loops : Set[Int]
  chunk_errors : Set[Int]
}

///|
fn Emitter::new(
  program : @direct_ir.Program,
  meta : @codegen.MetaProvider,
  support : @mbt_common.Context,
  input_mode : @codegen.InputMode,
) -> Emitter {
  let self = Emitter::{
    program,
    meta,
    support,
    input_mode,
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
  for label, block in program.blocks {
    let chunk = label / BLOCKS_PER_CHUNK
    if block.terminator is Stop(_) {
      self.chunk_errors.add(chunk)
    }
    fn local_edge(edge : @direct_ir.Edge) -> Bool {
      edge.target / BLOCKS_PER_CHUNK == chunk
    }
    let has_local_edge = match block.terminator {
      Jump(edge) => local_edge(edge)
      CaseToken(arms, fallback) =>
        local_edge(fallback) || arms.iter().any(p => local_edge(p.1))
      CaseState(_, arms) => arms.iter().any(p => local_edge(p.1))
      Return(_) | Stop(_) | Unreachable => false
    }
    if has_local_edge {
      self.chunk_loops.add(chunk)
    }
    // Block parameters do not coexist. Reuse slots by physical representation.
    let counts = [0, 0, 0]
    for parameter in block.parameters {
      let kind = match parameter.type_ {
        State => 0
        Semantic(_) => 1
        Position => 2
      }
      self.slots[parameter.id] = (kind, counts[kind])
      counts[kind] += 1
      if counts[kind] > self.maxima[kind] {
        self.maxima[kind] = counts[kind]
      }
    }
  }
  coalesce_results(program.blocks, self.slots)
  self
}

///|
fn Emitter::chunk_count(self : Emitter) -> Int {
  (self.program.blocks.length() + BLOCKS_PER_CHUNK - 1) / BLOCKS_PER_CHUNK
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
fn Emitter::slot_type(self : Emitter, kind : Int) -> @elab.TypeExpr {
  match kind {
    0 => type_("Int")
    1 => type_("YYObj")
    _ => self.meta.position_data_type
  }
}

///|
fn slot_initial(kind : Int) -> @mbt_ast.Expr {
  match kind {
    0 => Int(0)
    1 => Ident("YYObj_Void")
    _ => Ident("last_pos")
  }
}
