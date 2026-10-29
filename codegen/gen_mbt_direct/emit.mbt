///|
/// Assemble runtime storage, structured regions and public entry wrappers.
fn Emitter::parser_items(
  self : Emitter,
  no_comments~ : Bool,
) -> Array[@mbt_ast.Item] {
  let items = [self.result_item()]
  if self.has_stack {
    items.push(
      state_stack_item(self.snapshots.saves, diagnostics=self.diagnostics),
    )
  }
  if self.program.blocks.any(b => {
      b.all_instructions().any(i => i is (EnsureLookahead | LoadLookahead))
    }) {
    items.append(self.token_items())
  }
  if self.shared_context {
    items.push(self.context_item())
    if !self.region_errors.is_empty() {
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
  if self.shared_context {
    for region in 0..<self.control.regions.length() {
      items.push(self.region_item(region, no_comments))
    }
  }
  for index, entry in self.program.entries {
    items.push(self.entry_item(index, entry))
  }
  if self.diagnostics && self.checkpoints.requires_journal(self.program) {
    items.push(state_push_item(journal=true))
  }
  let has_plain_push = if self.diagnostics {
    self.checkpoints.has_unprotected_push(self.program)
  } else {
    self.program.blocks.any(b => b.all_instructions().any(i => i is Push(_)))
  }
  if has_plain_push {
    items.push(state_push_item(journal=false))
  }
  if self.has_stack {
    if self.snapshots.saves {
      items.push(state_checkpoint_item())
    }
    if self.diagnostics {
      items.push(state_snapshot_item())
    }
  }
  items
}
