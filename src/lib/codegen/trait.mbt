///|
pub(open) trait CodeGenerator {
  codegen_tokens(
    Self,
    Array[@grm.Terminal],
    (String) -> TerminalMeta,
    &Logger,
    no_comments~ : Bool,
    derive_map~ : @immut/hashmap.T[PubType, String],
  ) -> Unit
  codegen(
    Self,
    @grm.Grammar,
    @lr1.Automaton,
    MetaProvider,
    @logger_with_cursor.LoggerWithCursor,
    source_map_builder~ : &SourceMapBuilder?,
    grammar_filename~ : String,
    external_tokens~ : Bool,
    no_comments~ : Bool,
    mode~ : Mode,
    input_mode~ : InputMode,
  ) -> Unit
}
