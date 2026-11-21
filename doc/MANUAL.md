# MoonYacc Manual

MoonYacc is an LR(1) parser generator for MoonBit, based on Pager's LR(1) algorithm adapted from Menhir.

MoonYacc accepts ocamlyacc-style grammars (see [ocamlyacc's manual](https://ocaml.org/manual/5.3/lexyacc.html#s:ocamlyacc-overview)), with these differences and extensions:

- Semantic actions, headers, and trailers contain MoonBit code.
- Grammar comments can use `//`, `(* ... *)`, or `/* ... */`. Code embedded in the generated parser must use MoonBit syntax.
- A trailer can be enclosed in `%{` and `%}` after the grammar rules, instead of introduced by a second `%%`.
- Symbols can have semantic bindings, such as `left=expr` or `value=NUMBER`. Use those names in the action, or use positional references such as `$1`.
- Tokens can have string aliases. For example, `%token PLUS "+"` allows `"+"` in grammar rules and precedence declarations.
- MoonYacc supports inline and parameterized grammar rules.
- Error recovery is not currently supported.

See the [inline-rule example](../tests/simple_inline_test/inline.mbty) and [parameterized-rule example](../tests/rule_with_params_test/parser.mbty) for additional grammar syntax.

## Running MoonYacc

These instructions describe the current source tree and require a MoonBit toolchain supporting `#derive` attributes (v0.10.19 or later). From the MoonYacc checkout:

```sh
moon update
moon run --target wasm . -- --help
```

The commands below use `moonyacc` as shorthand for this source invocation. For a published release, use `moonx moonbitlang/yacc -- ...`; pin a release containing the required options when using it in a build rule.

## How to use MoonYacc in a MoonBit project

Create a `parser` package in your project. For example, save this grammar as `parser/calc.mbty`:

```yacc
%position<Int>
%derive<Debug> Token
%derive<Debug> ParseError
%token<Int> NUMBER
%token PLUS EOF
%left PLUS
%start<Int> start
%type<Int> expr

%%

start: expr EOF { $1 };
expr:
  | NUMBER { $1 }
  | left=expr PLUS right=expr { left + right };
```

The `EOF` here is an ordinary token declared by the grammar. The lexer must supply it because the start rule requires it.

Add `parser/moon.pkg`. This example assumes that the MoonYacc checkout is a sibling directory of your project, named `moonyacc`:

```moonbit
import {
  "moonbitlang/core/list",
}

formatter(ignore: [ "parser.mbt" ])

rule(
  name: "moonyacc",
  command: "moon run --target wasm $mod_dir/../moonyacc -- --backend direct -O1 --input-mode array $input -o $output",
)

dev_build(rule: "moonyacc", input: "calc.mbty", output: "parser.mbt")
```

The build rule generates `parser/parser.mbt`. When using a published release, replace `moon run --target wasm $mod_dir/../moonyacc --` with `moonx moonbitlang/yacc@VERSION --`, substituting the release you have selected. The `list` import also lets this package use the code and table backends.

Save this as `parser/parser_wbtest.mbt`:

```moonbit
test "parse a sum" {
  let tokens : Array[(Token, Int, Int)] = [
    (NUMBER(1), 0, 1),
    (PLUS, 1, 2),
    (NUMBER(2), 2, 3),
    (EOF, 3, 3),
  ]
  assert_eq(start(tokens, initial_pos=0), 3)
}
```

Run `moon test parser` from your project root. The parser is generated before the package is compiled. Applications in another package call the entry point through their import alias, such as `@parser.start(...)`.

## Choosing a backend

Backend selection is independent of the grammar, input mode, and input layout.

| Backend | CLI selection | Execution model and tradeoff |
| --- | --- | --- |
| Code | `--backend code` (default) | Generates state functions that return decisions to a shared runtime, with generic semantic-value storage and action calls. |
| Direct | `--backend direct` | Generates typed semantic-action calls and specialized stack operations in structured control flow. Optimization work and generated code size can be higher. |
| Table | `--backend table` or `--table` | Generates a dense state/symbol decision table and uses a shared parser runtime. Table size grows with the number of states and symbols. |
| Compressed table | `--compress-table`, optionally with `--backend table` | Compresses table initializers and expands them into a full table at initialization. This reduces emitted table data; parsing uses the expanded table. |

Examples:

```sh
moonyacc --backend code calc.mbty -o parser.mbt
moonyacc --backend direct -O1 calc.mbty -o parser.mbt
moonyacc --backend direct -O2 calc.mbty -o parser.mbt
moonyacc --backend table calc.mbty -o parser.mbt
moonyacc --compress-table calc.mbty -o parser.mbt
```

`--table` and `--compress-table` select the table backend. Combining either flag with `--backend code` or `--backend direct` is an error.

The direct backend preserves declared semantic types in action parameters, return values, registers, and typed stack storage. Checked transformations keep values in registers across reductions where possible and remove redundant stack operations. Position data is computed on demand, and unused `Unit` position storage is erased.

Direct parser control flow uses branches, loops, and labelled transfers. Parts that require dynamic dispatch retain it, and large parsers can be split into regions driven by an outer loop. Parser control flow does not rely on MoonBit tail-call optimization. Expected-token diagnostics use separate tables and checkpoints.

### Optimization levels

These levels configure the direct backend's code generator. They are independent of MoonBit's debug/release compilation modes.

| Option | Current behavior |
| --- | --- |
| `-O0` | Currently uses the same pipeline as O1. It does not provide an unoptimized direct backend. |
| `-O1` | Default for direct. Performs checked stack/value transformations, token and lookahead analysis, control-flow cleanup, and checkpoint optimization. |
| `-O2` | Adds bounded predecessor-state specialization and runtime-resource optimization, with generated-code and layout costs considered during selection. |

You can also write `-O 2`, `--optimization-level 2`, or `--optimization-level=2`. If the option occurs more than once, the last level is used. Invalid levels are rejected.

Optimization flags do not select the direct backend and have no effect on code or table generation. O2 can take longer to generate, produce more code, or run slower than O1 on a particular workload or target. Compare the levels using your grammar, lexer, actions, and compilation target.

## Using the generated parser

Each `%start` declaration generates a public function with that name. `%start<Int> start` declares an `Int` result. The following signatures describe entry points that can reject input; a direct entry point with no reachable error path may omit `raise ParseError`.

There are two independent input settings:

- `--input-mode array` supplies an array; `--input-mode pull` supplies a synchronous token callback. The default is `array`.
- `--input-layout located` supplies positions with tokens; `--input-layout token-only` supplies bare tokens. The default is `located`.

Let `P` be the position type and `R` the entry point's result type:

| Input mode | Layout | Entry point shape |
| --- | --- | --- |
| `array` | `located` | `pub fn start(Array[(Token, P, P)], initial_pos? : P) -> R raise ParseError` |
| `pull` | `located` | `pub fn start(() -> (Token, P, P), P) -> R raise ParseError` |
| `array` | `token-only` | `pub fn start(Array[Token]) -> R raise ParseError` |
| `pull` | `token-only` | `pub fn start(() -> Token) -> R raise ParseError` |

All backends support these combinations. Changing the backend keeps the selected input interface.

### Located input and positions

`%position<Int>` selects `Int` positions. Other MoonBit types can be used, such as a line/column pair. The default position type is `Unit`. MoonYacc does not generate a `Position` type alias; use the type from your grammar in lexer and application code.

In a located token `(token, start, end)`, the last two fields are its span. With array input, `initial_pos` defaults to the first token's start position. Pass `initial_pos` explicitly when the array can be empty, including `initial_pos=()` for `Unit` positions.

Pull input always requires a positional initial position argument with the located layout. For the calculator grammar above, generate with `--input-mode pull` and use:

```moonbit
test "parse a sum with a pull lexer" {
  let tokens : Array[(Token, Int, Int)] = [
    (NUMBER(1), 0, 1),
    (PLUS, 1, 2),
    (NUMBER(2), 2, 3),
    (EOF, 3, 3),
  ]
  let mut cursor = 0
  fn read_token() -> (Token, Int, Int) {
    let token = tokens[cursor]
    cursor += 1
    token
  }
  assert_eq(start(read_token, 0), 3)
}
```

An array has an implicit end-of-input after its last element. A pull callback has no `None` or other end-of-input result, so grammars used with pull input should declare an explicit token such as `EOF` and include it in the start rule. See Menhir's discussion of [end-of-stream conflicts](https://gallium.inria.fr/~fpottier/menhir/manual.html#sec%3Aeos). MoonYacc does not currently report these conflicts.

### Token-only input

`--input-layout token-only` requires `%position<Unit>` or the default `Unit` position type. To use it with the calculator example, change `%position<Int>` to `%position<Unit>` and regenerate:

```sh
moonyacc --backend direct -O1 --input-layout token-only calc.mbty -o parser.mbt
```

The array call supplies bare tokens and has no initial-position parameter:

```moonbit
test "parse bare tokens" {
  assert_eq(start([NUMBER(1), PLUS, NUMBER(2), EOF]), 3)
}
```

With `--input-mode pull --input-layout token-only`, use:

```moonbit
test "pull bare tokens" {
  let tokens : Array[Token] = [NUMBER(1), PLUS, NUMBER(2), EOF]
  let mut cursor = 0
  fn read_token() -> Token {
    let token = tokens[cursor]
    cursor += 1
    token
  }
  assert_eq(start(read_token), 3)
}
```

Token-only input retains parse errors and expected-token information; position fields in errors have type `Unit`. Empty token-only arrays do not need an initial-position argument. Token-only input cannot be combined with `--force-int-position`.

### Errors and derived traits

For an array parser with `%position<Int>`, the generated error type has this shape:

```moonbit
pub suberror ParseError {
  UnexpectedToken(Token, (Int, Int), Array[TokenKind])
  UnexpectedEndOfInput(Int, Array[TokenKind])
}
```

Pull parsers generate only `UnexpectedToken`, because their callbacks have no implicit end-of-input result. `Token::kind` returns a `TokenKind`, which identifies a terminal without its semantic payload. The expected-token array describes the last shifted input prefix; computing it does not execute semantic actions. A parse error terminates the parse.

Use a directive such as `%derive<Debug> Token` or `%derive<Debug> ParseError` to derive traits for generated public types. MoonYacc emits current MoonBit attribute syntax, such as `#derive(Debug)`, before the type declaration. `TokenKind` already implements `Show` and `Debug`; use `Show::to_string(kind)` or `Debug::to_repr(kind)` to format it.

## Output modes

`--mode` controls what is generated, independently of backend selection:

- `default` generates a parser using the grammar's MoonBit semantic actions.
- `json-cst` generates a parser returning a JSON concrete syntax tree instead of evaluating the grammar's semantic actions. Token payload and position types must implement `ToJson`. Payloads are converted when tokens are read, including tokens that later cause a parse error.
- `only-tokens` generates the token types and their associated methods, without a parser. Combine a parser generated with `--external-tokens` with the same token declarations to share token definitions.

The payload overrides `--force-token-json-payload` and `--force-token-no-payload` change generated token constructors to use `Json` payloads or no payloads, respectively. The lexer must return the corresponding token representation. In `default` mode, semantic actions must also match the rewritten payload types. If both overrides occur, the last one takes effect. `--force-int-position` overrides the grammar's position type with `Int`.

## Using the command line interface

The command line interface is still subject to change. Use `moonyacc --help` for the available options.

| Option | Meaning |
| --- | --- |
| `--backend code\|direct\|table` | Select the code generator. Default: `code`. |
| `--table` | Select the table backend. |
| `--compress-table` | Select the table backend with compressed initializers. |
| `-O0`, `-O1`, `-O2` | Configure direct optimization. Default: O1; O0 currently uses O1. |
| `--input-mode array\|pull` | Select the input mode. Default: `array`. |
| `--input-layout located\|token-only` | Select the input representation. Default: `located`. |
| `--mode default\|json-cst\|only-tokens` | Select the output mode. Default: `default`. |
| `-o FILE`, `--output-file FILE` | Write generated code to a file. Otherwise it is printed to stdout. |
| `--output-map-file FILE` | Choose the source map output path. |
| `--external-tokens` | Use token definitions supplied alongside the parser. |
| `--no-comments` | Omit optional backend comments where supported. |
| `--no-std` | Disable the bundled grammar helper rules. |
| `-v`, `--version` | Print the tool's version. |

## About the source map

When writing `parser.mbt` with `-o`, MoonYacc also writes `parser.mbt.map.json`. Use `--output-map-file` to change its path. When code is printed to stdout, a map is written only if `--output-map-file` is supplied.

The map connects generated code, including rewritten semantic-action references, to the original grammar. Its `original_offset` and `generated_offset` fields are zero-based Unicode scalar offsets; `length` is the length of the mapped generated range in Unicode scalar values. For example, an emoji represented by a surrogate pair counts as one scalar value; CRLF counts as two. These coordinates are independent of the grammar's `%position` type.

Generate code and its map together after editing the grammar or changing line endings. Formatting generated code separately changes offsets and invalidates its existing map. Keep generated `*.mbt.map.json` files out of version control so each checkout regenerates them for its local grammar text.
