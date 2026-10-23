///|
/// Move a callee's positions into its caller's RHS coordinate system.
pub fn PositionExpr::rebase(
  self : PositionExpr,
  offset : Int32,
) -> PositionExpr {
  match self {
    BeforeRhs | FirstNonEmpty([]) =>
      if offset == 0 {
        BeforeRhs
      } else {
        EndOf(offset - 1)
      }
    StartOf(index) => StartOf(offset + index)
    EndOf(index) => EndOf(offset + index)
    FirstNonEmpty(spans) =>
      FirstNonEmpty(
        spans.map(span => (span.0.rebase(offset), span.1.rebase(offset))),
      )
  }
}

///|
/// Replace one logical symbol by an expanded RHS. The replacement span is
/// already normalized, so nested epsilon prefixes keep their original anchor.
pub fn PositionExpr::substitute(
  self : PositionExpr,
  index~ : Int32,
  arity~ : Int32,
  span~ : (PositionExpr, PositionExpr),
) -> PositionExpr {
  match self {
    BeforeRhs => BeforeRhs
    StartOf(item) if item == index => span.0.rebase(index)
    EndOf(item) if item == index => span.1.rebase(index)
    StartOf(item) => StartOf(if item > index { item + arity - 1 } else { item })
    EndOf(item) => EndOf(if item > index { item + arity - 1 } else { item })
    FirstNonEmpty(spans) =>
      FirstNonEmpty(
        spans.map(item => {
          (
            item.0.substitute(index~, arity~, span~),
            item.1.substitute(index~, arity~, span~),
          )
        }),
      )
  }
}

///|
/// Statically empty spans are skipped, so only the remaining comparisons and
/// the fallback can demand the position preceding the RHS.
pub fn PositionExpr::uses_before_rhs(self : PositionExpr) -> Bool {
  match self {
    BeforeRhs | FirstNonEmpty([]) => true
    StartOf(_) | EndOf(_) => false
    FirstNonEmpty(spans) =>
      spans[spans.length() - 1].1.uses_before_rhs() ||
      spans.any(span => {
        span.0 != span.1 &&
        (span.0.uses_before_rhs() || span.1.uses_before_rhs())
      })
  }
}
