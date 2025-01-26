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
      #|IDENT("cmd_list")
      #|EQ
      #|IDENT("cmd_list")
      #|STRING("\"%%\"")
      #|IDENT("rule_list")
      #|EQ
      #|IDENT("rule_list")
      #|IDENT("footer")
      #|EQ
      #|IDENT("footer")
      #|IDENT("EOF")
      #|LBRACE_CODE_RBRACE((" { header, commands: cmd_list.to_array(), rules: rule_list.to_array(), footer } ", 785, []))
      #|SEMI
      #|IDENT("header")
      #|ARROW_CODE("Code?")
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|LBRACE_CODE_RBRACE((" Some(code) ", 937, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 958, []))
      #|SEMI
      #|IDENT("footer")
      #|ARROW_CODE("Code?")
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1036, []))
      #|BAR
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_PERCENT_CODE_EOF")
      #|LBRACE_CODE_RBRACE((" Some(code) ", 1087, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 1108, []))
      #|SEMI
      #|IDENT("cmd_list")
      #|ARROW_CODE("@immut/list.T[Command]")
      #|COLON
      #|IDENT("cmd")
      #|EQ
      #|IDENT("cmd")
      #|IDENT("cmd_list")
      #|EQ
      #|IDENT("cmd_list")
      #|LBRACE_CODE_RBRACE((" Cons(cmd, cmd_list) ", 1191, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", 1221, []))
      #|SEMI
      #|IDENT("cmd")
      #|ARROW_CODE("Command")
      #|COLON
      #|STRING("\"%start\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Start(symbol_list.to_array()) ", 1299, []))
      #|BAR
      #|STRING("\"%token\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("opt_type")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Token(symbol_list.to_array(), type_=type_) ", 1396, []))
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
      #|LBRACE_CODE_RBRACE((" Token1(symbol, type_=type_, image=image) ", 1500, []))
      #|BAR
      #|STRING("\"%type\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Type(symbol_list.to_array(), type_=type_) ", 1617, []))
      #|BAR
      #|STRING("\"%position\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|LBRACE_CODE_RBRACE((" Position(type_=type_) ", 1706, []))
      #|BAR
      #|STRING("\"%left\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Left(symbol_list.to_array()) ", 1779, []))
      #|BAR
      #|STRING("\"%right\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Right(symbol_list.to_array()) ", 1860, []))
      #|BAR
      #|STRING("\"%nonassoc\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Nonassoc(symbol_list.to_array()) ", 1945, []))
      #|BAR
      #|STRING("\"%derive\"")
      #|IDENT("traits")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|IDENT("type_")
      #|EQ
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Derive(traits=traits, type_=type_) ", 2036, []))
      #|SEMI
      #|IDENT("opt_type")
      #|ARROW_CODE("Code?")
      #|COLON
      #|IDENT("type_")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|LBRACE_CODE_RBRACE((" Some(type_) ", 2131, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 2153, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(rule, rule_list) ", 2274, []))
      #|SEMI
      #|IDENT("rule")
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
      #|LBRACE_CODE_RBRACE((" { nonterminal, type_, clauses: clause_list.to_array() } ", 2393, []))
      #|SEMI
      #|IDENT("rule_type")
      #|ARROW_CODE("Code?")
      #|COLON
      #|IDENT("type_")
      #|EQ
      #|IDENT("ARROW_CODE")
      #|LBRACE_CODE_RBRACE((" Some(type_) ", 2502, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 2524, []))
      #|SEMI
      #|IDENT("clause_list")
      #|ARROW_CODE("@immut/list.T[Clause]")
      #|COLON
      #|IDENT("clause")
      #|EQ
      #|IDENT("clause")
      #|LBRACE_CODE_RBRACE((" Cons(clause, Nil) ", 2597, []))
      #|BAR
      #|IDENT("clause")
      #|EQ
      #|IDENT("clause")
      #|STRING("\"|\"")
      #|IDENT("clause_list")
      #|EQ
      #|IDENT("clause_list")
      #|LBRACE_CODE_RBRACE((" Cons(clause, clause_list) ", 2667, []))
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
      #|LBRACE_CODE_RBRACE((" { items: item_list.to_array(), prec, action } ", 2783, []))
      #|SEMI
      #|IDENT("clause_action")
      #|ARROW_CODE("ClauseAction")
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("LBRACE_CODE_RBRACE")
      #|LBRACE_CODE_RBRACE(("\n        let (code, utf8_pos, subst) = code\n        { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\n    ", 2900, [{start: 100, end: 109, desc: StartPos}, {start: 116, end: 123, desc: EndPos}]))
      #|BAR
      #|LBRACE_CODE_RBRACE((" { code: None, start: $startpos, end: $endpos } ", 3039, [{start: 22, end: 31, desc: StartPos}, {start: 38, end: 45, desc: EndPos}]))
      #|SEMI
      #|IDENT("rule_prec")
      #|ARROW_CODE("Symbol?")
      #|COLON
      #|STRING("\"%prec\"")
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Some(symbol) ", 3146, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", 3169, []))
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
      #|LBRACE_CODE_RBRACE((" Cons(item, item_list) ", 3260, []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", 3292, []))
      #|SEMI
      #|IDENT("item")
      #|ARROW_CODE("ClauseItem")
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("item_symbol")
      #|LBRACE_CODE_RBRACE((" { binder: None, symbol: symbol } ", 3351, []))
      #|BAR
      #|IDENT("binder")
      #|EQ
      #|IDENT("IDENT")
      #|STRING("\"=\"")
      #|IDENT("symbol")
      #|EQ
      #|IDENT("item_symbol")
      #|LBRACE_CODE_RBRACE((" { binder: Some(binder), symbol: symbol } ", 3430, []))
      #|SEMI
      #|IDENT("item_symbol")
      #|ARROW_CODE("ClauseItemSymbol")
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Symbol(symbol) ", 3534, []))
      #|BAR
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Image(image) ", 3572, []))
      #|SEMI
      #|IDENT("nonempty_symbol_list")
      #|ARROW_CODE("@immut/list.T[Symbol]")
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Cons(symbol, Nil) ", 3662, []))
      #|BAR
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Cons(symbol, symbol_list) ", 3737, []))
      #|SEMI
      #|IDENT("symbol")
      #|ARROW_CODE("Symbol")
      #|COLON
      #|IDENT("ident")
      #|EQ
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" ident ", 3809, []))
      #|SEMI
      #|EOF
      #|
    ,
  )
}

