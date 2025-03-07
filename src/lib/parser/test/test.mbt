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
      #|LANGLE_CODE_RANGLE("(String, Int, Array[SubstItem])")
      #|IDENT("LBRACE_CODE_RBRACE")
      #|PERCENT_TOKEN
      #|LANGLE_CODE_RANGLE("String")
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|PERCENT_TOKEN
      #|LANGLE_CODE_RANGLE("String")
      #|IDENT("ARROW_CODE")
      #|PERCENT_TOKEN
      #|LANGLE_CODE_RANGLE("String")
      #|IDENT("PERCENT_PERCENT_CODE_EOF")
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
      #|ARROW_CODE("ParserSpec")
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
      #|LBRACE_CODE_RBRACE((" { header, decls: decl_list.to_array(), rules: rule_list.to_array(), trailer } ", 821, []))
      #|SEMI
      #|IDENT("header")
      #|ARROW_CODE("Code?")
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|LBRACE_CODE_RBRACE((" Some(code) ", 972, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 993, []))
      #|SEMI
      #|IDENT("trailer")
      #|ARROW_CODE("Code?")
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1072, []))
      #|BAR
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_PERCENT_CODE_EOF")
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1123, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 1144, []))
      #|SEMI
      #|IDENT("decl_list")
      #|ARROW_CODE("@immut/list.T[Declaration]")
      #|COLON
      #|IDENT("decl")
      #|EQ
      #|IDENT("decl")
      #|IDENT("decl_list")
      #|EQ
      #|IDENT("decl_list")
      #|LBRACE_CODE_RBRACE((" Cons(decl, decl_list) ", 1236, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", 1268, []))
      #|SEMI
      #|IDENT("decl")
      #|ARROW_CODE("Declaration")
      #|COLON
      #|STRING("\"%start\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Start(symbol_list.to_array()) ", 1351, []))
      #|BAR
      #|STRING("\"%token\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("opt_type")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Token(symbol_list.to_array(), type_=type_) ", 1448, []))
      #|BAR
      #|STRING("\"%token\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("opt_type")
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Token1(symbol, type_=type_, image=image) ", 1552, []))
      #|BAR
      #|STRING("\"%type\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Type(symbol_list.to_array(), type_=type_) ", 1669, []))
      #|BAR
      #|STRING("\"%position\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|LBRACE_CODE_RBRACE((" Position(type_=type_) ", 1758, []))
      #|BAR
      #|STRING("\"%left\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Left(symbol_list.to_array()) ", 1831, []))
      #|BAR
      #|STRING("\"%right\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Right(symbol_list.to_array()) ", 1912, []))
      #|BAR
      #|STRING("\"%nonassoc\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Nonassoc(symbol_list.to_array()) ", 1997, []))
      #|BAR
      #|STRING("\"%derive\"")
      #|IDENT("traits")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|IDENT("type_")
      #|EQ
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Derive(traits=traits, type_=type_) ", 2088, []))
      #|SEMI
      #|IDENT("opt_type")
      #|ARROW_CODE("Code?")
      #|COLON
      #|IDENT("type_")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|LBRACE_CODE_RBRACE((" Some(type_) ", 2183, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 2205, []))
      #|SEMI
      #|IDENT("rule_list")
      #|ARROW_CODE("@immut/list.T[Rule]")
      #|COLON
      #|IDENT("rule")
      #|EQ
      #|IDENT("rule")
      #|LBRACE_CODE_RBRACE((" Cons(rule, Nil) ", 2270, []))
      #|BAR
      #|IDENT("rule")
      #|EQ
      #|IDENT("rule")
      #|IDENT("rule_list")
      #|EQ
      #|IDENT("rule_list")
      #|LBRACE_CODE_RBRACE((" Cons(rule, rule_list) ", 2326, []))
      #|SEMI
      #|IDENT("rule")
      #|ARROW_CODE("Rule")
      #|COLON
      #|IDENT("rule_no_modifiers")
      #|LBRACE_CODE_RBRACE((" $1 ", 2396, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|STRING("\"%inline\"")
      #|IDENT("rule_no_modifiers")
      #|LBRACE_CODE_RBRACE((" { ..$2, inline: true } ", 2437, [{start: 5, end: 7, desc: Dollar(2)}]))
      #|SEMI
      #|IDENT("rule_no_modifiers")
      #|ARROW_CODE("Rule")
      #|COLON
      #|IDENT("nonterminal")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("type_")
      #|EQ
      #|IDENT("rule_type")
      #|STRING("\":\"")
      #|IDENT("clause_list")
      #|EQ
      #|IDENT("clause_list")
      #|STRING("\";\"")
      #|LBRACE_CODE_RBRACE((" { inline: false, nonterminal, type_, clauses: clause_list.to_array() } ", 2570, []))
      #|SEMI
      #|IDENT("rule_type")
      #|ARROW_CODE("Code?")
      #|COLON
      #|IDENT("type_")
      #|EQ
      #|IDENT("ARROW_CODE")
      #|LBRACE_CODE_RBRACE((" Some(type_) ", 2694, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 2716, []))
      #|SEMI
      #|IDENT("clause_list")
      #|ARROW_CODE("@immut/list.T[Clause]")
      #|COLON
      #|IDENT("clause")
      #|EQ
      #|IDENT("clause")
      #|LBRACE_CODE_RBRACE((" Cons(clause, Nil) ", 2789, []))
      #|BAR
      #|IDENT("clause")
      #|EQ
      #|IDENT("clause")
      #|STRING("\"|\"")
      #|IDENT("clause_list")
      #|EQ
      #|IDENT("clause_list")
      #|LBRACE_CODE_RBRACE((" Cons(clause, clause_list) ", 2859, []))
      #|SEMI
      #|IDENT("clause")
      #|ARROW_CODE("Clause")
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
      #|LBRACE_CODE_RBRACE((" { items: item_list.to_array(), prec, action } ", 2975, []))
      #|SEMI
      #|IDENT("clause_action")
      #|ARROW_CODE("ClauseAction")
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("LBRACE_CODE_RBRACE")
      #|LBRACE_CODE_RBRACE(("\n        let (code, utf8_pos, subst) = code\n        { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\n    ", 3092, [{start: 100, end: 109, desc: StartPos}, {start: 116, end: 123, desc: EndPos}]))
      #|BAR
      #|LBRACE_CODE_RBRACE((" { code: None, start: $startpos, end: $endpos } ", 3231, [{start: 22, end: 31, desc: StartPos}, {start: 38, end: 45, desc: EndPos}]))
      #|SEMI
      #|IDENT("rule_prec")
      #|ARROW_CODE("Symbol?")
      #|COLON
      #|STRING("\"%prec\"")
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Some(symbol) ", 3338, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 3361, []))
      #|SEMI
      #|IDENT("item_list")
      #|ARROW_CODE("@immut/list.T[ClauseItem]")
      #|COLON
      #|IDENT("item")
      #|EQ
      #|IDENT("item")
      #|IDENT("item_list")
      #|EQ
      #|IDENT("item_list")
      #|LBRACE_CODE_RBRACE((" Cons(item, item_list) ", 3452, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", 3484, []))
      #|SEMI
      #|IDENT("item")
      #|ARROW_CODE("ClauseItem")
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("item_symbol")
      #|LBRACE_CODE_RBRACE((" { binder: None, symbol: symbol } ", 3543, []))
      #|BAR
      #|IDENT("binder")
      #|EQ
      #|IDENT("IDENT")
      #|STRING("\"=\"")
      #|IDENT("symbol")
      #|EQ
      #|IDENT("item_symbol")
      #|LBRACE_CODE_RBRACE((" { binder: Some(binder), symbol: symbol } ", 3622, []))
      #|SEMI
      #|IDENT("item_symbol")
      #|ARROW_CODE("ClauseItemSymbol")
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Symbol(symbol) ", 3726, []))
      #|BAR
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Image(image) ", 3764, []))
      #|SEMI
      #|IDENT("nonempty_symbol_list")
      #|ARROW_CODE("@immut/list.T[Symbol]")
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Cons(symbol, Nil) ", 3854, []))
      #|BAR
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Cons(symbol, symbol_list) ", 3929, []))
      #|SEMI
      #|IDENT("symbol")
      #|ARROW_CODE("Symbol")
      #|COLON
      #|IDENT("ident")
      #|EQ
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" ident ", 4001, []))
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
        "type_": "(String, Int, Array[SubstItem])",
      },
      {
        "$tag": "Token",
        "0": ["PERCENT_LBRACE_CODE_PERCENT_RBRACE"],
        "type_": "String",
      },
      { "$tag": "Token", "0": ["ARROW_CODE"], "type_": "String" },
      { "$tag": "Token", "0": ["PERCENT_PERCENT_CODE_EOF"], "type_": "String" },
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
      { "$tag": "Token1", "0": "COLON", "type_": Null, "image": "\":\"" },
      { "$tag": "Token1", "0": "BAR", "type_": Null, "image": "\"|\"" },
      { "$tag": "Token1", "0": "EQ", "type_": Null, "image": "\"=\"" },
      { "$tag": "Token1", "0": "SEMI", "type_": Null, "image": "\";\"" },
    ],
    "rules": [
      {
        "inline": false,
        "nonterminal": "spec",
        "type_": "ParserSpec",
        "clauses": [
          {
            "items": [
              {
                "binder": "header",
                "symbol": { "$tag": "Symbol", "0": "header" },
              },
              {
                "binder": "decl_list",
                "symbol": { "$tag": "Symbol", "0": "decl_list" },
              },
              { "symbol": { "$tag": "Image", "0": "\"%%\"" } },
              {
                "binder": "rule_list",
                "symbol": { "$tag": "Symbol", "0": "rule_list" },
              },
              {
                "binder": "trailer",
                "symbol": { "$tag": "Symbol", "0": "trailer" },
              },
              { "symbol": { "$tag": "Symbol", "0": "EOF" } },
            ],
            "action": {
              "code": {
                "code": " { header, decls: decl_list.to_array(), rules: rule_list.to_array(), trailer } ",
                "utf8_pos": 821,
                "subst": [],
              },
              "start": 820,
              "end": 901,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "header",
        "type_": "Code?",
        "clauses": [
          {
            "items": [
              {
                "binder": "code",
                "symbol": {
                  "$tag": "Symbol",
                  "0": "PERCENT_LBRACE_CODE_PERCENT_RBRACE",
                },
              },
            ],
            "action": {
              "code": { "code": " Some(code) ", "utf8_pos": 972, "subst": [] },
              "start": 971,
              "end": 985,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 993, "subst": [] },
              "start": 992,
              "end": 1000,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "trailer",
        "type_": "Code?",
        "clauses": [
          {
            "items": [
              {
                "binder": "code",
                "symbol": {
                  "$tag": "Symbol",
                  "0": "PERCENT_LBRACE_CODE_PERCENT_RBRACE",
                },
              },
            ],
            "action": {
              "code": { "code": " Some(code) ", "utf8_pos": 1072, "subst": [] },
              "start": 1071,
              "end": 1085,
            },
          },
          {
            "items": [
              {
                "binder": "code",
                "symbol": { "$tag": "Symbol", "0": "PERCENT_PERCENT_CODE_EOF" },
              },
            ],
            "action": {
              "code": { "code": " Some(code) ", "utf8_pos": 1123, "subst": [] },
              "start": 1122,
              "end": 1136,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 1144, "subst": [] },
              "start": 1143,
              "end": 1151,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "decl_list",
        "type_": "@immut/list.T[Declaration]",
        "clauses": [
          {
            "items": [
              { "binder": "decl", "symbol": { "$tag": "Symbol", "0": "decl" } },
              {
                "binder": "decl_list",
                "symbol": { "$tag": "Symbol", "0": "decl_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(decl, decl_list) ",
                "utf8_pos": 1236,
                "subst": [],
              },
              "start": 1235,
              "end": 1260,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "utf8_pos": 1268, "subst": [] },
              "start": 1267,
              "end": 1274,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "decl",
        "type_": "Declaration",
        "clauses": [
          {
            "items": [
              { "symbol": { "$tag": "Image", "0": "\"%start\"" } },
              {
                "binder": "symbol_list",
                "symbol": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Start(symbol_list.to_array()) ",
                "utf8_pos": 1351,
                "subst": [],
              },
              "start": 1350,
              "end": 1383,
            },
          },
          {
            "items": [
              { "symbol": { "$tag": "Image", "0": "\"%token\"" } },
              {
                "binder": "type_",
                "symbol": { "$tag": "Symbol", "0": "opt_type" },
              },
              {
                "binder": "symbol_list",
                "symbol": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Token(symbol_list.to_array(), type_=type_) ",
                "utf8_pos": 1448,
                "subst": [],
              },
              "start": 1447,
              "end": 1493,
            },
          },
          {
            "items": [
              { "symbol": { "$tag": "Image", "0": "\"%token\"" } },
              {
                "binder": "type_",
                "symbol": { "$tag": "Symbol", "0": "opt_type" },
              },
              {
                "binder": "symbol",
                "symbol": { "$tag": "Symbol", "0": "symbol" },
              },
              {
                "binder": "image",
                "symbol": { "$tag": "Symbol", "0": "STRING" },
              },
            ],
            "action": {
              "code": {
                "code": " Token1(symbol, type_=type_, image=image) ",
                "utf8_pos": 1552,
                "subst": [],
              },
              "start": 1551,
              "end": 1595,
            },
          },
          {
            "items": [
              { "symbol": { "$tag": "Image", "0": "\"%type\"" } },
              {
                "binder": "type_",
                "symbol": { "$tag": "Symbol", "0": "LANGLE_CODE_RANGLE" },
              },
              {
                "binder": "symbol_list",
                "symbol": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Type(symbol_list.to_array(), type_=type_) ",
                "utf8_pos": 1669,
                "subst": [],
              },
              "start": 1668,
              "end": 1713,
            },
          },
          {
            "items": [
              { "symbol": { "$tag": "Image", "0": "\"%position\"" } },
              {
                "binder": "type_",
                "symbol": { "$tag": "Symbol", "0": "LANGLE_CODE_RANGLE" },
              },
            ],
            "action": {
              "code": {
                "code": " Position(type_=type_) ",
                "utf8_pos": 1758,
                "subst": [],
              },
              "start": 1757,
              "end": 1782,
            },
          },
          {
            "items": [
              { "symbol": { "$tag": "Image", "0": "\"%left\"" } },
              {
                "binder": "symbol_list",
                "symbol": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Left(symbol_list.to_array()) ",
                "utf8_pos": 1831,
                "subst": [],
              },
              "start": 1830,
              "end": 1862,
            },
          },
          {
            "items": [
              { "symbol": { "$tag": "Image", "0": "\"%right\"" } },
              {
                "binder": "symbol_list",
                "symbol": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Right(symbol_list.to_array()) ",
                "utf8_pos": 1912,
                "subst": [],
              },
              "start": 1911,
              "end": 1944,
            },
          },
          {
            "items": [
              { "symbol": { "$tag": "Image", "0": "\"%nonassoc\"" } },
              {
                "binder": "symbol_list",
                "symbol": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Nonassoc(symbol_list.to_array()) ",
                "utf8_pos": 1997,
                "subst": [],
              },
              "start": 1996,
              "end": 2032,
            },
          },
          {
            "items": [
              { "symbol": { "$tag": "Image", "0": "\"%derive\"" } },
              {
                "binder": "traits",
                "symbol": { "$tag": "Symbol", "0": "LANGLE_CODE_RANGLE" },
              },
              {
                "binder": "type_",
                "symbol": { "$tag": "Symbol", "0": "IDENT" },
              },
            ],
            "action": {
              "code": {
                "code": " Derive(traits=traits, type_=type_) ",
                "utf8_pos": 2088,
                "subst": [],
              },
              "start": 2087,
              "end": 2125,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "opt_type",
        "type_": "Code?",
        "clauses": [
          {
            "items": [
              {
                "binder": "type_",
                "symbol": { "$tag": "Symbol", "0": "LANGLE_CODE_RANGLE" },
              },
            ],
            "action": {
              "code": { "code": " Some(type_) ", "utf8_pos": 2183, "subst": [] },
              "start": 2182,
              "end": 2197,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 2205, "subst": [] },
              "start": 2204,
              "end": 2212,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "rule_list",
        "type_": "@immut/list.T[Rule]",
        "clauses": [
          {
            "items": [
              { "binder": "rule", "symbol": { "$tag": "Symbol", "0": "rule" } },
            ],
            "action": {
              "code": {
                "code": " Cons(rule, Nil) ",
                "utf8_pos": 2270,
                "subst": [],
              },
              "start": 2269,
              "end": 2288,
            },
          },
          {
            "items": [
              { "binder": "rule", "symbol": { "$tag": "Symbol", "0": "rule" } },
              {
                "binder": "rule_list",
                "symbol": { "$tag": "Symbol", "0": "rule_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(rule, rule_list) ",
                "utf8_pos": 2326,
                "subst": [],
              },
              "start": 2325,
              "end": 2350,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "rule",
        "type_": "Rule",
        "clauses": [
          {
            "items": [
              { "symbol": { "$tag": "Symbol", "0": "rule_no_modifiers" } },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 2396,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 2395,
              "end": 2401,
            },
          },
          {
            "items": [
              { "symbol": { "$tag": "Image", "0": "\"%inline\"" } },
              { "symbol": { "$tag": "Symbol", "0": "rule_no_modifiers" } },
            ],
            "action": {
              "code": {
                "code": " { ..$2, inline: true } ",
                "utf8_pos": 2437,
                "subst": [
                  { "start": 5, "end": 7, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 2436,
              "end": 2462,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "rule_no_modifiers",
        "type_": "Rule",
        "clauses": [
          {
            "items": [
              {
                "binder": "nonterminal",
                "symbol": { "$tag": "Symbol", "0": "symbol" },
              },
              {
                "binder": "type_",
                "symbol": { "$tag": "Symbol", "0": "rule_type" },
              },
              { "symbol": { "$tag": "Image", "0": "\":\"" } },
              {
                "binder": "clause_list",
                "symbol": { "$tag": "Symbol", "0": "clause_list" },
              },
              { "symbol": { "$tag": "Image", "0": "\";\"" } },
            ],
            "action": {
              "code": {
                "code": " { inline: false, nonterminal, type_, clauses: clause_list.to_array() } ",
                "utf8_pos": 2570,
                "subst": [],
              },
              "start": 2569,
              "end": 2643,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "rule_type",
        "type_": "Code?",
        "clauses": [
          {
            "items": [
              {
                "binder": "type_",
                "symbol": { "$tag": "Symbol", "0": "ARROW_CODE" },
              },
            ],
            "action": {
              "code": { "code": " Some(type_) ", "utf8_pos": 2694, "subst": [] },
              "start": 2693,
              "end": 2708,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 2716, "subst": [] },
              "start": 2715,
              "end": 2723,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "clause_list",
        "type_": "@immut/list.T[Clause]",
        "clauses": [
          {
            "items": [
              {
                "binder": "clause",
                "symbol": { "$tag": "Symbol", "0": "clause" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(clause, Nil) ",
                "utf8_pos": 2789,
                "subst": [],
              },
              "start": 2788,
              "end": 2809,
            },
          },
          {
            "items": [
              {
                "binder": "clause",
                "symbol": { "$tag": "Symbol", "0": "clause" },
              },
              { "symbol": { "$tag": "Image", "0": "\"|\"" } },
              {
                "binder": "clause_list",
                "symbol": { "$tag": "Symbol", "0": "clause_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(clause, clause_list) ",
                "utf8_pos": 2859,
                "subst": [],
              },
              "start": 2858,
              "end": 2887,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "clause",
        "type_": "Clause",
        "clauses": [
          {
            "items": [
              {
                "binder": "item_list",
                "symbol": { "$tag": "Symbol", "0": "item_list" },
              },
              {
                "binder": "prec",
                "symbol": { "$tag": "Symbol", "0": "rule_prec" },
              },
              {
                "binder": "action",
                "symbol": { "$tag": "Symbol", "0": "clause_action" },
              },
            ],
            "action": {
              "code": {
                "code": " { items: item_list.to_array(), prec, action } ",
                "utf8_pos": 2975,
                "subst": [],
              },
              "start": 2974,
              "end": 3023,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "clause_action",
        "type_": "ClauseAction",
        "clauses": [
          {
            "items": [
              {
                "binder": "code",
                "symbol": { "$tag": "Symbol", "0": "LBRACE_CODE_RBRACE" },
              },
            ],
            "action": {
              "code": {
                "code": "\n        let (code, utf8_pos, subst) = code\n        { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\n    ",
                "utf8_pos": 3092,
                "subst": [
                  { "start": 100, "end": 109, "desc": { "$tag": "StartPos" } },
                  { "start": 116, "end": 123, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 3091,
              "end": 3223,
            },
          },
          {
            "items": [],
            "action": {
              "code": {
                "code": " { code: None, start: $startpos, end: $endpos } ",
                "utf8_pos": 3231,
                "subst": [
                  { "start": 22, "end": 31, "desc": { "$tag": "StartPos" } },
                  { "start": 38, "end": 45, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 3230,
              "end": 3280,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "rule_prec",
        "type_": "Symbol?",
        "clauses": [
          {
            "items": [
              { "symbol": { "$tag": "Image", "0": "\"%prec\"" } },
              {
                "binder": "symbol",
                "symbol": { "$tag": "Symbol", "0": "symbol" },
              },
            ],
            "action": {
              "code": {
                "code": " Some(symbol) ",
                "utf8_pos": 3338,
                "subst": [],
              },
              "start": 3337,
              "end": 3353,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 3361, "subst": [] },
              "start": 3360,
              "end": 3368,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "item_list",
        "type_": "@immut/list.T[ClauseItem]",
        "clauses": [
          {
            "items": [
              { "binder": "item", "symbol": { "$tag": "Symbol", "0": "item" } },
              {
                "binder": "item_list",
                "symbol": { "$tag": "Symbol", "0": "item_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(item, item_list) ",
                "utf8_pos": 3452,
                "subst": [],
              },
              "start": 3451,
              "end": 3476,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "utf8_pos": 3484, "subst": [] },
              "start": 3483,
              "end": 3490,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "item",
        "type_": "ClauseItem",
        "clauses": [
          {
            "items": [
              {
                "binder": "symbol",
                "symbol": { "$tag": "Symbol", "0": "item_symbol" },
              },
            ],
            "action": {
              "code": {
                "code": " { binder: None, symbol: symbol } ",
                "utf8_pos": 3543,
                "subst": [],
              },
              "start": 3542,
              "end": 3578,
            },
          },
          {
            "items": [
              {
                "binder": "binder",
                "symbol": { "$tag": "Symbol", "0": "IDENT" },
              },
              { "symbol": { "$tag": "Image", "0": "\"=\"" } },
              {
                "binder": "symbol",
                "symbol": { "$tag": "Symbol", "0": "item_symbol" },
              },
            ],
            "action": {
              "code": {
                "code": " { binder: Some(binder), symbol: symbol } ",
                "utf8_pos": 3622,
                "subst": [],
              },
              "start": 3621,
              "end": 3665,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "item_symbol",
        "type_": "ClauseItemSymbol",
        "clauses": [
          {
            "items": [
              {
                "binder": "symbol",
                "symbol": { "$tag": "Symbol", "0": "symbol" },
              },
            ],
            "action": {
              "code": {
                "code": " Symbol(symbol) ",
                "utf8_pos": 3726,
                "subst": [],
              },
              "start": 3725,
              "end": 3743,
            },
          },
          {
            "items": [
              {
                "binder": "image",
                "symbol": { "$tag": "Symbol", "0": "STRING" },
              },
            ],
            "action": {
              "code": {
                "code": " Image(image) ",
                "utf8_pos": 3764,
                "subst": [],
              },
              "start": 3763,
              "end": 3779,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "nonempty_symbol_list",
        "type_": "@immut/list.T[Symbol]",
        "clauses": [
          {
            "items": [
              {
                "binder": "symbol",
                "symbol": { "$tag": "Symbol", "0": "symbol" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(symbol, Nil) ",
                "utf8_pos": 3854,
                "subst": [],
              },
              "start": 3853,
              "end": 3874,
            },
          },
          {
            "items": [
              {
                "binder": "symbol",
                "symbol": { "$tag": "Symbol", "0": "symbol" },
              },
              {
                "binder": "symbol_list",
                "symbol": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(symbol, symbol_list) ",
                "utf8_pos": 3929,
                "subst": [],
              },
              "start": 3928,
              "end": 3957,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "symbol",
        "type_": "Symbol",
        "clauses": [
          {
            "items": [
              {
                "binder": "ident",
                "symbol": { "$tag": "Symbol", "0": "IDENT" },
              },
            ],
            "action": {
              "code": { "code": " ident ", "utf8_pos": 4001, "subst": [] },
              "start": 4000,
              "end": 4009,
            },
          },
        ],
      },
    ],
  })
}
