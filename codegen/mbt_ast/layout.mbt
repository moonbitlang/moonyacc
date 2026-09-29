///|
/// Layout and source fragments are private to the renderer. Measurement is
/// side-effect free; only the final iterative write pass records mappings.
priv enum Doc {
  Text(String)
  HardLine
  SoftLine(String)
  Concat(Array[Doc])
  Nest(Doc)
  Group(Doc)
  Embedded(Array[Doc])
  Mapped(Origin, Doc)
}

///|
fn text(value : String) -> Doc {
  Text(value)
}

///|
fn cat(parts : Array[Doc]) -> Doc {
  Concat(parts)
}

///|
fn join_docs(parts : Array[Doc], separator : Doc) -> Doc {
  let result = []
  for i, part in parts {
    if i > 0 {
      result.push(separator)
    }
    result.push(part)
  }
  cat(result)
}

///|
fn parens(doc : Doc) -> Doc {
  cat([text("("), doc, text(")")])
}

///|
fn delimited(left : String, right : String, parts : Array[Doc]) -> Doc {
  if parts.is_empty() {
    return text(left + right)
  }
  let body = []
  for i, part in parts {
    let entry = cat([
      SoftLine(if i == 0 { "" } else { " " }),
      part,
      text(if i + 1 < parts.length() { "," } else { "" }),
    ])
    // Every delimited list uses the same layout rule. The document's
    // width and hard line breaks determine whether another entry fits.
    body.push(if i > 0 { Group(entry) } else { entry })
  }
  Group(cat([text(left), Nest(cat(body)), SoftLine(""), text(right)]))
}

///|
fn fits(doc : Doc, remaining : Int) -> Bool {
  let pending = [doc]
  let mut remaining = remaining
  while pending.pop() is Some(doc) {
    if remaining < 0 {
      return false
    }
    match doc {
      Text(value) | SoftLine(value) => {
        if value.contains("\n") || value.contains("\r") {
          return false
        }
        remaining -= value.length()
      }
      HardLine => return false
      Concat(parts) | Embedded(parts) =>
        for i = parts.length() - 1; i >= 0; i = i - 1 {
          pending.push(parts[i])
        }
      Nest(doc) | Group(doc) | Mapped(_, doc) => pending.push(doc)
    }
  }
  remaining >= 0
}

///|
priv enum WriteStep {
  Write(Int, Bool, Bool, Doc)
  EndOrigin(Origin, Int)
}

///|
fn write_doc(
  doc : Doc,
  output : @logger_with_cursor.LoggerWithCursor,
  source_map_builder : &@codegen.SourceMapBuilder?,
  width : Int,
) -> Bool {
  let pending = [WriteStep::Write(0, false, false, doc)]
  let mut column = 0
  let mut line_start = false
  let mut mapping_open = false
  fn indentation(indent : Int) {
    if line_start {
      Logger::write_string(output, " ".repeat(indent))
      column = indent
      line_start = false
    }
  }
  fn note_text(value : String) {
    for c in value {
      if c == '\r' || c == '\n' {
        column = 0
        line_start = true
      } else {
        column += c.utf16_len()
        line_start = false
      }
    }
  }
  while pending.pop() is Some(step) {
    let (indent, flat, embedded, doc) = match step {
      Write(indent, flat, embedded, doc) => (indent, flat, embedded, doc)
      EndOrigin(origin, start) => {
        if source_map_builder is Some(builder) {
          record_origin(builder, origin, start, output.cursor() - start)
        }
        mapping_open = false
        continue
      }
    }
    match doc {
      Text(value) =>
        if value != "" {
          if !embedded {
            indentation(indent)
          }
          Logger::write_string(output, value)
          note_text(value)
        }
      HardLine => {
        Logger::write_char(output, '\n')
        column = 0
        line_start = true
      }
      SoftLine(value) =>
        if flat {
          if value != "" {
            if !embedded {
              indentation(indent)
            }
            Logger::write_string(output, value)
            note_text(value)
          }
        } else {
          Logger::write_char(output, '\n')
          column = 0
          line_start = true
        }
      Concat(parts) =>
        for i = parts.length() - 1; i >= 0; i = i - 1 {
          pending.push(Write(indent, flat, embedded, parts[i]))
        }
      Nest(doc) => pending.push(Write(indent + 2, flat, embedded, doc))
      Group(doc) => {
        let used = if line_start { indent } else { column }
        pending.push(
          Write(indent, flat || fits(doc, width - used), embedded, doc),
        )
      }
      Embedded(parts) => {
        // Indent only before the fragment. Keep source text exact and splices
        // flat, so layout cannot change a surrounding source line or literal.
        if !embedded {
          indentation(indent)
        }
        for i = parts.length() - 1; i >= 0; i = i - 1 {
          pending.push(Write(indent, true, true, parts[i]))
        }
      }
      Mapped(origin, doc) => {
        // An annotated substitution owns its whole span, including any nested
        // syntax. Do not emit overlapping mappings for nested annotations.
        if !mapping_open && source_map_builder is Some(_) {
          if !embedded {
            indentation(indent)
          }
          mapping_open = true
          pending.push(EndOrigin(origin, output.cursor()))
        }
        pending.push(Write(indent, flat, embedded, doc))
      }
    }
  }
  line_start
}
