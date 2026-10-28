///|
priv struct SlotType {
  logical : @direct_ir.ValueType
  type_ : @elab.TypeExpr
  initial : @mbt_ast.Expr
  optional : Bool
}

///|
fn Emitter::slot_name(self : Emitter, kind : Int32, index : Int32) -> String {
  match self.slot_types[kind].logical {
    State => "_yy_state_\{index}"
    Position => "_yy_position_\{index}"
    Semantic(_) => "_yy_value_\{kind}_\{index}"
  }
}

///|
/// Unknown user types need no Default constraint: None marks an unwritten slot.
/// Scalar slots have real scalar storage. Checked IR edges establish assignment
/// before use; the initializer is never a semantic value supplied to an action.
fn slot_type(
  logical : @direct_ir.ValueType,
  position : @elab.TypeExpr,
) -> SlotType {
  match logical {
    State => { logical, type_: type_("Int"), initial: Int(0), optional: false, }
    Position =>
      {
        logical,
        type_: position,
        initial: Ident("initial_position"),
        optional: false,
      }
    Semantic(type_) => {
      let initial : @mbt_ast.Expr? = match type_ {
        Constr(
          pkg=None,
          "Int"
          | "Int32"
          | "Int64"
          | "UInt"
          | "UInt32"
          | "UInt64"
          | "Byte"
          | "UInt16"
          | "Float"
          | "Double",
          []
        ) => Some(Int(0))
        Constr(pkg=None, "Bool", []) => Some(Bool(false))
        Constr(pkg=None, "Char", []) => Some(Char('\u0000'))
        Constr(pkg=None, "String", []) => Some(String(""))
        Constr(pkg=None, "Json", []) => Some(call("Json::null", []))
        _ => None
      }
      match initial {
        Some(initial) => { logical, type_, initial, optional: false, }
        None =>
          {
            logical,
            type_: Option(type_),
            initial: Ident("None"),
            optional: true,
          }
      }
    }
  }
}

///|
fn Emitter::place(self : Emitter, reg : @direct_ir.Register) -> @mbt_ast.Expr {
  match self.slots.get(reg.id) {
    Some((kind, index)) => self.machine(self.slot_name(kind, index))
    None => Ident("_yy_r\{reg.id}")
  }
}

///|
fn Emitter::store(
  self : Emitter,
  reg : @direct_ir.Register,
  value : @mbt_ast.Expr,
) -> @mbt_ast.Stmt {
  guard! !self.erased_register(reg)
  let value = match self.slots.get(reg.id) {
    Some((kind, _)) if self.slot_types[kind].optional => call("Some", [value])
    _ => value
  }
  Assign(self.place(reg), value)
}
