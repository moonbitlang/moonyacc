///|
fn mapped_offset(map : @codegen.SourceMap, offset : Int) -> Int raise {
  for mapping in map.mappings {
    if offset >= mapping.generated_offset &&
      offset <= mapping.generated_offset + mapping.length {
      return mapping.original_offset + offset - mapping.generated_offset
    }
  }
  fail("No source mapping at \{offset}")
}

///|
test "source maps follow layout while Unicode source and AST splices stay intact" {
  let prefix = "let text = \"😀中文\"\r\n"
  let name = "a_long_generated_identifier"
  let suffix = " // trailing comment"
  let source_start = 100
  let raw = @mbt_ast.Fragment([
    Text(
      prefix,
      Some({
        source: "grammar.mbty",
        offset: source_start,
        length: prefix.length(),
      }),
    ),
    Splice(
      Tuple([Ident(name), Int(7)]),
      Some({
        source: "grammar.mbty",
        offset: source_start + prefix.length(),
        length: 2,
      }),
    ),
    Text(
      suffix,
      Some({
        source: "grammar.mbty",
        offset: source_start + prefix.length() + 2,
        length: suffix.length(),
      }),
    ),
  ])
  let int : @elab.TypeExpr = Constr(pkg=None, "Int", [])
  let items = [
    @mbt_ast.item(
      Function(
        @mbt_ast.function(
          "render_user_expression",
          [Positional("a_long_parameter_name", Some(int))],
          {
            statements: [Let(Bind("_emoji"), None, String("😀"))],
            result: Some(Verbatim(raw)),
          },
          result=int,
        ),
      ),
      visibility=Public,
    ),
  ]
  let wide = @mbt_ast.render(items, width=120)
  let narrow = @mbt_ast.render(items, width=24)
  assert_true(
    wide.source_map.mappings[0].generated_offset !=
    narrow.source_map.mappings[0].generated_offset,
  )
  for output in [wide, narrow] {
    let start = output.source.find(prefix).unwrap()
    assert_eq(output.source_map.mappings[0].generated_offset, start)
    assert_eq(output.source_map.mappings[0].length, prefix.length())
    assert_eq(mapped_offset(output.source_map, start), source_start)
    let rewritten = start + prefix.length()
    let end = output.source.find(suffix).unwrap()
    let length = end - rewritten
    let replacement = output.source[rewritten:end]
    assert_true(replacement.contains(name))
    // Narrow page widths must not reflow a substitution inside opaque source.
    assert_false(replacement.contains("\n") || replacement.contains("\r"))
    assert_true(output.source.contains(suffix + "\n"))
    for offset in 0..<length {
      assert_eq(
        mapped_offset(output.source_map, rewritten + offset),
        source_start + prefix.length(),
      )
    }
    assert_eq(
      mapped_offset(output.source_map, end),
      source_start + prefix.length() + 2,
    )
    assert_eq(
      mapped_offset(output.source_map, end + 3),
      source_start + prefix.length() + 5,
    )
  }
  // Appending to a legacy emitter keeps absolute offsets in the same unit.
  let buffer = StringBuilder()
  let output = @logger_with_cursor.new(buffer)
  let map = @codegen.SourceMap::new()
  let generated_prefix = "// 😀 existing prefix\n"
  Logger::write_string(output, generated_prefix)
  @mbt_ast.emit(items, output, source_map_builder=map, width=120)
  assert_eq(
    map.mappings[0].generated_offset,
    wide.source_map.mappings[0].generated_offset + generated_prefix.length(),
  )
}
