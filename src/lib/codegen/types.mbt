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
  JsonCst(token_payload_rewrite~ : TokenPayloadRewrite?)
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
pub(all) typealias CodeFragment = String

///|
pub(all) struct ProductionMeta {
  action : @elab.Action
}

///|
pub(all) struct TerminalMeta {
  data_type : @elab.TypeExpr?
  image : String?
}

///|
pub(all) struct NonTerminalMeta {
  data_type : @elab.TypeExpr
}

///|
pub(all) struct MetaProvider {
  header : CodeFragment
  footer : CodeFragment
  position_data_type : @elab.TypeExpr
  terminal_meta : (String) -> TerminalMeta
  nonterminal_meta : (String) -> NonTerminalMeta
  production_meta : (Int) -> ProductionMeta
  derive_map : @array_multimap.T[String, @elab.TypeExpr]
}
