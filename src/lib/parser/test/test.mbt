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
      #|LANGLE_CODE_RANGLE("Int")
      #|PERCENT_DERIVE
      #|LANGLE_CODE_RANGLE("Show")
      #|IDENT("Token")
      #|PERCENT_START
      #|IDENT("spec")
      #|PERCENT_TOKEN
      #|IDENT("EOF")
      #|PERCENT_TOKEN
      #|LANGLE_CODE_RANGLE("String")
      #|IDENT("IDENT")
      #|PERCENT_TOKEN
      #|LANGLE_CODE_RANGLE("String")
      #|IDENT("STRING")
      #|PERCENT_TOKEN
      #|LANGLE_CODE_RANGLE("String")
      #|IDENT("LANGLE_CODE_RANGLE")
      #|PERCENT_TOKEN
      #|LANGLE_CODE_RANGLE("(String, Int, Array[@ast.SubstItem])")
      #|IDENT("LBRACE_CODE_RBRACE")
      #|PERCENT_TOKEN
      #|LANGLE_CODE_RANGLE("(String, Int, Int)")
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|PERCENT_TOKEN
      #|LANGLE_CODE_RANGLE("(String, Int, Int)")
      #|IDENT("PERCENT_PERCENT_CODE_EOF")
      #|PERCENT_TOKEN
      #|LANGLE_CODE_RANGLE("(String, String)")
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
      #|LBRACE_CODE_RBRACE((" { header, decls: decl_list.to_array(), rules: rule_list.to_array(), trailer } ", 997, []))
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
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1161, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 1180, []))
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
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1272, []))
      #|BAR
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_PERCENT_CODE_EOF")
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1321, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 1340, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(decl, decl_list) ", 1433, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", 1463, []))
      #|SEMI
      #|IDENT("decl")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "Declaration"))
      #|COLON
      #|STRING("\"%start\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Start(symbol_list.to_array()) ", 1547, []))
      #|BAR
      #|STRING("\"%token\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Token(symbol_list.to_array(), type_=None) ", 1627, []))
      #|BAR
      #|STRING("\"%token\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Token(symbol_list.to_array(), type_=Some(type_)) ", 1744, []))
      #|BAR
      #|STRING("\"%token\"")
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Token1(symbol, type_=None, image=image) ", 1837, []))
      #|BAR
      #|STRING("\"%token\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Token1(symbol, type_=Some(type_), image=image) ", 1946, []))
      #|BAR
      #|STRING("\"%type\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Type(symbol_list.to_array(), type_=type_) ", 2067, []))
      #|BAR
      #|STRING("\"%position\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|LBRACE_CODE_RBRACE((" Position(type_=type_) ", 2154, []))
      #|BAR
      #|STRING("\"%left\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Left(symbol_list.to_array()) ", 2225, []))
      #|BAR
      #|STRING("\"%right\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Right(symbol_list.to_array()) ", 2304, []))
      #|BAR
      #|STRING("\"%nonassoc\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Nonassoc(symbol_list.to_array()) ", 2387, []))
      #|BAR
      #|STRING("\"%derive\"")
      #|IDENT("traits")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|IDENT("type_")
      #|EQ
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Derive(traits=traits, type_=type_) ", 2476, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(rule, Nil) ", 2572, []))
      #|BAR
      #|IDENT("rule")
      #|EQ
      #|IDENT("rule")
      #|IDENT("rule_list")
      #|EQ
      #|IDENT("rule_list")
      #|LBRACE_CODE_RBRACE((" Cons(rule, rule_list) ", 2626, []))
      #|SEMI
      #|IDENT("rule")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "Rule"))
      #|COLON
      #|IDENT("rule_no_modifiers")
      #|LBRACE_CODE_RBRACE((" $1 ", 2697, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|STRING("\"%inline\"")
      #|IDENT("rule_no_modifiers")
      #|LBRACE_CODE_RBRACE((" { ..$2, inline: true } ", 2736, [{start: 5, end: 7, desc: Dollar(2)}]))
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
      #|LBRACE_CODE_RBRACE(("\n    { inline: false, nonterminal, generic_params: [], params: [], type_, clauses: clause_list.to_array() }\n  ", 2889, []))
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
      #|LBRACE_CODE_RBRACE(("\n    { inline: false, nonterminal, generic_params, params: param_list.to_array(),  type_, clauses: clause_list.to_array() }\n  ", 3175, []))
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
      #|LBRACE_CODE_RBRACE((" Some(type_) ", 3373, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 3393, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(($1, None), Nil) ", 3485, [{start: 7, end: 9, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\":\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Cons(($1, Some($3)), Nil) ", 3535, [{start: 7, end: 9, desc: Dollar(1)}, {start: 16, end: 18, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\",\"")
      #|IDENT("nonempty_rule_param_list")
      #|LBRACE_CODE_RBRACE((" Cons(($1, None), $3) ", 3604, [{start: 7, end: 9, desc: Dollar(1)}, {start: 18, end: 20, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\":\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("nonempty_rule_param_list")
      #|LBRACE_CODE_RBRACE((" Cons(($1, Some($3)), $5) ", 3682, [{start: 7, end: 9, desc: Dollar(1)}, {start: 16, end: 18, desc: Dollar(3)}, {start: 22, end: 24, desc: Dollar(5)}]))
      #|SEMI
      #|IDENT("opt_rule_generic_params")
      #|ARROW
      #|IDENT("Array")
      #|LBRACKET
      #|IDENT("String")
      #|RBRACKET
      #|COLON
      #|LBRACE_CODE_RBRACE((" [] ", 3761, []))
      #|BAR
      #|STRING("\"[\"")
      #|IDENT("nonempty_comma_ident_list")
      #|STRING("\"]\"")
      #|LBRACE_CODE_RBRACE((" $2.to_array() ", 3806, [{start: 1, end: 3, desc: Dollar(2)}]))
      #|SEMI
      #|IDENT("nonempty_comma_ident_list")
      #|ARROW
      #|PKG_AND_IDENT(("immut/list", "T"))
      #|LBRACKET
      #|IDENT("String")
      #|RBRACKET
      #|COLON
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Cons($1, Nil) ", 3890, [{start: 6, end: 8, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\",\"")
      #|IDENT("nonempty_comma_ident_list")
      #|LBRACE_CODE_RBRACE((" Cons($1, $3) ", 3948, [{start: 6, end: 8, desc: Dollar(1)}, {start: 10, end: 12, desc: Dollar(3)}]))
      #|SEMI
      #|IDENT("type_expr")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "TypeExpr"))
      #|COLON
      #|IDENT("postfix_type_expr")
      #|LBRACE_CODE_RBRACE((" $1 ", 4019, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|STRING("\"(\"")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow([], $4) ", 4053, [{start: 11, end: 13, desc: Dollar(4)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow([$2], $5) ", 4108, [{start: 8, end: 10, desc: Dollar(2)}, {start: 13, end: 15, desc: Dollar(5)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow([$2], $6) ", 4169, [{start: 8, end: 10, desc: Dollar(2)}, {start: 13, end: 15, desc: Dollar(6)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow(@immut/list.Cons($2, $4).to_array(), $7) ", 4254, [{start: 24, end: 26, desc: Dollar(2)}, {start: 28, end: 30, desc: Dollar(4)}, {start: 44, end: 46, desc: Dollar(7)}]))
      #|SEMI
      #|IDENT("postfix_type_expr")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "TypeExpr"))
      #|COLON
      #|IDENT("basic_type_expr")
      #|LBRACE_CODE_RBRACE((" $1 ", 4365, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("postfix_type_expr")
      #|STRING("\"?\"")
      #|LBRACE_CODE_RBRACE((" Option($1) ", 4398, [{start: 8, end: 10, desc: Dollar(1)}]))
      #|SEMI
      #|IDENT("basic_type_expr")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "TypeExpr"))
      #|COLON
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=None, $1, []) ", 4461, [{start: 18, end: 20, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("PKG_AND_IDENT")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=Some($1.0), $1.1, []) ", 4508, [{start: 17, end: 19, desc: Dollar(1)}, {start: 24, end: 26, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\"[\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\"]\"")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=None, $1, $3.to_array()) ", 4587, [{start: 18, end: 20, desc: Dollar(1)}, {start: 22, end: 24, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("PKG_AND_IDENT")
      #|STRING("\"[\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\"]\"")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=Some($1.0), $1.1, $3.to_array()) ", 4677, [{start: 17, end: 19, desc: Dollar(1)}, {start: 24, end: 26, desc: Dollar(1)}, {start: 30, end: 32, desc: Dollar(3)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\")\"")
      #|LBRACE_CODE_RBRACE((" Tuple(@immut/list.Cons($2, $4).to_array()) ", 4775, [{start: 24, end: 26, desc: Dollar(2)}, {start: 28, end: 30, desc: Dollar(4)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\")\"")
      #|LBRACE_CODE_RBRACE((" $2 ", 4844, [{start: 1, end: 3, desc: Dollar(2)}]))
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
      #|LBRACE_CODE_RBRACE((" Cons(type_expr, Nil) ", 4936, []))
      #|BAR
      #|IDENT("type_expr")
      #|EQ
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("type_expr_list")
      #|EQ
      #|IDENT("nonempty_type_expr_list")
      #|LBRACE_CODE_RBRACE((" Cons(type_expr, type_expr_list) ", 5028, []))
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
      #|LBRACE_CODE_RBRACE((" $2 ", 5140, [{start: 1, end: 3, desc: Dollar(2)}]))
      #|BAR
      #|IDENT("nonempty_clause_list")
      #|LBRACE_CODE_RBRACE((" $1 ", 5172, [{start: 1, end: 3, desc: Dollar(1)}]))
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
      #|LBRACE_CODE_RBRACE((" Cons(clause, Nil) ", 5253, []))
      #|BAR
      #|IDENT("clause")
      #|EQ
      #|IDENT("clause")
      #|STRING("\"|\"")
      #|IDENT("clause_list")
      #|EQ
      #|IDENT("nonempty_clause_list")
      #|LBRACE_CODE_RBRACE((" Cons(clause, clause_list) ", 5330, []))
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
      #|LBRACE_CODE_RBRACE((" { items: item_list.to_array(), prec, action, loc: ($startpos, $endpos - $startpos) } ", 5447, [{start: 52, end: 61, desc: StartPos}, {start: 63, end: 70, desc: EndPos}, {start: 73, end: 82, desc: StartPos}]))
      #|SEMI
      #|IDENT("clause_action")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "ClauseAction"))
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("LBRACE_CODE_RBRACE")
      #|LBRACE_CODE_RBRACE(("\n      let (code, utf8_pos, subst) = code\n      { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\n  ", 5604, [{start: 96, end: 105, desc: StartPos}, {start: 112, end: 119, desc: EndPos}]))
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
      #|LBRACE_CODE_RBRACE((" Some(symbol) ", 5788, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 5809, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(item, item_list) ", 5901, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", 5931, []))
      #|SEMI
      #|IDENT("item")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "ClauseItem"))
      #|COLON
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|LBRACE_CODE_RBRACE((" { binder: None, term: term } ", 5982, []))
      #|BAR
      #|IDENT("binder")
      #|EQ
      #|IDENT("IDENT")
      #|STRING("\"=\"")
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|LBRACE_CODE_RBRACE((" { binder: Some(binder), term: term } ", 6046, []))
      #|SEMI
      #|IDENT("term")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "Term"))
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Symbol(symbol, loc=($startpos, $endpos)) ", 6128, [{start: 21, end: 30, desc: StartPos}, {start: 32, end: 39, desc: EndPos}]))
      #|BAR
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|STRING("\"(\"")
      #|IDENT("nonempty_comma_term_list")
      #|STRING("\")\"")
      #|LBRACE_CODE_RBRACE((" RuleCall(symbol, symbol_loc=($startpos(symbol), $endpos(symbol)), $3.to_array()) ", 6224, [{start: 30, end: 47, desc: StartPosOf(Name("symbol"))}, {start: 49, end: 64, desc: EndPosOf(Name("symbol"))}, {start: 67, end: 69, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Image(image, loc=($startpos, $endpos)) ", 6326, [{start: 19, end: 28, desc: StartPos}, {start: 30, end: 37, desc: EndPos}]))
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
      #|LBRACE_CODE_RBRACE((" Cons(term, Nil) ", 6441, []))
      #|BAR
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|STRING("\",\"")
      #|IDENT("term_list")
      #|EQ
      #|IDENT("nonempty_comma_term_list")
      #|LBRACE_CODE_RBRACE((" Cons(term, term_list) ", 6514, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(symbol, Nil) ", 6614, []))
      #|BAR
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Cons(symbol, symbol_list) ", 6687, []))
      #|SEMI
      #|IDENT("symbol")
      #|ARROW
      #|PKG_AND_IDENT(("ast", "Symbol"))
      #|COLON
      #|IDENT("ident")
      #|EQ
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" ident ", 6760, []))
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
      { "$tag": "Position", "type_": "Int" },
      { "$tag": "Derive", "traits": "Show", "type_": "Token" },
      { "$tag": "Start", "0": ["spec"] },
      { "$tag": "Token", "0": ["EOF"], "type_": Null },
      { "$tag": "Token", "0": ["IDENT"], "type_": "String" },
      { "$tag": "Token", "0": ["STRING"], "type_": "String" },
      { "$tag": "Token", "0": ["LANGLE_CODE_RANGLE"], "type_": "String" },
      {
        "$tag": "Token",
        "0": ["LBRACE_CODE_RBRACE"],
        "type_": "(String, Int, Array[@ast.SubstItem])",
      },
      {
        "$tag": "Token",
        "0": ["PERCENT_LBRACE_CODE_PERCENT_RBRACE"],
        "type_": "(String, Int, Int)",
      },
      {
        "$tag": "Token",
        "0": ["PERCENT_PERCENT_CODE_EOF"],
        "type_": "(String, Int, Int)",
      },
      { "$tag": "Token", "0": ["PKG_AND_IDENT"], "type_": "(String, String)" },
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
                "term": { "$tag": "Symbol", "0": "header", "loc": [924, 930] },
              },
              {
                "binder": "decl_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "decl_list",
                  "loc": [941, 950],
                },
              },
              { "term": { "$tag": "Image", "0": "\"%%\"", "loc": [951, 955] } },
              {
                "binder": "rule_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_list",
                  "loc": [966, 975],
                },
              },
              {
                "binder": "trailer",
                "term": { "$tag": "Symbol", "0": "trailer", "loc": [984, 991] },
              },
              { "term": { "$tag": "Symbol", "0": "EOF", "loc": [992, 995] } },
            ],
            "action": {
              "code": {
                "code": " { header, decls: decl_list.to_array(), rules: rule_list.to_array(), trailer } ",
                "utf8_pos": 997,
                "subst": [],
              },
              "start": 996,
              "end": 1077,
            },
            "loc": [917, 160],
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
                  "loc": [1125, 1159],
                },
              },
            ],
            "action": {
              "code": { "code": " Some(code) ", "utf8_pos": 1161, "subst": [] },
              "start": 1160,
              "end": 1174,
            },
            "loc": [1120, 54],
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 1180, "subst": [] },
              "start": 1179,
              "end": 1187,
            },
            "loc": [1178, 9],
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
                  "loc": [1236, 1270],
                },
              },
            ],
            "action": {
              "code": { "code": " Some(code) ", "utf8_pos": 1272, "subst": [] },
              "start": 1271,
              "end": 1285,
            },
            "loc": [1231, 54],
          },
          {
            "items": [
              {
                "binder": "code",
                "term": {
                  "$tag": "Symbol",
                  "0": "PERCENT_PERCENT_CODE_EOF",
                  "loc": [1295, 1319],
                },
              },
            ],
            "action": {
              "code": { "code": " Some(code) ", "utf8_pos": 1321, "subst": [] },
              "start": 1320,
              "end": 1334,
            },
            "loc": [1290, 44],
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 1340, "subst": [] },
              "start": 1339,
              "end": 1347,
            },
            "loc": [1338, 9],
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
                "term": { "$tag": "Symbol", "0": "decl", "loc": [1407, 1411] },
              },
              {
                "binder": "decl_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "decl_list",
                  "loc": [1422, 1431],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(decl, decl_list) ",
                "utf8_pos": 1433,
                "subst": [],
              },
              "start": 1432,
              "end": 1457,
            },
            "loc": [1402, 55],
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "utf8_pos": 1463, "subst": [] },
              "start": 1462,
              "end": 1469,
            },
            "loc": [1461, 8],
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
                  "loc": [1504, 1512],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [1525, 1545],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Start(symbol_list.to_array()) ",
                "utf8_pos": 1547,
                "subst": [],
              },
              "start": 1546,
              "end": 1579,
            },
            "loc": [1504, 75],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1584, 1592],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [1605, 1625],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Token(symbol_list.to_array(), type_=None) ",
                "utf8_pos": 1627,
                "subst": [],
              },
              "start": 1626,
              "end": 1671,
            },
            "loc": [1584, 87],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1676, 1684],
                },
              },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "LANGLE_CODE_RANGLE",
                  "loc": [1691, 1709],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [1722, 1742],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Token(symbol_list.to_array(), type_=Some(type_)) ",
                "utf8_pos": 1744,
                "subst": [],
              },
              "start": 1743,
              "end": 1795,
            },
            "loc": [1676, 119],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1800, 1808],
                },
              },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [1816, 1822] },
              },
              {
                "binder": "image",
                "term": { "$tag": "Symbol", "0": "STRING", "loc": [1829, 1835] },
              },
            ],
            "action": {
              "code": {
                "code": " Token1(symbol, type_=None, image=image) ",
                "utf8_pos": 1837,
                "subst": [],
              },
              "start": 1836,
              "end": 1879,
            },
            "loc": [1800, 79],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%token\"",
                  "loc": [1884, 1892],
                },
              },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "LANGLE_CODE_RANGLE",
                  "loc": [1899, 1917],
                },
              },
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
            "loc": [1884, 111],
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
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "LANGLE_CODE_RANGLE",
                  "loc": [2014, 2032],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2045, 2065],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Type(symbol_list.to_array(), type_=type_) ",
                "utf8_pos": 2067,
                "subst": [],
              },
              "start": 2066,
              "end": 2111,
            },
            "loc": [2000, 111],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%position\"",
                  "loc": [2116, 2127],
                },
              },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "LANGLE_CODE_RANGLE",
                  "loc": [2134, 2152],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Position(type_=type_) ",
                "utf8_pos": 2154,
                "subst": [],
              },
              "start": 2153,
              "end": 2178,
            },
            "loc": [2116, 62],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%left\"",
                  "loc": [2183, 2190],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2203, 2223],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Left(symbol_list.to_array()) ",
                "utf8_pos": 2225,
                "subst": [],
              },
              "start": 2224,
              "end": 2256,
            },
            "loc": [2183, 73],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%right\"",
                  "loc": [2261, 2269],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2282, 2302],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Right(symbol_list.to_array()) ",
                "utf8_pos": 2304,
                "subst": [],
              },
              "start": 2303,
              "end": 2336,
            },
            "loc": [2261, 75],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%nonassoc\"",
                  "loc": [2341, 2352],
                },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [2365, 2385],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Nonassoc(symbol_list.to_array()) ",
                "utf8_pos": 2387,
                "subst": [],
              },
              "start": 2386,
              "end": 2422,
            },
            "loc": [2341, 81],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%derive\"",
                  "loc": [2427, 2436],
                },
              },
              {
                "binder": "traits",
                "term": {
                  "$tag": "Symbol",
                  "0": "LANGLE_CODE_RANGLE",
                  "loc": [2444, 2462],
                },
              },
              {
                "binder": "type_",
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [2469, 2474] },
              },
            ],
            "action": {
              "code": {
                "code": " Derive(traits=traits, type_=type_) ",
                "utf8_pos": 2476,
                "subst": [],
              },
              "start": 2475,
              "end": 2513,
            },
            "loc": [2427, 86],
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
                "term": { "$tag": "Symbol", "0": "rule", "loc": [2566, 2570] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(rule, Nil) ",
                "utf8_pos": 2572,
                "subst": [],
              },
              "start": 2571,
              "end": 2590,
            },
            "loc": [2561, 29],
          },
          {
            "items": [
              {
                "binder": "rule",
                "term": { "$tag": "Symbol", "0": "rule", "loc": [2600, 2604] },
              },
              {
                "binder": "rule_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_list",
                  "loc": [2615, 2624],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(rule, rule_list) ",
                "utf8_pos": 2626,
                "subst": [],
              },
              "start": 2625,
              "end": 2650,
            },
            "loc": [2595, 55],
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
                  "loc": [2678, 2695],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 2697,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 2696,
              "end": 2702,
            },
            "loc": [2678, 24],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Image",
                  "0": "\"%inline\"",
                  "loc": [2707, 2716],
                },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_no_modifiers",
                  "loc": [2717, 2734],
                },
              },
            ],
            "action": {
              "code": {
                "code": " { ..$2, inline: true } ",
                "utf8_pos": 2736,
                "subst": [
                  { "start": 5, "end": 7, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 2735,
              "end": 2761,
            },
            "loc": [2707, 54],
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
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [2814, 2820] },
              },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "opt_rule_return_type",
                  "loc": [2827, 2847],
                },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [2848, 2851] } },
              {
                "binder": "clause_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_list",
                  "loc": [2864, 2875],
                },
              },
              {
                "term": {
                  "$tag": "RuleCall",
                  "0": "option",
                  "symbol_loc": [2876, 2882],
                  "1": [{ "$tag": "Image", "0": "\";\"", "loc": [2883, 2886] }],
                },
              },
            ],
            "action": {
              "code": {
                "code": "\n    { inline: false, nonterminal, generic_params: [], params: [], type_, clauses: clause_list.to_array() }\n  ",
                "utf8_pos": 2889,
                "subst": [],
              },
              "start": 2888,
              "end": 3000,
            },
            "loc": [2802, 198],
          },
          {
            "items": [
              {
                "binder": "nonterminal",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [3017, 3023] },
              },
              {
                "binder": "generic_params",
                "term": {
                  "$tag": "Symbol",
                  "0": "opt_rule_generic_params",
                  "loc": [3039, 3062],
                },
              },
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [3063, 3066] } },
              {
                "binder": "param_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_rule_param_list",
                  "loc": [3078, 3102],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [3103, 3106] } },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "opt_rule_return_type",
                  "loc": [3113, 3133],
                },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [3134, 3137] } },
              {
                "binder": "clause_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_list",
                  "loc": [3150, 3161],
                },
              },
              {
                "term": {
                  "$tag": "RuleCall",
                  "0": "option",
                  "symbol_loc": [3162, 3168],
                  "1": [{ "$tag": "Image", "0": "\";\"", "loc": [3169, 3172] }],
                },
              },
            ],
            "action": {
              "code": {
                "code": "\n    { inline: false, nonterminal, generic_params, params: param_list.to_array(),  type_, clauses: clause_list.to_array() }\n  ",
                "utf8_pos": 3175,
                "subst": [],
              },
              "start": 3174,
              "end": 3302,
            },
            "loc": [3005, 297],
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
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [3351, 3355] },
              },
              {
                "binder": "type_",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3362, 3371],
                },
              },
            ],
            "action": {
              "code": { "code": " Some(type_) ", "utf8_pos": 3373, "subst": [] },
              "start": 3372,
              "end": 3387,
            },
            "loc": [3351, 36],
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 3393, "subst": [] },
              "start": 3392,
              "end": 3400,
            },
            "loc": [3391, 9],
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
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3478, 3483] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, None), Nil) ",
                "utf8_pos": 3485,
                "subst": [
                  { "start": 7, "end": 9, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 3484,
              "end": 3509,
            },
            "loc": [3478, 31],
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3514, 3519] },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [3520, 3523] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3524, 3533],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, Some($3)), Nil) ",
                "utf8_pos": 3535,
                "subst": [
                  { "start": 7, "end": 9, "desc": { "$tag": "Dollar", "0": 1 } },
                  {
                    "start": 16,
                    "end": 18,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 3534,
              "end": 3563,
            },
            "loc": [3514, 49],
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3568, 3573] },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [3574, 3577] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_rule_param_list",
                  "loc": [3578, 3602],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, None), $3) ",
                "utf8_pos": 3604,
                "subst": [
                  { "start": 7, "end": 9, "desc": { "$tag": "Dollar", "0": 1 } },
                  {
                    "start": 18,
                    "end": 20,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 3603,
              "end": 3627,
            },
            "loc": [3568, 59],
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3632, 3637] },
              },
              { "term": { "$tag": "Image", "0": "\":\"", "loc": [3638, 3641] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [3642, 3651],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [3652, 3655] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_rule_param_list",
                  "loc": [3656, 3680],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(($1, Some($3)), $5) ",
                "utf8_pos": 3682,
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
              "start": 3681,
              "end": 3709,
            },
            "loc": [3632, 77],
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
              "code": { "code": " [] ", "utf8_pos": 3761, "subst": [] },
              "start": 3760,
              "end": 3766,
            },
            "loc": [3759, 7],
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"[\"", "loc": [3771, 3774] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_ident_list",
                  "loc": [3775, 3800],
                },
              },
              { "term": { "$tag": "Image", "0": "\"]\"", "loc": [3801, 3804] } },
            ],
            "action": {
              "code": {
                "code": " $2.to_array() ",
                "utf8_pos": 3806,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 3805,
              "end": 3822,
            },
            "loc": [3771, 51],
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
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3883, 3888] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons($1, Nil) ",
                "utf8_pos": 3890,
                "subst": [
                  { "start": 6, "end": 8, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 3889,
              "end": 3906,
            },
            "loc": [3883, 23],
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [3911, 3916] },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [3917, 3920] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_ident_list",
                  "loc": [3921, 3946],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons($1, $3) ",
                "utf8_pos": 3948,
                "subst": [
                  { "start": 6, "end": 8, "desc": { "$tag": "Dollar", "0": 1 } },
                  {
                    "start": 10,
                    "end": 12,
                    "desc": { "$tag": "Dollar", "0": 3 },
                  },
                ],
              },
              "start": 3947,
              "end": 3963,
            },
            "loc": [3911, 52],
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
                  "loc": [4000, 4017],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 4019,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 4018,
              "end": 4024,
            },
            "loc": [4000, 24],
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4029, 4032] } },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4033, 4036] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [4037, 4041] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4042, 4051],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow([], $4) ",
                "utf8_pos": 4053,
                "subst": [
                  {
                    "start": 11,
                    "end": 13,
                    "desc": { "$tag": "Dollar", "0": 4 },
                  },
                ],
              },
              "start": 4052,
              "end": 4069,
            },
            "loc": [4029, 40],
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4074, 4077] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4078, 4087],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4088, 4091] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [4092, 4096] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4097, 4106],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow([$2], $5) ",
                "utf8_pos": 4108,
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
              "start": 4107,
              "end": 4126,
            },
            "loc": [4074, 52],
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4131, 4134] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4135, 4144],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4145, 4148] } },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4149, 4152] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [4153, 4157] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4158, 4167],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow([$2], $6) ",
                "utf8_pos": 4169,
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
              "start": 4168,
              "end": 4187,
            },
            "loc": [4131, 56],
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4192, 4195] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4196, 4205],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4206, 4209] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4210, 4233],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4234, 4237] } },
              {
                "term": { "$tag": "Image", "0": "\"->\"", "loc": [4238, 4242] },
              },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4243, 4252],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Arrow(@immut/list.Cons($2, $4).to_array(), $7) ",
                "utf8_pos": 4254,
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
              "start": 4253,
              "end": 4303,
            },
            "loc": [4192, 111],
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
                  "loc": [4348, 4363],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 4365,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 4364,
              "end": 4370,
            },
            "loc": [4348, 22],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "postfix_type_expr",
                  "loc": [4375, 4392],
                },
              },
              { "term": { "$tag": "Image", "0": "\"?\"", "loc": [4393, 4396] } },
            ],
            "action": {
              "code": {
                "code": " Option($1) ",
                "utf8_pos": 4398,
                "subst": [
                  {
                    "start": 8,
                    "end": 10,
                    "desc": { "$tag": "Dollar", "0": 1 },
                  },
                ],
              },
              "start": 4397,
              "end": 4411,
            },
            "loc": [4375, 36],
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
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [4454, 4459] },
              },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=None, $1, []) ",
                "utf8_pos": 4461,
                "subst": [
                  {
                    "start": 18,
                    "end": 20,
                    "desc": { "$tag": "Dollar", "0": 1 },
                  },
                ],
              },
              "start": 4460,
              "end": 4488,
            },
            "loc": [4454, 34],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "PKG_AND_IDENT",
                  "loc": [4493, 4506],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=Some($1.0), $1.1, []) ",
                "utf8_pos": 4508,
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
              "start": 4507,
              "end": 4543,
            },
            "loc": [4493, 50],
          },
          {
            "items": [
              {
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [4548, 4553] },
              },
              { "term": { "$tag": "Image", "0": "\"[\"", "loc": [4554, 4557] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4558, 4581],
                },
              },
              { "term": { "$tag": "Image", "0": "\"]\"", "loc": [4582, 4585] } },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=None, $1, $3.to_array()) ",
                "utf8_pos": 4587,
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
              "start": 4586,
              "end": 4625,
            },
            "loc": [4548, 77],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "PKG_AND_IDENT",
                  "loc": [4630, 4643],
                },
              },
              { "term": { "$tag": "Image", "0": "\"[\"", "loc": [4644, 4647] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4648, 4671],
                },
              },
              { "term": { "$tag": "Image", "0": "\"]\"", "loc": [4672, 4675] } },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=Some($1.0), $1.1, $3.to_array()) ",
                "utf8_pos": 4677,
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
              "start": 4676,
              "end": 4723,
            },
            "loc": [4630, 93],
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4728, 4731] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4732, 4741],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4742, 4745] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [4746, 4769],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4770, 4773] } },
            ],
            "action": {
              "code": {
                "code": " Tuple(@immut/list.Cons($2, $4).to_array()) ",
                "utf8_pos": 4775,
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
              "start": 4774,
              "end": 4820,
            },
            "loc": [4728, 92],
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [4825, 4828] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4829, 4838],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [4839, 4842] } },
            ],
            "action": {
              "code": {
                "code": " $2 ",
                "utf8_pos": 4844,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 4843,
              "end": 4849,
            },
            "loc": [4825, 24],
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
                  "loc": [4925, 4934],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(type_expr, Nil) ",
                "utf8_pos": 4936,
                "subst": [],
              },
              "start": 4935,
              "end": 4959,
            },
            "loc": [4915, 44],
          },
          {
            "items": [
              {
                "binder": "type_expr",
                "term": {
                  "$tag": "Symbol",
                  "0": "type_expr",
                  "loc": [4974, 4983],
                },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [4984, 4987] } },
              {
                "binder": "type_expr_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_type_expr_list",
                  "loc": [5003, 5026],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(type_expr, type_expr_list) ",
                "utf8_pos": 5028,
                "subst": [],
              },
              "start": 5027,
              "end": 5062,
            },
            "loc": [4964, 98],
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
              { "term": { "$tag": "Image", "0": "\"|\"", "loc": [5114, 5117] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_clause_list",
                  "loc": [5118, 5138],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $2 ",
                "utf8_pos": 5140,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 5139,
              "end": 5145,
            },
            "loc": [5114, 31],
          },
          {
            "items": [
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_clause_list",
                  "loc": [5150, 5170],
                },
              },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 5172,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 5171,
              "end": 5177,
            },
            "loc": [5150, 27],
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
                "term": { "$tag": "Symbol", "0": "clause", "loc": [5245, 5251] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(clause, Nil) ",
                "utf8_pos": 5253,
                "subst": [],
              },
              "start": 5252,
              "end": 5273,
            },
            "loc": [5238, 35],
          },
          {
            "items": [
              {
                "binder": "clause",
                "term": { "$tag": "Symbol", "0": "clause", "loc": [5285, 5291] },
              },
              { "term": { "$tag": "Image", "0": "\"|\"", "loc": [5292, 5295] } },
              {
                "binder": "clause_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_clause_list",
                  "loc": [5308, 5328],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(clause, clause_list) ",
                "utf8_pos": 5330,
                "subst": [],
              },
              "start": 5329,
              "end": 5358,
            },
            "loc": [5278, 80],
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
                  "loc": [5400, 5409],
                },
              },
              {
                "binder": "prec",
                "term": {
                  "$tag": "Symbol",
                  "0": "rule_prec",
                  "loc": [5415, 5424],
                },
              },
              {
                "binder": "action",
                "term": {
                  "$tag": "Symbol",
                  "0": "clause_action",
                  "loc": [5432, 5445],
                },
              },
            ],
            "action": {
              "code": {
                "code": " { items: item_list.to_array(), prec, action, loc: ($startpos, $endpos - $startpos) } ",
                "utf8_pos": 5447,
                "subst": [
                  { "start": 52, "end": 61, "desc": { "$tag": "StartPos" } },
                  { "start": 63, "end": 70, "desc": { "$tag": "EndPos" } },
                  { "start": 73, "end": 82, "desc": { "$tag": "StartPos" } },
                ],
              },
              "start": 5446,
              "end": 5534,
            },
            "loc": [5390, 144],
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
                  "loc": [5584, 5602],
                },
              },
            ],
            "action": {
              "code": {
                "code": "\n      let (code, utf8_pos, subst) = code\n      { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\n  ",
                "utf8_pos": 5604,
                "subst": [
                  { "start": 96, "end": 105, "desc": { "$tag": "StartPos" } },
                  { "start": 112, "end": 119, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 5603,
              "end": 5729,
            },
            "loc": [5579, 150],
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
                  "loc": [5765, 5772],
                },
              },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [5780, 5786] },
              },
            ],
            "action": {
              "code": {
                "code": " Some(symbol) ",
                "utf8_pos": 5788,
                "subst": [],
              },
              "start": 5787,
              "end": 5803,
            },
            "loc": [5765, 38],
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 5809, "subst": [] },
              "start": 5808,
              "end": 5816,
            },
            "loc": [5807, 9],
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
                "term": { "$tag": "Symbol", "0": "item", "loc": [5875, 5879] },
              },
              {
                "binder": "item_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "item_list",
                  "loc": [5890, 5899],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(item, item_list) ",
                "utf8_pos": 5901,
                "subst": [],
              },
              "start": 5900,
              "end": 5925,
            },
            "loc": [5870, 55],
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "utf8_pos": 5931, "subst": [] },
              "start": 5930,
              "end": 5937,
            },
            "loc": [5929, 8],
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
                "term": { "$tag": "Symbol", "0": "term", "loc": [5976, 5980] },
              },
            ],
            "action": {
              "code": {
                "code": " { binder: None, term: term } ",
                "utf8_pos": 5982,
                "subst": [],
              },
              "start": 5981,
              "end": 6013,
            },
            "loc": [5971, 42],
          },
          {
            "items": [
              {
                "binder": "binder",
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [6025, 6030] },
              },
              { "term": { "$tag": "Image", "0": "\"=\"", "loc": [6031, 6034] } },
              {
                "binder": "term",
                "term": { "$tag": "Symbol", "0": "term", "loc": [6040, 6044] },
              },
            ],
            "action": {
              "code": {
                "code": " { binder: Some(binder), term: term } ",
                "utf8_pos": 6046,
                "subst": [],
              },
              "start": 6045,
              "end": 6085,
            },
            "loc": [6018, 67],
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
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [6120, 6126] },
              },
            ],
            "action": {
              "code": {
                "code": " Symbol(symbol, loc=($startpos, $endpos)) ",
                "utf8_pos": 6128,
                "subst": [
                  { "start": 21, "end": 30, "desc": { "$tag": "StartPos" } },
                  { "start": 32, "end": 39, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 6127,
              "end": 6171,
            },
            "loc": [6113, 58],
          },
          {
            "items": [
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [6183, 6189] },
              },
              { "term": { "$tag": "Image", "0": "\"(\"", "loc": [6190, 6193] } },
              {
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_term_list",
                  "loc": [6194, 6218],
                },
              },
              { "term": { "$tag": "Image", "0": "\")\"", "loc": [6219, 6222] } },
            ],
            "action": {
              "code": {
                "code": " RuleCall(symbol, symbol_loc=($startpos(symbol), $endpos(symbol)), $3.to_array()) ",
                "utf8_pos": 6224,
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
              "start": 6223,
              "end": 6307,
            },
            "loc": [6176, 131],
          },
          {
            "items": [
              {
                "binder": "image",
                "term": { "$tag": "Symbol", "0": "STRING", "loc": [6318, 6324] },
              },
            ],
            "action": {
              "code": {
                "code": " Image(image, loc=($startpos, $endpos)) ",
                "utf8_pos": 6326,
                "subst": [
                  { "start": 19, "end": 28, "desc": { "$tag": "StartPos" } },
                  { "start": 30, "end": 37, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 6325,
              "end": 6367,
            },
            "loc": [6312, 55],
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
                "term": { "$tag": "Symbol", "0": "term", "loc": [6435, 6439] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(term, Nil) ",
                "utf8_pos": 6441,
                "subst": [],
              },
              "start": 6440,
              "end": 6459,
            },
            "loc": [6430, 29],
          },
          {
            "items": [
              {
                "binder": "term",
                "term": { "$tag": "Symbol", "0": "term", "loc": [6469, 6473] },
              },
              { "term": { "$tag": "Image", "0": "\",\"", "loc": [6474, 6477] } },
              {
                "binder": "term_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_comma_term_list",
                  "loc": [6488, 6512],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(term, term_list) ",
                "utf8_pos": 6514,
                "subst": [],
              },
              "start": 6513,
              "end": 6538,
            },
            "loc": [6464, 74],
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
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [6606, 6612] },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(symbol, Nil) ",
                "utf8_pos": 6614,
                "subst": [],
              },
              "start": 6613,
              "end": 6634,
            },
            "loc": [6599, 35],
          },
          {
            "items": [
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol", "loc": [6646, 6652] },
              },
              {
                "binder": "symbol_list",
                "term": {
                  "$tag": "Symbol",
                  "0": "nonempty_symbol_list",
                  "loc": [6665, 6685],
                },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(symbol, symbol_list) ",
                "utf8_pos": 6687,
                "subst": [],
              },
              "start": 6686,
              "end": 6715,
            },
            "loc": [6639, 76],
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
                "term": { "$tag": "Symbol", "0": "IDENT", "loc": [6753, 6758] },
              },
            ],
            "action": {
              "code": { "code": " ident ", "utf8_pos": 6760, "subst": [] },
              "start": 6759,
              "end": 6768,
            },
            "loc": [6747, 21],
          },
        ],
      },
    ],
  })
}
