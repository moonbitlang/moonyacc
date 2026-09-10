///|
pub fn derive_code(type_name : String, traits : Array[String]) -> CodeFragment {
  guard !traits.is_empty() else { return "" }
  let output = StringBuilder()
  let joined = traits.iter().join(", ")
  Logger::write_string(output, " derive(\{joined})")
  for trait_ in traits {
    let methods = match trait_ {
      "Eq" => "equal, not_equal"
      "Compare" => "compare, op_ge, op_gt, op_le, op_lt"
      "Hash" => "hash, hash_combine"
      "Show" => "output, to_string"
      "Debug" | "@debug.Debug" => "to_repr"
      "ToJson" => "to_json"
      "Default" => "default"
      "FromJson" | "@json.FromJson" => "from_json"
      "Arbitrary" | "@quickcheck.Arbitrary" => "arbitrary"
      _ => continue
    }
    let qualified = methods
      .split(", ")
      .map(method_name => "\{trait_}::\{method_name}")
      .join(" or ")
    let message = "Use \{qualified} instead".escape()
    Logger::write_string(
      output,
      "\n\n#deprecated(\{message})\n#doc(hidden)\npub extend \{type_name} with \{trait_}::{\{methods}}",
    )
  }
  output.to_string()
}
