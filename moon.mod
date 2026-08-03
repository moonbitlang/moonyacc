name = "moonbitlang/yacc"

version = "0.7.19"

import {
  "moonbitlang/ulex-runtime@0.4.3",
  "moonbitlang/async@0.20.3",
}

readme = "README.md"

repository = "https://github.com/moonbitlang/moonyacc"

license = "GPL-2.0-only"

keywords = [ "LR parser", "parser generator", "yacc" ]

description = "A LR(1) parser generator for MoonBit programming language."

options(
  exclude: [ "tests" ],
)
