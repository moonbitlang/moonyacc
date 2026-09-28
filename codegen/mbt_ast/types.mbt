///|
/// Original ranges and generated offsets use UTF-16 code units. The driver
/// converts the completed file's source map to Unicode scalar offsets.
pub(all) struct Origin {
  source : String
  offset : Int
  length : Int
}

///|
pub(all) enum Piece {
  Text(String, Origin?)
  Splice(Expr, Origin?)
}

///|
/// Source-owned text with structural expression substitutions. Text is preserved
/// exactly; splices use expression syntax and retain their substitution origins.
pub(all) struct Fragment(Array[Piece])

///|
pub(all) enum Visibility {
  Default
  Public
  PublicAll
  Private
}

///|
pub(all) enum Effect {
  Default
  NoRaise
  Raises(@elab.TypeExpr)
}

///|
pub(all) enum BinaryOp {
  Add
  Subtract
  Multiply
  Divide
  Modulo
  Equal
  NotEqual
  Less
  LessEqual
  Greater
  GreaterEqual
  And
  Or
  BitAnd
  BitOr
  BitXor
  ShiftLeft
  ShiftRight
}

///|
pub(all) enum UnaryOp {
  Negate
  Not
}

///|
pub(all) enum Accessor {
  Named(String)
  Tuple(Int)
}

///|
pub(all) enum Argument {
  Positional(Expr)
  Labelled(String, Expr)
  ForwardOptional(String)
}

///|
pub(all) enum Parameter {
  Positional(String, @elab.TypeExpr?)
  Labelled(String, @elab.TypeExpr?)
  Optional(String, @elab.TypeExpr, Expr?)
}

///|
pub(all) enum Pattern {
  Any
  Bind(String)
  Int(Int)
  Bool(Bool)
  String(String)
  Tuple(Array[Pattern])
  Constructor(String, Array[Pattern])
  Or(Array[Pattern])
  As(Pattern, String)
  Rest
  Range(Int, Int?, Bool)
}

///|
pub(all) enum Expr {
  Ident(String)
  Int(Int)
  Bool(Bool)
  String(String)
  Char(Char)
  Unit
  Call(Expr, Array[Argument])
  MethodCall(Expr, String, Array[Argument])
  Field(Expr, Accessor)
  Index(Expr, Expr)
  Slice(Expr, Expr?, Expr?)
  Range(Expr, Expr, Bool)
  Binary(BinaryOp, Expr, Expr)
  Unary(UnaryOp, Expr)
  Tuple(Array[Expr])
  Array(Array[Expr])
  Map(Array[(Expr, Expr)])
  Record(@elab.TypeExpr?, Array[(String, Expr)])
  Ascribe(Expr, @elab.TypeExpr)
  Is(Expr, Pattern)
  Lambda(Array[Parameter], Block)
  If(Expr, Block, Block?)
  Match(Expr, Array[(Pattern, Block)])
  Block(Block)
  /// A block expression containing user code. The renderer supplies delimiters
  /// and preserves all piece contents and source ranges, including comments.
  Verbatim(Fragment)
}

///|
pub(all) enum Stmt {
  Let(Pattern, @elab.TypeExpr?, Expr)
  LetMut(String, @elab.TypeExpr?, Expr)
  Assign(Expr, Expr)
  Augment(Expr, BinaryOp, Expr)
  Eval(Expr)
  Return(Expr)
  Raise(Expr)
  Continue(Array[Expr])
  ContinueTo(String, Array[Expr])
  Break(Expr?)
  BreakTo(String, Expr?)
  LabelledLoop(String, Stmt)
  Assert(Expr)
  Guard(Expr, Block)
  While(Expr, Block)
  For(Array[(String, Expr)], Expr?, Array[(String, Expr)], Block)
  ForEach(Array[Pattern], Expr, Block)
  LocalFunction(Function)
  Comment(String)
}

///|
pub(all) struct Block {
  statements : Array[Stmt]
  result : Expr?
}

///|
pub(all) struct TypeParameter {
  name : String
  bounds : Array[@elab.TypeExpr]
}

///|
pub(all) struct Function {
  name : String
  parameters : Array[Parameter]
  type_parameters : Array[TypeParameter]
  result : @elab.TypeExpr?
  effect : Effect
  body : Block
}

///|
pub(all) struct Field {
  name : String
  type_ : @elab.TypeExpr
  mutable : Bool
}

///|
pub(all) struct Constructor {
  name : String
  arguments : Array[@elab.TypeExpr]
}

///|
pub(all) struct Attribute {
  name : String
  arguments : Array[Argument]
}

///|
pub(all) enum Declaration {
  Function(Function)
  Struct(String, Array[Field])
  Enum(String, Array[Constructor], Array[@elab.TypeExpr])
  Suberror(String, Array[Constructor], Array[@elab.TypeExpr])
  Init(Block)
  Extend(@elab.TypeExpr, @elab.TypeExpr, Array[String])
  TypeAlias(String, @elab.TypeExpr)
  Global(String, @elab.TypeExpr?, Expr)
  Impl(@elab.TypeExpr, @elab.TypeExpr, Function)
  Verbatim(Fragment)
}

///|
pub(all) struct Item {
  declaration : Declaration
  visibility : Visibility
  attributes : Array[Attribute]
  comments : Array[String]
}

///|
pub fn item(
  declaration : Declaration,
  visibility? : Visibility = Default,
  attributes? : Array[Attribute] = [],
  comments? : Array[String] = [],
) -> Item {
  { declaration, visibility, attributes, comments, }
}

///|
pub fn function(
  name : String,
  parameters : Array[Parameter],
  body : Block,
  result? : @elab.TypeExpr,
  effect? : Effect = Default,
  type_parameters? : Array[TypeParameter] = [],
) -> Function {
  { name, parameters, body, result, effect, type_parameters, }
}

///|
pub(all) struct Output {
  source : String
  source_map : @codegen.SourceMap
}
