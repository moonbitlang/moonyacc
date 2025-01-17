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
      #|LANGLE_CODE_RANGLE("(String, Array[SubstItem])")
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
      #|LBRACE_CODE_RBRACE((" { header, commands: cmd_list.to_array(), rules: rule_list.to_array(), footer } ", []))
      #|SEMI
      #|IDENT("header")
      #|ARROW_CODE("Code?")
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|LBRACE_CODE_RBRACE((" Some(code) ", []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", []))
      #|SEMI
      #|IDENT("footer")
      #|ARROW_CODE("Code?")
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_LBRACE_CODE_PERCENT_RBRACE")
      #|LBRACE_CODE_RBRACE((" Some(code) ", []))
      #|BAR
      #|IDENT("code")
      #|EQ
      #|IDENT("PERCENT_PERCENT_CODE_EOF")
      #|LBRACE_CODE_RBRACE((" Some(code) ", []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", []))
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
      #|LBRACE_CODE_RBRACE((" Cons(cmd, cmd_list) ", []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", []))
      #|SEMI
      #|IDENT("cmd")
      #|ARROW_CODE("Command")
      #|COLON
      #|STRING("\"%start\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Start(symbol_list.to_array()) ", []))
      #|BAR
      #|STRING("\"%token\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("opt_type")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Token(symbol_list.to_array(), type_=type_) ", []))
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
      #|LBRACE_CODE_RBRACE((" Token1(symbol, type_=type_, image=image) ", []))
      #|BAR
      #|STRING("\"%type\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Type(symbol_list.to_array(), type_=type_) ", []))
      #|BAR
      #|STRING("\"%position\"")
      #|IDENT("type_")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|LBRACE_CODE_RBRACE((" Position(type_=type_) ", []))
      #|BAR
      #|STRING("\"%left\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Left(symbol_list.to_array()) ", []))
      #|BAR
      #|STRING("\"%right\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Right(symbol_list.to_array()) ", []))
      #|BAR
      #|STRING("\"%nonassoc\"")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Nonassoc(symbol_list.to_array()) ", []))
      #|BAR
      #|STRING("\"%derive\"")
      #|IDENT("traits")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|IDENT("type_")
      #|EQ
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" Derive(traits=traits, type_=type_) ", []))
      #|SEMI
      #|IDENT("opt_type")
      #|ARROW_CODE("Code?")
      #|COLON
      #|IDENT("type_")
      #|EQ
      #|IDENT("LANGLE_CODE_RANGLE")
      #|LBRACE_CODE_RBRACE((" Some(type_) ", []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", []))
      #|SEMI
      #|IDENT("rule_list")
      #|ARROW_CODE("@immut/list.T[Rule]")
      #|COLON
      #|IDENT("rule")
      #|EQ
      #|IDENT("rule")
      #|LBRACE_CODE_RBRACE((" Cons(rule, Nil) ", []))
      #|BAR
      #|IDENT("rule")
      #|EQ
      #|IDENT("rule")
      #|IDENT("rule_list")
      #|EQ
      #|IDENT("rule_list")
      #|LBRACE_CODE_RBRACE((" Cons(rule, rule_list) ", []))
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
      #|LBRACE_CODE_RBRACE((" { nonterminal, type_, clauses: clause_list.to_array() } ", []))
      #|SEMI
      #|IDENT("rule_type")
      #|ARROW_CODE("Code?")
      #|COLON
      #|IDENT("type_")
      #|EQ
      #|IDENT("ARROW_CODE")
      #|LBRACE_CODE_RBRACE((" Some(type_) ", []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", []))
      #|SEMI
      #|IDENT("clause_list")
      #|ARROW_CODE("@immut/list.T[Clause]")
      #|COLON
      #|IDENT("clause")
      #|EQ
      #|IDENT("clause")
      #|LBRACE_CODE_RBRACE((" Cons(clause, Nil) ", []))
      #|BAR
      #|IDENT("clause")
      #|EQ
      #|IDENT("clause")
      #|STRING("\"|\"")
      #|IDENT("clause_list")
      #|EQ
      #|IDENT("clause_list")
      #|LBRACE_CODE_RBRACE((" Cons(clause, clause_list) ", []))
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
      #|LBRACE_CODE_RBRACE((" { items: item_list.to_array(), prec, action } ", []))
      #|SEMI
      #|IDENT("clause_action")
      #|ARROW_CODE("ClauseAction")
      #|COLON
      #|IDENT("code")
      #|EQ
      #|IDENT("LBRACE_CODE_RBRACE")
      #|LBRACE_CODE_RBRACE(("\n        let (code, subst) = code\n        { code: Some({ code, subst }), start: $startpos, end: $endpos }\n    ", [{start: 80, end: 89, desc: StartPos}, {start: 96, end: 103, desc: EndPos}]))
      #|BAR
      #|LBRACE_CODE_RBRACE((" { code: None, start: $startpos, end: $endpos } ", [{start: 22, end: 31, desc: StartPos}, {start: 38, end: 45, desc: EndPos}]))
      #|SEMI
      #|IDENT("rule_prec")
      #|ARROW_CODE("Symbol?")
      #|COLON
      #|STRING("\"%prec\"")
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Some(symbol) ", []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" None ", []))
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
      #|LBRACE_CODE_RBRACE((" Cons(item, item_list) ", []))
      #|BAR
      #|LBRACE_CODE_RBRACE((" Nil ", []))
      #|SEMI
      #|IDENT("item")
      #|ARROW_CODE("ClauseItem")
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("item_symbol")
      #|LBRACE_CODE_RBRACE((" { binder: None, symbol: symbol } ", []))
      #|BAR
      #|IDENT("binder")
      #|EQ
      #|IDENT("IDENT")
      #|STRING("\"=\"")
      #|IDENT("symbol")
      #|EQ
      #|IDENT("item_symbol")
      #|LBRACE_CODE_RBRACE((" { binder: Some(binder), symbol: symbol } ", []))
      #|SEMI
      #|IDENT("item_symbol")
      #|ARROW_CODE("ClauseItemSymbol")
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Symbol(symbol) ", []))
      #|BAR
      #|IDENT("image")
      #|EQ
      #|IDENT("STRING")
      #|LBRACE_CODE_RBRACE((" Image(image) ", []))
      #|SEMI
      #|IDENT("nonempty_symbol_list")
      #|ARROW_CODE("@immut/list.T[Symbol]")
      #|COLON
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|LBRACE_CODE_RBRACE((" Cons(symbol, Nil) ", []))
      #|BAR
      #|IDENT("symbol")
      #|EQ
      #|IDENT("symbol")
      #|IDENT("symbol_list")
      #|EQ
      #|IDENT("nonempty_symbol_list")
      #|LBRACE_CODE_RBRACE((" Cons(symbol, symbol_list) ", []))
      #|SEMI
      #|IDENT("symbol")
      #|ARROW_CODE("Symbol")
      #|COLON
      #|IDENT("ident")
      #|EQ
      #|IDENT("IDENT")
      #|LBRACE_CODE_RBRACE((" ident ", []))
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
        "type_": "(String, Array[SubstItem])",
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
                "subst": [],
              },
              "start": 779,
              "end": 780,
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
              "code": { "code": " Some(code) ", "subst": [] },
              "start": 931,
              "end": 932,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "subst": [] },
              "start": 952,
              "end": 953,
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
              "code": { "code": " Some(code) ", "subst": [] },
              "start": 1030,
              "end": 1031,
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
              "code": { "code": " Some(code) ", "subst": [] },
              "start": 1081,
              "end": 1082,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "subst": [] },
              "start": 1102,
              "end": 1103,
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
              "code": { "code": " Cons(cmd, cmd_list) ", "subst": [] },
              "start": 1185,
              "end": 1186,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "subst": [] },
              "start": 1215,
              "end": 1216,
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
              "code": { "code": " Start(symbol_list.to_array()) ", "subst": [] },
              "start": 1293,
              "end": 1294,
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
                "subst": [],
              },
              "start": 1390,
              "end": 1391,
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
                "subst": [],
              },
              "start": 1494,
              "end": 1495,
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
                "subst": [],
              },
              "start": 1611,
              "end": 1612,
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
              "code": { "code": " Position(type_=type_) ", "subst": [] },
              "start": 1700,
              "end": 1701,
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
              "code": { "code": " Left(symbol_list.to_array()) ", "subst": [] },
              "start": 1773,
              "end": 1774,
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
              "code": { "code": " Right(symbol_list.to_array()) ", "subst": [] },
              "start": 1854,
              "end": 1855,
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
                "subst": [],
              },
              "start": 1939,
              "end": 1940,
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
                "subst": [],
              },
              "start": 2030,
              "end": 2031,
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
              "code": { "code": " Some(type_) ", "subst": [] },
              "start": 2125,
              "end": 2126,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "subst": [] },
              "start": 2147,
              "end": 2148,
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
              "code": { "code": " Cons(rule, Nil) ", "subst": [] },
              "start": 2212,
              "end": 2213,
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
              "code": { "code": " Cons(rule, rule_list) ", "subst": [] },
              "start": 2268,
              "end": 2269,
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
                "subst": [],
              },
              "start": 2387,
              "end": 2388,
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
              "code": { "code": " Some(type_) ", "subst": [] },
              "start": 2496,
              "end": 2497,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "subst": [] },
              "start": 2518,
              "end": 2519,
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
              "code": { "code": " Cons(clause, Nil) ", "subst": [] },
              "start": 2591,
              "end": 2592,
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
              "code": { "code": " Cons(clause, clause_list) ", "subst": [] },
              "start": 2661,
              "end": 2662,
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
                "subst": [],
              },
              "start": 2777,
              "end": 2778,
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
                "code": "\\n        let (code, subst) = code\\n        { code: Some({ code, subst }), start: $startpos, end: $endpos }\\n    ",
                "subst": [
                  { "start": 80, "end": 89, "desc": { "$tag": "StartPos" } },
                  { "start": 96, "end": 103, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 2894,
              "end": 2895,
            },
          },
          {
            "items": [],
            "action": {
              "code": {
                "code": " { code: None, start: $startpos, end: $endpos } ",
                "subst": [
                  { "start": 22, "end": 31, "desc": { "$tag": "StartPos" } },
                  { "start": 38, "end": 45, "desc": { "$tag": "EndPos" } },
                ],
              },
              "start": 3013,
              "end": 3014,
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
              "code": { "code": " Some(symbol) ", "subst": [] },
              "start": 3120,
              "end": 3121,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " None ", "subst": [] },
              "start": 3143,
              "end": 3144,
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
              "code": { "code": " Cons(item, item_list) ", "subst": [] },
              "start": 3234,
              "end": 3235,
            },
          },
          {
            "items": [],
            "action": {
              "code": { "code": " Nil ", "subst": [] },
              "start": 3266,
              "end": 3267,
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
                "subst": [],
              },
              "start": 3325,
              "end": 3326,
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
                "subst": [],
              },
              "start": 3404,
              "end": 3405,
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
              "code": { "code": " Symbol(symbol) ", "subst": [] },
              "start": 3508,
              "end": 3509,
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
              "code": { "code": " Image(image) ", "subst": [] },
              "start": 3546,
              "end": 3547,
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
              "code": { "code": " Cons(symbol, Nil) ", "subst": [] },
              "start": 3636,
              "end": 3637,
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
              "code": { "code": " Cons(symbol, symbol_list) ", "subst": [] },
              "start": 3711,
              "end": 3712,
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
              "code": { "code": " ident ", "subst": [] },
              "start": 3783,
              "end": 3784,
            },
          },
        ],
      },
    ],
  })
}
