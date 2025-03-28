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
      #|IDENT("String")
      #|RANGLE
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|PERCENT_TOKEN
      #|LANGLE
      #|IDENT("String")
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
      #|LBRACE_CODE_RBRACE((" { header, decls: decl_list.to_array(), rules: rule_list.to_array(), trailer } ", 965, []))
      #|SEMI
      #|IDENT("header")
      #|ARROW
      #|IDENT("Code")
      #|QUESTION
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1112, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 1131, []))
      #|SEMI
      #|IDENT("trailer")
      #|ARROW
      #|IDENT("Code")
      #|QUESTION
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1206, []))
      #|BAR
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_PERCENT_CODE_EOF")
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1255, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 1274, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(decl, decl_list) ", 1362, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", 1392, []))
      #|SEMI
      #|IDENT("decl")
      #|ARROW
      #|IDENT("Declaration")
      #|COLON
      #|STRING("\"%start\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Start(symbol_list.to_array()) ", 1471, []))
      #|BAR
      #|STRING("\"%token\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Token(symbol_list.to_array(), type_=None) ", 1551, []))
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
      #|LBRACE_CODE_RBRACE((" Token(symbol_list.to_array(), type_=Some(type_)) ", 1667, []))
      #|BAR
      #|STRING("\"%token\"")
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Token1(symbol, type_=None, image=image) ", 1760, []))
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
      #|LBRACE_CODE_RBRACE((" Token1(symbol, type_=Some(type_), image=image) ", 1868, []))
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
      #|LBRACE_CODE_RBRACE((" Type(symbol_list.to_array(), type_=type_) ", 1988, []))
      #|BAR
      #|STRING("\"%position\"")
      #|STRING("\"<\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("type_expr")
      #|STRING("\">\"")
      #|LBRACE_CODE_RBRACE((" Position(type_=type_) ", 2074, []))
      #|BAR
      #|STRING("\"%left\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Left(symbol_list.to_array()) ", 2145, []))
      #|BAR
      #|STRING("\"%right\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Right(symbol_list.to_array()) ", 2224, []))
      #|BAR
      #|STRING("\"%nonassoc\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Nonassoc(symbol_list.to_array()) ", 2307, []))
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
      #|LBRACE_CODE_RBRACE((" Derive(traits=trait_list.to_array(), type_=type_) ", 2413, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(rule, Nil) ", 2519, []))
      #|BAR
      #|IDENT("rule")
      #|EQ
      #|IDENT("rule")
      #|IDENT("rule_list")
      #|EQ
      #|IDENT("rule_list")
      #|LBRACE_CODE_RBRACE((" Cons(rule, rule_list) ", 2573, []))
      #|SEMI
      #|IDENT("rule")
      #|ARROW
      #|IDENT("Rule")
      #|COLON
      #|IDENT("rule_no_modifiers")
      #|LBRACE_CODE_RBRACE((" $1 ", 2639, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|STRING("\"%inline\"")
      #|IDENT("rule_no_modifiers")
      #|LBRACE_CODE_RBRACE((" { ..$2, inline: true } ", 2678, [{start: 5, end: 7, desc: Dollar(2)}]))
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
      #|LBRACE_CODE_RBRACE(("\n    { inline: false, nonterminal, generic_params: [], params: [], type_, clauses: clause_list.to_array() }\n  ", 2818, []))
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
      #|LBRACE_CODE_RBRACE(("\n    { inline: false, nonterminal, generic_params, params: param_list.to_array(),  type_, clauses: clause_list.to_array() }\n  ", 3096, []))
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
      #|LBRACE_CODE_RBRACE((" Some(type_) ", 3289, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 3309, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(($1, None), Nil) ", 3396, [{start: 7, end: 9, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\":\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Cons(($1, Some($3)), Nil) ", 3446, [{start: 7, end: 9, desc: Dollar(1)}, {start: 16, end: 18, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\",\"")
      #|IDENT("nonempty_rule_param_list")
      #|LBRACE_CODE_RBRACE((" Cons(($1, None), $3) ", 3515, [{start: 7, end: 9, desc: Dollar(1)}, {start: 18, end: 20, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\":\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("nonempty_rule_param_list")
      #|LBRACE_CODE_RBRACE((" Cons(($1, Some($3)), $5) ", 3593, [{start: 7, end: 9, desc: Dollar(1)}, {start: 16, end: 18, desc: Dollar(3)}, {start: 22, end: 24, desc: Dollar(5)}]))
      #|SEMI
      #|IDENT("opt_rule_generic_params")
      #|ARROW
      #|IDENT("Array")
      #|LBRACKET
      #|IDENT("String")
      #|RBRACKET
      #|COLON
      #|LBRACE_CODE_RBRACE((" [] ", 3672, []))
      #|BAR
      #|STRING("\"[\"")
      #|IDENT("nonempty_comma_ident_list")
      #|STRING("\"]\"")
      #|LBRACE_CODE_RBRACE((" $2.to_array() ", 3717, [{start: 1, end: 3, desc: Dollar(2)}]))
      #|SEMI
      #|IDENT("nonempty_comma_ident_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|IDENT("String")
      #|RBRACKET
      #|COLON
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Cons($1, Nil) ", 3801, [{start: 6, end: 8, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\",\"")
      #|IDENT("nonempty_comma_ident_list")
      #|LBRACE_CODE_RBRACE((" Cons($1, $3) ", 3859, [{start: 6, end: 8, desc: Dollar(1)}, {start: 10, end: 12, desc: Dollar(3)}]))
      #|SEMI
      #|IDENT("type_expr")
      #|ARROW
      #|IDENT("TypeExpr")
      #|COLON
      #|IDENT("postfix_type_expr")
      #|LBRACE_CODE_RBRACE((" $1 ", 3925, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|STRING("\"(\"")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow([], $4) ", 3959, [{start: 11, end: 13, desc: Dollar(4)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow([$2], $5) ", 4014, [{start: 8, end: 10, desc: Dollar(2)}, {start: 13, end: 15, desc: Dollar(5)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow([$2], $6) ", 4075, [{start: 8, end: 10, desc: Dollar(2)}, {start: 13, end: 15, desc: Dollar(6)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow(@immut/list.Cons($2, $4).to_array(), $7) ", 4160, [{start: 24, end: 26, desc: Dollar(2)}, {start: 28, end: 30, desc: Dollar(4)}, {start: 44, end: 46, desc: Dollar(7)}]))
      #|SEMI
      #|IDENT("postfix_type_expr")
      #|ARROW
      #|IDENT("TypeExpr")
      #|COLON
      #|IDENT("basic_type_expr")
      #|LBRACE_CODE_RBRACE((" $1 ", 4266, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("postfix_type_expr")
      #|STRING("\"?\"")
      #|LBRACE_CODE_RBRACE((" Option($1) ", 4299, [{start: 8, end: 10, desc: Dollar(1)}]))
      #|SEMI
      #|IDENT("basic_type_expr")
      #|ARROW
      #|IDENT("TypeExpr")
      #|COLON
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=None, $1, []) ", 4357, [{start: 18, end: 20, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("PKG_AND_IDENT")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=Some($1.0), $1.1, []) ", 4404, [{start: 17, end: 19, desc: Dollar(1)}, {start: 24, end: 26, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\"[\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\"]\"")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=None, $1, $3.to_array()) ", 4483, [{start: 18, end: 20, desc: Dollar(1)}, {start: 22, end: 24, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("PKG_AND_IDENT")
      #|STRING("\"[\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\"]\"")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=Some($1.0), $1.1, $3.to_array()) ", 4573, [{start: 17, end: 19, desc: Dollar(1)}, {start: 24, end: 26, desc: Dollar(1)}, {start: 30, end: 32, desc: Dollar(3)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\")\"")
      #|LBRACE_CODE_RBRACE((" Tuple(@immut/list.Cons($2, $4).to_array()) ", 4671, [{start: 24, end: 26, desc: Dollar(2)}, {start: 28, end: 30, desc: Dollar(4)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\")\"")
      #|LBRACE_CODE_RBRACE((" $2 ", 4740, [{start: 1, end: 3, desc: Dollar(2)}]))
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
      #|LBRACE_CODE_RBRACE((" Cons(type_expr, Nil) ", 4827, []))
      #|BAR
      #|IDENT("type_expr")
      #|EQ
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("type_expr_list")
      #|EQ
      #|IDENT("nonempty_type_expr_list")
      #|LBRACE_CODE_RBRACE((" Cons(type_expr, type_expr_list) ", 4919, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(clause, Nil) ", 5015, []))
      #|BAR
      #|IDENT("clause")
      #|EQ
      #|IDENT("clause")
      #|STRING("\"|\"")
      #|IDENT("clause_list")
      #|EQ
      #|IDENT("clause_list")
      #|LBRACE_CODE_RBRACE((" Cons(clause, clause_list) ", 5083, []))
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
      #|LBRACE_CODE_RBRACE((" { items: item_list.to_array(), prec, action } ", 5195, []))
      #|SEMI
      #|IDENT("clause_action")
      #|ARROW
      #|IDENT("ClauseAction")
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("LBRACE_CODE_RBRACE")
      #|LBRACE_CODE_RBRACE(("\n      let (code, utf8_pos, subst) = code\n      { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\n  ", 5308, [{start: 96, end: 105, desc: StartPos}, {start: 112, end: 119, desc: EndPos}]))
      #|BAR
      #|LBRACE_CODE_RBRACE((" { code: None, start: $startpos, end: $endpos } ", 5439, [{start: 22, end: 31, desc: StartPos}, {start: 38, end: 45, desc: EndPos}]))
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
      #|LBRACE_CODE_RBRACE((" Some(symbol) ", 5542, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 5563, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(item, item_list) ", 5650, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", 5680, []))
      #|SEMI
      #|IDENT("item")
      #|ARROW
      #|IDENT("ClauseItem")
      #|COLON
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|LBRACE_CODE_RBRACE((" { binder: None, term: term } ", 5726, []))
      #|BAR
      #|IDENT("binder")
      #|EQ
      #|IDENT("IDENT")
      #|STRING("\"=\"")
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|LBRACE_CODE_RBRACE((" { binder: Some(binder), term: term } ", 5790, []))
      #|SEMI
      #|IDENT("term")
      #|ARROW
      #|IDENT("Term")
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Symbol(symbol, loc=($startpos, $endpos)) ", 5867, [{start: 21, end: 30, desc: StartPos}, {start: 32, end: 39, desc: EndPos}]))
      #|BAR
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|STRING("\"(\"")
      #|IDENT("nonempty_comma_term_list")
      #|STRING("\")\"")
      #|LBRACE_CODE_RBRACE((" RuleCall(symbol, symbol_loc=($startpos(symbol), $endpos(symbol)), $3.to_array()) ", 5963, [{start: 30, end: 47, desc: StartPosOf(Name("symbol"))}, {start: 49, end: 64, desc: EndPosOf(Name("symbol"))}, {start: 67, end: 69, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Image(image, loc=($startpos, $endpos)) ", 6065, [{start: 19, end: 28, desc: StartPos}, {start: 30, end: 37, desc: EndPos}]))
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
      #|LBRACE_CODE_RBRACE((" Cons(term, Nil) ", 6175, []))
      #|BAR
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|STRING("\",\"")
      #|IDENT("term_list")
      #|EQ
      #|IDENT("nonempty_comma_term_list")
      #|LBRACE_CODE_RBRACE((" Cons(term, term_list) ", 6248, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(symbol, Nil) ", 6343, []))
      #|BAR
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Cons(symbol, symbol_list) ", 6416, []))
      #|SEMI
      #|IDENT("symbol")
      #|ARROW
      #|IDENT("Symbol")
      #|COLON
      #|IDENT("ident")
      #|EQ
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" ident ", 6484, []))
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
        "type_": { "$tag": "Constr", "pkg": Null, "0": "String", "1": [] },
      },
      {
        "$tag": "Token",
        "0": ["PERCENT_PERCENT_CODE_EOF"],
        "type_": { "$tag": "Constr", "pkg": Null, "0": "String", "1": [] },
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
                "term": { "$tag": "Symbol", "0": "header", "loc": [892, 898] },
              },
              {
                "binder": "decl_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "decl_list",
                  "loc": [909, 918],
                },
              },
              { "term": { "$tag": "Image", "0": "\"%%\"", "loc": [919, 923] } },
              {
                "binder": "rule_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_list",
                  "loc": [934, 943],
                },
              },
              {
                "binder": "trailer",
                "term": { "$tag": "Symbol", "0": "trailer", "loc": [952, 959] },
              },
              { "term": { "$tag": "Symbol", "0": "EOF", "loc": [960, 963] } },
            ],
            "action": {
              "code": {
                "code": " { header, decls: decl_list.to_array(), rules: rule_list.to_array(), trailer } ",
                "utf8_pos": 965,
                "subst": [],
              },
              "start": 964,
              "end": 1045,
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
                  "loc": [1076, 1110],
                },
              },
            ],
            "action": {
              "code": { "code": " Some(code) ", "utf8_pos": 1112, "subst": [] },
              "start": 1111,
              "end": 1125,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 1131, "subst": [] },
              "start": 1130,
              "end": 1138,
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
                  "loc": [1170, 1204],
                },
              },
            ],
            "action": {
              "code": { "code": " Some(code) ", "utf8_pos": 1206, "subst": [] },
              "start": 1205,
              "end": 1219,
            },
          },
          {
            "items": [
              {
                "binder": "code",
                "term": {
                  "$tag": "Symbol",
                  "0": "PERCENT_PERCENT_CODE_EOF",
                  "loc": [1229, 1253],
                },
              },
            ],
            "action": {
              "code": { "code": " Some(code) ", "utf8_pos": 1255, "subst": [] },
              "start": 1254,
              "end": 1268,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 1274, "subst": [] },
              "start": 1273,
              "end": 1281,
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
                "term": { "$tag": "Symbol", "0": "decl", "loc": [1336, 1340] },
              },
              {
                "binder": "decl_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "decl_list",
                  "loc": [1351, 1360],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(decl, decl_list) ",
                "utf8_pos": 1362,
                "subst": [],
              },
              "start": 1361,
              "end": 1386,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "utf8_pos": 1392, "subst": [] },
              "start": 1391,
              "end": 1398,
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
                  "loc": [1428, 1436],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [1449, 1469],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Start(symbol_list.to_array()) ",
                "utf8_pos": 1471,
                "subst": [],
              },
              "start": 1470,
              "end": 1503,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1508, 1516],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [1529, 1549],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Token(symbol_list.to_array(), type_=None) ",
                "utf8_pos": 1551,
                "subst": [],
              },
              "start": 1550,
              "end": 1595,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1600, 1608],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [1609, 1612] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [1619, 1628],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [1629, 1632] } },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [1645, 1665],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Token(symbol_list.to_array(), type_=Some(type_)) ",
                "utf8_pos": 1667,
                "subst": [],
              },
              "start": 1666,
              "end": 1718,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1723, 1731],
                },
              },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [1739, 1745] },
              },
              {
                "binder": "image",
                "term": { "$tag": "Symbol", "0": "STRING", "loc": [1752, 1758] },
              },
            ],
            "action": {
              "code": {
                "code": " Token1(symbol, type_=None, image=image) ",
                "utf8_pos": 1760,
                "subst": [],
              },
              "start": 1759,
              "end": 1802,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1807, 1815],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [1816, 1819] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [1826, 1835],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [1836, 1839] } },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [1847, 1853] },
              },
              {
                "binder": "image",
                "term": { "$tag": "Symbol", "0": "STRING", "loc": [1860, 1866] },
              },
            ],
            "action": {
              "code": {
                "code": " Token1(symbol, type_=Some(type_), image=image) ",
                "utf8_pos": 1868,
                "subst": [],
              },
              "start": 1867,
              "end": 1917,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%type\"",
                  "loc": [1922, 1929],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [1930, 1933] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [1940, 1949],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [1950, 1953] } },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [1966, 1986],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Type(symbol_list.to_array(), type_=type_) ",
                "utf8_pos": 1988,
                "subst": [],
              },
              "start": 1987,
              "end": 2032,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%position\"",
                  "loc": [2037, 2048],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [2049, 2052] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [2059, 2068],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [2069, 2072] } },
            ],
            "action": {
              "code": {
                "code": " Position(type_=type_) ",
                "utf8_pos": 2074,
                "subst": [],
              },
              "start": 2073,
              "end": 2098,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%left\"",
                  "loc": [2103, 2110],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2123, 2143],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Left(symbol_list.to_array()) ",
                "utf8_pos": 2145,
                "subst": [],
              },
              "start": 2144,
              "end": 2176,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%right\"",
                  "loc": [2181, 2189],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2202, 2222],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Right(symbol_list.to_array()) ",
                "utf8_pos": 2224,
                "subst": [],
              },
              "start": 2223,
              "end": 2256,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%nonassoc\"",
                  "loc": [2261, 2272],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2285, 2305],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Nonassoc(symbol_list.to_array()) ",
                "utf8_pos": 2307,
                "subst": [],
              },
              "start": 2306,
              "end": 2342,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%derive\"",
                  "loc": [2347, 2356],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [2357, 2360] } },
              {
                "binder": "trait_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [2372, 2395],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [2396, 2399] } },
              {
                "binder": "type_",
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [2406, 2411] },
              },
            ],
            "action": {
              "code": {
                "code": " Derive(traits=trait_list.to_array(), type_=type_) ",
                "utf8_pos": 2413,
                "subst": [],
              },
              "start": 2412,
              "end": 2465,
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
                "term": { "$tag": "Symbol", "0": "rule", "loc": [2513, 2517] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(rule, Nil) ",
                "utf8_pos": 2519,
                "subst": [],
              },
              "start": 2518,
              "end": 2537,
            },
          },
          {
            "items": [
              {
                "binder": "rule",
                "term": { "$tag": "Symbol", "0": "rule", "loc": [2547, 2551] },
              },
              {
                "binder": "rule_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_list",
                  "loc": [2562, 2571],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(rule, rule_list) ",
                "utf8_pos": 2573,
                "subst": [],
              },
              "start": 2572,
              "end": 2597,
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
                  "loc": [2620, 2637],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 2639,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 2638,
              "end": 2644,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%inline\"",
                  "loc": [2649, 2658],
                },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_no_modifiers",
                  "loc": [2659, 2676],
                },
              },
            ],
            "action": {
              "code": {
                "code": " { ..$2, inline: true } ",
                "utf8_pos": 2678,
                "subst": [
                  { "start": 5, "end": 7, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 2677,
              "end": 2703,
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
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [2751, 2757] },
              },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "opt_rule_return_type",
                  "loc": [2764, 2784],
                },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [2785, 2788] } },
              {
                "binder": "clause_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_list",
                  "loc": [2801, 2812],
                },
              },
              { "term": { "$tag": "Image", "0": "\";\"", "loc": [2813, 2816] } },
            ],
            "action": {
              "code": {
                "code": "\n    { inline: false, nonterminal, generic_params: [], params: [], type_, clauses: clause_list.to_array() }\n  ",
                "utf8_pos": 2818,
                "subst": [],
              },
              "start": 2817,
              "end": 2929,
            },
          },
          {
            "items": [
              {
                "binder": "nonterminal",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [2946, 2952] },
              },
              {
                "binder": "generic_params",
                "term": {
                  "$tag": "Symbol",
                  "0": "opt_rule_generic_params",
                  "loc": [2968, 2991],
                },
              },
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [2992, 2995] } },
              {
                "binder": "param_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_rule_param_list",
                  "loc": [3007, 3031],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [3032, 3035] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "opt_rule_return_type",
                  "loc": [3042, 3062],
                },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [3063, 3066] } },
              {
                "binder": "clause_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_list",
                  "loc": [3079, 3090],
                },
              },
              { "term": { "$tag": "Image", "0": "\";\"", "loc": [3091, 3094] } },
            ],
            "action": {
              "code": {
                "code": "\n    { inline: false, nonterminal, generic_params, params: param_list.to_array(),  type_, clauses: clause_list.to_array() }\n  ",
                "utf8_pos": 3096,
                "subst": [],
              },
              "start": 3095,
              "end": 3223,
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
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [3267, 3271] },
              },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3278, 3287],
                },
              },
            ],
            "action": {
              "code": { "code": " Some(type_) ", "utf8_pos": 3289, "subst": [] },
              "start": 3288,
              "end": 3303,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 3309, "subst": [] },
              "start": 3308,
              "end": 3316,
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
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3389, 3394] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, None), Nil) ",
                "utf8_pos": 3396,
                "subst": [
                  { "start": 7, "end": 9, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 3395,
              "end": 3420,
            },
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3425, 3430] },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [3431, 3434] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3435, 3444],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, Some($3)), Nil) ",
                "utf8_pos": 3446,
                "subst": [
                  { "start": 7, "end": 9, "desc": { "$tag": "Dollar", "0": 1 } },
                  {
                    "start": 16,
                    "end": 18,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 3445,
              "end": 3474,
            },
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3479, 3484] },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [3485, 3488] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_rule_param_list",
                  "loc": [3489, 3513],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, None), $3) ",
                "utf8_pos": 3515,
                "subst": [
                  { "start": 7, "end": 9, "desc": { "$tag": "Dollar", "0": 1 } },
                  {
                    "start": 18,
                    "end": 20,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 3514,
              "end": 3538,
            },
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3543, 3548] },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [3549, 3552] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3553, 3562],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [3563, 3566] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_rule_param_list",
                  "loc": [3567, 3591],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, Some($3)), $5) ",
                "utf8_pos": 3593,
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
              "start": 3592,
              "end": 3620,
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
              "code": { "code": " [] ", "utf8_pos": 3672, "subst": [] },
              "start": 3671,
              "end": 3677,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"[\"", "loc": [3682, 3685] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_ident_list",
                  "loc": [3686, 3711],
                },
              },
              { "term": { "$tag": "Image", "0": "\"]\"", "loc": [3712, 3715] } },
            ],
            "action": {
              "code": {
                "code": " $2.to_array() ",
                "utf8_pos": 3717,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 3716,
              "end": 3733,
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
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3794, 3799] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons($1, Nil) ",
                "utf8_pos": 3801,
                "subst": [
                  { "start": 6, "end": 8, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 3800,
              "end": 3817,
            },
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3822, 3827] },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [3828, 3831] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_ident_list",
                  "loc": [3832, 3857],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons($1, $3) ",
                "utf8_pos": 3859,
                "subst": [
                  { "start": 6, "end": 8, "desc": { "$tag": "Dollar", "0": 1 } },
                  {
                    "start": 10,
                    "end": 12,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 3858,
              "end": 3874,
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
                  "loc": [3906, 3923],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 3925,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 3924,
              "end": 3930,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [3935, 3938] } },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [3939, 3942] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [3943, 3947] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3948, 3957],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow([], $4) ",
                "utf8_pos": 3959,
                "subst": [
                  {
                    "start": 11,
                    "end": 13,
                    "desc": { "$tag": "Dollar", "0": 4 },
                  },
                ],
              },
              "start": 3958,
              "end": 3975,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [3980, 3983] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3984, 3993],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [3994, 3997] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [3998, 4002] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4003, 4012],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow([$2], $5) ",
                "utf8_pos": 4014,
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
              "start": 4013,
              "end": 4032,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4037, 4040] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4041, 4050],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4051, 4054] } },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4055, 4058] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [4059, 4063] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4064, 4073],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow([$2], $6) ",
                "utf8_pos": 4075,
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
              "start": 4074,
              "end": 4093,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4098, 4101] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4102, 4111],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4112, 4115] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4116, 4139],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4140, 4143] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [4144, 4148] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4149, 4158],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow(@immut/list.Cons($2, $4).to_array(), $7) ",
                "utf8_pos": 4160,
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
              "start": 4159,
              "end": 4209,
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
                  "loc": [4249, 4264],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 4266,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 4265,
              "end": 4271,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "postfix_type_expr",
                  "loc": [4276, 4293],
                },
              },
              { "term": { "$tag": "Image", "0": "\"?\"", "loc": [4294, 4297] } },
            ],
            "action": {
              "code": {
                "code": " Option($1) ",
                "utf8_pos": 4299,
                "subst": [
                  {
                    "start": 8,
                    "end": 10,
                    "desc": { "$tag": "Dollar", "0": 1 },
                  },
                ],
              },
              "start": 4298,
              "end": 4312,
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
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [4350, 4355] },
              },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=None, $1, []) ",
                "utf8_pos": 4357,
                "subst": [
                  {
                    "start": 18,
                    "end": 20,
                    "desc": { "$tag": "Dollar", "0": 1 },
                  },
                ],
              },
              "start": 4356,
              "end": 4384,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "PKG_AND_IDENT",
                  "loc": [4389, 4402],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=Some($1.0), $1.1, []) ",
                "utf8_pos": 4404,
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
              "start": 4403,
              "end": 4439,
            },
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [4444, 4449] },
              },
              { "term": { "$tag": "Image", "0": "\"[\"", "loc": [4450, 4453] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4454, 4477],
                },
              },
              { "term": { "$tag": "Image", "0": "\"]\"", "loc": [4478, 4481] } },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=None, $1, $3.to_array()) ",
                "utf8_pos": 4483,
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
              "start": 4482,
              "end": 4521,
            },
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "PKG_AND_IDENT",
                  "loc": [4526, 4539],
                },
              },
              { "term": { "$tag": "Image", "0": "\"[\"", "loc": [4540, 4543] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4544, 4567],
                },
              },
              { "term": { "$tag": "Image", "0": "\"]\"", "loc": [4568, 4571] } },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=Some($1.0), $1.1, $3.to_array()) ",
                "utf8_pos": 4573,
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
              "start": 4572,
              "end": 4619,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4624, 4627] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4628, 4637],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4638, 4641] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4642, 4665],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4666, 4669] } },
            ],
            "action": {
              "code": {
                "code": " Tuple(@immut/list.Cons($2, $4).to_array()) ",
                "utf8_pos": 4671,
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
              "start": 4670,
              "end": 4716,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4721, 4724] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4725, 4734],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4735, 4738] } },
            ],
            "action": {
              "code": {
                "code": " $2 ",
                "utf8_pos": 4740,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 4739,
              "end": 4745,
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
                  "loc": [4816, 4825],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(type_expr, Nil) ",
                "utf8_pos": 4827,
                "subst": [],
              },
              "start": 4826,
              "end": 4850,
            },
          },
          {
            "items": [
              {
                "binder": "type_expr",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4865, 4874],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4875, 4878] } },
              {
                "binder": "type_expr_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4894, 4917],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(type_expr, type_expr_list) ",
                "utf8_pos": 4919,
                "subst": [],
              },
              "start": 4918,
              "end": 4953,
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
                "term": { "$tag": "Symbol", "0": "clause", "loc": [5007, 5013] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(clause, Nil) ",
                "utf8_pos": 5015,
                "subst": [],
              },
              "start": 5014,
              "end": 5035,
            },
          },
          {
            "items": [
              {
                "binder": "clause",
                "term": { "$tag": "Symbol", "0": "clause", "loc": [5047, 5053] },
              },
              { "term": { "$tag": "Image", "0": "\"|\"", "loc": [5054, 5057] } },
              {
                "binder": "clause_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_list",
                  "loc": [5070, 5081],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(clause, clause_list) ",
                "utf8_pos": 5083,
                "subst": [],
              },
              "start": 5082,
              "end": 5111,
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
                  "loc": [5148, 5157],
                },
              },
              {
                "binder": "prec",
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_prec",
                  "loc": [5163, 5172],
                },
              },
              {
                "binder": "action",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_action",
                  "loc": [5180, 5193],
                },
              },
            ],
            "action": {
              "code": {
                "code": " { items: item_list.to_array(), prec, action } ",
                "utf8_pos": 5195,
                "subst": [],
              },
              "start": 5194,
              "end": 5243,
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
                  "loc": [5288, 5306],
                },
              },
            ],
            "action": {
              "code": {
                "code": "\n      let (code, utf8_pos, subst) = code\n      { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\n  ",
                "utf8_pos": 5308,
                "subst": [
                  { "start": 96, "end": 105, "desc": { "$tag": "StartPos" } },
                  { "start": 112, "end": 119, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 5307,
              "end": 5433,
            },
          },
          {
            "items": [],
            "action": {
              "code": {
                "code": " { code: None, start: $startpos, end: $endpos } ",
                "utf8_pos": 5439,
                "subst": [
                  { "start": 22, "end": 31, "desc": { "$tag": "StartPos" } },
                  { "start": 38, "end": 45, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 5438,
              "end": 5488,
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
                  "loc": [5519, 5526],
                },
              },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [5534, 5540] },
              },
            ],
            "action": {
              "code": {
                "code": " Some(symbol) ",
                "utf8_pos": 5542,
                "subst": [],
              },
              "start": 5541,
              "end": 5557,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 5563, "subst": [] },
              "start": 5562,
              "end": 5570,
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
                "term": { "$tag": "Symbol", "0": "item", "loc": [5624, 5628] },
              },
              {
                "binder": "item_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "item_list",
                  "loc": [5639, 5648],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(item, item_list) ",
                "utf8_pos": 5650,
                "subst": [],
              },
              "start": 5649,
              "end": 5674,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "utf8_pos": 5680, "subst": [] },
              "start": 5679,
              "end": 5686,
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
                "term": { "$tag": "Symbol", "0": "term", "loc": [5720, 5724] },
              },
            ],
            "action": {
              "code": {
                "code": " { binder: None, term: term } ",
                "utf8_pos": 5726,
                "subst": [],
              },
              "start": 5725,
              "end": 5757,
            },
          },
          {
            "items": [
              {
                "binder": "binder",
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [5769, 5774] },
              },
              { "term": { "$tag": "Image", "0": "\"=\"", "loc": [5775, 5778] } },
              {
                "binder": "term",
                "term": { "$tag": "Symbol", "0": "term", "loc": [5784, 5788] },
              },
            ],
            "action": {
              "code": {
                "code": " { binder: Some(binder), term: term } ",
                "utf8_pos": 5790,
                "subst": [],
              },
              "start": 5789,
              "end": 5829,
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
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [5859, 5865] },
              },
            ],
            "action": {
              "code": {
                "code": " Symbol(symbol, loc=($startpos, $endpos)) ",
                "utf8_pos": 5867,
                "subst": [
                  { "start": 21, "end": 30, "desc": { "$tag": "StartPos" } },
                  { "start": 32, "end": 39, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 5866,
              "end": 5910,
            },
          },
          {
            "items": [
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [5922, 5928] },
              },
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [5929, 5932] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_term_list",
                  "loc": [5933, 5957],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [5958, 5961] } },
            ],
            "action": {
              "code": {
                "code": " RuleCall(symbol, symbol_loc=($startpos(symbol), $endpos(symbol)), $3.to_array()) ",
                "utf8_pos": 5963,
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
              "start": 5962,
              "end": 6046,
            },
          },
          {
            "items": [
              {
                "binder": "image",
                "term": { "$tag": "Symbol", "0": "STRING", "loc": [6057, 6063] },
              },
            ],
            "action": {
              "code": {
                "code": " Image(image, loc=($startpos, $endpos)) ",
                "utf8_pos": 6065,
                "subst": [
                  { "start": 19, "end": 28, "desc": { "$tag": "StartPos" } },
                  { "start": 30, "end": 37, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 6064,
              "end": 6106,
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
                "term": { "$tag": "Symbol", "0": "term", "loc": [6169, 6173] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(term, Nil) ",
                "utf8_pos": 6175,
                "subst": [],
              },
              "start": 6174,
              "end": 6193,
            },
          },
          {
            "items": [
              {
                "binder": "term",
                "term": { "$tag": "Symbol", "0": "term", "loc": [6203, 6207] },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [6208, 6211] } },
              {
                "binder": "term_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_term_list",
                  "loc": [6222, 6246],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(term, term_list) ",
                "utf8_pos": 6248,
                "subst": [],
              },
              "start": 6247,
              "end": 6272,
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
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [6335, 6341] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(symbol, Nil) ",
                "utf8_pos": 6343,
                "subst": [],
              },
              "start": 6342,
              "end": 6363,
            },
          },
          {
            "items": [
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [6375, 6381] },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [6394, 6414],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(symbol, symbol_list) ",
                "utf8_pos": 6416,
                "subst": [],
              },
              "start": 6415,
              "end": 6444,
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
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [6477, 6482] },
              },
            ],
            "action": {
              "code": { "code": " ident ", "utf8_pos": 6484, "subst": [] },
              "start": 6483,
              "end": 6492,
            },
          },
        ],
      },
    ],
  })
}
