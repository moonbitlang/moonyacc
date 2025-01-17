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
pub(all) typealias CodeFragment = String

///|
pub(all) enum BindingSubject {
  Data(Int)
  LastPos
  StartPos(Int)
  EndPos(Int)
  SymbolStartPos
}

///|
pub(all) struct ProductionMeta {
  bindings : Array[(BindingSubject, CodeFragment)]
  body : CodeFragment
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
pub(all) enum PubType {
  Token
  TokenKind
  ParseError
} derive(Eq, Compare, Hash, ToJson)

///|
pub(all) struct MetaProvider {
  header : CodeFragment
  footer : CodeFragment
  position_data_type : CodeFragment
  terminal_meta : (String) -> TerminalMeta
  nonterminal_meta : (String) -> NonTerminalMeta
  production_meta : (Int) -> ProductionMeta
  derive_map : @immut/hashmap.T[PubType, String]
}
