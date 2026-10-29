///|
/// A control-only lowering of the checked CFG. Run references the original
/// block: instructions, token binders and parallel edge arguments have exactly
/// one owner. Administrative scopes perform no parser effects.
pub(all) enum Control {
  Run(Int32, Map[Int32, Transfer])
  Sequence(Array[Control])
  Scope(Int32, Control)
  Loop(Int32, Control)
  Dispatch(Int32, Array[Int32], Control)
  Switch(Array[(Int32, Control)])
  Select(Array[(Int32, Transfer)])
}

///|
/// Break/Continue are lexically scoped. Enter first selects an entry of a
/// multiple-entry component; Dispatch selects its next iteration. Exit returns
/// to the outer driver, never calls another region.
pub(all) enum Transfer {
  Break(Int32)
  Enter(Int32)
  Continue(Int32)
  Dispatch(Int32)
  Exit
} derive(Eq)

///|
pub struct Region {
  members : Array[Int32]
  entries : Array[Int32]
  control : Control
}

///|
pub struct Plan {
  source : @direct_ir.Program
  regions : Array[Region]
  owner : Array[Int32]
  addresses : Array[Int32]
  stride : Int32
}

///|
pub suberror InvalidControl {
  InvalidControl(String)
}

///|
fn require(ok : Bool, message : String) -> Unit raise InvalidControl {
  if !ok {
    raise InvalidControl(message)
  }
}

///|
pub fn Plan::address(self : Plan, label : Int32) -> Int32 {
  let address = self.addresses[label]
  guard! address >= 0
  address
}

///|
pub fn Control::uses_dispatch(self : Control) -> Bool {
  match self {
    Dispatch(_) => true
    Sequence(nodes) => nodes.any(n => n.uses_dispatch())
    Scope(_, body) | Loop(_, body) => body.uses_dispatch()
    Switch(cases) => cases.any(p => p.1.uses_dispatch())
    Run(_) | Select(_) => false
  }
}
