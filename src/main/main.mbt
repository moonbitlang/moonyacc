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
fn main {
  let usage =
    #|Usage: moonyacc [options] <input-file>
  let output_file = @ref.new("")
  let output_map_file : Ref[String?] = @ref.new(None)
  let input_file = @ref.new("")
  let mode : Ref[@driver.Mode] = @ref.new(Default)
  let input_mode : Ref[@driver.InputMode] = @ref.new(Array)
  let external_tokens : Ref[Bool] = @ref.new(false)
  let no_comments : Ref[Bool] = @ref.new(false)
  let no_std : Ref[Bool] = @ref.new(false)
  let token_payload_rewrite : Ref[@driver.TokenPayloadRewrite?] = @ref.new(None)
  let force_int_position : Ref[Bool] = @ref.new(false)
  @ArgParser.parse(
    [
      ("--output-file", "-o", Set_string(output_file), "Output file"),
      (
        "--output-map-file",
        "--output-map-file",
        String(fn(file) { output_map_file.val = Some(file) }),
        "Output source map file, if not specified, it will be the output file with .map.json extension",
      ),
      (
        "--mode",
        "--mode",
        String(fn(mode_sym) {
          mode.val = match mode_sym {
            "default" => Default
            "json-cst" => JsonCst(token_payload_rewrite=None)
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
            "array" => input_mode.val = Array
            "pull" => input_mode.val = Pull
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
        Unit(fn() { external_tokens.val = true }),
        "Use external tokens",
      ),
      (
        "--force-token-json-payload",
        "--force-token-json-payload",
        Unit(fn() { token_payload_rewrite.val = Some(JsonPayload) }),
        "Force token to use JSON payload (only for json-cst mode)",
      ),
      (
        "--force-token-no-payload",
        "--force-token-no-payload",
        Unit(fn() { token_payload_rewrite.val = Some(NoPayload) }),
        "Force token to not use payload (only for json-cst mode)",
      ),
      (
        "--force-int-position",
        "--force-int-position",
        Unit(fn() { force_int_position.val = true }),
        "Overwrite the position type to int",
      ),
      (
        "--no-comments",
        "--no-comments",
        Unit(fn() { no_comments.val = true }),
        "Do not include comments in the output",
      ),
      (
        "--no-std",
        "--no-std",
        Unit(fn() { no_std.val = true }),
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
    fn(rest) { input_file.val = rest },
    usage,
    @sys.get_cli_args(),
  )
  guard input_file.val != "" else {
    println_to_stderr("Input file is required")
    exit(1)
  }
  let parser_spec_src = try {
    @fs.read_file_to_string!(input_file.val)
  } catch {
    err => abort(Show::to_string(err))
  }
  let mode : @driver.Mode = match mode.val {
    JsonCst(_) => JsonCst(token_payload_rewrite=token_payload_rewrite.val)
    mode => mode
  }
  let source_map = @codegen.SourceMap::new()
  let output = @driver.compile(
    parser_spec_src,
    mode~,
    source_map_builder=source_map,
    input_mode=input_mode.val,
    filename=input_file.val,
    external_tokens=external_tokens.val,
    no_comments=no_comments.val,
    no_std=no_std.val,
    force_int_position=force_int_position.val,
    generator=@gen_mbt.generator,
  )
  fn write_map_file!(file : String) {
    @fs.write_string_to_file!(
      file,
      @json.stringify(source_map.to_json(), indent=2),
    )
  }

  if output_file.val == "" {
    println(output)
    match output_map_file.val {
      Some(file) => write_map_file?(file).unwrap()
      None => ()
    }
  } else {
    @fs.write_string_to_file?(output_file.val, output).unwrap()
    write_map_file?(output_map_file.val.or("\{output_file.val}.map.json")).unwrap()
  }
}
