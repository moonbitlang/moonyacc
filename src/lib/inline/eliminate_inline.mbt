///|
pub fn eliminate_inline(spec : @elab.ParserSpec) -> @elab.ParserSpec {
  let rules : Array[@elab.Rule] = []
  let inline_rules : Map[String, @elab.Rule] = {}
  for rule in spec.rules {
    if rule.inline {
      inline_rules[rule.name] = rule
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

  fn expand(clause : @elab.Clause, cb : (@elab.Clause) -> Unit) {
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
      for index, item in clause.items {
        match item.desc {
          Token(_) => new_items.push(item)
          RuleCall(rule) =>
            if inline_rules.contains(rule.name) {
              let (curr, max) = expand_points[index].unwrap()
              let inline_items = rule.clauses[curr.val].items
              for inline_item in inline_items {
                new_items.push(inline_item)
              }
              if expand_point_index == index {
                if curr.val >= max {
                  expand_cursor -= 1
                  curr.val = 1
                } else {
                  curr.val += 1
                }
              }
              expand_points[index] = ({ val: 1 }, rule.clauses.length())
            } else {
              new_items.push(item)
            }
        }
      }
      cb({
        ..clause,
        items: new_items,
        action: CompoundAction(sub_actions, clause.action),
      })
      if expand_cursor < 0 {
        break
      }
    }
  }

  // TODO: handle nested inline rules

  for rule in spec.rules {
    guard rule.inline else { continue }
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
