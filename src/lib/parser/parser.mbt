pub(all) typealias Position = Int

pub(all) enum Token {
  EOF
  IDENT(String)
  STRING(String)
  LBRACE_CODE_RBRACE((String, Int, Array[SubstItem]))
  PERCENT_LBRACE_CODE_PERCENT_RBRACE(String)
  PERCENT_PERCENT_CODE_EOF(String)
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
  LANGLE
  RANGLE
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
    LANGLE => TK_LANGLE
    RANGLE => TK_RANGLE
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
  TK_LANGLE
  TK_RANGLE
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
      TK_LANGLE => "\"<\""
      TK_RANGLE => "\">\""
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

priv type! YYObj_Rule Rule

priv type! YYObj_Term Term

priv type! YYObj_Array_String_ Array[String]

priv type! YYObj_Clause Clause

priv type! YYObj_String String

priv type! YYObj_Symbol Symbol

priv type! YYObj_TypeExpr TypeExpr

priv type! YYObj_ClauseItem ClauseItem

priv type! YYObj_ParserSpec ParserSpec

priv type! YYObj_Declaration Declaration

priv type! YYObj_ClauseAction ClauseAction

priv type! YYObj__immut_list_T_Rule_ @immut/list.T[Rule]

priv type! YYObj__immut_list_T_Term_ @immut/list.T[Term]

priv type! YYObj__immut_list_T_Clause_ @immut/list.T[Clause]

priv type! YYObj__immut_list_T_String_ @immut/list.T[String]

priv type! YYObj__immut_list_T_Symbol_ @immut/list.T[Symbol]

priv type! YYObj__immut_list_T_TypeExpr_ @immut/list.T[TypeExpr]

priv type! YYObj__immut_list_T_ClauseItem_ @immut/list.T[ClauseItem]

priv type! YYObj__immut_list_T_Declaration_ @immut/list.T[Declaration]

priv type! YYObj__immut_list_T__String__TypeExpr___ @immut/list.T[(String, TypeExpr?)]

priv type! YYObj_Code_ Code?

priv type! YYObj_Symbol_ Symbol?

priv type! YYObj_TypeExpr_ TypeExpr?

priv type! YYObj__String__String_ (String, String)

priv type! YYObj__String__Int__Array_SubstItem__ (String, Int, Array[SubstItem])

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
  T_LANGLE
  T_RANGLE
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
  NT_clause
  NT_clause_action
  NT_rule_prec
  NT_item_list
  NT_item
  NT_term
  NT_nonempty_comma_term_list
  NT_nonempty_symbol_list
  NT_symbol
  EOI
}

// Workaround for EOI unused warning
fn init {
  match (EOI : YYSymbol) {
    EOI => ()
    _ => ()
  }
}

fn yy_action_0(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_Declaration(decl)
  guard _args[1].0 is YYObj__immut_list_T_Declaration_(decl_list)
  YYObj__immut_list_T_Declaration_({();  Cons(decl, decl_list) })
}

fn yy_action_1(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[2].0 is YYObj_TypeExpr(type_)
  guard _args[4].0 is YYObj__immut_list_T_Symbol_(symbol_list)
  YYObj_Declaration({();  Token(symbol_list.to_array(), type_=Some(type_)) })
}

fn yy_action_2(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[2].0 is YYObj__immut_list_T_TypeExpr_(trait_list)
  guard _args[4].0 is YYObj_String(type_)
  YYObj_Declaration({();  Derive(traits=trait_list.to_array(), type_=type_) })
}

fn yy_action_3(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__String__String_(_dollar1)
  YYObj_TypeExpr({();  Constr(pkg=Some(_dollar1.0), _dollar1.1, []) })
}

fn yy_action_4(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_Symbol(symbol)
  guard _args[2].0 is YYObj__immut_list_T_Term_(_dollar3)
  YYObj_Term({();  RuleCall(symbol, _dollar3.to_array()) })
}

fn yy_action_5(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(binder)
  guard _args[2].0 is YYObj_Term(term)
  YYObj_ClauseItem({();  { binder: Some(binder), term: term } })
}

fn yy_action_6(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(ident)
  YYObj_Symbol({();  ident })
}

fn yy_action_7(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_Rule(rule)
  YYObj__immut_list_T_Rule_({();  Cons(rule, Nil) })
}

fn yy_action_8(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[3].0 is YYObj_TypeExpr(_dollar4)
  YYObj_TypeExpr({();  Arrow([], _dollar4) })
}

fn yy_action_9(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_Symbol(symbol)
  guard _args[1].0 is YYObj__immut_list_T_Symbol_(symbol_list)
  YYObj__immut_list_T_Symbol_({();  Cons(symbol, symbol_list) })
}

fn yy_action_10(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_Symbol(nonterminal)
  guard _args[1].0 is YYObj_Array_String_(generic_params)
  guard _args[3].0 is YYObj__immut_list_T__String__TypeExpr___(param_list)
  guard _args[5].0 is YYObj_TypeExpr_(type_)
  guard _args[7].0 is YYObj__immut_list_T_Clause_(clause_list)
  YYObj_Rule({(); 
    { inline: false, nonterminal, generic_params, params: param_list.to_array(),  type_, clauses: clause_list.to_array() }
  })
}

fn yy_action_11(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj_TypeExpr(_dollar2)
  guard _args[3].0 is YYObj__immut_list_T_TypeExpr_(_dollar4)
  guard _args[6].0 is YYObj_TypeExpr(_dollar7)
  YYObj_TypeExpr({();  Arrow(@immut/list.Cons(_dollar2, _dollar4).to_array(), _dollar7) })
}

fn yy_action_12(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__immut_list_T_Symbol_(symbol_list)
  YYObj_Declaration({();  Token(symbol_list.to_array(), type_=None) })
}

fn yy_action_13(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(_dollar1)
  YYObj_TypeExpr({();  Constr(pkg=None, _dollar1, []) })
}

fn yy_action_14(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj__immut_list_T_ClauseItem_({();  Nil })
}

fn yy_action_15(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_Term(term)
  YYObj__immut_list_T_Term_({();  Cons(term, Nil) })
}

fn yy_action_16(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj_Symbol(symbol)
  YYObj_Symbol_({();  Some(symbol) })
}

fn yy_action_17(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Code_({();  None })
}

fn yy_action_18(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(code)
  YYObj_Code_({();  Some(code) })
}

fn yy_action_19(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_Symbol(nonterminal)
  guard _args[1].0 is YYObj_TypeExpr_(type_)
  guard _args[3].0 is YYObj__immut_list_T_Clause_(clause_list)
  YYObj_Rule({(); 
    { inline: false, nonterminal, generic_params: [], params: [], type_, clauses: clause_list.to_array() }
  })
}

fn yy_action_20(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_Rule(_dollar1)
  YYObj_Rule({();  _dollar1 })
}

fn yy_action_21(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj_TypeExpr(_dollar2)
  YYObj_TypeExpr({();  _dollar2 })
}

fn yy_action_22(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__immut_list_T_Symbol_(symbol_list)
  YYObj_Declaration({();  Left(symbol_list.to_array()) })
}

fn yy_action_23(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Code_({();  None })
}

fn yy_action_24(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_Symbol(symbol)
  YYObj__immut_list_T_Symbol_({();  Cons(symbol, Nil) })
}

fn yy_action_25(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_ClauseItem(item)
  guard _args[1].0 is YYObj__immut_list_T_ClauseItem_(item_list)
  YYObj__immut_list_T_ClauseItem_({();  Cons(item, item_list) })
}

fn yy_action_26(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Symbol_({();  None })
}

fn yy_action_27(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_Clause(clause)
  YYObj__immut_list_T_Clause_({();  Cons(clause, Nil) })
}

fn yy_action_28(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj_Rule(_dollar2)
  YYObj_Rule({();  { .._dollar2, inline: true } })
}

fn yy_action_29(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj_TypeExpr(_dollar2)
  guard _args[3].0 is YYObj__immut_list_T_TypeExpr_(_dollar4)
  YYObj_TypeExpr({();  Tuple(@immut/list.Cons(_dollar2, _dollar4).to_array()) })
}

fn yy_action_30(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(_dollar1)
  guard _args[2].0 is YYObj_TypeExpr(_dollar3)
  guard _args[4].0 is YYObj__immut_list_T__String__TypeExpr___(_dollar5)
  YYObj__immut_list_T__String__TypeExpr___({();  Cons((_dollar1, Some(_dollar3)), _dollar5) })
}

fn yy_action_31(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(_dollar1)
  guard _args[2].0 is YYObj__immut_list_T_TypeExpr_(_dollar3)
  YYObj_TypeExpr({();  Constr(pkg=None, _dollar1, _dollar3.to_array()) })
}

fn yy_action_32(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_Clause(clause)
  guard _args[2].0 is YYObj__immut_list_T_Clause_(clause_list)
  YYObj__immut_list_T_Clause_({();  Cons(clause, clause_list) })
}

fn yy_action_33(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  let _start_pos = _last_pos
  let _end_pos = _last_pos
  YYObj_ClauseAction({();  { code: None, start: _start_pos, end: _end_pos } })
}

fn yy_action_34(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(_dollar1)
  guard _args[2].0 is YYObj__immut_list_T_String_(_dollar3)
  YYObj__immut_list_T_String_({();  Cons(_dollar1, _dollar3) })
}

fn yy_action_35(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj_TypeExpr(type_)
  YYObj_TypeExpr_({();  Some(type_) })
}

fn yy_action_36(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(_dollar1)
  YYObj__immut_list_T__String__TypeExpr___({();  Cons((_dollar1, None), Nil) })
}

