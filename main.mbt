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
fn println_to_stderr(msg : String) -> Unit {
  @miniio.stderr.write_text(msg + "\n") catch {
    _ => ()
  }
}

///|
fn[T] exit(code : Int) -> T {
  @miniio.exit(code)
  panic()
}

///|
priv struct CliOptions {
  input_file : String
  output_file : String
  output_map_file : String?
  mode : @driver.Mode
  input_mode : @driver.InputMode
  external_tokens : Bool
  no_comments : Bool
  no_std : Bool
  table : Bool
  compress : Bool
  token_payload_rewrite : @driver.TokenPayloadRewrite
  force_int_position : Bool
  print_as_mly_without_actions : Bool
}

///|
fn cli_command() -> @argparse.Command {
  @argparse.Command(
    "moonyacc",
    version="moonyacc 0.1.0",
    disable_version_flag=true,
    flags=[
      @argparse.FlagArg(
        "external-tokens",
        long="external-tokens",
        about="Use external tokens",
      ),
      @argparse.FlagArg(
        "no-comments",
        long="no-comments",
        about="Do not include comments in the output",
      ),
      @argparse.FlagArg(
        "no-std",
        long="no-std",
        about="Do not include standard library",
      ),
      @argparse.FlagArg("table", long="table", about="Use table engine"),
      @argparse.FlagArg(
        "compress-table",
        long="compress-table",
        about="Use table engine with compression",
      ),
      @argparse.FlagArg(
        "version",
        short='v',
        long="version",
        action=Version,
        about="Show version",
      ),
      @argparse.FlagArg(
        "print-as-mly-without-actions",
        long="print-as-mly-without-actions",
        about="Print as mly without actions",
      ),
      @argparse.FlagArg(
        "force-token-json-payload",
        long="force-token-json-payload",
        about="Force token to use JSON payload",
      ),
      @argparse.FlagArg(
        "force-token-no-payload",
        long="force-token-no-payload",
        about="Force token to not use payload",
      ),
      @argparse.FlagArg(
        "force-int-position",
        long="force-int-position",
        about="Overwrite the position type to int",
      ),
    ],
    options=[
      @argparse.OptionArg(
        "output-file",
        short='o',
        long="output-file",
        about="Output file",
      ),
      @argparse.OptionArg(
        "output-map-file",
        long="output-map-file",
        about="Output source map file, if not specified, it will be the output file with .map.json extension",
      ),
      @argparse.OptionArg(
        "mode",
        long="mode",
        about="Specify mode (default, json-cst, only-tokens)",
      ),
      @argparse.OptionArg(
        "input-mode",
        long="input-mode",
        about="Specify input mode (array, pull). Default is array",
      ),
    ],
    positionals=[
      @argparse.PositionArg(
        "input-file",
        num_args=@argparse.ValueRange::single(),
      ),
    ],
  )
}

///|
fn string_value(
  matches : @argparse.Matches,
  name : String,
  default : String,
) -> String {
  match matches.values.get(name) {
    Some(values) => values[0]
    None => default
  }
}

///|
fn string_option(matches : @argparse.Matches, name : String) -> String? {
  match matches.values.get(name) {
    Some(values) => Some(values[0])
    None => None
  }
}

///|
fn flag_value(matches : @argparse.Matches, name : String) -> Bool {
  matches.flags.get(name).unwrap_or(false)
}

///|
fn parse_mode(mode_sym : String) -> @driver.Mode {
  match mode_sym {
    "default" => Default
    "json-cst" => JsonCst
    "only-tokens" => OnlyTokens
    _ => {
      println_to_stderr("Unsupported mode: \{mode_sym}")
      exit(1)
    }
  }
}

///|
fn parse_input_mode(input_mode_sym : String) -> @driver.InputMode {
  match input_mode_sym {
    "array" => Array
    "pull" => Pull
    _ => {
      println_to_stderr("Unsupported input mode: \{input_mode_sym}")
      exit(1)
    }
  }
}

///|
fn parse_token_payload_rewrite(
  argv : ArrayView[String],
) -> @driver.TokenPayloadRewrite {
  let mut rewrite : @driver.TokenPayloadRewrite = NoRewrite
  for arg in argv {
    match arg {
      "--force-token-json-payload" => rewrite = JsonPayload
      "--force-token-no-payload" => rewrite = NoPayload
      _ => ()
    }
  }
  rewrite
}

///|
fn parse_cli_args(argv : ArrayView[String]) -> CliOptions raise {
  let matches = cli_command().parse(argv~, env={})
  let compress = flag_value(matches, "compress-table")
  {
    input_file: string_value(matches, "input-file", ""),
    output_file: string_value(matches, "output-file", ""),
    output_map_file: string_option(matches, "output-map-file"),
    mode: parse_mode(string_value(matches, "mode", "default")),
    input_mode: parse_input_mode(string_value(matches, "input-mode", "array")),
    external_tokens: flag_value(matches, "external-tokens"),
    no_comments: flag_value(matches, "no-comments"),
    no_std: flag_value(matches, "no-std"),
    table: compress || flag_value(matches, "table"),
    compress,
    token_payload_rewrite: parse_token_payload_rewrite(argv),
    force_int_position: flag_value(matches, "force-int-position"),
    print_as_mly_without_actions: flag_value(
      matches, "print-as-mly-without-actions",
    ),
  }
}

///|
fn main {
  let argv = @miniio.args_get() catch { err => abort(Show::to_string(err)) }
  let options = parse_cli_args(if argv.length() > 1 { argv[1:] } else { [] }) catch {
    err => {
      println_to_stderr(err.to_string())
      exit(1)
    }
  }
  let parser_spec_src = @miniio.read_text_file(options.input_file) catch {
    err => abort(Show::to_string(err))
  }
  if options.print_as_mly_without_actions {
    let out = StringBuilder::new()
    @driver.print(parser_spec_src, filename=options.input_file, out~)
    exit(0)
  }
  let source_map = @codegen.SourceMap::new()
  let output = @driver.compile(
    parser_spec_src,
    mode=options.mode,
    source_map_builder=source_map,
    input_mode=options.input_mode,
    filename=options.input_file,
    external_tokens=options.external_tokens,
    no_comments=options.no_comments,
    no_std=options.no_std,
    token_payload_rewrite=options.token_payload_rewrite,
    force_int_position=options.force_int_position,
    generator=if options.table {
      if options.compress {
        @gen_mbt_table.compress_generator
      } else {
        @gen_mbt_table.generator
      }
    } else {
      @gen_mbt.generator
    },
  )
  fn write_map_file(file : String) raise {
    @miniio.write_text_file(file, source_map.to_json().stringify(indent=2))
  }

  if options.output_file == "" {
    println(output)
    match options.output_map_file {
      Some(file) => try! write_map_file(file)
      None => ()
    }
  } else {
    try! ({
      @miniio.write_text_file(options.output_file, output)
      write_map_file(
        options.output_map_file.unwrap_or("\{options.output_file}.map.json"),
      )
    })
  }
}
