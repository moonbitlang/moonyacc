name = "moonbitlang/yacc"

version = "0.7.14"

import {
  "moonbitlang/ulex-runtime@0.4.3",
  "moonbit-community/miniio@0.2.1",
}

readme = "README.md"

repository = "https://github.com/moonbitlang/moonyacc"

license = "GPL-2.0-only"

keywords = [ "LR parser", "parser generator", "yacc" ]

description = "A LR(1) parser generator for MoonBit programming language."

options(
  exclude: [ "tests" ],
)