fn yy_action_37(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(image)
  YYObj_Term({();  Image(image) })
}

fn yy_action_38(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj_TypeExpr(_dollar2)
  guard _args[5].0 is YYObj_TypeExpr(_dollar6)
  YYObj_TypeExpr({();  Arrow([_dollar2], _dollar6) })
}

fn yy_action_39(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(code)
  YYObj_Code_({();  Some(code) })
}

fn yy_action_40(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__immut_list_T_Symbol_(symbol_list)
  YYObj_Declaration({();  Nonassoc(symbol_list.to_array()) })
}

fn yy_action_41(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_Term(term)
  guard _args[2].0 is YYObj__immut_list_T_Term_(term_list)
  YYObj__immut_list_T_Term_({();  Cons(term, term_list) })
}

fn yy_action_42(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__immut_list_T_Symbol_(symbol_list)
  YYObj_Declaration({();  Right(symbol_list.to_array()) })
}

fn yy_action_43(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_TypeExpr(_dollar1)
  YYObj_TypeExpr({();  _dollar1 })
}

fn yy_action_44(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_Code_(header)
  guard _args[1].0 is YYObj__immut_list_T_Declaration_(decl_list)
  guard _args[3].0 is YYObj__immut_list_T_Rule_(rule_list)
  guard _args[4].0 is YYObj_Code_(trailer)
  YYObj_ParserSpec({();  { header, decls: decl_list.to_array(), rules: rule_list.to_array(), trailer } })
}

fn yy_action_45(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_Symbol(symbol)
  YYObj_Term({();  Symbol(symbol) })
}

fn yy_action_46(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[2].0 is YYObj_TypeExpr(type_)
  guard _args[4].0 is YYObj__immut_list_T_Symbol_(symbol_list)
  YYObj_Declaration({();  Type(symbol_list.to_array(), type_=type_) })
}

fn yy_action_47(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj_TypeExpr(_dollar2)
  guard _args[4].0 is YYObj_TypeExpr(_dollar5)
  YYObj_TypeExpr({();  Arrow([_dollar2], _dollar5) })
}

fn yy_action_48(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__String__String_(_dollar1)
  guard _args[2].0 is YYObj__immut_list_T_TypeExpr_(_dollar3)
  YYObj_TypeExpr({();  Constr(pkg=Some(_dollar1.0), _dollar1.1, _dollar3.to_array()) })
}

fn yy_action_49(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(code)
  YYObj_Code_({();  Some(code) })
}

fn yy_action_50(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[2].0 is YYObj_TypeExpr(type_)
  YYObj_Declaration({();  Position(type_=type_) })
}

fn yy_action_51(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj__immut_list_T_Declaration_({();  Nil })
}

fn yy_action_52(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_Term(term)
  YYObj_ClauseItem({();  { binder: None, term: term } })
}

fn yy_action_53(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__immut_list_T_Symbol_(symbol_list)
  YYObj_Declaration({();  Start(symbol_list.to_array()) })
}

fn yy_action_54(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_Array_String_({();  [] })
}

fn yy_action_55(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_Rule(rule)
  guard _args[1].0 is YYObj__immut_list_T_Rule_(rule_list)
  YYObj__immut_list_T_Rule_({();  Cons(rule, rule_list) })
}

fn yy_action_56(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_TypeExpr(_dollar1)
  YYObj_TypeExpr({();  _dollar1 })
}

fn yy_action_57(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__String__Int__Array_SubstItem__(code)
  let _start_pos = _args[0].1
  let _end_pos = _args[0].2
  YYObj_ClauseAction({(); 
      let (code, utf8_pos, subst) = code
      { code: Some({ code, utf8_pos, subst }), start: _start_pos, end: _end_pos }
  })
}

fn yy_action_58(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj__immut_list_T_ClauseItem_(item_list)
  guard _args[1].0 is YYObj_Symbol_(prec)
  guard _args[2].0 is YYObj_ClauseAction(action)
  YYObj_Clause({();  { items: item_list.to_array(), prec, action } })
}

fn yy_action_59(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_TypeExpr(type_expr)
  YYObj__immut_list_T_TypeExpr_({();  Cons(type_expr, Nil) })
}

fn yy_action_60(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[2].0 is YYObj_TypeExpr(type_)
  guard _args[4].0 is YYObj_Symbol(symbol)
  guard _args[5].0 is YYObj_String(image)
  YYObj_Declaration({();  Token1(symbol, type_=Some(type_), image=image) })
}

fn yy_action_61(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(_dollar1)
  YYObj__immut_list_T_String_({();  Cons(_dollar1, Nil) })
}

fn yy_action_62(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_TypeExpr(type_expr)
  guard _args[2].0 is YYObj__immut_list_T_TypeExpr_(type_expr_list)
  YYObj__immut_list_T_TypeExpr_({();  Cons(type_expr, type_expr_list) })
}

fn yy_action_63(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(_dollar1)
  guard _args[2].0 is YYObj__immut_list_T__String__TypeExpr___(_dollar3)
  YYObj__immut_list_T__String__TypeExpr___({();  Cons((_dollar1, None), _dollar3) })
}

fn yy_action_64(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  YYObj_TypeExpr_({();  None })
}

fn yy_action_65(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_String(_dollar1)
  guard _args[2].0 is YYObj_TypeExpr(_dollar3)
  YYObj__immut_list_T__String__TypeExpr___({();  Cons((_dollar1, Some(_dollar3)), Nil) })
}

fn yy_action_66(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj__immut_list_T_String_(_dollar2)
  YYObj_Array_String_({();  _dollar2.to_array() })
}

fn yy_action_67(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[1].0 is YYObj_Symbol(symbol)
  guard _args[2].0 is YYObj_String(image)
  YYObj_Declaration({();  Token1(symbol, type_=None, image=image) })
}

fn yy_action_68(_last_pos : Position, _args : ArrayView[(YYObj, Position, Position)]) -> YYObj {
  guard _args[0].0 is YYObj_TypeExpr(_dollar1)
  YYObj_TypeExpr({();  Option(_dollar1) })
}

fn yy_input(token : Token, _start_pos : Position, _end_pos : Position) -> (YYSymbol, YYObj) {
  match token {
    EOF => (T_EOF, YYObj_Void)
    IDENT(data) => (T_IDENT, YYObj_String(data))
    STRING(data) => (T_STRING, YYObj_String(data))
    LBRACE_CODE_RBRACE(data) => (T_LBRACE_CODE_RBRACE, YYObj__String__Int__Array_SubstItem__(data))
    PERCENT_LBRACE_CODE_PERCENT_RBRACE(data) => (T_PERCENT_LBRACE_CODE_PERCENT_RBRACE, YYObj_String(data))
    PERCENT_PERCENT_CODE_EOF(data) => (T_PERCENT_PERCENT_CODE_EOF, YYObj_String(data))
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
    LANGLE => (T_LANGLE, YYObj_Void)
    RANGLE => (T_RANGLE, YYObj_Void)
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
// [69, spec_prime → • spec, $]
fn yy_state_0(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_spec => Shift(yy_state_1)
    T_PERCENT_LBRACE_CODE_PERCENT_RBRACE => Shift(yy_state_2)
    NT_header => Shift(yy_state_3)
    T_PERCENT_PERCENT | T_PERCENT_START | T_PERCENT_TOKEN | T_PERCENT_TYPE | T_PERCENT_POSITION | T_PERCENT_LEFT | T_PERCENT_RIGHT | T_PERCENT_NONASSOC | T_PERCENT_DERIVE => Reduce(0, NT_header, yy_action_23)
    _ => Error
  }
}

// [69, spec_prime → spec •, $]
fn yy_state_1(_lookahead : YYSymbol) -> YYDecision {
  Accept
}

// [1, header → PERCENT_LBRACE_CODE_PERCENT_RBRACE •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_2(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_header, yy_action_18)
}

// [0, spec → header • decl_list PERCENT_PERCENT rule_list trailer EOF, $]
// [6, decl_list → • decl decl_list, PERCENT_PERCENT]
// [7, decl_list → •, PERCENT_PERCENT]
// [8, decl → • PERCENT_START nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [9, decl → • PERCENT_TOKEN nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [10, decl → • PERCENT_TOKEN LANGLE type_expr RANGLE nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [11, decl → • PERCENT_TOKEN symbol STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [12, decl → • PERCENT_TOKEN LANGLE type_expr RANGLE symbol STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [13, decl → • PERCENT_TYPE LANGLE type_expr RANGLE nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [14, decl → • PERCENT_POSITION LANGLE type_expr RANGLE, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [15, decl → • PERCENT_LEFT nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [16, decl → • PERCENT_RIGHT nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [17, decl → • PERCENT_NONASSOC nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [18, decl → • PERCENT_DERIVE LANGLE nonempty_type_expr_list RANGLE IDENT, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_3(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PERCENT_DERIVE => Shift(yy_state_4)
    T_PERCENT_NONASSOC => Shift(yy_state_39)
    T_PERCENT_RIGHT => Shift(yy_state_44)
    T_PERCENT_LEFT => Shift(yy_state_46)
    T_PERCENT_POSITION => Shift(yy_state_48)
    T_PERCENT_TYPE => Shift(yy_state_52)
    T_PERCENT_TOKEN => Shift(yy_state_57)
    T_PERCENT_START => Shift(yy_state_67)
    NT_decl => Shift(yy_state_69)
    NT_decl_list => Shift(yy_state_71)
    T_PERCENT_PERCENT => Reduce(0, NT_decl_list, yy_action_51)
    _ => Error
  }
}

