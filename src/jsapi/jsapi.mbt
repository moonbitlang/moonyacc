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
pub(all) struct CompileResult {
  ok : Bool
  code : String
}

///|
pub fn compile(
  parser_spec_str : String,
  mode~ : @driver.Mode = Default
) -> CompileResult {
  let code = @driver.compile(
    parser_spec_str,
    mode~,
    filename="parser.mbty",
    no_comments=true,
  )
  { ok: true, code }
}

///|
pub fn default_mode() -> @driver.Mode {
  Default
}

///|
pub fn json_cst_mode() -> @driver.Mode {
  JsonCst(token_payload_rewrite=None)
}

///|
pub fn json_cst_no_payload_mode() -> @driver.Mode {
  JsonCst(token_payload_rewrite=Some(NoPayload))
}

///|
pub fn json_cst_json_payload_mode() -> @driver.Mode {
  JsonCst(token_payload_rewrite=Some(JsonPayload))
}
