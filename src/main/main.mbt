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
fnalias @util.(println_to_stderr, exit)

///|
fn main {
  let usage =
    #|Usage: moonyacc [options] <input-file>
  let mut output_file = ""
  let mut output_map_file : String? = None
  let mut input_file : String = ""
  let mut mode : @driver.Mode = Default
  let mut input_mode : @driver.InputMode = Array
  let mut external_tokens : Bool = false
  let mut no_comments : Bool = false
  let mut no_std : Bool = false
  let mut token_payload_rewrite : @driver.TokenPayloadRewrite = NoRewrite
  let mut force_int_position : Bool = false
  let mut print_as_mly_without_actions : Bool = false
  @ArgParser.parse(
    [
      (
        "--print-as-mly-without-actions",
        "--print-as-mly-without-actions",
        Unit(fn() { print_as_mly_without_actions = true }),
        "Print as mly without actions",
      ),
      (
        "--output-file",
        "-o",
        String(fn(file) { output_file = file }),
        "Output file",
      ),
      (
        "--output-map-file",
        "--output-map-file",
        String(fn(file) { output_map_file = Some(file) }),
        "Output source map file, if not specified, it will be the output file with .map.json extension",
      ),
      (
        "--mode",
        "--mode",
        String(fn(mode_sym) {
          mode = match mode_sym {
            "default" => Default
            "json-cst" => JsonCst
            "only-tokens" => OnlyTokens
            _ => {
              println_to_stderr("Unsupported mode: \{mode_sym}")
              exit(1)
            }
          }
        }),
        "Specify mode (default, json-cst)",
      ),
      (
        "--input-mode",
        "--input-mode",
        String(fn(input_mode_sym) {
          match input_mode_sym {
            "array" => input_mode = Array
            "pull" => input_mode = Pull
            _ => {
              println_to_stderr("Unsupported input mode: \{input_mode_sym}")
              exit(1)
            }
          }
        }),
        "Specify input mode (array, pull). Default is array",
      ),
      (
        "--external-tokens",
        "--external-tokens",
        Unit(fn() { external_tokens = true }),
        "Use external tokens",
      ),
      (
        "--force-token-json-payload",
        "--force-token-json-payload",
        Unit(fn() { token_payload_rewrite = JsonPayload }),
        "Force token to use JSON payload",
      ),
      (
        "--force-token-no-payload",
        "--force-token-no-payload",
        Unit(fn() { token_payload_rewrite = NoPayload }),
        "Force token to not use payload",
      ),
      (
        "--force-int-position",
        "--force-int-position",
        Unit(fn() { force_int_position = true }),
        "Overwrite the position type to int",
      ),
      (
        "--no-comments",
        "--no-comments",
        Unit(fn() { no_comments = true }),
        "Do not include comments in the output",
      ),
      (
        "--no-std",
        "--no-std",
        Unit(fn() { no_std = true }),
        "Do not include standard library",
      ),
      (
        "--version",
        "-v",
        Unit(fn() {
          println("moonyacc 0.1.0")
          exit(0)
        }),
        "Show version",
      ),
    ],
    fn(rest) { input_file = rest },
    usage,
    @sys.get_cli_args(),
  )
  guard input_file != "" else {
    println_to_stderr("Input file is required")
    exit(1)
  }
  let parser_spec_src = try {
    @fs.read_file_to_string!(input_file)
  } catch {
    err => abort(Show::to_string(err))
  }
  if print_as_mly_without_actions {
    let lexer = @parser.new_lexer(parser_spec_src)
    fn token() {
      lexer.next_token?().unwrap()
    }

    let spec = match @parser.spec?(token, 0) {
      Ok(spec) => spec
      Err(UnexpectedToken(expected)) => {
        let loc_str = loc_to_string(filename, parser_spec_str, loc)
        let expected_str = array_to_or_list(expected.map(Show::to_string)[:])
        println_to_stderr(
          "SyntaxError: Unexpected token \{token.kind()}, expected \{expected_str}.\n  at \{loc_str}",
        )
        exit(1)
      }
    }
    let out = StringBuilder::new()
    @ast.print_spec(spec, out)
    println(out.to_string())
    exit(0)
  }
  let source_map = @codegen.SourceMap::new()
  let output = @driver.compile(
    parser_spec_src,
    mode~,
    source_map_builder=source_map,
    input_mode~,
    filename=input_file,
    external_tokens~,
    no_comments~,
    no_std~,
    token_payload_rewrite~,
    force_int_position~,
    generator=@gen_mbt.generator,
  )
  fn write_map_file!(file : String) {
    @fs.write_string_to_file!(
      file,
      @json.stringify(source_map.to_json(), indent=2),
    )
  }

  if output_file == "" {
    println(output)
    match output_map_file {
      Some(file) => write_map_file?(file).unwrap()
      None => ()
    }
  } else {
    @fs.write_string_to_file?(output_file, output).unwrap()
    write_map_file?(output_map_file.or("\{output_file}.map.json")).unwrap()
  }
}