// [18, decl → PERCENT_DERIVE • LANGLE nonempty_type_expr_list RANGLE IDENT, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_4(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LANGLE => Shift(yy_state_5)
    _ => Error
  }
}

// [18, decl → PERCENT_DERIVE LANGLE • nonempty_type_expr_list RANGLE IDENT, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [35, type_expr → • postfix_type_expr, RANGLE / COMMA]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RANGLE / COMMA]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RANGLE / COMMA]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RANGLE / COMMA]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RANGLE / COMMA]
// [40, postfix_type_expr → • basic_type_expr, RANGLE / COMMA / QUESTION]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RANGLE / COMMA / QUESTION]
// [42, basic_type_expr → • IDENT, RANGLE / COMMA / QUESTION]
// [43, basic_type_expr → • PKG_AND_IDENT, RANGLE / COMMA / QUESTION]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / COMMA / QUESTION]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / COMMA / QUESTION]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RANGLE / COMMA / QUESTION]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RANGLE / COMMA / QUESTION]
// [48, nonempty_type_expr_list → • type_expr, RANGLE]
// [49, nonempty_type_expr_list → • type_expr COMMA nonempty_type_expr_list, RANGLE]
fn yy_state_5(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_type_expr => Shift(yy_state_6)
    T_PKG_AND_IDENT => Shift(yy_state_9)
    T_IDENT => Shift(yy_state_13)
    NT_basic_type_expr => Shift(yy_state_17)
    T_LPAREN => Shift(yy_state_18)
    NT_postfix_type_expr => Shift(yy_state_25)
    NT_nonempty_type_expr_list => Shift(yy_state_36)
    _ => Error
  }
}

// [48, nonempty_type_expr_list → type_expr •, RANGLE / RBRACKET / RPAREN]
// [49, nonempty_type_expr_list → type_expr • COMMA nonempty_type_expr_list, RANGLE / RBRACKET / RPAREN]
fn yy_state_6(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_7)
    T_RANGLE | T_RBRACKET | T_RPAREN => Reduce(1, NT_nonempty_type_expr_list, yy_action_59)
    _ => Error
  }
}

// [35, type_expr → • postfix_type_expr, RANGLE / RBRACKET / RPAREN / COMMA]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA]
// [40, postfix_type_expr → • basic_type_expr, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION]
// [42, basic_type_expr → • IDENT, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION]
// [43, basic_type_expr → • PKG_AND_IDENT, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION]
// [48, nonempty_type_expr_list → • type_expr, RANGLE / RBRACKET / RPAREN]
// [49, nonempty_type_expr_list → • type_expr COMMA nonempty_type_expr_list, RANGLE / RBRACKET / RPAREN]
// [49, nonempty_type_expr_list → type_expr COMMA • nonempty_type_expr_list, RANGLE / RBRACKET / RPAREN]
fn yy_state_7(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_type_expr => Shift(yy_state_6)
    NT_nonempty_type_expr_list => Shift(yy_state_8)
    T_PKG_AND_IDENT => Shift(yy_state_9)
    T_IDENT => Shift(yy_state_13)
    NT_basic_type_expr => Shift(yy_state_17)
    T_LPAREN => Shift(yy_state_18)
    NT_postfix_type_expr => Shift(yy_state_25)
    _ => Error
  }
}

// [49, nonempty_type_expr_list → type_expr COMMA nonempty_type_expr_list •, RANGLE / RBRACKET / RPAREN]
fn yy_state_8(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_nonempty_type_expr_list, yy_action_62)
}

// [43, basic_type_expr → PKG_AND_IDENT •, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [45, basic_type_expr → PKG_AND_IDENT • LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_9(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACKET => Shift(yy_state_10)
    T_RANGLE | T_RBRACKET | T_RPAREN | T_COMMA | T_QUESTION | T_COLON => Reduce(1, NT_basic_type_expr, yy_action_3)
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
// [45, basic_type_expr → PKG_AND_IDENT LBRACKET • nonempty_type_expr_list RBRACKET, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RBRACKET / COMMA / QUESTION]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RBRACKET / COMMA / QUESTION]
// [48, nonempty_type_expr_list → • type_expr, RBRACKET]
// [49, nonempty_type_expr_list → • type_expr COMMA nonempty_type_expr_list, RBRACKET]
fn yy_state_10(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_type_expr => Shift(yy_state_6)
    T_PKG_AND_IDENT => Shift(yy_state_9)
    NT_nonempty_type_expr_list => Shift(yy_state_11)
    T_IDENT => Shift(yy_state_13)
    NT_basic_type_expr => Shift(yy_state_17)
    T_LPAREN => Shift(yy_state_18)
    NT_postfix_type_expr => Shift(yy_state_25)
    _ => Error
  }
}

// [45, basic_type_expr → PKG_AND_IDENT LBRACKET nonempty_type_expr_list • RBRACKET, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_11(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACKET => Shift(yy_state_12)
    _ => Error
  }
}

// [45, basic_type_expr → PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET •, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_12(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_basic_type_expr, yy_action_48)
}

// [42, basic_type_expr → IDENT •, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [44, basic_type_expr → IDENT • LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_13(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACKET => Shift(yy_state_14)
    T_RANGLE | T_RBRACKET | T_RPAREN | T_COMMA | T_QUESTION | T_COLON => Reduce(1, NT_basic_type_expr, yy_action_13)
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
// [44, basic_type_expr → IDENT LBRACKET • nonempty_type_expr_list RBRACKET, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RBRACKET / COMMA / QUESTION]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RBRACKET / COMMA / QUESTION]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RBRACKET / COMMA / QUESTION]
// [48, nonempty_type_expr_list → • type_expr, RBRACKET]
// [49, nonempty_type_expr_list → • type_expr COMMA nonempty_type_expr_list, RBRACKET]
fn yy_state_14(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_type_expr => Shift(yy_state_6)
    T_PKG_AND_IDENT => Shift(yy_state_9)
    T_IDENT => Shift(yy_state_13)
    NT_nonempty_type_expr_list => Shift(yy_state_15)
    NT_basic_type_expr => Shift(yy_state_17)
    T_LPAREN => Shift(yy_state_18)
    NT_postfix_type_expr => Shift(yy_state_25)
    _ => Error
  }
}

// [44, basic_type_expr → IDENT LBRACKET nonempty_type_expr_list • RBRACKET, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_15(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACKET => Shift(yy_state_16)
    _ => Error
  }
}

// [44, basic_type_expr → IDENT LBRACKET nonempty_type_expr_list RBRACKET •, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_16(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_basic_type_expr, yy_action_31)
}

// [40, postfix_type_expr → basic_type_expr •, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_17(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_postfix_type_expr, yy_action_43)
}

// [35, type_expr → • postfix_type_expr, RPAREN / COMMA]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RPAREN / COMMA]
// [36, type_expr → LPAREN • RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RPAREN / COMMA]
// [37, type_expr → LPAREN • type_expr RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RPAREN / COMMA]
// [38, type_expr → LPAREN • type_expr COMMA RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RPAREN / COMMA]
// [39, type_expr → LPAREN • type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [40, postfix_type_expr → • basic_type_expr, RPAREN / COMMA / QUESTION]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RPAREN / COMMA / QUESTION]
// [42, basic_type_expr → • IDENT, RPAREN / COMMA / QUESTION]
// [43, basic_type_expr → • PKG_AND_IDENT, RPAREN / COMMA / QUESTION]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RPAREN / COMMA / QUESTION]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RPAREN / COMMA / QUESTION]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RPAREN / COMMA / QUESTION]
// [46, basic_type_expr → LPAREN • type_expr COMMA nonempty_type_expr_list RPAREN, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RPAREN / COMMA / QUESTION]
// [47, basic_type_expr → LPAREN • type_expr RPAREN, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_18(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_9)
    T_IDENT => Shift(yy_state_13)
    NT_basic_type_expr => Shift(yy_state_17)
    T_LPAREN => Shift(yy_state_18)
    NT_type_expr => Shift(yy_state_19)
    NT_postfix_type_expr => Shift(yy_state_25)
    T_RPAREN => Shift(yy_state_33)
    _ => Error
  }
}

// [37, type_expr → LPAREN type_expr • RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [38, type_expr → LPAREN type_expr • COMMA RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [39, type_expr → LPAREN type_expr • COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [46, basic_type_expr → LPAREN type_expr • COMMA nonempty_type_expr_list RPAREN, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [47, basic_type_expr → LPAREN type_expr • RPAREN, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_19(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_20)
    T_RPAREN => Shift(yy_state_30)
    _ => Error
  }
}

// [35, type_expr → • postfix_type_expr, RPAREN / COMMA]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RPAREN / COMMA]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RPAREN / COMMA]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RPAREN / COMMA]
// [38, type_expr → LPAREN type_expr COMMA • RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RPAREN / COMMA]
// [39, type_expr → LPAREN type_expr COMMA • nonempty_type_expr_list RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [40, postfix_type_expr → • basic_type_expr, RPAREN / COMMA / QUESTION]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RPAREN / COMMA / QUESTION]
// [42, basic_type_expr → • IDENT, RPAREN / COMMA / QUESTION]
// [43, basic_type_expr → • PKG_AND_IDENT, RPAREN / COMMA / QUESTION]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RPAREN / COMMA / QUESTION]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RPAREN / COMMA / QUESTION]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RPAREN / COMMA / QUESTION]
// [46, basic_type_expr → LPAREN type_expr COMMA • nonempty_type_expr_list RPAREN, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RPAREN / COMMA / QUESTION]
// [48, nonempty_type_expr_list → • type_expr, RPAREN]
// [49, nonempty_type_expr_list → • type_expr COMMA nonempty_type_expr_list, RPAREN]
fn yy_state_20(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    NT_type_expr => Shift(yy_state_6)
    T_PKG_AND_IDENT => Shift(yy_state_9)
    T_IDENT => Shift(yy_state_13)
    NT_basic_type_expr => Shift(yy_state_17)
    T_LPAREN => Shift(yy_state_18)
    NT_nonempty_type_expr_list => Shift(yy_state_21)
    NT_postfix_type_expr => Shift(yy_state_25)
    T_RPAREN => Shift(yy_state_27)
    _ => Error
  }
}

