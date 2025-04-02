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
      #|PKG_AND_IDENT(("ast", "SubstItem"))
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
      #|PKG_AND_IDENT(("ast", "ParserSpec"))
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
      #|LBRACE_CODE_RBRACE((" { header, decls: decl_list.to_array(), rules: rule_list.to_array(), trailer } ", 999, []))
      #|SEMI
      #|IDENT("header")
      #|ARROW
      #|LPAREN
      #|PKG_AND_IDENT(("ast", "Code"))
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
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1163, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 1182, []))
      #|SEMI
      #|IDENT("trailer")
      #|ARROW
      #|LPAREN
      #|PKG_AND_IDENT(("ast", "Code"))
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
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1274, []))
      #|BAR
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_PERCENT_CODE_EOF")
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1323, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 1342, []))
      #|SEMI
      #|IDENT("decl_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|PKG_AND_IDENT(("ast", "Declaration"))
      #|RBRACKET
      #|COLON
      #|IDENT("decl")
      #|EQ
      #|IDENT("decl")
      #|IDENT("decl_list")
      #|EQ
      #|IDENT("decl_list")
      #|LBRACE_CODE_RBRACE((" Cons(decl, decl_list) ", 1435, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", 1465, []))
      #|SEMI
      #|IDENT("decl")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "Declaration"))
      #|COLON
      #|STRING("\"%start\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Start(symbol_list.to_array()) ", 1549, []))
      #|BAR
      #|STRING("\"%token\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Token(symbol_list.to_array(), type_=None) ", 1629, []))
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
      #|LBRACE_CODE_RBRACE((" Token(symbol_list.to_array(), type_=Some(type_)) ", 1745, []))
      #|BAR
      #|STRING("\"%token\"")
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Token1(symbol, type_=None, image=image) ", 1838, []))
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
      #|LBRACE_CODE_RBRACE((" Token1(symbol, type_=Some(type_), image=image) ", 1946, []))
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
      #|LBRACE_CODE_RBRACE((" Type(symbol_list.to_array(), type_=type_) ", 2066, []))
      #|BAR
      #|STRING("\"%position\"")
      #|STRING("\"<\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("type_expr")
      #|STRING("\">\"")
      #|LBRACE_CODE_RBRACE((" Position(type_=type_) ", 2152, []))
      #|BAR
      #|STRING("\"%left\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Left(symbol_list.to_array()) ", 2223, []))
      #|BAR
      #|STRING("\"%right\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Right(symbol_list.to_array()) ", 2302, []))
      #|BAR
      #|STRING("\"%nonassoc\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Nonassoc(symbol_list.to_array()) ", 2385, []))
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
      #|LBRACE_CODE_RBRACE((" Derive(traits=trait_list.to_array(), type_=type_) ", 2491, []))
      #|SEMI
      #|IDENT("rule_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|PKG_AND_IDENT(("ast", "Rule"))
      #|RBRACKET
      #|COLON
      #|IDENT("rule")
      #|EQ
      #|IDENT("rule")
      #|LBRACE_CODE_RBRACE((" Cons(rule, Nil) ", 2602, []))
      #|BAR
      #|IDENT("rule")
      #|EQ
      #|IDENT("rule")
      #|IDENT("rule_list")
      #|EQ
      #|IDENT("rule_list")
      #|LBRACE_CODE_RBRACE((" Cons(rule, rule_list) ", 2656, []))
      #|SEMI
      #|IDENT("rule")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "Rule"))
      #|COLON
      #|IDENT("rule_no_modifiers")
      #|LBRACE_CODE_RBRACE((" $1 ", 2727, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|STRING("\"%inline\"")
      #|IDENT("rule_no_modifiers")
      #|LBRACE_CODE_RBRACE((" { ..$2, inline: true } ", 2766, [{start: 5, end: 7, desc: Dollar(2)}]))
      #|SEMI
      #|IDENT("rule_no_modifiers")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "Rule"))
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
      #|IDENT("option")
      #|LPAREN
      #|STRING("\";\"")
      #|RPAREN
      #|LBRACE_CODE_RBRACE(("\n    { inline: false, nonterminal, generic_params: [], params: [], type_, clauses: clause_list.to_array() }\n  ", 2919, []))
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
      #|IDENT("option")
      #|LPAREN
      #|STRING("\";\"")
      #|RPAREN
      #|LBRACE_CODE_RBRACE(("\n    { inline: false, nonterminal, generic_params, params: param_list.to_array(),  type_, clauses: clause_list.to_array() }\n  ", 3205, []))
      #|SEMI
      #|IDENT("opt_rule_return_type")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "TypeExpr"))
      #|QUESTION
      #|COLON
      #|STRING("\"->\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Some(type_) ", 3403, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 3423, []))
      #|SEMI
      #|IDENT("nonempty_rule_param_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|LPAREN
      #|IDENT("String")
      #|COMMA
      #|PKG_AND_IDENT(("ast", "TypeExpr"))
      #|QUESTION
      #|RPAREN
      #|RBRACKET
      #|COLON
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Cons(($1, None), Nil) ", 3515, [{start: 7, end: 9, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\":\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Cons(($1, Some($3)), Nil) ", 3565, [{start: 7, end: 9, desc: Dollar(1)}, {start: 16, end: 18, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\",\"")
      #|IDENT("nonempty_rule_param_list")
      #|LBRACE_CODE_RBRACE((" Cons(($1, None), $3) ", 3634, [{start: 7, end: 9, desc: Dollar(1)}, {start: 18, end: 20, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\":\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("nonempty_rule_param_list")
      #|LBRACE_CODE_RBRACE((" Cons(($1, Some($3)), $5) ", 3712, [{start: 7, end: 9, desc: Dollar(1)}, {start: 16, end: 18, desc: Dollar(3)}, {start: 22, end: 24, desc: Dollar(5)}]))
      #|SEMI
      #|IDENT("opt_rule_generic_params")
      #|ARROW
      #|IDENT("Array")
      #|LBRACKET
      #|IDENT("String")
      #|RBRACKET
      #|COLON
      #|LBRACE_CODE_RBRACE((" [] ", 3791, []))
      #|BAR
      #|STRING("\"[\"")
      #|IDENT("nonempty_comma_ident_list")
      #|STRING("\"]\"")
      #|LBRACE_CODE_RBRACE((" $2.to_array() ", 3836, [{start: 1, end: 3, desc: Dollar(2)}]))
      #|SEMI
      #|IDENT("nonempty_comma_ident_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|IDENT("String")
      #|RBRACKET
      #|COLON
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Cons($1, Nil) ", 3920, [{start: 6, end: 8, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\",\"")
      #|IDENT("nonempty_comma_ident_list")
      #|LBRACE_CODE_RBRACE((" Cons($1, $3) ", 3978, [{start: 6, end: 8, desc: Dollar(1)}, {start: 10, end: 12, desc: Dollar(3)}]))
      #|SEMI
      #|IDENT("type_expr")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "TypeExpr"))
      #|COLON
      #|IDENT("postfix_type_expr")
      #|LBRACE_CODE_RBRACE((" $1 ", 4049, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|STRING("\"(\"")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow([], $4) ", 4083, [{start: 11, end: 13, desc: Dollar(4)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow([$2], $5) ", 4138, [{start: 8, end: 10, desc: Dollar(2)}, {start: 13, end: 15, desc: Dollar(5)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow([$2], $6) ", 4199, [{start: 8, end: 10, desc: Dollar(2)}, {start: 13, end: 15, desc: Dollar(6)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow(@immut/list.Cons($2, $4).to_array(), $7) ", 4284, [{start: 24, end: 26, desc: Dollar(2)}, {start: 28, end: 30, desc: Dollar(4)}, {start: 44, end: 46, desc: Dollar(7)}]))
      #|SEMI
      #|IDENT("postfix_type_expr")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "TypeExpr"))
      #|COLON
      #|IDENT("basic_type_expr")
      #|LBRACE_CODE_RBRACE((" $1 ", 4395, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("postfix_type_expr")
      #|STRING("\"?\"")
      #|LBRACE_CODE_RBRACE((" Option($1) ", 4428, [{start: 8, end: 10, desc: Dollar(1)}]))
      #|SEMI
      #|IDENT("basic_type_expr")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "TypeExpr"))
      #|COLON
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=None, $1, []) ", 4491, [{start: 18, end: 20, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("PKG_AND_IDENT")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=Some($1.0), $1.1, []) ", 4538, [{start: 17, end: 19, desc: Dollar(1)}, {start: 24, end: 26, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\"[\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\"]\"")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=None, $1, $3.to_array()) ", 4617, [{start: 18, end: 20, desc: Dollar(1)}, {start: 22, end: 24, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("PKG_AND_IDENT")
      #|STRING("\"[\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\"]\"")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=Some($1.0), $1.1, $3.to_array()) ", 4707, [{start: 17, end: 19, desc: Dollar(1)}, {start: 24, end: 26, desc: Dollar(1)}, {start: 30, end: 32, desc: Dollar(3)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\")\"")
      #|LBRACE_CODE_RBRACE((" Tuple(@immut/list.Cons($2, $4).to_array()) ", 4805, [{start: 24, end: 26, desc: Dollar(2)}, {start: 28, end: 30, desc: Dollar(4)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\")\"")
      #|LBRACE_CODE_RBRACE((" $2 ", 4874, [{start: 1, end: 3, desc: Dollar(2)}]))
      #|SEMI
      #|IDENT("nonempty_type_expr_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|PKG_AND_IDENT(("ast", "TypeExpr"))
      #|RBRACKET
      #|COLON
      #|IDENT("type_expr")
      #|EQ
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Cons(type_expr, Nil) ", 4966, []))
      #|BAR
      #|IDENT("type_expr")
      #|EQ
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("type_expr_list")
      #|EQ
      #|IDENT("nonempty_type_expr_list")
      #|LBRACE_CODE_RBRACE((" Cons(type_expr, type_expr_list) ", 5058, []))
      #|SEMI
      #|IDENT("clause_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|PKG_AND_IDENT(("ast", "Clause"))
      #|RBRACKET
      #|COLON
      #|STRING("\"|\"")
      #|IDENT("nonempty_clause_list")
      #|LBRACE_CODE_RBRACE((" $2 ", 5170, [{start: 1, end: 3, desc: Dollar(2)}]))
      #|BAR
      #|IDENT("nonempty_clause_list")
      #|LBRACE_CODE_RBRACE((" $1 ", 5202, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|SEMI
      #|IDENT("nonempty_clause_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|PKG_AND_IDENT(("ast", "Clause"))
      #|RBRACKET
      #|COLON
      #|IDENT("clause")
      #|EQ
      #|IDENT("clause")
      #|LBRACE_CODE_RBRACE((" Cons(clause, Nil) ", 5283, []))
      #|BAR
      #|IDENT("clause")
      #|EQ
      #|IDENT("clause")
      #|STRING("\"|\"")
      #|IDENT("clause_list")
      #|EQ
      #|IDENT("nonempty_clause_list")
      #|LBRACE_CODE_RBRACE((" Cons(clause, clause_list) ", 5360, []))
      #|SEMI
      #|IDENT("clause")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "Clause"))
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
      #|LBRACE_CODE_RBRACE((" { items: item_list.to_array(), prec, action, loc: ($startpos, $endpos - $startpos) } ", 5477, [{start: 52, end: 61, desc: StartPos}, {start: 63, end: 70, desc: EndPos}, {start: 73, end: 82, desc: StartPos}]))
      #|SEMI
      #|IDENT("clause_action")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "ClauseAction"))
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("LBRACE_CODE_RBRACE")
      #|LBRACE_CODE_RBRACE(("\n      let (code, utf8_pos, subst) = code\n      { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\n  ", 5634, [{start: 96, end: 105, desc: StartPos}, {start: 112, end: 119, desc: EndPos}]))
      #|SEMI
      #|IDENT("rule_prec")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "Symbol"))
      #|QUESTION
      #|COLON
      #|STRING("\"%prec\"")
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Some(symbol) ", 5818, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 5839, []))
      #|SEMI
      #|IDENT("item_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|PKG_AND_IDENT(("ast", "ClauseItem"))
      #|RBRACKET
      #|COLON
      #|IDENT("item")
      #|EQ
      #|IDENT("item")
      #|IDENT("item_list")
      #|EQ
      #|IDENT("item_list")
      #|LBRACE_CODE_RBRACE((" Cons(item, item_list) ", 5931, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", 5961, []))
      #|SEMI
      #|IDENT("item")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "ClauseItem"))
      #|COLON
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|LBRACE_CODE_RBRACE((" { binder: None, term: term } ", 6012, []))
      #|BAR
      #|IDENT("binder")
      #|EQ
      #|IDENT("IDENT")
      #|STRING("\"=\"")
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|LBRACE_CODE_RBRACE((" { binder: Some(binder), term: term } ", 6076, []))
      #|SEMI
      #|IDENT("term")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "Term"))
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Symbol(symbol, loc=($startpos, $endpos)) ", 6158, [{start: 21, end: 30, desc: StartPos}, {start: 32, end: 39, desc: EndPos}]))
      #|BAR
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|STRING("\"(\"")
      #|IDENT("nonempty_comma_term_list")
      #|STRING("\")\"")
      #|LBRACE_CODE_RBRACE((" RuleCall(symbol, symbol_loc=($startpos(symbol), $endpos(symbol)), $3.to_array()) ", 6254, [{start: 30, end: 47, desc: StartPosOf(Name("symbol"))}, {start: 49, end: 64, desc: EndPosOf(Name("symbol"))}, {start: 67, end: 69, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Image(image, loc=($startpos, $endpos)) ", 6356, [{start: 19, end: 28, desc: StartPos}, {start: 30, end: 37, desc: EndPos}]))
      #|SEMI
      #|IDENT("nonempty_comma_term_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|PKG_AND_IDENT(("ast", "Term"))
      #|RBRACKET
      #|COLON
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|LBRACE_CODE_RBRACE((" Cons(term, Nil) ", 6471, []))
      #|BAR
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|STRING("\",\"")
      #|IDENT("term_list")
      #|EQ
      #|IDENT("nonempty_comma_term_list")
      #|LBRACE_CODE_RBRACE((" Cons(term, term_list) ", 6544, []))
      #|SEMI
      #|IDENT("nonempty_symbol_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|PKG_AND_IDENT(("ast", "Symbol"))
      #|RBRACKET
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Cons(symbol, Nil) ", 6644, []))
      #|BAR
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Cons(symbol, symbol_list) ", 6717, []))
      #|SEMI
      #|IDENT("symbol")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "Symbol"))
      #|COLON
      #|IDENT("ident")
      #|EQ
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" ident ", 6790, []))
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
                { "$tag": "Constr", "pkg": "ast", "0": "SubstItem", "1": [] },
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
        "type_": { "$tag": "Constr", "pkg": "ast", "0": "ParserSpec", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "header",
                "term": { "$tag": "Symbol", "0": "header", "loc": [926, 932] },
              },
              {
                "binder": "decl_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "decl_list",
                  "loc": [943, 952],
                },
              },
              { "term": { "$tag": "Image", "0": "\"%%\"", "loc": [953, 957] } },
              {
                "binder": "rule_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_list",
                  "loc": [968, 977],
                },
              },
              {
                "binder": "trailer",
                "term": { "$tag": "Symbol", "0": "trailer", "loc": [986, 993] },
              },
              { "term": { "$tag": "Symbol", "0": "EOF", "loc": [994, 997] } },
            ],
            "action": {
              "code": {
                "code": " { header, decls: decl_list.to_array(), rules: rule_list.to_array(), trailer } ",
                "utf8_pos": 999,
                "subst": [],
              },
              "start": 998,
              "end": 1079,
            },
            "loc": [919, 160],
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
              { "$tag": "Constr", "pkg": "ast", "0": "Code", "1": [] },
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
                  "loc": [1127, 1161],
                },
              },
            ],
            "action": {
              "code": { "code": " Some(code) ", "utf8_pos": 1163, "subst": [] },
              "start": 1162,
              "end": 1176,
            },
            "loc": [1122, 54],
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 1182, "subst": [] },
              "start": 1181,
              "end": 1189,
            },
            "loc": [1180, 9],
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
              { "$tag": "Constr", "pkg": "ast", "0": "Code", "1": [] },
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
                  "loc": [1238, 1272],
                },
              },
            ],
            "action": {
              "code": { "code": " Some(code) ", "utf8_pos": 1274, "subst": [] },
              "start": 1273,
              "end": 1287,
            },
            "loc": [1233, 54],
          },
          {
            "items": [
              {
                "binder": "code",
                "term": {
                  "$tag": "Symbol",
                  "0": "PERCENT_PERCENT_CODE_EOF",
                  "loc": [1297, 1321],
                },
              },
            ],
            "action": {
              "code": { "code": " Some(code) ", "utf8_pos": 1323, "subst": [] },
              "start": 1322,
              "end": 1336,
            },
            "loc": [1292, 44],
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 1342, "subst": [] },
              "start": 1341,
              "end": 1349,
            },
            "loc": [1340, 9],
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
          "1": [{ "$tag": "Constr", "pkg": "ast", "0": "Declaration", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "decl",
                "term": { "$tag": "Symbol", "0": "decl", "loc": [1409, 1413] },
              },
              {
                "binder": "decl_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "decl_list",
                  "loc": [1424, 1433],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(decl, decl_list) ",
                "utf8_pos": 1435,
                "subst": [],
              },
              "start": 1434,
              "end": 1459,
            },
            "loc": [1404, 55],
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "utf8_pos": 1465, "subst": [] },
              "start": 1464,
              "end": 1471,
            },
            "loc": [1463, 8],
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "decl",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": "ast", "0": "Declaration", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%start\"",
                  "loc": [1506, 1514],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [1527, 1547],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Start(symbol_list.to_array()) ",
                "utf8_pos": 1549,
                "subst": [],
              },
              "start": 1548,
              "end": 1581,
            },
            "loc": [1506, 75],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1586, 1594],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [1607, 1627],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Token(symbol_list.to_array(), type_=None) ",
                "utf8_pos": 1629,
                "subst": [],
              },
              "start": 1628,
              "end": 1673,
            },
            "loc": [1586, 87],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1678, 1686],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [1687, 1690] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [1697, 1706],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [1707, 1710] } },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [1723, 1743],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Token(symbol_list.to_array(), type_=Some(type_)) ",
                "utf8_pos": 1745,
                "subst": [],
              },
              "start": 1744,
              "end": 1796,
            },
            "loc": [1678, 118],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1801, 1809],
                },
              },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [1817, 1823] },
              },
              {
                "binder": "image",
                "term": { "$tag": "Symbol", "0": "STRING", "loc": [1830, 1836] },
              },
            ],
            "action": {
              "code": {
                "code": " Token1(symbol, type_=None, image=image) ",
                "utf8_pos": 1838,
                "subst": [],
              },
              "start": 1837,
              "end": 1880,
            },
            "loc": [1801, 79],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1885, 1893],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [1894, 1897] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [1904, 1913],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [1914, 1917] } },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [1925, 1931] },
              },
              {
                "binder": "image",
                "term": { "$tag": "Symbol", "0": "STRING", "loc": [1938, 1944] },
              },
            ],
            "action": {
              "code": {
                "code": " Token1(symbol, type_=Some(type_), image=image) ",
                "utf8_pos": 1946,
                "subst": [],
              },
              "start": 1945,
              "end": 1995,
            },
            "loc": [1885, 110],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%type\"",
                  "loc": [2000, 2007],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [2008, 2011] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [2018, 2027],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [2028, 2031] } },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2044, 2064],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Type(symbol_list.to_array(), type_=type_) ",
                "utf8_pos": 2066,
                "subst": [],
              },
              "start": 2065,
              "end": 2110,
            },
            "loc": [2000, 110],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%position\"",
                  "loc": [2115, 2126],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [2127, 2130] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [2137, 2146],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [2147, 2150] } },
            ],
            "action": {
              "code": {
                "code": " Position(type_=type_) ",
                "utf8_pos": 2152,
                "subst": [],
              },
              "start": 2151,
              "end": 2176,
            },
            "loc": [2115, 61],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%left\"",
                  "loc": [2181, 2188],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2201, 2221],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Left(symbol_list.to_array()) ",
                "utf8_pos": 2223,
                "subst": [],
              },
              "start": 2222,
              "end": 2254,
            },
            "loc": [2181, 73],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%right\"",
                  "loc": [2259, 2267],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2280, 2300],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Right(symbol_list.to_array()) ",
                "utf8_pos": 2302,
                "subst": [],
              },
              "start": 2301,
              "end": 2334,
            },
            "loc": [2259, 75],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%nonassoc\"",
                  "loc": [2339, 2350],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2363, 2383],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Nonassoc(symbol_list.to_array()) ",
                "utf8_pos": 2385,
                "subst": [],
              },
              "start": 2384,
              "end": 2420,
            },
            "loc": [2339, 81],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%derive\"",
                  "loc": [2425, 2434],
                },
              },
              { "term": { "$tag": "Image", "0": "\"<\"", "loc": [2435, 2438] } },
              {
                "binder": "trait_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [2450, 2473],
                },
              },
              { "term": { "$tag": "Image", "0": "\">\"", "loc": [2474, 2477] } },
              {
                "binder": "type_",
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [2484, 2489] },
              },
            ],
            "action": {
              "code": {
                "code": " Derive(traits=trait_list.to_array(), type_=type_) ",
                "utf8_pos": 2491,
                "subst": [],
              },
              "start": 2490,
              "end": 2543,
            },
            "loc": [2425, 118],
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
          "1": [{ "$tag": "Constr", "pkg": "ast", "0": "Rule", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "rule",
                "term": { "$tag": "Symbol", "0": "rule", "loc": [2596, 2600] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(rule, Nil) ",
                "utf8_pos": 2602,
                "subst": [],
              },
              "start": 2601,
              "end": 2620,
            },
            "loc": [2591, 29],
          },
          {
            "items": [
              {
                "binder": "rule",
                "term": { "$tag": "Symbol", "0": "rule", "loc": [2630, 2634] },
              },
              {
                "binder": "rule_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_list",
                  "loc": [2645, 2654],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(rule, rule_list) ",
                "utf8_pos": 2656,
                "subst": [],
              },
              "start": 2655,
              "end": 2680,
            },
            "loc": [2625, 55],
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "rule",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": "ast", "0": "Rule", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_no_modifiers",
                  "loc": [2708, 2725],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 2727,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 2726,
              "end": 2732,
            },
            "loc": [2708, 24],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%inline\"",
                  "loc": [2737, 2746],
                },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_no_modifiers",
                  "loc": [2747, 2764],
                },
              },
            ],
            "action": {
              "code": {
                "code": " { ..$2, inline: true } ",
                "utf8_pos": 2766,
                "subst": [
                  { "start": 5, "end": 7, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 2765,
              "end": 2791,
            },
            "loc": [2737, 54],
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "rule_no_modifiers",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": "ast", "0": "Rule", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "nonterminal",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [2844, 2850] },
              },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "opt_rule_return_type",
                  "loc": [2857, 2877],
                },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [2878, 2881] } },
              {
                "binder": "clause_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_list",
                  "loc": [2894, 2905],
                },
              },
              {
                "term": {
                  "$tag": "RuleCall",
                  "0": "option",
                  "symbol_loc": [2906, 2912],
                  "1": [{ "$tag": "Image", "0": "\";\"", "loc": [2913, 2916] }],
                },
              },
            ],
            "action": {
              "code": {
                "code": "\n    { inline: false, nonterminal, generic_params: [], params: [], type_, clauses: clause_list.to_array() }\n  ",
                "utf8_pos": 2919,
                "subst": [],
              },
              "start": 2918,
              "end": 3030,
            },
            "loc": [2832, 198],
          },
          {
            "items": [
              {
                "binder": "nonterminal",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [3047, 3053] },
              },
              {
                "binder": "generic_params",
                "term": {
                  "$tag": "Symbol",
                  "0": "opt_rule_generic_params",
                  "loc": [3069, 3092],
                },
              },
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [3093, 3096] } },
              {
                "binder": "param_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_rule_param_list",
                  "loc": [3108, 3132],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [3133, 3136] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "opt_rule_return_type",
                  "loc": [3143, 3163],
                },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [3164, 3167] } },
              {
                "binder": "clause_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_list",
                  "loc": [3180, 3191],
                },
              },
              {
                "term": {
                  "$tag": "RuleCall",
                  "0": "option",
                  "symbol_loc": [3192, 3198],
                  "1": [{ "$tag": "Image", "0": "\";\"", "loc": [3199, 3202] }],
                },
              },
            ],
            "action": {
              "code": {
                "code": "\n    { inline: false, nonterminal, generic_params, params: param_list.to_array(),  type_, clauses: clause_list.to_array() }\n  ",
                "utf8_pos": 3205,
                "subst": [],
              },
              "start": 3204,
              "end": 3332,
            },
            "loc": [3035, 297],
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
          "0": { "$tag": "Constr", "pkg": "ast", "0": "TypeExpr", "1": [] },
        },
        "clauses": [
          {
            "items": [
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [3381, 3385] },
              },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3392, 3401],
                },
              },
            ],
            "action": {
              "code": { "code": " Some(type_) ", "utf8_pos": 3403, "subst": [] },
              "start": 3402,
              "end": 3417,
            },
            "loc": [3381, 36],
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 3423, "subst": [] },
              "start": 3422,
              "end": 3430,
            },
            "loc": [3421, 9],
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
                    "pkg": "ast",
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
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3508, 3513] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, None), Nil) ",
                "utf8_pos": 3515,
                "subst": [
                  { "start": 7, "end": 9, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 3514,
              "end": 3539,
            },
            "loc": [3508, 31],
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3544, 3549] },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [3550, 3553] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3554, 3563],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, Some($3)), Nil) ",
                "utf8_pos": 3565,
                "subst": [
                  { "start": 7, "end": 9, "desc": { "$tag": "Dollar", "0": 1 } },
                  {
                    "start": 16,
                    "end": 18,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 3564,
              "end": 3593,
            },
            "loc": [3544, 49],
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3598, 3603] },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [3604, 3607] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_rule_param_list",
                  "loc": [3608, 3632],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, None), $3) ",
                "utf8_pos": 3634,
                "subst": [
                  { "start": 7, "end": 9, "desc": { "$tag": "Dollar", "0": 1 } },
                  {
                    "start": 18,
                    "end": 20,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 3633,
              "end": 3657,
            },
            "loc": [3598, 59],
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3662, 3667] },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [3668, 3671] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3672, 3681],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [3682, 3685] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_rule_param_list",
                  "loc": [3686, 3710],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, Some($3)), $5) ",
                "utf8_pos": 3712,
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
              "start": 3711,
              "end": 3739,
            },
            "loc": [3662, 77],
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
              "code": { "code": " [] ", "utf8_pos": 3791, "subst": [] },
              "start": 3790,
              "end": 3796,
            },
            "loc": [3789, 7],
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"[\"", "loc": [3801, 3804] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_ident_list",
                  "loc": [3805, 3830],
                },
              },
              { "term": { "$tag": "Image", "0": "\"]\"", "loc": [3831, 3834] } },
            ],
            "action": {
              "code": {
                "code": " $2.to_array() ",
                "utf8_pos": 3836,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 3835,
              "end": 3852,
            },
            "loc": [3801, 51],
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
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3913, 3918] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons($1, Nil) ",
                "utf8_pos": 3920,
                "subst": [
                  { "start": 6, "end": 8, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 3919,
              "end": 3936,
            },
            "loc": [3913, 23],
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3941, 3946] },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [3947, 3950] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_ident_list",
                  "loc": [3951, 3976],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons($1, $3) ",
                "utf8_pos": 3978,
                "subst": [
                  { "start": 6, "end": 8, "desc": { "$tag": "Dollar", "0": 1 } },
                  {
                    "start": 10,
                    "end": 12,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 3977,
              "end": 3993,
            },
            "loc": [3941, 52],
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "type_expr",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": "ast", "0": "TypeExpr", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "postfix_type_expr",
                  "loc": [4030, 4047],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 4049,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 4048,
              "end": 4054,
            },
            "loc": [4030, 24],
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4059, 4062] } },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4063, 4066] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [4067, 4071] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4072, 4081],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow([], $4) ",
                "utf8_pos": 4083,
                "subst": [
                  {
                    "start": 11,
                    "end": 13,
                    "desc": { "$tag": "Dollar", "0": 4 },
                  },
                ],
              },
              "start": 4082,
              "end": 4099,
            },
            "loc": [4059, 40],
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4104, 4107] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4108, 4117],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4118, 4121] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [4122, 4126] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4127, 4136],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow([$2], $5) ",
                "utf8_pos": 4138,
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
              "start": 4137,
              "end": 4156,
            },
            "loc": [4104, 52],
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4161, 4164] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4165, 4174],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4175, 4178] } },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4179, 4182] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [4183, 4187] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4188, 4197],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow([$2], $6) ",
                "utf8_pos": 4199,
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
              "start": 4198,
              "end": 4217,
            },
            "loc": [4161, 56],
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4222, 4225] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4226, 4235],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4236, 4239] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4240, 4263],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4264, 4267] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [4268, 4272] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4273, 4282],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow(@immut/list.Cons($2, $4).to_array(), $7) ",
                "utf8_pos": 4284,
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
              "start": 4283,
              "end": 4333,
            },
            "loc": [4222, 111],
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "postfix_type_expr",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": "ast", "0": "TypeExpr", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "basic_type_expr",
                  "loc": [4378, 4393],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 4395,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 4394,
              "end": 4400,
            },
            "loc": [4378, 22],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "postfix_type_expr",
                  "loc": [4405, 4422],
                },
              },
              { "term": { "$tag": "Image", "0": "\"?\"", "loc": [4423, 4426] } },
            ],
            "action": {
              "code": {
                "code": " Option($1) ",
                "utf8_pos": 4428,
                "subst": [
                  {
                    "start": 8,
                    "end": 10,
                    "desc": { "$tag": "Dollar", "0": 1 },
                  },
                ],
              },
              "start": 4427,
              "end": 4441,
            },
            "loc": [4405, 36],
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "basic_type_expr",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": "ast", "0": "TypeExpr", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [4484, 4489] },
              },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=None, $1, []) ",
                "utf8_pos": 4491,
                "subst": [
                  {
                    "start": 18,
                    "end": 20,
                    "desc": { "$tag": "Dollar", "0": 1 },
                  },
                ],
              },
              "start": 4490,
              "end": 4518,
            },
            "loc": [4484, 34],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "PKG_AND_IDENT",
                  "loc": [4523, 4536],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=Some($1.0), $1.1, []) ",
                "utf8_pos": 4538,
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
              "start": 4537,
              "end": 4573,
            },
            "loc": [4523, 50],
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [4578, 4583] },
              },
              { "term": { "$tag": "Image", "0": "\"[\"", "loc": [4584, 4587] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4588, 4611],
                },
              },
              { "term": { "$tag": "Image", "0": "\"]\"", "loc": [4612, 4615] } },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=None, $1, $3.to_array()) ",
                "utf8_pos": 4617,
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
              "start": 4616,
              "end": 4655,
            },
            "loc": [4578, 77],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "PKG_AND_IDENT",
                  "loc": [4660, 4673],
                },
              },
              { "term": { "$tag": "Image", "0": "\"[\"", "loc": [4674, 4677] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4678, 4701],
                },
              },
              { "term": { "$tag": "Image", "0": "\"]\"", "loc": [4702, 4705] } },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=Some($1.0), $1.1, $3.to_array()) ",
                "utf8_pos": 4707,
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
              "start": 4706,
              "end": 4753,
            },
            "loc": [4660, 93],
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4758, 4761] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4762, 4771],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4772, 4775] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4776, 4799],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4800, 4803] } },
            ],
            "action": {
              "code": {
                "code": " Tuple(@immut/list.Cons($2, $4).to_array()) ",
                "utf8_pos": 4805,
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
              "start": 4804,
              "end": 4850,
            },
            "loc": [4758, 92],
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4855, 4858] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4859, 4868],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4869, 4872] } },
            ],
            "action": {
              "code": {
                "code": " $2 ",
                "utf8_pos": 4874,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 4873,
              "end": 4879,
            },
            "loc": [4855, 24],
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
          "1": [{ "$tag": "Constr", "pkg": "ast", "0": "TypeExpr", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "type_expr",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4955, 4964],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(type_expr, Nil) ",
                "utf8_pos": 4966,
                "subst": [],
              },
              "start": 4965,
              "end": 4989,
            },
            "loc": [4945, 44],
          },
          {
            "items": [
              {
                "binder": "type_expr",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [5004, 5013],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [5014, 5017] } },
              {
                "binder": "type_expr_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [5033, 5056],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(type_expr, type_expr_list) ",
                "utf8_pos": 5058,
                "subst": [],
              },
              "start": 5057,
              "end": 5092,
            },
            "loc": [4994, 98],
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
          "1": [{ "$tag": "Constr", "pkg": "ast", "0": "Clause", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"|\"", "loc": [5144, 5147] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_clause_list",
                  "loc": [5148, 5168],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $2 ",
                "utf8_pos": 5170,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 5169,
              "end": 5175,
            },
            "loc": [5144, 31],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_clause_list",
                  "loc": [5180, 5200],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 5202,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 5201,
              "end": 5207,
            },
            "loc": [5180, 27],
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "nonempty_clause_list",
        "generic_params": [],
        "params": [],
        "type_": {
          "$tag": "Constr",
          "pkg": "immut/list",
          "0": "T",
          "1": [{ "$tag": "Constr", "pkg": "ast", "0": "Clause", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "clause",
                "term": { "$tag": "Symbol", "0": "clause", "loc": [5275, 5281] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(clause, Nil) ",
                "utf8_pos": 5283,
                "subst": [],
              },
              "start": 5282,
              "end": 5303,
            },
            "loc": [5268, 35],
          },
          {
            "items": [
              {
                "binder": "clause",
                "term": { "$tag": "Symbol", "0": "clause", "loc": [5315, 5321] },
              },
              { "term": { "$tag": "Image", "0": "\"|\"", "loc": [5322, 5325] } },
              {
                "binder": "clause_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_clause_list",
                  "loc": [5338, 5358],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(clause, clause_list) ",
                "utf8_pos": 5360,
                "subst": [],
              },
              "start": 5359,
              "end": 5388,
            },
            "loc": [5308, 80],
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "clause",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": "ast", "0": "Clause", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "item_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "item_list",
                  "loc": [5430, 5439],
                },
              },
              {
                "binder": "prec",
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_prec",
                  "loc": [5445, 5454],
                },
              },
              {
                "binder": "action",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_action",
                  "loc": [5462, 5475],
                },
              },
            ],
            "action": {
              "code": {
                "code": " { items: item_list.to_array(), prec, action, loc: ($startpos, $endpos - $startpos) } ",
                "utf8_pos": 5477,
                "subst": [
                  { "start": 52, "end": 61, "desc": { "$tag": "StartPos" } },
                  { "start": 63, "end": 70, "desc": { "$tag": "EndPos" } },
                  { "start": 73, "end": 82, "desc": { "$tag": "StartPos" } },
                ],
              },
              "start": 5476,
              "end": 5564,
            },
            "loc": [5420, 144],
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "clause_action",
        "generic_params": [],
        "params": [],
        "type_": {
          "$tag": "Constr",
          "pkg": "ast",
          "0": "ClauseAction",
          "1": [],
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "code",
                "term": {
                  "$tag": "Symbol",
                  "0": "LBRACE_CODE_RBRACE",
                  "loc": [5614, 5632],
                },
              },
            ],
            "action": {
              "code": {
                "code": "\n      let (code, utf8_pos, subst) = code\n      { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\n  ",
                "utf8_pos": 5634,
                "subst": [
                  { "start": 96, "end": 105, "desc": { "$tag": "StartPos" } },
                  { "start": 112, "end": 119, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 5633,
              "end": 5759,
            },
            "loc": [5609, 150],
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
          "0": { "$tag": "Constr", "pkg": "ast", "0": "Symbol", "1": [] },
        },
        "clauses": [
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%prec\"",
                  "loc": [5795, 5802],
                },
              },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [5810, 5816] },
              },
            ],
            "action": {
              "code": {
                "code": " Some(symbol) ",
                "utf8_pos": 5818,
                "subst": [],
              },
              "start": 5817,
              "end": 5833,
            },
            "loc": [5795, 38],
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 5839, "subst": [] },
              "start": 5838,
              "end": 5846,
            },
            "loc": [5837, 9],
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
          "1": [{ "$tag": "Constr", "pkg": "ast", "0": "ClauseItem", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "item",
                "term": { "$tag": "Symbol", "0": "item", "loc": [5905, 5909] },
              },
              {
                "binder": "item_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "item_list",
                  "loc": [5920, 5929],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(item, item_list) ",
                "utf8_pos": 5931,
                "subst": [],
              },
              "start": 5930,
              "end": 5955,
            },
            "loc": [5900, 55],
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "utf8_pos": 5961, "subst": [] },
              "start": 5960,
              "end": 5967,
            },
            "loc": [5959, 8],
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "item",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": "ast", "0": "ClauseItem", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "term",
                "term": { "$tag": "Symbol", "0": "term", "loc": [6006, 6010] },
              },
            ],
            "action": {
              "code": {
                "code": " { binder: None, term: term } ",
                "utf8_pos": 6012,
                "subst": [],
              },
              "start": 6011,
              "end": 6043,
            },
            "loc": [6001, 42],
          },
          {
            "items": [
              {
                "binder": "binder",
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [6055, 6060] },
              },
              { "term": { "$tag": "Image", "0": "\"=\"", "loc": [6061, 6064] } },
              {
                "binder": "term",
                "term": { "$tag": "Symbol", "0": "term", "loc": [6070, 6074] },
              },
            ],
            "action": {
              "code": {
                "code": " { binder: Some(binder), term: term } ",
                "utf8_pos": 6076,
                "subst": [],
              },
              "start": 6075,
              "end": 6115,
            },
            "loc": [6048, 67],
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "term",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": "ast", "0": "Term", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [6150, 6156] },
              },
            ],
            "action": {
              "code": {
                "code": " Symbol(symbol, loc=($startpos, $endpos)) ",
                "utf8_pos": 6158,
                "subst": [
                  { "start": 21, "end": 30, "desc": { "$tag": "StartPos" } },
                  { "start": 32, "end": 39, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 6157,
              "end": 6201,
            },
            "loc": [6143, 58],
          },
          {
            "items": [
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [6213, 6219] },
              },
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [6220, 6223] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_term_list",
                  "loc": [6224, 6248],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [6249, 6252] } },
            ],
            "action": {
              "code": {
                "code": " RuleCall(symbol, symbol_loc=($startpos(symbol), $endpos(symbol)), $3.to_array()) ",
                "utf8_pos": 6254,
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
              "start": 6253,
              "end": 6337,
            },
            "loc": [6206, 131],
          },
          {
            "items": [
              {
                "binder": "image",
                "term": { "$tag": "Symbol", "0": "STRING", "loc": [6348, 6354] },
              },
            ],
            "action": {
              "code": {
                "code": " Image(image, loc=($startpos, $endpos)) ",
                "utf8_pos": 6356,
                "subst": [
                  { "start": 19, "end": 28, "desc": { "$tag": "StartPos" } },
                  { "start": 30, "end": 37, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 6355,
              "end": 6397,
            },
            "loc": [6342, 55],
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
          "1": [{ "$tag": "Constr", "pkg": "ast", "0": "Term", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "term",
                "term": { "$tag": "Symbol", "0": "term", "loc": [6465, 6469] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(term, Nil) ",
                "utf8_pos": 6471,
                "subst": [],
              },
              "start": 6470,
              "end": 6489,
            },
            "loc": [6460, 29],
          },
          {
            "items": [
              {
                "binder": "term",
                "term": { "$tag": "Symbol", "0": "term", "loc": [6499, 6503] },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [6504, 6507] } },
              {
                "binder": "term_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_term_list",
                  "loc": [6518, 6542],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(term, term_list) ",
                "utf8_pos": 6544,
                "subst": [],
              },
              "start": 6543,
              "end": 6568,
            },
            "loc": [6494, 74],
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
          "1": [{ "$tag": "Constr", "pkg": "ast", "0": "Symbol", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [6636, 6642] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(symbol, Nil) ",
                "utf8_pos": 6644,
                "subst": [],
              },
              "start": 6643,
              "end": 6664,
            },
            "loc": [6629, 35],
          },
          {
            "items": [
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [6676, 6682] },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [6695, 6715],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(symbol, symbol_list) ",
                "utf8_pos": 6717,
                "subst": [],
              },
              "start": 6716,
              "end": 6745,
            },
            "loc": [6669, 76],
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "symbol",
        "generic_params": [],
        "params": [],
        "type_": { "$tag": "Constr", "pkg": "ast", "0": "Symbol", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "ident",
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [6783, 6788] },
              },
            ],
            "action": {
              "code": { "code": " ident ", "utf8_pos": 6790, "subst": [] },
              "start": 6789,
              "end": 6798,
            },
            "loc": [6777, 21],
          },
        ],
      },
    ],
  })
}
