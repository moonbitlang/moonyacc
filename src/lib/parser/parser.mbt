pub(all) typealias Position = Int

pub(all) enum Token {
  EOF
  IDENT(String)
  STRING(String)
  LANGLE_CODE_RANGLE(String)
  LBRACE_CODE_RBRACE((String, Int, Array[@ast.SubstItem]))
  PERCENT_LBRACE_CODE_PERCENT_RBRACE((String, Int, Int))
  PERCENT_PERCENT_CODE_EOF((String, Int, Int))
  PKG_AND_IDENT((String, String))
  PERCENT_PERCENT
  PERCENT_START
  PERCENT_TOKEN
  PERCENT_TYPE
  PERCENT_POSITION
  PERCENT_LEFT
  PERCENT_RIGHT
  PERCENT_NONASSOC
  PERCENT_PREC
  PERCENT_DERIVE
  PERCENT_INLINE
  LBRACKET
  RBRACKET
  LPAREN
  RPAREN
  COMMA
  ARROW
  QUESTION
  COLON
  BAR
  EQ
  SEMI
} derive(Show)

pub fn Token::kind(self : Token) -> TokenKind {
  match self {
    EOF => TK_EOF
    IDENT(_) => TK_IDENT
    STRING(_) => TK_STRING
    LANGLE_CODE_RANGLE(_) => TK_LANGLE_CODE_RANGLE
    LBRACE_CODE_RBRACE(_) => TK_LBRACE_CODE_RBRACE
    PERCENT_LBRACE_CODE_PERCENT_RBRACE(_) => TK_PERCENT_LBRACE_CODE_PERCENT_RBRACE
    PERCENT_PERCENT_CODE_EOF(_) => TK_PERCENT_PERCENT_CODE_EOF
    PKG_AND_IDENT(_) => TK_PKG_AND_IDENT
    PERCENT_PERCENT => TK_PERCENT_PERCENT
    PERCENT_START => TK_PERCENT_START
    PERCENT_TOKEN => TK_PERCENT_TOKEN
    PERCENT_TYPE => TK_PERCENT_TYPE
    PERCENT_POSITION => TK_PERCENT_POSITION
    PERCENT_LEFT => TK_PERCENT_LEFT
    PERCENT_RIGHT => TK_PERCENT_RIGHT
    PERCENT_NONASSOC => TK_PERCENT_NONASSOC
    PERCENT_PREC => TK_PERCENT_PREC
    PERCENT_DERIVE => TK_PERCENT_DERIVE
    PERCENT_INLINE => TK_PERCENT_INLINE
    LBRACKET => TK_LBRACKET
    RBRACKET => TK_RBRACKET
    LPAREN => TK_LPAREN
    RPAREN => TK_RPAREN
    COMMA => TK_COMMA
    ARROW => TK_ARROW
    QUESTION => TK_QUESTION
    COLON => TK_COLON
    BAR => TK_BAR
    EQ => TK_EQ
    SEMI => TK_SEMI
  }
}

pub(all) enum TokenKind {
  TK_EOF
  TK_IDENT
  TK_STRING
  TK_LANGLE_CODE_RANGLE
  TK_LBRACE_CODE_RBRACE
  TK_PERCENT_LBRACE_CODE_PERCENT_RBRACE
  TK_PERCENT_PERCENT_CODE_EOF
  TK_PKG_AND_IDENT
  TK_PERCENT_PERCENT
  TK_PERCENT_START
  TK_PERCENT_TOKEN
  TK_PERCENT_TYPE
  TK_PERCENT_POSITION
  TK_PERCENT_LEFT
  TK_PERCENT_RIGHT
  TK_PERCENT_NONASSOC
  TK_PERCENT_PREC
  TK_PERCENT_DERIVE
  TK_PERCENT_INLINE
  TK_LBRACKET
  TK_RBRACKET
  TK_LPAREN
  TK_RPAREN
  TK_COMMA
  TK_ARROW
  TK_QUESTION
  TK_COLON
  TK_BAR
  TK_EQ
  TK_SEMI
}

pub impl Show for TokenKind with output(self, logger) {
  logger.write_string(
    match self {
      TK_EOF => "EOF"
      TK_IDENT => "IDENT"
      TK_STRING => "STRING"
      TK_LANGLE_CODE_RANGLE => "LANGLE_CODE_RANGLE"
      TK_LBRACE_CODE_RBRACE => "LBRACE_CODE_RBRACE"
      TK_PERCENT_LBRACE_CODE_PERCENT_RBRACE => "PERCENT_LBRACE_CODE_PERCENT_RBRACE"
      TK_PERCENT_PERCENT_CODE_EOF => "PERCENT_PERCENT_CODE_EOF"
      TK_PKG_AND_IDENT => "PKG_AND_IDENT"
      TK_PERCENT_PERCENT => "\"%%\""
      TK_PERCENT_START => "\"%start\""
      TK_PERCENT_TOKEN => "\"%token\""
      TK_PERCENT_TYPE => "\"%type\""
      TK_PERCENT_POSITION => "\"%position\""
      TK_PERCENT_LEFT => "\"%left\""
      TK_PERCENT_RIGHT => "\"%right\""
      TK_PERCENT_NONASSOC => "\"%nonassoc\""
      TK_PERCENT_PREC => "\"%prec\""
      TK_PERCENT_DERIVE => "\"%derive\""
      TK_PERCENT_INLINE => "\"%inline\""
      TK_LBRACKET => "\"[\""
      TK_RBRACKET => "\"]\""
      TK_LPAREN => "\"(\""
      TK_RPAREN => "\")\""
      TK_COMMA => "\",\""
      TK_ARROW => "\"->\""
      TK_QUESTION => "\"?\""
      TK_COLON => "\":\""
      TK_BAR => "\"|\""
      TK_EQ => "\"=\""
      TK_SEMI => "\";\""
    }
  )
}

pub type! ParseError {
  UnexpectedToken(Token, (Position, Position), Array[TokenKind])
}

typealias YYObj = Error

priv type! YYObj_Void

priv type! YYObj_Array_String_ Array[String]

priv type! YYObj_Option_Unit_ Option[Unit]

priv type! YYObj_String String

priv type! YYObj__ast_Rule @ast.Rule

priv type! YYObj__ast_Term @ast.Term

priv type! YYObj__ast_Symbol @ast.Symbol

priv type! YYObj__ast_TypeExpr @ast.TypeExpr

priv type! YYObj__ast_ClauseItem @ast.ClauseItem

priv type! YYObj__ast_ParserSpec @ast.ParserSpec

priv type! YYObj__ast_PrecSymbol @ast.PrecSymbol

priv type! YYObj__ast_Declaration @ast.Declaration

priv type! YYObj__ast_ClauseAction @ast.ClauseAction

priv type! YYObj__ast_ClauseWithoutAction @ast.ClauseWithoutAction

priv type! YYObj__immut_list_T_String_ @immut/list.T[String]

priv type! YYObj__immut_list_T__ast_Rule_ @immut/list.T[@ast.Rule]

priv type! YYObj__immut_list_T__ast_Term_ @immut/list.T[@ast.Term]

priv type! YYObj__immut_list_T__ast_Symbol_ @immut/list.T[@ast.Symbol]

priv type! YYObj__immut_list_T__ast_TypeExpr_ @immut/list.T[@ast.TypeExpr]

priv type! YYObj__immut_list_T__ast_ClauseItem_ @immut/list.T[@ast.ClauseItem]

priv type! YYObj__immut_list_T__ast_PrecSymbol_ @immut/list.T[@ast.PrecSymbol]

priv type! YYObj__immut_list_T__ast_Declaration_ @immut/list.T[@ast.Declaration]

priv type! YYObj__immut_list_T__String___ast_TypeExpr___ @immut/list.T[(String, @ast.TypeExpr?)]

priv type! YYObj__immut_list_T___immut_list_T__ast_ClauseWithoutAction____ast_ClauseAction__ @immut/list.T[(@immut/list.T[@ast.ClauseWithoutAction], @ast.ClauseAction)]

priv type! YYObj__ast_TypeExpr_ @ast.TypeExpr?

priv type! YYObj__ast_PrecSymbol_ @ast.PrecSymbol?

priv type! YYObj___ast_Code__Int__Int__ (@ast.Code, Int, Int)?

priv type! YYObj__String__String_ (String, String)

priv type! YYObj__String__Int__Int_ (String, Int, Int)

priv type! YYObj__String__Int__Array__ast_SubstItem__ (String, Int, Array[@ast.SubstItem])

typealias YYState = (YYSymbol) -> YYDecision

typealias YYAction = (Position, ArrayView[(YYObj, Position, Position)]) -> YYObj

priv enum YYDecision {
  Accept
  Shift(YYState)
  Reduce(Int, YYSymbol, YYAction)
  ReduceNoLookahead(Int, YYSymbol, YYAction)
  Error
}

priv enum YYSymbol {
  T_EOF
  T_IDENT
  T_STRING
  T_LANGLE_CODE_RANGLE
  T_LBRACE_CODE_RBRACE
  T_PERCENT_LBRACE_CODE_PERCENT_RBRACE
  T_PERCENT_PERCENT_CODE_EOF
  T_PKG_AND_IDENT
  T_PERCENT_PERCENT
  T_PERCENT_START
  T_PERCENT_TOKEN
  T_PERCENT_TYPE
  T_PERCENT_POSITION
  T_PERCENT_LEFT
  T_PERCENT_RIGHT
  T_PERCENT_NONASSOC
  T_PERCENT_PREC
  T_PERCENT_DERIVE
  T_PERCENT_INLINE
  T_LBRACKET
  T_RBRACKET
  T_LPAREN
  T_RPAREN
  T_COMMA
  T_ARROW
  T_QUESTION
  T_COLON
  T_BAR
  T_EQ
  T_SEMI
  NT_spec
  NT_header
  NT_trailer
  NT_decl_list
  NT_decl
  NT_rule_list
  NT_rule
  NT_rule_no_modifiers
  NT_opt_rule_return_type
  NT_nonempty_rule_param_list
  NT_opt_rule_generic_params
  NT_nonempty_comma_ident_list
  NT_type_expr
  NT_postfix_type_expr
  NT_basic_type_expr
  NT_nonempty_type_expr_list
  NT_clause_list
  NT_nonempty_clause_list
  NT_empty_clause_without_action
  NT_nonempty_clause_without_action
  NT_clause_action
  NT_rule_prec
  NT_nonempty_item_list
  NT_item
  NT_term
  NT_nonempty_comma_term_list
  NT_nonempty_symbol_list
  NT_nonempty_prec_symbol_list
  NT_prec_symbol
  NT_symbol
  NT_option__SEMI
  EOI
}

// Workaround for EOI unused warning
fn init {
  match (EOI : YYSymbol) {
    EOI => ()
    _ => ()
  }
}

// file:///./parser.mbty
// 54|    decl=decl decl_list=decl_list { Cons(decl, decl_list) }
fn yy_action_0(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_Declaration(decl)
  guard _args[1].0 is YYObj__immut_list_T__ast_Declaration_(decl_list)
  YYObj__immut_list_T__ast_Declaration_({();  Cons(decl, decl_list) })
}

// file:///./parser.mbty
// 61|    "%token" type_=LANGLE_CODE_RANGLE symbol_list=nonempty_symbol_list { Token(symbol_list.to_array(), type_=Some(type_)) }
fn yy_action_1(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj_String(type_)
  guard _args[2].0 is YYObj__immut_list_T__ast_Symbol_(symbol_list)
  YYObj__ast_Declaration({();  Token(symbol_list.to_array(), type_=Some(type_)) })
}

// file:///./parser.mbty
// 69|    "%derive" traits=LANGLE_CODE_RANGLE type_=IDENT { Derive(traits=traits, type_=type_) }
fn yy_action_2(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj_String(traits)
  guard _args[2].0 is YYObj_String(type_)
  YYObj__ast_Declaration({();  Derive(traits=traits, type_=type_) })
}

// file:///./parser.mbty
// 197|    term=term "," term_list=nonempty_comma_term_list { Cons(term, term_list) }
fn yy_action_3(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_Term(term)
  guard _args[2].0 is YYObj__immut_list_T__ast_Term_(term_list)
  YYObj__immut_list_T__ast_Term_({();  Cons(term, term_list) })
}

// file:///./parser.mbty
// 128|    PKG_AND_IDENT { Constr(pkg=Some($1.0), $1.1, []) }
fn yy_action_4(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__String__String_(_dollar1)
  YYObj__ast_TypeExpr({();  Constr(pkg=Some(_dollar1.0), _dollar1.1, []) })
}

// file:///./parser.mbty
// 180|    item=item { Cons(item, Nil) }
fn yy_action_5(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_ClauseItem(item)
  YYObj__immut_list_T__ast_ClauseItem_({();  Cons(item, Nil) })
}

// file:///./parser.mbty
// 211|    symbol=symbol { Symbol(symbol) }
fn yy_action_6(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_Symbol(symbol)
  YYObj__ast_PrecSymbol({();  Symbol(symbol) })
}

// file:///./parser.mbty
// 147|    clause_woa=clause_without_action action=clause_action "|" clause_list=nonempty_clause_list { Cons((Cons(clause_woa, Nil), action), clause_list) }
fn yy_action_7(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  let _sub_action_0_result = yy_action_8(_last_pos, _args[0:1])
  guard _sub_action_0_result is YYObj__ast_ClauseWithoutAction(clause_woa)
  guard _args[1].0 is YYObj__ast_ClauseAction(action)
  guard _args[3].0 is YYObj__immut_list_T___immut_list_T__ast_ClauseWithoutAction____ast_ClauseAction__(clause_list)
  YYObj__immut_list_T___immut_list_T__ast_ClauseWithoutAction____ast_ClauseAction__({();  Cons((Cons(clause_woa, Nil), action), clause_list) })
}

// file:///./parser.mbty
// 192|    image=STRING { Image(image, loc=($startpos, $endpos)) }
fn yy_action_9(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(image)
  let _start_pos = _args[0].1
  let _end_pos = _args[0].2
  YYObj__ast_Term({();  Image(image, loc=(_start_pos, _end_pos)) })
}

// file:///./parser.mbty
// 175|    "%prec" symbol=prec_symbol { Some(symbol) }
fn yy_action_10(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__ast_PrecSymbol(symbol)
  YYObj__ast_PrecSymbol_({();  Some(symbol) })
}