// [39, type_expr → LPAREN type_expr COMMA nonempty_type_expr_list • RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [46, basic_type_expr → LPAREN type_expr COMMA nonempty_type_expr_list • RPAREN, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_21(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_22)
    _ => Error
  }
}

// [39, type_expr → LPAREN type_expr COMMA nonempty_type_expr_list RPAREN • ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [46, basic_type_expr → LPAREN type_expr COMMA nonempty_type_expr_list RPAREN •, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_22(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_ARROW => Shift(yy_state_23)
    T_RANGLE | T_RBRACKET | T_RPAREN | T_COMMA | T_QUESTION | T_COLON => Reduce(5, NT_basic_type_expr, yy_action_29)
    _ => Error
  }
}

// [35, type_expr → • postfix_type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [39, type_expr → LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW • type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [40, postfix_type_expr → • basic_type_expr, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [42, basic_type_expr → • IDENT, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [43, basic_type_expr → • PKG_AND_IDENT, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_23(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_9)
    T_IDENT => Shift(yy_state_13)
    NT_basic_type_expr => Shift(yy_state_17)
    T_LPAREN => Shift(yy_state_18)
    NT_type_expr => Shift(yy_state_24)
    NT_postfix_type_expr => Shift(yy_state_25)
    _ => Error
  }
}

// [39, type_expr → LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr •, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
fn yy_state_24(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(7, NT_type_expr, yy_action_11)
}

// [35, type_expr → postfix_type_expr •, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [41, postfix_type_expr → postfix_type_expr • QUESTION, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_25(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_QUESTION => Shift(yy_state_26)
    T_RANGLE | T_RBRACKET | T_RPAREN | T_COMMA | T_COLON => Reduce(1, NT_type_expr, yy_action_56)
    _ => Error
  }
}

// [41, postfix_type_expr → postfix_type_expr QUESTION •, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_26(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_postfix_type_expr, yy_action_68)
}

// [38, type_expr → LPAREN type_expr COMMA RPAREN • ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
fn yy_state_27(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_ARROW => Shift(yy_state_28)
    _ => Error
  }
}

// [35, type_expr → • postfix_type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [38, type_expr → LPAREN type_expr COMMA RPAREN ARROW • type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [40, postfix_type_expr → • basic_type_expr, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [42, basic_type_expr → • IDENT, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [43, basic_type_expr → • PKG_AND_IDENT, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_28(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_9)
    T_IDENT => Shift(yy_state_13)
    NT_basic_type_expr => Shift(yy_state_17)
    T_LPAREN => Shift(yy_state_18)
    NT_postfix_type_expr => Shift(yy_state_25)
    NT_type_expr => Shift(yy_state_29)
    _ => Error
  }
}

// [38, type_expr → LPAREN type_expr COMMA RPAREN ARROW type_expr •, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
fn yy_state_29(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_type_expr, yy_action_38)
}

// [37, type_expr → LPAREN type_expr RPAREN • ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [47, basic_type_expr → LPAREN type_expr RPAREN •, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_30(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_ARROW => Shift(yy_state_31)
    T_RANGLE | T_RBRACKET | T_RPAREN | T_COMMA | T_QUESTION | T_COLON => Reduce(3, NT_basic_type_expr, yy_action_21)
    _ => Error
  }
}

// [35, type_expr → • postfix_type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [37, type_expr → LPAREN type_expr RPAREN ARROW • type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [40, postfix_type_expr → • basic_type_expr, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [42, basic_type_expr → • IDENT, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [43, basic_type_expr → • PKG_AND_IDENT, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_31(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_9)
    T_IDENT => Shift(yy_state_13)
    NT_basic_type_expr => Shift(yy_state_17)
    T_LPAREN => Shift(yy_state_18)
    NT_postfix_type_expr => Shift(yy_state_25)
    NT_type_expr => Shift(yy_state_32)
    _ => Error
  }
}

// [37, type_expr → LPAREN type_expr RPAREN ARROW type_expr •, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
fn yy_state_32(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_type_expr, yy_action_47)
}

// [36, type_expr → LPAREN RPAREN • ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
fn yy_state_33(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_ARROW => Shift(yy_state_34)
    _ => Error
  }
}

// [35, type_expr → • postfix_type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [36, type_expr → LPAREN RPAREN ARROW • type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
// [40, postfix_type_expr → • basic_type_expr, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [42, basic_type_expr → • IDENT, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [43, basic_type_expr → • PKG_AND_IDENT, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RANGLE / RBRACKET / RPAREN / COMMA / QUESTION / COLON]
fn yy_state_34(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_9)
    T_IDENT => Shift(yy_state_13)
    NT_basic_type_expr => Shift(yy_state_17)
    T_LPAREN => Shift(yy_state_18)
    NT_postfix_type_expr => Shift(yy_state_25)
    NT_type_expr => Shift(yy_state_35)
    _ => Error
  }
}

// [36, type_expr → LPAREN RPAREN ARROW type_expr •, RANGLE / RBRACKET / RPAREN / COMMA / COLON]
fn yy_state_35(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_type_expr, yy_action_8)
}

// [18, decl → PERCENT_DERIVE LANGLE nonempty_type_expr_list • RANGLE IDENT, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_36(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RANGLE => Shift(yy_state_37)
    _ => Error
  }
}

// [18, decl → PERCENT_DERIVE LANGLE nonempty_type_expr_list RANGLE • IDENT, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_37(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_38)
    _ => Error
  }
}

// [18, decl → PERCENT_DERIVE LANGLE nonempty_type_expr_list RANGLE IDENT •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_38(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_decl, yy_action_2)
}

// [17, decl → PERCENT_NONASSOC • nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [66, nonempty_symbol_list → • symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [67, nonempty_symbol_list → • symbol nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [68, symbol → • IDENT, IDENT / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_39(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_40)
    NT_symbol => Shift(yy_state_41)
    NT_nonempty_symbol_list => Shift(yy_state_43)
    _ => Error
  }
}

// [68, symbol → IDENT •, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_PREC / PERCENT_DERIVE / LBRACKET / LPAREN / RPAREN / COMMA / ARROW / COLON / BAR / SEMI]
fn yy_state_40(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_symbol, yy_action_6)
}

// [66, nonempty_symbol_list → • symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [66, nonempty_symbol_list → symbol •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [67, nonempty_symbol_list → • symbol nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [67, nonempty_symbol_list → symbol • nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [68, symbol → • IDENT, IDENT / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_41(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_40)
    NT_symbol => Shift(yy_state_41)
    NT_nonempty_symbol_list => Shift(yy_state_42)
    T_PERCENT_PERCENT | T_PERCENT_START | T_PERCENT_TOKEN | T_PERCENT_TYPE | T_PERCENT_POSITION | T_PERCENT_LEFT | T_PERCENT_RIGHT | T_PERCENT_NONASSOC | T_PERCENT_DERIVE => Reduce(1, NT_nonempty_symbol_list, yy_action_24)
    _ => Error
  }
}

// [67, nonempty_symbol_list → symbol nonempty_symbol_list •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_42(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_nonempty_symbol_list, yy_action_9)
}

// [17, decl → PERCENT_NONASSOC nonempty_symbol_list •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_43(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_decl, yy_action_40)
}

// [16, decl → PERCENT_RIGHT • nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [66, nonempty_symbol_list → • symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [67, nonempty_symbol_list → • symbol nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [68, symbol → • IDENT, IDENT / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_44(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_40)
    NT_symbol => Shift(yy_state_41)
    NT_nonempty_symbol_list => Shift(yy_state_45)
    _ => Error
  }
}

// [16, decl → PERCENT_RIGHT nonempty_symbol_list •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_45(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_decl, yy_action_42)
}

// [15, decl → PERCENT_LEFT • nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [66, nonempty_symbol_list → • symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [67, nonempty_symbol_list → • symbol nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [68, symbol → • IDENT, IDENT / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_46(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_40)
    NT_symbol => Shift(yy_state_41)
    NT_nonempty_symbol_list => Shift(yy_state_47)
    _ => Error
  }
}

// [15, decl → PERCENT_LEFT nonempty_symbol_list •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_47(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_decl, yy_action_22)
}

// [14, decl → PERCENT_POSITION • LANGLE type_expr RANGLE, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_48(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LANGLE => Shift(yy_state_49)
    _ => Error
  }
}

