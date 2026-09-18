///|
test "nonassoc resolves equal precedence by rejecting the lookahead" {
  let grammar = @grm.build(fn(ctx) {
    ctx.set_prec("EQ", NonAssoc, 1)
    ignore(ctx.add_production("Start", ["Expr"]))
    ignore(ctx.add_production("Expr", ["NUMBER"]))
    ignore(ctx.add_production("Expr", ["Expr", "EQ", "Expr"]))
    ctx.set_start("Start")
  })
  let automaton = @lr1.Automaton::build(grammar, user_eoi=false)
  let errors = @lr1.resolve_conflicts(automaton.conflicts)
  assert_eq(errors.length(), 0)
  let mut rejected = 0
  for location, _ in automaton.conflicts {
    assert_true(location.state.action.get(location.input) is None)
    assert_true(location.state.forbid_default_reduction)
    rejected += 1
  }
  assert_eq(rejected, 1)
}

///|
test "nonassoc leaves different precedence and left/right associativity intact" {
  let cases : Array[(@grm.Associativity, Int, String)] = [
    (NonAssoc, 0, "shift"),
    (NonAssoc, 2, "reduce"),
    (LeftAssoc, 1, "reduce"),
    (RightAssoc, 1, "shift"),
  ]
  for case in cases {
    let (assoc, production_prec, expected) = case
    let grammar = @grm.build(fn(ctx) {
      ctx.set_prec("EQ", assoc, 1)
      ignore(ctx.add_production("Start", ["Expr"]))
      ignore(ctx.add_production("Expr", ["NUMBER"]))
      ignore(ctx.add_production("Expr", ["Expr", "EQ", "Expr"]))
      ctx.set_start("Start")
    })
    // Override the production precedence, as a %prec annotation would.
    grammar.productions[2].prec = Some(production_prec)
    let automaton = @lr1.Automaton::build(grammar, user_eoi=false)
    assert_eq(@lr1.resolve_conflicts(automaton.conflicts).length(), 0)
    let mut resolved = 0
    for location, _ in automaton.conflicts {
      let actual = match location.state.action.get(location.input) {
        Some(Shift(_)) => "shift"
        Some(Reduce(production)) => {
          assert_eq(production.num, 2)
          "reduce"
        }
        _ => "unresolved"
      }
      assert_eq(actual, expected)
      assert_false(location.state.forbid_default_reduction)
      resolved += 1
    }
    assert_eq(resolved, 1)
  }
}

///|
test "nonassoc can remove every action from a state" {
  let grammar = @grm.build(fn(ctx) {
    ctx.set_prec("EQ", NonAssoc, 1)
    ignore(ctx.add_production("Start", ["Terminated"]))
    ignore(ctx.add_production("Terminated", ["Expr", "EQ", "EOF"]))
    ignore(ctx.add_production("Expr", ["NUMBER"]))
    ignore(ctx.add_production("Expr", ["Expr", "EQ", "Expr"]))
    ctx.set_start("Start")
  })
  let automaton = @lr1.Automaton::build(grammar, user_eoi=false)
  assert_eq(@lr1.resolve_conflicts(automaton.conflicts).length(), 0)
  assert_true(
    automaton.states
    .iter()
    .any(state => state.forbid_default_reduction && state.action.is_empty()),
  )
}
