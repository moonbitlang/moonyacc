///|
pub fn eliminate_inline(spec : @elab.ParserSpec) -> @elab.ParserSpec {
  let rules : Array[@elab.Rule] = []
  let inline_rules : Map[String, @elab.Rule] = {}
  let mut max_action_num = -1
  for rule in spec.rules {
    if rule.inline {
      inline_rules[rule.name] = rule
    }
    for clause in rule.clauses {
      max_action_num = @math.maximum(max_action_num, clause.action.num)
    }
  }
  fn contains_inline_rule(items : Array[@elab.Item]) {
    items
    .iter()
    .any(fn(item) {
      match item.desc {
        Token(_) => false
        RuleCall(rule) => inline_rules.contains(rule.name)
      }
    })
  }

  let mut next_action_num = max_action_num + 1
  fn expand(clause : @elab.Clause, yield_ : (@elab.Clause) -> Unit) {
    // assert(clause.action.sub_actions.length() == 0)
    let expand_points : Map[Int, (Ref[Int], Int)] = {}
    for index, item in clause.items {
      match item.desc {
        Token(_) => ()
        RuleCall(rule) =>
          if inline_rules.contains(rule.name) {
            expand_points[index] = ({ val: 0 }, rule.clauses.length() - 1)
          }
      }
    }
    let expand_point_indexes = expand_points.keys().to_array()
    let mut expand_cursor = expand_point_indexes.length() - 1
    while true {
      let expand_point_index = expand_point_indexes[expand_cursor]
      let new_items : Array[@elab.Item] = []
      let sub_actions : Array[@elab.SubAction] = []
      let bindings : Array[(@elab.BindingSubject, @elab.Code)] = clause.action.bindings.copy()
      for index, item in clause.items {
        match item.desc {
          Token(_) => new_items.push(item)
          RuleCall(rule) =>
            if inline_rules.contains(rule.name) {
              let (curr, max) = expand_points[index].unwrap()
              let inline_items = rule.clauses[curr.val].items
              let start_index = new_items.length()
              for inline_item in inline_items {
                new_items.push(inline_item)
              }
              let end_index = new_items.length()
              sub_actions.push({
                start: start_index,
                end: end_index,
                action: rule.clauses[curr.val].action,
              })
              for binding_index, binding in bindings {
                let (subject, code) = binding
                match subject {
                  Data(data_index, type_~) =>
                    if data_index == index {
                      bindings[binding_index] = (
                        SubAction(start=start_index, type_~),
                        code,
                      )
                    } else if data_index > index {
                      bindings[binding_index] = (
                        Data(data_index + end_index - start_index - 1, type_~),
                        code,
                      )
                    }
                  _ => ()
                }
              }
              if expand_point_index == index {
                if curr.val >= max {
                  curr.val = 0
                  fn back() {
                    expand_cursor -= 1
                    if expand_cursor >= 0 {
                      let (curr, max) = expand_points[expand_point_indexes[expand_cursor]].unwrap()
                      if curr.val >= max {
                        back()
                      }
                    }
                  }

                  back()
                } else {
                  curr.val += 1
                }
              }
            } else {
              new_items.push(item)
            }
        }
      }
      let action_num = next_action_num
      next_action_num += 1
      yield_({
        ..clause,
        items: new_items,
        action: { ..clause.action, num: action_num, bindings, sub_actions },
      })
      if expand_cursor < 0 {
        break
      }
    }
  }

  // TODO: handle nested inline rules

  for rule in spec.rules {
    if rule.inline {
      continue
    }
    let new_clauses : Array[@elab.Clause] = []
    for clause in rule.clauses {
      if contains_inline_rule(clause.items) {
        expand(clause, fn(new_clause) { new_clauses.push(new_clause) })
      } else {
        new_clauses.push(clause)
      }
    }
    let new_rule = { ..rule, clauses: new_clauses, inline: false }
    rules.push(new_rule)
  }
  { ..spec, rules, }
}