// [14, decl → PERCENT_POSITION LANGLE • type_expr RANGLE, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [35, type_expr → • postfix_type_expr, RANGLE]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RANGLE]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RANGLE]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RANGLE]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RANGLE]
// [40, postfix_type_expr → • basic_type_expr, RANGLE / QUESTION]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RANGLE / QUESTION]
// [42, basic_type_expr → • IDENT, RANGLE / QUESTION]
// [43, basic_type_expr → • PKG_AND_IDENT, RANGLE / QUESTION]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / QUESTION]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / QUESTION]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RANGLE / QUESTION]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RANGLE / QUESTION]
fn yy_state_49(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_9)
    T_IDENT => Shift(yy_state_13)
    NT_basic_type_expr => Shift(yy_state_17)
    T_LPAREN => Shift(yy_state_18)
    NT_postfix_type_expr => Shift(yy_state_25)
    NT_type_expr => Shift(yy_state_50)
    _ => Error
  }
}

// [14, decl → PERCENT_POSITION LANGLE type_expr • RANGLE, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_50(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RANGLE => Shift(yy_state_51)
    _ => Error
  }
}

// [14, decl → PERCENT_POSITION LANGLE type_expr RANGLE •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_51(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_decl, yy_action_50)
}

// [13, decl → PERCENT_TYPE • LANGLE type_expr RANGLE nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_52(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LANGLE => Shift(yy_state_53)
    _ => Error
  }
}

// [13, decl → PERCENT_TYPE LANGLE • type_expr RANGLE nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [35, type_expr → • postfix_type_expr, RANGLE]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RANGLE]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RANGLE]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RANGLE]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RANGLE]
// [40, postfix_type_expr → • basic_type_expr, RANGLE / QUESTION]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RANGLE / QUESTION]
// [42, basic_type_expr → • IDENT, RANGLE / QUESTION]
// [43, basic_type_expr → • PKG_AND_IDENT, RANGLE / QUESTION]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / QUESTION]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / QUESTION]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RANGLE / QUESTION]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RANGLE / QUESTION]
fn yy_state_53(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_9)
    T_IDENT => Shift(yy_state_13)
    NT_basic_type_expr => Shift(yy_state_17)
    T_LPAREN => Shift(yy_state_18)
    NT_postfix_type_expr => Shift(yy_state_25)
    NT_type_expr => Shift(yy_state_54)
    _ => Error
  }
}

// [13, decl → PERCENT_TYPE LANGLE type_expr • RANGLE nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_54(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RANGLE => Shift(yy_state_55)
    _ => Error
  }
}

// [13, decl → PERCENT_TYPE LANGLE type_expr RANGLE • nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [66, nonempty_symbol_list → • symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [67, nonempty_symbol_list → • symbol nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [68, symbol → • IDENT, IDENT / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_55(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_40)
    NT_symbol => Shift(yy_state_41)
    NT_nonempty_symbol_list => Shift(yy_state_56)
    _ => Error
  }
}

// [13, decl → PERCENT_TYPE LANGLE type_expr RANGLE nonempty_symbol_list •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_56(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_decl, yy_action_46)
}

// [9, decl → PERCENT_TOKEN • nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [10, decl → PERCENT_TOKEN • LANGLE type_expr RANGLE nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [11, decl → PERCENT_TOKEN • symbol STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [12, decl → PERCENT_TOKEN • LANGLE type_expr RANGLE symbol STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [66, nonempty_symbol_list → • symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [67, nonempty_symbol_list → • symbol nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [68, symbol → • IDENT, IDENT / STRING / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_57(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_40)
    NT_symbol => Shift(yy_state_58)
    T_LANGLE => Shift(yy_state_60)
    NT_nonempty_symbol_list => Shift(yy_state_66)
    _ => Error
  }
}

// [11, decl → PERCENT_TOKEN symbol • STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [66, nonempty_symbol_list → • symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [66, nonempty_symbol_list → symbol •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [67, nonempty_symbol_list → • symbol nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [67, nonempty_symbol_list → symbol • nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [68, symbol → • IDENT, IDENT / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_58(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_40)
    NT_symbol => Shift(yy_state_41)
    NT_nonempty_symbol_list => Shift(yy_state_42)
    T_STRING => Shift(yy_state_59)
    T_PERCENT_PERCENT | T_PERCENT_START | T_PERCENT_TOKEN | T_PERCENT_TYPE | T_PERCENT_POSITION | T_PERCENT_LEFT | T_PERCENT_RIGHT | T_PERCENT_NONASSOC | T_PERCENT_DERIVE => Reduce(1, NT_nonempty_symbol_list, yy_action_24)
    _ => Error
  }
}

// [11, decl → PERCENT_TOKEN symbol STRING •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_59(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_decl, yy_action_67)
}

// [10, decl → PERCENT_TOKEN LANGLE • type_expr RANGLE nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [12, decl → PERCENT_TOKEN LANGLE • type_expr RANGLE symbol STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [35, type_expr → • postfix_type_expr, RANGLE]
// [36, type_expr → • LPAREN RPAREN ARROW type_expr, RANGLE]
// [37, type_expr → • LPAREN type_expr RPAREN ARROW type_expr, RANGLE]
// [38, type_expr → • LPAREN type_expr COMMA RPAREN ARROW type_expr, RANGLE]
// [39, type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN ARROW type_expr, RANGLE]
// [40, postfix_type_expr → • basic_type_expr, RANGLE / QUESTION]
// [41, postfix_type_expr → • postfix_type_expr QUESTION, RANGLE / QUESTION]
// [42, basic_type_expr → • IDENT, RANGLE / QUESTION]
// [43, basic_type_expr → • PKG_AND_IDENT, RANGLE / QUESTION]
// [44, basic_type_expr → • IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / QUESTION]
// [45, basic_type_expr → • PKG_AND_IDENT LBRACKET nonempty_type_expr_list RBRACKET, RANGLE / QUESTION]
// [46, basic_type_expr → • LPAREN type_expr COMMA nonempty_type_expr_list RPAREN, RANGLE / QUESTION]
// [47, basic_type_expr → • LPAREN type_expr RPAREN, RANGLE / QUESTION]
fn yy_state_60(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_9)
    T_IDENT => Shift(yy_state_13)
    NT_basic_type_expr => Shift(yy_state_17)
    T_LPAREN => Shift(yy_state_18)
    NT_postfix_type_expr => Shift(yy_state_25)
    NT_type_expr => Shift(yy_state_61)
    _ => Error
  }
}

// [10, decl → PERCENT_TOKEN LANGLE type_expr • RANGLE nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [12, decl → PERCENT_TOKEN LANGLE type_expr • RANGLE symbol STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_61(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RANGLE => Shift(yy_state_62)
    _ => Error
  }
}

// [10, decl → PERCENT_TOKEN LANGLE type_expr RANGLE • nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [12, decl → PERCENT_TOKEN LANGLE type_expr RANGLE • symbol STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [66, nonempty_symbol_list → • symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [67, nonempty_symbol_list → • symbol nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [68, symbol → • IDENT, IDENT / STRING / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_62(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_40)
    NT_symbol => Shift(yy_state_63)
    NT_nonempty_symbol_list => Shift(yy_state_65)
    _ => Error
  }
}

// [12, decl → PERCENT_TOKEN LANGLE type_expr RANGLE symbol • STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [66, nonempty_symbol_list → • symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [66, nonempty_symbol_list → symbol •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [67, nonempty_symbol_list → • symbol nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [67, nonempty_symbol_list → symbol • nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [68, symbol → • IDENT, IDENT / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_63(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_40)
    NT_symbol => Shift(yy_state_41)
    NT_nonempty_symbol_list => Shift(yy_state_42)
    T_STRING => Shift(yy_state_64)
    T_PERCENT_PERCENT | T_PERCENT_START | T_PERCENT_TOKEN | T_PERCENT_TYPE | T_PERCENT_POSITION | T_PERCENT_LEFT | T_PERCENT_RIGHT | T_PERCENT_NONASSOC | T_PERCENT_DERIVE => Reduce(1, NT_nonempty_symbol_list, yy_action_24)
    _ => Error
  }
}

// [12, decl → PERCENT_TOKEN LANGLE type_expr RANGLE symbol STRING •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_64(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_decl, yy_action_60)
}

// [10, decl → PERCENT_TOKEN LANGLE type_expr RANGLE nonempty_symbol_list •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_65(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_decl, yy_action_1)
}

// [9, decl → PERCENT_TOKEN nonempty_symbol_list •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_66(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_decl, yy_action_12)
}

// [8, decl → PERCENT_START • nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [66, nonempty_symbol_list → • symbol, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [67, nonempty_symbol_list → • symbol nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [68, symbol → • IDENT, IDENT / PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_67(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_40)
    NT_symbol => Shift(yy_state_41)
    NT_nonempty_symbol_list => Shift(yy_state_68)
    _ => Error
  }
}

// [8, decl → PERCENT_START nonempty_symbol_list •, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_68(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_decl, yy_action_53)
}

