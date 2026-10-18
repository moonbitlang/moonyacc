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
  id : Int
  type_ : ValueType
} derive(Eq)

///|
pub(all) enum Value {
  Reg(Register)
  State(Int)
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
  symbol : Int?
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
  Terminal(Int)
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
  Input(Int, Register, Register, Register)
  ConsumeLookahead
  SaveErrorSnapshot
  ReadLastPosition(Register)
  Bind(Array[(Register, Value)])
  Push(Cell, Array[Value])
  Pop(Cell, Array[Register?])
  Peek(Int, Cell, Array[Register?])
  Action(Int, Array[ActionArgument], Value, Register)
}

///|
/// Jump arguments are evaluated in parallel, before binding target parameters.
pub(all) struct Edge {
  target : Int
  arguments : Array[Value]
}

///|
pub(all) enum Terminator {
  Jump(Edge)
  CaseToken(Array[(Token, Edge)], Edge)
  CaseState(Value, Array[(Int, Edge)])
  Return(Int, Value)
  Stop(Int)
  Unreachable
}

///|
/// Provenance is for diagnostics/dumps, not a restriction on block contents.
pub(all) enum Origin {
  Run(Int)
  Shift(Int, Int) // destination LR state, terminal symbol
  Reduce(Int)
  Goto(Int)
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
  block : Int
  state : Int
  result_type : @elab.TypeExpr
}

///|
pub(all) struct Symbol {
  name : String
  type_ : @elab.TypeExpr
}

///|
pub(all) struct ActionSignature {
  rhs : Array[Int]
  lhs : Int
  callable : Bool
}

///|
/// Cold-path metadata only. It contains no semantic action function pointers.
pub(all) enum DiagnosticAction {
  Shift(Int)
  Reduce(Int, Int)
  Accept
}

///|
pub(all) struct DiagnosticState {
  default_ : DiagnosticAction?
  actions : Array[(Token, DiagnosticAction)]
  gotos : Array[(Int, Int)]
}

///|
/// Block indices are labels. Symbol zero is reserved for internal end-of-input;
/// terminals precede nonterminals. Production IDs index actions.
pub(all) struct Program {
  entries : Array[Entry]
  blocks : Array[Block]
  symbols : Array[Symbol]
  terminal_count : Int
  actions : Array[ActionSignature]
  diagnostics : Array[DiagnosticState]
}
