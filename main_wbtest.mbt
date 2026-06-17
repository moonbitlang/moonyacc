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
  guard options.output_map_file is Some(output_map_file)
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
}
