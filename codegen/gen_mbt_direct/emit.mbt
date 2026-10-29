///|
/// Assemble runtime storage, parser dispatch, chunks and public entry wrappers.
fn Emitter::parser_items(
  self : Emitter,
  no_comments~ : Bool,
) -> Array[@mbt_ast.Item] {
  let items = [self.result_item()]
  if self.has_stack {
    items.push(state_stack_item(self.snapshots.saves))
  }
  if self.program.blocks.any(b => {
      b.all_instructions().any(i => i is (EnsureLookahead | LoadLookahead))
    }) {
    items.append(self.token_items())
  }
  if self.chunked {
    items.push(self.context_item())
    if !self.chunk_errors.is_empty() {
      items.push(self.stop_item())
    }
    if self.program.blocks
      .iter()
      .any(b => {
        b
        .all_instructions()
        .iter()
        .any(i => i is (EnsureLookahead | LoadLookahead))
      }) {
      items.push(self.input_item())
    }
  }
  items.push(self.parse_item(no_comments))
  if self.chunked {
    for chunk in 0..<self.chunk_count() {
      items.push(self.chunk_item(chunk, no_comments))
    }
  }
  for index, entry in self.program.entries {
    items.push(self.entry_item(index, entry))
  }
  if self.program.blocks.any(b => b.all_instructions().any(i => i is Push(_))) {
    items.push(state_push_item())
  }
  if self.has_stack {
    if self.snapshots.saves {
      items.push(state_checkpoint_item())
    }
    items.push(state_snapshot_item())
  }
  items
}
