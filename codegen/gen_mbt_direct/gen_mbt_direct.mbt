///|
fn codegen(
  grammar : @grm.Grammar,
  automaton : @lr1.Automaton,
  meta : @codegen.MetaProvider,
  output : @logger_with_cursor.LoggerWithCursor,
  source_map_builder? : &@codegen.SourceMapBuilder,
  grammar_filename~ : String,
  external_tokens~ : Bool = false,
  no_comments~ : Bool = false,
  mode~ : @codegen.Mode = Default,
  input_mode~ : @codegen.InputMode = Array,
) -> Unit {
  let program = @direct_ir.lower(grammar, automaton, meta, mode~)
  program.validate() catch {
    InvalidProgram(message) => abort(message)
  }
  let program = program.simplify()
  program.validate() catch {
    InvalidProgram(message) => abort(message)
  }
  let support = @mbt_common.Context::new(
    grammar,
    automaton,
    meta,
    filename=grammar_filename,
    mode~,
    input_mode~,
    action_calls=Direct,
  )
  let items = support.prelude(external_tokens~, require_void=true)
  // Share the integer-symbol input ABI; the parse path uses no action table.
  items.push(@mbt_ast.item(TypeAlias("YYSymbol", type_("Int"))))
  items.append(support.action_items())
  items.push(support.input_function(Table))
  let emitter = Emitter::new(program, meta, support, input_mode)
  items.append(emitter.parser_items(no_comments~))
  items.append(diagnostic_items(program, meta.position_data_type, input_mode))
  items.append(support.action_runtime())
  items.append(support.footer())
  @mbt_ast.emit(items, output, source_map_builder?)
}

///|
priv struct CodeGenerator(Unit)

///|
impl @codegen.CodeGenerator for CodeGenerator with fn codegen_tokens(
  self,
  terminals,
  terminal_meta,
  output,
  no_comments~,
  derive_map~,
) {
  let CodeGenerator(_) = self
  ignore(no_comments)
  @mbt_ast.emit(
    @mbt_common.token_items(terminals, terminal_meta, derive_map~),
    @logger_with_cursor.new(output),
  )
}

///|
impl @codegen.CodeGenerator for CodeGenerator with fn codegen(
  self,
  grammar,
  automaton,
  meta,
  output,
  source_map_builder~,
  grammar_filename~,
  external_tokens~,
  no_comments~,
  mode~,
  input_mode~,
) {
  let CodeGenerator(_) = self
  codegen(
    grammar,
    automaton,
    meta,
    output,
    source_map_builder?,
    grammar_filename~,
    external_tokens~,
    no_comments~,
    mode~,
    input_mode~,
  )
}

///|
pub let generator : &@codegen.CodeGenerator = CodeGenerator(())
