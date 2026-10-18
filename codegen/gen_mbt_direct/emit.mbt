///|
/// Assemble runtime storage, parser dispatch, chunks and public entry wrappers.
fn Emitter::parser_items(
  self : Emitter,
  no_comments~ : Bool,
) -> Array[@mbt_ast.Item] {
  let items = []
  if self.chunked {
    items.push(self.context_item())
    if !self.chunk_errors.is_empty() {
      items.push(self.stop_item())
    }
    if self.program.blocks.iter().any(b => shift_target(b) is Some(_)) {
      items.push(self.shift_item())
    }
    if self.program.blocks
      .iter()
      .any(b => b.instructions.iter().any(i => i is EnsureLookahead)) {
      items.push(self.input_item())
    }
    if self.program.blocks.iter().any(has_bulk_pop) {
      items.push(self.pop_item())
    }
  }
  items.push(self.parse_item(no_comments))
  if self.chunked {
    for chunk in 0..<self.chunk_count() {
      items.push(self.chunk_item(chunk, no_comments))
    }
  }
  for entry in self.program.entries {
    items.push(self.entry_item(entry))
  }
  items
}