// file:///./parser.mbty
// 73|    rule=rule { Cons(rule, Nil) }
fn yy_action_11(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_Rule(rule)
  YYObj__immut_list_T__ast_Rule_({();  Cons(rule, Nil) })
}

// file:///./parser.mbty
// 115|    "(" ")" "->" type_expr { Arrow([], $4) }
fn yy_action_12(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[3].0 is YYObj__ast_TypeExpr(_dollar4)
  YYObj__ast_TypeExpr({();  Arrow([], _dollar4) })
}

// file:///./parser.mbty
// 191|    symbol=symbol "(" nonempty_comma_term_list ")" { RuleCall(symbol, symbol_loc=($startpos(symbol), $endpos(symbol)), $3.to_array()) }
fn yy_action_13(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_Symbol(symbol)
  let _start_pos_of_item0 = _args[0].1
  let _end_pos_of_item0 = _args[0].2
  guard _args[2].0 is YYObj__immut_list_T__ast_Term_(_dollar3)
  YYObj__ast_Term({();  RuleCall(symbol, symbol_loc=(_start_pos_of_item0, _end_pos_of_item0), _dollar3.to_array()) })
}

// file:///./parser.mbty
// 86|    nonterminal=symbol generic_params=opt_rule_generic_params "(" param_list=nonempty_rule_param_list ")" type_=opt_rule_return_type ":" clause_list=clause_list option(";") {
// 87|    { inline: false, nonterminal, generic_params, params: param_list.to_array(),  type_, clauses: clause_list.to_array() }
// 88|  }
fn yy_action_14(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_Symbol(nonterminal)
  guard _args[1].0 is YYObj_Array_String_(generic_params)
  guard _args[3].0 is YYObj__immut_list_T__String___ast_TypeExpr___(param_list)
  guard _args[5].0 is YYObj__ast_TypeExpr_(type_)
  guard _args[7].0 is YYObj__immut_list_T___immut_list_T__ast_ClauseWithoutAction____ast_ClauseAction__(clause_list)
  YYObj__ast_Rule({(); 
    { inline: false, nonterminal, generic_params, params: param_list.to_array(),  type_, clauses: clause_list.to_array() }
  })
}

// file:///./parser.mbty
// 118|    "(" type_expr "," nonempty_type_expr_list ")" "->" type_expr { Arrow(@immut/list.Cons($2, $4).to_array(), $7) }
fn yy_action_15(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__ast_TypeExpr(_dollar2)
  guard _args[3].0 is YYObj__immut_list_T__ast_TypeExpr_(_dollar4)
  guard _args[6].0 is YYObj__ast_TypeExpr(_dollar7)
  YYObj__ast_TypeExpr({();  Arrow(@immut/list.Cons(_dollar2, _dollar4).to_array(), _dollar7) })
}

// file:///./parser.mbty
// 60|    "%token" symbol_list=nonempty_symbol_list { Token(symbol_list.to_array(), type_=None) }
fn yy_action_16(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__immut_list_T__ast_Symbol_(symbol_list)
  YYObj__ast_Declaration({();  Token(symbol_list.to_array(), type_=None) })
}

// file:///./parser.mbty
// 127|    IDENT { Constr(pkg=None, $1, []) }
fn yy_action_17(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(_dollar1)
  YYObj__ast_TypeExpr({();  Constr(pkg=None, _dollar1, []) })
}

// file:///./parser.mbty
// 164|    item_list=nonempty_item_list prec=rule_prec { { items: item_list.to_array(), prec, loc: ($startpos, $endpos - $startpos) } }
fn yy_action_18(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__immut_list_T__ast_ClauseItem_(item_list)
  guard _args[1].0 is YYObj__ast_PrecSymbol_(prec)
  let _start_pos = _args[0].1
  let _end_pos = _args[1].2
  YYObj__ast_ClauseWithoutAction({();  { items: item_list.to_array(), prec, loc: (_start_pos, _end_pos - _start_pos) } })
}

// file:///./parser.mbty
// 185|    term=term { { binder: None, term: term } }
fn yy_action_19(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_Term(term)
  YYObj__ast_ClauseItem({();  { binder: None, term: term } })
}

// file:///./parser.mbty
// 155|    empty_clause_without_action { $1 }
fn yy_action_20(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_ClauseWithoutAction(_dollar1)
  YYObj__ast_ClauseWithoutAction({();  _dollar1 })
}

// file:///./parser.mbty
// 50|    { None }
fn yy_action_21(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj___ast_Code__Int__Int__({();  None })
}

// file:///./parser.mbty
// 43|    code=PERCENT_LBRACE_CODE_PERCENT_RBRACE { Some(code) }
fn yy_action_22(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__String__Int__Int_(code)
  YYObj___ast_Code__Int__Int__({();  Some(code) })
}

// file:///./parser.mbty
// 83|    nonterminal=symbol type_=opt_rule_return_type ":" clause_list=clause_list option(";") {
// 84|    { inline: false, nonterminal, generic_params: [], params: [], type_, clauses: clause_list.to_array() }
// 85|  }
fn yy_action_23(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_Symbol(nonterminal)
  guard _args[1].0 is YYObj__ast_TypeExpr_(type_)
  guard _args[3].0 is YYObj__immut_list_T___immut_list_T__ast_ClauseWithoutAction____ast_ClauseAction__(clause_list)
  YYObj__ast_Rule({(); 
    { inline: false, nonterminal, generic_params: [], params: [], type_, clauses: clause_list.to_array() }
  })
}

// file:///./parser.mbty
// 78|    rule_no_modifiers { $1 }
fn yy_action_24(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_Rule(_dollar1)
  YYObj__ast_Rule({();  _dollar1 })
}

// file:///./parser.mbty
// 132|    "(" type_expr ")" { $2 }
fn yy_action_25(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__ast_TypeExpr(_dollar2)
  YYObj__ast_TypeExpr({();  _dollar2 })
}

// file:///./parser.mbty
// 66|    "%left" symbol_list=nonempty_prec_symbol_list { Left(symbol_list.to_array()) }
fn yy_action_26(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__immut_list_T__ast_PrecSymbol_(symbol_list)
  YYObj__ast_Declaration({();  Left(symbol_list.to_array()) })
}

// file:///./parser.mbty
// 44|    { None }
fn yy_action_27(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj___ast_Code__Int__Int__({();  None })
}

// file:///./parser.mbty
// 190|    symbol=symbol { Symbol(symbol, loc=($startpos, $endpos)) }
fn yy_action_28(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_Symbol(symbol)
  let _start_pos = _args[0].1
  let _end_pos = _args[0].2
  YYObj__ast_Term({();  Symbol(symbol, loc=(_start_pos, _end_pos)) })
}

// file:///./parser.mbty
// 201|    symbol=symbol { Cons(symbol, Nil) }
fn yy_action_29(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_Symbol(symbol)
  YYObj__immut_list_T__ast_Symbol_({();  Cons(symbol, Nil) })
}

// file:///./parser.mbty
// 160|    prec=rule_prec { { items: [], prec, loc: ($startpos, $endpos - $startpos) } }
fn yy_action_30(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_PrecSymbol_(prec)
  let _start_pos = _args[0].1
  let _end_pos = _args[0].2
  YYObj__ast_ClauseWithoutAction({();  { items: [], prec, loc: (_start_pos, _end_pos - _start_pos) } })
}

// file:///./parser.mbty
// 156|    nonempty_clause_without_action { $1 }
fn yy_action_8(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_ClauseWithoutAction(_dollar1)
  YYObj__ast_ClauseWithoutAction({();  _dollar1 })
}

// file:///./parser.mbty
// 141|    "|" nonempty_clause_list { $2 }
fn yy_action_31(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__immut_list_T___immut_list_T__ast_ClauseWithoutAction____ast_ClauseAction__(_dollar2)
  YYObj__immut_list_T___immut_list_T__ast_ClauseWithoutAction____ast_ClauseAction__({();  _dollar2 })
}

// file:///./parser.mbty
// 79|    "%inline" rule_no_modifiers { { ..$2, inline: true } }
fn yy_action_32(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__ast_Rule(_dollar2)
  YYObj__ast_Rule({();  { .._dollar2, inline: true } })
}

// file:///./parser.mbty
// 212|    image=STRING { Image(image) }
fn yy_action_33(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(image)
  YYObj__ast_PrecSymbol({();  Image(image) })
}

// file:///./parser.mbty
// 131|    "(" type_expr "," nonempty_type_expr_list ")" { Tuple(@immut/list.Cons($2, $4).to_array()) }
fn yy_action_34(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__ast_TypeExpr(_dollar2)
  guard _args[3].0 is YYObj__immut_list_T__ast_TypeExpr_(_dollar4)
  YYObj__ast_TypeExpr({();  Tuple(@immut/list.Cons(_dollar2, _dollar4).to_array()) })
}

// file:///./parser.mbty
// 202|    symbol=symbol symbol_list=nonempty_symbol_list { Cons(symbol, symbol_list) }
fn yy_action_35(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_Symbol(symbol)
  guard _args[1].0 is YYObj__immut_list_T__ast_Symbol_(symbol_list)
  YYObj__immut_list_T__ast_Symbol_({();  Cons(symbol, symbol_list) })
}

// file:///./parser.mbty
// 100|    IDENT ":" type_expr "," nonempty_rule_param_list { Cons(($1, Some($3)), $5) }
fn yy_action_36(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(_dollar1)
  guard _args[2].0 is YYObj__ast_TypeExpr(_dollar3)
  guard _args[4].0 is YYObj__immut_list_T__String___ast_TypeExpr___(_dollar5)
  YYObj__immut_list_T__String___ast_TypeExpr___({();  Cons((_dollar1, Some(_dollar3)), _dollar5) })
}

// file:///./parser.mbty
// 129|    IDENT "[" nonempty_type_expr_list "]" { Constr(pkg=None, $1, $3.to_array()) }
fn yy_action_37(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(_dollar1)
  guard _args[2].0 is YYObj__immut_list_T__ast_TypeExpr_(_dollar3)
  YYObj__ast_TypeExpr({();  Constr(pkg=None, _dollar1, _dollar3.to_array()) })
}

// file:///./parser.mbty
// 206|    symbol=prec_symbol { Cons(symbol, Nil) }
fn yy_action_38(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_PrecSymbol(symbol)
  YYObj__immut_list_T__ast_PrecSymbol_({();  Cons(symbol, Nil) })
}

// file:///./parser.mbty
// 148|    clause_woa=nonempty_clause_without_action "|" clause_list=nonempty_clause_list {
// 149|    guard clause_list is Cons((clause_woa_list, action), tail_clause_list)
// 150|    Cons((Cons(clause_woa, clause_woa_list), action), tail_clause_list)
// 151|  }
fn yy_action_39(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_ClauseWithoutAction(clause_woa)
  guard _args[2].0 is YYObj__immut_list_T___immut_list_T__ast_ClauseWithoutAction____ast_ClauseAction__(clause_list)
  YYObj__immut_list_T___immut_list_T__ast_ClauseWithoutAction____ast_ClauseAction__({(); 
    guard clause_list is Cons((clause_woa_list, action), tail_clause_list)
    Cons((Cons(clause_woa, clause_woa_list), action), tail_clause_list)
  })
}

// file:///./parser.mbty
// 142|    nonempty_clause_list { $1 }
fn yy_action_40(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__immut_list_T___immut_list_T__ast_ClauseWithoutAction____ast_ClauseAction__(_dollar1)
  YYObj__immut_list_T___immut_list_T__ast_ClauseWithoutAction____ast_ClauseAction__({();  _dollar1 })
}

// file:///./parser.mbty
// 110|    IDENT "," nonempty_comma_ident_list { Cons($1, $3) }
fn yy_action_41(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(_dollar1)
  guard _args[2].0 is YYObj__immut_list_T_String_(_dollar3)
  YYObj__immut_list_T_String_({();  Cons(_dollar1, _dollar3) })
}

// file:///./parser.mbty
// 92|    "->" type_=type_expr { Some(type_) }
fn yy_action_42(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__ast_TypeExpr(type_)
  YYObj__ast_TypeExpr_({();  Some(type_) })
}

// file:///./parser.mbty
// 97|    IDENT { Cons(($1, None), Nil) }
fn yy_action_43(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(_dollar1)
  YYObj__immut_list_T__String___ast_TypeExpr___({();  Cons((_dollar1, None), Nil) })
}

// file:///./parser.mbty
// 147|    clause_woa=clause_without_action action=clause_action "|" clause_list=nonempty_clause_list { Cons((Cons(clause_woa, Nil), action), clause_list) }
fn yy_action_44(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  let _sub_action_0_result = yy_action_20(_last_pos, _args[0:1])
  guard _sub_action_0_result is YYObj__ast_ClauseWithoutAction(clause_woa)
  guard _args[1].0 is YYObj__ast_ClauseAction(action)
  guard _args[3].0 is YYObj__immut_list_T___immut_list_T__ast_ClauseWithoutAction____ast_ClauseAction__(clause_list)
  YYObj__immut_list_T___immut_list_T__ast_ClauseWithoutAction____ast_ClauseAction__({();  Cons((Cons(clause_woa, Nil), action), clause_list) })
}

// file:///./parser.mbty
// 181|    item=item item_list=nonempty_item_list { Cons(item, item_list) }
fn yy_action_45(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_ClauseItem(item)
  guard _args[1].0 is YYObj__immut_list_T__ast_ClauseItem_(item_list)
  YYObj__immut_list_T__ast_ClauseItem_({();  Cons(item, item_list) })
}

// file:///./parser.mbty
// 117|    "(" type_expr "," ")" "->" type_expr { Arrow([$2], $6) }
fn yy_action_46(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__ast_TypeExpr(_dollar2)
  guard _args[5].0 is YYObj__ast_TypeExpr(_dollar6)
  YYObj__ast_TypeExpr({();  Arrow([_dollar2], _dollar6) })
}

// file:///./parser.mbty
// 49|    code=PERCENT_PERCENT_CODE_EOF { Some(code) }
fn yy_action_47(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__String__Int__Int_(code)
  YYObj___ast_Code__Int__Int__({();  Some(code) })
}

// file:///./parser.mbty
// 68|    "%nonassoc" symbol_list=nonempty_prec_symbol_list { Nonassoc(symbol_list.to_array()) }
fn yy_action_48(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__immut_list_T__ast_PrecSymbol_(symbol_list)
  YYObj__ast_Declaration({();  Nonassoc(symbol_list.to_array()) })
}

