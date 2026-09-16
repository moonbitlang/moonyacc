///|
test "source maps use Unicode scalar offsets with emoji" {
  let prefix = "// 😀\r\n%token<Int> NUMBER\r\n%start<Int> start\r\n%%\r\nstart: n=NUMBER {"
  let action = "let _ = \"😀中文\"; n + missing_action"
  let grammar = prefix + action + "};\r\n"
  for generator in [@gen_mbt.generator, @gen_mbt_table.generator] {
    let source_map = @codegen.SourceMap::new()
    let generated = @driver.compile(
      grammar,
      filename="parser.mbty",
      source_map_builder=source_map,
      generator~,
    )
    assert_eq(source_map.mappings.length(), 1)
    let mapping = source_map.mappings[0]
    assert_eq(mapping.source, "parser.mbty")
    assert_eq(mapping.original_offset, prefix.char_length())
    assert_eq(mapping.length, action.char_length())
    let original_chars = grammar.to_array()
    let generated_chars = generated.to_array()
    assert_eq(
      String::from_array(
        original_chars[mapping.original_offset:mapping.original_offset +
        mapping.length],
      ),
      action,
    )
    assert_eq(
      String::from_array(
        generated_chars[mapping.generated_offset:mapping.generated_offset +
        mapping.length],
      ),
      action,
    )
  }
}
