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
pub(all) enum BindingSubject {
  Data(Int, type_~ : CodeFragment?)
  LastPos
  StartPos(Int)
  EndPos(Int)
  SymbolStartPos
  SubAction(start~ : Int, action~ : Int)
}

///|
pub(all) struct Action {
  num : Int
  arity : Int
  type_ : CodeFragment?
  bindings : Array[(BindingSubject, CodeFragment)]
  body : Array[(CodeFragment, (Utf8Pos, Int)?)]
}

// This type is for comment purposes only
///|
typealias Utf8Pos = Int

///|
pub(all) struct ProductionMeta {
  action : Int
}

///|
pub(all) struct TerminalMeta {
  data_type : CodeFragment?
  image : String?
}

///|
pub(all) struct NonTerminalMeta {
  data_type : CodeFragment
}

///|
pub(all) struct MetaProvider {
  header : CodeFragment
  footer : CodeFragment
  position_data_type : CodeFragment
  actions : Array[Action]
  terminal_meta : (String) -> TerminalMeta
  nonterminal_meta : (String) -> NonTerminalMeta
  production_meta : (Int) -> ProductionMeta
  derive_map : @array_multimap.T[String, String]
}
