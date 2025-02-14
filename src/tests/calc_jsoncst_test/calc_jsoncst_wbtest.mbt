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
test {
  let tokens = [
    NUMBER,
    PLUS,
    LPAREN,
    NUMBER,
    MINUS,
    NUMBER,
    RPAREN,
    STAR,
    NUMBER,
  ]
  let mut cursor = 0
  fn read_token() -> (Token, Position, Position) {
    guard cursor < tokens.length() else { (EOF, cursor, cursor) }
    let token = tokens[cursor]
    cursor += 1
    (token, cursor - 1, cursor)
  }

  let result = start!(read_token, 0)
  @json.inspect!(result, content={
    "type": "NONTERMINAL",
    "name": "start",
    "prod_num": 0,
    "children": [
      {
        "type": "NONTERMINAL",
        "name": "add",
        "prod_num": 1,
        "children": [
          {
            "type": "NONTERMINAL",
            "name": "add",
            "prod_num": 3,
            "children": [
              {
                "type": "NONTERMINAL",
                "name": "factor",
                "prod_num": 5,
                "children": [
                  {
                    "type": "NONTERMINAL",
                    "name": "term",
                    "prod_num": 6,
                    "children": [
                      {
                        "type": "TERMINAL",
                        "name": "NUMBER",
                        "data": Null,
                        "start": 0,
                        "end": 1,
                      },
                    ],
                    "start": 0,
                    "end": 1,
                  },
                ],
                "start": 0,
                "end": 1,
              },
            ],
            "start": 0,
            "end": 1,
          },
          {
            "type": "TERMINAL",
            "name": "PLUS",
            "data": Null,
            "start": 1,
            "end": 2,
          },
          {
            "type": "NONTERMINAL",
            "name": "factor",
            "prod_num": 4,
            "children": [
              {
                "type": "NONTERMINAL",
                "name": "factor",
                "prod_num": 5,
                "children": [
                  {
                    "type": "NONTERMINAL",
                    "name": "term",
                    "prod_num": 7,
                    "children": [
                      {
                        "type": "TERMINAL",
                        "name": "LPAREN",
                        "data": Null,
                        "start": 2,
                        "end": 3,
                      },
                      {
                        "type": "NONTERMINAL",
                        "name": "add",
                        "prod_num": 2,
                        "children": [
                          {
                            "type": "NONTERMINAL",
                            "name": "add",
                            "prod_num": 3,
                            "children": [
                              {
                                "type": "NONTERMINAL",
                                "name": "factor",
                                "prod_num": 5,
                                "children": [
                                  {
                                    "type": "NONTERMINAL",
                                    "name": "term",
                                    "prod_num": 6,
                                    "children": [
                                      {
                                        "type": "TERMINAL",
                                        "name": "NUMBER",
                                        "data": Null,
                                        "start": 3,
                                        "end": 4,
                                      },
                                    ],
                                    "start": 3,
                                    "end": 4,
                                  },
                                ],
                                "start": 3,
                                "end": 4,
                              },
                            ],
                            "start": 3,
                            "end": 4,
                          },
                          {
                            "type": "TERMINAL",
                            "name": "MINUS",
                            "data": Null,
                            "start": 4,
                            "end": 5,
                          },
                          {
                            "type": "NONTERMINAL",
                            "name": "factor",
                            "prod_num": 5,
                            "children": [
                              {
                                "type": "NONTERMINAL",
                                "name": "term",
                                "prod_num": 6,
                                "children": [
                                  {
                                    "type": "TERMINAL",
                                    "name": "NUMBER",
                                    "data": Null,
                                    "start": 5,
                                    "end": 6,
                                  },
                                ],
                                "start": 5,
                                "end": 6,
                              },
                            ],
                            "start": 5,
                            "end": 6,
                          },
                        ],
                        "start": 3,
                        "end": 6,
                      },
                      {
                        "type": "TERMINAL",
                        "name": "RPAREN",
                        "data": Null,
                        "start": 6,
                        "end": 7,
                      },
                    ],
                    "start": 2,
                    "end": 7,
                  },
                ],
                "start": 2,
                "end": 7,
              },
              {
                "type": "TERMINAL",
                "name": "STAR",
                "data": Null,
                "start": 7,
                "end": 8,
              },
              {
                "type": "NONTERMINAL",
                "name": "term",
                "prod_num": 6,
                "children": [
                  {
                    "type": "TERMINAL",
                    "name": "NUMBER",
                    "data": Null,
                    "start": 8,
                    "end": 9,
                  },
                ],
                "start": 8,
                "end": 9,
              },
            ],
            "start": 2,
            "end": 9,
          },
        ],
        "start": 0,
        "end": 9,
      },
      { "type": "TERMINAL", "name": "EOF", "data": Null, "start": 9, "end": 9 },
    ],
    "start": 0,
    "end": 9,
  })
}