// file:///./parser.mbty
// 186|    binder=IDENT "=" term=term { { binder: Some(binder), term: term } }
fn yy_action_49(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(binder)
  guard _args[2].0 is YYObj__ast_Term(term)
  YYObj__ast_ClauseItem({();  { binder: Some(binder), term: term } })
}

// file:///./parser.mbty
// 67|    "%right" symbol_list=nonempty_prec_symbol_list { Right(symbol_list.to_array()) }
fn yy_action_50(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__immut_list_T__ast_PrecSymbol_(symbol_list)
  YYObj__ast_Declaration({();  Right(symbol_list.to_array()) })
}

// file:///./parser.mbty
// 122|    basic_type_expr { $1 }
fn yy_action_51(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_TypeExpr(_dollar1)
  YYObj__ast_TypeExpr({();  _dollar1 })
}

// file:///./stdlib.mbty
// 4|    { None }
fn yy_action_52(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Option_Unit_({();  None })
}

// file:///./parser.mbty
// 216|    ident=IDENT { ident }
fn yy_action_53(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(ident)
  YYObj__ast_Symbol({();  ident })
}

// file:///./stdlib.mbty
// 5|    X { Some($1) }
fn yy_action_54(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  let _dollar1 = ()
  YYObj_Option_Unit_({();  Some(_dollar1) })
}

// file:///./parser.mbty
// 39|    header=header decl_list=decl_list "%%" rule_list=rule_list trailer=trailer EOF { { header, decls: decl_list.to_array(), rules: rule_list.to_array(), trailer } }
fn yy_action_55(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj___ast_Code__Int__Int__(header)
  guard _args[1].0 is YYObj__immut_list_T__ast_Declaration_(decl_list)
  guard _args[3].0 is YYObj__immut_list_T__ast_Rule_(rule_list)
  guard _args[4].0 is YYObj___ast_Code__Int__Int__(trailer)
  YYObj__ast_ParserSpec({();  { header, decls: decl_list.to_array(), rules: rule_list.to_array(), trailer } })
}

// file:///./parser.mbty
// 146|    clause_woa=clause_without_action action=clause_action { Cons((Cons(clause_woa, Nil), action), Nil) }
fn yy_action_56(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  let _sub_action_0_result = yy_action_8(_last_pos, _args[0:1])
  guard _sub_action_0_result is YYObj__ast_ClauseWithoutAction(clause_woa)
  guard _args[1].0 is YYObj__ast_ClauseAction(action)
  YYObj__immut_list_T___immut_list_T__ast_ClauseWithoutAction____ast_ClauseAction__({();  Cons((Cons(clause_woa, Nil), action), Nil) })
}

// file:///./parser.mbty
// 176|    { None }
fn yy_action_57(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj__ast_PrecSymbol_({();  None })
}

// file:///./parser.mbty
// 64|    "%type" type_=LANGLE_CODE_RANGLE symbol_list=nonempty_symbol_list { Type(symbol_list.to_array(), type_=type_) }
fn yy_action_58(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj_String(type_)
  guard _args[2].0 is YYObj__immut_list_T__ast_Symbol_(symbol_list)
  YYObj__ast_Declaration({();  Type(symbol_list.to_array(), type_=type_) })
}

// file:///./parser.mbty
// 116|    "(" type_expr ")" "->" type_expr { Arrow([$2], $5) }
fn yy_action_59(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__ast_TypeExpr(_dollar2)
  guard _args[4].0 is YYObj__ast_TypeExpr(_dollar5)
  YYObj__ast_TypeExpr({();  Arrow([_dollar2], _dollar5) })
}

// file:///./parser.mbty
// 130|    PKG_AND_IDENT "[" nonempty_type_expr_list "]" { Constr(pkg=Some($1.0), $1.1, $3.to_array()) }
fn yy_action_60(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__String__String_(_dollar1)
  guard _args[2].0 is YYObj__immut_list_T__ast_TypeExpr_(_dollar3)
  YYObj__ast_TypeExpr({();  Constr(pkg=Some(_dollar1.0), _dollar1.1, _dollar3.to_array()) })
}

// file:///./parser.mbty
// 48|    code=PERCENT_LBRACE_CODE_PERCENT_RBRACE { Some(code) }
fn yy_action_61(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__String__Int__Int_(code)
  YYObj___ast_Code__Int__Int__({();  Some(code) })
}

// file:///./parser.mbty
// 55|    { Nil }
fn yy_action_62(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj__immut_list_T__ast_Declaration_({();  Nil })
}

// file:///./parser.mbty
// 65|    "%position" type_=LANGLE_CODE_RANGLE { Position(type_=type_) }
fn yy_action_63(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj_String(type_)
  YYObj__ast_Declaration({();  Position(type_=type_) })
}

// file:///./parser.mbty
// 168|    code=LBRACE_CODE_RBRACE {
// 169|      let (code, utf8_pos, subst) = code
// 170|      { code: Some({ code, utf8_pos, subst }), loc: ($startpos, $endpos - $startpos) }
// 171|  }
fn yy_action_64(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__String__Int__Array__ast_SubstItem__(code)
  let _start_pos = _args[0].1
  let _end_pos = _args[0].2
  YYObj__ast_ClauseAction({(); 
      let (code, utf8_pos, subst) = code
      { code: Some({ code, utf8_pos, subst }), loc: (_start_pos, _end_pos - _start_pos) }
  })
}

// file:///./parser.mbty
// 59|    "%start" symbol_list=nonempty_symbol_list { Start(symbol_list.to_array()) }
fn yy_action_65(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__immut_list_T__ast_Symbol_(symbol_list)
  YYObj__ast_Declaration({();  Start(symbol_list.to_array()) })
}

// file:///./parser.mbty
// 104|    { [] }
fn yy_action_66(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Array_String_({();  [] })
}

// file:///./parser.mbty
// 207|    symbol=prec_symbol symbol_list=nonempty_prec_symbol_list { Cons(symbol, symbol_list) }
fn yy_action_67(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_PrecSymbol(symbol)
  guard _args[1].0 is YYObj__immut_list_T__ast_PrecSymbol_(symbol_list)
  YYObj__immut_list_T__ast_PrecSymbol_({();  Cons(symbol, symbol_list) })
}

// file:///./parser.mbty
// 114|    postfix_type_expr { $1 }
fn yy_action_68(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_TypeExpr(_dollar1)
  YYObj__ast_TypeExpr({();  _dollar1 })
}

// file:///./parser.mbty
// 74|    rule=rule rule_list=rule_list { Cons(rule, rule_list) }
fn yy_action_69(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_Rule(rule)
  guard _args[1].0 is YYObj__immut_list_T__ast_Rule_(rule_list)
  YYObj__immut_list_T__ast_Rule_({();  Cons(rule, rule_list) })
}

// file:///./parser.mbty
// 136|    type_expr=type_expr { Cons(type_expr, Nil) }
fn yy_action_70(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_TypeExpr(type_expr)
  YYObj__immut_list_T__ast_TypeExpr_({();  Cons(type_expr, Nil) })
}

// file:///./parser.mbty
// 63|    "%token" type_=LANGLE_CODE_RANGLE symbol=symbol image=STRING { Token1(symbol, type_=Some(type_), image=image) }
fn yy_action_71(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj_String(type_)
  guard _args[2].0 is YYObj__ast_Symbol(symbol)
  guard _args[3].0 is YYObj_String(image)
  YYObj__ast_Declaration({();  Token1(symbol, type_=Some(type_), image=image) })
}

// file:///./parser.mbty
// 109|    IDENT { Cons($1, Nil) }
fn yy_action_72(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(_dollar1)
  YYObj__immut_list_T_String_({();  Cons(_dollar1, Nil) })
}

// file:///./parser.mbty
// 137|    type_expr=type_expr "," type_expr_list=nonempty_type_expr_list { Cons(type_expr, type_expr_list) }
fn yy_action_73(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_TypeExpr(type_expr)
  guard _args[2].0 is YYObj__immut_list_T__ast_TypeExpr_(type_expr_list)
  YYObj__immut_list_T__ast_TypeExpr_({();  Cons(type_expr, type_expr_list) })
}

// file:///./parser.mbty
// 99|    IDENT "," nonempty_rule_param_list { Cons(($1, None), $3) }
fn yy_action_74(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(_dollar1)
  guard _args[2].0 is YYObj__immut_list_T__String___ast_TypeExpr___(_dollar3)
  YYObj__immut_list_T__String___ast_TypeExpr___({();  Cons((_dollar1, None), _dollar3) })
}

// file:///./parser.mbty
// 93|    { None }
fn yy_action_75(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj__ast_TypeExpr_({();  None })
}

// file:///./parser.mbty
// 98|    IDENT ":" type_expr { Cons(($1, Some($3)), Nil) }
fn yy_action_76(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(_dollar1)
  guard _args[2].0 is YYObj__ast_TypeExpr(_dollar3)
  YYObj__immut_list_T__String___ast_TypeExpr___({();  Cons((_dollar1, Some(_dollar3)), Nil) })
}

// file:///./parser.mbty
// 105|    "[" nonempty_comma_ident_list "]" { $2.to_array() }
fn yy_action_77(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__immut_list_T_String_(_dollar2)
  YYObj_Array_String_({();  _dollar2.to_array() })
}

// file:///./parser.mbty
// 62|    "%token" symbol=symbol image=STRING { Token1(symbol, type_=None, image=image) }
fn yy_action_78(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__ast_Symbol(symbol)
  guard _args[2].0 is YYObj_String(image)
  YYObj__ast_Declaration({();  Token1(symbol, type_=None, image=image) })
}

// file:///./parser.mbty
// 196|    term=term { Cons(term, Nil) }
fn yy_action_79(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_Term(term)
  YYObj__immut_list_T__ast_Term_({();  Cons(term, Nil) })
}

// file:///./parser.mbty
// 146|    clause_woa=clause_without_action action=clause_action { Cons((Cons(clause_woa, Nil), action), Nil) }
fn yy_action_80(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  let _sub_action_0_result = yy_action_20(_last_pos, _args[0:1])
  guard _sub_action_0_result is YYObj__ast_ClauseWithoutAction(clause_woa)
  guard _args[1].0 is YYObj__ast_ClauseAction(action)
  YYObj__immut_list_T___immut_list_T__ast_ClauseWithoutAction____ast_ClauseAction__({();  Cons((Cons(clause_woa, Nil), action), Nil) })
}

// file:///./parser.mbty
// 123|    postfix_type_expr "?" { Option($1) }
fn yy_action_81(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__ast_TypeExpr(_dollar1)
  YYObj__ast_TypeExpr({();  Option(_dollar1) })
}

fn yy_input(token : Token, _start_pos : Position, _end_pos : Position) -> (YYSymbol, YYObj) {
  match token {
    EOF => (T_EOF, YYObj_Void)
    IDENT(data) => (T_IDENT, YYObj_String(data))
    STRING(data) => (T_STRING, YYObj_String(data))
    LANGLE_CODE_RANGLE(data) => (T_LANGLE_CODE_RANGLE, YYObj_String(data))
    LBRACE_CODE_RBRACE(data) => (T_LBRACE_CODE_RBRACE, YYObj__String__Int__Array__ast_SubstItem__(data))
    PERCENT_LBRACE_CODE_PERCENT_RBRACE(data) => (T_PERCENT_LBRACE_CODE_PERCENT_RBRACE, YYObj__String__Int__Int_(data))
    PERCENT_PERCENT_CODE_EOF(data) => (T_PERCENT_PERCENT_CODE_EOF, YYObj__String__Int__Int_(data))
    PKG_AND_IDENT(data) => (T_PKG_AND_IDENT, YYObj__String__String_(data))
    PERCENT_PERCENT => (T_PERCENT_PERCENT, YYObj_Void)
    PERCENT_START => (T_PERCENT_START, YYObj_Void)
    PERCENT_TOKEN => (T_PERCENT_TOKEN, YYObj_Void)
    PERCENT_TYPE => (T_PERCENT_TYPE, YYObj_Void)
    PERCENT_POSITION => (T_PERCENT_POSITION, YYObj_Void)
    PERCENT_LEFT => (T_PERCENT_LEFT, YYObj_Void)
    PERCENT_RIGHT => (T_PERCENT_RIGHT, YYObj_Void)
    PERCENT_NONASSOC => (T_PERCENT_NONASSOC, YYObj_Void)
    PERCENT_PREC => (T_PERCENT_PREC, YYObj_Void)
    PERCENT_DERIVE => (T_PERCENT_DERIVE, YYObj_Void)
    PERCENT_INLINE => (T_PERCENT_INLINE, YYObj_Void)
    LBRACKET => (T_LBRACKET, YYObj_Void)
    RBRACKET => (T_RBRACKET, YYObj_Void)
    LPAREN => (T_LPAREN, YYObj_Void)
    RPAREN => (T_RPAREN, YYObj_Void)
    COMMA => (T_COMMA, YYObj_Void)
    ARROW => (T_ARROW, YYObj_Void)
    QUESTION => (T_QUESTION, YYObj_Void)
    COLON => (T_COLON, YYObj_Void)
    BAR => (T_BAR, YYObj_Void)
    EQ => (T_EQ, YYObj_Void)
    SEMI => (T_SEMI, YYObj_Void)
  }
}

// [0, spec → • header decl_list PERCENT_PERCENT rule_list trailer EOF, $]
// [1, header → • PERCENT_LBRACE_CODE_PERCENT_RBRACE, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [2, header → •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [80, spec_prime → • spec, $]
fn yy_state_0(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_spec => Shift(yy_state_1)
    T_PERCENT_LBRACE_CODE_PERCENT_RBRACE => Shift(yy_state_2)
    NT_header => Shift(yy_state_3)
    T_PERCENT_PERCENT | T_PERCENT_START | T_PERCENT_TOKEN | T_PERCENT_TYPE | T_PERCENT_POSITION | T_PERCENT_LEFT | T_PERCENT_RIGHT | T_PERCENT_NONASSOC | T_PERCENT_DERIVE => Reduce(0, NT_header, yy_action_27)
    _ => Error
  }
}

// [80, spec_prime → spec •, $]
fn yy_state_1(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

// [1, header → PERCENT_LBRACE_CODE_PERCENT_RBRACE •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_2(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_header, yy_action_22)
}

