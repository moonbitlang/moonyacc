// Copyright (C) 2025 International Digital Economy Academy
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; version 2.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, see <https://www.gnu.org/licenses/>.

///|
test "lexer" {
  let lexer = @parser.new_lexer(parser_spec_src)
  fn token() {
    try {
      lexer.next_token!()
    } catch {
      _ => panic()
    }
  }

  let buf = StringBuilder::new()
  while true {
    let (tok, _, _) = token()
    buf.write_object(tok)
    buf.write_string("\n")
    match tok {
      EOF => break
      _ => ()
    }
  }
  inspect!(
    buf.to_string(),
    content=
      #|PERCENT_POSITION
      #|LANGLE
      #|IDENT("Int")
      #|RANGLE
      #|PERCENT_DERIVE
      #|LANGLE
      #|IDENT("Show")
      #|RANGLE
      #|IDENT("Token")
      #|PERCENT_START
      #|IDENT("spec")
      #|PERCENT_TOKEN
      #|IDENT("EOF")
      #|PERCENT_TOKEN
      #|LANGLE
      #|IDENT("String")
      #|RANGLE
      #|IDENT("IDENT")
      #|PERCENT_TOKEN
      #|LANGLE
      #|IDENT("String")
      #|RANGLE
      #|IDENT("STRING")
      #|PERCENT_TOKEN
      #|LANGLE
      #|LPAREN
      #|IDENT("String")
      #|COMMA
      #|IDENT("Int")
      #|COMMA
      #|IDENT("Array")
      #|LBRACKET
      #|IDENT("SubstItem")
      #|RBRACKET
      #|RPAREN
      #|RANGLE
      #|IDENT("LBRACE_CODE_RBRACE")
      #|PERCENT_TOKEN
      #|LANGLE
      #|LPAREN
      #|IDENT("String")
      #|COMMA
      #|IDENT("Int")
      #|COMMA
      #|IDENT("Int")
      #|RPAREN
      #|RANGLE
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|PERCENT_TOKEN
      #|LANGLE
      #|LPAREN
      #|IDENT("String")
      #|COMMA
      #|IDENT("Int")
      #|COMMA
      #|IDENT("Int")
      #|RPAREN
      #|RANGLE
      #|IDENT("PERCENT_PERCENT_CODE_EOF")
      #|PERCENT_TOKEN
      #|LANGLE
      #|LPAREN
      #|IDENT("String")
      #|COMMA
      #|IDENT("String")
      #|RPAREN
      #|RANGLE
      #|IDENT("PKG_AND_IDENT")
      #|PERCENT_TOKEN
      #|IDENT("PERCENT_PERCENT")
      #|STRING("\"%%\"")
      #|PERCENT_TOKEN
      #|IDENT("PERCENT_START")
      #|STRING("\"%start\"")
      #|PERCENT_TOKEN
      #|IDENT("PERCENT_TOKEN")
      #|STRING("\"%token\"")
      #|PERCENT_TOKEN
      #|IDENT("PERCENT_TYPE")
      #|STRING("\"%type\"")
      #|PERCENT_TOKEN
      #|IDENT("PERCENT_POSITION")
      #|STRING("\"%position\"")
      #|PERCENT_TOKEN
      #|IDENT("PERCENT_LEFT")
      #|STRING("\"%left\"")
      #|PERCENT_TOKEN
      #|IDENT("PERCENT_RIGHT")
      #|STRING("\"%right\"")
      #|PERCENT_TOKEN
      #|IDENT("PERCENT_NONASSOC")
      #|STRING("\"%nonassoc\"")
      #|PERCENT_TOKEN
      #|IDENT("PERCENT_PREC")
      #|STRING("\"%prec\"")
      #|PERCENT_TOKEN
      #|IDENT("PERCENT_DERIVE")
      #|STRING("\"%derive\"")
      #|PERCENT_TOKEN
      #|IDENT("PERCENT_INLINE")
      #|STRING("\"%inline\"")
      #|PERCENT_TOKEN
      #|IDENT("LANGLE")
      #|STRING("\"<\"")
      #|PERCENT_TOKEN
      #|IDENT("RANGLE")
      #|STRING("\">\"")
      #|PERCENT_TOKEN
      #|IDENT("LBRACKET")
      #|STRING("\"[\"")
      #|PERCENT_TOKEN
      #|IDENT("RBRACKET")
      #|STRING("\"]\"")
      #|PERCENT_TOKEN
      #|IDENT("LPAREN")
      #|STRING("\"(\"")
      #|PERCENT_TOKEN
      #|IDENT("RPAREN")
      #|STRING("\")\"")
      #|PERCENT_TOKEN
      #|IDENT("COMMA")
      #|STRING("\",\"")
      #|PERCENT_TOKEN
      #|IDENT("ARROW")
      #|STRING("\"->\"")
      #|PERCENT_TOKEN
      #|IDENT("QUESTION")
      #|STRING("\"?\"")
      #|PERCENT_TOKEN
      #|IDENT("COLON")
      #|STRING("\":\"")
      #|PERCENT_TOKEN
      #|IDENT("BAR")
      #|STRING("\"|\"")
      #|PERCENT_TOKEN
      #|IDENT("EQ")
      #|STRING("\"=\"")
      #|PERCENT_TOKEN
      #|IDENT("SEMI")
      #|STRING("\";\"")
      #|PERCENT_PERCENT
      #|IDENT("spec")
      #|ARROW
      #|IDENT("ParserSpec")
      #|COLON
      #|IDENT("header")
      #|EQ
      #|IDENT("header")
      #|IDENT("decl_list")
      #|EQ
      #|IDENT("decl_list")
      #|STRING("\"%%\"")
      #|IDENT("rule_list")
      #|EQ
      #|IDENT("rule_list")
      #|IDENT("trailer")
      #|EQ
      #|IDENT("trailer")
      #|IDENT("EOF")
      #|LBRACE_CODE_RBRACE((" { header, decls: decl_list.to_array(), rules: rule_list.to_array(), trailer } ", 989, []))
      #|SEMI
      #|IDENT("header")
      #|ARROW
      #|LPAREN
      #|IDENT("Code")
      #|COMMA
      #|IDENT("Int")
      #|COMMA
      #|IDENT("Int")
      #|RPAREN
      #|QUESTION
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1148, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 1167, []))
      #|SEMI
      #|IDENT("trailer")
      #|ARROW
      #|LPAREN
      #|IDENT("Code")
      #|COMMA
      #|IDENT("Int")
      #|COMMA
      #|IDENT("Int")
      #|RPAREN
      #|QUESTION
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1254, []))
      #|BAR
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_PERCENT_CODE_EOF")
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1303, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 1322, []))
      #|SEMI
      #|IDENT("decl_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|IDENT("Declaration")
      #|RBRACKET
      #|COLON
      #|IDENT("decl")
      #|EQ
      #|IDENT("decl")
      #|IDENT("decl_list")
      #|EQ
      #|IDENT("decl_list")
      #|LBRACE_CODE_RBRACE((" Cons(decl, decl_list) ", 1410, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", 1440, []))
      #|SEMI
      #|IDENT("decl")
      #|ARROW
      #|IDENT("Declaration")
      #|COLON
      #|STRING("\"%start\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Start(symbol_list.to_array()) ", 1519, []))
      #|BAR
      #|STRING("\"%token\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Token(symbol_list.to_array(), type_=None) ", 1599, []))
      #|BAR
      #|STRING("\"%token\"")
      #|STRING("\"<\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("type_expr")
      #|STRING("\">\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Token(symbol_list.to_array(), type_=Some(type_)) ", 1715, []))
      #|BAR
      #|STRING("\"%token\"")
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Token1(symbol, type_=None, image=image) ", 1808, []))
      #|BAR
      #|STRING("\"%token\"")
      #|STRING("\"<\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("type_expr")
      #|STRING("\">\"")
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Token1(symbol, type_=Some(type_), image=image) ", 1916, []))
      #|BAR
      #|STRING("\"%type\"")
      #|STRING("\"<\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("type_expr")
      #|STRING("\">\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Type(symbol_list.to_array(), type_=type_) ", 2036, []))
      #|BAR
      #|STRING("\"%position\"")
      #|STRING("\"<\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("type_expr")
      #|STRING("\">\"")
      #|LBRACE_CODE_RBRACE((" Position(type_=type_) ", 2122, []))
      #|BAR
      #|STRING("\"%left\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Left(symbol_list.to_array()) ", 2193, []))
      #|BAR
      #|STRING("\"%right\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Right(symbol_list.to_array()) ", 2272, []))
      #|BAR
      #|STRING("\"%nonassoc\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Nonassoc(symbol_list.to_array()) ", 2355, []))
      #|BAR
      #|STRING("\"%derive\"")
      #|STRING("\"<\"")
      #|IDENT("trait_list")
      #|EQ
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\">\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Derive(traits=trait_list.to_array(), type_=type_) ", 2461, []))
      #|SEMI
      #|IDENT("rule_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|IDENT("Rule")
      #|RBRACKET
      #|COLON
      #|IDENT("rule")
      #|EQ
      #|IDENT("rule")
      #|LBRACE_CODE_RBRACE((" Cons(rule, Nil) ", 2567, []))
      #|BAR
      #|IDENT("rule")
      #|EQ
      #|IDENT("rule")
      #|IDENT("rule_list")
      #|EQ
      #|IDENT("rule_list")
      #|LBRACE_CODE_RBRACE((" Cons(rule, rule_list) ", 2621, []))
      #|SEMI
      #|IDENT("rule")
      #|ARROW
      #|IDENT("Rule")
      #|COLON
      #|IDENT("rule_no_modifiers")
      #|LBRACE_CODE_RBRACE((" $1 ", 2687, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|STRING("\"%inline\"")
      #|IDENT("rule_no_modifiers")
      #|LBRACE_CODE_RBRACE((" { ..$2, inline: true } ", 2726, [{start: 5, end: 7, desc: Dollar(2)}]))
      #|SEMI
      #|IDENT("rule_no_modifiers")
      #|ARROW
      #|IDENT("Rule")
      #|COLON
      #|IDENT("nonterminal")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("type_")
      #|EQ
      #|IDENT("opt_rule_return_type")
      #|STRING("\":\"")
      #|IDENT("clause_list")
      #|EQ
      #|IDENT("clause_list")
      #|STRING("\";\"")
      #|LBRACE_CODE_RBRACE(("\n    { inline: false, nonterminal, generic_params: [], params: [], type_, clauses: clause_list.to_array() }\n  ", 2866, []))
      #|BAR
      #|IDENT("nonterminal")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("generic_params")
      #|EQ
      #|IDENT("opt_rule_generic_params")
      #|STRING("\"(\"")
      #|IDENT("param_list")
      #|EQ
      #|IDENT("nonempty_rule_param_list")
      #|STRING("\")\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("opt_rule_return_type")
      #|STRING("\":\"")
      #|IDENT("clause_list")
      #|EQ
      #|IDENT("clause_list")
      #|STRING("\";\"")
      #|LBRACE_CODE_RBRACE(("\n    { inline: false, nonterminal, generic_params, params: param_list.to_array(),  type_, clauses: clause_list.to_array() }\n  ", 3144, []))
      #|SEMI
      #|IDENT("opt_rule_return_type")
      #|ARROW
      #|IDENT("TypeExpr")
      #|QUESTION
      #|COLON
      #|STRING("\"->\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Some(type_) ", 3337, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 3357, []))
      #|SEMI
      #|IDENT("nonempty_rule_param_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|LPAREN
      #|IDENT("String")
      #|COMMA
      #|IDENT("TypeExpr")
      #|QUESTION
      #|RPAREN
      #|RBRACKET
      #|COLON
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Cons(($1, None), Nil) ", 3444, [{start: 7, end: 9, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\":\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Cons(($1, Some($3)), Nil) ", 3494, [{start: 7, end: 9, desc: Dollar(1)}, {start: 16, end: 18, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\",\"")
      #|IDENT("nonempty_rule_param_list")
      #|LBRACE_CODE_RBRACE((" Cons(($1, None), $3) ", 3563, [{start: 7, end: 9, desc: Dollar(1)}, {start: 18, end: 20, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\":\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("nonempty_rule_param_list")
      #|LBRACE_CODE_RBRACE((" Cons(($1, Some($3)), $5) ", 3641, [{start: 7, end: 9, desc: Dollar(1)}, {start: 16, end: 18, desc: Dollar(3)}, {start: 22, end: 24, desc: Dollar(5)}]))
      #|SEMI
      #|IDENT("opt_rule_generic_params")
      #|ARROW
      #|IDENT("Array")
      #|LBRACKET
      #|IDENT("String")
      #|RBRACKET
      #|COLON
      #|LBRACE_CODE_RBRACE((" [] ", 3720, []))
      #|BAR
      #|STRING("\"[\"")
      #|IDENT("nonempty_comma_ident_list")
      #|STRING("\"]\"")
      #|LBRACE_CODE_RBRACE((" $2.to_array() ", 3765, [{start: 1, end: 3, desc: Dollar(2)}]))
      #|SEMI
      #|IDENT("nonempty_comma_ident_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|IDENT("String")
      #|RBRACKET
      #|COLON
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Cons($1, Nil) ", 3849, [{start: 6, end: 8, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\",\"")
      #|IDENT("nonempty_comma_ident_list")
      #|LBRACE_CODE_RBRACE((" Cons($1, $3) ", 3907, [{start: 6, end: 8, desc: Dollar(1)}, {start: 10, end: 12, desc: Dollar(3)}]))
      #|SEMI
      #|IDENT("type_expr")
      #|ARROW
      #|IDENT("TypeExpr")
      #|COLON
      #|IDENT("postfix_type_expr")
      #|LBRACE_CODE_RBRACE((" $1 ", 3973, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|STRING("\"(\"")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow([], $4) ", 4007, [{start: 11, end: 13, desc: Dollar(4)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow([$2], $5) ", 4062, [{start: 8, end: 10, desc: Dollar(2)}, {start: 13, end: 15, desc: Dollar(5)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow([$2], $6) ", 4123, [{start: 8, end: 10, desc: Dollar(2)}, {start: 13, end: 15, desc: Dollar(6)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow(@immut/list.Cons($2, $4).to_array(), $7) ", 4208, [{start: 24, end: 26, desc: Dollar(2)}, {start: 28, end: 30, desc: Dollar(4)}, {start: 44, end: 46, desc: Dollar(7)}]))
      #|SEMI
      #|IDENT("postfix_type_expr")
      #|ARROW
      #|IDENT("TypeExpr")
      #|COLON
      #|IDENT("basic_type_expr")
      #|LBRACE_CODE_RBRACE((" $1 ", 4314, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("postfix_type_expr")
      #|STRING("\"?\"")
      #|LBRACE_CODE_RBRACE((" Option($1) ", 4347, [{start: 8, end: 10, desc: Dollar(1)}]))
      #|SEMI
      #|IDENT("basic_type_expr")
      #|ARROW
      #|IDENT("TypeExpr")
      #|COLON
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=None, $1, []) ", 4405, [{start: 18, end: 20, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("PKG_AND_IDENT")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=Some($1.0), $1.1, []) ", 4452, [{start: 17, end: 19, desc: Dollar(1)}, {start: 24, end: 26, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\"[\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\"]\"")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=None, $1, $3.to_array()) ", 4531, [{start: 18, end: 20, desc: Dollar(1)}, {start: 22, end: 24, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("PKG_AND_IDENT")
      #|STRING("\"[\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\"]\"")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=Some($1.0), $1.1, $3.to_array()) ", 4621, [{start: 17, end: 19, desc: Dollar(1)}, {start: 24, end: 26, desc: Dollar(1)}, {start: 30, end: 32, desc: Dollar(3)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\")\"")
      #|LBRACE_CODE_RBRACE((" Tuple(@immut/list.Cons($2, $4).to_array()) ", 4719, [{start: 24, end: 26, desc: Dollar(2)}, {start: 28, end: 30, desc: Dollar(4)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\")\"")
      #|LBRACE_CODE_RBRACE((" $2 ", 4788, [{start: 1, end: 3, desc: Dollar(2)}]))
      #|SEMI
      #|IDENT("nonempty_type_expr_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|IDENT("TypeExpr")
      #|RBRACKET
      #|COLON
      #|IDENT("type_expr")
      #|EQ
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Cons(type_expr, Nil) ", 4875, []))
      #|BAR
      #|IDENT("type_expr")
      #|EQ
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("type_expr_list")
      #|EQ
      #|IDENT("nonempty_type_expr_list")
      #|LBRACE_CODE_RBRACE((" Cons(type_expr, type_expr_list) ", 4967, []))
      #|SEMI
      #|IDENT("clause_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|IDENT("Clause")
      #|RBRACKET
      #|COLON
      #|IDENT("clause")
      #|EQ
      #|IDENT("clause")
      #|LBRACE_CODE_RBRACE((" Cons(clause, Nil) ", 5063, []))
      #|BAR
      #|IDENT("clause")
      #|EQ
      #|IDENT("clause")
      #|STRING("\"|\"")
      #|IDENT("clause_list")
      #|EQ
      #|IDENT("clause_list")
      #|LBRACE_CODE_RBRACE((" Cons(clause, clause_list) ", 5131, []))
      #|SEMI
      #|IDENT("clause")
      #|ARROW
      #|IDENT("Clause")
      #|COLON
      #|IDENT("item_list")
      #|EQ
      #|IDENT("item_list")
      #|IDENT("prec")
      #|EQ
      #|IDENT("rule_prec")
      #|IDENT("action")
      #|EQ
      #|IDENT("clause_action")
      #|LBRACE_CODE_RBRACE((" { items: item_list.to_array(), prec, action } ", 5243, []))
      #|SEMI
      #|IDENT("clause_action")
      #|ARROW
      #|IDENT("ClauseAction")
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("LBRACE_CODE_RBRACE")
      #|LBRACE_CODE_RBRACE(("\n      let (code, utf8_pos, subst) = code\n      { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\n  ", 5356, [{start: 96, end: 105, desc: StartPos}, {start: 112, end: 119, desc: EndPos}]))
      #|BAR
      #|LBRACE_CODE_RBRACE((" { code: None, start: $startpos, end: $endpos } ", 5487, [{start: 22, end: 31, desc: StartPos}, {start: 38, end: 45, desc: EndPos}]))
      #|SEMI
      #|IDENT("rule_prec")
      #|ARROW
      #|IDENT("Symbol")
      #|QUESTION
      #|COLON
      #|STRING("\"%prec\"")
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Some(symbol) ", 5590, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 5611, []))
      #|SEMI
      #|IDENT("item_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|IDENT("ClauseItem")
      #|RBRACKET
      #|COLON
      #|IDENT("item")
      #|EQ
      #|IDENT("item")
      #|IDENT("item_list")
      #|EQ
      #|IDENT("item_list")
      #|LBRACE_CODE_RBRACE((" Cons(item, item_list) ", 5698, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", 5728, []))
      #|SEMI
      #|IDENT("item")
      #|ARROW
      #|IDENT("ClauseItem")
      #|COLON
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|LBRACE_CODE_RBRACE((" { binder: None, term: term } ", 5774, []))
      #|BAR
      #|IDENT("binder")
      #|EQ
      #|IDENT("IDENT")
      #|STRING("\"=\"")
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|LBRACE_CODE_RBRACE((" { binder: Some(binder), term: term } ", 5838, []))
      #|SEMI
      #|IDENT("term")
      #|ARROW
      #|IDENT("Term")
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Symbol(symbol, loc=($startpos, $endpos)) ", 5915, [{start: 21, end: 30, desc: StartPos}, {start: 32, end: 39, desc: EndPos}]))
      #|BAR
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|STRING("\"(\"")
      #|IDENT("nonempty_comma_term_list")
      #|STRING("\")\"")
      #|LBRACE_CODE_RBRACE((" RuleCall(symbol, symbol_loc=($startpos(symbol), $endpos(symbol)), $3.to_array()) ", 6011, [{start: 30, end: 47, desc: StartPosOf(Name("symbol"))}, {start: 49, end: 64, desc: EndPosOf(Name("symbol"))}, {start: 67, end: 69, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Image(image, loc=($startpos, $endpos)) ", 6113, [{start: 19, end: 28, desc: StartPos}, {start: 30, end: 37, desc: EndPos}]))
      #|SEMI
      #|IDENT("nonempty_comma_term_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|IDENT("Term")
      #|RBRACKET
      #|COLON
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|LBRACE_CODE_RBRACE((" Cons(term, Nil) ", 6223, []))
      #|BAR
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|STRING("\",\"")
      #|IDENT("term_list")
      #|EQ
      #|IDENT("nonempty_comma_term_list")
      #|LBRACE_CODE_RBRACE((" Cons(term, term_list) ", 6296, []))
      #|SEMI
      #|IDENT("nonempty_symbol_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|IDENT("Symbol")
      #|RBRACKET
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Cons(symbol, Nil) ", 6391, []))
      #|BAR
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Cons(symbol, symbol_list) ", 6464, []))
      #|SEMI
      #|IDENT("symbol")
      #|ARROW
      #|IDENT("Symbol")
      #|COLON
      #|IDENT("ident")
      #|EQ
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" ident ", 6532, []))
      #|SEMI
      #|EOF
      #|
    ,
  )
}

