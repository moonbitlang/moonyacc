///|
priv struct RegionalResources {
  used : Set[Int32]
  incoming : Set[Int32]
  written : Set[Int32]
}

///|
fn RegionalResources::empty() -> RegionalResources {
  { used: Set([]), incoming: Set([]), written: Set([]), }
}

///|
/// A scalar needs a frame home only when a helper touches it or a region must
/// load it on entry. Purely regional scalars disappear from the context type.
fn Emitter::stored_context(
  self : Emitter,
) -> Array[(@mbt_ast.Field, @mbt_ast.Expr)] {
  let fields = self.context_storage()
  guard self.resources is Some(plan) else { return fields }
  let homes = Set([])
  for _, effect in plan.helpers {
    for id in effect.reads {
      homes.add(id)
    }
    for id in effect.writes {
      homes.add(id)
    }
  }
  for region in 0..<self.control.regions.length() {
    let scope = self.regional_resources(region)
    let promoted = self.resource_regions
      .get(region)
      .unwrap_or(RegionalResources::empty()).used
    for id in scope.used {
      if !promoted.contains(id) || scope.incoming.contains(id) {
        homes.add(id)
      }
    }
  }
  fields.filter(pair => {
    match plan.catalog.names.get(pair.0.name) {
      Some(id) => homes.contains(id)
      None => true
    }
  })
}

///|
fn Emitter::regional_resources(
  self : Emitter,
  region : Int32,
) -> RegionalResources {
  let used = Set([])
  let incoming = Set([])
  let written = Set([])
  if self.resources is Some(plan) {
    for entry in self.control.regions[region].entries {
      for id in plan.live[entry] {
        incoming.add(id)
      }
    }
    for label in self.control.regions[region].members {
      for id in plan.accesses[label] {
        used.add(id)
      }
      for id in plan.effects[label].writes {
        written.add(id)
      }
    }
  }
  { used, incoming, written, }
}

///|
fn Emitter::resource_declarations(
  self : Emitter,
  scope : RegionalResources,
) -> Array[@mbt_ast.Stmt] {
  guard self.resources is Some(plan) else { return [] }
  let ids = scope.used.to_array()
  ids.sort()
  ids.map(id => {
    let field = plan.catalog.fields[id]
    let initial = if scope.incoming.contains(id) {
      plan.catalog.stored(id)
    } else if field.type_ is Constr(pkg=None, "Bool", []) {
      @mbt_ast.Expr::Bool(false)
    } else {
      Int(0)
    }
    if scope.written.contains(id) {
      @mbt_ast.Stmt::LetMut(resource_local(id), Some(field.type_), initial)
    } else {
      binding(resource_local(id), initial, type_=field.type_)
    }
  })
}

///|
fn ResourcePlan::save(
  self : ResourcePlan,
  locals : Set[Int32],
  written : Set[Int32],
  observed : Set[Int32],
) -> Array[@mbt_ast.Stmt] {
  let ids = locals.to_array()
  ids.sort()
  ids.filter_map(id => {
    if written.contains(id) && observed.contains(id) {
      Some(
        @mbt_ast.Stmt::Assign(
          self.catalog.stored(id),
          Ident(resource_local(id)),
        ),
      )
    } else {
      None
    }
  })
}

///|
fn Emitter::flush_resources(
  self : Emitter,
  target : Int32,
) -> Array[@mbt_ast.Stmt] {
  match self.resources {
    Some(plan) =>
      plan.save(self.resource_locals, self.resource_written, plan.live[target])
    None => []
  }
}

///|
/// Synchronize only a helper's frame effects. A may-write needs the old value
/// unless the helper definitely overwrites it; otherwise a no-write path would
/// reload a stale value. Calls and their evaluation order remain unchanged.
fn ResourcePlan::invoke(
  self : ResourcePlan,
  name : String,
  locals : Set[Int32],
  written : Set[Int32],
) -> @mbt_ast.Expr {
  let invoke = call(name, [Ident("_env")])
  guard self.helpers.get(name) is Some(effect) else {
    abort("missing helper resource summary")
  }
  let observed = effect.observed()
  let statements = self.save(locals, written, observed)
  let ids = locals.to_array()
  ids.sort()
  let reload = ids.filter(id => effect.writes.contains(id))
  if statements.is_empty() && reload.is_empty() {
    return invoke
  }
  statements.push(binding("_yy_resource_result", invoke))
  for id in reload {
    statements.push(Assign(Ident(resource_local(id)), self.catalog.stored(id)))
  }
  Block(body(statements, result=Ident("_yy_resource_result")))
}

///|
fn Emitter::resource_call(self : Emitter, name : String) -> @mbt_ast.Expr {
  match self.resources {
    Some(plan) if !self.resource_locals.is_empty() =>
      plan.invoke(name, self.resource_locals, self.resource_written)
    _ => call(name, [Ident("_env")])
  }
}
