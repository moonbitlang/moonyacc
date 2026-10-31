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
test "parse cli args keeps moonyacc options" {
  let options = parse_cli_args([
    "--output-file", "parser.mbt", "--output-map-file", "parser.mbt.map.json", "--mode",
    "json-cst", "--input-mode", "pull", "--external-tokens", "--no-comments", "--no-std",
    "--compress-table", "--print-as-mly-without-actions", "--force-token-json-payload",
    "--force-int-position", "parser.mbty",
  ])

  assert_eq(options.input_file, "parser.mbty")
  assert_eq(options.output_file, "parser.mbt")
  guard! options.output_map_file is Some(output_map_file)
  assert_eq(output_map_file, "parser.mbt.map.json")
  assert_true(options.mode is JsonCst)
  assert_true(options.input_mode is Pull)
  assert_true(options.external_tokens)
  assert_true(options.no_comments)
  assert_true(options.no_std)
  assert_true(options.table)
  assert_true(options.compress)
  assert_true(options.print_as_mly_without_actions)
  assert_true(options.token_payload_rewrite is JsonPayload)
  assert_true(options.force_int_position)
  assert_true(options.optimization_level is O1)
}

///|
test "optimization levels accept attached separated and long options" {
  for
    (value, level) in [
      ("0", @codegen.OptimizationLevel::O0),
      ("1", O1),
      ("2", O2),
    ] {
    for
      args in [
        ["-O\{value}"],
        ["-O", value],
        ["--optimization-level", value],
        ["--optimization-level=\{value}"],
      ] {
      args.append(["--backend", "direct", "-o", "parser.mbt", "parser.mbty"])
      let options = parse_cli_args(args)
      match (options.optimization_level, level) {
        (O0, O0) | (O1, O1) | (O2, O2) => ()
        _ => fail("unexpected optimization level")
      }
      assert_true(options.direct)
      assert_eq(options.input_file, "parser.mbty")
      assert_eq(options.output_file, "parser.mbt")
    }
  }
  // argparse owns the end-of-options boundary, even for flag-like filenames.
  let positional = parse_cli_args(["--", "-O2"])
  assert_eq(positional.input_file, "-O2")
  assert_true(positional.optimization_level is O1)
}

///|
test "optimization level uses the last occurrence without selecting a backend" {
  let options = parse_cli_args([
    "-O1", "--optimization-level", "2", "-O", "0", "parser.mbty",
  ])
  assert_true(options.optimization_level is O0)
  assert_false(options.direct || options.table)
  let table = parse_cli_args(["--table", "-O0", "-O2", "parser.mbty"])
  assert_true(table.optimization_level is O2)
  assert_true(table.table && !table.direct)
}

///|
test "optimization level rejects invalid and missing values" {
  for value in ["3", "-1", "fast", ""] {
    // An invalid occurrence must not be hidden by a later valid one.
    try
      parse_cli_args(["--optimization-level=\{value}", "-O1", "parser.mbty"])
    catch {
      CliError::UnsupportedOptimizationLevel(actual) => assert_eq(actual, value)
      _ => fail("unexpected CLI error")
    } noraise {
      _ => fail("accepted an invalid optimization level")
    }
  }
  for
    args in [
      ["parser.mbty", "-O"],
      ["-O", "--backend", "direct", "parser.mbty"],
    ] {
    try parse_cli_args(args) catch {
      _ => ()
    } noraise {
      _ => fail("accepted a missing optimization level")
    }
  }
}

///|
test "direct backend selection is explicit and rejects table flags" {
  let direct = parse_cli_args(["--backend", "direct", "parser.mbty"])
  assert_true(direct.direct && !direct.table && !direct.compress)
  let default_ = parse_cli_args(["parser.mbty"])
  assert_false(default_.direct || default_.table)
  for flag in ["--table", "--compress-table"] {
    try parse_cli_args(["--backend", "direct", flag, "parser.mbty"]) catch {
      CliError::ConflictingBackendOptions => ()
      _ => fail("unexpected CLI error")
    } noraise {
      _ => fail("accepted incompatible backends")
    }
  }
}

///|
test "input layout is explicit and independent of mode and optimization" {
  assert_true(parse_cli_args(["parser.mbty"]).input_layout is Located)
  for mode in ["array", "pull"] {
    for level in ["-O0", "-O1", "-O2"] {
      let options = parse_cli_args([
        "--input-layout=token-only", "--input-mode", mode, level, "parser.mbty",
      ])
      assert_true(options.input_layout is TokenOnly)
      assert_false(options.direct || options.table)
    }
  }
  try parse_cli_args(["--input-layout", "unknown", "parser.mbty"]) catch {
    CliError::UnsupportedInputLayout("unknown") => ()
    _ => fail("unexpected layout error")
  } noraise {
    _ => fail("accepted an unknown input layout")
  }
}
