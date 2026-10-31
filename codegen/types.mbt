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
pub(all) enum Mode {
  Default
  JsonCst
}

///|
pub(all) enum TokenPayloadRewrite {
  NoPayload
  JsonPayload
}

///|
pub(all) enum InputMode {
  Array
  Pull
}

///|
/// Public input representation, independent of input mode and optimization.
pub(all) enum InputLayout {
  Located
  TokenOnly
}

///|
pub fn InputLayout::accepts_position(
  self : InputLayout,
  position : @elab.TypeExpr,
) -> Bool {
  self is Located || position is Constr(pkg=None, "Unit", [])
}

///|
/// Direct backend optimization level. O1 is the default; O2 adds bounded state
/// specialization and regional runtime optimization. O0 currently uses O1.
pub(all) enum OptimizationLevel {
  O0
  O1
  O2
}

///|
pub(all) struct ProductionMeta {
  action : @elab.Action
}

///|
pub(all) struct TerminalMeta {
  data_type : @elab.TypeExpr
  image : String?
}

///|
pub(all) struct NonTerminalMeta {
  data_type : @elab.TypeExpr
}

///|
pub(all) struct MetaProvider {
  header : @immut/vector.Vector[@elab.CodeChunk]
  footer : @immut/vector.Vector[@elab.CodeChunk]
  position_data_type : @elab.TypeExpr
  terminal_meta : (String) -> TerminalMeta
  nonterminal_meta : (String) -> NonTerminalMeta
  production_meta : (Int32) -> ProductionMeta
  derive_map : @array_multimap.T[String, String]
}
