///|
fn stack_check_cell(
  cell : Cell,
  allow_opaque~ : Bool,
) -> Unit raise InvalidProgram {
  require(
    (
      cell.symbol is Some(_) &&
      Set(cell.fields).length() == cell.fields.length()
    ) ||
    (allow_opaque && cell.symbol is None && cell.fields == [State]),
    "stack rewrite requires distinct symbol fields or an opaque state peek",
  )
}

///|
fn stack_check_field_type(
  field : Field,
  type_ : ValueType,
) -> Unit raise InvalidProgram {
  require(
    match field {
      State => type_ == State
      Semantic => type_ is Semantic(_)
      Start | End => type_ == Position
    },
    "stack rewrite uses a wrong field type",
  )
}

///|
fn StackCheck::prefix_offset(
  self : StackCheck,
  depth : Int32,
) -> Int32 raise InvalidProgram {
  let remaining = depth - self.suffix.length()
  require(
    remaining >= 0 && self.removed <= 0x7fffffff - remaining,
    "stack rewrite prefix depth overflow",
  )
  self.removed + remaining
}

///|
fn StackCheck::push(
  self : StackCheck,
  cell : Cell,
  values : Array[Value],
) -> Unit raise InvalidProgram {
  stack_check_cell(cell, allow_opaque=false)
  require(cell.fields.contains(State), "pushed cell lacks its LR state")
  require(values.length() == cell.fields.length(), "stack rewrite push arity")
  let values = values.map(v => self.value(v))
  for i, value in values {
    stack_check_field_type(cell.fields[i], value.type_())
  }
  self.suffix.push({ cell, values, })
}

///|
/// Prefix offsets are absolute, so shifting a read past a delayed push does not
/// change the atom it observes. Unknown accesses retain their checked trace.
fn StackCheck::read(
  self : StackCheck,
  depth : Int32,
  cell : Cell,
  bindings : Array[Register?],
  pop~ : Bool,
) -> Unit raise InvalidProgram {
  require(depth >= 0 && (!pop || depth == 0), "stack rewrite invalid depth")
  stack_check_cell(cell, allow_opaque=!pop)
  require(bindings.length() == cell.fields.length(), "stack rewrite read arity")
  let known = if depth < self.suffix.length() {
    Some(self.suffix[self.suffix.length() - depth - 1])
  } else {
    None
  }
  let offset = if known is None { self.prefix_offset(depth) } else { 0 }
  match known {
    Some(top) =>
      require(
        (cell.symbol is None || top.cell.symbol == cell.symbol) &&
        cell.fields.all(field => top.cell.fields.contains(field)),
        "stack rewrite cell mismatch",
      )
    None =>
      self.trace.push(
        if pop {
          CheckPop(offset, cell)
        } else {
          CheckPeek(offset, cell)
        },
      )
  }
  for i, binding in bindings {
    if binding is Some(reg) {
      let field = cell.fields[i]
      stack_check_field_type(field, reg.type_)
      let value = match known {
        Some(top) => top.values[top.cell.fields.search(field).unwrap()]
        None if offset == 0 && field == State =>
          match self.incoming_state {
            Some(state) => SymState(state)
            None => SymPrefixField(offset, field, reg.type_)
          }
        None => SymPrefixField(offset, field, reg.type_)
      }
      self.bind_value(reg, value)
    }
  }
  if pop {
    if known is Some(_) {
      ignore(self.suffix.pop())
    } else {
      self.removed += 1
    }
  }
}

///|
fn StackCheck::previous_position(
  self : StackCheck,
  depth : Int32,
  reg : Register,
) -> Unit raise InvalidProgram {
  require(
    depth >= 0 && reg.type_ == Position,
    "stack rewrite previous position",
  )
  let value = if depth < self.suffix.length() {
    let top = self.suffix[self.suffix.length() - depth - 1]
    guard top.cell.fields.search(End) is Some(index) else {
      raise InvalidProgram("previous position is absent from a known cell")
    }
    top.values[index]
  } else {
    let offset = self.prefix_offset(depth)
    self.trace.push(CheckPreviousPosition(offset))
    // This includes the initial-position fallback when the prefix is empty.
    SymPreviousPosition(offset)
  }
  self.bind_value(reg, value)
}
