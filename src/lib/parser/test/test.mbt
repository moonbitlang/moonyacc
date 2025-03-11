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
      #|LBRACE_CODE_RBRACE((" { header, decls: decl_list.to_array(), rules: rule_list.to_array(), trailer } ", 819, []))
      #|SEMI
      #|IDENT("header")
      #|ARROW_CODE("Code?")
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|LBRACE_CODE_RBRACE((" Some(code) ", 966, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 985, []))
      #|SEMI
      #|IDENT("trailer")
      #|ARROW_CODE("Code?")
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1060, []))
      #|BAR
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_PERCENT_CODE_EOF")
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1109, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 1128, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(decl, decl_list) ", 1216, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", 1246, []))
      #|SEMI
      #|IDENT("decl")
      #|ARROW_CODE("Declaration")
      #|COLON
      #|STRING("\"%start\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Start(symbol_list.to_array()) ", 1325, []))
      #|BAR
      #|STRING("\"%token\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("opt_type")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Token(symbol_list.to_array(), type_=type_) ", 1420, []))
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
      #|LBRACE_CODE_RBRACE((" Token1(symbol, type_=type_, image=image) ", 1522, []))
      #|BAR
      #|STRING("\"%type\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Type(symbol_list.to_array(), type_=type_) ", 1637, []))
      #|BAR
      #|STRING("\"%position\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|LBRACE_CODE_RBRACE((" Position(type_=type_) ", 1724, []))
      #|BAR
      #|STRING("\"%left\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Left(symbol_list.to_array()) ", 1795, []))
      #|BAR
      #|STRING("\"%right\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Right(symbol_list.to_array()) ", 1874, []))
      #|BAR
      #|STRING("\"%nonassoc\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Nonassoc(symbol_list.to_array()) ", 1957, []))
      #|BAR
      #|STRING("\"%derive\"")
      #|IDENT("traits")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|IDENT("type_")
      #|EQ
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Derive(traits=traits, type_=type_) ", 2046, []))
      #|SEMI
      #|IDENT("opt_type")
      #|ARROW_CODE("Code?")
      #|COLON
      #|IDENT("type_")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|LBRACE_CODE_RBRACE((" Some(type_) ", 2137, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 2157, []))
      #|SEMI
      #|IDENT("rule_list")
      #|ARROW_CODE("@immut/list.T[Rule]")
      #|COLON
      #|IDENT("rule")
      #|EQ
      #|IDENT("rule")
      #|LBRACE_CODE_RBRACE((" Cons(rule, Nil) ", 2218, []))
      #|BAR
      #|IDENT("rule")
      #|EQ
      #|IDENT("rule")
      #|IDENT("rule_list")
      #|EQ
      #|IDENT("rule_list")
      #|LBRACE_CODE_RBRACE((" Cons(rule, rule_list) ", 2272, []))
      #|SEMI
      #|IDENT("rule")
      #|ARROW_CODE("Rule")
      #|COLON
      #|IDENT("rule_no_modifiers")
      #|LBRACE_CODE_RBRACE((" $1 ", 2338, [{start: 1, end: 3, desc: Dollar(1)}]))
      #|BAR
      #|STRING("\"%inline\"")
      #|IDENT("rule_no_modifiers")
      #|LBRACE_CODE_RBRACE((" { ..$2, inline: true } ", 2377, [{start: 5, end: 7, desc: Dollar(2)}]))
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
      #|LBRACE_CODE_RBRACE((" { inline: false, nonterminal, type_, clauses: clause_list.to_array() } ", 2506, []))
      #|SEMI
      #|IDENT("rule_type")
      #|ARROW_CODE("Code?")
      #|COLON
      #|IDENT("type_")
      #|EQ
      #|IDENT("ARROW_CODE")
      #|LBRACE_CODE_RBRACE((" Some(type_) ", 2626, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 2646, []))
      #|SEMI
      #|IDENT("clause_list")
      #|ARROW_CODE("@immut/list.T[Clause]")
      #|COLON
      #|IDENT("clause")
      #|EQ
      #|IDENT("clause")
      #|LBRACE_CODE_RBRACE((" Cons(clause, Nil) ", 2715, []))
      #|BAR
      #|IDENT("clause")
      #|EQ
      #|IDENT("clause")
      #|STRING("\"|\"")
      #|IDENT("clause_list")
      #|EQ
      #|IDENT("clause_list")
      #|LBRACE_CODE_RBRACE((" Cons(clause, clause_list) ", 2783, []))
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
      #|LBRACE_CODE_RBRACE((" { items: item_list.to_array(), prec, action } ", 2895, []))
      #|SEMI
      #|IDENT("clause_action")
      #|ARROW_CODE("ClauseAction")
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("LBRACE_CODE_RBRACE")
      #|LBRACE_CODE_RBRACE(("\n      let (code, utf8_pos, subst) = code\n      { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\n  ", 3008, [{start: 96, end: 105, desc: StartPos}, {start: 112, end: 119, desc: EndPos}]))
      #|BAR
      #|LBRACE_CODE_RBRACE((" { code: None, start: $startpos, end: $endpos } ", 3139, [{start: 22, end: 31, desc: StartPos}, {start: 38, end: 45, desc: EndPos}]))
      #|SEMI
      #|IDENT("rule_prec")
      #|ARROW_CODE("Symbol?")
      #|COLON
      #|STRING("\"%prec\"")
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Some(symbol) ", 3242, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 3263, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(item, item_list) ", 3350, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", 3380, []))
      #|SEMI
      #|IDENT("item")
      #|ARROW_CODE("ClauseItem")
      #|COLON
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|LBRACE_CODE_RBRACE((" { binder: None, term: term } ", 3426, []))
      #|BAR
      #|IDENT("binder")
      #|EQ
      #|IDENT("IDENT")
      #|STRING("\"=\"")
      #|IDENT("term")
      #|EQ
      #|IDENT("term")
      #|LBRACE_CODE_RBRACE((" { binder: Some(binder), term: term } ", 3490, []))
      #|SEMI
      #|IDENT("term")
      #|ARROW_CODE("Term")
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Symbol(symbol) ", 3567, []))
      #|BAR
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Image(image) ", 3603, []))
      #|SEMI
      #|IDENT("nonempty_symbol_list")
      #|ARROW_CODE("@immut/list.T[Symbol]")
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Cons(symbol, Nil) ", 3689, []))
      #|BAR
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Cons(symbol, symbol_list) ", 3762, []))
      #|SEMI
      #|IDENT("symbol")
      #|ARROW_CODE("Symbol")
      #|COLON
      #|IDENT("ident")
      #|EQ
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" ident ", 3830, []))
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
                "utf8_pos": 819,
                "subst": [],
              },
              "start": 818,
              "end": 899,
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
                "term": {
                  "$tag": "Symbol",
                  "0": "PERCENT_LBRACE_CODE_PERCENT_RBRACE",
                },
              },
            ],
            "action": {
              "code": { "code": " Some(code) ", "utf8_pos": 966, "subst": [] },
              "start": 965,
              "end": 979,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 985, "subst": [] },
              "start": 984,
              "end": 992,
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
                "term": {
                  "$tag": "Symbol",
                  "0": "PERCENT_LBRACE_CODE_PERCENT_RBRACE",
                },
              },
            ],
            "action": {
              "code": { "code": " Some(code) ", "utf8_pos": 1060, "subst": [] },
              "start": 1059,
              "end": 1073,
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
              "code": { "code": " Some(code) ", "utf8_pos": 1109, "subst": [] },
              "start": 1108,
              "end": 1122,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 1128, "subst": [] },
              "start": 1127,
              "end": 1135,
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
              { "binder": "decl", "term": { "$tag": "Symbol", "0": "decl" } },
              {
                "binder": "decl_list",
                "term": { "$tag": "Symbol", "0": "decl_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(decl, decl_list) ",
                "utf8_pos": 1216,
                "subst": [],
              },
              "start": 1215,
              "end": 1240,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "utf8_pos": 1246, "subst": [] },
              "start": 1245,
              "end": 1252,
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
              { "term": { "$tag": "Image", "0": "\"%start\"" } },
              {
                "binder": "symbol_list",
                "term": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Start(symbol_list.to_array()) ",
                "utf8_pos": 1325,
                "subst": [],
              },
              "start": 1324,
              "end": 1357,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"%token\"" } },
              {
                "binder": "type_",
                "term": { "$tag": "Symbol", "0": "opt_type" },
              },
              {
                "binder": "symbol_list",
                "term": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Token(symbol_list.to_array(), type_=type_) ",
                "utf8_pos": 1420,
                "subst": [],
              },
              "start": 1419,
              "end": 1465,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"%token\"" } },
              {
                "binder": "type_",
                "term": { "$tag": "Symbol", "0": "opt_type" },
              },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol" },
              },
              { "binder": "image", "term": { "$tag": "Symbol", "0": "STRING" } },
            ],
            "action": {
              "code": {
                "code": " Token1(symbol, type_=type_, image=image) ",
                "utf8_pos": 1522,
                "subst": [],
              },
              "start": 1521,
              "end": 1565,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"%type\"" } },
              {
                "binder": "type_",
                "term": { "$tag": "Symbol", "0": "LANGLE_CODE_RANGLE" },
              },
              {
                "binder": "symbol_list",
                "term": { "$tag": "Symbol", "0": "nonempty_symbol_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Type(symbol_list.to_array(), type_=type_) ",
                "utf8_pos": 1637,
                "subst": [],
              },
              "start": 1636,
              "end": 1681,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"%position\"" } },
              {
                "binder": "type_",
                "term": { "$tag": "Symbol", "0": "LANGLE_CODE_RANGLE" },
              },
            ],
            "action": {
              "code": {
                "code": " Position(type_=type_) ",
                "utf8_pos": 1724,
                "subst": [],
              },
              "start": 1723,
              "end": 1748,
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
                "utf8_pos": 1795,
                "subst": [],
              },
              "start": 1794,
              "end": 1826,
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
                "utf8_pos": 1874,
                "subst": [],
              },
              "start": 1873,
              "end": 1906,
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
                "utf8_pos": 1957,
                "subst": [],
              },
              "start": 1956,
              "end": 1992,
            },
          },
          {
            "items": [
              { "term": { "$tag": "Image", "0": "\"%derive\"" } },
              {
                "binder": "traits",
                "term": { "$tag": "Symbol", "0": "LANGLE_CODE_RANGLE" },
              },
              { "binder": "type_", "term": { "$tag": "Symbol", "0": "IDENT" } },
            ],
            "action": {
              "code": {
                "code": " Derive(traits=traits, type_=type_) ",
                "utf8_pos": 2046,
                "subst": [],
              },
              "start": 2045,
              "end": 2083,
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
                "term": { "$tag": "Symbol", "0": "LANGLE_CODE_RANGLE" },
              },
            ],
            "action": {
              "code": { "code": " Some(type_) ", "utf8_pos": 2137, "subst": [] },
              "start": 2136,
              "end": 2151,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 2157, "subst": [] },
              "start": 2156,
              "end": 2164,
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
              { "binder": "rule", "term": { "$tag": "Symbol", "0": "rule" } },
            ],
            "action": {
              "code": {
                "code": " Cons(rule, Nil) ",
                "utf8_pos": 2218,
                "subst": [],
              },
              "start": 2217,
              "end": 2236,
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
                "utf8_pos": 2272,
                "subst": [],
              },
              "start": 2271,
              "end": 2296,
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
              { "term": { "$tag": "Symbol", "0": "rule_no_modifiers" } },
            ],
            "action": {
              "code": {
                "code": " $1 ",
                "utf8_pos": 2338,
                "subst": [
                  { "start": 1, "end": 3, "desc": { "$tag": "Dollar", "0": 1 } },
                ],
              },
              "start": 2337,
              "end": 2343,
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
                "utf8_pos": 2377,
                "subst": [
                  { "start": 5, "end": 7, "desc": { "$tag": "Dollar", "0": 2 } },
                ],
              },
              "start": 2376,
              "end": 2402,
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
                "term": { "$tag": "Symbol", "0": "symbol" },
              },
              {
                "binder": "type_",
                "term": { "$tag": "Symbol", "0": "rule_type" },
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
                "code": " { inline: false, nonterminal, type_, clauses: clause_list.to_array() } ",
                "utf8_pos": 2506,
                "subst": [],
              },
              "start": 2505,
              "end": 2579,
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
                "term": { "$tag": "Symbol", "0": "ARROW_CODE" },
              },
            ],
            "action": {
              "code": { "code": " Some(type_) ", "utf8_pos": 2626, "subst": [] },
              "start": 2625,
              "end": 2640,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 2646, "subst": [] },
              "start": 2645,
              "end": 2653,
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
                "term": { "$tag": "Symbol", "0": "clause" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(clause, Nil) ",
                "utf8_pos": 2715,
                "subst": [],
              },
              "start": 2714,
              "end": 2735,
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
                "utf8_pos": 2783,
                "subst": [],
              },
              "start": 2782,
              "end": 2811,
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
                "utf8_pos": 2895,
                "subst": [],
              },
              "start": 2894,
              "end": 2943,
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
                "term": { "$tag": "Symbol", "0": "LBRACE_CODE_RBRACE" },
              },
            ],
            "action": {
              "code": {
                "code": "\n      let (code, utf8_pos, subst) = code\n      { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\n  ",
                "utf8_pos": 3008,
                "subst": [
                  { "start": 96, "end": 105, "desc": { "$tag": "StartPos" } },
                  { "start": 112, "end": 119, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 3007,
              "end": 3133,
            },
          },
          {
            "items": [],
            "action": {
              "code": {
                "code": " { code: None, start: $startpos, end: $endpos } ",
                "utf8_pos": 3139,
                "subst": [
                  { "start": 22, "end": 31, "desc": { "$tag": "StartPos" } },
                  { "start": 38, "end": 45, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 3138,
              "end": 3188,
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
              { "term": { "$tag": "Image", "0": "\"%prec\"" } },
              {
                "binder": "symbol",
                "term": { "$tag": "Symbol", "0": "symbol" },
              },
            ],
            "action": {
              "code": {
                "code": " Some(symbol) ",
                "utf8_pos": 3242,
                "subst": [],
              },
              "start": 3241,
              "end": 3257,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 3263, "subst": [] },
              "start": 3262,
              "end": 3270,
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
              { "binder": "item", "term": { "$tag": "Symbol", "0": "item" } },
              {
                "binder": "item_list",
                "term": { "$tag": "Symbol", "0": "item_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(item, item_list) ",
                "utf8_pos": 3350,
                "subst": [],
              },
              "start": 3349,
              "end": 3374,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "utf8_pos": 3380, "subst": [] },
              "start": 3379,
              "end": 3386,
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
              { "binder": "term", "term": { "$tag": "Symbol", "0": "term" } },
            ],
            "action": {
              "code": {
                "code": " { binder: None, term: term } ",
                "utf8_pos": 3426,
                "subst": [],
              },
              "start": 3425,
              "end": 3457,
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
                "utf8_pos": 3490,
                "subst": [],
              },
              "start": 3489,
              "end": 3529,
            },
          },
        ],
      },
      {
        "inline": false,
        "nonterminal": "term",
        "type_": "Term",
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
                "utf8_pos": 3567,
                "subst": [],
              },
              "start": 3566,
              "end": 3584,
            },
          },
          {
            "items": [
              { "binder": "image", "term": { "$tag": "Symbol", "0": "STRING" } },
            ],
            "action": {
              "code": {
                "code": " Image(image) ",
                "utf8_pos": 3603,
                "subst": [],
              },
              "start": 3602,
              "end": 3618,
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
                "term": { "$tag": "Symbol", "0": "symbol" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(symbol, Nil) ",
                "utf8_pos": 3689,
                "subst": [],
              },
              "start": 3688,
              "end": 3709,
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
                "utf8_pos": 3762,
                "subst": [],
              },
              "start": 3761,
              "end": 3790,
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
              { "binder": "ident", "term": { "$tag": "Symbol", "0": "IDENT" } },
            ],
            "action": {
              "code": { "code": " ident ", "utf8_pos": 3830, "subst": [] },
              "start": 3829,
              "end": 3838,
            },
          },
        ],
      },
    ],
  })
}