// [6, decl_list → • decl decl_list, PERCENT_PERCENT]
// [6, decl_list → decl • decl_list, PERCENT_PERCENT]
// [7, decl_list → •, PERCENT_PERCENT]
// [8, decl → • PERCENT_START nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [9, decl → • PERCENT_TOKEN nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [10, decl → • PERCENT_TOKEN LANGLE type_expr RANGLE nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [11, decl → • PERCENT_TOKEN symbol STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [12, decl → • PERCENT_TOKEN LANGLE type_expr RANGLE symbol STRING, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [13, decl → • PERCENT_TYPE LANGLE type_expr RANGLE nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [14, decl → • PERCENT_POSITION LANGLE type_expr RANGLE, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [15, decl → • PERCENT_LEFT nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [16, decl → • PERCENT_RIGHT nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [17, decl → • PERCENT_NONASSOC nonempty_symbol_list, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
// [18, decl → • PERCENT_DERIVE LANGLE nonempty_type_expr_list RANGLE IDENT, PERCENT_PERCENT / PERCENT_START / PERCENT_TOKEN / PERCENT_TYPE / PERCENT_POSITION / PERCENT_LEFT / PERCENT_RIGHT / PERCENT_NONASSOC / PERCENT_DERIVE]
fn yy_state_69(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PERCENT_DERIVE => Shift(yy_state_4)
    T_PERCENT_NONASSOC => Shift(yy_state_39)
    T_PERCENT_RIGHT => Shift(yy_state_44)
    T_PERCENT_LEFT => Shift(yy_state_46)
    T_PERCENT_POSITION => Shift(yy_state_48)
    T_PERCENT_TYPE => Shift(yy_state_52)
    T_PERCENT_TOKEN => Shift(yy_state_57)
    T_PERCENT_START => Shift(yy_state_67)
    NT_decl => Shift(yy_state_69)
    NT_decl_list => Shift(yy_state_70)
    T_PERCENT_PERCENT => Reduce(0, NT_decl_list, yy_action_51)
    _ => Error
  }
}

// [6, decl_list → decl decl_list •, PERCENT_PERCENT]
fn yy_state_70(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_decl_list, yy_action_0)
}

// [0, spec → header decl_list • PERCENT_PERCENT rule_list trailer EOF, $]
fn yy_state_71(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PERCENT_PERCENT => Shift(yy_state_72)
    _ => Error
  }
}

// [0, spec → header decl_list PERCENT_PERCENT • rule_list trailer EOF, $]
// [19, rule_list → • rule, EOF / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF]
// [20, rule_list → • rule rule_list, EOF / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF]
// [21, rule → • rule_no_modifiers, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [22, rule → • PERCENT_INLINE rule_no_modifiers, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [23, rule_no_modifiers → • symbol opt_rule_return_type COLON clause_list SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [24, rule_no_modifiers → • symbol opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type COLON clause_list SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [68, symbol → • IDENT, LBRACKET / LPAREN / ARROW / COLON]
fn yy_state_72(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_40)
    NT_symbol => Shift(yy_state_73)
    T_PERCENT_INLINE => Shift(yy_state_124)
    NT_rule_no_modifiers => Shift(yy_state_126)
    NT_rule => Shift(yy_state_127)
    NT_rule_list => Shift(yy_state_129)
    _ => Error
  }
}

// [23, rule_no_modifiers → symbol • opt_rule_return_type COLON clause_list SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [24, rule_no_modifiers → symbol • opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type COLON clause_list SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [25, opt_rule_return_type → • ARROW type_expr, COLON]
// [26, opt_rule_return_type → •, COLON]
// [31, opt_rule_generic_params → •, LPAREN]
// [32, opt_rule_generic_params → • LBRACKET nonempty_comma_ident_list RBRACKET, LPAREN]
fn yy_state_73(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACKET => Shift(yy_state_74)
    T_ARROW => Shift(yy_state_80)
    NT_opt_rule_generic_params => Shift(yy_state_82)
    NT_opt_rule_return_type => Shift(yy_state_120)
    T_COLON => Reduce(0, NT_opt_rule_return_type, yy_action_64)
    T_LPAREN => Reduce(0, NT_opt_rule_generic_params, yy_action_54)
    _ => Error
  }
}

// [32, opt_rule_generic_params → LBRACKET • nonempty_comma_ident_list RBRACKET, LPAREN]
// [33, nonempty_comma_ident_list → • IDENT, RBRACKET]
// [34, nonempty_comma_ident_list → • IDENT COMMA nonempty_comma_ident_list, RBRACKET]
fn yy_state_74(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_75)
    NT_nonempty_comma_ident_list => Shift(yy_state_78)
    _ => Error
  }
}

// [33, nonempty_comma_ident_list → IDENT •, RBRACKET]
// [34, nonempty_comma_ident_list → IDENT • COMMA nonempty_comma_ident_list, RBRACKET]
fn yy_state_75(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_76)
    T_RBRACKET => Reduce(1, NT_nonempty_comma_ident_list, yy_action_61)
    _ => Error
  }
}

// [33, nonempty_comma_ident_list → • IDENT, RBRACKET]
// [34, nonempty_comma_ident_list → • IDENT COMMA nonempty_comma_ident_list, RBRACKET]
// [34, nonempty_comma_ident_list → IDENT COMMA • nonempty_comma_ident_list, RBRACKET]
fn yy_state_76(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_75)
    NT_nonempty_comma_ident_list => Shift(yy_state_77)
    _ => Error
  }
}

// [34, nonempty_comma_ident_list → IDENT COMMA nonempty_comma_ident_list •, RBRACKET]
fn yy_state_77(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_nonempty_comma_ident_list, yy_action_34)
}

// [32, opt_rule_generic_params → LBRACKET nonempty_comma_ident_list • RBRACKET, LPAREN]
fn yy_state_78(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RBRACKET => Shift(yy_state_79)
    _ => Error
  }
}

// [32, opt_rule_generic_params → LBRACKET nonempty_comma_ident_list RBRACKET •, LPAREN]
fn yy_state_79(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_opt_rule_generic_params, yy_action_66)
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
fn yy_state_80(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_9)
    T_IDENT => Shift(yy_state_13)
    NT_basic_type_expr => Shift(yy_state_17)
    T_LPAREN => Shift(yy_state_18)
    NT_postfix_type_expr => Shift(yy_state_25)
    NT_type_expr => Shift(yy_state_81)
    _ => Error
  }
}

// [25, opt_rule_return_type → ARROW type_expr •, COLON]
fn yy_state_81(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_opt_rule_return_type, yy_action_35)
}

// [24, rule_no_modifiers → symbol opt_rule_generic_params • LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type COLON clause_list SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_82(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LPAREN => Shift(yy_state_83)
    _ => Error
  }
}

// [24, rule_no_modifiers → symbol opt_rule_generic_params LPAREN • nonempty_rule_param_list RPAREN opt_rule_return_type COLON clause_list SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [27, nonempty_rule_param_list → • IDENT, RPAREN]
// [28, nonempty_rule_param_list → • IDENT COLON type_expr, RPAREN]
// [29, nonempty_rule_param_list → • IDENT COMMA nonempty_rule_param_list, RPAREN]
// [30, nonempty_rule_param_list → • IDENT COLON type_expr COMMA nonempty_rule_param_list, RPAREN]
fn yy_state_83(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_84)
    NT_nonempty_rule_param_list => Shift(yy_state_91)
    _ => Error
  }
}

// [27, nonempty_rule_param_list → IDENT •, RPAREN]
// [28, nonempty_rule_param_list → IDENT • COLON type_expr, RPAREN]
// [29, nonempty_rule_param_list → IDENT • COMMA nonempty_rule_param_list, RPAREN]
// [30, nonempty_rule_param_list → IDENT • COLON type_expr COMMA nonempty_rule_param_list, RPAREN]
fn yy_state_84(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_85)
    T_COLON => Shift(yy_state_87)
    T_RPAREN => Reduce(1, NT_nonempty_rule_param_list, yy_action_36)
    _ => Error
  }
}

// [27, nonempty_rule_param_list → • IDENT, RPAREN]
// [28, nonempty_rule_param_list → • IDENT COLON type_expr, RPAREN]
// [29, nonempty_rule_param_list → • IDENT COMMA nonempty_rule_param_list, RPAREN]
// [29, nonempty_rule_param_list → IDENT COMMA • nonempty_rule_param_list, RPAREN]
// [30, nonempty_rule_param_list → • IDENT COLON type_expr COMMA nonempty_rule_param_list, RPAREN]
fn yy_state_85(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_84)
    NT_nonempty_rule_param_list => Shift(yy_state_86)
    _ => Error
  }
}

// [29, nonempty_rule_param_list → IDENT COMMA nonempty_rule_param_list •, RPAREN]
fn yy_state_86(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_nonempty_rule_param_list, yy_action_63)
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
fn yy_state_87(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PKG_AND_IDENT => Shift(yy_state_9)
    T_IDENT => Shift(yy_state_13)
    NT_basic_type_expr => Shift(yy_state_17)
    T_LPAREN => Shift(yy_state_18)
    NT_postfix_type_expr => Shift(yy_state_25)
    NT_type_expr => Shift(yy_state_88)
    _ => Error
  }
}

// [28, nonempty_rule_param_list → IDENT COLON type_expr •, RPAREN]
// [30, nonempty_rule_param_list → IDENT COLON type_expr • COMMA nonempty_rule_param_list, RPAREN]
fn yy_state_88(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_89)
    T_RPAREN => Reduce(3, NT_nonempty_rule_param_list, yy_action_65)
    _ => Error
  }
}

// [27, nonempty_rule_param_list → • IDENT, RPAREN]
// [28, nonempty_rule_param_list → • IDENT COLON type_expr, RPAREN]
// [29, nonempty_rule_param_list → • IDENT COMMA nonempty_rule_param_list, RPAREN]
// [30, nonempty_rule_param_list → • IDENT COLON type_expr COMMA nonempty_rule_param_list, RPAREN]
// [30, nonempty_rule_param_list → IDENT COLON type_expr COMMA • nonempty_rule_param_list, RPAREN]
fn yy_state_89(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_84)
    NT_nonempty_rule_param_list => Shift(yy_state_90)
    _ => Error
  }
}

// [30, nonempty_rule_param_list → IDENT COLON type_expr COMMA nonempty_rule_param_list •, RPAREN]
fn yy_state_90(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_nonempty_rule_param_list, yy_action_30)
}

