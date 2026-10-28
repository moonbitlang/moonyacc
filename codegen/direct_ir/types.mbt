///|
/// Logical value types. A target ABI may box Semantic values without changing
/// the IR's types or its block interfaces.
pub(all) enum ValueType {
  State
  Position
  Semantic(@elab.TypeExpr)
} derive(Eq)

///|
/// IDs are unique across a program; definitions are local to one block.
pub(all) struct Register {
  id : Int32
  type_ : ValueType
} derive(Eq)

///|
pub(all) enum Value {
  Reg(Register)
  State(Int32)
} derive(Eq)

///|
pub(all) enum Field {
  State
  Semantic
  Start
  End
} derive(Eq)

///|
/// Fields describe a logical cell, not a concrete tuple/array representation.
/// None denotes an opaque prefix cell: only its state may be peeked.
pub(all) struct Cell {
  symbol : Int32?
  fields : Array[Field]
} derive(Eq)

///|
pub(all) struct ActionArgument {
  value : Value
  start : Value
  end : Value
}

///|
pub(all) enum Token {
  Terminal(Int32)
  EndOfInput
} derive(Eq, Hash)

///|
/// Cached lookahead is an explicit machine resource. Any imposes no precondition;
/// On also witnesses the token identity required by Input.
pub(all) enum Lookahead {
  Any
  Empty
  Present
  On(Token)
} derive(Eq)

///|
pub(all) enum Instruction {
  EnsureLookahead
  Input(Int32, Register, Register, Register)
  ConsumeLookahead
  // Snapshot the physical stack plus a virtual suffix of destination states,
  // ordered bottom to top. Values are captured now, not read on the error path.
  SaveErrorSnapshot(Array[Value])
  // End position before the top depth cells, or the initial position.
  ReadPreviousPosition(Int32, Register)
  Bind(Array[(Register, Value)])
  Push(Cell, Array[Value])
  Pop(Cell, Array[Register?])
  Peek(Int32, Cell, Array[Register?])
  Action(Int32, Array[ActionArgument], Value, Register)
}

///|
/// Jump arguments are evaluated in parallel, before binding target parameters.
pub(all) struct Edge {
  target : Int32
  arguments : Array[Value]
}

///|
pub(all) enum Terminator {
  Jump(Edge)
  CaseToken(Array[(Token, Edge)], Edge)
  CaseState(Value, Array[(Int32, Edge)])
  Return(Int32, Value)
  Stop(Int32)
  Unreachable
}

///|
/// Provenance is for diagnostics/dumps, not a restriction on block contents.
pub(all) enum Origin {
  Run(Int32)
  Shift(Int32, Int32) // destination LR state, terminal symbol
  Reduce(Int32)
  Goto(Int32)
  Helper
}

///|
pub(all) struct Block {
  origin : Origin
  parameters : Array[Register]
  lookahead : Lookahead
  instructions : Array[Instruction]
  terminator : Terminator
}

///|
pub(all) struct Entry {
  name : String
  block : Int32
  state : Int32
  result_type : @elab.TypeExpr
}

///|
pub(all) struct Symbol {
  name : String
  type_ : @elab.TypeExpr
}

///|
pub(all) struct ActionSignature {
  rhs : Array[Int32]
  lhs : Int32
  callable : Bool
}

///|
/// Cold-path metadata only. It contains no semantic action function pointers.
pub(all) enum DiagnosticAction {
  Shift(Int32)
  Reduce(Int32, Int32)
  Accept
}

///|
pub(all) struct DiagnosticState {
  default_ : DiagnosticAction?
  actions : Array[(Token, DiagnosticAction)]
  gotos : Array[(Int32, Int32)]
}

///|
/// Block indices are labels. Symbol zero is reserved for internal end-of-input;
/// terminals precede nonterminals. Production IDs index actions.
pub(all) struct Program {
  entries : Array[Entry]
  blocks : Array[Block]
  symbols : Array[Symbol]
  terminal_count : Int32
  actions : Array[ActionSignature]
  diagnostics : Array[DiagnosticState]
}
