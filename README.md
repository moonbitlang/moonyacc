# MoonYacc

MoonYacc is an LR(1) parser generator for the MoonBit programming language.

[Playground](https://moonyacc-playground.netlify.app/) · [Manual](doc/MANUAL.md) · [Calculator grammar](tests/calc_array_input_mode_test/calc.mbty)

## Features

- ocamlyacc-style grammars, typed token payloads, and MoonBit semantic actions.
- Named bindings, token aliases, inline rules, and parameterized grammar rules.
- Code, direct, and table backends, with optional table compression.
- Array and pull input, custom source positions, and a token-only input layout.
- Expected-token diagnostics, source maps, and JSON concrete syntax tree generation.

## Quick start

From a checkout with a current stable MoonBit toolchain supporting `#derive` attributes (v0.10.19 or later):

```sh
moon update
moon run --target wasm . -- --backend direct tests/calc_array_input_mode_test/calc.mbty
```

This prints a direct parser for the calculator grammar. Add `-o path/to/parser.mbt` to write it to an existing directory. See the [manual](doc/MANUAL.md#how-to-use-moonyacc-in-a-moonbit-project) for a build rule and a complete parser call.

These documents describe the current source tree. A Mooncakes release can be run with `moonx moonbitlang/yacc -- ...`; select a release containing the options you need and pin its version in reproducible builds.

## Backends

| Backend | Selection | Generated parser |
| --- | --- | --- |
| Code (default) | `--backend code` | State functions return decisions to a shared parser runtime. |
| Direct | `--backend direct` | Typed actions and optimized stack operations execute through structured control flow. |
| Table | `--backend table` or `--table` | A shared parser runtime looks up decisions in a dense table. |
| Compressed table | `--compress-table` | Encoded table data is expanded during initialization, then uses the table runtime. |

The direct backend defaults to `-O1`. `-O2` adds bounded state specialization and runtime storage optimizations; it can increase generation time and code size, so benchmark your grammar and target. `-O0` currently uses the O1 pipeline. Optimization levels apply to the direct backend and do not select it automatically.

All backends support both input modes and layouts. See [backend selection](doc/MANUAL.md#choosing-a-backend) and [generated parser interfaces](doc/MANUAL.md#using-the-generated-parser) for details.

## Status

This software is in alpha stage. Though it may have some issues, it is already usable for most purposes.

## Acknowledgements

MoonYacc adapts Menhir's LR(0) closure and Pager-style LR(1) construction algorithms. The direct backend's typed stack transformations and state specialization are also informed by Menhir's StackLang backend. These ideas are implemented for MoonBit's types, runtime, and control-flow facilities.
