///|
/// Names and parameter order belong to one action plan. User text is opaque;
/// conservatively reserving every textual occurrence also protects references
/// to globals, strings and comments without pretending to parse MoonBit here.
priv struct ActionPlan {
  parameters : Array[(ActionParameter, String)]
  subactions : Array[String]
}

///|
fn ActionPlan::new(
  action : @elab.Action,
  parameters : Array[ActionParameter],
) -> ActionPlan {
  let used = Set::from_iter(action.bindings.iter().map(binding => binding.1))
  let text = match action.body {
    User(pieces) =>
      pieces.filter_map(piece => {
        match piece {
          Text(text, ..) => Some(text)
          Reference(_) => None
        }
      })
    _ => []
  }
  fn fresh(base : String) -> String {
    for suffix = 0 {
      let name = if suffix == 0 { base } else { "\{base}_\{suffix}" }
      if !used.contains(name) && text.all(piece => !piece.contains(name)) {
        used.add(name)
        return name
      }
      continue suffix + 1
    }
  }
  {
    parameters: parameters.map(parameter => (parameter, fresh(parameter.name()))),
    subactions: action.sub_actions.mapi((index, _) => {
      fresh("_sub_action_\{index}_result")
    }),
  }
}

///|
fn ActionPlan::contains(self : ActionPlan, parameter : ActionParameter) -> Bool {
  self.parameters.any(pair => pair.0 == parameter)
}

///|
fn ActionPlan::parameter_name(
  self : ActionPlan,
  parameter : ActionParameter,
) -> String {
  for (candidate, name) in self.parameters {
    if candidate == parameter {
      return name
    }
  }
  abort("missing typed action parameter")
}
