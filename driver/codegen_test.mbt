///|
test "CRLF grammar comments render like LF comments" {
  let source = "%token A EOF\n%start start\n%%\nstart:\n  A EOF\n  { () }\n"
  fn generate(source : String) -> String {
    @driver.compile(
      source,
      filename="parser.mly",
      mode=JsonCst,
      input_mode=Pull,
      token_payload_rewrite=NoPayload,
      force_int_position=true,
      generator=@gen_mbt_table.compress_generator,
    )
  }
  assert_true(
    generate(source.replace_all(old="\n", new="\r\n")) == generate(source),
  )
}
