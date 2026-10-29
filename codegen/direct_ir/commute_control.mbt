///|
fn PushCommuter::inline_target(
  self : PushCommuter,
  edge : Edge,
  env : PushEnv,
  path : Set[Int32],
) -> Block? {
  if path.contains(edge.target) {
    return None
  }
  let target = self.program.blocks[edge.target]
  match target.hint {
    NoHint => return None
    IfCells(count) if count > 0 && env.pushes.is_empty() => return None
    _ => ()
  }
  let copy = self.supply.clone_block(target)
  if target.hint is IfKnownState {
    let trial = env.copy()
    trial.bind(copy.parameters.mapi((i, p) => (p, edge.arguments[i])))
    guard copy.instructions.is_empty() &&
      copy.terminator is CaseState(selector, _) &&
      trial.value(selector) is State(_) else {
      return None
    }
  }
  Some(copy)
}

///|
fn PushCommuter::finish(
  self : PushCommuter,
  term : Terminator,
  env : PushEnv,
  path : Set[Int32],
) -> Commuted {
  let before = { instructions: [], terminator: term, }
  match term {
    Jump(edge) => {
      if self.inline_target(edge, env, path) is Some(target) {
        let path = path.copy()
        path.add(edge.target)
        let bindings = Bind(
          target.parameters.mapi((i, reg) => (reg, edge.arguments[i])),
        )
        return self.body(
          {
            instructions: [bindings, ..target.instructions],
            terminator: target.terminator,
          },
          env,
          path,
        )
      }
      {
        before,
        after: {
          instructions: [],
          terminator: term.map_values(v => env.value(v)),
        },
        absorbed: 0,
      }
    }
    CaseState(value, arms) => {
      if env.value(value) is State(state) {
        for (key, body) in arms {
          if key == state {
            let result = self.body(body, env, path)
            let before_arms = arms.map(p => {
              (p.0, if p.0 == state { result.before } else { p.1 })
            })
            return {
              ..result,
              before: {
                instructions: [],
                terminator: CaseState(value, before_arms),
              },
            }
          }
        }
      }
      // Unknown state cases remain shared and small, as in StackLang.
      {
        before,
        after: {
          instructions: [],
          terminator: term.map_values(v => env.value(v)),
        },
        absorbed: 0,
      }
    }
    CaseToken(arms, fallback) => self.token_cases(arms, fallback, env, path)
    Return(_) | Stop | Unreachable =>
      {
        before,
        after: {
          instructions: [],
          terminator: term.map_values(v => env.value(v)),
        },
        absorbed: 0,
      }
  }
}

///|
fn PushCommuter::token_cases(
  self : PushCommuter,
  arms : Array[(TokenPattern, Body)],
  fallback : Body,
  env : PushEnv,
  path : Set[Int32],
) -> Commuted {
  let branches = arms.map(p => self.body(p.1, env.copy(), path.copy()))
  let default_ = self.body(fallback, env.copy(), path.copy())
  let mut absorbed = default_.absorbed
  for branch in branches {
    absorbed = Int32::max(absorbed, branch.absorbed)
  }
  let n = env.pushes.length()
  fn pad(branch : Commuted) -> Body {
    materialize(env.pushes[n - absorbed:n - branch.absorbed], branch.after)
  }
  {
    before: {
      instructions: [],
      terminator: CaseToken(
        arms.mapi((i, p) => (p.0, branches[i].before)),
        default_.before,
      ),
    },
    after: {
      instructions: [],
      terminator: CaseToken(
        arms.mapi((i, p) => (p.0, pad(branches[i]))),
        pad(default_),
      ),
    },
    absorbed,
  }
}

///|
/// Move PUSH trains through extended basic blocks, canceling matching POPs and
/// padding token branches only where materialization is still required.
pub fn Program::commute_pushes(
  self : Program,
  knowledge : StackKnowledge,
) -> Program raise InvalidProgram {
  let pass = PushCommuter::{ program: self, supply: RegisterSupply::new(self), }
  let incoming = self.stack_flow(knowledge).entries
  let blocks = self.blocks.mapi((label, block) => {
    let state = match incoming[label] {
      Some(entry) if entry.current.length() == 1 => entry.current.iter().next()
      _ => None
    }
    let env = PushEnv::{
      pushes: [],
      aliases: Map([]),
      prefix_state: state.map(s => Value::State(s)),
    }
    let result = pass.body(
      { instructions: block.instructions, terminator: block.terminator, },
      env,
      Set([label]),
    )
    require(
      result.absorbed == 0,
      "unbalanced push commutation at block \{label}",
    )
    let before = {
      ..block,
      instructions: result.before.instructions,
      terminator: result.before.terminator,
    }
    let after = {
      ..block,
      instructions: result.after.instructions,
      terminator: result.after.terminator,
    }
    require(
      check_stack_rewrite(before, after, incoming_state?=state),
      "invalid push commutation at block \{label}",
    )
    after
  })
  let program = Program::{ ..self, blocks, }.compact()
  program.validate()
  program
}