test "parser" {
  let lexer = @parser.new_lexer(parser_spec_src)
  fn token() {
    lexer.next_token?().unwrap()
  }

  let spec = @parser.spec!(token, 0)
  @json.inspect!(spec, content={
    "commands": [
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
      { "$tag": "Token1", "0": "COLON", "type_": Null, "image": "\":\"" },
      { "$tag": "Token1", "0": "BAR", "type_": Null, "image": "\"|\"" },
      { "$tag": "Token1", "0": "EQ", "type_": Null, "image": "\"=\"" },
      { "$tag": "Token1", "0": "SEMI", "type_": Null, "image": "\";\"" },
    ],
    "rules": [
      {
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
                "binder": "cmd_list",
                "symbol": { "$tag": "Symbol", "0": "cmd_list" },
              },
              { "symbol": { "$tag": "Image", "0": "\"%%\"" } },
              {
                "binder": "rule_list",
                "symbol": { "$tag": "Symbol", "0": "rule_list" },
              },
              {
                "binder": "footer",
                "symbol": { "$tag": "Symbol", "0": "footer" },
              },
              { "symbol": { "$tag": "Symbol", "0": "EOF" } },
            ],
            "action": {
              "code": {
                "code": " { header, commands: cmd_list.to_array(), rules: rule_list.to_array(), footer } ",
                "utf8_pos": 785,
                "subst": [],
              },
              "start": 784,
              "end": 866,
            },
          },
        ],
      },
      {
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
              "code": { "code": " Some(code) ", "utf8_pos": 937, "subst": [] },
              "start": 936,
              "end": 950,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 958, "subst": [] },
              "start": 957,
              "end": 965,
            },
          },
        ],
      },
      {
        "nonterminal": "footer",
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
              "code": { "code": " Some(code) ", "utf8_pos": 1036, "subst": [] },
              "start": 1035,
              "end": 1049,
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
              "code": { "code": " Some(code) ", "utf8_pos": 1087, "subst": [] },
              "start": 1086,
              "end": 1100,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 1108, "subst": [] },
              "start": 1107,
              "end": 1115,
            },
          },
        ],
      },
      {
        "nonterminal": "cmd_list",
        "type_": "@immut/list.T[Command]",
        "clauses": [
          {
            "items": [
              { "binder": "cmd", "symbol": { "$tag": "Symbol", "0": "cmd" } },
              {
                "binder": "cmd_list",
                "symbol": { "$tag": "Symbol", "0": "cmd_list" },
              },
            ],
            "action": {
              "code": {
                "code": " Cons(cmd, cmd_list) ",
                "utf8_pos": 1191,
                "subst": [],
              },
              "start": 1190,
              "end": 1213,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "utf8_pos": 1221, "subst": [] },
              "start": 1220,
              "end": 1227,
            },
          },
        ],
      },
      {
        "nonterminal": "cmd",
        "type_": "Command",
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
                "utf8_pos": 1299,
                "subst": [],
              },
              "start": 1298,
              "end": 1331,
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
                "utf8_pos": 1396,
                "subst": [],
              },
              "start": 1395,
              "end": 1441,
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
                "utf8_pos": 1500,
                "subst": [],
              },
              "start": 1499,
              "end": 1543,
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
                "utf8_pos": 1617,
                "subst": [],
              },
              "start": 1616,
              "end": 1661,
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
                "utf8_pos": 1706,
                "subst": [],
              },
              "start": 1705,
              "end": 1730,
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
                "utf8_pos": 1779,
                "subst": [],
              },
              "start": 1778,
              "end": 1810,
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
                "utf8_pos": 1860,
                "subst": [],
              },
              "start": 1859,
              "end": 1892,
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
                "utf8_pos": 1945,
                "subst": [],
              },
              "start": 1944,
              "end": 1980,
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
                "utf8_pos": 2036,
                "subst": [],
              },
              "start": 2035,
              "end": 2073,
            },
          },
        ],
      },
      {
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
              "code": { "code": " Some(type_) ", "utf8_pos": 2131, "subst": [] },
              "start": 2130,
              "end": 2145,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 2153, "subst": [] },
              "start": 2152,
              "end": 2160,
            },
          },
        ],
      },
      {
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
                "utf8_pos": 2218,
                "subst": [],
              },
              "start": 2217,
              "end": 2236,
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
                "utf8_pos": 2274,
                "subst": [],
              },
              "start": 2273,
              "end": 2298,
            },
          },
        ],
      },
      {
        "nonterminal": "rule",
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
                "code": " { nonterminal, type_, clauses: clause_list.to_array() } ",
                "utf8_pos": 2393,
                "subst": [],
              },
              "start": 2392,
              "end": 2451,
            },
          },
        ],
      },
      {
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
              "code": { "code": " Some(type_) ", "utf8_pos": 2502, "subst": [] },
              "start": 2501,
              "end": 2516,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 2524, "subst": [] },
              "start": 2523,
              "end": 2531,
            },
          },
        ],
      },
      {
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
                "utf8_pos": 2597,
                "subst": [],
              },
              "start": 2596,
              "end": 2617,
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
                "utf8_pos": 2667,
                "subst": [],
              },
              "start": 2666,
              "end": 2695,
            },
          },
        ],
      },
      {
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
                "utf8_pos": 2783,
                "subst": [],
              },
              "start": 2782,
              "end": 2831,
            },
          },
        ],
      },
      {
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
                "code": "\\n        let (code, utf8_pos, subst) = code\\n        { code: Some({ code, utf8_pos, subst }), start: $startpos, end: $endpos }\\n    ",
                "utf8_pos": 2900,
                "subst": [
                  { "start": 100, "end": 109, "desc": { "$tag": "StartPos" } },
                  { "start": 116, "end": 123, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 2899,
              "end": 3031,
            },
          },
          {
            "items": [],
            "action": {
              "code": {
                "code": " { code: None, start: $startpos, end: $endpos } ",
                "utf8_pos": 3039,
                "subst": [
                  { "start": 22, "end": 31, "desc": { "$tag": "StartPos" } },
                  { "start": 38, "end": 45, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 3038,
              "end": 3088,
            },
          },
        ],
      },
      {
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
                "utf8_pos": 3146,
                "subst": [],
              },
              "start": 3145,
              "end": 3161,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "utf8_pos": 3169, "subst": [] },
              "start": 3168,
              "end": 3176,
            },
          },
        ],
      },
      {
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
                "utf8_pos": 3260,
                "subst": [],
              },
              "start": 3259,
              "end": 3284,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "utf8_pos": 3292, "subst": [] },
              "start": 3291,
              "end": 3298,
            },
          },
        ],
      },
      {
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
                "utf8_pos": 3351,
                "subst": [],
              },
              "start": 3350,
              "end": 3386,
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
                "utf8_pos": 3430,
                "subst": [],
              },
              "start": 3429,
              "end": 3473,
            },
          },
        ],
      },
      {
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
                "utf8_pos": 3534,
                "subst": [],
              },
              "start": 3533,
              "end": 3551,
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
                "utf8_pos": 3572,
                "subst": [],
              },
              "start": 3571,
              "end": 3587,
            },
          },
        ],
      },
      {
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
                "utf8_pos": 3662,
                "subst": [],
              },
              "start": 3661,
              "end": 3682,
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
                "utf8_pos": 3737,
                "subst": [],
              },
              "start": 3736,
              "end": 3765,
            },
          },
        ],
      },
      {
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
              "code": { "code": " ident ", "utf8_pos": 3809, "subst": [] },
              "start": 3808,
              "end": 3817,
            },
          },
        ],
      },
    ],
  })
}