// [0, spec → header • decl_list PERCENT_PERCENT rule_list trailer EOF, $]
// [6, decl_list → • decl decl_list, PERCENT_PERCENT]
// [7, decl_list → •, PERCENT_PERCENT]
// [8, decl → • PERCENT_START nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [9, decl → • PERCENT_TOKEN nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [10, decl → • PERCENT_TOKEN LANGLE_CODE_RANGLE nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [11, decl → • PERCENT_TOKEN symbol STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [12, decl → • PERCENT_TOKEN LANGLE_CODE_RANGLE symbol STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [13, decl → • PERCENT_TYPE LANGLE_CODE_RANGLE nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [14, decl → • PERCENT_POSITION LANGLE_CODE_RANGLE, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [15, decl → • PERCENT_LEFT nonempty_prec_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [16, decl → • PERCENT_RIGHT nonempty_prec_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [17, decl → • PERCENT_NONASSOC nonempty_prec_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [18, decl → • PERCENT_DERIVE LANGLE_CODE_RANGLE IDENT, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_3(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PERCENT_DERIVE => Shift(yy_state_4)
    T_PERCENT_NONASSOC => Shift(yy_state_7)
    T_PERCENT_RIGHT => Shift(yy_state_14)
    T_PERCENT_LEFT => Shift(yy_state_16)
    T_PERCENT_POSITION => Shift(yy_state_18)
    T_PERCENT_TYPE => Shift(yy_state_20)
    T_PERCENT_TOKEN => Shift(yy_state_25)
    T_PERCENT_START => Shift(yy_state_33)
    NT_decl => Shift(yy_state_35)
    NT_decl_list => Shift(yy_state_37)
    T_PERCENT_PERCENT => Reduce(0, NT_decl_list, yy_action_62)
    _ => Error
  }
}

// [18, decl → PERCENT_DERIVE • LANGLE_CODE_RANGLE IDENT, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_4(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LANGLE_CODE_RANGLE => Shift(yy_state_5)
    _ => Error
  }
}

// [18, decl → PERCENT_DERIVE LANGLE_CODE_RANGLE • IDENT, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_5(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_6)
    _ => Error
  }
}

// [18, decl → PERCENT_DERIVE LANGLE_CODE_RANGLE IDENT •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_6(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_decl, yy_action_2)
}

// [17, decl → PERCENT_NONASSOC • nonempty_prec_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [73, nonempty_prec_symbol_list → • prec_symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [74, nonempty_prec_symbol_list → • prec_symbol nonempty_prec_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [75, prec_symbol → • symbol, IDENT / STRING / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [76, prec_symbol → • STRING, IDENT / STRING / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [77, symbol → • IDENT, IDENT / STRING / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_7(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    T_STRING => Shift(yy_state_9)
    NT_symbol => Shift(yy_state_10)
    NT_prec_symbol => Shift(yy_state_11)
    NT_nonempty_prec_symbol_list => Shift(yy_state_13)
    _ => Error
  }
}

// [77, symbol → IDENT •, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_PREC / PERCENT_DERIVE / LBRACKET / LPAREN / RPAREN / COMMA / ARROW / COLON / BAR]
fn yy_state_8(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_symbol, yy_action_53)
}

// [76, prec_symbol → STRING •, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE / BAR]
fn yy_state_9(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_prec_symbol, yy_action_33)
}

// [75, prec_symbol → symbol •, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE / BAR]
fn yy_state_10(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_prec_symbol, yy_action_6)
}

// [73, nonempty_prec_symbol_list → • prec_symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [73, nonempty_prec_symbol_list → prec_symbol •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [74, nonempty_prec_symbol_list → • prec_symbol nonempty_prec_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [74, nonempty_prec_symbol_list → prec_symbol • nonempty_prec_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [75, prec_symbol → • symbol, IDENT / STRING / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [76, prec_symbol → • STRING, IDENT / STRING / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [77, symbol → • IDENT, IDENT / STRING / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_11(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    T_STRING => Shift(yy_state_9)
    NT_symbol => Shift(yy_state_10)
    NT_prec_symbol => Shift(yy_state_11)
    NT_nonempty_prec_symbol_list => Shift(yy_state_12)
    T_PERCENT_PERCENT | T_PERCENT_START | T_PERCENT_TOKEN | T_PERCENT_TYPE | T_PERCENT_POSITION | T_PERCENT_LEFT | T_PERCENT_RIGHT | T_PERCENT_NONASSOC | T_PERCENT_DERIVE => Reduce(1, NT_nonempty_prec_symbol_list, yy_action_38)
    _ => Error
  }
}

// [74, nonempty_prec_symbol_list → prec_symbol nonempty_prec_symbol_list •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_12(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_nonempty_prec_symbol_list, yy_action_67)
}

// [17, decl → PERCENT_NONASSOC nonempty_prec_symbol_list •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_13(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_decl, yy_action_48)
}

// [16, decl → PERCENT_RIGHT • nonempty_prec_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [73, nonempty_prec_symbol_list → • prec_symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [74, nonempty_prec_symbol_list → • prec_symbol nonempty_prec_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [75, prec_symbol → • symbol, IDENT / STRING / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [76, prec_symbol → • STRING, IDENT / STRING / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [77, symbol → • IDENT, IDENT / STRING / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_14(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    T_STRING => Shift(yy_state_9)
    NT_symbol => Shift(yy_state_10)
    NT_prec_symbol => Shift(yy_state_11)
    NT_nonempty_prec_symbol_list => Shift(yy_state_15)
    _ => Error
  }
}

// [16, decl → PERCENT_RIGHT nonempty_prec_symbol_list •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_15(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_decl, yy_action_50)
}

// [15, decl → PERCENT_LEFT • nonempty_prec_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [73, nonempty_prec_symbol_list → • prec_symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [74, nonempty_prec_symbol_list → • prec_symbol nonempty_prec_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [75, prec_symbol → • symbol, IDENT / STRING / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [76, prec_symbol → • STRING, IDENT / STRING / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [77, symbol → • IDENT, IDENT / STRING / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_16(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    T_STRING => Shift(yy_state_9)
    NT_symbol => Shift(yy_state_10)
    NT_prec_symbol => Shift(yy_state_11)
    NT_nonempty_prec_symbol_list => Shift(yy_state_17)
    _ => Error
  }
}

// [15, decl → PERCENT_LEFT nonempty_prec_symbol_list •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_17(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_decl, yy_action_26)
}

// [14, decl → PERCENT_POSITION • LANGLE_CODE_RANGLE, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_18(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LANGLE_CODE_RANGLE => Shift(yy_state_19)
    _ => Error
  }
}

// [14, decl → PERCENT_POSITION LANGLE_CODE_RANGLE •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_19(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_decl, yy_action_63)
}

// [13, decl → PERCENT_TYPE • LANGLE_CODE_RANGLE nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_20(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LANGLE_CODE_RANGLE => Shift(yy_state_21)
    _ => Error
  }
}

// [13, decl → PERCENT_TYPE LANGLE_CODE_RANGLE • nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [71, nonempty_symbol_list → • symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [72, nonempty_symbol_list → • symbol nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [77, symbol → • IDENT, IDENT / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_21(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    NT_symbol => Shift(yy_state_22)
    NT_nonempty_symbol_list => Shift(yy_state_24)
    _ => Error
  }
}

// [71, nonempty_symbol_list → • symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [71, nonempty_symbol_list → symbol •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [72, nonempty_symbol_list → • symbol nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [72, nonempty_symbol_list → symbol • nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [77, symbol → • IDENT, IDENT / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_22(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    NT_symbol => Shift(yy_state_22)
    NT_nonempty_symbol_list => Shift(yy_state_23)
    T_PERCENT_PERCENT | T_PERCENT_START | T_PERCENT_TOKEN | T_PERCENT_TYPE | T_PERCENT_POSITION | T_PERCENT_LEFT | T_PERCENT_RIGHT | T_PERCENT_NONASSOC | T_PERCENT_DERIVE => Reduce(1, NT_nonempty_symbol_list, yy_action_29)
    _ => Error
  }
}

// [72, nonempty_symbol_list → symbol nonempty_symbol_list •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_23(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_nonempty_symbol_list, yy_action_35)
}

// [13, decl → PERCENT_TYPE LANGLE_CODE_RANGLE nonempty_symbol_list •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_24(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_decl, yy_action_58)
}

// [9, decl → PERCENT_TOKEN • nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [10, decl → PERCENT_TOKEN • LANGLE_CODE_RANGLE nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [11, decl → PERCENT_TOKEN • symbol STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [12, decl → PERCENT_TOKEN • LANGLE_CODE_RANGLE symbol STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [71, nonempty_symbol_list → • symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [72, nonempty_symbol_list → • symbol nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [77, symbol → • IDENT, IDENT / STRING / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_25(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    NT_symbol => Shift(yy_state_26)
    T_LANGLE_CODE_RANGLE => Shift(yy_state_28)
    NT_nonempty_symbol_list => Shift(yy_state_32)
    _ => Error
  }
}

// [11, decl → PERCENT_TOKEN symbol • STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [71, nonempty_symbol_list → • symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [71, nonempty_symbol_list → symbol •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [72, nonempty_symbol_list → • symbol nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [72, nonempty_symbol_list → symbol • nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [77, symbol → • IDENT, IDENT / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_26(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    NT_symbol => Shift(yy_state_22)
    NT_nonempty_symbol_list => Shift(yy_state_23)
    T_STRING => Shift(yy_state_27)
    T_PERCENT_PERCENT | T_PERCENT_START | T_PERCENT_TOKEN | T_PERCENT_TYPE | T_PERCENT_POSITION | T_PERCENT_LEFT | T_PERCENT_RIGHT | T_PERCENT_NONASSOC | T_PERCENT_DERIVE => Reduce(1, NT_nonempty_symbol_list, yy_action_29)
    _ => Error
  }
}

// [11, decl → PERCENT_TOKEN symbol STRING •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_27(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_decl, yy_action_78)
}

// [10, decl → PERCENT_TOKEN LANGLE_CODE_RANGLE • nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [12, decl → PERCENT_TOKEN LANGLE_CODE_RANGLE • symbol STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [71, nonempty_symbol_list → • symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [72, nonempty_symbol_list → • symbol nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [77, symbol → • IDENT, IDENT / STRING / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_28(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    NT_symbol => Shift(yy_state_29)
    NT_nonempty_symbol_list => Shift(yy_state_31)
    _ => Error
  }
}

// [12, decl → PERCENT_TOKEN LANGLE_CODE_RANGLE symbol • STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [71, nonempty_symbol_list → • symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [71, nonempty_symbol_list → symbol •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [72, nonempty_symbol_list → • symbol nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [72, nonempty_symbol_list → symbol • nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [77, symbol → • IDENT, IDENT / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_29(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    NT_symbol => Shift(yy_state_22)
    NT_nonempty_symbol_list => Shift(yy_state_23)
    T_STRING => Shift(yy_state_30)
    T_PERCENT_PERCENT | T_PERCENT_START | T_PERCENT_TOKEN | T_PERCENT_TYPE | T_PERCENT_POSITION | T_PERCENT_LEFT | T_PERCENT_RIGHT | T_PERCENT_NONASSOC | T_PERCENT_DERIVE => Reduce(1, NT_nonempty_symbol_list, yy_action_29)
    _ => Error
  }
}

// [12, decl → PERCENT_TOKEN LANGLE_CODE_RANGLE symbol STRING •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_30(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_decl, yy_action_71)
}

// [10, decl → PERCENT_TOKEN LANGLE_CODE_RANGLE nonempty_symbol_list •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_31(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_decl, yy_action_1)
}

// [9, decl → PERCENT_TOKEN nonempty_symbol_list •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_32(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_decl, yy_action_16)
}

// [8, decl → PERCENT_START • nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [71, nonempty_symbol_list → • symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [72, nonempty_symbol_list → • symbol nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [77, symbol → • IDENT, IDENT / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_33(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    NT_symbol => Shift(yy_state_22)
    NT_nonempty_symbol_list => Shift(yy_state_34)
    _ => Error
  }
}

// [8, decl → PERCENT_START nonempty_symbol_list •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_34(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_decl, yy_action_65)
}

// [6, decl_list → • decl decl_list, PERCENT_PERCENT]
// [6, decl_list → decl • decl_list, PERCENT_PERCENT]
// [7, decl_list → •, PERCENT_PERCENT]
// [8, decl → • PERCENT_START nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [9, decl → • PERCENT_TOKEN nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [10, decl → • PERCENT_TOKEN LANGLE_CODE_RANGLE nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [11, decl → • PERCENT_TOKEN symbol STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [12, decl → • PERCENT_TOKEN LANGLE_CODE_RANGLE symbol STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [13, decl → • PERCENT_TYPE LANGLE_CODE_RANGLE nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [14, decl → • PERCENT_POSITION LANGLE_CODE_RANGLE, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [15, decl → • PERCENT_LEFT nonempty_prec_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [16, decl → • PERCENT_RIGHT nonempty_prec_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [17, decl → • PERCENT_NONASSOC nonempty_prec_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [18, decl → • PERCENT_DERIVE LANGLE_CODE_RANGLE IDENT, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_35(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PERCENT_DERIVE => Shift(yy_state_4)
    T_PERCENT_NONASSOC => Shift(yy_state_7)
    T_PERCENT_RIGHT => Shift(yy_state_14)
    T_PERCENT_LEFT => Shift(yy_state_16)
    T_PERCENT_POSITION => Shift(yy_state_18)
    T_PERCENT_TYPE => Shift(yy_state_20)
    T_PERCENT_TOKEN => Shift(yy_state_25)
    T_PERCENT_START => Shift(yy_state_33)
    NT_decl => Shift(yy_state_35)
    NT_decl_list => Shift(yy_state_36)
    T_PERCENT_PERCENT => Reduce(0, NT_decl_list, yy_action_62)
    _ => Error
  }
}

// [6, decl_list → decl decl_list •, PERCENT_PERCENT]
fn yy_state_36(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_decl_list, yy_action_0)
}

// [0, spec → header decl_list • PERCENT_PERCENT rule_list trailer EOF, $]
fn yy_state_37(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PERCENT_PERCENT => Shift(yy_state_38)
    _ => Error
  }
}

