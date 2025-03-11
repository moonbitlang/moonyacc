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
      #|STRING("\":\"")
      #|IDENT("clause_list")
      #|EQ
      #|IDENT("clause_list")
      #|STRING("\";\"")
      #|LBRACE_CODE_RBRACE((" { inline: false, nonterminal, type_: None, clauses: clause_list.to_array() } ", 2791, []))
      #|BAR
      #|IDENT("nonterminal")
      #|EQ
      #|IDENT("symbol")
      #|STRING("\"->\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("type_expr")
      #|STRING("\":\"")
      #|IDENT("clause_list")
      #|EQ
      #|IDENT("clause_list")
      #|STRING("\";\"")
      #|LBRACE_CODE_RBRACE((" { inline: false, nonterminal, type_: Some(type_), clauses: clause_list.to_array() } ", 2948, []))
      #|SEMI
      #|IDENT("type_expr")
      #|ARROW
      #|IDENT("TypeExpr")
      #|COLON
      #|IDENT("basic_type_expr")
      #|LBRACE_CODE_RBRACE((" $1 ", 3083, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("basic_type_expr")
      #|STRING("\"?\"")
      #|LBRACE_CODE_RBRACE((" Option($1) ", 3114, [{start: 8, end: 10, desc: Dollar(1)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\")\"")
      #|STRING("\"->\"")
      #|IDENT("type_expr")
      #|LBRACE_CODE_RBRACE((" Arrow($2.to_array(), $5) ", 3180, [{start: 7, end: 9, desc: Dollar(2)}, {start: 22, end: 24, desc: Dollar(5)}]))
      #|SEMI
      #|PERCENT_INLINE
      #|IDENT("basic_type_expr")
      #|ARROW
      #|IDENT("TypeExpr")
      #|COLON
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=None, $1, []) ", 3260, [{start: 18, end: 20, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("PKG_AND_IDENT")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=Some($1.0), $1.1, []) ", 3307, [{start: 17, end: 19, desc: Dollar(1)}, {start: 24, end: 26, desc: Dollar(1)}]))
      #|BAR
      #|IDENT("IDENT")
      #|STRING("\"[\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\"]\"")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=None, $1, $3.to_array()) ", 3386, [{start: 18, end: 20, desc: Dollar(1)}, {start: 22, end: 24, desc: Dollar(3)}]))
      #|BAR
      #|IDENT("PKG_AND_IDENT")
      #|STRING("\"[\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\"]\"")
      #|LBRACE_CODE_RBRACE((" Constr(pkg=Some($1.0), $1.1, $3.to_array()) ", 3476, [{start: 17, end: 19, desc: Dollar(1)}, {start: 24, end: 26, desc: Dollar(1)}, {start: 30, end: 32, desc: Dollar(3)}]))
      #|BAR
      #|STRING("\"(\"")
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("nonempty_type_expr_list")
      #|STRING("\")\"")
      #|LBRACE_CODE_RBRACE((" Tuple(@immut/list.Cons($2, $4).to_array()) ", 3574, [{start: 24, end: 26, desc: Dollar(2)}, {start: 28, end: 30, desc: Dollar(4)}]))
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
      #|LBRACE_CODE_RBRACE((" Cons(type_expr, Nil) ", 3701, []))
      #|BAR
      #|IDENT("type_expr")
      #|EQ
      #|IDENT("type_expr")
      #|STRING("\",\"")
      #|IDENT("type_expr_list")
      #|EQ
      #|IDENT("nonempty_type_expr_list")
      #|LBRACE_CODE_RBRACE((" Cons(type_expr, type_expr_list) ", 3793, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(clause, Nil) ", 3889, []))
      #|BAR
      #|IDENT("clause")
      #|EQ
      #|IDENT("clause")
      #|STRING("\"|\"")
      #|IDENT("clause_list")
      #|EQ
      #|IDENT("clause_list")
      #|LBRACE_CODE_RBRACE((" Cons(clause, clause_list) ", 3957, []))
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
      #|LBRACE_CODE_RBRACE((" { items: item_list.to_array(), prec, action } ", 4069, []))
      #|SEMI
      #|IDENT("clause_action")
      #|ARROW
      #|IDENT("ClauseAction")
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("LBRACE_CODE_RBRACE")
      #|LBRACE_CODE_RBRACE(("\n      let (code, utf8_pos, subst) = code\n      { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\n  ", 4182, [{start: 96, end: 105, desc: StartPos}, {start: 112, end: 119, desc: EndPos}]))
      #|BAR
      #|LBRACE_CODE_RBRACE((" { code: None, start: $startpos, end: $endpos } ", 4313, [{start: 22, end: 31, desc: StartPos}, {start: 38, end: 45, desc: EndPos}]))
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
      #|LBRACE_CODE_RBRACE((" Some(symbol) ", 4416, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 4437, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(item, item_list) ", 4524, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", 4554, []))
      #|SEMI
      #|IDENT("item")
      #|ARROW
      #|IDENT("ClauseItem")
      #|COLON
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|LBRACE_CODE_RBRACE((" { binder: None, term: term } ", 4600, []))
      #|BAR
      #|IDENT("binder")
      #|EQ
      #|IDENT("IDENT")
      #|STRING("\"=\"")
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|LBRACE_CODE_RBRACE((" { binder: Some(binder), term: term } ", 4664, []))
      #|SEMI
      #|IDENT("term")
      #|ARROW
      #|IDENT("Term")
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Symbol(symbol) ", 4741, []))
      #|BAR
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Image(image) ", 4777, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(symbol, Nil) ", 4863, []))
      #|BAR
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Cons(symbol, symbol_list) ", 4936, []))
      #|SEMI
      #|IDENT("symbol")
      #|ARROW
      #|IDENT("Symbol")
      #|COLON
      #|IDENT("ident")
      #|EQ
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" ident ", 5004, []))
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
        "type_": { "$tag": "Constr", "pkg": Null, "0": "ParserSpec", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "header",
                "term": { "$tag": "Symbol", "0": "header" },
              },
              {
                "binder": "decl_list",
                "term": { "$tag": "Symbol", "0": "decl_list" },
              },
              { "term": { "$tag": "Image", "0": "\"%%\"" } },
              {
                "binder": "rule_list",
                "term": { "$tag": "Symbol", "0": "rule_list" },
              },
              {
                "binder": "trailer",
                "term": { "$tag": "Symbol", "0": "trailer" },
              },
              { "term": { "$tag": "Symbol", "0": "EOF" } },
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
                "term": { "$tag": "Symbol", "0": "PERCENT_PERCENT_CODE_EOF" },
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
        "type_": {
          "$tag": "Constr",
          "pkg": "immut/list",
          "0": "T",
          "1": [{ "$tag": "Constr", "pkg": Null, "0": "Declaration", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              { "binder": "decl", "term": { "$tag": "Symbol", "0": "decl" } },
              {
                "binder": "decl_list",
                "term": { "$tag": "Symbol", "0": "decl_list" },
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
        "type_": { "$tag": "Constr", "pkg": Null, "0": "Declaration", "1": [] },
        "clauses": [
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"%start\"" } },
              {
                "binder": "symbol_list",
                "term": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
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
              { "term": { "$tag": "Image", "0": "\"%token\"" } },
              {
                "binder": "symbol_list",
                "term": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
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
              { "term": { "$tag": "Image", "0": "\"%token\"" } },
              { "term": { "$tag": "Image", "0": "\"<\"" } },
              {
                "binder": "type_",
                "term": { "$tag": "Symbol", "0": "type_expr" },
              },
              { "term": { "$tag": "Image", "0": "\">\"" } },
              {
                "binder": "symbol_list",
                "term": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
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
              { "term": { "$tag": "Image", "0": "\"%token\"" } },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol" },
              },
              { "binder": "image", "term": { "$tag": "Symbol", "0": "STRING" } },
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
              { "term": { "$tag": "Image", "0": "\"%token\"" } },
              { "term": { "$tag": "Image", "0": "\"<\"" } },
              {
                "binder": "type_",
                "term": { "$tag": "Symbol", "0": "type_expr" },
              },
              { "term": { "$tag": "Image", "0": "\">\"" } },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol" },
              },
              { "binder": "image", "term": { "$tag": "Symbol", "0": "STRING" } },
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
              { "term": { "$tag": "Image", "0": "\"%type\"" } },
              { "term": { "$tag": "Image", "0": "\"<\"" } },
              {
                "binder": "type_",
                "term": { "$tag": "Symbol", "0": "type_expr" },
              },
              { "term": { "$tag": "Image", "0": "\">\"" } },
              {
                "binder": "symbol_list",
                "term": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
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
              { "term": { "$tag": "Image", "0": "\"%position\"" } },
              { "term": { "$tag": "Image", "0": "\"<\"" } },
              {
                "binder": "type_",
                "term": { "$tag": "Symbol", "0": "type_expr" },
              },
              { "term": { "$tag": "Image", "0": "\">\"" } },
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
              { "term": { "$tag": "Image", "0": "\"%left\"" } },
              {
                "binder": "symbol_list",
                "term": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
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
              { "term": { "$tag": "Image", "0": "\"%right\"" } },
              {
                "binder": "symbol_list",
                "term": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
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
              { "term": { "$tag": "Image", "0": "\"%nonassoc\"" } },
              {
                "binder": "symbol_list",
                "term": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
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
              { "term": { "$tag": "Image", "0": "\"%derive\"" } },
              { "term": { "$tag": "Image", "0": "\"<\"" } },
              {
                "binder": "trait_list",
                "term": { "$tag": "Symbol", "0": "nonempty_type_expr_list" },
              },
              { "term": { "$tag": "Image", "0": "\">\"" } },
              { "binder": "type_", "term": { "$tag": "Symbol", "0": "IDENT" } },
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
        "type_": {
          "$tag": "Constr",
          "pkg": "immut/list",
          "0": "T",
          "1": [{ "$tag": "Constr", "pkg": Null, "0": "Rule", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              { "binder": "rule", "term": { "$tag": "Symbol", "0": "rule" } },
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
              { "binder": "rule", "term": { "$tag": "Symbol", "0": "rule" } },
              {
                "binder": "rule_list",
                "term": { "$tag": "Symbol", "0": "rule_list" },
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
        "type_": { "$tag": "Constr", "pkg": Null, "0": "Rule", "1": [] },
        "clauses": [
          {
            "items": [
              { "term": { "$tag": "Symbol", "0": "rule_no_modifiers" } },
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
              { "term": { "$tag": "Image", "0": "\"%inline\"" } },
              { "term": { "$tag": "Symbol", "0": "rule_no_modifiers" } },
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
        "type_": { "$tag": "Constr", "pkg": Null, "0": "Rule", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "nonterminal",
                "term": { "$tag": "Symbol", "0": "symbol" },
              },
              { "term": { "$tag": "Image", "0": "\":\"" } },
              {
                "binder": "clause_list",
                "term": { "$tag": "Symbol", "0": "clause_list" },
              },
              { "term": { "$tag": "Image", "0": "\";\"" } },
            ],
            "action": {
              "code": {
                "code": " { inline: false, nonterminal, type_: None, clauses: clause_list.to_array() } ",
                "utf8_pos": 2791,
                "subst": [],
              },
              "start": 2790,
              "end": 2870,
            },
          },
          {
            "items": [
              {
                "binder": "nonterminal",
                "term": { "$tag": "Symbol", "0": "symbol" },
              },
              { "term": { "$tag": "Image", "0": "\"->\"" } },
              {
                "binder": "type_",
                "term": { "$tag": "Symbol", "0": "type_expr" },
              },
              { "term": { "$tag": "Image", "0": "\":\"" } },
              {
                "binder": "clause_list",
                "term": { "$tag": "Symbol", "0": "clause_list" },
              },
              { "term": { "$tag": "Image", "0": "\";\"" } },
            ],
            "action": {
              "code": {
                "code": " { inline: false, nonterminal, type_: Some(type_), clauses: clause_list.to_array() } ",
                "utf8_pos": 2948,
                "subst": [],
              },
              "start": 2947,
              "end": 3034,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "type_expr",
        "type_": { "$tag": "Constr", "pkg": Null, "0": "TypeExpr", "1": [] },
        "clauses": [
          {
            "items": [{ "term": { "$tag": "Symbol", "0": "basic_type_expr" } }],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 3083,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 3082,
              "end": 3088,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Symbol", "0": "basic_type_expr" } },
              { "term": { "$tag": "Image", "0": "\"?\"" } },
            ],
            "action": {
              "code": {
                "code": " Option($1) ",
                "utf8_pos": 3114,
                "subst": [
                  {
                    "start": 8,
                    "end": 10,
                    "desc": { "$tag": "Dollar", "0": 1 },
                  },
                ],
              },
              "start": 3113,
              "end": 3127,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"" } },
              { "term": { "$tag": "Symbol", "0": "nonempty_type_expr_list" } },
              { "term": { "$tag": "Image", "0": "\")\"" } },
              { "term": { "$tag": "Image", "0": "\"->\"" } },
              { "term": { "$tag": "Symbol", "0": "type_expr" } },
            ],
            "action": {
              "code": {
                "code": " Arrow($2.to_array(), $5) ",
                "utf8_pos": 3180,
                "subst": [
                  { "start": 7, "end": 9, "desc": { "$tag": "Dollar", "0": 2 } },
                  {
                    "start": 22,
                    "end": 24,
                    "desc": { "$tag": "Dollar", "0": 5 },
                  },
                ],
              },
              "start": 3179,
              "end": 3207,
            },
          },
        ],
      },
      {
        "inline": true,
        "nonterminal": "basic_type_expr",
        "type_": { "$tag": "Constr", "pkg": Null, "0": "TypeExpr", "1": [] },
        "clauses": [
          {
            "items": [{ "term": { "$tag": "Symbol", "0": "IDENT" } }],
            "action": {
              "code": {
                "code": " Constr(pkg=None, $1, []) ",
                "utf8_pos": 3260,
                "subst": [
                  {
                    "start": 18,
                    "end": 20,
                    "desc": { "$tag": "Dollar", "0": 1 },
                  },
                ],
              },
              "start": 3259,
              "end": 3287,
            },
          },
          {
            "items": [{ "term": { "$tag": "Symbol", "0": "PKG_AND_IDENT" } }],
            "action": {
              "code": {
                "code": " Constr(pkg=Some($1.0), $1.1, []) ",
                "utf8_pos": 3307,
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
              "start": 3306,
              "end": 3342,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Symbol", "0": "IDENT" } },
              { "term": { "$tag": "Image", "0": "\"[\"" } },
              { "term": { "$tag": "Symbol", "0": "nonempty_type_expr_list" } },
              { "term": { "$tag": "Image", "0": "\"]\"" } },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=None, $1, $3.to_array()) ",
                "utf8_pos": 3386,
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
              "start": 3385,
              "end": 3424,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Symbol", "0": "PKG_AND_IDENT" } },
              { "term": { "$tag": "Image", "0": "\"[\"" } },
              { "term": { "$tag": "Symbol", "0": "nonempty_type_expr_list" } },
              { "term": { "$tag": "Image", "0": "\"]\"" } },
            ],
            "action": {
              "code": {
                "code": " Constr(pkg=Some($1.0), $1.1, $3.to_array()) ",
                "utf8_pos": 3476,
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
              "start": 3475,
              "end": 3522,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"(\"" } },
              { "term": { "$tag": "Symbol", "0": "type_expr" } },
              { "term": { "$tag": "Image", "0": "\",\"" } },
              { "term": { "$tag": "Symbol", "0": "nonempty_type_expr_list" } },
              { "term": { "$tag": "Image", "0": "\")\"" } },
            ],
            "action": {
              "code": {
                "code": " Tuple(@immut/list.Cons($2, $4).to_array()) ",
                "utf8_pos": 3574,
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
              "start": 3573,
              "end": 3619,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "nonempty_type_expr_list",
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
                "term": { "$tag": "Symbol", "0": "type_expr" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(type_expr, Nil) ",
                "utf8_pos": 3701,
                "subst": [],
              },
              "start": 3700,
              "end": 3724,
            },
          },
          {
            "items": [
              {
                "binder": "type_expr",
                "term": { "$tag": "Symbol", "0": "type_expr" },
              },
              { "term": { "$tag": "Image", "0": "\",\"" } },
              {
                "binder": "type_expr_list",
                "term": { "$tag": "Symbol", "0": "nonempty_type_expr_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(type_expr, type_expr_list) ",
                "utf8_pos": 3793,
                "subst": [],
              },
              "start": 3792,
              "end": 3827,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "clause_list",
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
                "term": { "$tag": "Symbol", "0": "clause" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(clause, Nil) ",
                "utf8_pos": 3889,
                "subst": [],
              },
              "start": 3888,
              "end": 3909,
            },
          },
          {
            "items": [
              {
                "binder": "clause",
                "term": { "$tag": "Symbol", "0": "clause" },
              },
              { "term": { "$tag": "Image", "0": "\"|\"" } },
              {
                "binder": "clause_list",
                "term": { "$tag": "Symbol", "0": "clause_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(clause, clause_list) ",
                "utf8_pos": 3957,
                "subst": [],
              },
              "start": 3956,
              "end": 3985,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "clause",
        "type_": { "$tag": "Constr", "pkg": Null, "0": "Clause", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "item_list",
                "term": { "$tag": "Symbol", "0": "item_list" },
              },
              {
                "binder": "prec",
                "term": { "$tag": "Symbol", "0": "rule_prec" },
              },
              {
                "binder": "action",
                "term": { "$tag": "Symbol", "0": "clause_action" },
              },
            ],
            "action": {
              "code": {
                "code": " { items: item_list.to_array(), prec, action } ",
                "utf8_pos": 4069,
                "subst": [],
              },
              "start": 4068,
              "end": 4117,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "clause_action",
        "type_": { "$tag": "Constr", "pkg": Null, "0": "ClauseAction", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "code",
                "term": { "$tag": "Symbol", "0": "LBRACE_CODE_RBRACE" },
              },
            ],
            "action": {
              "code": {
                "code": "\n      let (code, utf8_pos, subst) = code\n      { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\n  ",
                "utf8_pos": 4182,
                "subst": [
                  { "start": 96, "end": 105, "desc": { "$tag": "StartPos" } },
                  { "start": 112, "end": 119, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 4181,
              "end": 4307,
            },
          },
          {
            "items": [],
            "action": {
              "code": {
                "code": " { code: None, start: $startpos, end: $endpos } ",
                "utf8_pos": 4313,
                "subst": [
                  { "start": 22, "end": 31, "desc": { "$tag": "StartPos" } },
                  { "start": 38, "end": 45, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 4312,
              "end": 4362,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "rule_prec",
        "type_": {
          "$tag": "Option",
          "0": { "$tag": "Constr", "pkg": Null, "0": "Symbol", "1": [] },
        },
        "clauses": [
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"%prec\"" } },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol" },
              },
            ],
            "action": {
              "code": {
                "code": " Some(symbol) ",
                "utf8_pos": 4416,
                "subst": [],
              },
              "start": 4415,
              "end": 4431,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 4437, "subst": [] },
              "start": 4436,
              "end": 4444,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "item_list",
        "type_": {
          "$tag": "Constr",
          "pkg": "immut/list",
          "0": "T",
          "1": [{ "$tag": "Constr", "pkg": Null, "0": "ClauseItem", "1": [] }],
        },
        "clauses": [
          {
            "items": [
              { "binder": "item", "term": { "$tag": "Symbol", "0": "item" } },
              {
                "binder": "item_list",
                "term": { "$tag": "Symbol", "0": "item_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(item, item_list) ",
                "utf8_pos": 4524,
                "subst": [],
              },
              "start": 4523,
              "end": 4548,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "utf8_pos": 4554, "subst": [] },
              "start": 4553,
              "end": 4560,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "item",
        "type_": { "$tag": "Constr", "pkg": Null, "0": "ClauseItem", "1": [] },
        "clauses": [
          {
            "items": [
              { "binder": "term", "term": { "$tag": "Symbol", "0": "term" } },
            ],
            "action": {
              "code": {
                "code": " { binder: None, term: term } ",
                "utf8_pos": 4600,
                "subst": [],
              },
              "start": 4599,
              "end": 4631,
            },
          },
          {
            "items": [
              { "binder": "binder", "term": { "$tag": "Symbol", "0": "IDENT" } },
              { "term": { "$tag": "Image", "0": "\"=\"" } },
              { "binder": "term", "term": { "$tag": "Symbol", "0": "term" } },
            ],
            "action": {
              "code": {
                "code": " { binder: Some(binder), term: term } ",
                "utf8_pos": 4664,
                "subst": [],
              },
              "start": 4663,
              "end": 4703,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "term",
        "type_": { "$tag": "Constr", "pkg": Null, "0": "Term", "1": [] },
        "clauses": [
          {
            "items": [
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol" },
              },
            ],
            "action": {
              "code": {
                "code": " Symbol(symbol) ",
                "utf8_pos": 4741,
                "subst": [],
              },
              "start": 4740,
              "end": 4758,
            },
          },
          {
            "items": [
              { "binder": "image", "term": { "$tag": "Symbol", "0": "STRING" } },
            ],
            "action": {
              "code": {
                "code": " Image(image) ",
                "utf8_pos": 4777,
                "subst": [],
              },
              "start": 4776,
              "end": 4792,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "nonempty_symbol_list",
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
                "term": { "$tag": "Symbol", "0": "symbol" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(symbol, Nil) ",
                "utf8_pos": 4863,
                "subst": [],
              },
              "start": 4862,
              "end": 4883,
            },
          },
          {
            "items": [
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol" },
              },
              {
                "binder": "symbol_list",
                "term": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(symbol, symbol_list) ",
                "utf8_pos": 4936,
                "subst": [],
              },
              "start": 4935,
              "end": 4964,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "symbol",
        "type_": { "$tag": "Constr", "pkg": Null, "0": "Symbol", "1": [] },
        "clauses": [
          {
            "items": [
              { "binder": "ident", "term": { "$tag": "Symbol", "0": "IDENT" } },
            ],
            "action": {
              "code": { "code": " ident ", "utf8_pos": 5004, "subst": [] },
              "start": 5003,
              "end": 5012,
            },
          },
        ],
      },
    ],
  })
}