// [24, rule_no_modifiers → symbol opt_rule_generic_params LPAREN nonempty_rule_param_list • RPAREN opt_rule_return_type COLON clause_list SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_91(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_92)
    _ => Error
  }
}

// [24, rule_no_modifiers → symbol opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN • opt_rule_return_type COLON clause_list SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [25, opt_rule_return_type → • ARROW type_expr, COLON]
// [26, opt_rule_return_type → •, COLON]
fn yy_state_92(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_ARROW => Shift(yy_state_80)
    NT_opt_rule_return_type => Shift(yy_state_93)
    T_COLON => Reduce(0, NT_opt_rule_return_type, yy_action_64)
    _ => Error
  }
}

// [24, rule_no_modifiers → symbol opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type • COLON clause_list SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_93(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_94)
    _ => Error
  }
}

// [24, rule_no_modifiers → symbol opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type COLON • clause_list SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [50, clause_list → • clause, SEMI]
// [51, clause_list → • clause BAR clause_list, SEMI]
// [52, clause → • item_list rule_prec clause_action, BAR / SEMI]
// [57, item_list → • item item_list, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [58, item_list → •, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [59, item → • term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [60, item → • IDENT EQ term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [61, term → • symbol, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [62, term → • symbol LPAREN nonempty_comma_term_list RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [63, term → • STRING, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [68, symbol → • IDENT, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / LPAREN / BAR / SEMI]
fn yy_state_94(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_STRING => Shift(yy_state_95)
    NT_symbol => Shift(yy_state_96)
    T_IDENT => Shift(yy_state_103)
    NT_term => Shift(yy_state_106)
    NT_item => Shift(yy_state_107)
    NT_item_list => Shift(yy_state_109)
    NT_clause => Shift(yy_state_115)
    NT_clause_list => Shift(yy_state_118)
    T_LBRACE_CODE_RBRACE | T_PERCENT_PREC | T_BAR | T_SEMI => Reduce(0, NT_item_list, yy_action_14)
    _ => Error
  }
}

// [63, term → STRING •, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / RPAREN / COMMA / BAR / SEMI]
fn yy_state_95(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_term, yy_action_37)
}

// [61, term → symbol •, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / RPAREN / COMMA / BAR / SEMI]
// [62, term → symbol • LPAREN nonempty_comma_term_list RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / RPAREN / COMMA / BAR / SEMI]
fn yy_state_96(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LPAREN => Shift(yy_state_97)
    T_IDENT | T_STRING | T_LBRACE_CODE_RBRACE | T_PERCENT_PREC | T_RPAREN | T_COMMA | T_BAR | T_SEMI => Reduce(1, NT_term, yy_action_45)
    _ => Error
  }
}

// [61, term → • symbol, RPAREN / COMMA]
// [62, term → • symbol LPAREN nonempty_comma_term_list RPAREN, RPAREN / COMMA]
// [62, term → symbol LPAREN • nonempty_comma_term_list RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / RPAREN / COMMA / BAR / SEMI]
// [63, term → • STRING, RPAREN / COMMA]
// [64, nonempty_comma_term_list → • term, RPAREN]
// [65, nonempty_comma_term_list → • term COMMA nonempty_comma_term_list, RPAREN]
// [68, symbol → • IDENT, LPAREN / RPAREN / COMMA]
fn yy_state_97(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_40)
    T_STRING => Shift(yy_state_95)
    NT_symbol => Shift(yy_state_96)
    NT_term => Shift(yy_state_98)
    NT_nonempty_comma_term_list => Shift(yy_state_101)
    _ => Error
  }
}

// [64, nonempty_comma_term_list → term •, RPAREN]
// [65, nonempty_comma_term_list → term • COMMA nonempty_comma_term_list, RPAREN]
fn yy_state_98(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COMMA => Shift(yy_state_99)
    T_RPAREN => Reduce(1, NT_nonempty_comma_term_list, yy_action_15)
    _ => Error
  }
}

// [61, term → • symbol, RPAREN / COMMA]
// [62, term → • symbol LPAREN nonempty_comma_term_list RPAREN, RPAREN / COMMA]
// [63, term → • STRING, RPAREN / COMMA]
// [64, nonempty_comma_term_list → • term, RPAREN]
// [65, nonempty_comma_term_list → • term COMMA nonempty_comma_term_list, RPAREN]
// [65, nonempty_comma_term_list → term COMMA • nonempty_comma_term_list, RPAREN]
// [68, symbol → • IDENT, LPAREN / RPAREN / COMMA]
fn yy_state_99(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_40)
    T_STRING => Shift(yy_state_95)
    NT_symbol => Shift(yy_state_96)
    NT_term => Shift(yy_state_98)
    NT_nonempty_comma_term_list => Shift(yy_state_100)
    _ => Error
  }
}

// [65, nonempty_comma_term_list → term COMMA nonempty_comma_term_list •, RPAREN]
fn yy_state_100(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_nonempty_comma_term_list, yy_action_41)
}

// [62, term → symbol LPAREN nonempty_comma_term_list • RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / RPAREN / COMMA / BAR / SEMI]
fn yy_state_101(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_RPAREN => Shift(yy_state_102)
    _ => Error
  }
}

// [62, term → symbol LPAREN nonempty_comma_term_list RPAREN •, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / RPAREN / COMMA / BAR / SEMI]
fn yy_state_102(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(4, NT_term, yy_action_4)
}

// [60, item → IDENT • EQ term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [68, symbol → IDENT •, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / LPAREN / BAR / SEMI]
fn yy_state_103(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_EQ => Shift(yy_state_104)
    T_IDENT | T_STRING | T_LBRACE_CODE_RBRACE | T_PERCENT_PREC | T_LPAREN | T_BAR | T_SEMI => Reduce(1, NT_symbol, yy_action_6)
    _ => Error
  }
}

// [60, item → IDENT EQ • term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [61, term → • symbol, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [62, term → • symbol LPAREN nonempty_comma_term_list RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [63, term → • STRING, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [68, symbol → • IDENT, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / LPAREN / BAR / SEMI]
fn yy_state_104(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_40)
    T_STRING => Shift(yy_state_95)
    NT_symbol => Shift(yy_state_96)
    NT_term => Shift(yy_state_105)
    _ => Error
  }
}

// [60, item → IDENT EQ term •, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
fn yy_state_105(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_item, yy_action_5)
}

// [59, item → term •, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
fn yy_state_106(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_item, yy_action_52)
}

// [57, item_list → • item item_list, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [57, item_list → item • item_list, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [58, item_list → •, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [59, item → • term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [60, item → • IDENT EQ term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [61, term → • symbol, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [62, term → • symbol LPAREN nonempty_comma_term_list RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [63, term → • STRING, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [68, symbol → • IDENT, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / LPAREN / BAR / SEMI]
fn yy_state_107(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_STRING => Shift(yy_state_95)
    NT_symbol => Shift(yy_state_96)
    T_IDENT => Shift(yy_state_103)
    NT_term => Shift(yy_state_106)
    NT_item => Shift(yy_state_107)
    NT_item_list => Shift(yy_state_108)
    T_LBRACE_CODE_RBRACE | T_PERCENT_PREC | T_BAR | T_SEMI => Reduce(0, NT_item_list, yy_action_14)
    _ => Error
  }
}

// [57, item_list → item item_list •, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
fn yy_state_108(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_item_list, yy_action_25)
}

// [52, clause → item_list • rule_prec clause_action, BAR / SEMI]
// [55, rule_prec → • PERCENT_PREC symbol, LBRACE_CODE_RBRACE / BAR / SEMI]
// [56, rule_prec → •, LBRACE_CODE_RBRACE / BAR / SEMI]
fn yy_state_109(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PERCENT_PREC => Shift(yy_state_110)
    NT_rule_prec => Shift(yy_state_112)
    T_LBRACE_CODE_RBRACE | T_BAR | T_SEMI => Reduce(0, NT_rule_prec, yy_action_26)
    _ => Error
  }
}

// [55, rule_prec → PERCENT_PREC • symbol, LBRACE_CODE_RBRACE / BAR / SEMI]
// [68, symbol → • IDENT, LBRACE_CODE_RBRACE / BAR / SEMI]
fn yy_state_110(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_40)
    NT_symbol => Shift(yy_state_111)
    _ => Error
  }
}

// [55, rule_prec → PERCENT_PREC symbol •, LBRACE_CODE_RBRACE / BAR / SEMI]
fn yy_state_111(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_rule_prec, yy_action_16)
}

// [52, clause → item_list rule_prec • clause_action, BAR / SEMI]
// [53, clause_action → • LBRACE_CODE_RBRACE, BAR / SEMI]
// [54, clause_action → •, BAR / SEMI]
fn yy_state_112(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_LBRACE_CODE_RBRACE => Shift(yy_state_113)
    NT_clause_action => Shift(yy_state_114)
    T_BAR | T_SEMI => Reduce(0, NT_clause_action, yy_action_33)
    _ => Error
  }
}

// [53, clause_action → LBRACE_CODE_RBRACE •, BAR / SEMI]
fn yy_state_113(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_clause_action, yy_action_57)
}

// [52, clause → item_list rule_prec clause_action •, BAR / SEMI]
fn yy_state_114(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_clause, yy_action_58)
}

// [50, clause_list → clause •, SEMI]
// [51, clause_list → clause • BAR clause_list, SEMI]
fn yy_state_115(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_BAR => Shift(yy_state_116)
    T_SEMI => Reduce(1, NT_clause_list, yy_action_27)
    _ => Error
  }
}

