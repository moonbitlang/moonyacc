///|
priv struct SnapshotPlan {
  saves : Bool
  width : Int32
}

///|
fn SnapshotPlan::new(blocks : Array[@direct_ir.Block]) -> SnapshotPlan {
  let mut saves = false
  let mut width = 0
  for block in blocks {
    for instruction in block.all_instructions() {
      if instruction is SaveErrorSnapshot(suffix) {
        saves = true
        width = Int32::max(width, suffix.length())
      }
    }
  }
  { saves, width, }
}

///|
fn snapshot_slot(index : Int32) -> String {
  "error_suffix_\{index}"
}

///|
/// One description supplies both context fields and local parser storage.
fn SnapshotPlan::storage(
  self : SnapshotPlan,
) -> Array[(@mbt_ast.Field, @mbt_ast.Expr)] {
  let storage : Array[(@mbt_ast.Field, @mbt_ast.Expr)] = []
  if self.width > 0 {
    storage.push(
      ({ name: "error_depth", type_: type_("Int"), mutable: true, }, Int(0)),
    )
    for index in 0..<self.width {
      storage.push(
        (
          { name: snapshot_slot(index), type_: type_("Int"), mutable: true, },
          Int(0),
        ),
      )
    }
  }
  storage
}

///|
fn SnapshotPlan::local_storage(self : SnapshotPlan) -> Array[@mbt_ast.Stmt] {
  self
  .storage()
  .map(pair => {
    let (field, initial) = pair
    if field.mutable {
      @mbt_ast.Stmt::LetMut(field.name, Some(field.type_), initial)
    } else {
      binding(field.name, initial, type_=field.type_)
    }
  })
}

///|
/// Snapshot slots never alias IR registers. Copy every dynamic suffix state now;
/// later reductions and slot reuse must not change the last-shift checkpoint.
fn SnapshotPlan::capture(
  self : SnapshotPlan,
  suffix : Array[@mbt_ast.Expr],
  machine : (String) -> @mbt_ast.Expr,
  physical~ : Bool = true,
) -> Array[@mbt_ast.Stmt] {
  guard suffix.length() <= self.width else { abort("snapshot suffix overflow") }
  let statements : Array[@mbt_ast.Stmt] = if physical {
    [Eval(call("yy_stack_checkpoint", [machine("stack")]))]
  } else {
    []
  }
  for index, value in suffix {
    statements.push(Assign(machine(snapshot_slot(index)), value))
  }
  if self.width > 0 {
    // Ordinary shifts replace any previous virtual suffix with an empty one.
    statements.push(Assign(machine("error_depth"), Int(suffix.length())))
  }
  statements
}

///|
fn Emitter::save_snapshot(
  self : Emitter,
  suffix : Array[@direct_ir.Value],
) -> Array[@mbt_ast.Stmt] {
  self.snapshots.capture(
    suffix.map(v => self.value(v)),
    name => self.machine(name),
    physical=self.has_stack,
  )
}

///|
/// Prefix projection already includes its current state and the initial state.
/// Prepending the bottom-to-top suffix yields the original top-first LR stack.
fn SnapshotPlan::states(
  self : SnapshotPlan,
  prefix : @mbt_ast.Expr,
  machine : (String) -> @mbt_ast.Expr,
) -> @mbt_ast.Expr {
  if self.width == 0 {
    return prefix
  }
  let states = @mbt_ast.Expr::Ident("_yy_error_states")
  let statements : Array[@mbt_ast.Stmt] = [
    LetMut("_yy_error_states", None, prefix),
  ]
  for index in 0..<self.width {
    statements.push(
      Eval(
        If(
          Binary(Greater, machine("error_depth"), Int(index)),
          body([
            Assign(
              states,
              call("@list.cons", [machine(snapshot_slot(index)), states]),
            ),
          ]),
          None,
        ),
      ),
    )
  }
  Block(body(statements, result=states))
}

///|
fn Emitter::snapshot_states(self : Emitter) -> @mbt_ast.Expr {
  let prefix = if self.has_stack {
    call("yy_stack_snapshot", [self.machine("stack")])
  } else {
    call("@list.List", [Array([self.machine("initial_state")])])
  }
  self.snapshots.states(prefix, name => self.machine(name))
}
