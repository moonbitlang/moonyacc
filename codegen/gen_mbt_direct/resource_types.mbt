///|
/// Symbols come from the same field declarations as YYContext. Only immediate
/// scalars are promoted: references keep their existing ownership protocol.
priv struct ResourceCatalog {
  fields : Array[@mbt_ast.Field]
  names : Map[String, Int32]
}

///|
fn ResourceCatalog::new(fields : Array[@mbt_ast.Field]) -> ResourceCatalog {
  let fields = fields.filter(field => {
    field.type_ is Constr(pkg=None, "Int" | "Bool", [])
  })
  let names = Map([])
  for id, field in fields {
    names[field.name] = id
  }
  { fields, names, }
}

///|
fn ResourceCatalog::place(
  self : ResourceCatalog,
  expr : @mbt_ast.Expr,
) -> Int32? {
  match expr {
    Field(Ident("_env"), Named(name)) => self.names.get(name)
    _ => None
  }
}

///|
fn ResourceCatalog::stored(self : ResourceCatalog, id : Int32) -> @mbt_ast.Expr {
  Field(Ident("_env"), Named(self.fields[id].name))
}

///|
fn resource_local(id : Int32) -> String {
  "_yy_resource_\{id}"
}

///|
/// Backward transfer: reads union (live-out minus kills). Writes is a may-set
/// used to synchronize helpers, not a claim that every path overwrites a field.
priv struct ResourceEffect {
  reads : Set[Int32]
  kills : Set[Int32]
  writes : Set[Int32]
  exits : Bool
}

///|
fn resource_union(a : Set[Int32], b : Set[Int32]) -> Set[Int32] {
  Set::from_iter(a.iter().concat(b.iter()))
}

///|
fn resource_difference(a : Set[Int32], b : Set[Int32]) -> Set[Int32] {
  Set::from_iter(a.iter().filter(id => !b.contains(id)))
}

///|
fn ResourceEffect::empty() -> ResourceEffect {
  { reads: Set([]), kills: Set([]), writes: Set([]), exits: false, }
}

///|
fn ResourceEffect::then(
  self : ResourceEffect,
  next : ResourceEffect,
) -> ResourceEffect {
  {
    reads: resource_union(
      self.reads,
      resource_difference(next.reads, self.kills),
    ),
    // A later store cannot kill the incoming value on an earlier exit path.
    kills: if self.exits {
      self.kills
    } else {
      resource_union(self.kills, next.kills)
    },
    writes: resource_union(self.writes, next.writes),
    exits: self.exits || next.exits,
  }
}

///|
fn ResourceEffect::choice(
  self : ResourceEffect,
  other : ResourceEffect,
) -> ResourceEffect {
  {
    reads: resource_union(self.reads, other.reads),
    kills: Set::from_iter(
      self.kills.iter().filter(id => other.kills.contains(id)),
    ),
    writes: resource_union(self.writes, other.writes),
    exits: self.exits || other.exits,
  }
}

///|
fn ResourceEffect::before(
  self : ResourceEffect,
  after : Set[Int32],
) -> Set[Int32] {
  resource_union(self.reads, resource_difference(after, self.kills))
}

///|
fn ResourceEffect::observed(self : ResourceEffect) -> Set[Int32] {
  resource_union(self.reads, resource_difference(self.writes, self.kills))
}

///|
priv struct ResourceAnalyzer {
  catalog : ResourceCatalog
  helpers : Map[String, ResourceEffect]
  direct : Set[Int32]
  mut access_count : Int32
  mut supported : Bool
}

///|
priv struct ResourcePlan {
  catalog : ResourceCatalog
  helpers : Map[String, ResourceEffect]
  effects : Array[ResourceEffect]
  accesses : Array[Set[Int32]]
  successors : Array[Array[Int32]]
  live : Array[Set[Int32]]
}