// [0, spec → header decl_list PERCENT_PERCENT • rule_list trailer EOF, $]
// [19, rule_list → • rule, EOF / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF]
// [20, rule_list → • rule rule_list, EOF / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF]
// [21, rule → • rule_no_modifiers, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [22, rule → • PERCENT_INLINE rule_no_modifiers, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [23, rule_no_modifiers → • symbol opt_rule_return_type COLON clause_list option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [24, rule_no_modifiers → • symbol opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type COLON clause_list option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [77, symbol → • IDENT, LBRACKET / LPAREN / ARROW / COLON]
fn yy_state_38(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    NT_symbol => Shift(yy_state_39)
    T_PERCENT_INLINE => Shift(yy_state_131)
    NT_rule_no_modifiers => Shift(yy_state_133)
    NT_rule => Shift(yy_state_134)
    NT_rule_list => Shift(yy_state_136)
    _ => Error
  }
}

// [23, rule_no_modifiers → symbol • opt_rule_return_type COLON clause_list option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [24, rule_no_modifiers → symbol • opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type COLON clause_list option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [25, opt_rule_return_type → • ARROW type_expr, COLON]
// [26, opt_rule_return_type → •, COLON]
// [31, opt_rule_generic_params → •, LPAREN]
// [32, opt_rule_generic_params → • LBRACKET nonempty_comma_ident_list RBRACKET, LPAREN]
fn yy_state_39(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACKET => Shift(yy_state_40)
    T_ARROW => Shift(yy_state_46)
    NT_opt_rule_generic_params => Shift(yy_state_78)
    NT_opt_rule_return_type => Shift(yy_state_127)
    T_COLON => Reduce(0, NT_opt_rule_return_type, yy_action_75)
    T_LPAREN => Reduce(0, NT_opt_rule_generic_params, yy_action_66)
    _ => Error
  }
}

// [32, opt_rule_generic_params → LBRACKET • nonempty_comma_ident_list RBRACKET, LPAREN]
// [33, nonempty_comma_ident_list → • IDENT, RBRACKET]
// [34, nonempty_comma_ident_list → • IDENT COMMA nonempty_comma_ident_list, RBRACKET]
fn yy_state_40(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_41)
    NT_nonempty_comma_ident_list => Shift(yy_state_44)
    _ => Error
  }
}

// [33, nonempty_comma_ident_list → IDENT •, RBRACKET]
// [34, nonempty_comma_ident_list → IDENT • COMMA nonempty_comma_ident_list, RBRACKET]
fn yy_state_41(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_42)
    T_RBRACKET => Reduce(1, NT_nonempty_comma_ident_list, yy_action_72)
    _ => Error
  }
}

// [33, nonempty_comma_ident_list → • IDENT, RBRACKET]
// [34, nonempty_comma_ident_list → • IDENT COMMA nonempty_comma_ident_list, RBRACKET]
// [34, nonempty_comma_ident_list → IDENT COMMA • nonempty_comma_ident_list, RBRACKET]
fn yy_state_42(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_41)
    NT_nonempty_comma_ident_list => Shift(yy_state_43)
    _ => Error
  }
}

// [34, nonempty_comma_ident_list → IDENT COMMA nonempty_comma_ident_list •, RBRACKET]
fn yy_state_43(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_nonempty_comma_ident_list, yy_action_41)
}

// [32, opt_rule_generic_params → LBRACKET nonempty_comma_ident_list • RBRACKET, LPAREN]
fn yy_state_44(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACKET => Shift(yy_state_45)
    _ => Error
  }
}

// [32, opt_rule_generic_params → LBRACKET nonempty_comma_ident_list RBRACKET •, LPAREN]
fn yy_state_45(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_opt_rule_generic_params, yy_action_77)
}

// [25, opt_rule_return_type → ARROW • type_expr, COLON]
// [35, type_expr → • postfix_type_expr, COLON]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, COLON]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, COLON]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, COLON]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, COLON]
// [40, postfix_type_expr → • basic_type_expr, QUESTION / COLON]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, QUESTION / COLON]
// [42, basic_type_expr → • IDENT, QUESTION / COLON]
// [43, basic_type_expr → • PKG_AND_IDENT, QUESTION / COLON]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, QUESTION / COLON]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, QUESTION / COLON]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, QUESTION / COLON]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, QUESTION / COLON]
fn yy_state_46(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_47)
    T_IDENT => Shift(yy_state_52)
    NT_basic_type_expr => Shift(yy_state_56)
    T_LPAREN => Shift(yy_state_57)
    NT_postfix_type_expr => Shift(yy_state_64)
    NT_type_expr => Shift(yy_state_77)
    _ => Error
  }
}

// [43, basic_type_expr → PKG_AND_IDENT •, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [45, basic_type_expr → PKG_AND_IDENT • LBRACKET nonempty_type_expr_list RBRACKET, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_47(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACKET => Shift(yy_state_48)
    T_RBRACKET | T_RPAREN | T_COMMA | T_QUESTION | T_COLON => Reduce(1, NT_basic_type_expr, yy_action_4)
    _ => Error
  }
}

// [35, type_expr → • postfix_type_expr, RBRACKET / COMMA]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RBRACKET / COMMA]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RBRACKET / COMMA]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RBRACKET / COMMA]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RBRACKET / COMMA]
// [40, postfix_type_expr → • basic_type_expr, RBRACKET / COMMA / QUESTION]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RBRACKET / COMMA / QUESTION]
// [42, basic_type_expr → • IDENT, RBRACKET / COMMA / QUESTION]
// [43, basic_type_expr → • PKG_AND_IDENT, RBRACKET / COMMA / QUESTION]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RBRACKET / COMMA / QUESTION]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RBRACKET / COMMA / QUESTION]
// [45, basic_type_expr → PKG_AND_IDENT LBRACKET • nonempty_type_expr_list RBRACKET, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RBRACKET / COMMA / QUESTION]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RBRACKET / COMMA / QUESTION]
// [48, nonempty_type_expr_list → • type_expr, RBRACKET]
// [49, nonempty_type_expr_list → • type_expr COMMA nonempty_type_expr_list, RBRACKET]
fn yy_state_48(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_47)
    NT_type_expr => Shift(yy_state_49)
    T_IDENT => Shift(yy_state_52)
    NT_basic_type_expr => Shift(yy_state_56)
    T_LPAREN => Shift(yy_state_57)
    NT_postfix_type_expr => Shift(yy_state_64)
    NT_nonempty_type_expr_list => Shift(yy_state_75)
    _ => Error
  }
}

// [48, nonempty_type_expr_list → type_expr •, RBRACKET / RPAREN]
// [49, nonempty_type_expr_list → type_expr • COMMA nonempty_type_expr_list, RBRACKET / RPAREN]
fn yy_state_49(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_50)
    T_RBRACKET | T_RPAREN => Reduce(1, NT_nonempty_type_expr_list, yy_action_70)
    _ => Error
  }
}

// [35, type_expr → • postfix_type_expr, RBRACKET / RPAREN / COMMA]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA]
// [40, postfix_type_expr → • basic_type_expr, RBRACKET / RPAREN / COMMA / QUESTION]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RBRACKET / RPAREN / COMMA / QUESTION]
// [42, basic_type_expr → • IDENT, RBRACKET / RPAREN / COMMA / QUESTION]
// [43, basic_type_expr → • PKG_AND_IDENT, RBRACKET / RPAREN / COMMA / QUESTION]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RBRACKET / RPAREN / COMMA / QUESTION]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RBRACKET / RPAREN / COMMA / QUESTION]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RBRACKET / RPAREN / COMMA / QUESTION]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RBRACKET / RPAREN / COMMA / QUESTION]
// [48, nonempty_type_expr_list → • type_expr, RBRACKET / RPAREN]
// [49, nonempty_type_expr_list → • type_expr COMMA nonempty_type_expr_list, RBRACKET / RPAREN]
// [49, nonempty_type_expr_list → type_expr COMMA • nonempty_type_expr_list, RBRACKET / RPAREN]
fn yy_state_50(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_47)
    NT_type_expr => Shift(yy_state_49)
    NT_nonempty_type_expr_list => Shift(yy_state_51)
    T_IDENT => Shift(yy_state_52)
    NT_basic_type_expr => Shift(yy_state_56)
    T_LPAREN => Shift(yy_state_57)
    NT_postfix_type_expr => Shift(yy_state_64)
    _ => Error
  }
}

// [49, nonempty_type_expr_list → type_expr COMMA nonempty_type_expr_list •, RBRACKET / RPAREN]
fn yy_state_51(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_nonempty_type_expr_list, yy_action_73)
}

// [42, basic_type_expr → IDENT •, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [44, basic_type_expr → IDENT • LBRACKET nonempty_type_expr_list RBRACKET, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_52(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACKET => Shift(yy_state_53)
    T_RBRACKET | T_RPAREN | T_COMMA | T_QUESTION | T_COLON => Reduce(1, NT_basic_type_expr, yy_action_17)
    _ => Error
  }
}

// [35, type_expr → • postfix_type_expr, RBRACKET / COMMA]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RBRACKET / COMMA]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RBRACKET / COMMA]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RBRACKET / COMMA]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RBRACKET / COMMA]
// [40, postfix_type_expr → • basic_type_expr, RBRACKET / COMMA / QUESTION]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RBRACKET / COMMA / QUESTION]
// [42, basic_type_expr → • IDENT, RBRACKET / COMMA / QUESTION]
// [43, basic_type_expr → • PKG_AND_IDENT, RBRACKET / COMMA / QUESTION]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RBRACKET / COMMA / QUESTION]
// [44, basic_type_expr → IDENT LBRACKET • nonempty_type_expr_list RBRACKET, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RBRACKET / COMMA / QUESTION]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RBRACKET / COMMA / QUESTION]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RBRACKET / COMMA / QUESTION]
// [48, nonempty_type_expr_list → • type_expr, RBRACKET]
// [49, nonempty_type_expr_list → • type_expr COMMA nonempty_type_expr_list, RBRACKET]
fn yy_state_53(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_47)
    NT_type_expr => Shift(yy_state_49)
    T_IDENT => Shift(yy_state_52)
    NT_nonempty_type_expr_list => Shift(yy_state_54)
    NT_basic_type_expr => Shift(yy_state_56)
    T_LPAREN => Shift(yy_state_57)
    NT_postfix_type_expr => Shift(yy_state_64)
    _ => Error
  }
}

// [44, basic_type_expr → IDENT LBRACKET nonempty_type_expr_list • RBRACKET, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_54(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACKET => Shift(yy_state_55)
    _ => Error
  }
}

// [44, basic_type_expr → IDENT LBRACKET nonempty_type_expr_list RBRACKET •, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_55(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_basic_type_expr, yy_action_37)
}

// [40, postfix_type_expr → basic_type_expr •, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_56(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_postfix_type_expr, yy_action_51)
}

// [35, type_expr → • postfix_type_expr, RPAREN / COMMA]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RPAREN / COMMA]
// [36, type_expr → LPAREN • RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RPAREN / COMMA]
// [37, type_expr → LPAREN • type_expr RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RPAREN / COMMA]
// [38, type_expr → LPAREN • type_expr COMMA RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RPAREN / COMMA]
// [39, type_expr → LPAREN • type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [40, postfix_type_expr → • basic_type_expr, RPAREN / COMMA / QUESTION]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RPAREN / COMMA / QUESTION]
// [42, basic_type_expr → • IDENT, RPAREN / COMMA / QUESTION]
// [43, basic_type_expr → • PKG_AND_IDENT, RPAREN / COMMA / QUESTION]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RPAREN / COMMA / QUESTION]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RPAREN / COMMA / QUESTION]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RPAREN / COMMA / QUESTION]
// [46, basic_type_expr → LPAREN • type_expr COMMA nonempty_type_expr_list RPAREN, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RPAREN / COMMA / QUESTION]
// [47, basic_type_expr → LPAREN • type_expr RPAREN, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_57(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_47)
    T_IDENT => Shift(yy_state_52)
    NT_basic_type_expr => Shift(yy_state_56)
    T_LPAREN => Shift(yy_state_57)
    NT_type_expr => Shift(yy_state_58)
    NT_postfix_type_expr => Shift(yy_state_64)
    T_RPAREN => Shift(yy_state_72)
    _ => Error
  }
}

// [37, type_expr → LPAREN type_expr • RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [38, type_expr → LPAREN type_expr • COMMA RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [39, type_expr → LPAREN type_expr • COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [46, basic_type_expr → LPAREN type_expr • COMMA nonempty_type_expr_list RPAREN, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [47, basic_type_expr → LPAREN type_expr • RPAREN, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_58(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_59)
    T_RPAREN => Shift(yy_state_69)
    _ => Error
  }
}

// [35, type_expr → • postfix_type_expr, RPAREN / COMMA]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RPAREN / COMMA]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RPAREN / COMMA]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RPAREN / COMMA]
// [38, type_expr → LPAREN type_expr COMMA • RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RPAREN / COMMA]
// [39, type_expr → LPAREN type_expr COMMA • nonempty_type_expr_list RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [40, postfix_type_expr → • basic_type_expr, RPAREN / COMMA / QUESTION]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RPAREN / COMMA / QUESTION]
// [42, basic_type_expr → • IDENT, RPAREN / COMMA / QUESTION]
// [43, basic_type_expr → • PKG_AND_IDENT, RPAREN / COMMA / QUESTION]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RPAREN / COMMA / QUESTION]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RPAREN / COMMA / QUESTION]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RPAREN / COMMA / QUESTION]
// [46, basic_type_expr → LPAREN type_expr COMMA • nonempty_type_expr_list RPAREN, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RPAREN / COMMA / QUESTION]
// [48, nonempty_type_expr_list → • type_expr, RPAREN]
// [49, nonempty_type_expr_list → • type_expr COMMA nonempty_type_expr_list, RPAREN]
fn yy_state_59(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_47)
    NT_type_expr => Shift(yy_state_49)
    T_IDENT => Shift(yy_state_52)
    NT_basic_type_expr => Shift(yy_state_56)
    T_LPAREN => Shift(yy_state_57)
    NT_nonempty_type_expr_list => Shift(yy_state_60)
    NT_postfix_type_expr => Shift(yy_state_64)
    T_RPAREN => Shift(yy_state_66)
    _ => Error
  }
}

// [39, type_expr → LPAREN type_expr COMMA nonempty_type_expr_list • RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [46, basic_type_expr → LPAREN type_expr COMMA nonempty_type_expr_list • RPAREN, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_60(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_61)
    _ => Error
  }
}

