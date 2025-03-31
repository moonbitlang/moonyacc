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
      #|IDENT("Code")
      #|QUESTION
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|LBRACE_CODE_RBRACE((" Some(code.0) ", 1136, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 1157, []))
      #|SEMI
      #|IDENT("trailer")
      #|ARROW
      #|IDENT("Code")
      #|QUESTION
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|LBRACE_CODE_RBRACE((" Some(code.0) ", 1232, []))
      #|BAR
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_PERCENT_CODE_EOF")
      #|LBRACE_CODE_RBRACE((" Some(code.0) ", 1283, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 1304, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(decl, decl_list) ", 1392, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", 1422, []))
      #|SEMI
      #|IDENT("decl")
      #|ARROW
      #|IDENT("Declaration")
      #|COLON
      #|STRING("\"%start\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Start(symbol_list.to_array()) ", 1501, []))
      #|BAR
      #|STRING("\"%token\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Token(symbol_list.to_array(), type_=None) ", 1581, []))
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
      #|LBRACE_CODE_RBRACE((" Token(symbol_list.to_array(), type_=Some(type_)) ", 1697, []))
      #|BAR
      #|STRING("\"%token\"")
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Token1(symbol, type_=None, image=image) ", 1790, []))
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
      #|LBRACE_CODE_RBRACE((" Token1(symbol, type_=Some(type_), image=image) ", 1898, []))
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
      #|LBRACE_CODE_RBRACE((" Type(symbol_list.to_array(), type_=type_) ", 2018, []))
      #|BAR
      #|STRING("\"%position\"")
      #|STRING("\"<\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("type_expr")
      #|STRING("\">\"")
      #|LBRACE_CODE_RBRACE((" Position(type_=type_) ", 2104, []))
      #|BAR
      #|STRING("\"%left\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Left(symbol_list.to_array()) ", 2175, []))
      #|BAR
      #|STRING("\"%right\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Right(symbol_list.to_array()) ", 2254, []))
      #|BAR
      #|STRING("\"%nonassoc\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Nonassoc(symbol_list.to_array()) ", 2337, []))
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
      #|LBRACE_CODE_RBRACE((" Derive(traits=trait_list.to_array(), type_=type_) ", 2443, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(rule, Nil) ", 2549, []))
      #|BAR
      #|IDENT("rule")
      #|EQ
      #|IDENT("rule")
      #|IDENT("rule_list")
      #|EQ
      #|IDENT("rule_list")
      #|LBRACE_CODE_RBRACE((" Cons(rule, rule_list) ", 2603, []))
      #|SEMI
      #|IDENT("rule")
      #|ARROW
      #|IDENT("Rule")
      #|COLON
      #|IDENT("rule_no_modifiers")
      #|LBRACE_CODE_RBRACE((" $1 ", 2669, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|STRING("\"%inline\"")
      #|IDENT("rule_no_modifiers")
      #|LBRACE_CODE_RBRACE((" { ..$2, inline: true } ", 2708, [{start: 5, end: 7, desc: Dollar(2)}]))
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
      #|LBRACE_CODE_RBRACE(("\n    { inline: false, nonterminal, generic_params: [], params: [], type_, clauses: clause_list.to_array() }\n  ", 2848, []))
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
      #|LBRACE_CODE_RBRACE(("\n    { inline: false, nonterminal, generic_params, params: param_list.to_array(),  type_, clauses: clause_list.to_array() }\n  ", 3126, []))
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
      #|LBRACE_CODE_RBRACE((" Some(type_) ", 3319, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 3339, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(($1, None), Nil) ", 3426, [{start: 7, end: 9, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\":\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Cons(($1, Some($3)), Nil) ", 3476, [{start: 7, end: 9, desc: Dollar(1)}, {start: 16, end: 18, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\",\"")
      #|IDENT("nonempty_rule_param_list")
      #|LBRACE_CODE_RBRACE((" Cons(($1, None), $3) ", 3545, [{start: 7, end: 9, desc: Dollar(1)}, {start: 18, end: 20, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\":\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("nonempty_rule_param_list")
      #|LBRACE_CODE_RBRACE((" Cons(($1, Some($3)), $5) ", 3623, [{start: 7, end: 9, desc: Dollar(1)}, {start: 16, end: 18, desc: Dollar(3)}, {start: 22, end: 24, desc: Dollar(5)}]))
      #|SEMI
      #|IDENT("opt_rule_generic_params")
      #|ARROW
      #|IDENT("Array")
      #|LBRACKET
      #|IDENT("String")
      #|RBRACKET
      #|COLON
      #|LBRACE_CODE_RBRACE((" [] ", 3702, []))
      #|BAR
      #|STRING("\"[\"")
      #|IDENT("nonempty_comma_ident_list")
      #|STRING("\"]\"")
      #|LBRACE_CODE_RBRACE((" $2.to_array() ", 3747, [{start: 1, end: 3, desc: Dollar(2)}]))
      #|SEMI
      #|IDENT("nonempty_comma_ident_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|IDENT("String")
      #|RBRACKET
      #|COLON
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Cons($1, Nil) ", 3831, [{start: 6, end: 8, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\",\"")
      #|IDENT("nonempty_comma_ident_list")
      #|LBRACE_CODE_RBRACE((" Cons($1, $3) ", 3889, [{start: 6, end: 8, desc: Dollar(1)}, {start: 10, end: 12, desc: Dollar(3)}]))
      #|SEMI
      #|IDENT("type_expr")
      #|ARROW
      #|IDENT("TypeExpr")
      #|COLON
      #|IDENT("postfix_type_expr")
      #|LBRACE_CODE_RBRACE((" $1 ", 3955, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|STRING("\"(\"")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow([], $4) ", 3989, [{start: 11, end: 13, desc: Dollar(4)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow([$2], $5) ", 4044, [{start: 8, end: 10, desc: Dollar(2)}, {start: 13, end: 15, desc: Dollar(5)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow([$2], $6) ", 4105, [{start: 8, end: 10, desc: Dollar(2)}, {start: 13, end: 15, desc: Dollar(6)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow(@immut/list.Cons($2, $4).to_array(), $7) ", 4190, [{start: 24, end: 26, desc: Dollar(2)}, {start: 28, end: 30, desc: Dollar(4)}, {start: 44, end: 46, desc: Dollar(7)}]))
      #|SEMI
      #|IDENT("postfix_type_expr")
      #|ARROW
      #|IDENT("TypeExpr")
      #|COLON
      #|IDENT("basic_type_expr")
      #|LBRACE_CODE_RBRACE((" $1 ", 4296, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("postfix_type_expr")
      #|STRING("\"?\"")
      #|LBRACE_CODE_RBRACE((" Option($1) ", 4329, [{start: 8, end: 10, desc: Dollar(1)}]))
      #|SEMI
      #|IDENT("basic_type_expr")
      #|ARROW
      #|IDENT("TypeExpr")
      #|COLON
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=None, $1, []) ", 4387, [{start: 18, end: 20, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("PKG_AND_IDENT")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=Some($1.0), $1.1, []) ", 4434, [{start: 17, end: 19, desc: Dollar(1)}, {start: 24, end: 26, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\"[\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\"]\"")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=None, $1, $3.to_array()) ", 4513, [{start: 18, end: 20, desc: Dollar(1)}, {start: 22, end: 24, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("PKG_AND_IDENT")
      #|STRING("\"[\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\"]\"")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=Some($1.0), $1.1, $3.to_array()) ", 4603, [{start: 17, end: 19, desc: Dollar(1)}, {start: 24, end: 26, desc: Dollar(1)}, {start: 30, end: 32, desc: Dollar(3)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\")\"")
      #|LBRACE_CODE_RBRACE((" Tuple(@immut/list.Cons($2, $4).to_array()) ", 4701, [{start: 24, end: 26, desc: Dollar(2)}, {start: 28, end: 30, desc: Dollar(4)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\")\"")
      #|LBRACE_CODE_RBRACE((" $2 ", 4770, [{start: 1, end: 3, desc: Dollar(2)}]))
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
      #|LBRACE_CODE_RBRACE((" Cons(type_expr, Nil) ", 4857, []))
      #|BAR
      #|IDENT("type_expr")
      #|EQ
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("type_expr_list")
      #|EQ
      #|IDENT("nonempty_type_expr_list")
      #|LBRACE_CODE_RBRACE((" Cons(type_expr, type_expr_list) ", 4949, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(clause, Nil) ", 5045, []))
      #|BAR
      #|IDENT("clause")
      #|EQ
      #|IDENT("clause")
      #|STRING("\"|\"")
      #|IDENT("clause_list")
      #|EQ
      #|IDENT("clause_list")
      #|LBRACE_CODE_RBRACE((" Cons(clause, clause_list) ", 5113, []))
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
      #|LBRACE_CODE_RBRACE((" { items: item_list.to_array(), prec, action } ", 5225, []))
      #|SEMI
      #|IDENT("clause_action")
      #|ARROW
      #|IDENT("ClauseAction")
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("LBRACE_CODE_RBRACE")
      #|LBRACE_CODE_RBRACE(("\n      let (code, utf8_pos, subst) = code\n      { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\n  ", 5338, [{start: 96, end: 105, desc: StartPos}, {start: 112, end: 119, desc: EndPos}]))
      #|BAR
      #|LBRACE_CODE_RBRACE((" { code: None, start: $startpos, end: $endpos } ", 5469, [{start: 22, end: 31, desc: StartPos}, {start: 38, end: 45, desc: EndPos}]))
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
      #|LBRACE_CODE_RBRACE((" Some(symbol) ", 5572, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 5593, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(item, item_list) ", 5680, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", 5710, []))
      #|SEMI
      #|IDENT("item")
      #|ARROW
      #|IDENT("ClauseItem")
      #|COLON
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|LBRACE_CODE_RBRACE((" { binder: None, term: term } ", 5756, []))
      #|BAR
      #|IDENT("binder")
      #|EQ
      #|IDENT("IDENT")
      #|STRING("\"=\"")
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|LBRACE_CODE_RBRACE((" { binder: Some(binder), term: term } ", 5820, []))
      #|SEMI
      #|IDENT("term")
      #|ARROW
      #|IDENT("Term")
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Symbol(symbol, loc=($startpos, $endpos)) ", 5897, [{start: 21, end: 30, desc: StartPos}, {start: 32, end: 39, desc: EndPos}]))
      #|BAR
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|STRING("\"(\"")
      #|IDENT("nonempty_comma_term_list")
      #|STRING("\")\"")
      #|LBRACE_CODE_RBRACE((" RuleCall(symbol, symbol_loc=($startpos(symbol), $endpos(symbol)), $3.to_array()) ", 5993, [{start: 30, end: 47, desc: StartPosOf(Name("symbol"))}, {start: 49, end: 64, desc: EndPosOf(Name("symbol"))}, {start: 67, end: 69, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Image(image, loc=($startpos, $endpos)) ", 6095, [{start: 19, end: 28, desc: StartPos}, {start: 30, end: 37, desc: EndPos}]))
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
      #|LBRACE_CODE_RBRACE((" Cons(term, Nil) ", 6205, []))
      #|BAR
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|STRING("\",\"")
      #|IDENT("term_list")
      #|EQ
      #|IDENT("nonempty_comma_term_list")
      #|LBRACE_CODE_RBRACE((" Cons(term, term_list) ", 6278, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(symbol, Nil) ", 6373, []))
      #|BAR
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Cons(symbol, symbol_list) ", 6446, []))
      #|SEMI
      #|IDENT("symbol")
      #|ARROW
      #|IDENT("Symbol")
      #|COLON
      #|IDENT("ident")
      #|EQ
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" ident ", 6514, []))
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
          "0": { "$tag": "Constr", "pkg": Null, "0": "Code", "1": [] },
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "code",
                "term": {
                  "$tag": "Symbol",
                  "0": "PERCENT_LBRACE_CODE_PERCENT_RBRACE",
                  "loc": [1100, 1134],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Some(code.0) ",
                "utf8_pos": 1136,
                "subst": [],
              },
              "start": 1135,
              "end": 1151,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 1157, "subst": [] },
              "start": 1156,
              "end": 1164,
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
          "0": { "$tag": "Constr", "pkg": Null, "0": "Code", "1": [] },
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "code",
                "term": {
                  "$tag": "Symbol",
                  "0": "PERCENT_LBRACE_CODE_PERCENT_RBRACE",
                  "loc": [1196, 1230],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Some(code.0) ",
                "utf8_pos": 1232,
                "subst": [],
              },
              "start": 1231,
              "end": 1247,
            },
          },
          {
            "items": [
              {
                "binder": "code",
                "term": {
                  "$tag": "Symbol",
                  "0": "PERCENT_PERCENT_CODE_EOF",
                  "loc": [1257, 1281],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Some(code.0) ",
                "utf8_pos": 1283,
                "subst": [],
              },
              "start": 1282,
              "end": 1298,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 1304, "subst": [] },
              "start": 1303,
              "end": 1311,
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
                "term": { "$tag": "Symbol", "0": "decl", "loc": [1366, 1370] },
              },
              {
                "binder": "decl_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "decl_list",
                  "loc": [1381, 1390],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(decl, decl_list) ",
                "utf8_pos": 1392,
                "subst": [],
              },
              "start": 1391,
              "end": 1416,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "utf8_pos": 1422, "subst": [] },
              "start": 1421,
              "end": 1428,
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
                  "loc": [1458, 1466],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [1479, 1499],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Start(symbol_list.to_array()) ",
                "utf8_pos": 1501,
                "subst": [],
              },
              "start": 1500,
              "end": 1533,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1538, 1546],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [1559, 1579],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Token(symbol_list.to_array(), type_=None) ",
                "utf8_pos": 1581,
                "subst": [],
              },
              "start": 1580,
              "end": 1625,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1630, 1638],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [1639, 1642] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [1649, 1658],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [1659, 1662] } },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [1675, 1695],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Token(symbol_list.to_array(), type_=Some(type_)) ",
                "utf8_pos": 1697,
                "subst": [],
              },
              "start": 1696,
              "end": 1748,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1753, 1761],
                },
              },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [1769, 1775] },
              },
              {
                "binder": "image",
                "term": { "$tag": "Symbol", "0": "STRING", "loc": [1782, 1788] },
              },
            ],
            "action": {
              "code": {
                "code": " Token1(symbol, type_=None, image=image) ",
                "utf8_pos": 1790,
                "subst": [],
              },
              "start": 1789,
              "end": 1832,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1837, 1845],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [1846, 1849] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [1856, 1865],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [1866, 1869] } },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [1877, 1883] },
              },
              {
                "binder": "image",
                "term": { "$tag": "Symbol", "0": "STRING", "loc": [1890, 1896] },
              },
            ],
            "action": {
              "code": {
                "code": " Token1(symbol, type_=Some(type_), image=image) ",
                "utf8_pos": 1898,
                "subst": [],
              },
              "start": 1897,
              "end": 1947,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%type\"",
                  "loc": [1952, 1959],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [1960, 1963] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [1970, 1979],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [1980, 1983] } },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [1996, 2016],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Type(symbol_list.to_array(), type_=type_) ",
                "utf8_pos": 2018,
                "subst": [],
              },
              "start": 2017,
              "end": 2062,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%position\"",
                  "loc": [2067, 2078],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [2079, 2082] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [2089, 2098],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [2099, 2102] } },
            ],
            "action": {
              "code": {
                "code": " Position(type_=type_) ",
                "utf8_pos": 2104,
                "subst": [],
              },
              "start": 2103,
              "end": 2128,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%left\"",
                  "loc": [2133, 2140],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2153, 2173],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Left(symbol_list.to_array()) ",
                "utf8_pos": 2175,
                "subst": [],
              },
              "start": 2174,
              "end": 2206,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%right\"",
                  "loc": [2211, 2219],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2232, 2252],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Right(symbol_list.to_array()) ",
                "utf8_pos": 2254,
                "subst": [],
              },
              "start": 2253,
              "end": 2286,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%nonassoc\"",
                  "loc": [2291, 2302],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2315, 2335],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Nonassoc(symbol_list.to_array()) ",
                "utf8_pos": 2337,
                "subst": [],
              },
              "start": 2336,
              "end": 2372,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%derive\"",
                  "loc": [2377, 2386],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [2387, 2390] } },
              {
                "binder": "trait_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [2402, 2425],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [2426, 2429] } },
              {
                "binder": "type_",
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [2436, 2441] },
              },
            ],
            "action": {
              "code": {
                "code": " Derive(traits=trait_list.to_array(), type_=type_) ",
                "utf8_pos": 2443,
                "subst": [],
              },
              "start": 2442,
              "end": 2495,
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
                "term": { "$tag": "Symbol", "0": "rule", "loc": [2543, 2547] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(rule, Nil) ",
                "utf8_pos": 2549,
                "subst": [],
              },
              "start": 2548,
              "end": 2567,
            },
          },
          {
            "items": [
              {
                "binder": "rule",
                "term": { "$tag": "Symbol", "0": "rule", "loc": [2577, 2581] },
              },
              {
                "binder": "rule_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_list",
                  "loc": [2592, 2601],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(rule, rule_list) ",
                "utf8_pos": 2603,
                "subst": [],
              },
              "start": 2602,
              "end": 2627,
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
                  "loc": [2650, 2667],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 2669,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 2668,
              "end": 2674,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%inline\"",
                  "loc": [2679, 2688],
                },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_no_modifiers",
                  "loc": [2689, 2706],
                },
              },
            ],
            "action": {
              "code": {
                "code": " { ..$2, inline: true } ",
                "utf8_pos": 2708,
                "subst": [
                  { "start": 5, "end": 7, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 2707,
              "end": 2733,
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
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [2781, 2787] },
              },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "opt_rule_return_type",
                  "loc": [2794, 2814],
                },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [2815, 2818] } },
              {
                "binder": "clause_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_list",
                  "loc": [2831, 2842],
                },
              },
              { "term": { "$tag": "Image", "0": "\";\"", "loc": [2843, 2846] } },
            ],
            "action": {
              "code": {
                "code": "\n    { inline: false, nonterminal, generic_params: [], params: [], type_, clauses: clause_list.to_array() }\n  ",
                "utf8_pos": 2848,
                "subst": [],
              },
              "start": 2847,
              "end": 2959,
            },
          },
          {
            "items": [
              {
                "binder": "nonterminal",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [2976, 2982] },
              },
              {
                "binder": "generic_params",
                "term": {
                  "$tag": "Symbol",
                  "0": "opt_rule_generic_params",
                  "loc": [2998, 3021],
                },
              },
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [3022, 3025] } },
              {
                "binder": "param_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_rule_param_list",
                  "loc": [3037, 3061],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [3062, 3065] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "opt_rule_return_type",
                  "loc": [3072, 3092],
                },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [3093, 3096] } },
              {
                "binder": "clause_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_list",
                  "loc": [3109, 3120],
                },
              },
              { "term": { "$tag": "Image", "0": "\";\"", "loc": [3121, 3124] } },
            ],
            "action": {
              "code": {
                "code": "\n    { inline: false, nonterminal, generic_params, params: param_list.to_array(),  type_, clauses: clause_list.to_array() }\n  ",
                "utf8_pos": 3126,
                "subst": [],
              },
              "start": 3125,
              "end": 3253,
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
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [3297, 3301] },
              },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3308, 3317],
                },
              },
            ],
            "action": {
              "code": { "code": " Some(type_) ", "utf8_pos": 3319, "subst": [] },
              "start": 3318,
              "end": 3333,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 3339, "subst": [] },
              "start": 3338,
              "end": 3346,
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
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3419, 3424] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, None), Nil) ",
                "utf8_pos": 3426,
                "subst": [
                  { "start": 7, "end": 9, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 3425,
              "end": 3450,
            },
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3455, 3460] },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [3461, 3464] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3465, 3474],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, Some($3)), Nil) ",
                "utf8_pos": 3476,
                "subst": [
                  { "start": 7, "end": 9, "desc": { "$tag": "Dollar", "0": 1 } },
                  {
                    "start": 16,
                    "end": 18,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 3475,
              "end": 3504,
            },
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3509, 3514] },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [3515, 3518] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_rule_param_list",
                  "loc": [3519, 3543],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, None), $3) ",
                "utf8_pos": 3545,
                "subst": [
                  { "start": 7, "end": 9, "desc": { "$tag": "Dollar", "0": 1 } },
                  {
                    "start": 18,
                    "end": 20,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 3544,
              "end": 3568,
            },
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3573, 3578] },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [3579, 3582] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3583, 3592],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [3593, 3596] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_rule_param_list",
                  "loc": [3597, 3621],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, Some($3)), $5) ",
                "utf8_pos": 3623,
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
              "start": 3622,
              "end": 3650,
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
              "code": { "code": " [] ", "utf8_pos": 3702, "subst": [] },
              "start": 3701,
              "end": 3707,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"[\"", "loc": [3712, 3715] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_ident_list",
                  "loc": [3716, 3741],
                },
              },
              { "term": { "$tag": "Image", "0": "\"]\"", "loc": [3742, 3745] } },
            ],
            "action": {
              "code": {
                "code": " $2.to_array() ",
                "utf8_pos": 3747,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 3746,
              "end": 3763,
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
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3824, 3829] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons($1, Nil) ",
                "utf8_pos": 3831,
                "subst": [
                  { "start": 6, "end": 8, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 3830,
              "end": 3847,
            },
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3852, 3857] },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [3858, 3861] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_ident_list",
                  "loc": [3862, 3887],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons($1, $3) ",
                "utf8_pos": 3889,
                "subst": [
                  { "start": 6, "end": 8, "desc": { "$tag": "Dollar", "0": 1 } },
                  {
                    "start": 10,
                    "end": 12,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 3888,
              "end": 3904,
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
                  "loc": [3936, 3953],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 3955,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 3954,
              "end": 3960,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [3965, 3968] } },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [3969, 3972] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [3973, 3977] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3978, 3987],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow([], $4) ",
                "utf8_pos": 3989,
                "subst": [
                  {
                    "start": 11,
                    "end": 13,
                    "desc": { "$tag": "Dollar", "0": 4 },
                  },
                ],
              },
              "start": 3988,
              "end": 4005,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4010, 4013] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4014, 4023],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4024, 4027] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [4028, 4032] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4033, 4042],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow([$2], $5) ",
                "utf8_pos": 4044,
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
              "start": 4043,
              "end": 4062,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4067, 4070] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4071, 4080],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4081, 4084] } },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4085, 4088] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [4089, 4093] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4094, 4103],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow([$2], $6) ",
                "utf8_pos": 4105,
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
              "start": 4104,
              "end": 4123,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4128, 4131] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4132, 4141],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4142, 4145] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4146, 4169],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4170, 4173] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [4174, 4178] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4179, 4188],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow(@immut/list.Cons($2, $4).to_array(), $7) ",
                "utf8_pos": 4190,
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
              "start": 4189,
              "end": 4239,
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
                  "loc": [4279, 4294],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 4296,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 4295,
              "end": 4301,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "postfix_type_expr",
                  "loc": [4306, 4323],
                },
              },
              { "term": { "$tag": "Image", "0": "\"?\"", "loc": [4324, 4327] } },
            ],
            "action": {
              "code": {
                "code": " Option($1) ",
                "utf8_pos": 4329,
                "subst": [
                  {
                    "start": 8,
                    "end": 10,
                    "desc": { "$tag": "Dollar", "0": 1 },
                  },
                ],
              },
              "start": 4328,
              "end": 4342,
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
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [4380, 4385] },
              },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=None, $1, []) ",
                "utf8_pos": 4387,
                "subst": [
                  {
                    "start": 18,
                    "end": 20,
                    "desc": { "$tag": "Dollar", "0": 1 },
                  },
                ],
              },
              "start": 4386,
              "end": 4414,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "PKG_AND_IDENT",
                  "loc": [4419, 4432],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=Some($1.0), $1.1, []) ",
                "utf8_pos": 4434,
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
              "start": 4433,
              "end": 4469,
            },
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [4474, 4479] },
              },
              { "term": { "$tag": "Image", "0": "\"[\"", "loc": [4480, 4483] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4484, 4507],
                },
              },
              { "term": { "$tag": "Image", "0": "\"]\"", "loc": [4508, 4511] } },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=None, $1, $3.to_array()) ",
                "utf8_pos": 4513,
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
              "start": 4512,
              "end": 4551,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "PKG_AND_IDENT",
                  "loc": [4556, 4569],
                },
              },
              { "term": { "$tag": "Image", "0": "\"[\"", "loc": [4570, 4573] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4574, 4597],
                },
              },
              { "term": { "$tag": "Image", "0": "\"]\"", "loc": [4598, 4601] } },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=Some($1.0), $1.1, $3.to_array()) ",
                "utf8_pos": 4603,
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
              "start": 4602,
              "end": 4649,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4654, 4657] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4658, 4667],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4668, 4671] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4672, 4695],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4696, 4699] } },
            ],
            "action": {
              "code": {
                "code": " Tuple(@immut/list.Cons($2, $4).to_array()) ",
                "utf8_pos": 4701,
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
              "start": 4700,
              "end": 4746,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4751, 4754] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4755, 4764],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4765, 4768] } },
            ],
            "action": {
              "code": {
                "code": " $2 ",
                "utf8_pos": 4770,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 4769,
              "end": 4775,
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
                  "loc": [4846, 4855],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(type_expr, Nil) ",
                "utf8_pos": 4857,
                "subst": [],
              },
              "start": 4856,
              "end": 4880,
            },
          },
          {
            "items": [
              {
                "binder": "type_expr",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4895, 4904],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4905, 4908] } },
              {
                "binder": "type_expr_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4924, 4947],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(type_expr, type_expr_list) ",
                "utf8_pos": 4949,
                "subst": [],
              },
              "start": 4948,
              "end": 4983,
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
                "term": { "$tag": "Symbol", "0": "clause", "loc": [5037, 5043] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(clause, Nil) ",
                "utf8_pos": 5045,
                "subst": [],
              },
              "start": 5044,
              "end": 5065,
            },
          },
          {
            "items": [
              {
                "binder": "clause",
                "term": { "$tag": "Symbol", "0": "clause", "loc": [5077, 5083] },
              },
              { "term": { "$tag": "Image", "0": "\"|\"", "loc": [5084, 5087] } },
              {
                "binder": "clause_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_list",
                  "loc": [5100, 5111],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(clause, clause_list) ",
                "utf8_pos": 5113,
                "subst": [],
              },
              "start": 5112,
              "end": 5141,
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
                  "loc": [5178, 5187],
                },
              },
              {
                "binder": "prec",
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_prec",
                  "loc": [5193, 5202],
                },
              },
              {
                "binder": "action",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_action",
                  "loc": [5210, 5223],
                },
              },
            ],
            "action": {
              "code": {
                "code": " { items: item_list.to_array(), prec, action } ",
                "utf8_pos": 5225,
                "subst": [],
              },
              "start": 5224,
              "end": 5273,
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
                  "loc": [5318, 5336],
                },
              },
            ],
            "action": {
              "code": {
                "code": "\n      let (code, utf8_pos, subst) = code\n      { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\n  ",
                "utf8_pos": 5338,
                "subst": [
                  { "start": 96, "end": 105, "desc": { "$tag": "StartPos" } },
                  { "start": 112, "end": 119, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 5337,
              "end": 5463,
            },
          },
          {
            "items": [],
            "action": {
              "code": {
                "code": " { code: None, start: $startpos, end: $endpos } ",
                "utf8_pos": 5469,
                "subst": [
                  { "start": 22, "end": 31, "desc": { "$tag": "StartPos" } },
                  { "start": 38, "end": 45, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 5468,
              "end": 5518,
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
                  "loc": [5549, 5556],
                },
              },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [5564, 5570] },
              },
            ],
            "action": {
              "code": {
                "code": " Some(symbol) ",
                "utf8_pos": 5572,
                "subst": [],
              },
              "start": 5571,
              "end": 5587,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 5593, "subst": [] },
              "start": 5592,
              "end": 5600,
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
                "term": { "$tag": "Symbol", "0": "item", "loc": [5654, 5658] },
              },
              {
                "binder": "item_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "item_list",
                  "loc": [5669, 5678],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(item, item_list) ",
                "utf8_pos": 5680,
                "subst": [],
              },
              "start": 5679,
              "end": 5704,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "utf8_pos": 5710, "subst": [] },
              "start": 5709,
              "end": 5716,
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
                "term": { "$tag": "Symbol", "0": "term", "loc": [5750, 5754] },
              },
            ],
            "action": {
              "code": {
                "code": " { binder: None, term: term } ",
                "utf8_pos": 5756,
                "subst": [],
              },
              "start": 5755,
              "end": 5787,
            },
          },
          {
            "items": [
              {
                "binder": "binder",
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [5799, 5804] },
              },
              { "term": { "$tag": "Image", "0": "\"=\"", "loc": [5805, 5808] } },
              {
                "binder": "term",
                "term": { "$tag": "Symbol", "0": "term", "loc": [5814, 5818] },
              },
            ],
            "action": {
              "code": {
                "code": " { binder: Some(binder), term: term } ",
                "utf8_pos": 5820,
                "subst": [],
              },
              "start": 5819,
              "end": 5859,
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
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [5889, 5895] },
              },
            ],
            "action": {
              "code": {
                "code": " Symbol(symbol, loc=($startpos, $endpos)) ",
                "utf8_pos": 5897,
                "subst": [
                  { "start": 21, "end": 30, "desc": { "$tag": "StartPos" } },
                  { "start": 32, "end": 39, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 5896,
              "end": 5940,
            },
          },
          {
            "items": [
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [5952, 5958] },
              },
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [5959, 5962] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_term_list",
                  "loc": [5963, 5987],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [5988, 5991] } },
            ],
            "action": {
              "code": {
                "code": " RuleCall(symbol, symbol_loc=($startpos(symbol), $endpos(symbol)), $3.to_array()) ",
                "utf8_pos": 5993,
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
              "start": 5992,
              "end": 6076,
            },
          },
          {
            "items": [
              {
                "binder": "image",
                "term": { "$tag": "Symbol", "0": "STRING", "loc": [6087, 6093] },
              },
            ],
            "action": {
              "code": {
                "code": " Image(image, loc=($startpos, $endpos)) ",
                "utf8_pos": 6095,
                "subst": [
                  { "start": 19, "end": 28, "desc": { "$tag": "StartPos" } },
                  { "start": 30, "end": 37, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 6094,
              "end": 6136,
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
                "term": { "$tag": "Symbol", "0": "term", "loc": [6199, 6203] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(term, Nil) ",
                "utf8_pos": 6205,
                "subst": [],
              },
              "start": 6204,
              "end": 6223,
            },
          },
          {
            "items": [
              {
                "binder": "term",
                "term": { "$tag": "Symbol", "0": "term", "loc": [6233, 6237] },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [6238, 6241] } },
              {
                "binder": "term_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_term_list",
                  "loc": [6252, 6276],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(term, term_list) ",
                "utf8_pos": 6278,
                "subst": [],
              },
              "start": 6277,
              "end": 6302,
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
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [6365, 6371] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(symbol, Nil) ",
                "utf8_pos": 6373,
                "subst": [],
              },
              "start": 6372,
              "end": 6393,
            },
          },
          {
            "items": [
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [6405, 6411] },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [6424, 6444],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(symbol, symbol_list) ",
                "utf8_pos": 6446,
                "subst": [],
              },
              "start": 6445,
              "end": 6474,
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
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [6507, 6512] },
              },
            ],
            "action": {
              "code": { "code": " ident ", "utf8_pos": 6514, "subst": [] },
              "start": 6513,
              "end": 6522,
            },
          },
        ],
      },
    ],
  })
}
