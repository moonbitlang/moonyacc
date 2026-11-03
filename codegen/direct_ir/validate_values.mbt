///|
/// Local scope and flow state for a single block. Definitions are shared across
/// blocks so register identities remain unique throughout the program.
priv struct BlockValidator {
  program : Program
  definitions : Map[Int32, Bool]
  label : Int32
  locals : Map[Int32, ValueType]
  mut lookahead : Lookahead
}

///|
fn BlockValidator::validate(
  self : BlockValidator,
  block : Block,
) -> Unit raise InvalidProgram {
  for parameter in block.parameters {
    self.add_definition(parameter)
  }
  if self.lookahead is On(token) {
    self.program.checked_token(token)
  }
  for instruction in block.instructions {
    self.instruction(instruction)
  }
  self.terminator(block.terminator)
}

///|
fn BlockValidator::body(
  self : BlockValidator,
  body : Body,
  lookahead : Lookahead,
) -> Unit raise InvalidProgram {
  let branch = { ..self, locals: self.locals.copy(), lookahead, }
  for instruction in body.instructions {
    branch.instruction(instruction)
  }
  branch.terminator(body.terminator)
}

///|
fn BlockValidator::check(
  self : BlockValidator,
  ok : Bool,
  message : String,
) -> Unit raise InvalidProgram {
  require(ok, "block \{self.label}: \{message}")
}

///|
fn BlockValidator::add_definition(
  self : BlockValidator,
  reg : Register,
) -> Unit raise InvalidProgram {
  self.check(
    reg.id >= 0 && !self.definitions.contains(reg.id),
    "duplicate or invalid register \{reg.id}",
  )
  self.definitions[reg.id] = true
  self.locals[reg.id] = reg.type_
}

///|
fn BlockValidator::type_of(
  self : BlockValidator,
  value : Value,
) -> ValueType raise InvalidProgram {
  match value {
    Reg(reg) => {
      self.check(
        self.locals.get(reg.id) == Some(reg.type_),
        "undefined or mistyped register \{reg.id}",
      )
      reg.type_
    }
    State(id) => {
      self.program.checked_state(id)
      State
    }
  }
}

///|
fn BlockValidator::expect(
  self : BlockValidator,
  value : Value,
  type_ : ValueType,
) -> Unit raise InvalidProgram {
  self.check(self.type_of(value) == type_, "value type mismatch")
}

///|
fn BlockValidator::field_types(
  self : BlockValidator,
  cell : Cell,
) -> Array[ValueType] raise InvalidProgram {
  if cell.symbol is Some(id) {
    ignore(self.program.checked_symbol(id))
  }
  let seen = []
  let types : Array[ValueType] = []
  for field in cell.fields {
    self.check(!seen.contains(field), "duplicate cell field")
    seen.push(field)
    types.push(
      match field {
        State => State
        Start | End => {
          self.check(
            cell.symbol is Some(_),
            "opaque cell may only expose state",
          )
          Position
        }
        Semantic => {
          guard cell.symbol is Some(id) else {
            raise InvalidProgram("opaque semantic cell")
          }
          Semantic(self.program.checked_symbol(id).type_)
        }
      },
    )
  }
  types
}

///|
fn BlockValidator::bind_cell(
  self : BlockValidator,
  cell : Cell,
  bindings : Array[Register?],
) -> Unit raise InvalidProgram {
  let types = self.field_types(cell)
  self.check(types.length() == bindings.length(), "cell binding arity mismatch")
  for i, binding in bindings {
    if binding is Some(reg) {
      self.check(reg.type_ == types[i], "cell binding type mismatch")
      self.add_definition(reg)
    }
  }
}

///|
fn BlockValidator::edge(
  self : BlockValidator,
  edge : Edge,
  lookahead : Lookahead,
) -> Unit raise InvalidProgram {
  self.check(
    edge.target >= 0 && edge.target < self.program.blocks.length(),
    "invalid edge target",
  )
  let target = self.program.blocks[edge.target]
  self.check(
    target.parameters.length() == edge.arguments.length(),
    "edge arity mismatch",
  )
  for i, argument in edge.arguments {
    self.expect(argument, target.parameters[i].type_)
  }
  self.check(accepts(lookahead, target.lookahead), "edge lookahead mismatch")
}

///|
fn accepts(actual : Lookahead, expected : Lookahead) -> Bool {
  match expected {
    Any => true
    Present => actual is (Present | On(_))
    _ => actual == expected
  }
}