// [39, type_expr → LPAREN type_expr COMMA nonempty_type_expr_list RPAREN • ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [46, basic_type_expr → LPAREN type_expr COMMA nonempty_type_expr_list RPAREN •, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_61(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_ARROW => Shift(yy_state_62)
    T_RBRACKET | T_RPAREN | T_COMMA | T_QUESTION | T_COLON => Reduce(5, NT_basic_type_expr, yy_action_34)
    _ => Error
  }
}

// [35, type_expr → • postfix_type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [39, type_expr → LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW • type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [40, postfix_type_expr → • basic_type_expr, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [42, basic_type_expr → • IDENT, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [43, basic_type_expr → • PKG_AND_IDENT, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_62(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_47)
    T_IDENT => Shift(yy_state_52)
    NT_basic_type_expr => Shift(yy_state_56)
    T_LPAREN => Shift(yy_state_57)
    NT_type_expr => Shift(yy_state_63)
    NT_postfix_type_expr => Shift(yy_state_64)
    _ => Error
  }
}

// [39, type_expr → LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr •, RBRACKET / RPAREN / COMMA / COLON]
fn yy_state_63(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(7, NT_type_expr, yy_action_15)
}

// [35, type_expr → postfix_type_expr •, RBRACKET / RPAREN / COMMA / COLON]
// [41, postfix_type_expr → postfix_type_expr • QUESTION, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_64(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_QUESTION => Shift(yy_state_65)
    T_RBRACKET | T_RPAREN | T_COMMA | T_COLON => Reduce(1, NT_type_expr, yy_action_68)
    _ => Error
  }
}

// [41, postfix_type_expr → postfix_type_expr QUESTION •, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_65(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_postfix_type_expr, yy_action_81)
}

// [38, type_expr → LPAREN type_expr COMMA RPAREN • ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
fn yy_state_66(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_ARROW => Shift(yy_state_67)
    _ => Error
  }
}

// [35, type_expr → • postfix_type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [38, type_expr → LPAREN type_expr COMMA RPAREN ARROW • type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [40, postfix_type_expr → • basic_type_expr, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [42, basic_type_expr → • IDENT, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [43, basic_type_expr → • PKG_AND_IDENT, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_67(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_47)
    T_IDENT => Shift(yy_state_52)
    NT_basic_type_expr => Shift(yy_state_56)
    T_LPAREN => Shift(yy_state_57)
    NT_postfix_type_expr => Shift(yy_state_64)
    NT_type_expr => Shift(yy_state_68)
    _ => Error
  }
}

// [38, type_expr → LPAREN type_expr COMMA RPAREN ARROW type_expr •, RBRACKET / RPAREN / COMMA / COLON]
fn yy_state_68(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_type_expr, yy_action_46)
}

// [37, type_expr → LPAREN type_expr RPAREN • ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [47, basic_type_expr → LPAREN type_expr RPAREN •, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_69(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_ARROW => Shift(yy_state_70)
    T_RBRACKET | T_RPAREN | T_COMMA | T_QUESTION | T_COLON => Reduce(3, NT_basic_type_expr, yy_action_25)
    _ => Error
  }
}

// [35, type_expr → • postfix_type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [37, type_expr → LPAREN type_expr RPAREN ARROW • type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [40, postfix_type_expr → • basic_type_expr, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [42, basic_type_expr → • IDENT, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [43, basic_type_expr → • PKG_AND_IDENT, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_70(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_47)
    T_IDENT => Shift(yy_state_52)
    NT_basic_type_expr => Shift(yy_state_56)
    T_LPAREN => Shift(yy_state_57)
    NT_postfix_type_expr => Shift(yy_state_64)
    NT_type_expr => Shift(yy_state_71)
    _ => Error
  }
}

// [37, type_expr → LPAREN type_expr RPAREN ARROW type_expr •, RBRACKET / RPAREN / COMMA / COLON]
fn yy_state_71(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_type_expr, yy_action_59)
}

// [36, type_expr → LPAREN RPAREN • ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
fn yy_state_72(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_ARROW => Shift(yy_state_73)
    _ => Error
  }
}

// [35, type_expr → • postfix_type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [36, type_expr → LPAREN RPAREN ARROW • type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RBRACKET / RPAREN / COMMA / COLON]
// [40, postfix_type_expr → • basic_type_expr, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [42, basic_type_expr → • IDENT, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [43, basic_type_expr → • PKG_AND_IDENT, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_73(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_47)
    T_IDENT => Shift(yy_state_52)
    NT_basic_type_expr => Shift(yy_state_56)
    T_LPAREN => Shift(yy_state_57)
    NT_postfix_type_expr => Shift(yy_state_64)
    NT_type_expr => Shift(yy_state_74)
    _ => Error
  }
}

// [36, type_expr → LPAREN RPAREN ARROW type_expr •, RBRACKET / RPAREN / COMMA / COLON]
fn yy_state_74(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_type_expr, yy_action_12)
}

// [45, basic_type_expr → PKG_AND_IDENT LBRACKET nonempty_type_expr_list • RBRACKET, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_75(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACKET => Shift(yy_state_76)
    _ => Error
  }
}

// [45, basic_type_expr → PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET •, RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_76(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_basic_type_expr, yy_action_60)
}

// [25, opt_rule_return_type → ARROW type_expr •, COLON]
fn yy_state_77(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_opt_rule_return_type, yy_action_42)
}

// [24, rule_no_modifiers → symbol opt_rule_generic_params • LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type COLON clause_list option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_78(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LPAREN => Shift(yy_state_79)
    _ => Error
  }
}

// [24, rule_no_modifiers → symbol opt_rule_generic_params LPAREN • nonempty_rule_param_list RPAREN opt_rule_return_type COLON clause_list option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [27, nonempty_rule_param_list → • IDENT, RPAREN]
// [28, nonempty_rule_param_list → • IDENT COLON type_expr, RPAREN]
// [29, nonempty_rule_param_list → • IDENT COMMA nonempty_rule_param_list, RPAREN]
// [30, nonempty_rule_param_list → • IDENT COLON type_expr COMMA nonempty_rule_param_list, RPAREN]
fn yy_state_79(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_80)
    NT_nonempty_rule_param_list => Shift(yy_state_87)
    _ => Error
  }
}

// [27, nonempty_rule_param_list → IDENT •, RPAREN]
// [28, nonempty_rule_param_list → IDENT • COLON type_expr, RPAREN]
// [29, nonempty_rule_param_list → IDENT • COMMA nonempty_rule_param_list, RPAREN]
// [30, nonempty_rule_param_list → IDENT • COLON type_expr COMMA nonempty_rule_param_list, RPAREN]
fn yy_state_80(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_81)
    T_COLON => Shift(yy_state_83)
    T_RPAREN => Reduce(1, NT_nonempty_rule_param_list, yy_action_43)
    _ => Error
  }
}

// [27, nonempty_rule_param_list → • IDENT, RPAREN]
// [28, nonempty_rule_param_list → • IDENT COLON type_expr, RPAREN]
// [29, nonempty_rule_param_list → • IDENT COMMA nonempty_rule_param_list, RPAREN]
// [29, nonempty_rule_param_list → IDENT COMMA • nonempty_rule_param_list, RPAREN]
// [30, nonempty_rule_param_list → • IDENT COLON type_expr COMMA nonempty_rule_param_list, RPAREN]
fn yy_state_81(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_80)
    NT_nonempty_rule_param_list => Shift(yy_state_82)
    _ => Error
  }
}

// [29, nonempty_rule_param_list → IDENT COMMA nonempty_rule_param_list •, RPAREN]
fn yy_state_82(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_nonempty_rule_param_list, yy_action_74)
}

// [28, nonempty_rule_param_list → IDENT COLON • type_expr, RPAREN]
// [30, nonempty_rule_param_list → IDENT COLON • type_expr COMMA nonempty_rule_param_list, RPAREN]
// [35, type_expr → • postfix_type_expr, RPAREN / COMMA]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RPAREN / COMMA]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RPAREN / COMMA]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RPAREN / COMMA]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RPAREN / COMMA]
// [40, postfix_type_expr → • basic_type_expr, RPAREN / COMMA / QUESTION]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RPAREN / COMMA / QUESTION]
// [42, basic_type_expr → • IDENT, RPAREN / COMMA / QUESTION]
// [43, basic_type_expr → • PKG_AND_IDENT, RPAREN / COMMA / QUESTION]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RPAREN / COMMA / QUESTION]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RPAREN / COMMA / QUESTION]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RPAREN / COMMA / QUESTION]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RPAREN / COMMA / QUESTION]
fn yy_state_83(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_47)
    T_IDENT => Shift(yy_state_52)
    NT_basic_type_expr => Shift(yy_state_56)
    T_LPAREN => Shift(yy_state_57)
    NT_postfix_type_expr => Shift(yy_state_64)
    NT_type_expr => Shift(yy_state_84)
    _ => Error
  }
}

// [28, nonempty_rule_param_list → IDENT COLON type_expr •, RPAREN]
// [30, nonempty_rule_param_list → IDENT COLON type_expr • COMMA nonempty_rule_param_list, RPAREN]
fn yy_state_84(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_85)
    T_RPAREN => Reduce(3, NT_nonempty_rule_param_list, yy_action_76)
    _ => Error
  }
}

// [27, nonempty_rule_param_list → • IDENT, RPAREN]
// [28, nonempty_rule_param_list → • IDENT COLON type_expr, RPAREN]
// [29, nonempty_rule_param_list → • IDENT COMMA nonempty_rule_param_list, RPAREN]
// [30, nonempty_rule_param_list → • IDENT COLON type_expr COMMA nonempty_rule_param_list, RPAREN]
// [30, nonempty_rule_param_list → IDENT COLON type_expr COMMA • nonempty_rule_param_list, RPAREN]
fn yy_state_85(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_80)
    NT_nonempty_rule_param_list => Shift(yy_state_86)
    _ => Error
  }
}

// [30, nonempty_rule_param_list → IDENT COLON type_expr COMMA nonempty_rule_param_list •, RPAREN]
fn yy_state_86(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_nonempty_rule_param_list, yy_action_36)
}

// [24, rule_no_modifiers → symbol opt_rule_generic_params LPAREN nonempty_rule_param_list • RPAREN opt_rule_return_type COLON clause_list option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_87(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_88)
    _ => Error
  }
}

// [24, rule_no_modifiers → symbol opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN • opt_rule_return_type COLON clause_list option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [25, opt_rule_return_type → • ARROW type_expr, COLON]
// [26, opt_rule_return_type → •, COLON]
fn yy_state_88(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_ARROW => Shift(yy_state_46)
    NT_opt_rule_return_type => Shift(yy_state_89)
    T_COLON => Reduce(0, NT_opt_rule_return_type, yy_action_75)
    _ => Error
  }
}

// [24, rule_no_modifiers → symbol opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type • COLON clause_list option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_89(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_90)
    _ => Error
  }
}

// [24, rule_no_modifiers → symbol opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type COLON • clause_list option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [50, clause_list → • BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [51, clause_list → • nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [52, nonempty_clause_list → • empty_clause_without_action clause_action, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [53, nonempty_clause_list → • nonempty_clause_without_action clause_action, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [54, nonempty_clause_list → • empty_clause_without_action clause_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [55, nonempty_clause_list → • nonempty_clause_without_action clause_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [56, nonempty_clause_list → • nonempty_clause_without_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [57, empty_clause_without_action → • rule_prec, LBRACE_CODE_RBRACE]
// [58, nonempty_clause_without_action → • nonempty_item_list rule_prec, LBRACE_CODE_RBRACE / BAR]
// [60, rule_prec → • PERCENT_PREC prec_symbol, LBRACE_CODE_RBRACE]
// [61, rule_prec → •, LBRACE_CODE_RBRACE]
// [62, nonempty_item_list → • item, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [63, nonempty_item_list → • item nonempty_item_list, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [64, item → • term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [65, item → • IDENT EQ term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [66, term → • symbol, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [67, term → • symbol LPAREN nonempty_comma_term_list RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [68, term → • STRING, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [77, symbol → • IDENT, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / LPAREN / BAR]
fn yy_state_90(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_STRING => Shift(yy_state_91)
    NT_symbol => Shift(yy_state_92)
    T_IDENT => Shift(yy_state_99)
    NT_term => Shift(yy_state_102)
    NT_item => Shift(yy_state_103)
    T_PERCENT_PREC => Shift(yy_state_105)
    NT_nonempty_item_list => Shift(yy_state_107)
    NT_rule_prec => Shift(yy_state_109)
    NT_nonempty_clause_without_action => Shift(yy_state_110)
    NT_empty_clause_without_action => Shift(yy_state_114)
    NT_nonempty_clause_list => Shift(yy_state_121)
    T_BAR => Shift(yy_state_122)
    NT_clause_list => Shift(yy_state_124)
    T_LBRACE_CODE_RBRACE => Reduce(0, NT_rule_prec, yy_action_57)
    _ => Error
  }
}

// [68, term → STRING •, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / RPAREN / COMMA / BAR]
fn yy_state_91(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_term, yy_action_9)
}

// [66, term → symbol •, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / RPAREN / COMMA / BAR]
// [67, term → symbol • LPAREN nonempty_comma_term_list RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / RPAREN / COMMA / BAR]
fn yy_state_92(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LPAREN => Shift(yy_state_93)
    T_IDENT | T_STRING | T_LBRACE_CODE_RBRACE | T_PERCENT_PREC | T_RPAREN | T_COMMA | T_BAR => Reduce(1, NT_term, yy_action_28)
    _ => Error
  }
}

// [66, term → • symbol, RPAREN / COMMA]
// [67, term → • symbol LPAREN nonempty_comma_term_list RPAREN, RPAREN / COMMA]
// [67, term → symbol LPAREN • nonempty_comma_term_list RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / RPAREN / COMMA / BAR]
// [68, term → • STRING, RPAREN / COMMA]
// [69, nonempty_comma_term_list → • term, RPAREN]
// [70, nonempty_comma_term_list → • term COMMA nonempty_comma_term_list, RPAREN]
// [77, symbol → • IDENT, LPAREN / RPAREN / COMMA]
fn yy_state_93(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    T_STRING => Shift(yy_state_91)
    NT_symbol => Shift(yy_state_92)
    NT_term => Shift(yy_state_94)
    NT_nonempty_comma_term_list => Shift(yy_state_97)
    _ => Error
  }
}

