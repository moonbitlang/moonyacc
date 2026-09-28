///|
pub(all) enum Engine {
  Code
  Table
}

///|
pub struct Context {
  priv grammar : @grm.Grammar
  priv meta : @codegen.MetaProvider
  priv filename : String
  priv mode : @codegen.Mode
  priv input_mode : @codegen.InputMode
  priv actions : @hashmap2.T[@stamp.Stamp, @elab.Action]
  priv get_action_id : (@elab.Action) -> Int
  priv mut needs_symbol_start : Bool
}

///|
pub fn Context::new(
  grammar : @grm.Grammar,
  automaton : @lr1.Automaton,
  meta : @codegen.MetaProvider,
  filename~ : String,
  mode~ : @codegen.Mode,
  input_mode~ : @codegen.InputMode,
) -> Context {
  let actions : @hashmap2.T[@stamp.Stamp, @elab.Action] = @hashmap2.new(
    capacity=16,
  )
  fn add(action : @elab.Action) {
    if actions.contains(action.stamp) {
      return
    }
    for sub in action.sub_actions {
      add(sub.action)
    }
    actions.set(action.stamp, action)
  }
  for state in automaton.states {
    for _, decision in state.action {
      if decision is Reduce(p) && !grammar.starts.contains(p) {
        add((meta.production_meta)(p.num).action)
      }
    }
  }
  let mut next = 0
  let ids = @default_hashmap.new(fn(_key) {
    let id = next
    next += 1
    id
  })
  {
    grammar,
    meta,
    filename,
    mode,
    input_mode,
    actions,
    get_action_id: action => ids.get(action.stamp),
    needs_symbol_start: false,
  }
}

///|
pub fn Context::action_id(self : Context, action : @elab.Action) -> Int {
  (self.get_action_id)(action)
}

///|
fn Context::data_type(self : Context) -> @elab.TypeExpr {
  Tuple([
    named_type("YYObj", []),
    self.meta.position_data_type,
    self.meta.position_data_type,
  ])
}

///|
fn Engine::lookup(
  self : Engine,
  state : @mbt_ast.Expr,
  symbol : @mbt_ast.Expr,
) -> @mbt_ast.Expr {
  match self {
    Code => apply(state, [symbol])
    Table => call("yy_state", [state, symbol])
  }
}

///|
fn Engine::eoi(self : Engine) -> @mbt_ast.Expr {
  match self {
    Code => Ident("EOI")
    Table => Int(0)
  }
}

///|
fn Engine::terminal(self : Engine, term : @grm.Terminal) -> @mbt_ast.Expr {
  match self {
    Code => Ident("T_" + term.name)
    Table => Int(term.num + 1)
  }
}
