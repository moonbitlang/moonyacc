///|
pub fn eliminate_rule_args(spec : @elab.ParserSpec) -> @elab.ParserSpec {
  let specialized_rules : Map[String, @elab.Rule] = {}
  fn process_rule(rule : @elab.Rule, args : Array[@elab.Term]) -> @elab.Rule {
    let name = derive_term_ident(RuleCall(rule, args))
    let defer = []
    let specialized_rule = specialized_rules.get_or_init(name, fn() {
      specialize_rule(name, rule, args, defer)
    })
    for f in defer {
      f()
    }
    specialized_rule
  }

  fn specialize_rule(
    name : String,
    rule : @elab.Rule,
    args : Array[@elab.Term],
    defer : Array[() -> Unit]
  ) -> @elab.Rule {
    let param_map : Map[String, @elab.Term] = {}
    fn process_term(term : @elab.Term) -> @elab.Term {
      match term {
        Token(_) => term
        Param(name, _) => param_map.get(name).unwrap()
        RuleCall(rule, args) => RuleCall(process_rule(rule, args), [])
      }
    }

    for index, param in rule.params {
      param_map[param.0] = process_term(args[index])
    }
    let generic_param_map : Map[String, @elab.TypeExpr] = {}
    fn unify(t1 : @elab.TypeExpr, t2 : @elab.TypeExpr) -> Unit {
      match (t1, t2) {
        (Constr(pkg=None, name, []), t2) if rule.generic_params.contains(name) =>
          generic_param_map[name] = t2
        (Constr(pkg=pkg1, name1, args1), Constr(pkg=pkg2, name2, args2)) => {
          guard pkg1 == pkg2 &&
            name1 == name2 &&
            args1.length() == args2.length() else {
            panic()
          }
          for index, arg1 in args1 {
            unify(arg1, args2[index])
          }
        }
        (Option(t1), Option(t2)) => unify(t1, t2)
        (Tuple(types1), Tuple(types2)) => {
          guard types1.length() == types2.length() else { panic() }
          for index, type1 in types1 {
            unify(type1, types2[index])
          }
        }
        (Arrow(params1, ret1), Arrow(params2, ret2)) => {
          guard params1.length() == params2.length() else { panic() }
          for index, param1 in params1 {
            unify(param1, params2[index])
          }
          unify(ret1, ret2)
        }
        _ => panic()
      }
    }

    for param in rule.params {
      let arg = param_map[param.0].unwrap()
      unify(
        param.1,
        match arg {
          Token(token) => token.type_
          Param(_, type_) => type_
          RuleCall(rule, _) => rule.type_
        },
      )
    }
    fn process_type(type_ : @elab.TypeExpr) -> @elab.TypeExpr {
      match type_ {
        Constr(pkg=None, name, []) if generic_param_map.contains(name) =>
          generic_param_map[name].unwrap()
        Constr(pkg~, name, args) => Constr(pkg~, name, args.map(process_type))
        Option(type_) => Option(process_type(type_))
        Tuple(types) => Tuple(types.map(process_type))
        Arrow(params, ret) => Arrow(params.map(process_type), process_type(ret))
      }
    }

    let type_ = process_type(rule.type_)
    let clauses = rule.clauses.copy()
    defer.push(fn() {
      for index, clause in clauses {
        let items = clause.items.map(fn(item) {
          match item.term {
            Token(_) => item
            Param(name, _) => {
              let term = param_map.get(name).unwrap()
              { ..item, term, }
            }
            RuleCall(rule, args) => {
              let args = args.map(process_term)
              let rule = process_rule(rule, args)
              { ..item, term: RuleCall(rule, []) }
            }
          }
        })
        let new_clause = {
          ..clause,
          items,
          action: {
            ..clause.action,
            bindings: clause.action.bindings.map(fn(binding) {
              let (subject, code) = binding
              let new_subject : @elab.BindingSubject = match subject {
                Data(index, ..) => {
                  let item = items[index]
                  Data(index, type_=item.type_())
                }
                _ => subject
              }
              (new_subject, code)
            }),
            type_,
          },
        }
        clauses[index] = new_clause
      }
    })
    { ..rule, name, generic_params: [], params: [], type_, clauses }
  }

  for rule in spec.rules {
    guard rule.params.is_empty() else { continue }
    ignore(process_rule(rule, []))
  }
  let new_rules = specialized_rules.values().to_array()
  { ..spec, rules: new_rules }
}

///|
fn derive_term_ident(term : @elab.Term) -> String {
  match term {
    Token(token) => token.name
    Param(_) =>
      // FIXME
      panic()
    RuleCall(rule, []) => rule.name
    RuleCall(rule, args) =>
      rule.name + "__" + args.iter().map(derive_term_ident).join("_")
  }
}