// [69, nonempty_comma_term_list → term •, RPAREN]
// [70, nonempty_comma_term_list → term • COMMA nonempty_comma_term_list, RPAREN]
fn yy_state_94(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_95)
    T_RPAREN => Reduce(1, NT_nonempty_comma_term_list, yy_action_79)
    _ => Error
  }
}

// [66, term → • symbol, RPAREN / COMMA]
// [67, term → • symbol LPAREN nonempty_comma_term_list RPAREN, RPAREN / COMMA]
// [68, term → • STRING, RPAREN / COMMA]
// [69, nonempty_comma_term_list → • term, RPAREN]
// [70, nonempty_comma_term_list → • term COMMA nonempty_comma_term_list, RPAREN]
// [70, nonempty_comma_term_list → term COMMA • nonempty_comma_term_list, RPAREN]
// [77, symbol → • IDENT, LPAREN / RPAREN / COMMA]
fn yy_state_95(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    T_STRING => Shift(yy_state_91)
    NT_symbol => Shift(yy_state_92)
    NT_term => Shift(yy_state_94)
    NT_nonempty_comma_term_list => Shift(yy_state_96)
    _ => Error
  }
}

// [70, nonempty_comma_term_list → term COMMA nonempty_comma_term_list •, RPAREN]
fn yy_state_96(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_nonempty_comma_term_list, yy_action_3)
}

// [67, term → symbol LPAREN nonempty_comma_term_list • RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / RPAREN / COMMA / BAR]
fn yy_state_97(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_98)
    _ => Error
  }
}

// [67, term → symbol LPAREN nonempty_comma_term_list RPAREN •, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / RPAREN / COMMA / BAR]
fn yy_state_98(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_term, yy_action_13)
}

// [65, item → IDENT • EQ term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [77, symbol → IDENT •, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / LPAREN / BAR]
fn yy_state_99(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_EQ => Shift(yy_state_100)
    T_IDENT | T_STRING | T_LBRACE_CODE_RBRACE | T_PERCENT_PREC | T_LPAREN | T_BAR => Reduce(1, NT_symbol, yy_action_53)
    _ => Error
  }
}

// [65, item → IDENT EQ • term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [66, term → • symbol, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [67, term → • symbol LPAREN nonempty_comma_term_list RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [68, term → • STRING, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [77, symbol → • IDENT, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / LPAREN / BAR]
fn yy_state_100(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    T_STRING => Shift(yy_state_91)
    NT_symbol => Shift(yy_state_92)
    NT_term => Shift(yy_state_101)
    _ => Error
  }
}

// [65, item → IDENT EQ term •, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
fn yy_state_101(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_item, yy_action_49)
}

// [64, item → term •, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
fn yy_state_102(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_item, yy_action_19)
}

// [62, nonempty_item_list → • item, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [62, nonempty_item_list → item •, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [63, nonempty_item_list → • item nonempty_item_list, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [63, nonempty_item_list → item • nonempty_item_list, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [64, item → • term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [65, item → • IDENT EQ term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [66, term → • symbol, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [67, term → • symbol LPAREN nonempty_comma_term_list RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [68, term → • STRING, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [77, symbol → • IDENT, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / LPAREN / BAR]
fn yy_state_103(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_STRING => Shift(yy_state_91)
    NT_symbol => Shift(yy_state_92)
    T_IDENT => Shift(yy_state_99)
    NT_term => Shift(yy_state_102)
    NT_item => Shift(yy_state_103)
    NT_nonempty_item_list => Shift(yy_state_104)
    T_LBRACE_CODE_RBRACE | T_PERCENT_PREC | T_BAR => Reduce(1, NT_nonempty_item_list, yy_action_5)
    _ => Error
  }
}

// [63, nonempty_item_list → item nonempty_item_list •, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
fn yy_state_104(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_nonempty_item_list, yy_action_45)
}

// [60, rule_prec → PERCENT_PREC • prec_symbol, LBRACE_CODE_RBRACE / BAR]
// [75, prec_symbol → • symbol, LBRACE_CODE_RBRACE / BAR]
// [76, prec_symbol → • STRING, LBRACE_CODE_RBRACE / BAR]
// [77, symbol → • IDENT, LBRACE_CODE_RBRACE / BAR]
fn yy_state_105(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    T_STRING => Shift(yy_state_9)
    NT_symbol => Shift(yy_state_10)
    NT_prec_symbol => Shift(yy_state_106)
    _ => Error
  }
}

// [60, rule_prec → PERCENT_PREC prec_symbol •, LBRACE_CODE_RBRACE / BAR]
fn yy_state_106(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_rule_prec, yy_action_10)
}

// [58, nonempty_clause_without_action → nonempty_item_list • rule_prec, LBRACE_CODE_RBRACE / BAR]
// [60, rule_prec → • PERCENT_PREC prec_symbol, LBRACE_CODE_RBRACE / BAR]
// [61, rule_prec → •, LBRACE_CODE_RBRACE / BAR]
fn yy_state_107(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PERCENT_PREC => Shift(yy_state_105)
    NT_rule_prec => Shift(yy_state_108)
    T_LBRACE_CODE_RBRACE | T_BAR => Reduce(0, NT_rule_prec, yy_action_57)
    _ => Error
  }
}

// [58, nonempty_clause_without_action → nonempty_item_list rule_prec •, LBRACE_CODE_RBRACE / BAR]
fn yy_state_108(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_nonempty_clause_without_action, yy_action_18)
}

// [57, empty_clause_without_action → rule_prec •, LBRACE_CODE_RBRACE]
fn yy_state_109(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_empty_clause_without_action, yy_action_30)
}

// [53, nonempty_clause_list → nonempty_clause_without_action • clause_action, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [55, nonempty_clause_list → nonempty_clause_without_action • clause_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [56, nonempty_clause_list → nonempty_clause_without_action • BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [59, clause_action → • LBRACE_CODE_RBRACE, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / BAR / SEMI]
fn yy_state_110(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACE_CODE_RBRACE => Shift(yy_state_111)
    T_BAR => Shift(yy_state_112)
    NT_clause_action => Shift(yy_state_118)
    _ => Error
  }
}

// [59, clause_action → LBRACE_CODE_RBRACE •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / BAR / SEMI]
fn yy_state_111(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_clause_action, yy_action_64)
}

// [52, nonempty_clause_list → • empty_clause_without_action clause_action, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [53, nonempty_clause_list → • nonempty_clause_without_action clause_action, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [54, nonempty_clause_list → • empty_clause_without_action clause_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [55, nonempty_clause_list → • nonempty_clause_without_action clause_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [56, nonempty_clause_list → • nonempty_clause_without_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [56, nonempty_clause_list → nonempty_clause_without_action BAR • nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [57, empty_clause_without_action → • rule_prec, LBRACE_CODE_RBRACE]
// [58, nonempty_clause_without_action → • nonempty_item_list rule_prec, LBRACE_CODE_RBRACE / BAR]
// [60, rule_prec → • PERCENT_PREC prec_symbol, LBRACE_CODE_RBRACE]
// [61, rule_prec → •, LBRACE_CODE_RBRACE]
// [62, nonempty_item_list → • item, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [63, nonempty_item_list → • item nonempty_item_list, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [64, item → • term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [65, item → • IDENT EQ term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [66, term → • symbol, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [67, term → • symbol LPAREN nonempty_comma_term_list RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [68, term → • STRING, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [77, symbol → • IDENT, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / LPAREN / BAR]
fn yy_state_112(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_STRING => Shift(yy_state_91)
    NT_symbol => Shift(yy_state_92)
    T_IDENT => Shift(yy_state_99)
    NT_term => Shift(yy_state_102)
    NT_item => Shift(yy_state_103)
    T_PERCENT_PREC => Shift(yy_state_105)
    NT_nonempty_item_list => Shift(yy_state_107)
    NT_rule_prec => Shift(yy_state_109)
    NT_nonempty_clause_without_action => Shift(yy_state_110)
    NT_nonempty_clause_list => Shift(yy_state_113)
    NT_empty_clause_without_action => Shift(yy_state_114)
    T_LBRACE_CODE_RBRACE => Reduce(0, NT_rule_prec, yy_action_57)
    _ => Error
  }
}

// [56, nonempty_clause_list → nonempty_clause_without_action BAR nonempty_clause_list •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
fn yy_state_113(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_nonempty_clause_list, yy_action_39)
}

// [52, nonempty_clause_list → empty_clause_without_action • clause_action, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [54, nonempty_clause_list → empty_clause_without_action • clause_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [59, clause_action → • LBRACE_CODE_RBRACE, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / BAR / SEMI]
fn yy_state_114(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACE_CODE_RBRACE => Shift(yy_state_111)
    NT_clause_action => Shift(yy_state_115)
    _ => Error
  }
}

// [52, nonempty_clause_list → empty_clause_without_action clause_action •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [54, nonempty_clause_list → empty_clause_without_action clause_action • BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
fn yy_state_115(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_BAR => Shift(yy_state_116)
    T_EOF | T_IDENT | T_PERCENT_LBRACE_CODE_PERCENT_RBRACE | T_PERCENT_PERCENT_CODE_EOF | T_PERCENT_INLINE | T_SEMI => Reduce(2, NT_nonempty_clause_list, yy_action_80)
    _ => Error
  }
}

// [52, nonempty_clause_list → • empty_clause_without_action clause_action, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [53, nonempty_clause_list → • nonempty_clause_without_action clause_action, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [54, nonempty_clause_list → • empty_clause_without_action clause_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [54, nonempty_clause_list → empty_clause_without_action clause_action BAR • nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [55, nonempty_clause_list → • nonempty_clause_without_action clause_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [56, nonempty_clause_list → • nonempty_clause_without_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [57, empty_clause_without_action → • rule_prec, LBRACE_CODE_RBRACE]
// [58, nonempty_clause_without_action → • nonempty_item_list rule_prec, LBRACE_CODE_RBRACE / BAR]
// [60, rule_prec → • PERCENT_PREC prec_symbol, LBRACE_CODE_RBRACE]
// [61, rule_prec → •, LBRACE_CODE_RBRACE]
// [62, nonempty_item_list → • item, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [63, nonempty_item_list → • item nonempty_item_list, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [64, item → • term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [65, item → • IDENT EQ term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [66, term → • symbol, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [67, term → • symbol LPAREN nonempty_comma_term_list RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [68, term → • STRING, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [77, symbol → • IDENT, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / LPAREN / BAR]
fn yy_state_116(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_STRING => Shift(yy_state_91)
    NT_symbol => Shift(yy_state_92)
    T_IDENT => Shift(yy_state_99)
    NT_term => Shift(yy_state_102)
    NT_item => Shift(yy_state_103)
    T_PERCENT_PREC => Shift(yy_state_105)
    NT_nonempty_item_list => Shift(yy_state_107)
    NT_rule_prec => Shift(yy_state_109)
    NT_nonempty_clause_without_action => Shift(yy_state_110)
    NT_empty_clause_without_action => Shift(yy_state_114)
    NT_nonempty_clause_list => Shift(yy_state_117)
    T_LBRACE_CODE_RBRACE => Reduce(0, NT_rule_prec, yy_action_57)
    _ => Error
  }
}

// [54, nonempty_clause_list → empty_clause_without_action clause_action BAR nonempty_clause_list •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
fn yy_state_117(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_nonempty_clause_list, yy_action_44)
}

// [53, nonempty_clause_list → nonempty_clause_without_action clause_action •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [55, nonempty_clause_list → nonempty_clause_without_action clause_action • BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
fn yy_state_118(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_BAR => Shift(yy_state_119)
    T_EOF | T_IDENT | T_PERCENT_LBRACE_CODE_PERCENT_RBRACE | T_PERCENT_PERCENT_CODE_EOF | T_PERCENT_INLINE | T_SEMI => Reduce(2, NT_nonempty_clause_list, yy_action_56)
    _ => Error
  }
}

// [52, nonempty_clause_list → • empty_clause_without_action clause_action, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [53, nonempty_clause_list → • nonempty_clause_without_action clause_action, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [54, nonempty_clause_list → • empty_clause_without_action clause_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [55, nonempty_clause_list → • nonempty_clause_without_action clause_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [55, nonempty_clause_list → nonempty_clause_without_action clause_action BAR • nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [56, nonempty_clause_list → • nonempty_clause_without_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [57, empty_clause_without_action → • rule_prec, LBRACE_CODE_RBRACE]
// [58, nonempty_clause_without_action → • nonempty_item_list rule_prec, LBRACE_CODE_RBRACE / BAR]
// [60, rule_prec → • PERCENT_PREC prec_symbol, LBRACE_CODE_RBRACE]
// [61, rule_prec → •, LBRACE_CODE_RBRACE]
// [62, nonempty_item_list → • item, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [63, nonempty_item_list → • item nonempty_item_list, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [64, item → • term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [65, item → • IDENT EQ term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [66, term → • symbol, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [67, term → • symbol LPAREN nonempty_comma_term_list RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [68, term → • STRING, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [77, symbol → • IDENT, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / LPAREN / BAR]
fn yy_state_119(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_STRING => Shift(yy_state_91)
    NT_symbol => Shift(yy_state_92)
    T_IDENT => Shift(yy_state_99)
    NT_term => Shift(yy_state_102)
    NT_item => Shift(yy_state_103)
    T_PERCENT_PREC => Shift(yy_state_105)
    NT_nonempty_item_list => Shift(yy_state_107)
    NT_rule_prec => Shift(yy_state_109)
    NT_nonempty_clause_without_action => Shift(yy_state_110)
    NT_empty_clause_without_action => Shift(yy_state_114)
    NT_nonempty_clause_list => Shift(yy_state_120)
    T_LBRACE_CODE_RBRACE => Reduce(0, NT_rule_prec, yy_action_57)
    _ => Error
  }
}

// [55, nonempty_clause_list → nonempty_clause_without_action clause_action BAR nonempty_clause_list •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
fn yy_state_120(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_nonempty_clause_list, yy_action_7)
}

// [51, clause_list → nonempty_clause_list •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
fn yy_state_121(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_clause_list, yy_action_40)
}

