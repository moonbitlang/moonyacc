///|
fn check_automaton_words(
  grammar : @grm.Grammar,
  knowledge : StackKnowledge,
) -> Unit raise {
  for words in [knowledge.short, knowledge.long] {
    for source, edges in knowledge.transitions {
      for (symbol, target) in edges {
        let expected = [..words[source].map(c => c.symbol), symbol]
        let actual = words[target]
        assert_true(actual.length() <= expected.length())
        assert_eq(
          actual.map(c => c.symbol),
          expected[expected.length() - actual.length():].to_owned(),
        )
        assert_true(actual.last().unwrap().predecessors.contains(source))
        for i in 0..<(actual.length() - 1) {
          let previous = words[source][words[source].length() -
            actual.length() +
            1 +
            i]
          for state in previous.predecessors {
            assert_true(actual[i].predecessors.contains(state))
          }
        }
      }
    }
    for production in grammar.productions {
      let rhs = production.rhs.map(s => symbol_id(s, grammar.terminals.length()))
      for state in knowledge.production_sites[production.num] {
        assert_true(words[state].length() >= rhs.length())
        assert_eq(
          words[state][words[state].length() - rhs.length():].map(c => c.symbol),
          rhs,
        )
      }
    }
  }
}

///|
test "automaton stack invariants cover nullable recursion and multiple entries" {
  let grammar = @grm.build(g => {
    g.set_start("first_start")
    g.set_start("second_start")
    ignore(g.add_production("first_start", ["first"]))
    ignore(g.add_production("second_start", ["second"]))
    ignore(g.add_production("first", ["items", "EOF"]))
    ignore(g.add_production("second", ["items", "SEMI"]))
    ignore(g.add_production("items", []))
    ignore(g.add_production("items", ["items", "item"]))
    ignore(g.add_production("item", ["NUMBER"]))
    ignore(g.add_production("item", ["LPAREN", "items", "RPAREN"]))
  })
  let automaton = @lr1.Automaton::build(grammar, user_eoi=false)
  assert_eq(@lr1.resolve_conflicts(automaton.conflicts).length(), 0)
  let knowledge = analyze_stack(grammar, automaton)
  check_automaton_words(grammar, knowledge)
  assert_true(knowledge.entry_origins.any(origins => origins.length() > 1))
  assert_true(
    knowledge.long.any(word => word.any(cell => cell.predecessors.length() > 1)),
  )
}

///|
test "long stack knowledge extends item prefixes and is independent of state numbering" {
  let grammar = @grm.build(g => {
    g.set_start("augmented")
    ignore(g.add_production("augmented", ["start"]))
    ignore(g.add_production("start", ["A", "middle", "EOF"]))
    ignore(g.add_production("middle", ["B", "last"]))
    ignore(g.add_production("last", ["C"]))
  })
  let automaton = @lr1.Automaton::build(grammar, user_eoi=false)
  let before = analyze_stack(grammar, automaton)
  check_automaton_words(grammar, before)
  assert_true(
    before.long
    .mapi((i, word) => word.length() > before.short[i].length())
    .any(x => x),
  )
  let n = automaton.states.length()
  for state in automaton.states {
    state.num = n - state.num - 1
  }
  let after = analyze_stack(grammar, automaton)
  check_automaton_words(grammar, after)
  for state, word in before.long {
    let actual = after.long[n - state - 1]
    assert_eq(actual.map(c => c.symbol), word.map(c => c.symbol))
    for i, cell in word {
      assert_eq(
        actual[i].predecessors,
        Set(cell.predecessors.to_array().map(s => n - s - 1)),
      )
    }
  }
}
