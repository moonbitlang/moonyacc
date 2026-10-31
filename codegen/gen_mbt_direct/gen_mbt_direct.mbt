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
  optimization_level~ : @codegen.OptimizationLevel,
) -> Unit {
  let knowledge = @direct_ir.analyze_stack(grammar, automaton)
  let program = @direct_ir.lower(grammar, automaton, meta, mode~)
  let prepared = program.prepare(
    knowledge,
    positions=!(meta.position_data_type is Constr(pkg=None, "Unit", [])),
    optimization_level~,
  ) catch {
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
  let items = support.preamble(external_tokens~)
  items.append(support.typed_action_items())
  let emitter = match optimization_level {
    O2 => layout_emitter(prepared, knowledge, meta, support, input_mode)
    O0 | O1 => Emitter::new(prepared, meta, support, input_mode)
  }
  items.append(emitter.parser_items(no_comments~))
  items.append(
    diagnostic_items(emitter.program, meta.position_data_type, input_mode),
  )
  items.append(support.typed_action_runtime())
  items.append(support.footer())
  @mbt_ast.emit(items, output, source_map_builder?)
}

///|
priv struct CodeGenerator(@codegen.OptimizationLevel)

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
  let CodeGenerator(optimization_level) = self
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
    optimization_level~,
  )
}

///|
/// Configure direct code generation. O0 currently uses the O1 pipeline.
pub fn new(
  optimization_level~ : @codegen.OptimizationLevel = O1,
) -> &@codegen.CodeGenerator {
  CodeGenerator(optimization_level)
}

///|
pub let generator : &@codegen.CodeGenerator = new()
