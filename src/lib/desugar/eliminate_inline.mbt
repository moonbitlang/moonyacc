///|
fn find_leaf_inline_rules(rules : Map[String, @elab.Rule]) -> Set[String] {
  let all_inline_rules : Map[String, @elab.Rule] = {}
  for rule_name, rule in rules {
    if rule.inline {
      all_inline_rules[rule_name] = rule
    }
  }
  Set::from_iter(
    all_inline_rules
    .iter()
    .filter(fn {
      (_, rule) =>
        rule.clauses
        .iter()
        .all(fn(clause) {
          clause.items
          .iter()
          .all(fn(item) {
            match item.term {
              Token(_) => true
              RuleCall(rule_name, [], _type) =>
                not(all_inline_rules.contains(rule_name))
              Param(_) | RuleCall(_, _, _) => panic()
            }
          })
        })
    })
    .map(fn { (rule_name, _) => rule_name }),
  )
}

///|
fn eliminate_inline_rules(
  spec : @elab.ParserSpec,
  inline_rules : Set[String]
) -> @elab.ParserSpec {
  // assert not(inline_rules.is_empty())
  let new_rules : Map[String, @elab.Rule] = {}
  fn contains_inline_rule(items : Array[@elab.Item]) {
    items
    .iter()
    .any(fn(item) {
      match item.term {
        Token(_) => false
        RuleCall(rule_name, [], _type) => inline_rules.contains(rule_name)
        Param(_) | RuleCall(_, _, _) => panic()
      }
    })
  }

  fn expand(clause : @elab.Clause, yield_ : (@elab.Clause) -> Unit) {
    // assert(clause.action.sub_actions.length() == 0)
    let expand_points : Map[Int, (Ref[Int], Int)] = {}
    for index, item in clause.items {
      match item.term {
        Token(_) => ()
        RuleCall(rule_name, [], _type) =>
          if inline_rules.contains(rule_name) {
            let rule = spec.rules[rule_name].unwrap()
            expand_points[index] = ({ val: 0 }, rule.clauses.length() - 1)
          }
        Param(_) | RuleCall(_, _, _) => panic()
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
        match item.term {
          Token(_) => new_items.push(item)
          RuleCall(rule_name, [], _type) =>
            if inline_rules.contains(rule_name) {
              let rule = spec.rules[rule_name].unwrap()
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
              // Fix the bindings
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
                  StartPos(data_index) =>
                    if data_index > index {
                      bindings[binding_index] = (
                        StartPos(data_index + end_index - start_index - 1),
                        code,
                      )
                    }
                  EndPos(data_index) =>
                    if data_index > index {
                      bindings[binding_index] = (
                        EndPos(data_index + end_index - start_index - 1),
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
          Param(_) | RuleCall(_, _, _) => panic()
        }
      }
      yield_({
        ..clause,
        items: new_items,
        action: { ..clause.action, stamp: @stamp.new(), bindings, sub_actions },
      })
      if expand_cursor < 0 {
        break
      }
    }
  }

  for rule_name, rule in spec.rules {
    guard not(inline_rules.contains(rule_name)) else { continue }
    let new_clauses : Array[@elab.Clause] = []
    let dedup = Set::new()
    fn add_clause(clause : @elab.Clause) {
      let key = clause_key(clause)
      // NOTE: we need to check duplicates in elaborate phase
      // So here we won't encounter clauses with the same key but different actions
      if dedup.add_and_check(key) {
        new_clauses.push(clause)
      }
    }

    for clause in rule.clauses {
      if contains_inline_rule(clause.items) {
        expand(clause, add_clause)
      } else {
        add_clause(clause)
      }
    }
    let new_rule = { ..rule, clauses: new_clauses }
    new_rules[rule_name] = new_rule
  }
  { ..spec, rules: new_rules }
}

///|
priv enum Symbol {
  Terminal(String)
  Nonterminal(String)
} derive(Hash, Eq)

///|
priv type ClauseKey (Int?, @immut/list.T[Symbol]) derive(Hash, Eq)

///|
fn clause_key(clause : @elab.Clause) -> ClauseKey {
  ClauseKey(
    (
      clause.prec,
      @immut/list.from_iter(
        clause.items
        .iter()
        .map(fn(item) {
          match item.term {
            Token(token) => Terminal(token.name)
            RuleCall(rule_name, [], _type) => Nonterminal(rule_name)
            Param(_) | RuleCall(_, _, _) => panic()
          }
        }),
      ),
    ),
  )
}

///|
pub fn eliminate_inline(spec : @elab.ParserSpec) -> @elab.ParserSpec {
  let mut spec = spec
  while true {
    let inline_rules = find_leaf_inline_rules(spec.rules)
    if inline_rules.is_empty() {
      break
    } else {
      spec = eliminate_inline_rules(spec, inline_rules)
    }
  }
  spec
}
