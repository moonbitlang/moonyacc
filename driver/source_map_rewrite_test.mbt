///|
/// Resolve offsets with the same inclusive range lookup as Moon's renderer.
fn original_offset(source_map : @codegen.SourceMap, offset : Int) -> Int raise {
  guard source_map.mappings.binary_search_by(mapping => {
      guard offset >= mapping.generated_offset else { 1 }
      guard offset <= mapping.generated_offset + mapping.length else { -1 }
      0
    })
    is Ok(index) else {
    fail("No source mapping for generated offset \{offset}")
  }
  let mapping = source_map.mappings[index]
  mapping.original_offset + offset - mapping.generated_offset
}

///|
test "source maps preserve rewritten references and their interior positions" {
  let binder = "very_long_binder_name_for_a_shorter_replacement"
  let prefix = "%position<Int>\n%token<Int> NUMBER\n%start<String> start\n%%\nstart: " +
    binder +
    "=NUMBER {"
  let rewrites = [
    ("$1", "_dollar1"),
    ("$loc", "(_start_pos, _end_pos)"),
    ("$sloc", "(_symbol_start_pos, _end_pos)"),
    ("$startpos(" + binder + ")", "_start_pos_of_item0"),
  ]
  for generator in [@gen_mbt.generator, @gen_mbt_table.generator] {
    for rewrite in rewrites {
      let (reference, replacement) = rewrite
      for padding in ["", " "] {
        let source_map = @codegen.SourceMap::new()
        let generated = @driver.compile(
          prefix + padding + reference + padding + "};\n",
          filename="parser.mbty",
          source_map_builder=source_map,
          generator~,
        )
        let body_prefix = "({(); " + padding
        let generated_start = generated
          .find(body_prefix + replacement + padding + "})")
          .unwrap() +
          body_prefix.length()
        let original_start = prefix.length() + padding.length()
        let original_end = original_start + reference.length()
        assert_eq(original_offset(source_map, generated_start), original_start)
        assert_eq(
          original_offset(source_map, generated_start + replacement.length()),
          original_end,
        )
        // Diagnostics can select a subexpression inside a rewrite, e.g. the
        // first component of $loc. Every interior offset must stay mapped.
        for delta in 1..<replacement.length() {
          let mapped = original_offset(source_map, generated_start + delta)
          assert_true(mapped >= original_start && mapped <= original_end)
        }
        // Adjacent unchanged text must retain its original linear mapping.
        if padding != "" {
          assert_eq(
            original_offset(source_map, generated_start - 1),
            original_start - 1,
          )
          assert_eq(
            original_offset(
              source_map,
              generated_start + replacement.length() + 1,
            ),
            original_end + 1,
          )
        }
      }
    }
  }
}
