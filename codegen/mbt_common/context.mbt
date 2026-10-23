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
  priv reductions : @hashmap2.T[@stamp.Stamp, @elab.Action]
  priv get_action_id : (@elab.Action) -> Int32
  priv pass_before_rhs : Bool
  priv override_span_start : Bool
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
  let reductions : @hashmap2.T[@stamp.Stamp, @elab.Action] = @hashmap2.new(
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
        let action = (meta.production_meta)(p.num).action
        reductions.set(action.stamp, action)
        add(action)
      }
    }
  }
  let has_positions = !(meta.position_data_type is Constr(pkg=None, "Unit", []))
  let mut pass_before_rhs = false
  let mut override_span_start = false
  if has_positions {
    for _, action in actions {
      if action.bindings.any(binding => {
          match binding.0 {
            Position(position) => position.uses_before_rhs()
            _ => false
          }
        }) ||
        (
          action.body is JsonCst(_) &&
          (action.span.0.uses_before_rhs() || action.span.1.uses_before_rhs())
        ) {
        pass_before_rhs = true
      }
    }
    for _, action in reductions {
      if action.arity > 0 && action.span.0 is BeforeRhs {
        override_span_start = true
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
    reductions,
    pass_before_rhs,
    override_span_start,
    get_action_id: action => ids.get(action.stamp),
  }
}

///|
pub fn Context::action_id(self : Context, action : @elab.Action) -> Int32 {
  (self.get_action_id)(action)
}

///|
fn Context::data_type(self : Context) -> @elab.TypeExpr {
  if self.tracks_positions() {
    Tuple([
      named_type("YYObj", []),
      self.meta.position_data_type,
      self.meta.position_data_type,
    ])
  } else {
    named_type("YYObj", [])
  }
}

///|
fn Context::tracks_positions(self : Context) -> Bool {
  !(self.meta.position_data_type is Constr(pkg=None, "Unit", []))
}

///|
fn Context::data_value(self : Context, data : @mbt_ast.Expr) -> @mbt_ast.Expr {
  if self.tracks_positions() {
    component(data, 0)
  } else {
    data
  }
}

///|
fn Context::data_position(
  self : Context,
  data : @mbt_ast.Expr,
  index : Int32,
) -> @mbt_ast.Expr {
  if self.tracks_positions() {
    component(data, index)
  } else {
    Unit
  }
}

///|
fn Context::located_data(
  self : Context,
  data : @mbt_ast.Expr,
  start : @mbt_ast.Expr,
  end : @mbt_ast.Expr,
) -> @mbt_ast.Expr {
  if self.tracks_positions() {
    Tuple([data, start, end])
  } else {
    data
  }
}

///|
fn Context::action_arguments(
  self : Context,
  before : @mbt_ast.Expr,
  args : @mbt_ast.Expr,
) -> Array[@mbt_ast.Expr] {
  if self.pass_before_rhs {
    [before, args]
  } else {
    [args]
  }
}

///|
pub fn Context::reduction_type(self : Context) -> @elab.TypeExpr {
  named_type(
    if self.override_span_start {
      "YYReduction"
    } else {
      "YYAction"
    },
    [],
  )
}

///|
pub fn Context::reduction_reference(
  self : Context,
  action : @elab.Action,
) -> @mbt_ast.Expr {
  let prefix = if self.override_span_start {
    "yy_reduction_"
  } else {
    "yy_action_"
  }
  Ident(prefix + Show::to_string(self.action_id(action)))
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
