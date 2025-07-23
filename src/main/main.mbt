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
struct Config {
  mut output_file : String
  mut output_map_file : String?
  mut input_file : String
  mut mode : @driver.Mode
  mut input_mode : @driver.InputMode
  mut external_tokens : Bool
  mut no_comments : Bool
  mut no_std : Bool
  mut token_payload_rewrite : @driver.TokenPayloadRewrite
  mut force_int_position : Bool
  mut print_as_mly_without_actions : Bool
}

///|
fn Config::default() -> Config {
  {
    output_file: "",
    output_map_file: None,
    input_file: "",
    mode: @driver.Default,
    input_mode: @driver.Array,
    external_tokens: false,
    no_comments: false,
    no_std: false,
    token_payload_rewrite: @driver.NoRewrite,
    force_int_position: false,
    print_as_mly_without_actions: false,
  }
}

///|
fn parse_args() -> Config {
  let config = Config::default()
  let usage = "Usage: moonyacc [options] <input-file>"
  @ArgParser.parse(
    [
      (
        "--print-as-mly-without-actions",
        "--print-as-mly-without-actions",
        Unit(fn() { config.print_as_mly_without_actions = true }),
        "Print as mly without actions",
      ),
      (
        "--output-file",
        "-o",
        String(fn(file) { config.output_file = file }),
        "Output file",
      ),
      (
        "--output-map-file",
        "--output-map-file",
        String(fn(file) { config.output_map_file = Some(file) }),
        "Output source map file, if not specified, it will be the output file with .map.json extension",
      ),
      (
        "--mode",
        "--mode",
        String(fn(mode_sym) {
          config.mode = match mode_sym {
            "default" => @driver.Default
            "json-cst" => @driver.JsonCst
            "only-tokens" => @driver.OnlyTokens
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
            "array" => config.input_mode = @driver.Array
            "pull" => config.input_mode = @driver.Pull
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
        Unit(fn() { config.external_tokens = true }),
        "Use external tokens",
      ),
      (
        "--force-token-json-payload",
        "--force-token-json-payload",
        Unit(fn() { config.token_payload_rewrite = @driver.JsonPayload }),
        "Force token to use JSON payload",
      ),
      (
        "--force-token-no-payload",
        "--force-token-no-payload",
        Unit(fn() { config.token_payload_rewrite = @driver.NoPayload }),
        "Force token to not use payload",
      ),
      (
        "--force-int-position",
        "--force-int-position",
        Unit(fn() { config.force_int_position = true }),
        "Overwrite the position type to int",
      ),
      (
        "--no-comments",
        "--no-comments",
        Unit(fn() { config.no_comments = true }),
        "Do not include comments in the output",
      ),
      (
        "--no-std",
        "--no-std",
        Unit(fn() { config.no_std = true }),
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
    fn(rest) { config.input_file = rest },
    usage,
    @sys.get_cli_args(),
  )
  guard config.input_file != "" else {
    println_to_stderr("Input file is required")
    exit(1)
  }
  config
}

///|
fn main {
  let config = parse_args()
  let parser_spec_src = @fs.read_file_to_string(config.input_file) catch {
    err => abort(Show::to_string(err))
  }
  if config.print_as_mly_without_actions {
    let out = StringBuilder::new()
    @driver.print(parser_spec_src, filename=config.input_file, out~)
    exit(0)
  }
  let source_map = @codegen.SourceMap::new()
  let output = @driver.compile(
    parser_spec_src,
    mode=config.mode,
    source_map_builder=source_map,
    input_mode=config.input_mode,
    filename=config.input_file,
    external_tokens=config.external_tokens,
    no_comments=config.no_comments,
    no_std=config.no_std,
    token_payload_rewrite=config.token_payload_rewrite,
    force_int_position=config.force_int_position,
    generator=@gen_mbt.generator,
  )
  fn write_map_file(file : String) raise {
    @fs.write_string_to_file(file, source_map.to_json().stringify(indent=2))
  }

  if config.output_file == "" {
    println(output)
    match config.output_map_file {
      Some(file) => (try? write_map_file(file)).unwrap()
      None => ()
    }
  } else {
    (try? {
      @fs.write_string_to_file(config.output_file, output)
      write_map_file(config.output_map_file.unwrap_or("\{config.output_file}.map.json"))
    }).unwrap()
  }
}
