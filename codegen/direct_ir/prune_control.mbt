// Token-domain propagation follows Menhir's StackLangTokenAnalysis. Stack-state
// domains use the same checked transfer functions as the physical stack proof.

///|
fn append_body(instructions : Array[Instruction], rest : Body) -> Body {
  {
    instructions: [..instructions, ..rest.instructions],
    terminator: rest.terminator,
  }
}

///|
fn StackFlowPass::prune(
  self : StackFlowPass,
  body : Body,
  machine : StackMachineFact,
  lookahead : Lookahead,
) -> Body raise InvalidProgram {
  let machine = machine.copy()
  let instructions = []
  let mut lookahead = lookahead
  for instruction in body.instructions {
    let redundant = match instruction {
      EnsureLookahead => lookahead is (Present | On(_))
      RefineLookahead(token) => lookahead == On(token)
      _ => false
    }
    let emitted = if instruction is EnsureLookahead && lookahead is Empty {
      Instruction::LoadLookahead
    } else {
      instruction
    }
    match instruction {
      EnsureLookahead | LoadLookahead =>
        if !(lookahead is On(_)) {
          lookahead = Present
        }
      ConsumeLookahead => lookahead = Empty
      RefineLookahead(token) => lookahead = On(token)
      _ => ()
    }
    self.instruction(instruction, machine)
    if !redundant {
      instructions.push(emitted)
    }
  }
  // Removing a case must not erase the identity proof required by its body
  // or successor contract. This also handles a lexer with only end-of-input.
  if !machine.empty_token && machine.tokens.length() == 1 {
    let token = machine.tokens.iter().next().unwrap()
    if lookahead != On(token) {
      instructions.push(RefineLookahead(token))
      lookahead = On(token)
    }
  }
  let finish = match body.terminator {
    CaseToken(arms, fallback) => {
      let remaining = machine.tokens.copy()
      let live = []
      for (pattern, branch) in arms {
        let tokens = pattern.tokens()
        let selected = tokens.filter(token => machine.tokens.contains(token))
        for token in tokens {
          remaining.remove(token)
        }
        if !selected.is_empty() {
          live.push(
            (
              match pattern {
                Tokens(_) => Tokens(selected)
                BindToken(_) => pattern
              },
              self.prune(
                branch,
                { ..machine, empty_token: false, tokens: Set(selected), },
                if selected is [token] {
                  On(token)
                } else {
                  Present
                },
              ),
            ),
          )
        }
      }
      if remaining.is_empty() && live is [(Tokens(_), branch)] {
        return append_body(instructions, branch)
      }
      // Unmatched tokens retain their cold failure path. A match covering
      // the entire token type has no default constructor case.
      let fallback = if self.program.exhaustive_tokens(live.map(p => p.0)) {
        { instructions: [], terminator: Unreachable, }
      } else if remaining.is_empty() {
        if self.program.cold_failure(fallback) {
          fallback
        } else {
          { instructions: [], terminator: Unreachable, }
        }
      } else {
        self.prune(fallback, { ..machine, tokens: remaining, }, lookahead)
      }
      CaseToken(live, fallback)
    }
    CaseState(value, arms) => {
      let fact = machine.value(value)
      let live = []
      for (state, branch) in arms {
        if !fact.states.contains(state) {
          continue
        }
        let machine = machine.copy()
        if value is Reg(reg) {
          machine.registers[reg.id] = { ..fact, states: Set([state]), }
        }
        if fact.depth == Some(0) {
          machine.current = Set([state])
          self.refine(machine)
        }
        live.push((state, self.prune(branch, machine, lookahead)))
      }
      if live is [(_, branch), ..] && live.all(p => p.1 == branch) {
        return append_body(instructions, branch)
      }
      CaseState(value, live)
    }
    term => term
  }
  { instructions, terminator: finish, }
}

///|
fn Program::cold_failure(self : Program, body : Body) -> Bool {
  if !body.instructions.is_empty() {
    return false
  }
  match body.terminator {
    Stop => true
    Jump(edge) => {
      let target = self.blocks[edge.target]
      target.parameters.is_empty() &&
      target.instructions.is_empty() &&
      target.terminator is Stop
    }
    _ => false
  }
}

///|
/// Remove branches excluded by the whole-CFG fixed point. A binding pattern
/// remains even for a singleton domain while it defines branch-scoped values.
/// Register pruning can turn a dead binding into a nonbinding pattern first.
pub fn Program::prune_control(
  self : Program,
  knowledge : StackKnowledge,
) -> Program raise InvalidProgram {
  let flow = self.stack_flow(knowledge)
  let pass = StackFlowPass::new(self, knowledge)
  let blocks = self.blocks.mapi((label, block) => {
    let block = match flow.entries[label] {
      Some(entry) =>
        { ..block, lookahead: entry.cache_contract(block.lookahead), }
      None => block
    }
    let body = match flow.entries[label] {
      None =>
        if block.instructions.is_empty() && block.terminator is Stop {
          { instructions: [], terminator: block.terminator, }
        } else {
          { instructions: [], terminator: Unreachable, }
        }
      Some(entry) =>
        pass.prune(
          { instructions: block.instructions, terminator: block.terminator, },
          entry.machine(block),
          block.lookahead,
        )
    }
    { ..block, instructions: body.instructions, terminator: body.terminator, }
  })
  let result = Program::{ ..self, blocks, }.compact()
  result.validate()
  result
}