// [50, clause_list → • clause, SEMI]
// [51, clause_list → • clause BAR clause_list, SEMI]
// [51, clause_list → clause BAR • clause_list, SEMI]
// [52, clause → • item_list rule_prec clause_action, BAR / SEMI]
// [57, item_list → • item item_list, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [58, item_list → •, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [59, item → • term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [60, item → • IDENT EQ term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [61, term → • symbol, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [62, term → • symbol LPAREN nonempty_comma_term_list RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [63, term → • STRING, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [68, symbol → • IDENT, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / LPAREN / BAR / SEMI]
fn yy_state_116(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_STRING => Shift(yy_state_95)
    NT_symbol => Shift(yy_state_96)
    T_IDENT => Shift(yy_state_103)
    NT_term => Shift(yy_state_106)
    NT_item => Shift(yy_state_107)
    NT_item_list => Shift(yy_state_109)
    NT_clause => Shift(yy_state_115)
    NT_clause_list => Shift(yy_state_117)
    T_LBRACE_CODE_RBRACE | T_PERCENT_PREC | T_BAR | T_SEMI => Reduce(0, NT_item_list, yy_action_14)
    _ => Error
  }
}

// [51, clause_list → clause BAR clause_list •, SEMI]
fn yy_state_117(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(3, NT_clause_list, yy_action_32)
}

// [24, rule_no_modifiers → symbol opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type COLON clause_list • SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_118(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_SEMI => Shift(yy_state_119)
    _ => Error
  }
}

// [24, rule_no_modifiers → symbol opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type COLON clause_list SEMI •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_119(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(9, NT_rule_no_modifiers, yy_action_10)
}

// [23, rule_no_modifiers → symbol opt_rule_return_type • COLON clause_list SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_120(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_COLON => Shift(yy_state_121)
    _ => Error
  }
}

// [23, rule_no_modifiers → symbol opt_rule_return_type COLON • clause_list SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [50, clause_list → • clause, SEMI]
// [51, clause_list → • clause BAR clause_list, SEMI]
// [52, clause → • item_list rule_prec clause_action, BAR / SEMI]
// [57, item_list → • item item_list, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [58, item_list → •, LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [59, item → • term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [60, item → • IDENT EQ term, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [61, term → • symbol, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [62, term → • symbol LPAREN nonempty_comma_term_list RPAREN, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [63, term → • STRING, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / BAR / SEMI]
// [68, symbol → • IDENT, IDENT / STRING / LBRACE_CODE_RBRACE / PERCENT_PREC / LPAREN / BAR / SEMI]
fn yy_state_121(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_STRING => Shift(yy_state_95)
    NT_symbol => Shift(yy_state_96)
    T_IDENT => Shift(yy_state_103)
    NT_term => Shift(yy_state_106)
    NT_item => Shift(yy_state_107)
    NT_item_list => Shift(yy_state_109)
    NT_clause => Shift(yy_state_115)
    NT_clause_list => Shift(yy_state_122)
    T_LBRACE_CODE_RBRACE | T_PERCENT_PREC | T_BAR | T_SEMI => Reduce(0, NT_item_list, yy_action_14)
    _ => Error
  }
}

// [23, rule_no_modifiers → symbol opt_rule_return_type COLON clause_list • SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_122(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_SEMI => Shift(yy_state_123)
    _ => Error
  }
}

// [23, rule_no_modifiers → symbol opt_rule_return_type COLON clause_list SEMI •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_123(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(5, NT_rule_no_modifiers, yy_action_19)
}

// [22, rule → PERCENT_INLINE • rule_no_modifiers, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [23, rule_no_modifiers → • symbol opt_rule_return_type COLON clause_list SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [24, rule_no_modifiers → • symbol opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type COLON clause_list SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [68, symbol → • IDENT, LBRACKET / LPAREN / ARROW / COLON]
fn yy_state_124(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_40)
    NT_symbol => Shift(yy_state_73)
    NT_rule_no_modifiers => Shift(yy_state_125)
    _ => Error
  }
}

// [22, rule → PERCENT_INLINE rule_no_modifiers •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_125(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_rule, yy_action_28)
}

// [21, rule → rule_no_modifiers •, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
fn yy_state_126(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_rule, yy_action_20)
}

// [19, rule_list → • rule, EOF / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF]
// [19, rule_list → rule •, EOF / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF]
// [20, rule_list → • rule rule_list, EOF / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF]
// [20, rule_list → rule • rule_list, EOF / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF]
// [21, rule → • rule_no_modifiers, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [22, rule → • PERCENT_INLINE rule_no_modifiers, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [23, rule_no_modifiers → • symbol opt_rule_return_type COLON clause_list SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [24, rule_no_modifiers → • symbol opt_rule_generic_params LPAREN nonempty_rule_param_list RPAREN opt_rule_return_type COLON clause_list SEMI, EOF / IDENT / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF / PERCENT_INLINE]
// [68, symbol → • IDENT, LBRACKET / LPAREN / ARROW / COLON]
fn yy_state_127(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_IDENT => Shift(yy_state_40)
    NT_symbol => Shift(yy_state_73)
    T_PERCENT_INLINE => Shift(yy_state_124)
    NT_rule_no_modifiers => Shift(yy_state_126)
    NT_rule => Shift(yy_state_127)
    NT_rule_list => Shift(yy_state_128)
    T_EOF | T_PERCENT_LBRACE_CODE_PERCENT_RBRACE | T_PERCENT_PERCENT_CODE_EOF => Reduce(1, NT_rule_list, yy_action_7)
    _ => Error
  }
}

// [20, rule_list → rule rule_list •, EOF / PERCENT_LBRACE_CODE_PERCENT_RBRACE / PERCENT_PERCENT_CODE_EOF]
fn yy_state_128(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(2, NT_rule_list, yy_action_55)
}

// [0, spec → header decl_list PERCENT_PERCENT rule_list • trailer EOF, $]
// [3, trailer → • PERCENT_LBRACE_CODE_PERCENT_RBRACE, EOF]
// [4, trailer → • PERCENT_PERCENT_CODE_EOF, EOF]
// [5, trailer → •, EOF]
fn yy_state_129(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_PERCENT_PERCENT_CODE_EOF => Shift(yy_state_130)
    T_PERCENT_LBRACE_CODE_PERCENT_RBRACE => Shift(yy_state_131)
    NT_trailer => Shift(yy_state_132)
    T_EOF => Reduce(0, NT_trailer, yy_action_17)
    _ => Error
  }
}

// [4, trailer → PERCENT_PERCENT_CODE_EOF •, EOF]
fn yy_state_130(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_trailer, yy_action_39)
}

// [3, trailer → PERCENT_LBRACE_CODE_PERCENT_RBRACE •, EOF]
fn yy_state_131(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(1, NT_trailer, yy_action_49)
}

// [0, spec → header decl_list PERCENT_PERCENT rule_list trailer • EOF, $]
fn yy_state_132(_lookahead : YYSymbol) -> YYDecision {
  match _lookahead {
    T_EOF => Shift(yy_state_133)
    _ => Error
  }
}

// [0, spec → header decl_list PERCENT_PERCENT rule_list trailer EOF •, $]
fn yy_state_133(_lookahead : YYSymbol) -> YYDecision {
  ReduceNoLookahead(6, NT_spec, yy_action_44)
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
  for term in ([(T_EOF, TK_EOF), (T_IDENT, TK_IDENT), (T_STRING, TK_STRING), (T_LBRACE_CODE_RBRACE, TK_LBRACE_CODE_RBRACE), (T_PERCENT_LBRACE_CODE_PERCENT_RBRACE, TK_PERCENT_LBRACE_CODE_PERCENT_RBRACE), (T_PERCENT_PERCENT_CODE_EOF, TK_PERCENT_PERCENT_CODE_EOF), (T_PKG_AND_IDENT, TK_PKG_AND_IDENT), (T_PERCENT_PERCENT, TK_PERCENT_PERCENT), (T_PERCENT_START, TK_PERCENT_START), (T_PERCENT_TOKEN, TK_PERCENT_TOKEN), (T_PERCENT_TYPE, TK_PERCENT_TYPE), (T_PERCENT_POSITION, TK_PERCENT_POSITION), (T_PERCENT_LEFT, TK_PERCENT_LEFT), (T_PERCENT_RIGHT, TK_PERCENT_RIGHT), (T_PERCENT_NONASSOC, TK_PERCENT_NONASSOC), (T_PERCENT_PREC, TK_PERCENT_PREC), (T_PERCENT_DERIVE, TK_PERCENT_DERIVE), (T_PERCENT_INLINE, TK_PERCENT_INLINE), (T_LANGLE, TK_LANGLE), (T_RANGLE, TK_RANGLE), (T_LBRACKET, TK_LBRACKET), (T_RBRACKET, TK_RBRACKET), (T_LPAREN, TK_LPAREN), (T_RPAREN, TK_RPAREN), (T_COMMA, TK_COMMA), (T_ARROW, TK_ARROW), (T_QUESTION, TK_QUESTION), (T_COLON, TK_COLON), (T_BAR, TK_BAR), (T_EQ, TK_EQ), (T_SEMI, TK_SEMI)] : Array[(YYSymbol, TokenKind)]) {
    try_add(term.0, term.1)
  }
  raise UnexpectedToken(token, loc, expected)
}

pub fn spec(read_token : () -> (Token, Position, Position), start_pos : Position) -> ParserSpec!ParseError {
  yy_parse!(
    read_token,
    start_pos,
    yy_state_0,
    fn {
      YYObj_ParserSpec(result) => result
      _ => panic()
    },
  )
}