///|
test "parser" {
  let lexer = @parser.new_lexer(parser_spec_src)
  fn token() {
    lexer.next_token?().unwrap()
  }

  let spec = @parser.spec!(token, 0)
  @json.inspect!(spec, content={
    "decls": [
      {
        "$tag": "Position",
        "type_": { "$tag": "Constr", "pkg": Null, "0": "Int", "1": [] },
      },
      {
        "$tag": "Derive",
        "traits": [{ "$tag": "Constr", "pkg": Null, "0": "Show", "1": [] }],
        "type_": "Token",
      },
      { "$tag": "Start", "0": ["spec"] },
      { "$tag": "Token", "0": ["EOF"], "type_": Null },
      {
        "$tag": "Token",
        "0": ["IDENT"],
        "type_": { "$tag": "Constr", "pkg": Null, "0": "String", "1": [] },
      },
      {
        "$tag": "Token",
        "0": ["STRING"],
        "type_": { "$tag": "Constr", "pkg": Null, "0": "String", "1": [] },
      },
      {
        "$tag": "Token",
        "0": ["LBRACE_CODE_RBRACE"],
        "type_": {
          "$tag": "Tuple",
          "0": [
            { "$tag": "Constr", "pkg": Null, "0": "String", "1": [] },
            { "$tag": "Constr", "pkg": Null, "0": "Int", "1": [] },
            {
              "$tag": "Constr",
              "pkg": Null,
              "0": "Array",
              "1": [
                { "$tag": "Constr", "pkg": Null, "0": "SubstItem", "1": [] },
              ],
            },
          ],
        },
      },
      {
        "$tag": "Token",
        "0": ["PERCENT_LBRACE_CODE_PERCENT_RBRACE"],
        "type_": {
          "$tag": "Tuple",
          "0": [
            { "$tag": "Constr", "pkg": Null, "0": "String", "1": [] },
            { "$tag": "Constr", "pkg": Null, "0": "Int", "1": [] },
            { "$tag": "Constr", "pkg": Null, "0": "Int", "1": [] },
          ],
        },
      },
      {
        "$tag": "Token",
        "0": ["PERCENT_PERCENT_CODE_EOF"],
        "type_": {
          "$tag": "Tuple",
          "0": [
            { "$tag": "Constr", "pkg": Null, "0": "String", "1": [] },
            { "$tag": "Constr", "pkg": Null, "0": "Int", "1": [] },
            { "$tag": "Constr", "pkg": Null, "0": "Int", "1": [] },
          ],
        },
      },
      {
        "$tag": "Token",
        "0": ["PKG_AND_IDENT"],
        "type_": {
          "$tag": "Tuple",
          "0": [
            { "$tag": "Constr", "pkg": Null, "0": "String", "1": [] },
            { "$tag": "Constr", "pkg": Null, "0": "String", "1": [] },
          ],
        },
      },
      {
        "$tag": "Token1",
        "0": "PERCENT_PERCENT",
        "type_": Null,
        "image": "\"%%\"",
      },
      {
        "$tag": "Token1",
        "0": "PERCENT_START",
        "type_": Null,
        "image": "\"%start\"",
      },
      {
        "$tag": "Token1",
        "0": "PERCENT_TOKEN",
        "type_": Null,
        "image": "\"%token\"",
      },
      {
        "$tag": "Token1",
        "0": "PERCENT_TYPE",
        "type_": Null,
        "image": "\"%type\"",
      },
      {
        "$tag": "Token1",
        "0": "PERCENT_POSITION",
        "type_": Null,
        "image": "\"%position\"",
      },
      {
        "$tag": "Token1",
        "0": "PERCENT_LEFT",
        "type_": Null,
        "image": "\"%left\"",
      },
      {
        "$tag": "Token1",
        "0": "PERCENT_RIGHT",
        "type_": Null,
        "image": "\"%right\"",
      },
      {
        "$tag": "Token1",
        "0": "PERCENT_NONASSOC",
        "type_": Null,
        "image": "\"%nonassoc\"",
      },
      {
        "$tag": "Token1",
        "0": "PERCENT_PREC",
        "type_": Null,
        "image": "\"%prec\"",
      },
      {
        "$tag": "Token1",
        "0": "PERCENT_DERIVE",
        "type_": Null,
        "image": "\"%derive\"",
      },
      {
        "$tag": "Token1",
        "0": "PERCENT_INLINE",
        "type_": Null,
        "image": "\"%inline\"",
      },
      { "$tag": "Token1", "0": "LANGLE", "type_": Null, "image": "\"<\"" },
      { "$tag": "Token1", "0": "RANGLE", "type_": Null, "image": "\">\"" },
      { "$tag": "Token1", "0": "LBRACKET", "type_": Null, "image": "\"[\"" },
      { "$tag": "Token1", "0": "RBRACKET", "type_": Null, "image": "\"]\"" },
      { "$tag": "Token1", "0": "LPAREN", "type_": Null, "image": "\"(\"" },
      { "$tag": "Token1", "0": "RPAREN", "type_": Null, "image": "\")\"" },
      { "$tag": "Token1", "0": "COMMA", "type_": Null, "image": "\",\"" },
      { "$tag": "Token1", "0": "ARROW", "type_": Null, "image": "\"->\"" },
      { "$tag": "Token1", "0": "QUESTION", "type_": Null, "image": "\"?\"" },
      { "$tag": "Token1", "0": "COLON", "type_": Null, "image": "\":\"" },
      { "$tag": "Token1", "0": "BAR", "type_": Null, "image": "\"|\"" },
      { "$tag": "Token1", "0": "EQ", "type_": Null, "image": "\"=\"" },
      { "$tag": "Token1", "0": "SEMI", "type_": Null, "image": "\";\"" },
    ],
    "rules": [
      {
        "inline": false,
        "nonterminal": "spec",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": Null, "0": "ParserSpec", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "header",
                "term": { "$tag": "Symbol", "0": "header", "loc": [916, 922] },
              },
              {
                "binder": "decl_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "decl_list",
                  "loc": [933, 942],
                },
              },
              { "term": { "$tag": "Image", "0": "\"%%\"", "loc": [943, 947] } },
              {
                "binder": "rule_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_list",
                  "loc": [958, 967],
                },
              },
              {
                "binder": "trailer",
                "term": { "$tag": "Symbol", "0": "trailer", "loc": [976, 983] },
              },
              { "term": { "$tag": "Symbol", "0": "EOF", "loc": [984, 987] } },
            ],
            "action": {
              "code": {
                "code": " { header, decls: decl_list.to_array(), rules: rule_list.to_array(), trailer } ",
                "utf8_pos": 989,
                "subst": [],
              },
              "start": 988,
              "end": 1069,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "header",
        "generic_params": [],
        "params": [],
        "type_": {
          "$tag": "Option",
          "0": {
            "$tag": "Tuple",
            "0": [
              { "$tag": "Constr", "pkg": Null, "0": "Code", "1": [] },
              { "$tag": "Constr", "pkg": Null, "0": "Int", "1": [] },
              { "$tag": "Constr", "pkg": Null, "0": "Int", "1": [] },
            ],
          },
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "code",
                "term": {
                  "$tag": "Symbol",
                  "0": "PERCENT_LBRACE_CODE_PERCENT_RBRACE",
                  "loc": [1112, 1146],
                },
              },
            ],
            "action": {
              "code": { "code": " Some(code) ", "utf8_pos": 1148, "subst": [] },
              "start": 1147,
              "end": 1161,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 1167, "subst": [] },
              "start": 1166,
              "end": 1174,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "trailer",
        "generic_params": [],
        "params": [],
        "type_": {
          "$tag": "Option",
          "0": {
            "$tag": "Tuple",
            "0": [
              { "$tag": "Constr", "pkg": Null, "0": "Code", "1": [] },
              { "$tag": "Constr", "pkg": Null, "0": "Int", "1": [] },
              { "$tag": "Constr", "pkg": Null, "0": "Int", "1": [] },
            ],
          },
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "code",
                "term": {
                  "$tag": "Symbol",
                  "0": "PERCENT_LBRACE_CODE_PERCENT_RBRACE",
                  "loc": [1218, 1252],
                },
              },
            ],
            "action": {
              "code": { "code": " Some(code) ", "utf8_pos": 1254, "subst": [] },
              "start": 1253,
              "end": 1267,
            },
          },
          {
            "items": [
              {
                "binder": "code",
                "term": {
                  "$tag": "Symbol",
                  "0": "PERCENT_PERCENT_CODE_EOF",
                  "loc": [1277, 1301],
                },
              },
            ],
            "action": {
              "code": { "code": " Some(code) ", "utf8_pos": 1303, "subst": [] },
              "start": 1302,
              "end": 1316,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 1322, "subst": [] },
              "start": 1321,
              "end": 1329,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "decl_list",
        "generic_params": [],
        "params": [],
        "type_": {
          "$tag": "Constr",
          "pkg": "immut/list",
          "0": "T",
          "1": [{ "$tag": "Constr", "pkg": Null, "0": "Declaration", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "decl",
                "term": { "$tag": "Symbol", "0": "decl", "loc": [1384, 1388] },
              },
              {
                "binder": "decl_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "decl_list",
                  "loc": [1399, 1408],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(decl, decl_list) ",
                "utf8_pos": 1410,
                "subst": [],
              },
              "start": 1409,
              "end": 1434,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "utf8_pos": 1440, "subst": [] },
              "start": 1439,
              "end": 1446,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "decl",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": Null, "0": "Declaration", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%start\"",
                  "loc": [1476, 1484],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [1497, 1517],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Start(symbol_list.to_array()) ",
                "utf8_pos": 1519,
                "subst": [],
              },
              "start": 1518,
              "end": 1551,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1556, 1564],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [1577, 1597],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Token(symbol_list.to_array(), type_=None) ",
                "utf8_pos": 1599,
                "subst": [],
              },
              "start": 1598,
              "end": 1643,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1648, 1656],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [1657, 1660] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [1667, 1676],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [1677, 1680] } },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [1693, 1713],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Token(symbol_list.to_array(), type_=Some(type_)) ",
                "utf8_pos": 1715,
                "subst": [],
              },
              "start": 1714,
              "end": 1766,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1771, 1779],
                },
              },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [1787, 1793] },
              },
              {
                "binder": "image",
                "term": { "$tag": "Symbol", "0": "STRING", "loc": [1800, 1806] },
              },
            ],
            "action": {
              "code": {
                "code": " Token1(symbol, type_=None, image=image) ",
                "utf8_pos": 1808,
                "subst": [],
              },
              "start": 1807,
              "end": 1850,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1855, 1863],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [1864, 1867] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [1874, 1883],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [1884, 1887] } },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [1895, 1901] },
              },
              {
                "binder": "image",
                "term": { "$tag": "Symbol", "0": "STRING", "loc": [1908, 1914] },
              },
            ],
            "action": {
              "code": {
                "code": " Token1(symbol, type_=Some(type_), image=image) ",
                "utf8_pos": 1916,
                "subst": [],
              },
              "start": 1915,
              "end": 1965,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%type\"",
                  "loc": [1970, 1977],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [1978, 1981] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [1988, 1997],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [1998, 2001] } },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2014, 2034],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Type(symbol_list.to_array(), type_=type_) ",
                "utf8_pos": 2036,
                "subst": [],
              },
              "start": 2035,
              "end": 2080,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%position\"",
                  "loc": [2085, 2096],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [2097, 2100] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [2107, 2116],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [2117, 2120] } },
            ],
            "action": {
              "code": {
                "code": " Position(type_=type_) ",
                "utf8_pos": 2122,
                "subst": [],
              },
              "start": 2121,
              "end": 2146,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%left\"",
                  "loc": [2151, 2158],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2171, 2191],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Left(symbol_list.to_array()) ",
                "utf8_pos": 2193,
                "subst": [],
              },
              "start": 2192,
              "end": 2224,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%right\"",
                  "loc": [2229, 2237],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2250, 2270],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Right(symbol_list.to_array()) ",
                "utf8_pos": 2272,
                "subst": [],
              },
              "start": 2271,
              "end": 2304,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%nonassoc\"",
                  "loc": [2309, 2320],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2333, 2353],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Nonassoc(symbol_list.to_array()) ",
                "utf8_pos": 2355,
                "subst": [],
              },
              "start": 2354,
              "end": 2390,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%derive\"",
                  "loc": [2395, 2404],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [2405, 2408] } },
              {
                "binder": "trait_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [2420, 2443],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [2444, 2447] } },
              {
                "binder": "type_",
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [2454, 2459] },
              },
            ],
            "action": {
              "code": {
                "code": " Derive(traits=trait_list.to_array(), type_=type_) ",
                "utf8_pos": 2461,
                "subst": [],
              },
              "start": 2460,
              "end": 2513,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "rule_list",
        "generic_params": [],
        "params": [],
        "type_": {
          "$tag": "Constr",
          "pkg": "immut/list",
          "0": "T",
          "1": [{ "$tag": "Constr", "pkg": Null, "0": "Rule", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "rule",
                "term": { "$tag": "Symbol", "0": "rule", "loc": [2561, 2565] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(rule, Nil) ",
                "utf8_pos": 2567,
                "subst": [],
              },
              "start": 2566,
              "end": 2585,
            },
          },
          {
            "items": [
              {
                "binder": "rule",
                "term": { "$tag": "Symbol", "0": "rule", "loc": [2595, 2599] },
              },
              {
                "binder": "rule_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_list",
                  "loc": [2610, 2619],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(rule, rule_list) ",
                "utf8_pos": 2621,
                "subst": [],
              },
              "start": 2620,
              "end": 2645,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "rule",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": Null, "0": "Rule", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_no_modifiers",
                  "loc": [2668, 2685],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 2687,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 2686,
              "end": 2692,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%inline\"",
                  "loc": [2697, 2706],
                },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_no_modifiers",
                  "loc": [2707, 2724],
                },
              },
            ],
            "action": {
              "code": {
                "code": " { ..$2, inline: true } ",
                "utf8_pos": 2726,
                "subst": [
                  { "start": 5, "end": 7, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 2725,
              "end": 2751,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "rule_no_modifiers",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": Null, "0": "Rule", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "nonterminal",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [2799, 2805] },
              },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "opt_rule_return_type",
                  "loc": [2812, 2832],
                },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [2833, 2836] } },
              {
                "binder": "clause_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_list",
                  "loc": [2849, 2860],
                },
              },
              { "term": { "$tag": "Image", "0": "\";\"", "loc": [2861, 2864] } },
            ],
            "action": {
              "code": {
                "code": "\n    { inline: false, nonterminal, generic_params: [], params: [], type_, clauses: clause_list.to_array() }\n  ",
                "utf8_pos": 2866,
                "subst": [],
              },
              "start": 2865,
              "end": 2977,
            },
          },
          {
            "items": [
              {
                "binder": "nonterminal",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [2994, 3000] },
              },
              {
                "binder": "generic_params",
                "term": {
                  "$tag": "Symbol",
                  "0": "opt_rule_generic_params",
                  "loc": [3016, 3039],
                },
              },
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [3040, 3043] } },
              {
                "binder": "param_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_rule_param_list",
                  "loc": [3055, 3079],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [3080, 3083] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "opt_rule_return_type",
                  "loc": [3090, 3110],
                },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [3111, 3114] } },
              {
                "binder": "clause_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_list",
                  "loc": [3127, 3138],
                },
              },
              { "term": { "$tag": "Image", "0": "\";\"", "loc": [3139, 3142] } },
            ],
            "action": {
              "code": {
                "code": "\n    { inline: false, nonterminal, generic_params, params: param_list.to_array(),  type_, clauses: clause_list.to_array() }\n  ",
                "utf8_pos": 3144,
                "subst": [],
              },
              "start": 3143,
              "end": 3271,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "opt_rule_return_type",
        "generic_params": [],
        "params": [],
        "type_": {
          "$tag": "Option",
          "0": { "$tag": "Constr", "pkg": Null, "0": "TypeExpr", "1": [] },
        },
        "clauses": [
          {
            "items": [
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [3315, 3319] },
              },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3326, 3335],
                },
              },
            ],
            "action": {
              "code": { "code": " Some(type_) ", "utf8_pos": 3337, "subst": [] },
              "start": 3336,
              "end": 3351,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 3357, "subst": [] },
              "start": 3356,
              "end": 3364,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "nonempty_rule_param_list",
        "generic_params": [],
        "params": [],
        "type_": {
          "$tag": "Constr",
          "pkg": "immut/list",
          "0": "T",
          "1": [
            {
              "$tag": "Tuple",
              "0": [
                { "$tag": "Constr", "pkg": Null, "0": "String", "1": [] },
                {
                  "$tag": "Option",
                  "0": {
                    "$tag": "Constr",
                    "pkg": Null,
                    "0": "TypeExpr",
                    "1": [],
                  },
                },
              ],
            },
          ],
        },
        "clauses": [
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3437, 3442] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, None), Nil) ",
                "utf8_pos": 3444,
                "subst": [
                  { "start": 7, "end": 9, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 3443,
              "end": 3468,
            },
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3473, 3478] },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [3479, 3482] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3483, 3492],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, Some($3)), Nil) ",
                "utf8_pos": 3494,
                "subst": [
                  { "start": 7, "end": 9, "desc": { "$tag": "Dollar", "0": 1 } },
                  {
                    "start": 16,
                    "end": 18,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 3493,
              "end": 3522,
            },
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3527, 3532] },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [3533, 3536] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_rule_param_list",
                  "loc": [3537, 3561],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, None), $3) ",
                "utf8_pos": 3563,
                "subst": [
                  { "start": 7, "end": 9, "desc": { "$tag": "Dollar", "0": 1 } },
                  {
                    "start": 18,
                    "end": 20,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 3562,
              "end": 3586,
            },
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3591, 3596] },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [3597, 3600] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3601, 3610],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [3611, 3614] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_rule_param_list",
                  "loc": [3615, 3639],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, Some($3)), $5) ",
                "utf8_pos": 3641,
                "subst": [
                  { "start": 7, "end": 9, "desc": { "$tag": "Dollar", "0": 1 } },
                  {
                    "start": 16,
                    "end": 18,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                  {
                    "start": 22,
                    "end": 24,
                    "desc": { "$tag": "Dollar", "0": 5 },
                  },
                ],
              },
              "start": 3640,
              "end": 3668,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "opt_rule_generic_params",
        "generic_params": [],
        "params": [],
        "type_": {
          "$tag": "Constr",
          "pkg": Null,
          "0": "Array",
          "1": [{ "$tag": "Constr", "pkg": Null, "0": "String", "1": [] }],
        },
        "clauses": [
          {
            "items": [],
            "action": {
              "code": { "code": " [] ", "utf8_pos": 3720, "subst": [] },
              "start": 3719,
              "end": 3725,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"[\"", "loc": [3730, 3733] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_ident_list",
                  "loc": [3734, 3759],
                },
              },
              { "term": { "$tag": "Image", "0": "\"]\"", "loc": [3760, 3763] } },
            ],
            "action": {
              "code": {
                "code": " $2.to_array() ",
                "utf8_pos": 3765,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 3764,
              "end": 3781,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "nonempty_comma_ident_list",
        "generic_params": [],
        "params": [],
        "type_": {
          "$tag": "Constr",
          "pkg": "immut/list",
          "0": "T",
          "1": [{ "$tag": "Constr", "pkg": Null, "0": "String", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3842, 3847] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons($1, Nil) ",
                "utf8_pos": 3849,
                "subst": [
                  { "start": 6, "end": 8, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 3848,
              "end": 3865,
            },
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3870, 3875] },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [3876, 3879] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_ident_list",
                  "loc": [3880, 3905],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons($1, $3) ",
                "utf8_pos": 3907,
                "subst": [
                  { "start": 6, "end": 8, "desc": { "$tag": "Dollar", "0": 1 } },
                  {
                    "start": 10,
                    "end": 12,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 3906,
              "end": 3922,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "type_expr",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": Null, "0": "TypeExpr", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "postfix_type_expr",
                  "loc": [3954, 3971],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 3973,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 3972,
              "end": 3978,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [3983, 3986] } },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [3987, 3990] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [3991, 3995] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3996, 4005],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow([], $4) ",
                "utf8_pos": 4007,
                "subst": [
                  {
                    "start": 11,
                    "end": 13,
                    "desc": { "$tag": "Dollar", "0": 4 },
                  },
                ],
              },
              "start": 4006,
              "end": 4023,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4028, 4031] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4032, 4041],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4042, 4045] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [4046, 4050] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4051, 4060],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow([$2], $5) ",
                "utf8_pos": 4062,
                "subst": [
                  {
                    "start": 8,
                    "end": 10,
                    "desc": { "$tag": "Dollar", "0": 2 },
                  },
                  {
                    "start": 13,
                    "end": 15,
                    "desc": { "$tag": "Dollar", "0": 5 },
                  },
                ],
              },
              "start": 4061,
              "end": 4080,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4085, 4088] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4089, 4098],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4099, 4102] } },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4103, 4106] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [4107, 4111] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4112, 4121],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow([$2], $6) ",
                "utf8_pos": 4123,
                "subst": [
                  {
                    "start": 8,
                    "end": 10,
                    "desc": { "$tag": "Dollar", "0": 2 },
                  },
                  {
                    "start": 13,
                    "end": 15,
                    "desc": { "$tag": "Dollar", "0": 6 },
                  },
                ],
              },
              "start": 4122,
              "end": 4141,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4146, 4149] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4150, 4159],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4160, 4163] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4164, 4187],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4188, 4191] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [4192, 4196] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4197, 4206],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow(@immut/list.Cons($2, $4).to_array(), $7) ",
                "utf8_pos": 4208,
                "subst": [
                  {
                    "start": 24,
                    "end": 26,
                    "desc": { "$tag": "Dollar", "0": 2 },
                  },
                  {
                    "start": 28,
                    "end": 30,
                    "desc": { "$tag": "Dollar", "0": 4 },
                  },
                  {
                    "start": 44,
                    "end": 46,
                    "desc": { "$tag": "Dollar", "0": 7 },
                  },
                ],
              },
              "start": 4207,
              "end": 4257,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "postfix_type_expr",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": Null, "0": "TypeExpr", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "basic_type_expr",
                  "loc": [4297, 4312],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 4314,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 4313,
              "end": 4319,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "postfix_type_expr",
                  "loc": [4324, 4341],
                },
              },
              { "term": { "$tag": "Image", "0": "\"?\"", "loc": [4342, 4345] } },
            ],
            "action": {
              "code": {
                "code": " Option($1) ",
                "utf8_pos": 4347,
                "subst": [
                  {
                    "start": 8,
                    "end": 10,
                    "desc": { "$tag": "Dollar", "0": 1 },
                  },
                ],
              },
              "start": 4346,
              "end": 4360,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "basic_type_expr",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": Null, "0": "TypeExpr", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [4398, 4403] },
              },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=None, $1, []) ",
                "utf8_pos": 4405,
                "subst": [
                  {
                    "start": 18,
                    "end": 20,
                    "desc": { "$tag": "Dollar", "0": 1 },
                  },
                ],
              },
              "start": 4404,
              "end": 4432,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "PKG_AND_IDENT",
                  "loc": [4437, 4450],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=Some($1.0), $1.1, []) ",
                "utf8_pos": 4452,
                "subst": [
                  {
                    "start": 17,
                    "end": 19,
                    "desc": { "$tag": "Dollar", "0": 1 },
                  },
                  {
                    "start": 24,
                    "end": 26,
                    "desc": { "$tag": "Dollar", "0": 1 },
                  },
                ],
              },
              "start": 4451,
              "end": 4487,
            },
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [4492, 4497] },
              },
              { "term": { "$tag": "Image", "0": "\"[\"", "loc": [4498, 4501] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4502, 4525],
                },
              },
              { "term": { "$tag": "Image", "0": "\"]\"", "loc": [4526, 4529] } },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=None, $1, $3.to_array()) ",
                "utf8_pos": 4531,
                "subst": [
                  {
                    "start": 18,
                    "end": 20,
                    "desc": { "$tag": "Dollar", "0": 1 },
                  },
                  {
                    "start": 22,
                    "end": 24,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 4530,
              "end": 4569,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "PKG_AND_IDENT",
                  "loc": [4574, 4587],
                },
              },
              { "term": { "$tag": "Image", "0": "\"[\"", "loc": [4588, 4591] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4592, 4615],
                },
              },
              { "term": { "$tag": "Image", "0": "\"]\"", "loc": [4616, 4619] } },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=Some($1.0), $1.1, $3.to_array()) ",
                "utf8_pos": 4621,
                "subst": [
                  {
                    "start": 17,
                    "end": 19,
                    "desc": { "$tag": "Dollar", "0": 1 },
                  },
                  {
                    "start": 24,
                    "end": 26,
                    "desc": { "$tag": "Dollar", "0": 1 },
                  },
                  {
                    "start": 30,
                    "end": 32,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 4620,
              "end": 4667,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4672, 4675] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4676, 4685],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4686, 4689] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4690, 4713],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4714, 4717] } },
            ],
            "action": {
              "code": {
                "code": " Tuple(@immut/list.Cons($2, $4).to_array()) ",
                "utf8_pos": 4719,
                "subst": [
                  {
                    "start": 24,
                    "end": 26,
                    "desc": { "$tag": "Dollar", "0": 2 },
                  },
                  {
                    "start": 28,
                    "end": 30,
                    "desc": { "$tag": "Dollar", "0": 4 },
                  },
                ],
              },
              "start": 4718,
              "end": 4764,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4769, 4772] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4773, 4782],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4783, 4786] } },
            ],
            "action": {
              "code": {
                "code": " $2 ",
                "utf8_pos": 4788,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 4787,
              "end": 4793,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "nonempty_type_expr_list",
        "generic_params": [],
        "params": [],
        "type_": {
          "$tag": "Constr",
          "pkg": "immut/list",
          "0": "T",
          "1": [{ "$tag": "Constr", "pkg": Null, "0": "TypeExpr", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "type_expr",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4864, 4873],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(type_expr, Nil) ",
                "utf8_pos": 4875,
                "subst": [],
              },
              "start": 4874,
              "end": 4898,
            },
          },
          {
            "items": [
              {
                "binder": "type_expr",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4913, 4922],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4923, 4926] } },
              {
                "binder": "type_expr_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4942, 4965],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(type_expr, type_expr_list) ",
                "utf8_pos": 4967,
                "subst": [],
              },
              "start": 4966,
              "end": 5001,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "clause_list",
        "generic_params": [],
        "params": [],
        "type_": {
          "$tag": "Constr",
          "pkg": "immut/list",
          "0": "T",
          "1": [{ "$tag": "Constr", "pkg": Null, "0": "Clause", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "clause",
                "term": { "$tag": "Symbol", "0": "clause", "loc": [5055, 5061] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(clause, Nil) ",
                "utf8_pos": 5063,
                "subst": [],
              },
              "start": 5062,
              "end": 5083,
            },
          },
          {
            "items": [
              {
                "binder": "clause",
                "term": { "$tag": "Symbol", "0": "clause", "loc": [5095, 5101] },
              },
              { "term": { "$tag": "Image", "0": "\"|\"", "loc": [5102, 5105] } },
              {
                "binder": "clause_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_list",
                  "loc": [5118, 5129],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(clause, clause_list) ",
                "utf8_pos": 5131,
                "subst": [],
              },
              "start": 5130,
              "end": 5159,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "clause",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": Null, "0": "Clause", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "item_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "item_list",
                  "loc": [5196, 5205],
                },
              },
              {
                "binder": "prec",
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_prec",
                  "loc": [5211, 5220],
                },
              },
              {
                "binder": "action",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_action",
                  "loc": [5228, 5241],
                },
              },
            ],
            "action": {
              "code": {
                "code": " { items: item_list.to_array(), prec, action } ",
                "utf8_pos": 5243,
                "subst": [],
              },
              "start": 5242,
              "end": 5291,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "clause_action",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": Null, "0": "ClauseAction", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "code",
                "term": {
                  "$tag": "Symbol",
                  "0": "LBRACE_CODE_RBRACE",
                  "loc": [5336, 5354],
                },
              },
            ],
            "action": {
              "code": {
                "code": "\n      let (code, utf8_pos, subst) = code\n      { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\n  ",
                "utf8_pos": 5356,
                "subst": [
                  { "start": 96, "end": 105, "desc": { "$tag": "StartPos" } },
                  { "start": 112, "end": 119, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 5355,
              "end": 5481,
            },
          },
          {
            "items": [],
            "action": {
              "code": {
                "code": " { code: None, start: $startpos, end: $endpos } ",
                "utf8_pos": 5487,
                "subst": [
                  { "start": 22, "end": 31, "desc": { "$tag": "StartPos" } },
                  { "start": 38, "end": 45, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 5486,
              "end": 5536,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "rule_prec",
        "generic_params": [],
        "params": [],
        "type_": {
          "$tag": "Option",
          "0": { "$tag": "Constr", "pkg": Null, "0": "Symbol", "1": [] },
        },
        "clauses": [
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%prec\"",
                  "loc": [5567, 5574],
                },
              },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [5582, 5588] },
              },
            ],
            "action": {
              "code": {
                "code": " Some(symbol) ",
                "utf8_pos": 5590,
                "subst": [],
              },
              "start": 5589,
              "end": 5605,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 5611, "subst": [] },
              "start": 5610,
              "end": 5618,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "item_list",
        "generic_params": [],
        "params": [],
        "type_": {
          "$tag": "Constr",
          "pkg": "immut/list",
          "0": "T",
          "1": [{ "$tag": "Constr", "pkg": Null, "0": "ClauseItem", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "item",
                "term": { "$tag": "Symbol", "0": "item", "loc": [5672, 5676] },
              },
              {
                "binder": "item_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "item_list",
                  "loc": [5687, 5696],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(item, item_list) ",
                "utf8_pos": 5698,
                "subst": [],
              },
              "start": 5697,
              "end": 5722,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "utf8_pos": 5728, "subst": [] },
              "start": 5727,
              "end": 5734,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "item",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": Null, "0": "ClauseItem", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "term",
                "term": { "$tag": "Symbol", "0": "term", "loc": [5768, 5772] },
              },
            ],
            "action": {
              "code": {
                "code": " { binder: None, term: term } ",
                "utf8_pos": 5774,
                "subst": [],
              },
              "start": 5773,
              "end": 5805,
            },
          },
          {
            "items": [
              {
                "binder": "binder",
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [5817, 5822] },
              },
              { "term": { "$tag": "Image", "0": "\"=\"", "loc": [5823, 5826] } },
              {
                "binder": "term",
                "term": { "$tag": "Symbol", "0": "term", "loc": [5832, 5836] },
              },
            ],
            "action": {
              "code": {
                "code": " { binder: Some(binder), term: term } ",
                "utf8_pos": 5838,
                "subst": [],
              },
              "start": 5837,
              "end": 5877,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "term",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": Null, "0": "Term", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [5907, 5913] },
              },
            ],
            "action": {
              "code": {
                "code": " Symbol(symbol, loc=($startpos, $endpos)) ",
                "utf8_pos": 5915,
                "subst": [
                  { "start": 21, "end": 30, "desc": { "$tag": "StartPos" } },
                  { "start": 32, "end": 39, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 5914,
              "end": 5958,
            },
          },
          {
            "items": [
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [5970, 5976] },
              },
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [5977, 5980] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_term_list",
                  "loc": [5981, 6005],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [6006, 6009] } },
            ],
            "action": {
              "code": {
                "code": " RuleCall(symbol, symbol_loc=($startpos(symbol), $endpos(symbol)), $3.to_array()) ",
                "utf8_pos": 6011,
                "subst": [
                  {
                    "start": 30,
                    "end": 47,
                    "desc": {
                      "$tag": "StartPosOf",
                      "0": { "$tag": "Name", "0": "symbol" },
                    },
                  },
                  {
                    "start": 49,
                    "end": 64,
                    "desc": {
                      "$tag": "EndPosOf",
                      "0": { "$tag": "Name", "0": "symbol" },
                    },
                  },
                  {
                    "start": 67,
                    "end": 69,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 6010,
              "end": 6094,
            },
          },
          {
            "items": [
              {
                "binder": "image",
                "term": { "$tag": "Symbol", "0": "STRING", "loc": [6105, 6111] },
              },
            ],
            "action": {
              "code": {
                "code": " Image(image, loc=($startpos, $endpos)) ",
                "utf8_pos": 6113,
                "subst": [
                  { "start": 19, "end": 28, "desc": { "$tag": "StartPos" } },
                  { "start": 30, "end": 37, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 6112,
              "end": 6154,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "nonempty_comma_term_list",
        "generic_params": [],
        "params": [],
        "type_": {
          "$tag": "Constr",
          "pkg": "immut/list",
          "0": "T",
          "1": [{ "$tag": "Constr", "pkg": Null, "0": "Term", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "term",
                "term": { "$tag": "Symbol", "0": "term", "loc": [6217, 6221] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(term, Nil) ",
                "utf8_pos": 6223,
                "subst": [],
              },
              "start": 6222,
              "end": 6241,
            },
          },
          {
            "items": [
              {
                "binder": "term",
                "term": { "$tag": "Symbol", "0": "term", "loc": [6251, 6255] },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [6256, 6259] } },
              {
                "binder": "term_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_term_list",
                  "loc": [6270, 6294],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(term, term_list) ",
                "utf8_pos": 6296,
                "subst": [],
              },
              "start": 6295,
              "end": 6320,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "nonempty_symbol_list",
        "generic_params": [],
        "params": [],
        "type_": {
          "$tag": "Constr",
          "pkg": "immut/list",
          "0": "T",
          "1": [{ "$tag": "Constr", "pkg": Null, "0": "Symbol", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [6383, 6389] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(symbol, Nil) ",
                "utf8_pos": 6391,
                "subst": [],
              },
              "start": 6390,
              "end": 6411,
            },
          },
          {
            "items": [
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [6423, 6429] },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [6442, 6462],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(symbol, symbol_list) ",
                "utf8_pos": 6464,
                "subst": [],
              },
              "start": 6463,
              "end": 6492,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "symbol",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": Null, "0": "Symbol", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "ident",
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [6525, 6530] },
              },
            ],
            "action": {
              "code": { "code": " ident ", "utf8_pos": 6532, "subst": [] },
              "start": 6531,
              "end": 6540,
            },
          },
        ],
      },
    ],
  })
}
