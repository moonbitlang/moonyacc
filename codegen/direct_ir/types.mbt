///|
/// Logical value types. A target ABI may box Semantic values without changing
/// the IR's types or its block interfaces.
#derive(Eq)
pub(all) enum ValueType {
  State
  Position
  Semantic(@elab.TypeExpr)
}

///|
/// IDs are unique across a program; definitions are local to one block.
#derive(Eq)
pub(all) struct Register {
  id : Int32
  type_ : ValueType
}

///|
#derive(Eq)
pub(all) enum Value {
  Reg(Register)
  State(Int32)
}

///|
#derive(Eq, Hash)
pub(all) enum Field {
  State
  Semantic
  Start
  End
}

///|
/// Fields describe a logical cell, not a concrete tuple/array representation.
/// None denotes an opaque prefix cell: only its state may be peeked.
#derive(Eq)
pub(all) struct Cell {
  symbol : Int32?
  fields : Array[Field]
}

///|
#derive(Eq, Hash)
pub(all) enum Token {
  Terminal(Int32)
  EndOfInput
}

///|
/// Cached lookahead is an explicit machine resource. Any imposes no precondition;
/// On also witnesses the identity of the cached token.
#derive(Eq)
pub(all) enum Lookahead {
  Any
  Empty
  Present
  On(Token)
}

///|
#derive(Eq)
pub(all) enum Instruction {
  EnsureLookahead
  // Unconditional lexer read, requiring an empty cache.
  LoadLookahead
  // A data-flow proof, not a token read. StackFlow must independently establish
  // this singleton domain before the local validator may use its identity.
  RefineLookahead(Token)
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
  // Operands are ordered by ActionSignature.inputs, including only values
  // actually read by the action. A dead result does not make the call pure.
  Action(Int32, Array[Value], Register)
}

///|
/// Jump arguments are evaluated in parallel, before binding target parameters.
#derive(Eq)
pub(all) struct Edge {
  target : Int32
  arguments : Array[Value]
}

///|
/// A binding pattern selects one real token and defines its logical semantic
/// value and span in the branch scope. It never reads the lexer or converts a
/// JsonCst payload: these effects belong to loading the lookahead resource.
#derive(Eq)
pub(all) enum TokenPattern {
  Tokens(Array[Token])
  BindToken(Int32, Register, Register, Register)
}

///|
#derive(Eq)
pub(all) enum Terminator {
  Jump(Edge)
  CaseToken(Array[(TokenPattern, Body)], Body)
  CaseState(Value, Array[(Int32, Body)])
  Return(Int32, Value)
  Stop
  Unreachable
}

///|
/// Branches are extended basic blocks. Their definitions are scoped below the
/// branch; only explicit Jump arguments can escape to another CFG block.
#derive(Eq)
pub(all) struct Body {
  instructions : Array[Instruction]
  terminator : Terminator
}

///|
pub fn Body::jump(edge : Edge) -> Body {
  { instructions: [], terminator: Jump(edge), }
}

///|
pub fn Body::edge(self : Body) -> Edge? {
  if self.instructions.is_empty() && self.terminator is Jump(edge) {
    Some(edge)
  } else {
    None
  }
}

///|
/// Provenance is for diagnostics/dumps, not a restriction on block contents.
pub(all) enum Origin {
  Run(Int32)
  Reduce(Int32)
  Goto(Int32)
  Helper
}

///|
/// Producer-supplied optimization policy, never a typing assumption.
#derive(Eq)
pub(all) enum InlineHint {
  NoHint
  Always
  IfKnownState
  IfCells(Int32)
}

///|
pub(all) struct Block {
  origin : Origin
  hint : InlineHint
  // Producer policy, like Menhir's SpecAllowed. Never an entry-state proof.
  specialize_state : Bool
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
  inputs : Array[@elab.ActionInput]
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
