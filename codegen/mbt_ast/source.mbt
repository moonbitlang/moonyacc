///|
/// Adapt existing elaborated source pieces without losing their provenance.
pub fn fragment(
  parts : ArrayView[(String, (Int, Int)?)],
  source~ : String,
) -> Fragment {
  Fragment(
    parts
    .iter()
    .map(pair => {
      Piece::Text(
        pair.0,
        pair.1.map(range => Origin::{
          source,
          offset: range.0,
          length: range.1,
        }),
      )
    })
    .to_array(),
  )
}

///|
fn fragment_doc(fragment : Fragment) -> Doc {
  Embedded(
    fragment.0.map(piece => {
      let (doc, origin) = match piece {
        Text(value, origin) => (text(value), origin)
        // A substitution occupies an expression position in otherwise opaque
        // source. Parenthesize operators so surrounding text cannot rebind them.
        Splice(expr, origin) => (expr_doc(expr, minimum=140), origin)
      }
      match origin {
        None => doc
        Some(origin) => Mapped(origin, doc)
      }
    }),
  )
}

///|
/// Called only after the final writer knows the complete generated span.
fn record_origin(
  builder : &@codegen.SourceMapBuilder,
  origin : Origin,
  generated : Int,
  length : Int,
) -> Unit {
  guard! origin.offset >= 0 && origin.length >= 0
  if length == origin.length {
    @codegen.SourceMapBuilder::add_mapping(
      builder,
      origin.source,
      origin.offset,
      generated,
      length,
    )
  } else {
    // Replacements have no linear interior correspondence. Retain both
    // endpoints and anchor every interior position to the original start.
    for offset in 0..<=length {
      let original = if offset == length {
        origin.offset + origin.length
      } else {
        origin.offset
      }
      @codegen.SourceMapBuilder::add_mapping(
        builder,
        origin.source,
        original,
        generated + offset,
        0,
      )
    }
  }
}
