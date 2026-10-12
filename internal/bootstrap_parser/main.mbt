///|
async fn main {
  // Build the local generator from its checked-in parsers without recursively
  // regenerating them. A separate target directory avoids the caller's lock.
  let args = [
    "--target-dir", "_build/bootstrap-generator", "run", "--target", "wasm", ".",
    "--",
  ]
  args.append(@env.args()[1:])
  let status = @process.run("moon", args, extra_env={
    "MOON_IGNORE_PREBUILD": "1",
  })
  if status != 0 {
    abort("Parser bootstrap failed with exit code \{status}")
  }
}
