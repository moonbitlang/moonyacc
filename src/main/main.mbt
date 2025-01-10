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
  let input_file = @ref.new("")
  let mode : Ref[@driver.Mode] = @ref.new(Default)
  let external_tokens : Ref[Bool] = @ref.new(false)
  let no_comments : Ref[Bool] = @ref.new(false)
  let token_payload_rewrite : Ref[@driver.TokenPayloadRewrite?] = @ref.new(None)
  @ArgParser.parse(
    [
      ("--output-file", "-o", Set_string(output_file), "Output file"),
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
        "--no-comments",
        "--no-comments",
        Unit(fn() { no_comments.val = true }),
        "Do not include comments in the output",
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
    @fs.read_file_to_string!(path=input_file.val)
  } catch {
    err => abort(Show::to_string(err))
  }
  let mode : @driver.Mode = match mode.val {
    JsonCst(_) => JsonCst(token_payload_rewrite=token_payload_rewrite.val)
    mode => mode
  }
  let output = @driver.compile(
    parser_spec_src,
    mode~,
    filename=input_file.val,
    external_tokens=external_tokens.val,
    no_comments=no_comments.val,
  )
  if output_file.val == "" {
    println(output)
  } else {
    @fs.write_string_to_file(path=output_file.val, content=output)
  }
}
