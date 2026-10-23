///|
fn find_leaf_inline_rules(rules : Map[String, @elab.Rule]) -> Set[String] {
  let all_inline_rules : Map[String, @elab.Rule] = Map([])
  for rule_name, rule in rules {
    if rule.inline {
      all_inline_rules[rule_name] = rule
    }
  }
  Set::from_iter(
    all_inline_rules
    .iter()
    .filter(it => {
      let (_, rule) = it
      rule.clauses
      .iter()
      .all(fn(clause) {
        clause.items
        .iter()
        .all(fn(item) {
          match item.term {
            Token(_) => true
            RuleCall(rule_name, [], _type) =>
              !all_inline_rules.contains(rule_name)
            Param(_) | RuleCall(_, _, _) => panic()
          }
        })
      })
    })
    .map(it => it.0),
  )
}

///|
fn eliminate_inline_rules(
  spec : @elab.ParserSpec,
  inline_rules : Set[String],
) -> @elab.ParserSpec {
  // assert not(inline_rules.is_empty())
  let new_rules : Map[String, @elab.Rule] = Map([])
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
    fn cont(
      cont_items : @immut/vector.Vector[@elab.Item],
      cont_bindings : @immut/vector.Vector[(@elab.BindingSubject, @elab.Code)],
      cont_subactions : @immut/vector.Vector[@elab.SubAction],
      cont_span : (@elab.PositionExpr, @elab.PositionExpr),
      index : Int32,
    ) {
      if index >= clause.items.length() {
        yield_({
          ..clause,
          items: cont_items.to_array(),
          action: {
            ..clause.action,
            stamp: @stamp.new(),
            arity: cont_items.length(),
            span: cont_span,
            bindings: cont_bindings.to_array(),
            sub_actions: cont_subactions.to_array(),
          },
        })
      } else {
        let item = clause.items[index]
        if item.term is RuleCall(rule_name, [], _) &&
          inline_rules.contains(rule_name) {
          let inline_rule = spec.rules.get(rule_name).unwrap()
          for inline_clause in inline_rule.clauses {
            let next_cont_items = cont_items +
              @immut/vector.from_array(inline_clause.items)
            let start_index = cont_items.length()
            let end_index = start_index + inline_clause.items.length()
            let subaction_index = cont_subactions.length()
            let index_shift = inline_clause.items.length() - 1
            // Earlier passes may already have expanded a later sibling.
            // Its slice must follow the new physical stack layout as well.
            fn shift_boundary(index : Int32) -> Int32 {
              if index > start_index {
                index + index_shift
              } else {
                index
              }
            }
            let next_cont_subactions = cont_subactions
              .map(sub => {
                ..sub,
                start: shift_boundary(sub.start),
                end: shift_boundary(sub.end),
              })
              .push({
                start: start_index,
                end: end_index,
                action: inline_clause.action,
              })
            fn substitute(position : @elab.PositionExpr) -> @elab.PositionExpr {
              position.substitute(
                index=start_index,
                arity=inline_clause.items.length(),
                span=inline_clause.action.span,
              )
            }
            let next_cont_bindings = cont_bindings.map(binding => {
              let (subject, name) = binding
              let subject : @elab.BindingSubject = match subject {
                Data(index, type_~) if index == start_index =>
                  SubAction(index=subaction_index, type_~)
                Data(index, type_~) if index > start_index =>
                  Data(index + index_shift, type_~)
                Position(position) => Position(substitute(position))
                _ => subject
              }
              (subject, name)
            })
            cont(
              next_cont_items,
              next_cont_bindings,
              next_cont_subactions,
              (substitute(cont_span.0), substitute(cont_span.1)),
              index + 1,
            )
          }
        } else {
          cont(
            cont_items.push(item),
            cont_bindings,
            cont_subactions,
            cont_span,
            index + 1,
          )
        }
      }
    }

    cont(
      @immut/vector.new(),
      @immut/vector.from_array(clause.action.bindings),
      @immut/vector.from_array(clause.action.sub_actions),
      clause.action.span,
      0,
    )
  }

  for rule_name, rule in spec.rules {
    guard !inline_rules.contains(rule_name) else { continue }
    let new_clauses : Array[@elab.Clause] = []
    for clause in rule.clauses {
      if contains_inline_rule(clause.items) {
        expand(clause, fn(clause) { new_clauses.push(clause) })
      } else {
        new_clauses.push(clause)
      }
    }
    let new_rule = { ..rule, clauses: new_clauses, }
    new_rules[rule_name] = new_rule
  }
  { ..spec, rules: new_rules, }
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