// [50, clause_list → BAR • nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [52, nonempty_clause_list → • empty_clause_without_action clause_action, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [53, nonempty_clause_list → • nonempty_clause_without_action clause_action, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [54, nonempty_clause_list → • empty_clause_without_action clause_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [55, nonempty_clause_list → • nonempty_clause_without_action clause_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [56, nonempty_clause_list → • nonempty_clause_without_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [57, empty_clause_without_action → • rule_prec, LBRACE_CODE_RBRACE]
// [58, nonempty_clause_without_action → • nonempty_item_list rule_prec, LBRACE_CODE_RBRACE / BAR]
// [60, rule_prec → • PERCENT_PREC prec_symbol, LBRACE_CODE_RBRACE]
// [61, rule_prec → •, LBRACE_CODE_RBRACE]
// [62, nonempty_item_list → • item, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [63, nonempty_item_list → • item nonempty_item_list, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [64, item → • term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [65, item → • IDENT EQ term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [66, term → • symbol, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [67, term → • symbol LPAREN nonempty_comma_term_list RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [68, term → • STRING, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [77, symbol → • IDENT, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / LPAREN / BAR]
fn yy_state_122(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_STRING => Shift(yy_state_91)
    NT_symbol => Shift(yy_state_92)
    T_IDENT => Shift(yy_state_99)
    NT_term => Shift(yy_state_102)
    NT_item => Shift(yy_state_103)
    T_PERCENT_PREC => Shift(yy_state_105)
    NT_nonempty_item_list => Shift(yy_state_107)
    NT_rule_prec => Shift(yy_state_109)
    NT_nonempty_clause_without_action => Shift(yy_state_110)
    NT_empty_clause_without_action => Shift(yy_state_114)
    NT_nonempty_clause_list => Shift(yy_state_123)
    T_LBRACE_CODE_RBRACE => Reduce(0, NT_rule_prec, yy_action_57)
    _ => Error
  }
}

// [50, clause_list → BAR nonempty_clause_list •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
fn yy_state_123(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_clause_list, yy_action_31)
}

// [24, rule_no_modifiers → symbol opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type COLON clause_list • option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [78, option__SEMI → •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [79, option__SEMI → • SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_124(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_SEMI => Shift(yy_state_125)
    NT_option__SEMI => Shift(yy_state_126)
    T_EOF | T_IDENT | T_PERCENT_LBRACE_CODE_PERCENT_RBRACE | T_PERCENT_PERCENT_CODE_EOF | T_PERCENT_INLINE => Reduce(0, NT_option__SEMI, yy_action_52)
    _ => Error
  }
}

// [79, option__SEMI → SEMI •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_125(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_option__SEMI, yy_action_54)
}

// [24, rule_no_modifiers → symbol opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type COLON clause_list option__SEMI •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_126(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(9, NT_rule_no_modifiers, yy_action_14)
}

// [23, rule_no_modifiers → symbol opt_rule_return_type • COLON clause_list option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_127(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_128)
    _ => Error
  }
}

// [23, rule_no_modifiers → symbol opt_rule_return_type COLON • clause_list option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [50, clause_list → • BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [51, clause_list → • nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [52, nonempty_clause_list → • empty_clause_without_action clause_action, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [53, nonempty_clause_list → • nonempty_clause_without_action clause_action, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [54, nonempty_clause_list → • empty_clause_without_action clause_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [55, nonempty_clause_list → • nonempty_clause_without_action clause_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [56, nonempty_clause_list → • nonempty_clause_without_action BAR nonempty_clause_list, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE / SEMI]
// [57, empty_clause_without_action → • rule_prec, LBRACE_CODE_RBRACE]
// [58, nonempty_clause_without_action → • nonempty_item_list rule_prec, LBRACE_CODE_RBRACE / BAR]
// [60, rule_prec → • PERCENT_PREC prec_symbol, LBRACE_CODE_RBRACE]
// [61, rule_prec → •, LBRACE_CODE_RBRACE]
// [62, nonempty_item_list → • item, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [63, nonempty_item_list → • item nonempty_item_list, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [64, item → • term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [65, item → • IDENT EQ term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [66, term → • symbol, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [67, term → • symbol LPAREN nonempty_comma_term_list RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [68, term → • STRING, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR]
// [77, symbol → • IDENT, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / LPAREN / BAR]
fn yy_state_128(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_STRING => Shift(yy_state_91)
    NT_symbol => Shift(yy_state_92)
    T_IDENT => Shift(yy_state_99)
    NT_term => Shift(yy_state_102)
    NT_item => Shift(yy_state_103)
    T_PERCENT_PREC => Shift(yy_state_105)
    NT_nonempty_item_list => Shift(yy_state_107)
    NT_rule_prec => Shift(yy_state_109)
    NT_nonempty_clause_without_action => Shift(yy_state_110)
    NT_empty_clause_without_action => Shift(yy_state_114)
    NT_nonempty_clause_list => Shift(yy_state_121)
    T_BAR => Shift(yy_state_122)
    NT_clause_list => Shift(yy_state_129)
    T_LBRACE_CODE_RBRACE => Reduce(0, NT_rule_prec, yy_action_57)
    _ => Error
  }
}

// [23, rule_no_modifiers → symbol opt_rule_return_type COLON clause_list • option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [78, option__SEMI → •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [79, option__SEMI → • SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_129(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_SEMI => Shift(yy_state_125)
    NT_option__SEMI => Shift(yy_state_130)
    T_EOF | T_IDENT | T_PERCENT_LBRACE_CODE_PERCENT_RBRACE | T_PERCENT_PERCENT_CODE_EOF | T_PERCENT_INLINE => Reduce(0, NT_option__SEMI, yy_action_52)
    _ => Error
  }
}

// [23, rule_no_modifiers → symbol opt_rule_return_type COLON clause_list option__SEMI •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_130(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_rule_no_modifiers, yy_action_23)
}

// [22, rule → PERCENT_INLINE • rule_no_modifiers, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [23, rule_no_modifiers → • symbol opt_rule_return_type COLON clause_list option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [24, rule_no_modifiers → • symbol opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type COLON clause_list option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [77, symbol → • IDENT, LBRACKET / LPAREN / ARROW / COLON]
fn yy_state_131(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    NT_symbol => Shift(yy_state_39)
    NT_rule_no_modifiers => Shift(yy_state_132)
    _ => Error
  }
}

// [22, rule → PERCENT_INLINE rule_no_modifiers •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_132(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_rule, yy_action_32)
}

// [21, rule → rule_no_modifiers •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_133(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_rule, yy_action_24)
}

// [19, rule_list → • rule, EOF / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF]
// [19, rule_list → rule •, EOF / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF]
// [20, rule_list → • rule rule_list, EOF / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF]
// [20, rule_list → rule • rule_list, EOF / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF]
// [21, rule → • rule_no_modifiers, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [22, rule → • PERCENT_INLINE rule_no_modifiers, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [23, rule_no_modifiers → • symbol opt_rule_return_type COLON clause_list option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [24, rule_no_modifiers → • symbol opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type COLON clause_list option__SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [77, symbol → • IDENT, LBRACKET / LPAREN / ARROW / COLON]
fn yy_state_134(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_8)
    NT_symbol => Shift(yy_state_39)
    T_PERCENT_INLINE => Shift(yy_state_131)
    NT_rule_no_modifiers => Shift(yy_state_133)
    NT_rule => Shift(yy_state_134)
    NT_rule_list => Shift(yy_state_135)
    T_EOF | T_PERCENT_LBRACE_CODE_PERCENT_RBRACE | T_PERCENT_PERCENT_CODE_EOF => Reduce(1, NT_rule_list, yy_action_11)
    _ => Error
  }
}

// [20, rule_list → rule rule_list •, EOF / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF]
fn yy_state_135(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_rule_list, yy_action_69)
}

// [0, spec → header decl_list PERCENT_PERCENT rule_list • trailer EOF, $]
// [3, trailer → • PERCENT_LBRACE_CODE_PERCENT_RBRACE, EOF]
// [4, trailer → • PERCENT_PERCENT_CODE_EOF, EOF]
// [5, trailer → •, EOF]
fn yy_state_136(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PERCENT_PERCENT_CODE_EOF => Shift(yy_state_137)
    T_PERCENT_LBRACE_CODE_PERCENT_RBRACE => Shift(yy_state_138)
    NT_trailer => Shift(yy_state_139)
    T_EOF => Reduce(0, NT_trailer, yy_action_21)
    _ => Error
  }
}

// [4, trailer → PERCENT_PERCENT_CODE_EOF •, EOF]
fn yy_state_137(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_trailer, yy_action_47)
}

// [3, trailer → PERCENT_LBRACE_CODE_PERCENT_RBRACE •, EOF]
fn yy_state_138(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_trailer, yy_action_61)
}

// [0, spec → header decl_list PERCENT_PERCENT rule_list trailer • EOF, $]
fn yy_state_139(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_EOF => Shift(yy_state_140)
    _ => Error
  }
}

// [0, spec → header decl_list PERCENT_PERCENT rule_list trailer EOF •, $]
fn yy_state_140(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_spec, yy_action_55)
}

fn yy_parse[T](
  read_token : () -> (Token, Position, Position),
  start_pos : Position,
  start : YYState,
  return_ : (YYObj) -> T
) -> T!ParseError {
  let mut state_stack : @immut/list.T[YYState] = Cons(start, Nil)
  let data_stack : Array[(YYObj, Position, Position)] = []
  let mut last_pos = start_pos
  let mut state = start
  let mut lookahead : Option[(YYSymbol, (YYObj, Position, Position), Token)] = None
  let mut last_shifted_state_stack = state_stack
  while true {
    let decision = match state(EOI) {
      ReduceNoLookahead(_) | Accept as t => t
      _ => {
        match lookahead {
          Some(la) => state(la.0)
          None => {
            let (token, start_pos, end_pos) = read_token()
            let (symbol, data) = yy_input(token, start_pos, end_pos)
            lookahead = Some((symbol, (data, start_pos, end_pos), token))
            state(symbol)
          }
        }
      }
    }
    match decision {
      Accept => return return_(data_stack.unsafe_pop().0)
      Shift(next_state) => {
        guard lookahead is Some(la)
        data_stack.push(la.1)
        state_stack = Cons(next_state, state_stack)
        last_shifted_state_stack = state_stack
        state = next_state
        last_pos = la.1.2
        lookahead = None
      }
      Reduce(count, symbol, action)
      | ReduceNoLookahead(count, symbol, action) => {
        loop (count, symbol, action) {
          _ => {
            let args = data_stack[data_stack.length() - count:]
            let data = action(last_pos, args)
            let (start_pos, end_pos) = if args.length() == 0 {
              (last_pos, last_pos)
            } else {
              (args[0].1, args[args.length() - 1].2)
            }
            for i in 0..<count {
              ignore(data_stack.unsafe_pop())
              state_stack = state_stack.tail()
            }
            state = state_stack.unsafe_head()
            data_stack.push((data, start_pos, end_pos))
            match state(symbol) {
              Accept => return return_(data_stack.unsafe_pop().0)
              Shift(next_state) => {
                state_stack = Cons(next_state, state_stack)
                state = next_state
              }
              Reduce(count, symbol, action)
              | ReduceNoLookahead(count, symbol, action) => continue (count, symbol, action)
              _ => panic()
            }
          }
        }
      }
      Error => {
        let (_, (_, start_pos, end_pos), token) = lookahead.unwrap()
        error!(last_shifted_state_stack, token, (start_pos, end_pos))
      }
    }
  }
  panic()
}

fn error(stack : @immut/list.T[YYState], token : Token, loc : (Position, Position)) -> Unit!ParseError {
  let expected = []
  fn try_add(symbol : YYSymbol, kind : TokenKind) {
    fn go(stack : @immut/list.T[YYState]) {
      match stack {
        Nil => ()
        Cons(state, _) => {
          match state(symbol) {
            Accept | Shift(_) => expected.push(kind)
            Reduce(count, symbol, _) | ReduceNoLookahead(count, symbol, _) => {
              fn inner_go(stack : @immut/list.T[YYState], count, symbol) {
                let stack = stack.drop(count)
                guard stack is Cons(state, _)
                match state(symbol) {
                  Shift(state) => go(Cons(state, stack))
                  Reduce(count, symbol, _) | ReduceNoLookahead(count, symbol, _) => inner_go(stack, count, symbol)
                  _ => panic()
                }
              }
              inner_go(stack, count, symbol)
            }
            Error => ()
          }
        }
      }
    }
    go(stack)
  }
  for term in ([(T_EOF, TK_EOF), (T_IDENT, TK_IDENT), (T_STRING, TK_STRING), (T_LANGLE_CODE_RANGLE, TK_LANGLE_CODE_RANGLE), (T_LBRACE_CODE_RBRACE, TK_LBRACE_CODE_RBRACE), (T_PERCENT_LBRACE_CODE_PERCENT_RBRACE, TK_PERCENT_LBRACE_CODE_PERCENT_RBRACE), (T_PERCENT_PERCENT_CODE_EOF, TK_PERCENT_PERCENT_CODE_EOF), (T_PKG_AND_IDENT, TK_PKG_AND_IDENT), (T_PERCENT_PERCENT, TK_PERCENT_PERCENT), (T_PERCENT_START, TK_PERCENT_START), (T_PERCENT_TOKEN, TK_PERCENT_TOKEN), (T_PERCENT_TYPE, TK_PERCENT_TYPE), (T_PERCENT_POSITION, TK_PERCENT_POSITION), (T_PERCENT_LEFT, TK_PERCENT_LEFT), (T_PERCENT_RIGHT, TK_PERCENT_RIGHT), (T_PERCENT_NONASSOC, TK_PERCENT_NONASSOC), (T_PERCENT_PREC, TK_PERCENT_PREC), (T_PERCENT_DERIVE, TK_PERCENT_DERIVE), (T_PERCENT_INLINE, TK_PERCENT_INLINE), (T_LBRACKET, TK_LBRACKET), (T_RBRACKET, TK_RBRACKET), (T_LPAREN, TK_LPAREN), (T_RPAREN, TK_RPAREN), (T_COMMA, TK_COMMA), (T_ARROW, TK_ARROW), (T_QUESTION, TK_QUESTION), (T_COLON, TK_COLON), (T_BAR, TK_BAR), (T_EQ, TK_EQ), (T_SEMI, TK_SEMI)] : Array[(YYSymbol, TokenKind)]) {
    try_add(term.0, term.1)
  }
  raise UnexpectedToken(token, loc, expected)
}

pub fn spec(read_token : () -> (Token, Position, Position), start_pos : Position) -> @ast.ParserSpec!ParseError {
  yy_parse!(
    read_token,
    start_pos,
    yy_state_0,
    fn {
      YYObj__ast_ParserSpec(result) => result
      _ => panic()
    },
  )
}
