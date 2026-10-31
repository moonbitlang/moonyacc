///|
fn scope_name(id : Int32) -> String {
  "_yy_scope_\{id}"
}

///|
fn loop_name(id : Int32) -> String {
  "_yy_loop_\{id}"
}

///|
fn Emitter::control_transfer(
  self : Emitter,
  target : Int32,
  transfer : @control_flow.Transfer,
) -> Array[@mbt_ast.Stmt] {
  match transfer {
    Break(scope) => [BreakTo(scope_name(scope), None)]
    Continue(loop_) => [ContinueTo(loop_name(loop_), [Unit])]
    Enter(scope) =>
      [
        Assign(Ident("_yy_control"), Int(target)),
        BreakTo(scope_name(scope), None),
      ]
    Dispatch(loop_) =>
      [
        Assign(Ident("_yy_control"), Int(target)),
        ContinueTo(loop_name(loop_), [Unit]),
      ]
    Exit =>
      [
        ..self.flush_parameters(target),
        ..self.flush_resources(target),
        Return(Int(self.control.address(target))),
      ]
  }
}

///|
fn Emitter::structured(
  self : Emitter,
  control : @control_flow.Control,
  no_comments : Bool,
) -> @mbt_ast.Block {
  match control {
    Run(label, routes) => self.block_body(label, routes, no_comments)
    Sequence(nodes) => {
      let statements = []
      for node in nodes {
        let code = self.structured(node, no_comments)
        statements.append(code.statements)
        if code.result is Some(value) {
          statements.push(Eval(value))
        }
      }
      body(statements)
    }
    Scope(id, inner) =>
      body([
        LabelledLoop(
          scope_name(id),
          While(Bool(true), self.structured(inner, no_comments)),
        ),
      ])
    Loop(id, inner) | Dispatch(id, _, inner) =>
      body([
        LabelledLoop(
          loop_name(id),
          // A conditionless functional loop has no implicit fallthrough.
          // Its Unit carrier is erased by MoonBit; no PC is passed here.
          For(
            [("_yy_cycle", Unit)],
            None,
            [],
            self.structured(inner, no_comments),
          ),
        ),
      ])
    Switch(cases) => {
      let arms = cases.map(p => {
        (@mbt_ast.Pattern::Int(p.0), self.structured(p.1, no_comments))
      })
      arms.push((Any, value_block(call("panic", []))))
      value_block(Match(Ident("_yy_control"), arms))
    }
    Select(arms) => {
      if arms is [(target, transfer)] {
        return body(self.control_transfer(target, transfer))
      }
      let cases = arms.map(p => {
        (
          @mbt_ast.Pattern::Int(self.control.address(p.0)),
          body(self.control_transfer(p.0, p.1)),
        )
      })
      cases.push((Any, value_block(call("panic", []))))
      value_block(Match(Ident("_entry"), cases))
    }
  }
}
