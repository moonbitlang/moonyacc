const $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Underscore = { $tag: 0 };
const $64$jian$47$mbtlex$47$lib$47$type$46$Regex$EOF = { $tag: 1 };
function $64$jian$47$mbtlex$47$lib$47$type$46$Regex$ReStr(param0) {
  this._0 = param0;
}
$64$jian$47$mbtlex$47$lib$47$type$46$Regex$ReStr.prototype.$tag = 2;
function $64$jian$47$mbtlex$47$lib$47$type$46$Regex$ReChar(param0) {
  this._0 = param0;
}
$64$jian$47$mbtlex$47$lib$47$type$46$Regex$ReChar.prototype.$tag = 3;
function $64$jian$47$mbtlex$47$lib$47$type$46$Regex$CharSet(param0) {
  this._0 = param0;
}
$64$jian$47$mbtlex$47$lib$47$type$46$Regex$CharSet.prototype.$tag = 4;
function $64$jian$47$mbtlex$47$lib$47$type$46$Regex$RevCharSet(param0) {
  this._0 = param0;
}
$64$jian$47$mbtlex$47$lib$47$type$46$Regex$RevCharSet.prototype.$tag = 5;
function $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Repetition(param0) {
  this._0 = param0;
}
$64$jian$47$mbtlex$47$lib$47$type$46$Regex$Repetition.prototype.$tag = 6;
function $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Option(param0) {
  this._0 = param0;
}
$64$jian$47$mbtlex$47$lib$47$type$46$Regex$Option.prototype.$tag = 7;
function $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Alter(param0, param1) {
  this._0 = param0;
  this._1 = param1;
}
$64$jian$47$mbtlex$47$lib$47$type$46$Regex$Alter.prototype.$tag = 8;
function $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Concat(param0, param1) {
  this._0 = param0;
  this._1 = param1;
}
$64$jian$47$mbtlex$47$lib$47$type$46$Regex$Concat.prototype.$tag = 9;
function $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Capture(param0, param1) {
  this._0 = param0;
  this._1 = param1;
}
$64$jian$47$mbtlex$47$lib$47$type$46$Regex$Capture.prototype.$tag = 10;
function $compare_int(a, b) {
  return (a >= b) - (a <= b);
}
function $make_array_len_and_init(a, b) {
  const arr = new Array(a);
  for (let i = 0; i < a; i++) {
    arr[i] = b;
  }
  return arr;
}
const $0L = { hi: 0, lo: 0 };
const $1L = { hi: 0, lo: 1 };
function $i32_popcnt(a) {
  a = a - ((a >>> 1) & 0x55555555);
  a = (a & 0x33333333) + ((a >>> 2) & 0x33333333);
  a = (a + (a >>> 4)) & 0x0f0f0f0f;
  a = a + (a >>> 8);
  a = a + (a >>> 16);
  return a & 0x3f;
}
const $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Empty$0$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Leaf$0$(param0, param1) {
  this._0 = param0;
  this._1 = param1;
}
$64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Leaf$0$.prototype.$tag = 1;
function $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Collision$0$(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Collision$0$.prototype.$tag = 2;
function $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Branch$0$(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Branch$0$.prototype.$tag = 3;
const $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Empty$1$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Leaf$1$(param0, param1) {
  this._0 = param0;
  this._1 = param1;
}
$64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Leaf$1$.prototype.$tag = 1;
function $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Collision$1$(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Collision$1$.prototype.$tag = 2;
function $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Branch$1$(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Branch$1$.prototype.$tag = 3;
function $64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$Just_One$0$(param0, param1) {
  this._0 = param0;
  this._1 = param1;
}
$64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$Just_One$0$.prototype.$tag = 0;
function $64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$More$0$(param0, param1, param2) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
}
$64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$More$0$.prototype.$tag = 1;
function $64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$Just_One$1$(param0, param1) {
  this._0 = param0;
  this._1 = param1;
}
$64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$Just_One$1$.prototype.$tag = 0;
function $64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$More$1$(param0, param1, param2) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
}
$64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$More$1$.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$builtin$46$ForeachResult$Continue$2$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$builtin$46$ForeachResult$Break$2$(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$core$47$builtin$46$ForeachResult$Break$2$.prototype.$tag = 1;
function $64$moonbitlang$47$core$47$builtin$46$ForeachResult$Return$2$(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$core$47$builtin$46$ForeachResult$Return$2$.prototype.$tag = 2;
function $64$moonbitlang$47$core$47$builtin$46$ForeachResult$Error$2$(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$core$47$builtin$46$ForeachResult$Error$2$.prototype.$tag = 3;
class $PanicError extends Error {}
function $panic() {
  throw new $PanicError();
}
const $64$moonbitlang$47$core$47$immut$47$sorted_map$46$T$Empty$3$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$immut$47$sorted_map$46$T$Tree$3$(param0, param1, param2, param3, param4) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
  this._4 = param4;
}
$64$moonbitlang$47$core$47$immut$47$sorted_map$46$T$Tree$3$.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$queue$46$Cell$Nil$4$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$queue$46$Cell$Cons$4$(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$core$47$queue$46$Cell$Cons$4$.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$queue$46$Cell$Nil$5$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$queue$46$Cell$Cons$5$(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$core$47$queue$46$Cell$Cons$5$.prototype.$tag = 1;
const moonbitlang$core$builtin$$JSArray$push = (arr, val) => { arr.push(val); };
const moonbitlang$core$builtin$$JSArray$set_length = (arr, len) => { arr.length = len; };
const moonbitlang$core$builtin$$JSArray$pop = (arr) => arr.pop();
const $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$Eps = { $tag: 0 };
function $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$EChar(param0) {
  this._0 = param0;
}
$64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$EChar.prototype.$tag = 1;
function $64$jian$47$mbtlex$47$lib$47$codegen$47$internal$47$codeblock_parser$46$SubstItemDesc$StartPosOf(param0) {
  this._0 = param0;
}
$64$jian$47$mbtlex$47$lib$47$codegen$47$internal$47$codeblock_parser$46$SubstItemDesc$StartPosOf.prototype.$tag = 0;
function $64$jian$47$mbtlex$47$lib$47$codegen$47$internal$47$codeblock_parser$46$SubstItemDesc$EndPosOf(param0) {
  this._0 = param0;
}
$64$jian$47$mbtlex$47$lib$47$codegen$47$internal$47$codeblock_parser$46$SubstItemDesc$EndPosOf.prototype.$tag = 1;
function $64$Yoorkin$47$ArgParser$46$Spec$Unit(param0) {
  this._0 = param0;
}
$64$Yoorkin$47$ArgParser$46$Spec$Unit.prototype.$tag = 0;
function $64$Yoorkin$47$ArgParser$46$Spec$String(param0) {
  this._0 = param0;
}
$64$Yoorkin$47$ArgParser$46$Spec$String.prototype.$tag = 1;
function $64$Yoorkin$47$ArgParser$46$Spec$Set_string(param0) {
  this._0 = param0;
}
$64$Yoorkin$47$ArgParser$46$Spec$Set_string.prototype.$tag = 2;
function $64$Yoorkin$47$ArgParser$46$Spec$Set(param0) {
  this._0 = param0;
}
$64$Yoorkin$47$ArgParser$46$Spec$Set.prototype.$tag = 3;
function $64$Yoorkin$47$ArgParser$46$Spec$Clear(param0) {
  this._0 = param0;
}
$64$Yoorkin$47$ArgParser$46$Spec$Clear.prototype.$tag = 4;
const moonbitlang$x$sys$internal$ffi$$get_cli_args_internal = function() {   return process.argv.slice(2);  };
const moonbitlang$x$fs$internal$ffi$$read_file_to_string_internal = function(path) {   fs = require('fs');   let content = fs.readFileSync(path, 'utf8');   return content;  };
const moonbitlang$x$fs$internal$ffi$$write_string_to_file_internal = function(path, content) {   fs = require('fs');   fs.writeFileSync(path, content, 'utf8');  };
const moonbitlang$x$fs$internal$ffi$$path_exists_internal = function(path) {   fs = require('fs');   return fs.existsSync(path);  };
function Result$Err$6$(param0) {
  this._0 = param0;
}
Result$Err$6$.prototype.$tag = 0;
function Result$Ok$6$(param0) {
  this._0 = param0;
}
Result$Ok$6$.prototype.$tag = 1;
function Error$moonbitlang$47$x$47$fs$46$IOError$46$NotFound(param0) {
  this._0 = param0;
}
Error$moonbitlang$47$x$47$fs$46$IOError$46$NotFound.prototype.$tag = 0;
function Result$Err$7$(param0) {
  this._0 = param0;
}
Result$Err$7$.prototype.$tag = 0;
function Result$Ok$7$(param0) {
  this._0 = param0;
}
Result$Ok$7$.prototype.$tag = 1;
function Error$$to_string(_e) {
  return moonbitlang$core$builtin$$Show$to_string$0$(_e);
}
const moonbitlang$core$immut$internal$sparse_array$$empty_bitset = 0;
const jian$mbtlex$lib$parser$$string_re = new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Concat(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$ReChar(34), new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Concat(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Option(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Repetition(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Alter(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$ReStr("\\\""), new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$RevCharSet([34])))), new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$ReChar(34)));
const jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0 = [];
const jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_2 = [-1];
const jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1 = [0];
const jian$mbtlex$lib$codegen$$runtime = "///|\nstruct Lexbuf {\n  content : String\n  mut pos : Int\n}\n\n///|\npub fn Lexbuf::from_string(content : String) -> Lexbuf {\n  { content, pos: 0 }\n}\n\n// NOTE: MoonBit do have unboxed Option[Char] optimization\n///|\nfn next(self : Lexbuf) -> Char? {\n  if self.pos < self.content.length() {\n    let ch = self.content[self.pos]\n    self.pos += 1\n    Some(ch)\n  } else {\n    None\n  }\n}\n\n///|\nfn substring(self : Lexbuf, start : Int, end : Int) -> String {\n  self.content.substring(start~, end~)\n}\n\n///|\ntypealias LexTagAction = Array[Array[Int]]\n\n///|\ntypealias LexState = Int\n\n///|\ntypealias LexInput = Int\n\n///|\npub(all) struct LexEngine {\n  graph : Array[(LexState) -> (LexState, LexTagAction)]\n  end_nodes : Array[(Int, Array[((Int, Int), (Int, Int))])?]\n  start_tags : Array[Int]\n  code_blocks_n : Int\n}\n\n///|\npub fn run(self : LexEngine, lexbuf : Lexbuf) -> (Int, Array[(Int, Int)]) {\n  let mut state = 1\n  let mut tagState : Array[Array[Int]] = []\n  let backtrace = Array::make(self.code_blocks_n, None)\n  for tag in self.start_tags {\n    while tagState.length() <= tag {\n      tagState.push([])\n    }\n    tagState[tag].push(lexbuf.pos)\n  }\n  while state != 0 {\n    match self.end_nodes[state] {\n      Some(t) => backtrace[t.0] = Some((lexbuf.pos, state, tagState))\n      _ => ()\n    }\n    let b = match lexbuf.next() {\n      Some(b) => b\n      None => '\\x00'\n    }\n    let next = self.graph[state](b.to_int())\n    state = next.0\n    let new_tagState : Array[Array[Int]] = []\n    for i = 0; i < next.1.length(); i = i + 1 {\n      new_tagState.push([])\n      for j = 0; j < next.1[i].length(); j = j + 1 {\n        let t = next.1[i][j]\n        if t == -1 {\n          new_tagState[i].push(lexbuf.pos)\n        } else {\n          new_tagState[i].push(tagState[i][t])\n        }\n      }\n    }\n    tagState = new_tagState\n  }\n  for index, b in backtrace {\n    match b {\n      Some((p, state, tagState)) => {\n        lexbuf.pos = p\n        let captures = self.end_nodes[state].unwrap().1.map(\n          fn {\n            ((b_t, b_r), (e_t, e_r)) => (tagState[b_t][b_r], tagState[e_t][e_r])\n          },\n        )\n        break (index, captures)\n      }\n      None => ()\n    }\n  } else {\n    (self.code_blocks_n, [])\n  }\n}\n";
const jian$mbtlex$main$$_init$42$46$usage$1$ = "Usage: moonlex [options] <input-file>";
const jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_5 = [jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_2];
const jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_7 = [jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_2, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1];
const jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_6 = [jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1];
const jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 = [jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0];
const jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_2 = [jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0];
const jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_4 = [jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_2, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0];
const jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_3 = [jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_2, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0];
const jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_1 = [jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_2, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_row_0];
const jian$mbtlex$lib$codegen$internal$codeblock_parser$$__mbtlex_engine_scan_codeblock_rbrace = { graph: [jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_0, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_1, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_2, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_3, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_4, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_5, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_6, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_7, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_8, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_9, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_10, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_11, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_12, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_13, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_14, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_15, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_16, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_17, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_18, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_19, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_20, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_21, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_22, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_23, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_24, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_25, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_26, jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_27], end_nodes: [undefined, { _0: 5, _1: [] }, { _0: 4, _1: [] }, { _0: 0, _1: [] }, { _0: 1, _1: [] }, { _0: 4, _1: [] }, { _0: 3, _1: [] }, { _0: 3, _1: [] }, { _0: 3, _1: [] }, { _0: 3, _1: [] }, { _0: 3, _1: [] }, { _0: 3, _1: [] }, { _0: 3, _1: [] }, { _0: 3, _1: [] }, { _0: 3, _1: [] }, { _0: 3, _1: [] }, { _0: 3, _1: [] }, { _0: 3, _1: [] }, { _0: 3, _1: [] }, { _0: 3, _1: [] }, undefined, { _0: 3, _1: [] }, undefined, undefined, { _0: 3, _1: [] }, undefined, { _0: 2, _1: [{ _0: { _0: 0, _1: 0 }, _1: { _0: 1, _1: 0 } }, { _0: { _0: 2, _1: 0 }, _1: { _0: 3, _1: 0 } }, { _0: { _0: 4, _1: 0 }, _1: { _0: 5, _1: 0 } }] }, undefined], start_tags: [0], code_blocks_n: 6 };
const jian$mbtlex$lib$parser$$digit_re = new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$CharSet(jian$mbtlex$lib$parser$$ch_range(48, 57));
const jian$mbtlex$lib$parser$$hex_digit_re = new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Alter(jian$mbtlex$lib$parser$$digit_re, new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Alter(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$CharSet(jian$mbtlex$lib$parser$$ch_range(97, 102)), new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$CharSet(jian$mbtlex$lib$parser$$ch_range(65, 70))));
const jian$mbtlex$lib$parser$$char_re = new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Concat(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$ReChar(39), new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Alter(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Concat($64$jian$47$mbtlex$47$lib$47$type$46$Regex$Underscore, new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$ReChar(39)), new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Concat(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Concat(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$ReChar(92), new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Alter(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Concat(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$ReChar(120), new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Concat(jian$mbtlex$lib$parser$$hex_digit_re, jian$mbtlex$lib$parser$$hex_digit_re)), $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Underscore)), new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$ReChar(39))));
function moonbitlang$core$string$$String$from_array(chars) {
  const buf = moonbitlang$core$builtin$$StringBuilder$new(Math.imul(chars.length, 4) | 0);
  const _len = chars.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const c = moonbitlang$core$array$$Array$op_get$2$(chars, _i);
      moonbitlang$core$builtin$$StringBuilder$write_char(buf, c);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return moonbitlang$core$builtin$$StringBuilder$to_string(buf);
}
function moonbitlang$core$string$$String$concat(strings, separator) {
  const buf = moonbitlang$core$builtin$$StringBuilder$new(moonbitlang$core$builtin$$StringBuilder$new$46$size_hint$46$default());
  if (separator === "") {
    const _len = strings.length;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const s = moonbitlang$core$array$$Array$op_get$3$(strings, _i);
        moonbitlang$core$builtin$$StringBuilder$write_string(buf, s);
        _tmp = _i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
  } else {
    if (strings.length === 0) {
    } else {
      const _x = moonbitlang$core$array$$Array$op_get$3$(strings, 0);
      const _x$2 = moonbitlang$core$array$$Array$op_as_view$3$(strings, 1, strings.length - 0 | 0);
      moonbitlang$core$builtin$$StringBuilder$write_string(buf, _x);
      const _len = moonbitlang$core$array$$ArrayView$length$3$(_x$2);
      let _tmp = 0;
      while (true) {
        const _i = _tmp;
        if (_i < _len) {
          const s = moonbitlang$core$array$$ArrayView$op_get$3$(_x$2, _i);
          moonbitlang$core$builtin$$StringBuilder$write_string(buf, separator);
          moonbitlang$core$builtin$$StringBuilder$write_string(buf, s);
          _tmp = _i + 1 | 0;
          continue;
        } else {
          break;
        }
      }
    }
  }
  return moonbitlang$core$builtin$$StringBuilder$to_string(buf);
}
function moonbitlang$core$string$$String$compare(self, other) {
  const len = self.length;
  const _bind = $compare_int(len, other.length);
  if (_bind === 0) {
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < len) {
        const order = $compare_int(self.charCodeAt(i), other.charCodeAt(i));
        if (order !== 0) {
          return order;
        }
        _tmp = i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    return 0;
  } else {
    return _bind;
  }
}
function moonbitlang$core$string$$code_point_of_surrogate_pair(leading, trailing) {
  return (((Math.imul(leading - 55296 | 0, 1024) | 0) + trailing | 0) - 56320 | 0) + 65536 | 0;
}
function moonbitlang$core$string$$is_trailing_surrogate(c) {
  const code = c;
  return 56320 <= code && code <= 57343;
}
function moonbitlang$core$string$$is_leading_surrogate(c) {
  const code = c;
  return 55296 <= code && code <= 56319;
}
function moonbitlang$core$string$$String$iter(self) {
  return moonbitlang$core$builtin$$Iter$new$2$((yield_) => {
    const len = self.length;
    let _tmp = 0;
    while (true) {
      const index = _tmp;
      if (index < len) {
        const c1 = self.charCodeAt(index);
        if (moonbitlang$core$string$$is_leading_surrogate(c1) && (index + 1 | 0) < len) {
          const c2 = self.charCodeAt(index + 1 | 0);
          if (moonbitlang$core$string$$is_trailing_surrogate(c2)) {
            const c = moonbitlang$core$string$$code_point_of_surrogate_pair(c1, c2);
            const _bind = yield_(c);
            if (_bind === 1) {
              _tmp = index + 2 | 0;
              continue;
            } else {
              return _bind;
            }
          }
        }
        const _bind = yield_(c1);
        if (_bind === 1) {
        } else {
          return _bind;
        }
        _tmp = index + 1 | 0;
        continue;
      } else {
        return 1;
      }
    }
  });
}
function moonbitlang$core$string$$String$to_array(self) {
  const _bind = moonbitlang$core$string$$String$iter(self);
  const _bind$2 = moonbitlang$core$array$$Array$new$2$(self.length);
  const _acc = { val: _bind$2 };
  _bind((_p) => {
    const rv = _acc.val;
    moonbitlang$core$array$$Array$push$2$(rv, _p);
    _acc.val = rv;
    return 1;
  });
  return _acc.val;
}
function moonbitlang$core$builtin$$Show$output$4$(self, logger) {
  logger.method_0(logger.self, Error$$to_string(self));
}
function moonbitlang$core$ref$$Ref$new$3$(x) {
  return { val: x };
}
function moonbitlang$core$array$$get_limit(len) {
  let len$2 = len;
  let limit = 0;
  while (true) {
    if (len$2 > 0) {
      len$2 = len$2 / 2 | 0;
      limit = limit + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return limit;
}
function moonbitlang$core$array$$minimum(x, y) {
  return x > y ? y : x;
}
function moonbitlang$core$array$$partition$3$(arr, pivot_index) {
  moonbitlang$core$array$$ArrayView$swap$3$(arr, pivot_index, moonbitlang$core$array$$ArrayView$length$3$(arr) - 1 | 0);
  const pivot = moonbitlang$core$array$$ArrayView$op_get$3$(arr, moonbitlang$core$array$$ArrayView$length$3$(arr) - 1 | 0);
  let i = 0;
  let partitioned = true;
  let _tmp = 0;
  while (true) {
    const j = _tmp;
    if (j < (moonbitlang$core$array$$ArrayView$length$3$(arr) - 1 | 0)) {
      if (moonbitlang$core$builtin$$op_lt$3$(moonbitlang$core$array$$ArrayView$op_get$3$(arr, j), pivot)) {
        if (i !== j) {
          moonbitlang$core$array$$ArrayView$swap$3$(arr, i, j);
          partitioned = false;
        }
        i = i + 1 | 0;
      }
      _tmp = j + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  moonbitlang$core$array$$ArrayView$swap$3$(arr, i, moonbitlang$core$array$$ArrayView$length$3$(arr) - 1 | 0);
  return { _0: i, _1: partitioned };
}
function moonbitlang$core$array$$try_bubble_sort$3$(arr) {
  let tries = 0;
  let _tmp = 1;
  while (true) {
    const i = _tmp;
    if (i < moonbitlang$core$array$$ArrayView$length$3$(arr)) {
      let sorted = true;
      let _tmp$2 = i;
      while (true) {
        const j = _tmp$2;
        if (j > 0 && moonbitlang$core$builtin$$op_gt$3$(moonbitlang$core$array$$ArrayView$op_get$3$(arr, j - 1 | 0), moonbitlang$core$array$$ArrayView$op_get$3$(arr, j))) {
          sorted = false;
          moonbitlang$core$array$$ArrayView$swap$3$(arr, j, j - 1 | 0);
          _tmp$2 = j - 1 | 0;
          continue;
        } else {
          break;
        }
      }
      if (!sorted) {
        tries = tries + 1 | 0;
        if (tries > 8) {
          return false;
        }
      }
      _tmp = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return true;
}
function moonbitlang$core$array$$ArrayView$rev_inplace$3$(self) {
  const mid_len = moonbitlang$core$array$$ArrayView$length$3$(self) / 2 | 0;
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < mid_len) {
      const j = (moonbitlang$core$array$$ArrayView$length$3$(self) - i | 0) - 1 | 0;
      moonbitlang$core$array$$ArrayView$swap$3$(self, i, j);
      _tmp = i + 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$array$$choose_pivot$3$(arr) {
  const len = moonbitlang$core$array$$ArrayView$length$3$(arr);
  const swaps = { val: 0 };
  const b = Math.imul(len / 4 | 0, 2) | 0;
  if (len >= 8) {
    const a = Math.imul(len / 4 | 0, 1) | 0;
    const c = Math.imul(len / 4 | 0, 3) | 0;
    const _env = { _0: swaps, _1: arr };
    if (len > 50) {
      moonbitlang$core$array$$choose_pivot$46$sort_3$47$78(_env, a - 1 | 0, a, a + 1 | 0);
      moonbitlang$core$array$$choose_pivot$46$sort_3$47$78(_env, b - 1 | 0, b, b + 1 | 0);
      moonbitlang$core$array$$choose_pivot$46$sort_3$47$78(_env, c - 1 | 0, c, c + 1 | 0);
    }
    moonbitlang$core$array$$choose_pivot$46$sort_3$47$78(_env, a, b, c);
  }
  if (swaps.val === 12) {
    moonbitlang$core$array$$ArrayView$rev_inplace$3$(arr);
    return { _0: (len - b | 0) - 1 | 0, _1: true };
  } else {
    return { _0: b, _1: swaps.val === 0 };
  }
}
function moonbitlang$core$array$$choose_pivot$46$sort_2$47$77(_env, a, b) {
  const arr = _env._1;
  const swaps = _env._0;
  if (moonbitlang$core$builtin$$op_gt$3$(moonbitlang$core$array$$ArrayView$op_get$3$(arr, a), moonbitlang$core$array$$ArrayView$op_get$3$(arr, b))) {
    moonbitlang$core$array$$ArrayView$swap$3$(arr, a, b);
    swaps.val = swaps.val + 1 | 0;
    return;
  } else {
    return;
  }
}
function moonbitlang$core$array$$choose_pivot$46$sort_3$47$78(_env, a, b, c) {
  moonbitlang$core$array$$choose_pivot$46$sort_2$47$77(_env, a, b);
  moonbitlang$core$array$$choose_pivot$46$sort_2$47$77(_env, b, c);
  moonbitlang$core$array$$choose_pivot$46$sort_2$47$77(_env, a, b);
}
function moonbitlang$core$array$$sift_down$3$(arr, index) {
  let index$2 = index;
  const len = moonbitlang$core$array$$ArrayView$length$3$(arr);
  let child = (Math.imul(index$2, 2) | 0) + 1 | 0;
  while (true) {
    if (child < len) {
      if ((child + 1 | 0) < len && moonbitlang$core$builtin$$op_lt$3$(moonbitlang$core$array$$ArrayView$op_get$3$(arr, child), moonbitlang$core$array$$ArrayView$op_get$3$(arr, child + 1 | 0))) {
        child = child + 1 | 0;
      }
      if (moonbitlang$core$builtin$$op_ge$3$(moonbitlang$core$array$$ArrayView$op_get$3$(arr, index$2), moonbitlang$core$array$$ArrayView$op_get$3$(arr, child))) {
        return undefined;
      }
      moonbitlang$core$array$$ArrayView$swap$3$(arr, index$2, child);
      index$2 = child;
      child = (Math.imul(index$2, 2) | 0) + 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$array$$heap_sort$3$(arr) {
  const len = moonbitlang$core$array$$ArrayView$length$3$(arr);
  let _tmp = (len / 2 | 0) - 1 | 0;
  while (true) {
    const i = _tmp;
    if (i >= 0) {
      moonbitlang$core$array$$sift_down$3$(arr, i);
      _tmp = i - 1 | 0;
      continue;
    } else {
      break;
    }
  }
  let _tmp$2 = len - 1 | 0;
  while (true) {
    const i = _tmp$2;
    if (i > 0) {
      moonbitlang$core$array$$ArrayView$swap$3$(arr, 0, i);
      moonbitlang$core$array$$sift_down$3$(moonbitlang$core$array$$ArrayView$op_as_view$3$(arr, 0, i), 0);
      _tmp$2 = i - 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$array$$ArrayView$insertion_sort$3$(arr) {
  let _tmp = 1;
  while (true) {
    const i = _tmp;
    if (i < moonbitlang$core$array$$ArrayView$length$3$(arr)) {
      let _tmp$2 = i;
      while (true) {
        const j = _tmp$2;
        if (j > 0 && moonbitlang$core$builtin$$op_gt$3$(moonbitlang$core$array$$ArrayView$op_get$3$(arr, j - 1 | 0), moonbitlang$core$array$$ArrayView$op_get$3$(arr, j))) {
          moonbitlang$core$array$$ArrayView$swap$3$(arr, j, j - 1 | 0);
          _tmp$2 = j - 1 | 0;
          continue;
        } else {
          break;
        }
      }
      _tmp = i + 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$array$$quick_sort$3$(arr, pred, limit) {
  let limit$2 = limit;
  let arr$2 = arr;
  let pred$2 = pred;
  let was_partitioned = true;
  let balanced = true;
  while (true) {
    const len = moonbitlang$core$array$$ArrayView$length$3$(arr$2);
    if (len <= 16) {
      if (len >= 2) {
        moonbitlang$core$array$$ArrayView$insertion_sort$3$(arr$2);
      }
      return undefined;
    }
    if (limit$2 === 0) {
      moonbitlang$core$array$$heap_sort$3$(arr$2);
      return undefined;
    }
    const _bind = moonbitlang$core$array$$choose_pivot$3$(arr$2);
    const _x = _bind._0;
    const _x$2 = _bind._1;
    if (was_partitioned && (balanced && _x$2)) {
      if (moonbitlang$core$array$$try_bubble_sort$3$(arr$2)) {
        return undefined;
      }
    }
    const _bind$2 = moonbitlang$core$array$$partition$3$(arr$2, _x);
    const _x$3 = _bind$2._0;
    const _x$4 = _bind$2._1;
    was_partitioned = _x$4;
    balanced = moonbitlang$core$array$$minimum(_x$3, len - _x$3 | 0) >= (len / 8 | 0);
    if (!balanced) {
      limit$2 = limit$2 - 1 | 0;
    }
    const _bind$3 = pred$2;
    if (_bind$3 === undefined) {
    } else {
      const _Some = _bind$3;
      const _x$5 = _Some;
      if (_x$5 === moonbitlang$core$array$$ArrayView$op_get$3$(arr$2, _x$3)) {
        let i = _x$3;
        while (true) {
          if (i < len && _x$5 === moonbitlang$core$array$$ArrayView$op_get$3$(arr$2, i)) {
            i = i + 1 | 0;
            continue;
          } else {
            break;
          }
        }
        arr$2 = moonbitlang$core$array$$ArrayView$op_as_view$3$(arr$2, i, len);
        continue;
      }
    }
    const left = moonbitlang$core$array$$ArrayView$op_as_view$3$(arr$2, 0, _x$3);
    const right = moonbitlang$core$array$$ArrayView$op_as_view$3$(arr$2, _x$3 + 1 | 0, len);
    if (moonbitlang$core$array$$ArrayView$length$3$(left) < moonbitlang$core$array$$ArrayView$length$3$(right)) {
      moonbitlang$core$array$$quick_sort$3$(left, pred$2, limit$2);
      pred$2 = moonbitlang$core$array$$ArrayView$op_get$3$(arr$2, _x$3);
      arr$2 = right;
    } else {
      moonbitlang$core$array$$quick_sort$3$(right, moonbitlang$core$array$$ArrayView$op_get$3$(arr$2, _x$3), limit$2);
      arr$2 = left;
    }
    continue;
  }
}
function moonbitlang$core$array$$Array$sort$3$(self) {
  const len = self.length;
  moonbitlang$core$array$$quick_sort$3$(moonbitlang$core$array$$Array$op_as_view$3$(self, 0, len), undefined, moonbitlang$core$array$$get_limit(len));
}
function moonbitlang$core$array$$FixedArray$copy$5$(self) {
  const len = self.length;
  if (len === 0) {
    return [];
  } else {
    const arr = $make_array_len_and_init(len, self[0]);
    moonbitlang$core$array$$FixedArray$unsafe_blit$5$(arr, 0, self, 0, len);
    return arr;
  }
}
function moonbitlang$core$array$$FixedArray$copy$6$(self) {
  const len = self.length;
  if (len === 0) {
    return [];
  } else {
    const arr = $make_array_len_and_init(len, self[0]);
    moonbitlang$core$array$$FixedArray$unsafe_blit$6$(arr, 0, self, 0, len);
    return arr;
  }
}
function moonbitlang$core$array$$FixedArray$copy$7$(self) {
  const len = self.length;
  if (len === 0) {
    return [];
  } else {
    const arr = $make_array_len_and_init(len, self[0]);
    moonbitlang$core$array$$FixedArray$unsafe_blit$7$(arr, 0, self, 0, len);
    return arr;
  }
}
function moonbitlang$core$array$$FixedArray$makei$7$(length, value) {
  if (length <= 0) {
    return [];
  } else {
    const array = $make_array_len_and_init(length, value(0));
    let _tmp = 1;
    while (true) {
      const i = _tmp;
      if (i < length) {
        array[i] = value(i);
        _tmp = i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    return array;
  }
}
function moonbitlang$core$array$$FixedArray$op_equal$7$(self, that) {
  if (self.length !== that.length) {
    return false;
  }
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < self.length) {
      if (self[i] !== that[i]) {
        return false;
      }
      _tmp = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return true;
}
function moonbitlang$core$array$$Array$push_iter$8$(self, iter) {
  iter((x) => {
    moonbitlang$core$array$$Array$push$8$(self, x);
    return 1;
  });
}
function moonbitlang$core$array$$Array$copy$9$(self) {
  const len = self.length;
  if (len === 0) {
    return [];
  } else {
    const arr = moonbitlang$core$array$$Array$make$9$(len, moonbitlang$core$array$$Array$op_get$9$(self, 0));
    moonbitlang$core$array$$Array$unsafe_blit$9$(arr, 0, self, 0, len);
    return arr;
  }
}
function moonbitlang$core$array$$Array$makei$5$(length, value) {
  if (length <= 0) {
    return [];
  } else {
    const array = moonbitlang$core$array$$Array$make$5$(length, value(0));
    let _tmp = 1;
    while (true) {
      const i = _tmp;
      if (i < length) {
        moonbitlang$core$array$$Array$op_set$5$(array, i, value(i));
        _tmp = i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    return array;
  }
}
function moonbitlang$core$array$$Array$makei$10$(length, value) {
  if (length <= 0) {
    return [];
  } else {
    const array = moonbitlang$core$array$$Array$make$10$(length, value(0));
    let _tmp = 1;
    while (true) {
      const i = _tmp;
      if (i < length) {
        moonbitlang$core$array$$Array$op_set$10$(array, i, value(i));
        _tmp = i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    return array;
  }
}
function moonbitlang$core$array$$Array$makei$2$(length, value) {
  if (length <= 0) {
    return [];
  } else {
    const array = moonbitlang$core$array$$Array$make$2$(length, value(0));
    let _tmp = 1;
    while (true) {
      const i = _tmp;
      if (i < length) {
        moonbitlang$core$array$$Array$op_set$2$(array, i, value(i));
        _tmp = i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    return array;
  }
}
function moonbitlang$core$array$$Array$makei$3$(length, value) {
  if (length <= 0) {
    return [];
  } else {
    const array = moonbitlang$core$array$$Array$make$3$(length, value(0));
    let _tmp = 1;
    while (true) {
      const i = _tmp;
      if (i < length) {
        moonbitlang$core$array$$Array$op_set$3$(array, i, value(i));
        _tmp = i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    return array;
  }
}
function moonbitlang$core$array$$Array$makei$11$(length, value) {
  if (length <= 0) {
    return [];
  } else {
    const array = moonbitlang$core$array$$Array$make$11$(length, value(0));
    let _tmp = 1;
    while (true) {
      const i = _tmp;
      if (i < length) {
        moonbitlang$core$array$$Array$op_set$11$(array, i, value(i));
        _tmp = i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    return array;
  }
}
function moonbitlang$core$sorted_set$$new$7$() {
  return { root: undefined, size: $0L };
}
function moonbitlang$core$sorted_set$$height$7$(node) {
  if (node === undefined) {
    return 0;
  } else {
    const _Some = node;
    const _x = _Some;
    return _x.height;
  }
}
function moonbitlang$core$sorted_set$$max(x, y) {
  return x > y ? x : y;
}
function moonbitlang$core$sorted_set$$Node$update_height$7$(self) {
  self.height = 1 + moonbitlang$core$sorted_set$$max(moonbitlang$core$sorted_set$$height$7$(self.left), moonbitlang$core$sorted_set$$height$7$(self.right)) | 0;
}
function moonbitlang$core$sorted_set$$rotate_l$7$(n) {
  const r = moonbitlang$core$option$$Option$unwrap$12$(n.right);
  n.right = r.left;
  r.left = n;
  moonbitlang$core$sorted_set$$Node$update_height$7$(n);
  moonbitlang$core$sorted_set$$Node$update_height$7$(r);
  return r;
}
function moonbitlang$core$sorted_set$$rotate_r$7$(n) {
  const l = moonbitlang$core$option$$Option$unwrap$12$(n.left);
  n.left = l.right;
  l.right = n;
  moonbitlang$core$sorted_set$$Node$update_height$7$(n);
  moonbitlang$core$sorted_set$$Node$update_height$7$(l);
  return l;
}
function moonbitlang$core$sorted_set$$rotate_rl$7$(n) {
  const r = moonbitlang$core$option$$Option$unwrap$12$(n.right);
  const v = moonbitlang$core$sorted_set$$rotate_r$7$(r);
  n.right = v;
  return moonbitlang$core$sorted_set$$rotate_l$7$(n);
}
function moonbitlang$core$sorted_set$$height_ge$7$(x1, x2) {
  if (x2 === undefined) {
    return true;
  } else {
    const _Some = x2;
    const _x = _Some;
    if (x1 === undefined) {
      return false;
    } else {
      const _Some$2 = x1;
      const _x$2 = _Some$2;
      return _x$2.height >= _x.height;
    }
  }
}
function moonbitlang$core$sorted_set$$rotate_lr$7$(n) {
  const l = moonbitlang$core$option$$Option$unwrap$12$(n.left);
  const v = moonbitlang$core$sorted_set$$rotate_l$7$(l);
  n.left = v;
  return moonbitlang$core$sorted_set$$rotate_r$7$(n);
}
function moonbitlang$core$sorted_set$$balance$7$(root) {
  const l = root.left;
  const r = root.right;
  const hl = moonbitlang$core$sorted_set$$height$7$(l);
  const hr = moonbitlang$core$sorted_set$$height$7$(r);
  let new_root;
  if (hl > (hr + 1 | 0)) {
    const _bind = moonbitlang$core$option$$Option$unwrap$12$(l);
    const _x = _bind.left;
    const _x$2 = _bind.right;
    new_root = moonbitlang$core$sorted_set$$height_ge$7$(_x, _x$2) ? moonbitlang$core$sorted_set$$rotate_r$7$(root) : moonbitlang$core$sorted_set$$rotate_lr$7$(root);
  } else {
    if (hr > (hl + 1 | 0)) {
      const _bind = moonbitlang$core$option$$Option$unwrap$12$(r);
      const _x = _bind.left;
      const _x$2 = _bind.right;
      new_root = moonbitlang$core$sorted_set$$height_ge$7$(_x$2, _x) ? moonbitlang$core$sorted_set$$rotate_l$7$(root) : moonbitlang$core$sorted_set$$rotate_rl$7$(root);
    } else {
      new_root = root;
    }
  }
  moonbitlang$core$sorted_set$$Node$update_height$7$(new_root);
  return new_root;
}
function moonbitlang$core$sorted_set$$new_node$7$(value, left, right, height) {
  return { value: value, left: left, right: right, height: height };
}
function moonbitlang$core$sorted_set$$new_node$46$left$46$default$7$() {
  return undefined;
}
function moonbitlang$core$sorted_set$$new_node$46$right$46$default$7$() {
  return undefined;
}
function moonbitlang$core$sorted_set$$new_node$46$height$46$default$7$() {
  return 1;
}
function moonbitlang$core$sorted_set$$add_node$7$(root, value) {
  if (root === undefined) {
    return { _0: moonbitlang$core$sorted_set$$new_node$7$(value, moonbitlang$core$sorted_set$$new_node$46$left$46$default$7$(), moonbitlang$core$sorted_set$$new_node$46$right$46$default$7$(), moonbitlang$core$sorted_set$$new_node$46$height$46$default$7$()), _1: true };
  } else {
    const _Some = root;
    const _x = _Some;
    if (value === _x.value) {
      _x.value = value;
      return { _0: _x, _1: false };
    } else {
      const l = _x.left;
      const r = _x.right;
      if (value < _x.value) {
        const _bind = moonbitlang$core$sorted_set$$add_node$7$(l, value);
        const _x$2 = _bind._0;
        const _x$3 = _bind._1;
        _x.left = _x$2;
        return { _0: moonbitlang$core$sorted_set$$balance$7$(_x), _1: _x$3 };
      } else {
        const _bind = moonbitlang$core$sorted_set$$add_node$7$(r, value);
        const _x$2 = _bind._0;
        const _x$3 = _bind._1;
        _x.right = _x$2;
        return { _0: moonbitlang$core$sorted_set$$balance$7$(_x), _1: _x$3 };
      }
    }
  }
}
function moonbitlang$core$sorted_set$$T$add$7$(self, value) {
  const _bind = moonbitlang$core$sorted_set$$add_node$7$(self.root, value);
  const _x = _bind._0;
  const _x$2 = _bind._1;
  if (moonbitlang$core$builtin$$op_notequal$13$(self.root, _x)) {
    self.root = _x;
  }
  if (_x$2) {
    self.size = moonbitlang$core$int64$$Int64$op_add(self.size, $1L);
    return;
  } else {
    return;
  }
}
function moonbitlang$core$sorted_set$$Node$each$7$(self, f) {
  const s = [];
  let p = self;
  while (true) {
    if (!moonbitlang$core$option$$Option$is_empty$12$(p) || !moonbitlang$core$array$$Array$is_empty$13$(s)) {
      while (true) {
        if (!moonbitlang$core$option$$Option$is_empty$12$(p)) {
          moonbitlang$core$array$$Array$push$13$(s, p);
          p = moonbitlang$core$option$$Option$unwrap$12$(p).left;
          continue;
        } else {
          break;
        }
      }
      if (!moonbitlang$core$array$$Array$is_empty$13$(s)) {
        p = moonbitlang$core$array$$Array$unsafe_pop$13$(s);
        f(moonbitlang$core$option$$Option$unwrap$12$(p).value);
        p = moonbitlang$core$option$$Option$unwrap$12$(p).right;
      }
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$sorted_set$$T$each$7$(self, f) {
  const _bind = self.root;
  if (_bind === undefined) {
    return;
  } else {
    const _Some = _bind;
    const _x = _Some;
    moonbitlang$core$sorted_set$$Node$each$7$(_x, f);
    return;
  }
}
function moonbitlang$core$sorted_set$$T$to_array$7$(self) {
  const arr = [];
  moonbitlang$core$sorted_set$$T$each$7$(self, (v) => {
    moonbitlang$core$array$$Array$push$7$(arr, v);
  });
  return arr;
}
function moonbitlang$core$sorted_set$$T$from_iter$7$(iter) {
  const s = moonbitlang$core$sorted_set$$new$7$();
  iter((_p) => {
    moonbitlang$core$sorted_set$$T$add$7$(s, _p);
    return 1;
  });
  return s;
}
function moonbitlang$core$sorted_set$$Node$op_equal$7$(self, other) {
  return self.value === other.value;
}
function moonbitlang$core$builtin$$Hash$hash$2$(self) {
  return self;
}
function moonbitlang$core$builtin$$Hash$hash_combine$2$(self, hasher) {
  moonbitlang$core$builtin$$Hasher$combine_char(hasher, self);
}
function moonbitlang$core$immut$internal$sparse_array$$Bitset$has(self, idx) {
  return (self & 1 << idx) !== 0;
}
function moonbitlang$core$immut$internal$sparse_array$$Bitset$index_of(self, idx) {
  return $i32_popcnt(self & ((1 << idx >>> 0) - (1 >>> 0) | 0));
}
function moonbitlang$core$immut$internal$sparse_array$$Bitset$add(self, idx) {
  return self | 1 << idx;
}
function moonbitlang$core$immut$internal$sparse_array$$Bitset$size(self) {
  return $i32_popcnt(self);
}
function moonbitlang$core$immut$internal$sparse_array$$SparseArray$singleton$5$(idx, value) {
  return { elem_info: moonbitlang$core$immut$internal$sparse_array$$Bitset$add(moonbitlang$core$immut$internal$sparse_array$$empty_bitset, idx), data: [value] };
}
function moonbitlang$core$immut$internal$sparse_array$$SparseArray$singleton$6$(idx, value) {
  return { elem_info: moonbitlang$core$immut$internal$sparse_array$$Bitset$add(moonbitlang$core$immut$internal$sparse_array$$empty_bitset, idx), data: [value] };
}
function moonbitlang$core$immut$internal$sparse_array$$SparseArray$op_get$5$(self, idx) {
  return moonbitlang$core$immut$internal$sparse_array$$Bitset$has(self.elem_info, idx) ? self.data[moonbitlang$core$immut$internal$sparse_array$$Bitset$index_of(self.elem_info, idx)] : undefined;
}
function moonbitlang$core$immut$internal$sparse_array$$SparseArray$op_get$6$(self, idx) {
  return moonbitlang$core$immut$internal$sparse_array$$Bitset$has(self.elem_info, idx) ? self.data[moonbitlang$core$immut$internal$sparse_array$$Bitset$index_of(self.elem_info, idx)] : undefined;
}
function moonbitlang$core$immut$internal$sparse_array$$SparseArray$add$5$(self, idx, value) {
  const old_data = self.data;
  const old_len = old_data.length;
  const new_len = old_len + 1 | 0;
  const pos_of_new_item = moonbitlang$core$immut$internal$sparse_array$$Bitset$index_of(self.elem_info, idx);
  const new_data = $make_array_len_and_init(new_len, value);
  moonbitlang$core$array$$FixedArray$blit_to$5$(old_data, new_data, pos_of_new_item, moonbitlang$core$array$$FixedArray$blit_to$46$src_offset$46$default$5$(), moonbitlang$core$array$$FixedArray$blit_to$46$dst_offset$46$default$5$());
  moonbitlang$core$array$$FixedArray$blit_to$5$(old_data, new_data, old_len - pos_of_new_item | 0, pos_of_new_item, pos_of_new_item + 1 | 0);
  return { elem_info: moonbitlang$core$immut$internal$sparse_array$$Bitset$add(self.elem_info, idx), data: new_data };
}
function moonbitlang$core$immut$internal$sparse_array$$SparseArray$add$6$(self, idx, value) {
  const old_data = self.data;
  const old_len = old_data.length;
  const new_len = old_len + 1 | 0;
  const pos_of_new_item = moonbitlang$core$immut$internal$sparse_array$$Bitset$index_of(self.elem_info, idx);
  const new_data = $make_array_len_and_init(new_len, value);
  moonbitlang$core$array$$FixedArray$blit_to$6$(old_data, new_data, pos_of_new_item, moonbitlang$core$array$$FixedArray$blit_to$46$src_offset$46$default$6$(), moonbitlang$core$array$$FixedArray$blit_to$46$dst_offset$46$default$6$());
  moonbitlang$core$array$$FixedArray$blit_to$6$(old_data, new_data, old_len - pos_of_new_item | 0, pos_of_new_item, pos_of_new_item + 1 | 0);
  return { elem_info: moonbitlang$core$immut$internal$sparse_array$$Bitset$add(self.elem_info, idx), data: new_data };
}
function moonbitlang$core$immut$internal$sparse_array$$SparseArray$replace$5$(self, idx, value) {
  const new_data = moonbitlang$core$array$$FixedArray$copy$5$(self.data);
  new_data[moonbitlang$core$immut$internal$sparse_array$$Bitset$index_of(self.elem_info, idx)] = value;
  return { elem_info: self.elem_info, data: new_data };
}
function moonbitlang$core$immut$internal$sparse_array$$SparseArray$replace$6$(self, idx, value) {
  const new_data = moonbitlang$core$array$$FixedArray$copy$6$(self.data);
  new_data[moonbitlang$core$immut$internal$sparse_array$$Bitset$index_of(self.elem_info, idx)] = value;
  return { elem_info: self.elem_info, data: new_data };
}
function moonbitlang$core$immut$internal$sparse_array$$SparseArray$each$6$(self, f) {
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < moonbitlang$core$immut$internal$sparse_array$$Bitset$size(self.elem_info)) {
      f(self.data[i]);
      _tmp = i + 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$immut$hashmap$$T$new$14$() {
  return $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Empty$0$;
}
function moonbitlang$core$immut$hashmap$$T$new$15$() {
  return $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Empty$1$;
}
function moonbitlang$core$immut$hashmap$$Bucket$find$15$(self, key) {
  let _tmp = self;
  let _tmp$2 = key;
  while (true) {
    const self$2 = _tmp;
    const key$2 = _tmp$2;
    if (self$2.$tag === 0) {
      const _Just_One = self$2;
      const _x = _Just_One._0;
      const _x$2 = _Just_One._1;
      return key$2 === _x ? _x$2 : undefined;
    } else {
      const _More = self$2;
      const _x = _More._0;
      const _x$2 = _More._1;
      const _x$3 = _More._2;
      if (key$2 === _x) {
        return _x$2;
      } else {
        _tmp = _x$3;
        continue;
      }
    }
  }
}
function moonbitlang$core$immut$hashmap$$T$find$15$(self, key) {
  let _tmp = self;
  let _tmp$2 = moonbitlang$core$builtin$$Hash$hash$7$(key);
  _L: while (true) {
    const _param = _tmp;
    const _param$2 = _tmp$2;
    switch (_param.$tag) {
      case 0: {
        return undefined;
      }
      case 1: {
        const _Leaf = _param;
        const _x = _Leaf._0;
        const _x$2 = _Leaf._1;
        return key === _x ? _x$2 : undefined;
      }
      case 2: {
        const _Collision = _param;
        const _x$3 = _Collision._0;
        return moonbitlang$core$immut$hashmap$$Bucket$find$15$(_x$3, key);
      }
      default: {
        const _Branch = _param;
        const _x$4 = _Branch._0;
        const idx = _param$2 & 31;
        if (moonbitlang$core$immut$internal$sparse_array$$Bitset$has(_x$4.elem_info, idx)) {
          const child = _x$4.data[moonbitlang$core$immut$internal$sparse_array$$Bitset$index_of(_x$4.elem_info, idx)];
          const _tmp$3 = _param$2 >>> 5 | 0;
          _tmp = child;
          _tmp$2 = _tmp$3;
          continue _L;
        }
        return undefined;
      }
    }
  }
}
function moonbitlang$core$immut$hashmap$$T$op_get$15$(self, key) {
  return moonbitlang$core$immut$hashmap$$T$find$15$(self, key);
}
function moonbitlang$core$immut$hashmap$$Bucket$add$14$(self, key, value) {
  if (self.$tag === 0) {
    const _Just_One = self;
    const _x = _Just_One._0;
    return key === _x ? new $64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$Just_One$0$(key, value) : new $64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$More$0$(key, value, self);
  } else {
    const _More = self;
    const _x = _More._0;
    const _x$2 = _More._1;
    const _x$3 = _More._2;
    return key === _x ? new $64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$More$0$(key, value, _x$3) : new $64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$More$0$(_x, _x$2, moonbitlang$core$immut$hashmap$$Bucket$add$14$(_x$3, key, value));
  }
}
function moonbitlang$core$immut$hashmap$$Bucket$add$15$(self, key, value) {
  if (self.$tag === 0) {
    const _Just_One = self;
    const _x = _Just_One._0;
    return key === _x ? new $64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$Just_One$1$(key, value) : new $64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$More$1$(key, value, self);
  } else {
    const _More = self;
    const _x = _More._0;
    const _x$2 = _More._1;
    const _x$3 = _More._2;
    return key === _x ? new $64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$More$1$(key, value, _x$3) : new $64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$More$1$(_x, _x$2, moonbitlang$core$immut$hashmap$$Bucket$add$15$(_x$3, key, value));
  }
}
function moonbitlang$core$immut$hashmap$$T$add_with_hash$14$(self, key, depth, hash, value) {
  switch (self.$tag) {
    case 0: {
      return moonbitlang$core$immut$hashmap$$add_with_hash$46$make_leaf$47$352(depth, key, hash, value);
    }
    case 1: {
      const _Leaf = self;
      const _x = _Leaf._0;
      const _x$2 = _Leaf._1;
      return key === _x ? new $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Leaf$0$(key, value) : new $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Collision$0$(new $64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$More$0$(key, value, new $64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$Just_One$0$(_x, _x$2)));
    }
    case 2: {
      const _Collision = self;
      const _x$3 = _Collision._0;
      return new $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Collision$0$(moonbitlang$core$immut$hashmap$$Bucket$add$14$(_x$3, key, value));
    }
    default: {
      const _Branch = self;
      const _x$4 = _Branch._0;
      const idx = hash & 31;
      const _bind = moonbitlang$core$immut$internal$sparse_array$$SparseArray$op_get$5$(_x$4, idx);
      if (_bind === undefined) {
        const child = moonbitlang$core$immut$hashmap$$add_with_hash$46$make_leaf$47$352(depth + 5 | 0, key, hash >>> 5 | 0, value);
        return new $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Branch$0$(moonbitlang$core$immut$internal$sparse_array$$SparseArray$add$5$(_x$4, idx, child));
      } else {
        const _Some = _bind;
        const _x$5 = _Some;
        const child = moonbitlang$core$immut$hashmap$$T$add_with_hash$14$(_x$5, key, depth + 5 | 0, hash >>> 5 | 0, value);
        return new $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Branch$0$(moonbitlang$core$immut$internal$sparse_array$$SparseArray$replace$5$(_x$4, idx, child));
      }
    }
  }
}
function moonbitlang$core$immut$hashmap$$add_with_hash$46$make_leaf$47$352(depth, key, hash, value) {
  if (depth >= 32) {
    return new $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Leaf$0$(key, value);
  } else {
    const idx = hash & 31;
    const child = moonbitlang$core$immut$hashmap$$add_with_hash$46$make_leaf$47$352(depth + 5 | 0, key, hash >>> 5 | 0, value);
    return new $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Branch$0$(moonbitlang$core$immut$internal$sparse_array$$SparseArray$singleton$5$(idx, child));
  }
}
function moonbitlang$core$immut$hashmap$$T$add_with_hash$15$(self, key, depth, hash, value) {
  switch (self.$tag) {
    case 0: {
      return moonbitlang$core$immut$hashmap$$add_with_hash$46$make_leaf$47$377(depth, key, hash, value);
    }
    case 1: {
      const _Leaf = self;
      const _x = _Leaf._0;
      const _x$2 = _Leaf._1;
      return key === _x ? new $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Leaf$1$(key, value) : new $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Collision$1$(new $64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$More$1$(key, value, new $64$moonbitlang$47$core$47$immut$47$hashmap$46$Bucket$Just_One$1$(_x, _x$2)));
    }
    case 2: {
      const _Collision = self;
      const _x$3 = _Collision._0;
      return new $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Collision$1$(moonbitlang$core$immut$hashmap$$Bucket$add$15$(_x$3, key, value));
    }
    default: {
      const _Branch = self;
      const _x$4 = _Branch._0;
      const idx = hash & 31;
      const _bind = moonbitlang$core$immut$internal$sparse_array$$SparseArray$op_get$6$(_x$4, idx);
      if (_bind === undefined) {
        const child = moonbitlang$core$immut$hashmap$$add_with_hash$46$make_leaf$47$377(depth + 5 | 0, key, hash >>> 5 | 0, value);
        return new $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Branch$1$(moonbitlang$core$immut$internal$sparse_array$$SparseArray$add$6$(_x$4, idx, child));
      } else {
        const _Some = _bind;
        const _x$5 = _Some;
        const child = moonbitlang$core$immut$hashmap$$T$add_with_hash$15$(_x$5, key, depth + 5 | 0, hash >>> 5 | 0, value);
        return new $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Branch$1$(moonbitlang$core$immut$internal$sparse_array$$SparseArray$replace$6$(_x$4, idx, child));
      }
    }
  }
}
function moonbitlang$core$immut$hashmap$$add_with_hash$46$make_leaf$47$377(depth, key, hash, value) {
  if (depth >= 32) {
    return new $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Leaf$1$(key, value);
  } else {
    const idx = hash & 31;
    const child = moonbitlang$core$immut$hashmap$$add_with_hash$46$make_leaf$47$377(depth + 5 | 0, key, hash >>> 5 | 0, value);
    return new $64$moonbitlang$47$core$47$immut$47$hashmap$46$T$Branch$1$(moonbitlang$core$immut$internal$sparse_array$$SparseArray$singleton$6$(idx, child));
  }
}
function moonbitlang$core$immut$hashmap$$T$add$14$(self, key, value) {
  return moonbitlang$core$immut$hashmap$$T$add_with_hash$14$(self, key, 0, moonbitlang$core$builtin$$Hash$hash$7$(key), value);
}
function moonbitlang$core$immut$hashmap$$T$add$15$(self, key, value) {
  return moonbitlang$core$immut$hashmap$$T$add_with_hash$15$(self, key, 0, moonbitlang$core$builtin$$Hash$hash$7$(key), value);
}
function moonbitlang$core$immut$hashmap$$Bucket$size$15$(self) {
  let _tmp = self;
  let _tmp$2 = 1;
  while (true) {
    const _param = _tmp;
    const _param$2 = _tmp$2;
    if (_param.$tag === 0) {
      return _param$2;
    } else {
      const _More = _param;
      const _x = _More._2;
      const _tmp$3 = _param$2 + 1 | 0;
      _tmp = _x;
      _tmp$2 = _tmp$3;
      continue;
    }
  }
}
function moonbitlang$core$immut$hashmap$$T$size$15$(self) {
  switch (self.$tag) {
    case 0: {
      return 0;
    }
    case 1: {
      return 1;
    }
    case 2: {
      const _Collision = self;
      const _x = _Collision._0;
      return moonbitlang$core$immut$hashmap$$Bucket$size$15$(_x);
    }
    default: {
      const _Branch = self;
      const _x$2 = _Branch._0;
      let _tmp = 0;
      let _tmp$2 = 0;
      while (true) {
        const i = _tmp;
        const total_size = _tmp$2;
        if (i < _x$2.data.length) {
          const _tmp$3 = i + 1 | 0;
          const _tmp$4 = total_size + moonbitlang$core$immut$hashmap$$T$size$15$(_x$2.data[i]) | 0;
          _tmp = _tmp$3;
          _tmp$2 = _tmp$4;
          continue;
        } else {
          return total_size;
        }
      }
    }
  }
}
function moonbitlang$core$immut$hashmap$$Bucket$each$15$(self, f) {
  let _tmp = self;
  while (true) {
    const _param = _tmp;
    if (_param.$tag === 0) {
      const _Just_One = _param;
      const _x = _Just_One._0;
      const _x$2 = _Just_One._1;
      f(_x, _x$2);
      return;
    } else {
      const _More = _param;
      const _x = _More._0;
      const _x$2 = _More._1;
      const _x$3 = _More._2;
      f(_x, _x$2);
      _tmp = _x$3;
      continue;
    }
  }
}
function moonbitlang$core$immut$hashmap$$T$each$15$(self, f) {
  switch (self.$tag) {
    case 0: {
      return;
    }
    case 1: {
      const _Leaf = self;
      const _x = _Leaf._0;
      const _x$2 = _Leaf._1;
      f(_x, _x$2);
      return;
    }
    case 2: {
      const _Collision = self;
      const _x$3 = _Collision._0;
      moonbitlang$core$immut$hashmap$$Bucket$each$15$(_x$3, f);
      return;
    }
    default: {
      const _Branch = self;
      const _x$4 = _Branch._0;
      moonbitlang$core$immut$internal$sparse_array$$SparseArray$each$6$(_x$4, (child) => {
        moonbitlang$core$immut$hashmap$$T$each$15$(child, f);
      });
      return;
    }
  }
}
function moonbitlang$core$immut$hashmap$$Bucket$iter$14$(self) {
  return moonbitlang$core$builtin$$Iter$new$16$((f) => {
    let _tmp = self;
    while (true) {
      const _param = _tmp;
      if (_param.$tag === 0) {
        const _Just_One = _param;
        const _x = _Just_One._0;
        const _x$2 = _Just_One._1;
        return f({ _0: _x, _1: _x$2 });
      } else {
        const _More = _param;
        const _x = _More._0;
        const _x$2 = _More._1;
        const _x$3 = _More._2;
        if (moonbitlang$core$builtin$$Eq$op_equal$17$(f({ _0: _x, _1: _x$2 }), 1)) {
          _tmp = _x$3;
          continue;
        } else {
          return 0;
        }
      }
    }
  });
}
function moonbitlang$core$immut$hashmap$$Bucket$iter$15$(self) {
  return moonbitlang$core$builtin$$Iter$new$18$((f) => {
    let _tmp = self;
    while (true) {
      const _param = _tmp;
      if (_param.$tag === 0) {
        const _Just_One = _param;
        const _x = _Just_One._0;
        const _x$2 = _Just_One._1;
        return f({ _0: _x, _1: _x$2 });
      } else {
        const _More = _param;
        const _x = _More._0;
        const _x$2 = _More._1;
        const _x$3 = _More._2;
        if (moonbitlang$core$builtin$$Eq$op_equal$17$(f({ _0: _x, _1: _x$2 }), 1)) {
          _tmp = _x$3;
          continue;
        } else {
          return 0;
        }
      }
    }
  });
}
function moonbitlang$core$immut$hashmap$$T$iter$15$(self) {
  switch (self.$tag) {
    case 0: {
      return moonbitlang$core$builtin$$Iter$empty$18$();
    }
    case 1: {
      const _Leaf = self;
      const _x = _Leaf._0;
      const _x$2 = _Leaf._1;
      return moonbitlang$core$builtin$$Iter$singleton$18$({ _0: _x, _1: _x$2 });
    }
    case 2: {
      const _Collision = self;
      const _x$3 = _Collision._0;
      return moonbitlang$core$immut$hashmap$$Bucket$iter$15$(_x$3);
    }
    default: {
      const _Branch = self;
      const _x$4 = _Branch._0;
      const _bind = _x$4.data;
      return (_p) => {
        const _len = _bind.length;
        let _tmp = 0;
        while (true) {
          const _i = _tmp;
          if (_i < _len) {
            const _p$2 = _bind[_i];
            const _func = moonbitlang$core$immut$hashmap$$T$iter$15$(_p$2);
            if (_func(_p) === 1) {
              _tmp = _i + 1 | 0;
              continue;
            } else {
              return 0;
            }
          } else {
            return 1;
          }
        }
      };
    }
  }
}
function moonbitlang$core$immut$hashmap$$T$iter$14$(self) {
  switch (self.$tag) {
    case 0: {
      return moonbitlang$core$builtin$$Iter$empty$16$();
    }
    case 1: {
      const _Leaf = self;
      const _x = _Leaf._0;
      const _x$2 = _Leaf._1;
      return moonbitlang$core$builtin$$Iter$singleton$16$({ _0: _x, _1: _x$2 });
    }
    case 2: {
      const _Collision = self;
      const _x$3 = _Collision._0;
      return moonbitlang$core$immut$hashmap$$Bucket$iter$14$(_x$3);
    }
    default: {
      const _Branch = self;
      const _x$4 = _Branch._0;
      const _bind = _x$4.data;
      return (_p) => {
        const _len = _bind.length;
        let _tmp = 0;
        while (true) {
          const _i = _tmp;
          if (_i < _len) {
            const _p$2 = _bind[_i];
            const _func = moonbitlang$core$immut$hashmap$$T$iter$14$(_p$2);
            if (_func(_p) === 1) {
              _tmp = _i + 1 | 0;
              continue;
            } else {
              return 0;
            }
          } else {
            return 1;
          }
        }
      };
    }
  }
}
function moonbitlang$core$immut$hashmap$$T$from_iter$14$(iter) {
  const _bind = moonbitlang$core$immut$hashmap$$T$new$14$();
  const _acc = { val: _bind };
  iter((_p) => {
    const m = _acc.val;
    _acc.val = moonbitlang$core$immut$hashmap$$T$add$14$(m, _p._0, _p._1);
    return 1;
  });
  return _acc.val;
}
function moonbitlang$core$immut$hashmap$$T$from_iter$15$(iter) {
  const _bind = moonbitlang$core$immut$hashmap$$T$new$15$();
  const _acc = { val: _bind };
  iter((_p) => {
    const m = _acc.val;
    _acc.val = moonbitlang$core$immut$hashmap$$T$add$15$(m, _p._0, _p._1);
    return 1;
  });
  return _acc.val;
}
function moonbitlang$core$builtin$$Eq$op_equal$19$(self, other) {
  if (moonbitlang$core$immut$hashmap$$T$size$15$(self) !== moonbitlang$core$immut$hashmap$$T$size$15$(other)) {
    return false;
  }
  const _foreach_result = { val: $64$moonbitlang$47$core$47$builtin$46$ForeachResult$Continue$2$ };
  const _bind = moonbitlang$core$immut$hashmap$$T$iter$15$(self);
  _bind((kv) => {
    const _bind$2 = moonbitlang$core$immut$hashmap$$T$find$15$(other, kv._0);
    if (_bind$2 === undefined) {
      _foreach_result.val = new $64$moonbitlang$47$core$47$builtin$46$ForeachResult$Break$2$(false);
      return 0;
    } else {
      const _Some = _bind$2;
      const _x = _Some;
      if (moonbitlang$core$builtin$$op_notequal$20$(_x, kv._1)) {
        _foreach_result.val = new $64$moonbitlang$47$core$47$builtin$46$ForeachResult$Break$2$(false);
        return 0;
      }
    }
    return 1;
  });
  const _tmp = _foreach_result.val;
  switch (_tmp.$tag) {
    case 0: {
      return true;
    }
    case 1: {
      const _break = _tmp;
      return _break._0;
    }
    case 2: {
      const _return = _tmp;
      return _return._0;
    }
    default: {
      return $panic();
    }
  }
}
function moonbitlang$core$builtin$$Hash$hash_combine$19$(self, hasher) {
  moonbitlang$core$immut$hashmap$$T$each$15$(self, (k, v) => {
    moonbitlang$core$builtin$$Hasher$combine$7$(hasher, k);
    moonbitlang$core$builtin$$Hasher$combine$20$(hasher, v);
  });
}
function moonbitlang$core$immut$sorted_map$$T$size$21$(self) {
  if (self.$tag === 0) {
    return 0;
  } else {
    const _Tree = self;
    return _Tree._2;
  }
}
function moonbitlang$core$immut$sorted_map$$make_tree$21$(key, value, l, r) {
  const size = (moonbitlang$core$immut$sorted_map$$T$size$21$(l) + moonbitlang$core$immut$sorted_map$$T$size$21$(r) | 0) + 1 | 0;
  return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$T$Tree$3$(key, value, size, l, r);
}
function moonbitlang$core$immut$sorted_map$$balance$21$(key, value, l, r) {
  const ln = moonbitlang$core$immut$sorted_map$$T$size$21$(l);
  const rn = moonbitlang$core$immut$sorted_map$$T$size$21$(r);
  if ((ln + rn | 0) < 2) {
    return moonbitlang$core$immut$sorted_map$$make_tree$21$(key, value, l, r);
  } else {
    if (rn > (Math.imul(5, ln) | 0)) {
      let _bind;
      if (r.$tag === 1) {
        const _Tree = r;
        const _x = _Tree._3;
        const _x$2 = _Tree._4;
        _bind = { _0: _x, _1: _x$2 };
      } else {
        _bind = moonbitlang$core$builtin$$abort$22$("unreachable");
      }
      const _x = _bind._0;
      const _x$2 = _bind._1;
      const rln = moonbitlang$core$immut$sorted_map$$T$size$21$(_x);
      const rrn = moonbitlang$core$immut$sorted_map$$T$size$21$(_x$2);
      if (rln < rrn) {
        if (r.$tag === 1) {
          const _Tree = r;
          const _x$3 = _Tree._0;
          const _x$4 = _Tree._1;
          const _x$5 = _Tree._3;
          const _x$6 = _Tree._4;
          return moonbitlang$core$immut$sorted_map$$make_tree$21$(_x$3, _x$4, moonbitlang$core$immut$sorted_map$$make_tree$21$(key, value, l, _x$5), _x$6);
        } else {
          return moonbitlang$core$builtin$$abort$23$("single_l error");
        }
      } else {
        _L: {
          if (r.$tag === 1) {
            const _Tree = r;
            const _x$3 = _Tree._0;
            const _x$4 = _Tree._1;
            const _x$5 = _Tree._3;
            if (_x$5.$tag === 1) {
              const _Tree$2 = _x$5;
              const _x$6 = _Tree$2._0;
              const _x$7 = _Tree$2._1;
              const _x$8 = _Tree$2._3;
              const _x$9 = _Tree$2._4;
              const _x$10 = _Tree._4;
              return moonbitlang$core$immut$sorted_map$$make_tree$21$(_x$6, _x$7, moonbitlang$core$immut$sorted_map$$make_tree$21$(key, value, l, _x$8), moonbitlang$core$immut$sorted_map$$make_tree$21$(_x$3, _x$4, _x$9, _x$10));
            } else {
              break _L;
            }
          } else {
            break _L;
          }
        }
        return moonbitlang$core$builtin$$abort$23$("double_l error");
      }
    } else {
      if (ln > (Math.imul(5, rn) | 0)) {
        let _bind;
        if (l.$tag === 1) {
          const _Tree = l;
          const _x = _Tree._3;
          const _x$2 = _Tree._4;
          _bind = { _0: _x, _1: _x$2 };
        } else {
          _bind = moonbitlang$core$builtin$$abort$22$("unreachable");
        }
        const _x = _bind._0;
        const _x$2 = _bind._1;
        const lln = moonbitlang$core$immut$sorted_map$$T$size$21$(_x);
        const lrn = moonbitlang$core$immut$sorted_map$$T$size$21$(_x$2);
        if (lrn < lln) {
          if (l.$tag === 1) {
            const _Tree = l;
            const _x$3 = _Tree._0;
            const _x$4 = _Tree._1;
            const _x$5 = _Tree._3;
            const _x$6 = _Tree._4;
            return moonbitlang$core$immut$sorted_map$$make_tree$21$(_x$3, _x$4, _x$5, moonbitlang$core$immut$sorted_map$$make_tree$21$(key, value, _x$6, r));
          } else {
            return moonbitlang$core$builtin$$abort$23$("single_r error");
          }
        } else {
          _L: {
            if (l.$tag === 1) {
              const _Tree = l;
              const _x$3 = _Tree._0;
              const _x$4 = _Tree._1;
              const _x$5 = _Tree._3;
              const _x$6 = _Tree._4;
              if (_x$6.$tag === 1) {
                const _Tree$2 = _x$6;
                const _x$7 = _Tree$2._0;
                const _x$8 = _Tree$2._1;
                const _x$9 = _Tree$2._3;
                const _x$10 = _Tree$2._4;
                return moonbitlang$core$immut$sorted_map$$make_tree$21$(_x$7, _x$8, moonbitlang$core$immut$sorted_map$$make_tree$21$(_x$3, _x$4, _x$5, _x$9), moonbitlang$core$immut$sorted_map$$make_tree$21$(key, value, _x$10, r));
              } else {
                break _L;
              }
            } else {
              break _L;
            }
          }
          return moonbitlang$core$builtin$$abort$23$("double_r error");
        }
      } else {
        return moonbitlang$core$immut$sorted_map$$make_tree$21$(key, value, l, r);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$T$singleton$21$(key, value) {
  return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$T$Tree$3$(key, value, 1, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$T$Empty$3$, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$T$Empty$3$);
}
function moonbitlang$core$immut$sorted_map$$T$add$21$(self, key, value) {
  if (self.$tag === 0) {
    return moonbitlang$core$immut$sorted_map$$T$singleton$21$(key, value);
  } else {
    const _Tree = self;
    const _x = _Tree._0;
    const _x$2 = _Tree._1;
    const _x$3 = _Tree._3;
    const _x$4 = _Tree._4;
    const _bind = $compare_int(key, _x);
    switch (_bind) {
      case -1: {
        return moonbitlang$core$immut$sorted_map$$balance$21$(_x, _x$2, moonbitlang$core$immut$sorted_map$$T$add$21$(_x$3, key, value), _x$4);
      }
      case 1: {
        return moonbitlang$core$immut$sorted_map$$balance$21$(_x, _x$2, _x$3, moonbitlang$core$immut$sorted_map$$T$add$21$(_x$4, key, value));
      }
      default: {
        return moonbitlang$core$immut$sorted_map$$make_tree$21$(_x, value, _x$3, _x$4);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$T$empty$21$() {
  return $64$moonbitlang$47$core$47$immut$47$sorted_map$46$T$Empty$3$;
}
function moonbitlang$core$immut$sorted_map$$T$lookup$21$(self, key) {
  let _tmp = self;
  while (true) {
    const _param = _tmp;
    if (_param.$tag === 0) {
      return undefined;
    } else {
      const _Tree = _param;
      const _x = _Tree._0;
      const _x$2 = _Tree._1;
      const _x$3 = _Tree._3;
      const _x$4 = _Tree._4;
      const c = $compare_int(key, _x);
      if (c === 0) {
        return _x$2;
      } else {
        if (c < 0) {
          _tmp = _x$3;
          continue;
        } else {
          _tmp = _x$4;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$T$op_get$21$(self, key) {
  return moonbitlang$core$immut$sorted_map$$T$lookup$21$(self, key);
}
function moonbitlang$core$sorted_map$$new_node$24$(key, value) {
  return { key: key, value: value, left: undefined, right: undefined, height: 1 };
}
function moonbitlang$core$sorted_map$$new_node$25$(key, value) {
  return { key: key, value: value, left: undefined, right: undefined, height: 1 };
}
function moonbitlang$core$sorted_map$$Node$op_equal$24$(self, other) {
  return moonbitlang$core$array$$Array$op_equal$10$(self.key, other.key);
}
function moonbitlang$core$sorted_map$$Node$op_equal$25$(self, other) {
  return moonbitlang$core$array$$Array$op_equal$7$(self.key, other.key);
}
function moonbitlang$core$sorted_map$$max(x, y) {
  return x > y ? x : y;
}
function moonbitlang$core$sorted_map$$height$24$(node) {
  if (node === undefined) {
    return 0;
  } else {
    const _Some = node;
    const _x = _Some;
    return _x.height;
  }
}
function moonbitlang$core$sorted_map$$height$25$(node) {
  if (node === undefined) {
    return 0;
  } else {
    const _Some = node;
    const _x = _Some;
    return _x.height;
  }
}
function moonbitlang$core$sorted_map$$Node$update_height$24$(self) {
  self.height = 1 + moonbitlang$core$sorted_map$$max(moonbitlang$core$sorted_map$$height$24$(self.left), moonbitlang$core$sorted_map$$height$24$(self.right)) | 0;
}
function moonbitlang$core$sorted_map$$Node$update_height$25$(self) {
  self.height = 1 + moonbitlang$core$sorted_map$$max(moonbitlang$core$sorted_map$$height$25$(self.left), moonbitlang$core$sorted_map$$height$25$(self.right)) | 0;
}
function moonbitlang$core$sorted_map$$rotate_l$24$(n) {
  const r = moonbitlang$core$option$$Option$unwrap$26$(n.right);
  n.right = r.left;
  r.left = n;
  moonbitlang$core$sorted_map$$Node$update_height$24$(n);
  moonbitlang$core$sorted_map$$Node$update_height$24$(r);
  return r;
}
function moonbitlang$core$sorted_map$$rotate_l$25$(n) {
  const r = moonbitlang$core$option$$Option$unwrap$27$(n.right);
  n.right = r.left;
  r.left = n;
  moonbitlang$core$sorted_map$$Node$update_height$25$(n);
  moonbitlang$core$sorted_map$$Node$update_height$25$(r);
  return r;
}
function moonbitlang$core$sorted_map$$rotate_r$24$(n) {
  const l = moonbitlang$core$option$$Option$unwrap$26$(n.left);
  n.left = l.right;
  l.right = n;
  moonbitlang$core$sorted_map$$Node$update_height$24$(n);
  moonbitlang$core$sorted_map$$Node$update_height$24$(l);
  return l;
}
function moonbitlang$core$sorted_map$$rotate_r$25$(n) {
  const l = moonbitlang$core$option$$Option$unwrap$27$(n.left);
  n.left = l.right;
  l.right = n;
  moonbitlang$core$sorted_map$$Node$update_height$25$(n);
  moonbitlang$core$sorted_map$$Node$update_height$25$(l);
  return l;
}
function moonbitlang$core$sorted_map$$rotate_rl$24$(n) {
  const r = moonbitlang$core$option$$Option$unwrap$26$(n.right);
  const v = moonbitlang$core$sorted_map$$rotate_r$24$(r);
  n.right = v;
  return moonbitlang$core$sorted_map$$rotate_l$24$(n);
}
function moonbitlang$core$sorted_map$$rotate_rl$25$(n) {
  const r = moonbitlang$core$option$$Option$unwrap$27$(n.right);
  const v = moonbitlang$core$sorted_map$$rotate_r$25$(r);
  n.right = v;
  return moonbitlang$core$sorted_map$$rotate_l$25$(n);
}
function moonbitlang$core$sorted_map$$height_ge$24$(x1, x2) {
  if (x2 === undefined) {
    return true;
  } else {
    const _Some = x2;
    const _x = _Some;
    if (x1 === undefined) {
      return false;
    } else {
      const _Some$2 = x1;
      const _x$2 = _Some$2;
      return _x$2.height >= _x.height;
    }
  }
}
function moonbitlang$core$sorted_map$$height_ge$25$(x1, x2) {
  if (x2 === undefined) {
    return true;
  } else {
    const _Some = x2;
    const _x = _Some;
    if (x1 === undefined) {
      return false;
    } else {
      const _Some$2 = x1;
      const _x$2 = _Some$2;
      return _x$2.height >= _x.height;
    }
  }
}
function moonbitlang$core$sorted_map$$rotate_lr$24$(n) {
  const l = moonbitlang$core$option$$Option$unwrap$26$(n.left);
  const v = moonbitlang$core$sorted_map$$rotate_l$24$(l);
  n.left = v;
  return moonbitlang$core$sorted_map$$rotate_r$24$(n);
}
function moonbitlang$core$sorted_map$$rotate_lr$25$(n) {
  const l = moonbitlang$core$option$$Option$unwrap$27$(n.left);
  const v = moonbitlang$core$sorted_map$$rotate_l$25$(l);
  n.left = v;
  return moonbitlang$core$sorted_map$$rotate_r$25$(n);
}
function moonbitlang$core$sorted_map$$balance$24$(root) {
  const l = root.left;
  const r = root.right;
  const hl = moonbitlang$core$sorted_map$$height$24$(l);
  const hr = moonbitlang$core$sorted_map$$height$24$(r);
  let new_root;
  if (hl > (hr + 1 | 0)) {
    const _bind = moonbitlang$core$option$$Option$unwrap$26$(l);
    const _x = _bind.left;
    const _x$2 = _bind.right;
    new_root = moonbitlang$core$sorted_map$$height_ge$24$(_x, _x$2) ? moonbitlang$core$sorted_map$$rotate_r$24$(root) : moonbitlang$core$sorted_map$$rotate_lr$24$(root);
  } else {
    if (hr > (hl + 1 | 0)) {
      const _bind = moonbitlang$core$option$$Option$unwrap$26$(r);
      const _x = _bind.left;
      const _x$2 = _bind.right;
      new_root = moonbitlang$core$sorted_map$$height_ge$24$(_x$2, _x) ? moonbitlang$core$sorted_map$$rotate_l$24$(root) : moonbitlang$core$sorted_map$$rotate_rl$24$(root);
    } else {
      new_root = root;
    }
  }
  moonbitlang$core$sorted_map$$Node$update_height$24$(new_root);
  return new_root;
}
function moonbitlang$core$sorted_map$$balance$25$(root) {
  const l = root.left;
  const r = root.right;
  const hl = moonbitlang$core$sorted_map$$height$25$(l);
  const hr = moonbitlang$core$sorted_map$$height$25$(r);
  let new_root;
  if (hl > (hr + 1 | 0)) {
    const _bind = moonbitlang$core$option$$Option$unwrap$27$(l);
    const _x = _bind.left;
    const _x$2 = _bind.right;
    new_root = moonbitlang$core$sorted_map$$height_ge$25$(_x, _x$2) ? moonbitlang$core$sorted_map$$rotate_r$25$(root) : moonbitlang$core$sorted_map$$rotate_lr$25$(root);
  } else {
    if (hr > (hl + 1 | 0)) {
      const _bind = moonbitlang$core$option$$Option$unwrap$27$(r);
      const _x = _bind.left;
      const _x$2 = _bind.right;
      new_root = moonbitlang$core$sorted_map$$height_ge$25$(_x$2, _x) ? moonbitlang$core$sorted_map$$rotate_l$25$(root) : moonbitlang$core$sorted_map$$rotate_rl$25$(root);
    } else {
      new_root = root;
    }
  }
  moonbitlang$core$sorted_map$$Node$update_height$25$(new_root);
  return new_root;
}
function moonbitlang$core$sorted_map$$add_node$24$(root, key, value) {
  if (root === undefined) {
    return { _0: moonbitlang$core$sorted_map$$new_node$24$(key, value), _1: true };
  } else {
    const _Some = root;
    const _x = _Some;
    if (moonbitlang$core$array$$Array$op_equal$10$(key, _x.key)) {
      _x.value = value;
      return { _0: _x, _1: false };
    } else {
      const l = _x.left;
      const r = _x.right;
      if (moonbitlang$core$builtin$$op_lt$28$(key, _x.key)) {
        const _bind = moonbitlang$core$sorted_map$$add_node$24$(l, key, value);
        const _x$2 = _bind._0;
        const _x$3 = _bind._1;
        _x.left = _x$2;
        return { _0: moonbitlang$core$sorted_map$$balance$24$(_x), _1: _x$3 };
      } else {
        const _bind = moonbitlang$core$sorted_map$$add_node$24$(r, key, value);
        const _x$2 = _bind._0;
        const _x$3 = _bind._1;
        _x.right = _x$2;
        return { _0: moonbitlang$core$sorted_map$$balance$24$(_x), _1: _x$3 };
      }
    }
  }
}
function moonbitlang$core$sorted_map$$add_node$25$(root, key, value) {
  if (root === undefined) {
    return { _0: moonbitlang$core$sorted_map$$new_node$25$(key, value), _1: true };
  } else {
    const _Some = root;
    const _x = _Some;
    if (moonbitlang$core$array$$Array$op_equal$7$(key, _x.key)) {
      _x.value = value;
      return { _0: _x, _1: false };
    } else {
      const l = _x.left;
      const r = _x.right;
      if (moonbitlang$core$builtin$$op_lt$10$(key, _x.key)) {
        const _bind = moonbitlang$core$sorted_map$$add_node$25$(l, key, value);
        const _x$2 = _bind._0;
        const _x$3 = _bind._1;
        _x.left = _x$2;
        return { _0: moonbitlang$core$sorted_map$$balance$25$(_x), _1: _x$3 };
      } else {
        const _bind = moonbitlang$core$sorted_map$$add_node$25$(r, key, value);
        const _x$2 = _bind._0;
        const _x$3 = _bind._1;
        _x.right = _x$2;
        return { _0: moonbitlang$core$sorted_map$$balance$25$(_x), _1: _x$3 };
      }
    }
  }
}
function moonbitlang$core$sorted_map$$T$add$24$(self, key, value) {
  const _bind = moonbitlang$core$sorted_map$$add_node$24$(self.root, key, value);
  const _x = _bind._0;
  const _x$2 = _bind._1;
  if (moonbitlang$core$builtin$$op_notequal$29$(self.root, _x)) {
    self.root = _x;
  }
  if (_x$2) {
    self.size = self.size + 1 | 0;
    return;
  } else {
    return;
  }
}
function moonbitlang$core$sorted_map$$T$add$25$(self, key, value) {
  const _bind = moonbitlang$core$sorted_map$$add_node$25$(self.root, key, value);
  const _x = _bind._0;
  const _x$2 = _bind._1;
  if (moonbitlang$core$builtin$$op_notequal$30$(self.root, _x)) {
    self.root = _x;
  }
  if (_x$2) {
    self.size = self.size + 1 | 0;
    return;
  } else {
    return;
  }
}
function moonbitlang$core$sorted_map$$T$op_set$24$(self, key, value) {
  moonbitlang$core$sorted_map$$T$add$24$(self, key, value);
}
function moonbitlang$core$sorted_map$$T$op_set$25$(self, key, value) {
  moonbitlang$core$sorted_map$$T$add$25$(self, key, value);
}
function moonbitlang$core$sorted_map$$T$get$24$(self, key) {
  let _tmp = self.root;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return undefined;
    } else {
      const _Some = _param;
      const _x = _Some;
      const cmp = moonbitlang$core$array$$Array$compare$10$(key, _x.key);
      if (cmp === 0) {
        return _x.value;
      } else {
        if (cmp > 0) {
          _tmp = _x.right;
          continue;
        } else {
          _tmp = _x.left;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$sorted_map$$T$get$25$(self, key) {
  let _tmp = self.root;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return undefined;
    } else {
      const _Some = _param;
      const _x = _Some;
      const cmp = moonbitlang$core$array$$Array$compare$7$(key, _x.key);
      if (cmp === 0) {
        return _x.value;
      } else {
        if (cmp > 0) {
          _tmp = _x.right;
          continue;
        } else {
          _tmp = _x.left;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$sorted_map$$T$op_get$24$(self, key) {
  return moonbitlang$core$sorted_map$$T$get$24$(self, key);
}
function moonbitlang$core$sorted_map$$T$op_get$25$(self, key) {
  return moonbitlang$core$sorted_map$$T$get$25$(self, key);
}
function moonbitlang$core$sorted_map$$new$24$() {
  return { root: undefined, size: 0 };
}
function moonbitlang$core$sorted_map$$new$25$() {
  return { root: undefined, size: 0 };
}
function moonbitlang$core$sorted_map$$iter_aux2$24$(node) {
  return moonbitlang$core$builtin$$Iter2$new$24$((yield_) => {
    if (node === undefined) {
      return 1;
    } else {
      const _Some = node;
      const _x = _Some;
      return moonbitlang$core$builtin$$Eq$op_equal$17$(moonbitlang$core$builtin$$Iter2$run$24$(moonbitlang$core$sorted_map$$iter_aux2$24$(_x.left), yield_), 0) ? 0 : moonbitlang$core$builtin$$Eq$op_equal$17$(yield_(_x.key, _x.value), 0) ? 0 : moonbitlang$core$builtin$$Eq$op_equal$17$(moonbitlang$core$builtin$$Iter2$run$24$(moonbitlang$core$sorted_map$$iter_aux2$24$(_x.right), yield_), 0) ? 0 : 1;
    }
  });
}
function moonbitlang$core$sorted_map$$iter_aux2$25$(node) {
  return moonbitlang$core$builtin$$Iter2$new$25$((yield_) => {
    if (node === undefined) {
      return 1;
    } else {
      const _Some = node;
      const _x = _Some;
      return moonbitlang$core$builtin$$Eq$op_equal$17$(moonbitlang$core$builtin$$Iter2$run$25$(moonbitlang$core$sorted_map$$iter_aux2$25$(_x.left), yield_), 0) ? 0 : moonbitlang$core$builtin$$Eq$op_equal$17$(yield_(_x.key, _x.value), 0) ? 0 : moonbitlang$core$builtin$$Eq$op_equal$17$(moonbitlang$core$builtin$$Iter2$run$25$(moonbitlang$core$sorted_map$$iter_aux2$25$(_x.right), yield_), 0) ? 0 : 1;
    }
  });
}
function moonbitlang$core$sorted_map$$T$iter2$25$(self) {
  return moonbitlang$core$sorted_map$$iter_aux2$25$(self.root);
}
function moonbitlang$core$sorted_map$$T$iter2$24$(self) {
  return moonbitlang$core$sorted_map$$iter_aux2$24$(self.root);
}
function moonbitlang$core$math$$minimum$7$(x, y) {
  return x > y ? y : x;
}
function moonbitlang$core$option$$when$31$(condition, value) {
  return condition ? value() : undefined;
}
function moonbitlang$core$option$$unless$31$(condition, value) {
  return moonbitlang$core$option$$when$31$(!condition, value);
}
function moonbitlang$core$option$$Option$map$32$(self, f) {
  if (self === undefined) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$map$33$(self, f) {
  if (self === undefined) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$map$34$(self, f) {
  if (self === undefined) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$map$35$(self, f) {
  if (self === undefined) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$map$36$(self, f) {
  if (self === undefined) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$map$37$(self, f) {
  if (self === undefined) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$map$38$(self, f) {
  if (self === undefined) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$map$39$(self, f) {
  if (self === undefined) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$map$40$(self, f) {
  if (self === undefined) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$map$41$(self, f) {
  if (self === -1) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$bind$32$(self, f) {
  if (self === undefined) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$bind$36$(self, f) {
  if (self === undefined) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$bind$42$(self, f) {
  if (self === undefined) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$bind$43$(self, f) {
  if (self === undefined) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$bind$38$(self, f) {
  if (self === undefined) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$bind$39$(self, f) {
  if (self === undefined) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$bind$41$(self, f) {
  if (self === -1) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$bind$40$(self, f) {
  if (self === undefined) {
    return undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    return f(_x);
  }
}
function moonbitlang$core$option$$Option$is_empty$12$(self) {
  return self === undefined;
}
function moonbitlang$core$option$$Option$is_empty$20$(self) {
  return self === undefined;
}
function moonbitlang$core$option$$Option$is_empty$7$(self) {
  return self === undefined;
}
function moonbitlang$core$option$$Option$or$44$(self, default_) {
  if (self === undefined) {
    return default_;
  } else {
    const _Some = self;
    const _x = _Some;
    return _x;
  }
}
function moonbitlang$core$option$$Option$or_else$6$(self, default_) {
  if (self === undefined) {
    return default_();
  } else {
    const _Some = self;
    const _x = _Some;
    return _x;
  }
}
function moonbitlang$core$bool$$Bool$to_int(self) {
  return self ? 1 : 0;
}
function moonbitlang$core$queue$$T$new$7$() {
  return { length: 0, first: $64$moonbitlang$47$core$47$queue$46$Cell$Nil$4$, last: $64$moonbitlang$47$core$47$queue$46$Cell$Nil$4$ };
}
function moonbitlang$core$queue$$T$new$6$() {
  return { length: 0, first: $64$moonbitlang$47$core$47$queue$46$Cell$Nil$5$, last: $64$moonbitlang$47$core$47$queue$46$Cell$Nil$5$ };
}
function moonbitlang$core$queue$$T$from_array$7$(arr) {
  if (arr.length === 0) {
    return moonbitlang$core$queue$$T$new$7$();
  }
  const queue = moonbitlang$core$queue$$T$new$7$();
  queue.length = arr.length;
  queue.last = new $64$moonbitlang$47$core$47$queue$46$Cell$Cons$4$({ content: moonbitlang$core$array$$Array$op_get$7$(arr, queue.length - 1 | 0), next: $64$moonbitlang$47$core$47$queue$46$Cell$Nil$4$ });
  queue.first = queue.last;
  let _tmp = arr.length - 2 | 0;
  while (true) {
    const i = _tmp;
    if (i >= 0) {
      queue.first = new $64$moonbitlang$47$core$47$queue$46$Cell$Cons$4$({ content: moonbitlang$core$array$$Array$op_get$7$(arr, i), next: queue.first });
      _tmp = i - 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return queue;
}
function moonbitlang$core$queue$$T$clear$7$(self) {
  self.length = 0;
  self.first = $64$moonbitlang$47$core$47$queue$46$Cell$Nil$4$;
  self.last = $64$moonbitlang$47$core$47$queue$46$Cell$Nil$4$;
}
function moonbitlang$core$queue$$T$clear$6$(self) {
  self.length = 0;
  self.first = $64$moonbitlang$47$core$47$queue$46$Cell$Nil$5$;
  self.last = $64$moonbitlang$47$core$47$queue$46$Cell$Nil$5$;
}
function moonbitlang$core$queue$$T$is_empty$7$(self) {
  return self.length === 0;
}
function moonbitlang$core$queue$$T$is_empty$6$(self) {
  return self.length === 0;
}
function moonbitlang$core$queue$$T$push$7$(self, x) {
  const cell = new $64$moonbitlang$47$core$47$queue$46$Cell$Cons$4$({ content: x, next: $64$moonbitlang$47$core$47$queue$46$Cell$Nil$4$ });
  const _bind = self.last;
  if (_bind.$tag === 0) {
    self.length = 1;
    self.first = cell;
    self.last = cell;
    return;
  } else {
    const _Cons = _bind;
    const _x = _Cons._0;
    _x.next = cell;
    self.length = self.length + 1 | 0;
    self.last = cell;
    return;
  }
}
function moonbitlang$core$queue$$T$push$6$(self, x) {
  const cell = new $64$moonbitlang$47$core$47$queue$46$Cell$Cons$5$({ content: x, next: $64$moonbitlang$47$core$47$queue$46$Cell$Nil$5$ });
  const _bind = self.last;
  if (_bind.$tag === 0) {
    self.length = 1;
    self.first = cell;
    self.last = cell;
    return;
  } else {
    const _Cons = _bind;
    const _x = _Cons._0;
    _x.next = cell;
    self.length = self.length + 1 | 0;
    self.last = cell;
    return;
  }
}
function moonbitlang$core$queue$$T$unsafe_pop$6$(self) {
  const _bind = self.first;
  if (_bind.$tag === 0) {
    return moonbitlang$core$builtin$$abort$6$("Queue is empty");
  } else {
    const _Cons = _bind;
    const _x = _Cons._0;
    const _x$2 = _x.content;
    const _x$3 = _x.next;
    if (_x$3.$tag === 0) {
      moonbitlang$core$queue$$T$clear$6$(self);
      return _x$2;
    } else {
      self.length = self.length - 1 | 0;
      self.first = _x$3;
      return _x$2;
    }
  }
}
function moonbitlang$core$queue$$T$unsafe_pop$7$(self) {
  const _bind = self.first;
  if (_bind.$tag === 0) {
    return moonbitlang$core$builtin$$abort$7$("Queue is empty");
  } else {
    const _Cons = _bind;
    const _x = _Cons._0;
    const _x$2 = _x.content;
    const _x$3 = _x.next;
    if (_x$3.$tag === 0) {
      moonbitlang$core$queue$$T$clear$7$(self);
      return _x$2;
    } else {
      self.length = self.length - 1 | 0;
      self.first = _x$3;
      return _x$2;
    }
  }
}
function moonbitlang$core$queue$$T$pop$6$(self) {
  return self.length === 0 ? undefined : moonbitlang$core$queue$$T$unsafe_pop$6$(self);
}
function moonbitlang$core$builtin$$abort$45$(msg) {
  return $panic();
}
function moonbitlang$core$builtin$$abort$6$(msg) {
  return $panic();
}
function moonbitlang$core$builtin$$abort$23$(msg) {
  return $panic();
}
function moonbitlang$core$builtin$$abort$22$(msg) {
  return $panic();
}
function moonbitlang$core$builtin$$abort$7$(msg) {
  return $panic();
}
function moonbitlang$core$builtin$$abort$2$(msg) {
  return $panic();
}
function moonbitlang$core$builtin$$abort$46$(msg) {
  return $panic();
}
function moonbitlang$core$builtin$$abort$47$(msg) {
  return $panic();
}
function moonbitlang$core$builtin$$abort$48$(msg) {
  return $panic();
}
function moonbitlang$core$builtin$$abort$49$(msg) {
  $panic();
}
function moonbitlang$core$builtin$$abort$3$(msg) {
  return $panic();
}
function moonbitlang$core$builtin$$rotl(x, r) {
  return x << r | (x >>> (32 - r | 0) | 0);
}
function moonbitlang$core$builtin$$op_ge$3$(self_, other) {
  return moonbitlang$core$string$$String$compare(self_, other) >= 0;
}
function moonbitlang$core$builtin$$StringBuilder$to_string(self) {
  return self.val;
}
function moonbitlang$core$builtin$$StringBuilder$new(size_hint) {
  return { val: "" };
}
function moonbitlang$core$builtin$$StringBuilder$new$46$size_hint$46$default() {
  return 0;
}
function moonbitlang$core$builtin$$op_notequal$9$(x, y) {
  return !moonbitlang$core$option$$Option$op_equal$7$(x, y);
}
function moonbitlang$core$builtin$$op_notequal$13$(x, y) {
  return !moonbitlang$core$option$$Option$op_equal$12$(x, y);
}
function moonbitlang$core$builtin$$op_notequal$10$(x, y) {
  return !moonbitlang$core$array$$Array$op_equal$7$(x, y);
}
function moonbitlang$core$builtin$$op_notequal$20$(x, y) {
  return !moonbitlang$core$builtin$$Eq$op_equal$20$(x, y);
}
function moonbitlang$core$builtin$$op_notequal$50$(x, y) {
  return !moonbitlang$core$option$$Option$op_equal$45$(x, y);
}
function moonbitlang$core$builtin$$op_notequal$29$(x, y) {
  return !moonbitlang$core$option$$Option$op_equal$26$(x, y);
}
function moonbitlang$core$builtin$$op_notequal$30$(x, y) {
  return !moonbitlang$core$option$$Option$op_equal$27$(x, y);
}
function moonbitlang$core$builtin$$op_notequal$51$(x, y) {
  return !moonbitlang$core$tuple$$Tuple2$op_equal$52$(x, y);
}
function moonbitlang$core$builtin$$op_notequal$53$(x, y) {
  return !moonbitlang$core$option$$Option$op_equal$2$(x, y);
}
function moonbitlang$core$builtin$$op_notequal$3$(x, y) {
  return !(x === y);
}
function moonbitlang$core$builtin$$println$3$(input) {
  console.log(moonbitlang$core$builtin$$Show$to_string$3$(input));
}
function moonbitlang$core$builtin$$op_lt$3$(self_, other) {
  return moonbitlang$core$string$$String$compare(self_, other) < 0;
}
function moonbitlang$core$builtin$$op_lt$28$(self_, other) {
  return moonbitlang$core$array$$Array$compare$10$(self_, other) < 0;
}
function moonbitlang$core$builtin$$op_lt$10$(self_, other) {
  return moonbitlang$core$array$$Array$compare$7$(self_, other) < 0;
}
function moonbitlang$core$builtin$$StringBuilder$write_char(self, ch) {
  const _bind = self;
  _bind.val = `${_bind.val}${String.fromCodePoint(ch)}`;
}
function moonbitlang$core$builtin$$MyInt64$add_hi_lo(self, bhi, blo) {
  const _x = self.hi;
  const _x$2 = self.lo;
  const lo = _x$2 + blo | 0;
  const s = lo >> 31;
  const as_ = _x$2 >> 31;
  const bs = blo >> 31;
  const c = (as_ & bs | ~s & (as_ ^ bs)) & 1;
  const hi = (_x + bhi | 0) + c | 0;
  return { hi: hi, lo: lo };
}
function moonbitlang$core$builtin$$to_string$46$write_digits$54$(buf, num) {
  const num2 = num / 10 | 0;
  if (num2 !== 0) {
    moonbitlang$core$builtin$$to_string$46$write_digits$54$(buf, num2);
  }
  const n = num % 10 | 0;
  moonbitlang$core$builtin$$StringBuilder$write_char(buf, (n < 0 ? 0 - n | 0 : n) + 48 | 0);
}
function moonbitlang$core$int$$Int$to_string(self) {
  const buf = moonbitlang$core$builtin$$StringBuilder$new(moonbitlang$core$builtin$$StringBuilder$new$46$size_hint$46$default());
  if (self < 0) {
    moonbitlang$core$builtin$$StringBuilder$write_char(buf, 45);
  }
  moonbitlang$core$builtin$$to_string$46$write_digits$54$(buf, self);
  return moonbitlang$core$builtin$$StringBuilder$to_string(buf);
}
function moonbitlang$core$builtin$$StringBuilder$write_string(self, str) {
  const _bind = self;
  _bind.val = `${_bind.val}${str}`;
}
function moonbitlang$core$array$$Array$op_get$16$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$18$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$55$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$56$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$57$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$11$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$58$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$59$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$7$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$9$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$60$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$61$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$5$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$62$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$63$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$64$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$65$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$2$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$8$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$66$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$67$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$68$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$69$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$3$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$10$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$70$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$array$$Array$op_get$71$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : $panic();
}
function moonbitlang$core$builtin$$op_gt$3$(self_, other) {
  return moonbitlang$core$string$$String$compare(self_, other) > 0;
}
function moonbitlang$core$tuple$$Tuple2$op_equal$52$(self, other) {
  return self._0 === other._0 && moonbitlang$core$array$$Array$op_equal$10$(self._1, other._1);
}
function moonbitlang$core$builtin$$Logger$write_object$64$(self, obj) {
  moonbitlang$core$builtin$$Show$output$72$(obj, self);
}
function moonbitlang$core$builtin$$Logger$write_object$55$(self, obj) {
  moonbitlang$core$builtin$$Show$output$73$(obj, self);
}
function moonbitlang$core$builtin$$Logger$write_object$74$(self, obj) {
  moonbitlang$core$builtin$$Show$output$75$(obj, self);
}
function moonbitlang$core$builtin$$Logger$write_object$76$(self, obj) {
  moonbitlang$core$builtin$$Show$output$77$(obj, self);
}
function moonbitlang$core$builtin$$Logger$write_object$7$(self, obj) {
  moonbitlang$core$builtin$$Show$output$7$(obj, self);
}
function moonbitlang$core$builtin$$Logger$write_object$11$(self, obj) {
  moonbitlang$core$builtin$$Show$output$78$(obj, self);
}
function moonbitlang$core$builtin$$Show$output$72$(self, logger) {
  const _x = self._0;
  const _x$2 = self._1;
  logger.method_0(logger.self, "(");
  moonbitlang$core$builtin$$Logger$write_object$7$(logger, _x);
  logger.method_0(logger.self, ", ");
  moonbitlang$core$builtin$$Logger$write_object$7$(logger, _x$2);
  logger.method_0(logger.self, ")");
}
function moonbitlang$core$builtin$$Show$output$73$(self, logger) {
  const _x = self._0;
  const _x$2 = self._1;
  logger.method_0(logger.self, "(");
  moonbitlang$core$builtin$$Logger$write_object$64$(logger, _x);
  logger.method_0(logger.self, ", ");
  moonbitlang$core$builtin$$Logger$write_object$64$(logger, _x$2);
  logger.method_0(logger.self, ")");
}
function moonbitlang$core$builtin$$Show$output$77$(self, logger) {
  const _x = self._0;
  const _x$2 = self._1;
  logger.method_0(logger.self, "(");
  moonbitlang$core$builtin$$Logger$write_object$7$(logger, _x);
  logger.method_0(logger.self, ", ");
  moonbitlang$core$builtin$$Logger$write_object$74$(logger, _x$2);
  logger.method_0(logger.self, ")");
}
function moonbitlang$core$string$$String$substring(self, start, end) {
  return start >= 0 && (start <= end && end <= self.length) ? self.substring(start, end) : $panic();
}
function moonbitlang$core$builtin$$MyInt64$op_add(self, other) {
  return moonbitlang$core$builtin$$MyInt64$add_hi_lo(self, other.hi, other.lo);
}
function moonbitlang$core$int64$$Int64$op_add(self, other) {
  return moonbitlang$core$builtin$$MyInt64$op_add(self, other);
}
function moonbitlang$core$builtin$$StringBuilder$write_substring(self, str, start, len) {
  const _bind = self;
  _bind.val = `${_bind.val}${moonbitlang$core$string$$String$substring(str, start, start + len | 0)}`;
}
function moonbitlang$core$builtin$$Hasher$combine$9$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$79$(value, self);
}
function moonbitlang$core$builtin$$Hasher$combine$80$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$80$(value, self);
}
function moonbitlang$core$builtin$$Hasher$combine$7$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$7$(value, self);
}
function moonbitlang$core$builtin$$Hasher$combine$20$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$20$(value, self);
}
function moonbitlang$core$builtin$$Hasher$combine$6$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$19$(value, self);
}
function moonbitlang$core$builtin$$Hasher$combine$3$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$3$(value, self);
}
function moonbitlang$core$builtin$$power_2_above(x, n) {
  let _tmp = x;
  while (true) {
    const i = _tmp;
    if (i >= n) {
      return i;
    }
    const next = i << 1;
    if (next < 0) {
      return i;
    }
    _tmp = next;
    continue;
  }
}
function moonbitlang$core$builtin$$calc_grow_threshold(capacity) {
  return (Math.imul(capacity, 13) | 0) / 16 | 0;
}
function moonbitlang$core$builtin$$Map$new$14$(capacity) {
  const capacity$2 = moonbitlang$core$builtin$$power_2_above(8, capacity);
  return { entries: $make_array_len_and_init(capacity$2, undefined), list: $make_array_len_and_init(capacity$2, { prev: undefined, next: undefined }), size: 0, capacity: capacity$2, capacity_mask: capacity$2 - 1 | 0, growAt: moonbitlang$core$builtin$$calc_grow_threshold(capacity$2), head: undefined, tail: undefined };
}
function moonbitlang$core$builtin$$Map$new$33$(capacity) {
  const capacity$2 = moonbitlang$core$builtin$$power_2_above(8, capacity);
  return { entries: $make_array_len_and_init(capacity$2, undefined), list: $make_array_len_and_init(capacity$2, { prev: undefined, next: undefined }), size: 0, capacity: capacity$2, capacity_mask: capacity$2 - 1 | 0, growAt: moonbitlang$core$builtin$$calc_grow_threshold(capacity$2), head: undefined, tail: undefined };
}
function moonbitlang$core$builtin$$Map$new$81$(capacity) {
  const capacity$2 = moonbitlang$core$builtin$$power_2_above(8, capacity);
  return { entries: $make_array_len_and_init(capacity$2, undefined), list: $make_array_len_and_init(capacity$2, { prev: undefined, next: undefined }), size: 0, capacity: capacity$2, capacity_mask: capacity$2 - 1 | 0, growAt: moonbitlang$core$builtin$$calc_grow_threshold(capacity$2), head: undefined, tail: undefined };
}
function moonbitlang$core$builtin$$Map$new$82$(capacity) {
  const capacity$2 = moonbitlang$core$builtin$$power_2_above(8, capacity);
  return { entries: $make_array_len_and_init(capacity$2, undefined), list: $make_array_len_and_init(capacity$2, { prev: undefined, next: undefined }), size: 0, capacity: capacity$2, capacity_mask: capacity$2 - 1 | 0, growAt: moonbitlang$core$builtin$$calc_grow_threshold(capacity$2), head: undefined, tail: undefined };
}
function moonbitlang$core$builtin$$Map$new$83$(capacity) {
  const capacity$2 = moonbitlang$core$builtin$$power_2_above(8, capacity);
  return { entries: $make_array_len_and_init(capacity$2, undefined), list: $make_array_len_and_init(capacity$2, { prev: undefined, next: undefined }), size: 0, capacity: capacity$2, capacity_mask: capacity$2 - 1 | 0, growAt: moonbitlang$core$builtin$$calc_grow_threshold(capacity$2), head: undefined, tail: undefined };
}
function moonbitlang$core$builtin$$Map$new$84$(capacity) {
  const capacity$2 = moonbitlang$core$builtin$$power_2_above(8, capacity);
  return { entries: $make_array_len_and_init(capacity$2, undefined), list: $make_array_len_and_init(capacity$2, { prev: undefined, next: undefined }), size: 0, capacity: capacity$2, capacity_mask: capacity$2 - 1 | 0, growAt: moonbitlang$core$builtin$$calc_grow_threshold(capacity$2), head: undefined, tail: undefined };
}
function moonbitlang$core$builtin$$Map$new$85$(capacity) {
  const capacity$2 = moonbitlang$core$builtin$$power_2_above(8, capacity);
  return { entries: $make_array_len_and_init(capacity$2, undefined), list: $make_array_len_and_init(capacity$2, { prev: undefined, next: undefined }), size: 0, capacity: capacity$2, capacity_mask: capacity$2 - 1 | 0, growAt: moonbitlang$core$builtin$$calc_grow_threshold(capacity$2), head: undefined, tail: undefined };
}
function moonbitlang$core$builtin$$Map$new$86$(capacity) {
  const capacity$2 = moonbitlang$core$builtin$$power_2_above(8, capacity);
  return { entries: $make_array_len_and_init(capacity$2, undefined), list: $make_array_len_and_init(capacity$2, { prev: undefined, next: undefined }), size: 0, capacity: capacity$2, capacity_mask: capacity$2 - 1 | 0, growAt: moonbitlang$core$builtin$$calc_grow_threshold(capacity$2), head: undefined, tail: undefined };
}
function moonbitlang$core$builtin$$Map$new$46$capacity$46$default$33$() {
  return 8;
}
function moonbitlang$core$builtin$$Map$new$46$capacity$46$default$81$() {
  return 8;
}
function moonbitlang$core$builtin$$Map$new$46$capacity$46$default$82$() {
  return 8;
}
function moonbitlang$core$builtin$$Map$new$46$capacity$46$default$83$() {
  return 8;
}
function moonbitlang$core$builtin$$Map$new$46$capacity$46$default$85$() {
  return 8;
}
function moonbitlang$core$builtin$$Map$new$46$capacity$46$default$86$() {
  return 8;
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$81$(self, entry) {
  const _bind = self.tail;
  if (_bind === undefined) {
    self.head = entry;
    self.tail = entry;
    return;
  } else {
    const _Some = _bind;
    const _x = _Some;
    self.list[_x.idx].next = entry;
    self.list[entry.idx].prev = _x;
    self.tail = entry;
    return;
  }
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$86$(self, entry) {
  const _bind = self.tail;
  if (_bind === undefined) {
    self.head = entry;
    self.tail = entry;
    return;
  } else {
    const _Some = _bind;
    const _x = _Some;
    self.list[_x.idx].next = entry;
    self.list[entry.idx].prev = _x;
    self.tail = entry;
    return;
  }
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$82$(self, entry) {
  const _bind = self.tail;
  if (_bind === undefined) {
    self.head = entry;
    self.tail = entry;
    return;
  } else {
    const _Some = _bind;
    const _x = _Some;
    self.list[_x.idx].next = entry;
    self.list[entry.idx].prev = _x;
    self.tail = entry;
    return;
  }
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$84$(self, entry) {
  const _bind = self.tail;
  if (_bind === undefined) {
    self.head = entry;
    self.tail = entry;
    return;
  } else {
    const _Some = _bind;
    const _x = _Some;
    self.list[_x.idx].next = entry;
    self.list[entry.idx].prev = _x;
    self.tail = entry;
    return;
  }
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$83$(self, entry) {
  const _bind = self.tail;
  if (_bind === undefined) {
    self.head = entry;
    self.tail = entry;
    return;
  } else {
    const _Some = _bind;
    const _x = _Some;
    self.list[_x.idx].next = entry;
    self.list[entry.idx].prev = _x;
    self.tail = entry;
    return;
  }
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$14$(self, entry) {
  const _bind = self.tail;
  if (_bind === undefined) {
    self.head = entry;
    self.tail = entry;
    return;
  } else {
    const _Some = _bind;
    const _x = _Some;
    self.list[_x.idx].next = entry;
    self.list[entry.idx].prev = _x;
    self.tail = entry;
    return;
  }
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$33$(self, entry) {
  const _bind = self.tail;
  if (_bind === undefined) {
    self.head = entry;
    self.tail = entry;
    return;
  } else {
    const _Some = _bind;
    const _x = _Some;
    self.list[_x.idx].next = entry;
    self.list[entry.idx].prev = _x;
    self.tail = entry;
    return;
  }
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$85$(self, entry) {
  const _bind = self.tail;
  if (_bind === undefined) {
    self.head = entry;
    self.tail = entry;
    return;
  } else {
    const _Some = _bind;
    const _x = _Some;
    self.list[_x.idx].next = entry;
    self.list[entry.idx].prev = _x;
    self.tail = entry;
    return;
  }
}
function moonbitlang$core$builtin$$Map$set$81$(self, key, value) {
  if (self.size >= self.growAt) {
    moonbitlang$core$builtin$$Map$grow$81$(self);
  }
  const hash = moonbitlang$core$builtin$$Hash$hash$87$(key);
  const insert_entry = { idx: -1, psl: 0, hash: hash, key: key, value: value };
  const list_node = { prev: undefined, next: undefined };
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  let _tmp$3 = insert_entry;
  let _tmp$4 = list_node;
  while (true) {
    const _param = _tmp;
    const _param$2 = _tmp$2;
    const _param$3 = _tmp$3;
    const _param$4 = _tmp$4;
    const _bind = self.entries[_param$2];
    if (_bind === undefined) {
      self.entries[_param$2] = _param$3;
      self.list[_param$2] = _param$4;
      _param$3.idx = _param$2;
      moonbitlang$core$builtin$$Map$add_entry_to_tail$81$(self, insert_entry);
      self.size = self.size + 1 | 0;
      return;
    } else {
      const _Some = _bind;
      const _x = _Some;
      const curr_node = self.list[_x.idx];
      if (_x.hash === _param$3.hash && moonbitlang$core$builtin$$Eq$op_equal$80$(_x.key, _param$3.key)) {
        _x.value = _param$3.value;
        break;
      }
      if (_param$3.psl > _x.psl) {
        self.entries[_param$2] = _param$3;
        self.list[_param$2] = _param$4;
        _param$3.idx = _param$2;
        _x.psl = _x.psl + 1 | 0;
        const _tmp$5 = _param + 1 | 0;
        const _tmp$6 = _param$2 + 1 & self.capacity_mask;
        _tmp = _tmp$5;
        _tmp$2 = _tmp$6;
        _tmp$3 = _x;
        _tmp$4 = curr_node;
        continue;
      } else {
        _param$3.psl = _param$3.psl + 1 | 0;
        const _tmp$5 = _param + 1 | 0;
        const _tmp$6 = _param$2 + 1 & self.capacity_mask;
        _tmp = _tmp$5;
        _tmp$2 = _tmp$6;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$set$82$(self, key, value) {
  if (self.size >= self.growAt) {
    moonbitlang$core$builtin$$Map$grow$82$(self);
  }
  const hash = moonbitlang$core$builtin$$Hash$hash$7$(key);
  const insert_entry = { idx: -1, psl: 0, hash: hash, key: key, value: value };
  const list_node = { prev: undefined, next: undefined };
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  let _tmp$3 = insert_entry;
  let _tmp$4 = list_node;
  while (true) {
    const _param = _tmp;
    const _param$2 = _tmp$2;
    const _param$3 = _tmp$3;
    const _param$4 = _tmp$4;
    const _bind = self.entries[_param$2];
    if (_bind === undefined) {
      self.entries[_param$2] = _param$3;
      self.list[_param$2] = _param$4;
      _param$3.idx = _param$2;
      moonbitlang$core$builtin$$Map$add_entry_to_tail$82$(self, insert_entry);
      self.size = self.size + 1 | 0;
      return;
    } else {
      const _Some = _bind;
      const _x = _Some;
      const curr_node = self.list[_x.idx];
      if (_x.hash === _param$3.hash && _x.key === _param$3.key) {
        _x.value = _param$3.value;
        break;
      }
      if (_param$3.psl > _x.psl) {
        self.entries[_param$2] = _param$3;
        self.list[_param$2] = _param$4;
        _param$3.idx = _param$2;
        _x.psl = _x.psl + 1 | 0;
        const _tmp$5 = _param + 1 | 0;
        const _tmp$6 = _param$2 + 1 & self.capacity_mask;
        _tmp = _tmp$5;
        _tmp$2 = _tmp$6;
        _tmp$3 = _x;
        _tmp$4 = curr_node;
        continue;
      } else {
        _param$3.psl = _param$3.psl + 1 | 0;
        const _tmp$5 = _param + 1 | 0;
        const _tmp$6 = _param$2 + 1 & self.capacity_mask;
        _tmp = _tmp$5;
        _tmp$2 = _tmp$6;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$set$86$(self, key, value) {
  if (self.size >= self.growAt) {
    moonbitlang$core$builtin$$Map$grow$86$(self);
  }
  const hash = moonbitlang$core$builtin$$Hash$hash$88$(key);
  const insert_entry = { idx: -1, psl: 0, hash: hash, key: key, value: value };
  const list_node = { prev: undefined, next: undefined };
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  let _tmp$3 = insert_entry;
  let _tmp$4 = list_node;
  while (true) {
    const _param = _tmp;
    const _param$2 = _tmp$2;
    const _param$3 = _tmp$3;
    const _param$4 = _tmp$4;
    const _bind = self.entries[_param$2];
    if (_bind === undefined) {
      self.entries[_param$2] = _param$3;
      self.list[_param$2] = _param$4;
      _param$3.idx = _param$2;
      moonbitlang$core$builtin$$Map$add_entry_to_tail$86$(self, insert_entry);
      self.size = self.size + 1 | 0;
      return;
    } else {
      const _Some = _bind;
      const _x = _Some;
      const curr_node = self.list[_x.idx];
      if (_x.hash === _param$3.hash && moonbitlang$core$builtin$$Eq$op_equal$19$(_x.key, _param$3.key)) {
        _x.value = _param$3.value;
        break;
      }
      if (_param$3.psl > _x.psl) {
        self.entries[_param$2] = _param$3;
        self.list[_param$2] = _param$4;
        _param$3.idx = _param$2;
        _x.psl = _x.psl + 1 | 0;
        const _tmp$5 = _param + 1 | 0;
        const _tmp$6 = _param$2 + 1 & self.capacity_mask;
        _tmp = _tmp$5;
        _tmp$2 = _tmp$6;
        _tmp$3 = _x;
        _tmp$4 = curr_node;
        continue;
      } else {
        _param$3.psl = _param$3.psl + 1 | 0;
        const _tmp$5 = _param + 1 | 0;
        const _tmp$6 = _param$2 + 1 & self.capacity_mask;
        _tmp = _tmp$5;
        _tmp$2 = _tmp$6;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$set$33$(self, key, value) {
  if (self.size >= self.growAt) {
    moonbitlang$core$builtin$$Map$grow$33$(self);
  }
  const hash = moonbitlang$core$builtin$$Hash$hash$7$(key);
  const insert_entry = { idx: -1, psl: 0, hash: hash, key: key, value: value };
  const list_node = { prev: undefined, next: undefined };
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  let _tmp$3 = insert_entry;
  let _tmp$4 = list_node;
  while (true) {
    const _param = _tmp;
    const _param$2 = _tmp$2;
    const _param$3 = _tmp$3;
    const _param$4 = _tmp$4;
    const _bind = self.entries[_param$2];
    if (_bind === undefined) {
      self.entries[_param$2] = _param$3;
      self.list[_param$2] = _param$4;
      _param$3.idx = _param$2;
      moonbitlang$core$builtin$$Map$add_entry_to_tail$33$(self, insert_entry);
      self.size = self.size + 1 | 0;
      return;
    } else {
      const _Some = _bind;
      const _x = _Some;
      const curr_node = self.list[_x.idx];
      if (_x.hash === _param$3.hash && _x.key === _param$3.key) {
        _x.value = _param$3.value;
        break;
      }
      if (_param$3.psl > _x.psl) {
        self.entries[_param$2] = _param$3;
        self.list[_param$2] = _param$4;
        _param$3.idx = _param$2;
        _x.psl = _x.psl + 1 | 0;
        const _tmp$5 = _param + 1 | 0;
        const _tmp$6 = _param$2 + 1 & self.capacity_mask;
        _tmp = _tmp$5;
        _tmp$2 = _tmp$6;
        _tmp$3 = _x;
        _tmp$4 = curr_node;
        continue;
      } else {
        _param$3.psl = _param$3.psl + 1 | 0;
        const _tmp$5 = _param + 1 | 0;
        const _tmp$6 = _param$2 + 1 & self.capacity_mask;
        _tmp = _tmp$5;
        _tmp$2 = _tmp$6;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$set$14$(self, key, value) {
  if (self.size >= self.growAt) {
    moonbitlang$core$builtin$$Map$grow$14$(self);
  }
  const hash = moonbitlang$core$builtin$$Hash$hash$7$(key);
  const insert_entry = { idx: -1, psl: 0, hash: hash, key: key, value: value };
  const list_node = { prev: undefined, next: undefined };
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  let _tmp$3 = insert_entry;
  let _tmp$4 = list_node;
  while (true) {
    const _param = _tmp;
    const _param$2 = _tmp$2;
    const _param$3 = _tmp$3;
    const _param$4 = _tmp$4;
    const _bind = self.entries[_param$2];
    if (_bind === undefined) {
      self.entries[_param$2] = _param$3;
      self.list[_param$2] = _param$4;
      _param$3.idx = _param$2;
      moonbitlang$core$builtin$$Map$add_entry_to_tail$14$(self, insert_entry);
      self.size = self.size + 1 | 0;
      return;
    } else {
      const _Some = _bind;
      const _x = _Some;
      const curr_node = self.list[_x.idx];
      if (_x.hash === _param$3.hash && _x.key === _param$3.key) {
        _x.value = _param$3.value;
        break;
      }
      if (_param$3.psl > _x.psl) {
        self.entries[_param$2] = _param$3;
        self.list[_param$2] = _param$4;
        _param$3.idx = _param$2;
        _x.psl = _x.psl + 1 | 0;
        const _tmp$5 = _param + 1 | 0;
        const _tmp$6 = _param$2 + 1 & self.capacity_mask;
        _tmp = _tmp$5;
        _tmp$2 = _tmp$6;
        _tmp$3 = _x;
        _tmp$4 = curr_node;
        continue;
      } else {
        _param$3.psl = _param$3.psl + 1 | 0;
        const _tmp$5 = _param + 1 | 0;
        const _tmp$6 = _param$2 + 1 & self.capacity_mask;
        _tmp = _tmp$5;
        _tmp$2 = _tmp$6;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$set$83$(self, key, value) {
  if (self.size >= self.growAt) {
    moonbitlang$core$builtin$$Map$grow$83$(self);
  }
  const hash = moonbitlang$core$builtin$$Hash$hash$2$(key);
  const insert_entry = { idx: -1, psl: 0, hash: hash, key: key, value: value };
  const list_node = { prev: undefined, next: undefined };
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  let _tmp$3 = insert_entry;
  let _tmp$4 = list_node;
  while (true) {
    const _param = _tmp;
    const _param$2 = _tmp$2;
    const _param$3 = _tmp$3;
    const _param$4 = _tmp$4;
    const _bind = self.entries[_param$2];
    if (_bind === undefined) {
      self.entries[_param$2] = _param$3;
      self.list[_param$2] = _param$4;
      _param$3.idx = _param$2;
      moonbitlang$core$builtin$$Map$add_entry_to_tail$83$(self, insert_entry);
      self.size = self.size + 1 | 0;
      return;
    } else {
      const _Some = _bind;
      const _x = _Some;
      const curr_node = self.list[_x.idx];
      if (_x.hash === _param$3.hash && _x.key === _param$3.key) {
        _x.value = _param$3.value;
        break;
      }
      if (_param$3.psl > _x.psl) {
        self.entries[_param$2] = _param$3;
        self.list[_param$2] = _param$4;
        _param$3.idx = _param$2;
        _x.psl = _x.psl + 1 | 0;
        const _tmp$5 = _param + 1 | 0;
        const _tmp$6 = _param$2 + 1 & self.capacity_mask;
        _tmp = _tmp$5;
        _tmp$2 = _tmp$6;
        _tmp$3 = _x;
        _tmp$4 = curr_node;
        continue;
      } else {
        _param$3.psl = _param$3.psl + 1 | 0;
        const _tmp$5 = _param + 1 | 0;
        const _tmp$6 = _param$2 + 1 & self.capacity_mask;
        _tmp = _tmp$5;
        _tmp$2 = _tmp$6;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$set$84$(self, key, value) {
  if (self.size >= self.growAt) {
    moonbitlang$core$builtin$$Map$grow$84$(self);
  }
  const hash = moonbitlang$core$builtin$$Hash$hash$89$(key);
  const insert_entry = { idx: -1, psl: 0, hash: hash, key: key, value: value };
  const list_node = { prev: undefined, next: undefined };
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  let _tmp$3 = insert_entry;
  let _tmp$4 = list_node;
  while (true) {
    const _param = _tmp;
    const _param$2 = _tmp$2;
    const _param$3 = _tmp$3;
    const _param$4 = _tmp$4;
    const _bind = self.entries[_param$2];
    if (_bind === undefined) {
      self.entries[_param$2] = _param$3;
      self.list[_param$2] = _param$4;
      _param$3.idx = _param$2;
      moonbitlang$core$builtin$$Map$add_entry_to_tail$84$(self, insert_entry);
      self.size = self.size + 1 | 0;
      return;
    } else {
      const _Some = _bind;
      const _x = _Some;
      const curr_node = self.list[_x.idx];
      if (_x.hash === _param$3.hash && _x.key === _param$3.key) {
        _x.value = _param$3.value;
        break;
      }
      if (_param$3.psl > _x.psl) {
        self.entries[_param$2] = _param$3;
        self.list[_param$2] = _param$4;
        _param$3.idx = _param$2;
        _x.psl = _x.psl + 1 | 0;
        const _tmp$5 = _param + 1 | 0;
        const _tmp$6 = _param$2 + 1 & self.capacity_mask;
        _tmp = _tmp$5;
        _tmp$2 = _tmp$6;
        _tmp$3 = _x;
        _tmp$4 = curr_node;
        continue;
      } else {
        _param$3.psl = _param$3.psl + 1 | 0;
        const _tmp$5 = _param + 1 | 0;
        const _tmp$6 = _param$2 + 1 & self.capacity_mask;
        _tmp = _tmp$5;
        _tmp$2 = _tmp$6;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$set$85$(self, key, value) {
  if (self.size >= self.growAt) {
    moonbitlang$core$builtin$$Map$grow$85$(self);
  }
  const hash = moonbitlang$core$builtin$$Hash$hash$2$(key);
  const insert_entry = { idx: -1, psl: 0, hash: hash, key: key, value: value };
  const list_node = { prev: undefined, next: undefined };
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  let _tmp$3 = insert_entry;
  let _tmp$4 = list_node;
  while (true) {
    const _param = _tmp;
    const _param$2 = _tmp$2;
    const _param$3 = _tmp$3;
    const _param$4 = _tmp$4;
    const _bind = self.entries[_param$2];
    if (_bind === undefined) {
      self.entries[_param$2] = _param$3;
      self.list[_param$2] = _param$4;
      _param$3.idx = _param$2;
      moonbitlang$core$builtin$$Map$add_entry_to_tail$85$(self, insert_entry);
      self.size = self.size + 1 | 0;
      return;
    } else {
      const _Some = _bind;
      const _x = _Some;
      const curr_node = self.list[_x.idx];
      if (_x.hash === _param$3.hash && _x.key === _param$3.key) {
        _x.value = _param$3.value;
        break;
      }
      if (_param$3.psl > _x.psl) {
        self.entries[_param$2] = _param$3;
        self.list[_param$2] = _param$4;
        _param$3.idx = _param$2;
        _x.psl = _x.psl + 1 | 0;
        const _tmp$5 = _param + 1 | 0;
        const _tmp$6 = _param$2 + 1 & self.capacity_mask;
        _tmp = _tmp$5;
        _tmp$2 = _tmp$6;
        _tmp$3 = _x;
        _tmp$4 = curr_node;
        continue;
      } else {
        _param$3.psl = _param$3.psl + 1 | 0;
        const _tmp$5 = _param + 1 | 0;
        const _tmp$6 = _param$2 + 1 & self.capacity_mask;
        _tmp = _tmp$5;
        _tmp$2 = _tmp$6;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$grow$81$(self) {
  const old_head = self.head;
  const old_list = self.list;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.list = $make_array_len_and_init(new_capacity, { prev: undefined, next: undefined });
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  self.growAt = moonbitlang$core$builtin$$calc_grow_threshold(self.capacity);
  self.size = 0;
  self.head = undefined;
  self.tail = undefined;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _x$2 = _x.idx;
      const _x$3 = _x.key;
      const _x$4 = _x.value;
      moonbitlang$core$builtin$$Map$set$81$(self, _x$3, _x$4);
      _tmp = old_list[_x$2].next;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$grow$86$(self) {
  const old_head = self.head;
  const old_list = self.list;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.list = $make_array_len_and_init(new_capacity, { prev: undefined, next: undefined });
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  self.growAt = moonbitlang$core$builtin$$calc_grow_threshold(self.capacity);
  self.size = 0;
  self.head = undefined;
  self.tail = undefined;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _x$2 = _x.idx;
      const _x$3 = _x.key;
      const _x$4 = _x.value;
      moonbitlang$core$builtin$$Map$set$86$(self, _x$3, _x$4);
      _tmp = old_list[_x$2].next;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$grow$82$(self) {
  const old_head = self.head;
  const old_list = self.list;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.list = $make_array_len_and_init(new_capacity, { prev: undefined, next: undefined });
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  self.growAt = moonbitlang$core$builtin$$calc_grow_threshold(self.capacity);
  self.size = 0;
  self.head = undefined;
  self.tail = undefined;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _x$2 = _x.idx;
      const _x$3 = _x.key;
      const _x$4 = _x.value;
      moonbitlang$core$builtin$$Map$set$82$(self, _x$3, _x$4);
      _tmp = old_list[_x$2].next;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$grow$84$(self) {
  const old_head = self.head;
  const old_list = self.list;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.list = $make_array_len_and_init(new_capacity, { prev: undefined, next: undefined });
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  self.growAt = moonbitlang$core$builtin$$calc_grow_threshold(self.capacity);
  self.size = 0;
  self.head = undefined;
  self.tail = undefined;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _x$2 = _x.idx;
      const _x$3 = _x.key;
      const _x$4 = _x.value;
      moonbitlang$core$builtin$$Map$set$84$(self, _x$3, _x$4);
      _tmp = old_list[_x$2].next;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$grow$83$(self) {
  const old_head = self.head;
  const old_list = self.list;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.list = $make_array_len_and_init(new_capacity, { prev: undefined, next: undefined });
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  self.growAt = moonbitlang$core$builtin$$calc_grow_threshold(self.capacity);
  self.size = 0;
  self.head = undefined;
  self.tail = undefined;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _x$2 = _x.idx;
      const _x$3 = _x.key;
      const _x$4 = _x.value;
      moonbitlang$core$builtin$$Map$set$83$(self, _x$3, _x$4);
      _tmp = old_list[_x$2].next;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$grow$14$(self) {
  const old_head = self.head;
  const old_list = self.list;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.list = $make_array_len_and_init(new_capacity, { prev: undefined, next: undefined });
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  self.growAt = moonbitlang$core$builtin$$calc_grow_threshold(self.capacity);
  self.size = 0;
  self.head = undefined;
  self.tail = undefined;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _x$2 = _x.idx;
      const _x$3 = _x.key;
      const _x$4 = _x.value;
      moonbitlang$core$builtin$$Map$set$14$(self, _x$3, _x$4);
      _tmp = old_list[_x$2].next;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$grow$33$(self) {
  const old_head = self.head;
  const old_list = self.list;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.list = $make_array_len_and_init(new_capacity, { prev: undefined, next: undefined });
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  self.growAt = moonbitlang$core$builtin$$calc_grow_threshold(self.capacity);
  self.size = 0;
  self.head = undefined;
  self.tail = undefined;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _x$2 = _x.idx;
      const _x$3 = _x.key;
      const _x$4 = _x.value;
      moonbitlang$core$builtin$$Map$set$33$(self, _x$3, _x$4);
      _tmp = old_list[_x$2].next;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$grow$85$(self) {
  const old_head = self.head;
  const old_list = self.list;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.list = $make_array_len_and_init(new_capacity, { prev: undefined, next: undefined });
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  self.growAt = moonbitlang$core$builtin$$calc_grow_threshold(self.capacity);
  self.size = 0;
  self.head = undefined;
  self.tail = undefined;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _x$2 = _x.idx;
      const _x$3 = _x.key;
      const _x$4 = _x.value;
      moonbitlang$core$builtin$$Map$set$85$(self, _x$3, _x$4);
      _tmp = old_list[_x$2].next;
      continue;
    }
  }
}
function moonbitlang$core$array$$Array$each$9$(self, f) {
  const _len = self.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const v = moonbitlang$core$array$$Array$op_get$9$(self, _i);
      f(v);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$array$$Array$each$16$(self, f) {
  const _len = self.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const v = moonbitlang$core$array$$Array$op_get$16$(self, _i);
      f(v);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$array$$Array$each$59$(self, f) {
  const _len = self.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const v = moonbitlang$core$array$$Array$op_get$59$(self, _i);
      f(v);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$builtin$$Map$from_array$14$(arr) {
  const m = moonbitlang$core$builtin$$Map$new$14$(arr.length);
  moonbitlang$core$array$$Array$each$16$(arr, (e) => {
    moonbitlang$core$builtin$$Map$set$14$(m, e._0, e._1);
  });
  return m;
}
function moonbitlang$core$builtin$$Map$from_array$84$(arr) {
  const m = moonbitlang$core$builtin$$Map$new$84$(arr.length);
  moonbitlang$core$array$$Array$each$59$(arr, (e) => {
    moonbitlang$core$builtin$$Map$set$84$(m, e._0, e._1);
  });
  return m;
}
function moonbitlang$core$builtin$$Map$get$33$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$7$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _bind = self.entries[idx];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _x = _Some;
      if (_x.hash === hash && _x.key === key) {
        return _x.value;
      }
      if (i > _x.psl) {
        return undefined;
      }
      const _tmp$3 = i + 1 | 0;
      const _tmp$4 = idx + 1 & self.capacity_mask;
      _tmp = _tmp$3;
      _tmp$2 = _tmp$4;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$get$81$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$87$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _bind = self.entries[idx];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _x = _Some;
      if (_x.hash === hash && moonbitlang$core$builtin$$Eq$op_equal$80$(_x.key, key)) {
        return _x.value;
      }
      if (i > _x.psl) {
        return undefined;
      }
      const _tmp$3 = i + 1 | 0;
      const _tmp$4 = idx + 1 & self.capacity_mask;
      _tmp = _tmp$3;
      _tmp$2 = _tmp$4;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$get$85$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$2$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _bind = self.entries[idx];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _x = _Some;
      if (_x.hash === hash && _x.key === key) {
        return _x.value;
      }
      if (i > _x.psl) {
        return undefined;
      }
      const _tmp$3 = i + 1 | 0;
      const _tmp$4 = idx + 1 & self.capacity_mask;
      _tmp = _tmp$3;
      _tmp$2 = _tmp$4;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$get$14$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$7$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _bind = self.entries[idx];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _x = _Some;
      if (_x.hash === hash && _x.key === key) {
        return _x.value;
      }
      if (i > _x.psl) {
        return undefined;
      }
      const _tmp$3 = i + 1 | 0;
      const _tmp$4 = idx + 1 & self.capacity_mask;
      _tmp = _tmp$3;
      _tmp$2 = _tmp$4;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$get$86$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$88$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _bind = self.entries[idx];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _x = _Some;
      if (_x.hash === hash && moonbitlang$core$builtin$$Eq$op_equal$19$(_x.key, key)) {
        return _x.value;
      }
      if (i > _x.psl) {
        return undefined;
      }
      const _tmp$3 = i + 1 | 0;
      const _tmp$4 = idx + 1 & self.capacity_mask;
      _tmp = _tmp$3;
      _tmp$2 = _tmp$4;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$get$83$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$2$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _bind = self.entries[idx];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _x = _Some;
      if (_x.hash === hash && _x.key === key) {
        return _x.value;
      }
      if (i > _x.psl) {
        return undefined;
      }
      const _tmp$3 = i + 1 | 0;
      const _tmp$4 = idx + 1 & self.capacity_mask;
      _tmp = _tmp$3;
      _tmp$2 = _tmp$4;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$get$84$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$89$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _bind = self.entries[idx];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _x = _Some;
      if (_x.hash === hash && _x.key === key) {
        return _x.value;
      }
      if (i > _x.psl) {
        return undefined;
      }
      const _tmp$3 = i + 1 | 0;
      const _tmp$4 = idx + 1 & self.capacity_mask;
      _tmp = _tmp$3;
      _tmp$2 = _tmp$4;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$get$82$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$7$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _bind = self.entries[idx];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _x = _Some;
      if (_x.hash === hash && _x.key === key) {
        return _x.value;
      }
      if (i > _x.psl) {
        return undefined;
      }
      const _tmp$3 = i + 1 | 0;
      const _tmp$4 = idx + 1 & self.capacity_mask;
      _tmp = _tmp$3;
      _tmp$2 = _tmp$4;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$op_get$85$(self, key) {
  return moonbitlang$core$builtin$$Map$get$85$(self, key);
}
function moonbitlang$core$builtin$$Map$op_get$83$(self, key) {
  return moonbitlang$core$builtin$$Map$get$83$(self, key);
}
function moonbitlang$core$builtin$$Map$get_or_default$14$(self, key, default_) {
  const _bind = moonbitlang$core$builtin$$Map$get$14$(self, key);
  if (_bind === undefined) {
    return default_;
  } else {
    const _Some = _bind;
    const _x = _Some;
    return _x;
  }
}
function moonbitlang$core$builtin$$Map$get_or_default$81$(self, key, default_) {
  const _bind = moonbitlang$core$builtin$$Map$get$81$(self, key);
  if (_bind === undefined) {
    return default_;
  } else {
    const _Some = _bind;
    const _x = _Some;
    return _x;
  }
}
function moonbitlang$core$builtin$$Map$get_or_init$81$(self, key, default_) {
  const _bind = moonbitlang$core$builtin$$Map$get$81$(self, key);
  if (_bind === undefined) {
    const v = default_();
    moonbitlang$core$builtin$$Map$set$81$(self, key, v);
    return v;
  } else {
    const _Some = _bind;
    const _x = _Some;
    return _x;
  }
}
function moonbitlang$core$builtin$$Map$get_or_init$86$(self, key, default_) {
  const _bind = moonbitlang$core$builtin$$Map$get$86$(self, key);
  if (_bind === undefined) {
    const v = default_();
    moonbitlang$core$builtin$$Map$set$86$(self, key, v);
    return v;
  } else {
    const _Some = _bind;
    const _x = _Some;
    return _x;
  }
}
function moonbitlang$core$option$$Option$unwrap$12$(self) {
  if (self === undefined) {
    return $panic();
  } else {
    const _Some = self;
    const _x = _Some;
    return _x;
  }
}
function moonbitlang$core$option$$Option$unwrap$26$(self) {
  if (self === undefined) {
    return $panic();
  } else {
    const _Some = self;
    const _x = _Some;
    return _x;
  }
}
function moonbitlang$core$option$$Option$unwrap$27$(self) {
  if (self === undefined) {
    return $panic();
  } else {
    const _Some = self;
    const _x = _Some;
    return _x;
  }
}
function moonbitlang$core$option$$Option$unwrap$76$(self) {
  if (self === undefined) {
    return $panic();
  } else {
    const _Some = self;
    const _x = _Some;
    return _x;
  }
}
function moonbitlang$core$option$$Option$unwrap$20$(self) {
  if (self === undefined) {
    return $panic();
  } else {
    const _Some = self;
    const _x = _Some;
    return _x;
  }
}
function moonbitlang$core$option$$Option$unwrap$7$(self) {
  if (self === undefined) {
    return $panic();
  } else {
    const _Some = self;
    const _x = _Some;
    return _x;
  }
}
function moonbitlang$core$option$$Option$unwrap$6$(self) {
  if (self === undefined) {
    return $panic();
  } else {
    const _Some = self;
    const _x = _Some;
    return _x;
  }
}
function moonbitlang$core$option$$Option$unwrap$64$(self) {
  if (self === undefined) {
    return $panic();
  } else {
    const _Some = self;
    const _x = _Some;
    return _x;
  }
}
function moonbitlang$core$option$$Option$unwrap$3$(self) {
  if (self === undefined) {
    return $panic();
  } else {
    const _Some = self;
    const _x = _Some;
    return _x;
  }
}
function moonbitlang$core$option$$Option$unwrap$62$(self) {
  if (self === undefined) {
    return $panic();
  } else {
    const _Some = self;
    const _x = _Some;
    return _x;
  }
}
function moonbitlang$core$builtin$$Map$size$83$(self) {
  return self.size;
}
function moonbitlang$core$builtin$$Iter$new$55$(f) {
  return f;
}
function moonbitlang$core$builtin$$Iter$new$18$(f) {
  return f;
}
function moonbitlang$core$builtin$$Iter$new$16$(f) {
  return f;
}
function moonbitlang$core$builtin$$Iter$new$7$(f) {
  return f;
}
function moonbitlang$core$builtin$$Iter$new$11$(f) {
  return f;
}
function moonbitlang$core$builtin$$Iter$new$2$(f) {
  return f;
}
function moonbitlang$core$builtin$$Iter$new$8$(f) {
  return f;
}
function moonbitlang$core$builtin$$Map$iter$14$(self) {
  return moonbitlang$core$builtin$$Iter$new$16$((yield_) => {
    let _tmp = self.head;
    while (true) {
      const _param = _tmp;
      if (_param === undefined) {
        return 1;
      } else {
        const _Some = _param;
        const _x = _Some;
        const _x$2 = _x.key;
        const _x$3 = _x.value;
        const _x$4 = _x.idx;
        if (moonbitlang$core$builtin$$Eq$op_equal$17$(yield_({ _0: _x$2, _1: _x$3 }), 0)) {
          return 0;
        }
        _tmp = self.list[_x$4].next;
        continue;
      }
    }
  });
}
function moonbitlang$core$builtin$$Iter2$new$81$(f) {
  return f;
}
function moonbitlang$core$builtin$$Iter2$new$85$(f) {
  return f;
}
function moonbitlang$core$builtin$$Iter2$new$25$(f) {
  return f;
}
function moonbitlang$core$builtin$$Iter2$new$24$(f) {
  return f;
}
function moonbitlang$core$builtin$$Map$iter2$85$(self) {
  return moonbitlang$core$builtin$$Iter2$new$85$((yield_) => {
    let _tmp = self.head;
    while (true) {
      const _param = _tmp;
      if (_param === undefined) {
        return 1;
      } else {
        const _Some = _param;
        const _x = _Some;
        const _x$2 = _x.key;
        const _x$3 = _x.value;
        const _x$4 = _x.idx;
        if (moonbitlang$core$builtin$$Eq$op_equal$17$(yield_(_x$2, _x$3), 0)) {
          return 0;
        } else {
          _tmp = self.list[_x$4].next;
          continue;
        }
      }
    }
  });
}
function moonbitlang$core$builtin$$Map$iter2$81$(self) {
  return moonbitlang$core$builtin$$Iter2$new$81$((yield_) => {
    let _tmp = self.head;
    while (true) {
      const _param = _tmp;
      if (_param === undefined) {
        return 1;
      } else {
        const _Some = _param;
        const _x = _Some;
        const _x$2 = _x.key;
        const _x$3 = _x.value;
        const _x$4 = _x.idx;
        if (moonbitlang$core$builtin$$Eq$op_equal$17$(yield_(_x$2, _x$3), 0)) {
          return 0;
        } else {
          _tmp = self.list[_x$4].next;
          continue;
        }
      }
    }
  });
}
function moonbitlang$core$array$$Array$push$13$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$18$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$60$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$71$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$63$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$10$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$61$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$62$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$68$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$58$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$65$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$2$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$70$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$67$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$3$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$8$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$7$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$new$2$(capacity) {
  return [];
}
function moonbitlang$core$array$$Array$new$70$(capacity) {
  return [];
}
function moonbitlang$core$array$$Array$new$46$capacity$46$default$70$() {
  return 0;
}
function moonbitlang$core$array$$ArrayView$length$3$(self) {
  return self.len;
}
function moonbitlang$core$array$$ArrayView$length$2$(self) {
  return self.len;
}
function moonbitlang$core$array$$ArrayView$op_get$3$(self, index) {
  return index >= 0 && index < self.len ? self.buf[self.start + index | 0] : moonbitlang$core$builtin$$abort$3$(`index out of bounds: the len is from 0 to ${moonbitlang$core$int$$Int$to_string(self.len)} but the index is ${moonbitlang$core$int$$Int$to_string(index)}`);
}
function moonbitlang$core$array$$ArrayView$op_get$2$(self, index) {
  return index >= 0 && index < self.len ? self.buf[self.start + index | 0] : moonbitlang$core$builtin$$abort$2$(`index out of bounds: the len is from 0 to ${moonbitlang$core$int$$Int$to_string(self.len)} but the index is ${moonbitlang$core$int$$Int$to_string(index)}`);
}
function moonbitlang$core$array$$ArrayView$swap$3$(self, i, j) {
  if (i >= 0 && (i < self.len && (j >= 0 && j < self.len))) {
    const temp = self.buf[self.start + i | 0];
    self.buf[self.start + i | 0] = self.buf[self.start + j | 0];
    self.buf[self.start + j | 0] = temp;
    return;
  } else {
    moonbitlang$core$builtin$$abort$49$(`index out of bounds: the len is from 0 to ${moonbitlang$core$int$$Int$to_string(self.len)} but the index is (${moonbitlang$core$int$$Int$to_string(i)}, ${moonbitlang$core$int$$Int$to_string(j)})`);
    return;
  }
}
function moonbitlang$core$array$$Array$op_as_view$3$(self, start, end) {
  const len = self.length;
  let end$2;
  if (end === undefined) {
    end$2 = len;
  } else {
    const _Some = end;
    const _x = _Some;
    end$2 = _x;
  }
  return start >= 0 && (start <= end$2 && end$2 <= len) ? { buf: self, start: start, len: end$2 - start | 0 } : moonbitlang$core$builtin$$abort$48$("View start index out of bounds");
}
function moonbitlang$core$array$$Array$op_as_view$2$(self, start, end) {
  const len = self.length;
  let end$2;
  if (end === undefined) {
    end$2 = len;
  } else {
    const _Some = end;
    const _x = _Some;
    end$2 = _x;
  }
  return start >= 0 && (start <= end$2 && end$2 <= len) ? { buf: self, start: start, len: end$2 - start | 0 } : moonbitlang$core$builtin$$abort$47$("View start index out of bounds");
}
function moonbitlang$core$array$$ArrayView$op_as_view$3$(self, start, end) {
  const len = moonbitlang$core$array$$ArrayView$length$3$(self);
  let end$2;
  if (end === undefined) {
    end$2 = len;
  } else {
    const _Some = end;
    const _x = _Some;
    end$2 = _x;
  }
  return start >= 0 && (start <= end$2 && end$2 <= len) ? { buf: self.buf, start: self.start + start | 0, len: end$2 - start | 0 } : moonbitlang$core$builtin$$abort$48$("View start index out of bounds");
}
function moonbitlang$core$array$$ArrayView$op_as_view$2$(self, start, end) {
  const len = moonbitlang$core$array$$ArrayView$length$2$(self);
  let end$2;
  if (end === undefined) {
    end$2 = len;
  } else {
    const _Some = end;
    const _x = _Some;
    end$2 = _x;
  }
  return start >= 0 && (start <= end$2 && end$2 <= len) ? { buf: self.buf, start: self.start + start | 0, len: end$2 - start | 0 } : moonbitlang$core$builtin$$abort$47$("View start index out of bounds");
}
function moonbitlang$core$array$$Array$unsafe_pop$13$(self) {
  return moonbitlang$core$builtin$$JSArray$pop(self);
}
function moonbitlang$core$array$$Array$unsafe_pop$2$(self) {
  return moonbitlang$core$builtin$$JSArray$pop(self);
}
function moonbitlang$core$array$$Array$pop$2$(self) {
  if (self.length === 0) {
    return -1;
  } else {
    const v = moonbitlang$core$array$$Array$unsafe_pop$2$(self);
    return v;
  }
}
function moonbitlang$core$array$$Array$unsafe_grow_to_length$2$(self, new_len) {
  if (new_len >= self.length) {
    moonbitlang$core$builtin$$JSArray$set_length(self, new_len);
    return;
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$array$$Array$unsafe_grow_to_length$3$(self, new_len) {
  if (new_len >= self.length) {
    moonbitlang$core$builtin$$JSArray$set_length(self, new_len);
    return;
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$builtin$$Hasher$new(seed) {
  return { acc: seed + 374761393 | 0 };
}
function moonbitlang$core$builtin$$Hasher$new$46$seed$46$default() {
  return 0;
}
function moonbitlang$core$builtin$$Hasher$consume4(self, input) {
  self.acc = Math.imul(moonbitlang$core$builtin$$rotl(self.acc + (Math.imul(input, -1028477379) | 0) | 0, 17), 668265263) | 0;
}
function moonbitlang$core$builtin$$Hasher$combine_int(self, value) {
  self.acc = self.acc + 4 | 0;
  moonbitlang$core$builtin$$Hasher$consume4(self, value);
}
function moonbitlang$core$builtin$$Hasher$combine_string(self, value) {
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < value.length) {
      moonbitlang$core$builtin$$Hasher$combine_int(self, value.charCodeAt(i));
      _tmp = i + 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$builtin$$Hasher$combine_char(self, value) {
  moonbitlang$core$builtin$$Hasher$combine_int(self, value);
}
function moonbitlang$core$builtin$$Hasher$avalanche(self) {
  let acc = self.acc;
  acc = acc ^ (acc >>> 15 | 0);
  acc = Math.imul(acc, -2048144777) | 0;
  acc = acc ^ (acc >>> 13 | 0);
  acc = Math.imul(acc, -1028477379) | 0;
  acc = acc ^ (acc >>> 16 | 0);
  return acc;
}
function moonbitlang$core$builtin$$Hasher$finalize(self) {
  return moonbitlang$core$builtin$$Hasher$avalanche(self);
}
function moonbitlang$core$builtin$$Hash$hash_combine$3$(self, hasher) {
  moonbitlang$core$builtin$$Hasher$combine_string(hasher, self);
}
function moonbitlang$core$builtin$$Hash$hash$7$(self) {
  const self$2 = self;
  let x = self$2 ^ (self$2 >>> 17 | 0);
  x = Math.imul(x, -312814405) | 0;
  x = x ^ (x >>> 11 | 0);
  x = Math.imul(x, -1404298415) | 0;
  x = x ^ (x >>> 15 | 0);
  x = Math.imul(x, 830770091) | 0;
  x = x ^ (x >>> 14 | 0);
  return x;
}
function moonbitlang$core$builtin$$Hash$hash_combine$7$(self, hasher) {
  moonbitlang$core$builtin$$Hasher$combine_int(hasher, self);
}
function moonbitlang$core$builtin$$Hash$hash_combine$79$(self, hasher) {
  if (self === undefined) {
    moonbitlang$core$builtin$$Hasher$combine_int(hasher, 0);
    return;
  } else {
    const _Some = self;
    const _x = _Some;
    moonbitlang$core$builtin$$Hasher$combine_int(hasher, 1);
    moonbitlang$core$builtin$$Hasher$combine$7$(hasher, _x);
    return;
  }
}
function moonbitlang$core$array$$FixedArray$unsafe_blit$5$(dst, dst_offset, src, src_offset, len) {
  if (dst === src && dst_offset < src_offset) {
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < len) {
        dst[dst_offset + i | 0] = src[src_offset + i | 0];
        _tmp = i + 1 | 0;
        continue;
      } else {
        return;
      }
    }
  } else {
    let _tmp = len - 1 | 0;
    while (true) {
      const i = _tmp;
      if (i >= 0) {
        dst[dst_offset + i | 0] = src[src_offset + i | 0];
        _tmp = i - 1 | 0;
        continue;
      } else {
        return;
      }
    }
  }
}
function moonbitlang$core$array$$FixedArray$unsafe_blit$6$(dst, dst_offset, src, src_offset, len) {
  if (dst === src && dst_offset < src_offset) {
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < len) {
        dst[dst_offset + i | 0] = src[src_offset + i | 0];
        _tmp = i + 1 | 0;
        continue;
      } else {
        return;
      }
    }
  } else {
    let _tmp = len - 1 | 0;
    while (true) {
      const i = _tmp;
      if (i >= 0) {
        dst[dst_offset + i | 0] = src[src_offset + i | 0];
        _tmp = i - 1 | 0;
        continue;
      } else {
        return;
      }
    }
  }
}
function moonbitlang$core$array$$FixedArray$unsafe_blit$7$(dst, dst_offset, src, src_offset, len) {
  if (dst === src && dst_offset < src_offset) {
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < len) {
        dst[dst_offset + i | 0] = src[src_offset + i | 0];
        _tmp = i + 1 | 0;
        continue;
      } else {
        return;
      }
    }
  } else {
    let _tmp = len - 1 | 0;
    while (true) {
      const i = _tmp;
      if (i >= 0) {
        dst[dst_offset + i | 0] = src[src_offset + i | 0];
        _tmp = i - 1 | 0;
        continue;
      } else {
        return;
      }
    }
  }
}
function moonbitlang$core$array$$FixedArray$unsafe_blit$90$(dst, dst_offset, src, src_offset, len) {
  if (dst === src && dst_offset < src_offset) {
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < len) {
        dst[dst_offset + i | 0] = src[src_offset + i | 0];
        _tmp = i + 1 | 0;
        continue;
      } else {
        return;
      }
    }
  } else {
    let _tmp = len - 1 | 0;
    while (true) {
      const i = _tmp;
      if (i >= 0) {
        dst[dst_offset + i | 0] = src[src_offset + i | 0];
        _tmp = i - 1 | 0;
        continue;
      } else {
        return;
      }
    }
  }
}
function moonbitlang$core$array$$FixedArray$unsafe_blit$91$(dst, dst_offset, src, src_offset, len) {
  if (dst === src && dst_offset < src_offset) {
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < len) {
        dst[dst_offset + i | 0] = src[src_offset + i | 0];
        _tmp = i + 1 | 0;
        continue;
      } else {
        return;
      }
    }
  } else {
    let _tmp = len - 1 | 0;
    while (true) {
      const i = _tmp;
      if (i >= 0) {
        dst[dst_offset + i | 0] = src[src_offset + i | 0];
        _tmp = i - 1 | 0;
        continue;
      } else {
        return;
      }
    }
  }
}
function moonbitlang$core$array$$FixedArray$unsafe_blit$92$(dst, dst_offset, src, src_offset, len) {
  if (dst === src && dst_offset < src_offset) {
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < len) {
        dst[dst_offset + i | 0] = src[src_offset + i | 0];
        _tmp = i + 1 | 0;
        continue;
      } else {
        return;
      }
    }
  } else {
    let _tmp = len - 1 | 0;
    while (true) {
      const i = _tmp;
      if (i >= 0) {
        dst[dst_offset + i | 0] = src[src_offset + i | 0];
        _tmp = i - 1 | 0;
        continue;
      } else {
        return;
      }
    }
  }
}
function moonbitlang$core$array$$FixedArray$unsafe_blit$93$(dst, dst_offset, src, src_offset, len) {
  if (dst === src && dst_offset < src_offset) {
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < len) {
        dst[dst_offset + i | 0] = src[src_offset + i | 0];
        _tmp = i + 1 | 0;
        continue;
      } else {
        return;
      }
    }
  } else {
    let _tmp = len - 1 | 0;
    while (true) {
      const i = _tmp;
      if (i >= 0) {
        dst[dst_offset + i | 0] = src[src_offset + i | 0];
        _tmp = i - 1 | 0;
        continue;
      } else {
        return;
      }
    }
  }
}
function moonbitlang$core$array$$FixedArray$blit_to$5$(self, dst, len, src_offset, dst_offset) {
  if ((dst_offset + len | 0) > dst.length || (src_offset + len | 0) > self.length) {
    $panic();
  }
  moonbitlang$core$array$$FixedArray$unsafe_blit$5$(dst, dst_offset, self, src_offset, len);
}
function moonbitlang$core$array$$FixedArray$blit_to$6$(self, dst, len, src_offset, dst_offset) {
  if ((dst_offset + len | 0) > dst.length || (src_offset + len | 0) > self.length) {
    $panic();
  }
  moonbitlang$core$array$$FixedArray$unsafe_blit$6$(dst, dst_offset, self, src_offset, len);
}
function moonbitlang$core$array$$FixedArray$blit_to$46$src_offset$46$default$5$() {
  return 0;
}
function moonbitlang$core$array$$FixedArray$blit_to$46$src_offset$46$default$6$() {
  return 0;
}
function moonbitlang$core$array$$FixedArray$blit_to$46$dst_offset$46$default$5$() {
  return 0;
}
function moonbitlang$core$array$$FixedArray$blit_to$46$dst_offset$46$default$6$() {
  return 0;
}
function moonbitlang$core$array$$Array$map$94$(self, f) {
  if (self.length === 0) {
    return [];
  }
  const arr = new Array(self.length);
  const _len = self.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const v = moonbitlang$core$array$$Array$op_get$59$(self, _i);
      arr[_i] = f(v);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return arr;
}
function moonbitlang$core$array$$Array$map$95$(self, f) {
  if (self.length === 0) {
    return [];
  }
  const arr = new Array(self.length);
  const _len = self.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const v = moonbitlang$core$array$$Array$op_get$55$(self, _i);
      arr[_i] = f(v);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return arr;
}
function moonbitlang$core$array$$Array$map$96$(self, f) {
  if (self.length === 0) {
    return [];
  }
  const arr = new Array(self.length);
  const _len = self.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const v = moonbitlang$core$array$$Array$op_get$59$(self, _i);
      arr[_i] = f(v);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return arr;
}
function moonbitlang$core$array$$Array$map$97$(self, f) {
  if (self.length === 0) {
    return [];
  }
  const arr = new Array(self.length);
  const _len = self.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const v = moonbitlang$core$array$$Array$op_get$58$(self, _i);
      arr[_i] = f(v);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return arr;
}
function moonbitlang$core$array$$Array$map$98$(self, f) {
  if (self.length === 0) {
    return [];
  }
  const arr = new Array(self.length);
  const _len = self.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const v = moonbitlang$core$array$$Array$op_get$3$(self, _i);
      arr[_i] = f(v);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return arr;
}
function moonbitlang$core$array$$Array$map$99$(self, f) {
  if (self.length === 0) {
    return [];
  }
  const arr = new Array(self.length);
  const _len = self.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const v = moonbitlang$core$array$$Array$op_get$8$(self, _i);
      arr[_i] = f(v);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return arr;
}
function moonbitlang$core$array$$Array$map$100$(self, f) {
  if (self.length === 0) {
    return [];
  }
  const arr = new Array(self.length);
  const _len = self.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const v = moonbitlang$core$array$$Array$op_get$67$(self, _i);
      arr[_i] = f(v);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return arr;
}
function moonbitlang$core$array$$Array$op_set$9$(self, index, value) {
  const len = self.length;
  if (index >= 0 && index < len) {
    self[index] = value;
    return;
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$array$$Array$op_set$10$(self, index, value) {
  const len = self.length;
  if (index >= 0 && index < len) {
    self[index] = value;
    return;
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$array$$Array$op_set$5$(self, index, value) {
  const len = self.length;
  if (index >= 0 && index < len) {
    self[index] = value;
    return;
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$array$$Array$op_set$56$(self, index, value) {
  const len = self.length;
  if (index >= 0 && index < len) {
    self[index] = value;
    return;
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$array$$Array$op_set$2$(self, index, value) {
  const len = self.length;
  if (index >= 0 && index < len) {
    self[index] = value;
    return;
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$array$$Array$op_set$11$(self, index, value) {
  const len = self.length;
  if (index >= 0 && index < len) {
    self[index] = value;
    return;
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$array$$Array$op_set$3$(self, index, value) {
  const len = self.length;
  if (index >= 0 && index < len) {
    self[index] = value;
    return;
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$array$$Array$make$10$(len, elem) {
  const arr = new Array(len);
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < len) {
      arr[i] = elem;
      _tmp = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return arr;
}
function moonbitlang$core$array$$Array$make$5$(len, elem) {
  const arr = new Array(len);
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < len) {
      arr[i] = elem;
      _tmp = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return arr;
}
function moonbitlang$core$array$$Array$make$56$(len, elem) {
  const arr = new Array(len);
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < len) {
      arr[i] = elem;
      _tmp = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return arr;
}
function moonbitlang$core$array$$Array$make$2$(len, elem) {
  const arr = new Array(len);
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < len) {
      arr[i] = elem;
      _tmp = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return arr;
}
function moonbitlang$core$array$$Array$make$9$(len, elem) {
  const arr = new Array(len);
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < len) {
      arr[i] = elem;
      _tmp = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return arr;
}
function moonbitlang$core$array$$Array$make$11$(len, elem) {
  const arr = new Array(len);
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < len) {
      arr[i] = elem;
      _tmp = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return arr;
}
function moonbitlang$core$array$$Array$make$3$(len, elem) {
  const arr = new Array(len);
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < len) {
      arr[i] = elem;
      _tmp = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return arr;
}
function moonbitlang$core$array$$Array$unsafe_blit$2$(dst, dst_offset, src, src_offset, len) {
  moonbitlang$core$array$$FixedArray$unsafe_blit$91$(dst, dst_offset, src, src_offset, len);
}
function moonbitlang$core$array$$Array$unsafe_blit$9$(dst, dst_offset, src, src_offset, len) {
  moonbitlang$core$array$$FixedArray$unsafe_blit$90$(dst, dst_offset, src, src_offset, len);
}
function moonbitlang$core$array$$Array$unsafe_blit$3$(dst, dst_offset, src, src_offset, len) {
  moonbitlang$core$array$$FixedArray$unsafe_blit$92$(dst, dst_offset, src, src_offset, len);
}
function moonbitlang$core$array$$Array$blit_to$2$(self, dst, len, src_offset, dst_offset) {
  if (len >= 0 && (dst_offset >= 0 && (src_offset >= 0 && (dst_offset <= dst.length && (src_offset + len | 0) <= self.length)))) {
    if ((dst_offset + len | 0) > dst.length) {
      moonbitlang$core$array$$Array$unsafe_grow_to_length$2$(dst, dst_offset + len | 0);
    }
    moonbitlang$core$array$$Array$unsafe_blit$2$(dst, dst_offset, self, src_offset, len);
    return;
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$array$$Array$blit_to$3$(self, dst, len, src_offset, dst_offset) {
  if (len >= 0 && (dst_offset >= 0 && (src_offset >= 0 && (dst_offset <= dst.length && (src_offset + len | 0) <= self.length)))) {
    if ((dst_offset + len | 0) > dst.length) {
      moonbitlang$core$array$$Array$unsafe_grow_to_length$3$(dst, dst_offset + len | 0);
    }
    moonbitlang$core$array$$Array$unsafe_blit$3$(dst, dst_offset, self, src_offset, len);
    return;
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$builtin$$Show$output$7$(self, logger) {
  logger.method_0(logger.self, moonbitlang$core$int$$Int$to_string(self));
}
function moonbitlang$core$builtin$$Show$to_string$3$(self) {
  return self;
}
function moonbitlang$core$builtin$$Show$output$78$(self, logger) {
  if (self === undefined) {
    logger.method_0(logger.self, "None");
    return;
  } else {
    const _Some = self;
    const _x = _Some;
    logger.method_0(logger.self, "Some(");
    moonbitlang$core$builtin$$Logger$write_object$76$(logger, _x);
    logger.method_0(logger.self, ")");
    return;
  }
}
function moonbitlang$core$builtin$$Logger$write_iter$55$(self, iter, prefix, suffix, sep, trailing) {
  self.method_0(self.self, prefix);
  if (trailing) {
    iter((x) => {
      moonbitlang$core$builtin$$Logger$write_object$55$(self, x);
      self.method_0(self.self, sep);
      return 1;
    });
  } else {
    const first = { val: true };
    iter((x) => {
      if (first.val) {
        first.val = false;
      } else {
        self.method_0(self.self, sep);
      }
      moonbitlang$core$builtin$$Logger$write_object$55$(self, x);
      return 1;
    });
  }
  self.method_0(self.self, suffix);
}
function moonbitlang$core$builtin$$Logger$write_iter$11$(self, iter, prefix, suffix, sep, trailing) {
  self.method_0(self.self, prefix);
  if (trailing) {
    iter((x) => {
      moonbitlang$core$builtin$$Logger$write_object$11$(self, x);
      self.method_0(self.self, sep);
      return 1;
    });
  } else {
    const first = { val: true };
    iter((x) => {
      if (first.val) {
        first.val = false;
      } else {
        self.method_0(self.self, sep);
      }
      moonbitlang$core$builtin$$Logger$write_object$11$(self, x);
      return 1;
    });
  }
  self.method_0(self.self, suffix);
}
function moonbitlang$core$builtin$$Logger$write_iter$7$(self, iter, prefix, suffix, sep, trailing) {
  self.method_0(self.self, prefix);
  if (trailing) {
    iter((x) => {
      moonbitlang$core$builtin$$Logger$write_object$7$(self, x);
      self.method_0(self.self, sep);
      return 1;
    });
  } else {
    const first = { val: true };
    iter((x) => {
      if (first.val) {
        first.val = false;
      } else {
        self.method_0(self.self, sep);
      }
      moonbitlang$core$builtin$$Logger$write_object$7$(self, x);
      return 1;
    });
  }
  self.method_0(self.self, suffix);
}
function moonbitlang$core$builtin$$Logger$write_iter$46$prefix$46$default$55$() {
  return "[";
}
function moonbitlang$core$builtin$$Logger$write_iter$46$prefix$46$default$11$() {
  return "[";
}
function moonbitlang$core$builtin$$Logger$write_iter$46$prefix$46$default$7$() {
  return "[";
}
function moonbitlang$core$builtin$$Logger$write_iter$46$suffix$46$default$55$() {
  return "]";
}
function moonbitlang$core$builtin$$Logger$write_iter$46$suffix$46$default$11$() {
  return "]";
}
function moonbitlang$core$builtin$$Logger$write_iter$46$suffix$46$default$7$() {
  return "]";
}
function moonbitlang$core$builtin$$Logger$write_iter$46$sep$46$default$55$() {
  return ", ";
}
function moonbitlang$core$builtin$$Logger$write_iter$46$sep$46$default$11$() {
  return ", ";
}
function moonbitlang$core$builtin$$Logger$write_iter$46$sep$46$default$7$() {
  return ", ";
}
function moonbitlang$core$builtin$$Logger$write_iter$46$trailing$46$default$55$() {
  return false;
}
function moonbitlang$core$builtin$$Logger$write_iter$46$trailing$46$default$11$() {
  return false;
}
function moonbitlang$core$builtin$$Logger$write_iter$46$trailing$46$default$7$() {
  return false;
}
function moonbitlang$core$array$$Array$iter$55$(self) {
  return moonbitlang$core$builtin$$Iter$new$55$((yield_) => {
    const _len = self.length;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const v = moonbitlang$core$array$$Array$op_get$55$(self, _i);
        const _bind = yield_(v);
        if (_bind === 1) {
        } else {
          return _bind;
        }
        _tmp = _i + 1 | 0;
        continue;
      } else {
        return 1;
      }
    }
  });
}
function moonbitlang$core$array$$Array$iter$11$(self) {
  return moonbitlang$core$builtin$$Iter$new$11$((yield_) => {
    const _len = self.length;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const v = moonbitlang$core$array$$Array$op_get$11$(self, _i);
        const _bind = yield_(v);
        if (_bind === 1) {
        } else {
          return _bind;
        }
        _tmp = _i + 1 | 0;
        continue;
      } else {
        return 1;
      }
    }
  });
}
function moonbitlang$core$array$$Array$iter$7$(self) {
  return moonbitlang$core$builtin$$Iter$new$7$((yield_) => {
    const _len = self.length;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const v = moonbitlang$core$array$$Array$op_get$7$(self, _i);
        const _bind = yield_(v);
        if (_bind === 1) {
        } else {
          return _bind;
        }
        _tmp = _i + 1 | 0;
        continue;
      } else {
        return 1;
      }
    }
  });
}
function moonbitlang$core$array$$Array$iter$8$(self) {
  return moonbitlang$core$builtin$$Iter$new$8$((yield_) => {
    const _len = self.length;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const v = moonbitlang$core$array$$Array$op_get$8$(self, _i);
        const _bind = yield_(v);
        if (_bind === 1) {
        } else {
          return _bind;
        }
        _tmp = _i + 1 | 0;
        continue;
      } else {
        return 1;
      }
    }
  });
}
function moonbitlang$core$builtin$$Show$output$75$(self, logger) {
  moonbitlang$core$builtin$$Logger$write_iter$55$(logger, moonbitlang$core$array$$Array$iter$55$(self), moonbitlang$core$builtin$$Logger$write_iter$46$prefix$46$default$55$(), moonbitlang$core$builtin$$Logger$write_iter$46$suffix$46$default$55$(), moonbitlang$core$builtin$$Logger$write_iter$46$sep$46$default$55$(), moonbitlang$core$builtin$$Logger$write_iter$46$trailing$46$default$55$());
}
function moonbitlang$core$builtin$$Show$output$101$(self, logger) {
  moonbitlang$core$builtin$$Logger$write_iter$7$(logger, moonbitlang$core$array$$Array$iter$7$(self), moonbitlang$core$builtin$$Logger$write_iter$46$prefix$46$default$7$(), moonbitlang$core$builtin$$Logger$write_iter$46$suffix$46$default$7$(), moonbitlang$core$builtin$$Logger$write_iter$46$sep$46$default$7$(), moonbitlang$core$builtin$$Logger$write_iter$46$trailing$46$default$7$());
}
function moonbitlang$core$builtin$$Show$output$102$(self, logger) {
  moonbitlang$core$builtin$$Logger$write_iter$11$(logger, moonbitlang$core$array$$Array$iter$11$(self), moonbitlang$core$builtin$$Logger$write_iter$46$prefix$46$default$11$(), moonbitlang$core$builtin$$Logger$write_iter$46$suffix$46$default$11$(), moonbitlang$core$builtin$$Logger$write_iter$46$sep$46$default$11$(), moonbitlang$core$builtin$$Logger$write_iter$46$trailing$46$default$11$());
}
function moonbitlang$core$builtin$$Hash$hash$87$(self) {
  const hasher = moonbitlang$core$builtin$$Hasher$new(moonbitlang$core$builtin$$Hasher$new$46$seed$46$default());
  moonbitlang$core$builtin$$Hasher$combine$80$(hasher, self);
  return moonbitlang$core$builtin$$Hasher$finalize(hasher);
}
function moonbitlang$core$builtin$$Hash$hash$89$(self) {
  const hasher = moonbitlang$core$builtin$$Hasher$new(moonbitlang$core$builtin$$Hasher$new$46$seed$46$default());
  moonbitlang$core$builtin$$Hasher$combine$3$(hasher, self);
  return moonbitlang$core$builtin$$Hasher$finalize(hasher);
}
function moonbitlang$core$builtin$$Hash$hash$88$(self) {
  const hasher = moonbitlang$core$builtin$$Hasher$new(moonbitlang$core$builtin$$Hasher$new$46$seed$46$default());
  moonbitlang$core$builtin$$Hasher$combine$6$(hasher, self);
  return moonbitlang$core$builtin$$Hasher$finalize(hasher);
}
function moonbitlang$core$builtin$$Logger$write_sub_string$103$(self, value, start, len) {
  moonbitlang$core$builtin$$StringBuilder$write_substring(self, value, start, len);
}
function moonbitlang$core$builtin$$Show$to_string$0$(self) {
  const logger = moonbitlang$core$builtin$$StringBuilder$new(moonbitlang$core$builtin$$StringBuilder$new$46$size_hint$46$default());
  moonbitlang$core$builtin$$Show$output$104$(self, { self: logger, method_0: moonbitlang$core$builtin$$StringBuilder$write_string, method_1: moonbitlang$core$builtin$$StringBuilder$write_substring, method_2: moonbitlang$core$builtin$$Logger$write_sub_string$103$, method_3: moonbitlang$core$builtin$$StringBuilder$write_char });
  return moonbitlang$core$builtin$$StringBuilder$to_string(logger);
}
function moonbitlang$core$builtin$$Show$to_string$105$(self) {
  const logger = moonbitlang$core$builtin$$StringBuilder$new(moonbitlang$core$builtin$$StringBuilder$new$46$size_hint$46$default());
  moonbitlang$core$builtin$$Show$output$102$(self, { self: logger, method_0: moonbitlang$core$builtin$$StringBuilder$write_string, method_1: moonbitlang$core$builtin$$StringBuilder$write_substring, method_2: moonbitlang$core$builtin$$Logger$write_sub_string$103$, method_3: moonbitlang$core$builtin$$StringBuilder$write_char });
  return moonbitlang$core$builtin$$StringBuilder$to_string(logger);
}
function moonbitlang$core$builtin$$Show$to_string$106$(self) {
  const logger = moonbitlang$core$builtin$$StringBuilder$new(moonbitlang$core$builtin$$StringBuilder$new$46$size_hint$46$default());
  moonbitlang$core$builtin$$Show$output$101$(self, { self: logger, method_0: moonbitlang$core$builtin$$StringBuilder$write_string, method_1: moonbitlang$core$builtin$$StringBuilder$write_substring, method_2: moonbitlang$core$builtin$$Logger$write_sub_string$103$, method_3: moonbitlang$core$builtin$$StringBuilder$write_char });
  return moonbitlang$core$builtin$$StringBuilder$to_string(logger);
}
function moonbitlang$core$builtin$$Show$to_string$107$(self) {
  const logger = moonbitlang$core$builtin$$StringBuilder$new(moonbitlang$core$builtin$$StringBuilder$new$46$size_hint$46$default());
  moonbitlang$core$builtin$$Show$output$4$(self, { self: logger, method_0: moonbitlang$core$builtin$$StringBuilder$write_string, method_1: moonbitlang$core$builtin$$StringBuilder$write_substring, method_2: moonbitlang$core$builtin$$Logger$write_sub_string$103$, method_3: moonbitlang$core$builtin$$StringBuilder$write_char });
  return moonbitlang$core$builtin$$StringBuilder$to_string(logger);
}
function moonbitlang$core$builtin$$Iter2$run$25$(self, f) {
  const _func = self;
  return _func(f);
}
function moonbitlang$core$builtin$$Iter2$run$24$(self, f) {
  const _func = self;
  return _func(f);
}
function moonbitlang$core$option$$Option$op_equal$12$(self, other) {
  if (self === undefined) {
    return other === undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    if (other === undefined) {
      return false;
    } else {
      const _Some$2 = other;
      const _x$2 = _Some$2;
      return moonbitlang$core$sorted_set$$Node$op_equal$7$(_x, _x$2);
    }
  }
}
function moonbitlang$core$option$$Option$op_equal$7$(self, other) {
  if (self === undefined) {
    return other === undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    if (other === undefined) {
      return false;
    } else {
      const _Some$2 = other;
      const _x$2 = _Some$2;
      return _x === _x$2;
    }
  }
}
function moonbitlang$core$option$$Option$op_equal$26$(self, other) {
  if (self === undefined) {
    return other === undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    if (other === undefined) {
      return false;
    } else {
      const _Some$2 = other;
      const _x$2 = _Some$2;
      return moonbitlang$core$sorted_map$$Node$op_equal$24$(_x, _x$2);
    }
  }
}
function moonbitlang$core$option$$Option$op_equal$45$(self, other) {
  if (self === undefined) {
    return other === undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    if (other === undefined) {
      return false;
    } else {
      const _Some$2 = other;
      const _x$2 = _Some$2;
      return moonbitlang$core$builtin$$Eq$op_equal$45$(_x, _x$2);
    }
  }
}
function moonbitlang$core$option$$Option$op_equal$27$(self, other) {
  if (self === undefined) {
    return other === undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    if (other === undefined) {
      return false;
    } else {
      const _Some$2 = other;
      const _x$2 = _Some$2;
      return moonbitlang$core$sorted_map$$Node$op_equal$25$(_x, _x$2);
    }
  }
}
function moonbitlang$core$option$$Option$op_equal$2$(self, other) {
  if (self === -1) {
    return other === -1;
  } else {
    const _Some = self;
    const _x = _Some;
    if (other === -1) {
      return false;
    } else {
      const _Some$2 = other;
      const _x$2 = _Some$2;
      return _x === _x$2;
    }
  }
}
function moonbitlang$core$array$$Array$get$62$(self, index) {
  const len = self.length;
  return index >= 0 && index < len ? self[index] : undefined;
}
function moonbitlang$core$array$$Array$op_equal$9$(self, other) {
  if (self.length === other.length) {
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i >= self.length) {
        return true;
      }
      if (moonbitlang$core$builtin$$op_notequal$9$(moonbitlang$core$array$$Array$op_get$9$(self, i), moonbitlang$core$array$$Array$op_get$9$(other, i))) {
        return false;
      }
      _tmp = i + 1 | 0;
      continue;
    }
  } else {
    return false;
  }
}
function moonbitlang$core$array$$Array$op_equal$10$(self, other) {
  if (self.length === other.length) {
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i >= self.length) {
        return true;
      }
      if (moonbitlang$core$builtin$$op_notequal$10$(moonbitlang$core$array$$Array$op_get$10$(self, i), moonbitlang$core$array$$Array$op_get$10$(other, i))) {
        return false;
      }
      _tmp = i + 1 | 0;
      continue;
    }
  } else {
    return false;
  }
}
function moonbitlang$core$array$$Array$op_equal$7$(self, other) {
  if (self.length === other.length) {
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i >= self.length) {
        return true;
      }
      if (moonbitlang$core$array$$Array$op_get$7$(self, i) !== moonbitlang$core$array$$Array$op_get$7$(other, i)) {
        return false;
      }
      _tmp = i + 1 | 0;
      continue;
    }
  } else {
    return false;
  }
}
function moonbitlang$core$array$$Array$compare$10$(self, other) {
  const len_self = self.length;
  const len_other = other.length;
  if (len_self < len_other) {
    return -1;
  } else {
    if (len_self > len_other) {
      return 1;
    } else {
      let _tmp = 0;
      while (true) {
        const i = _tmp;
        if (i < len_self) {
          const cmp = moonbitlang$core$array$$Array$compare$7$(moonbitlang$core$array$$Array$op_get$10$(self, i), moonbitlang$core$array$$Array$op_get$10$(other, i));
          if (cmp !== 0) {
            return cmp;
          }
          _tmp = i + 1 | 0;
          continue;
        } else {
          return 0;
        }
      }
    }
  }
}
function moonbitlang$core$array$$Array$compare$7$(self, other) {
  const len_self = self.length;
  const len_other = other.length;
  if (len_self < len_other) {
    return -1;
  } else {
    if (len_self > len_other) {
      return 1;
    } else {
      let _tmp = 0;
      while (true) {
        const i = _tmp;
        if (i < len_self) {
          const cmp = $compare_int(moonbitlang$core$array$$Array$op_get$7$(self, i), moonbitlang$core$array$$Array$op_get$7$(other, i));
          if (cmp !== 0) {
            return cmp;
          }
          _tmp = i + 1 | 0;
          continue;
        } else {
          return 0;
        }
      }
    }
  }
}
function moonbitlang$core$builtin$$UninitializedArray$unsafe_blit$62$(dst, dst_offset, src, src_offset, len) {
  moonbitlang$core$array$$FixedArray$unsafe_blit$93$(dst, dst_offset, src, src_offset, len);
}
function moonbitlang$core$array$$Array$append$2$(self, other) {
  moonbitlang$core$array$$Array$blit_to$2$(other, self, other.length, 0, self.length);
}
function moonbitlang$core$array$$Array$append$3$(self, other) {
  moonbitlang$core$array$$Array$blit_to$3$(other, self, other.length, 0, self.length);
}
function moonbitlang$core$array$$Array$map_inplace$10$(self, f) {
  const _len = self.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const v = moonbitlang$core$array$$Array$op_get$10$(self, _i);
      moonbitlang$core$array$$Array$op_set$10$(self, _i, f(v));
      _tmp = _i + 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$array$$Array$mapi$108$(self, f) {
  if (self.length === 0) {
    return [];
  }
  const arr = new Array(self.length);
  const _len = self.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const v = moonbitlang$core$array$$Array$op_get$3$(self, _i);
      arr[_i] = f(_i, v);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return arr;
}
function moonbitlang$core$array$$Array$mapi_inplace$9$(self, f) {
  const _len = self.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const v = moonbitlang$core$array$$Array$op_get$9$(self, _i);
      moonbitlang$core$array$$Array$op_set$9$(self, _i, f(_i, v));
      _tmp = _i + 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$array$$Array$is_empty$13$(self) {
  return self.length === 0;
}
function moonbitlang$core$array$$Array$is_empty$2$(self) {
  return self.length === 0;
}
function moonbitlang$core$array$$Array$is_empty$7$(self) {
  return self.length === 0;
}
function moonbitlang$core$array$$Array$split_at$62$(self, index) {
  if (index < 0 || index > self.length) {
    const len = self.length;
    moonbitlang$core$builtin$$abort$49$(`index out of bounds: the len is from 0 to ${moonbitlang$core$int$$Int$to_string(len)} but the index is ${moonbitlang$core$int$$Int$to_string(index)}`);
  }
  const v1 = new Array(index);
  const v2 = new Array(self.length - index | 0);
  moonbitlang$core$builtin$$UninitializedArray$unsafe_blit$62$(v1, 0, self, 0, index);
  if (index !== self.length) {
    moonbitlang$core$builtin$$UninitializedArray$unsafe_blit$62$(v2, 0, self, index, self.length - index | 0);
  }
  return { _0: v1, _1: v2 };
}
function moonbitlang$core$array$$Array$contains$2$(self, value) {
  const _len = self.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const v = moonbitlang$core$array$$Array$op_get$2$(self, _i);
      if (v === value) {
        return true;
      }
      _tmp = _i + 1 | 0;
      continue;
    } else {
      return false;
    }
  }
}
function moonbitlang$core$array$$Array$flatten$2$(self) {
  const v = [];
  const _len = self.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const arr = moonbitlang$core$array$$Array$op_get$63$(self, _i);
      moonbitlang$core$array$$Array$append$2$(v, arr);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return v;
}
function moonbitlang$core$array$$Array$flatten$3$(self) {
  const v = [];
  const _len = self.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const arr = moonbitlang$core$array$$Array$op_get$69$(self, _i);
      moonbitlang$core$array$$Array$append$3$(v, arr);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return v;
}
function moonbitlang$core$array$$Array$fold$33$(self, init, f) {
  let _tmp = 0;
  let _tmp$2 = init;
  while (true) {
    const i = _tmp;
    const acc = _tmp$2;
    if (i < self.length) {
      const _tmp$3 = i + 1 | 0;
      const _tmp$4 = f(acc, moonbitlang$core$array$$Array$op_get$7$(self, i));
      _tmp = _tmp$3;
      _tmp$2 = _tmp$4;
      continue;
    } else {
      return acc;
    }
  }
}
function moonbitlang$core$array$$Array$fold$109$(self, init, f) {
  let _tmp = 0;
  let _tmp$2 = init;
  while (true) {
    const i = _tmp;
    const acc = _tmp$2;
    if (i < self.length) {
      const _tmp$3 = i + 1 | 0;
      const _tmp$4 = f(acc, moonbitlang$core$array$$Array$op_get$62$(self, i));
      _tmp = _tmp$3;
      _tmp$2 = _tmp$4;
      continue;
    } else {
      return acc;
    }
  }
}
function moonbitlang$core$array$$Array$fold$108$(self, init, f) {
  let _tmp = 0;
  let _tmp$2 = init;
  while (true) {
    const i = _tmp;
    const acc = _tmp$2;
    if (i < self.length) {
      const _tmp$3 = i + 1 | 0;
      const _tmp$4 = f(acc, moonbitlang$core$array$$Array$op_get$3$(self, i));
      _tmp = _tmp$3;
      _tmp$2 = _tmp$4;
      continue;
    } else {
      return acc;
    }
  }
}
function moonbitlang$core$array$$Array$fold$110$(self, init, f) {
  let _tmp = 0;
  let _tmp$2 = init;
  while (true) {
    const i = _tmp;
    const acc = _tmp$2;
    if (i < self.length) {
      const _tmp$3 = i + 1 | 0;
      const _tmp$4 = f(acc, moonbitlang$core$array$$Array$op_get$66$(self, i));
      _tmp = _tmp$3;
      _tmp$2 = _tmp$4;
      continue;
    } else {
      return acc;
    }
  }
}
function moonbitlang$core$builtin$$Iter$run$3$(self, f) {
  const _func = self;
  return _func(f);
}
function moonbitlang$core$builtin$$Iter$run$18$(self, f) {
  const _func = self;
  return _func(f);
}
function moonbitlang$core$builtin$$Eq$op_equal$17$(_x_151, _x_152) {
  if (_x_151 === 0) {
    if (_x_152 === 0) {
      return true;
    } else {
      return false;
    }
  } else {
    if (_x_152 === 1) {
      return true;
    } else {
      return false;
    }
  }
}
function moonbitlang$core$builtin$$Iter$empty$3$() {
  return (_param3) => 1;
}
function moonbitlang$core$builtin$$Iter$empty$16$() {
  return (_param3) => 1;
}
function moonbitlang$core$builtin$$Iter$empty$18$() {
  return (_param3) => 1;
}
function moonbitlang$core$builtin$$Iter$singleton$16$(a) {
  return (yield_) => yield_(a);
}
function moonbitlang$core$builtin$$Iter$singleton$18$(a) {
  return (yield_) => yield_(a);
}
function moonbitlang$core$builtin$$Iter$map_option$111$(self, f) {
  return (yield_) => moonbitlang$core$builtin$$Iter$run$18$(self, (a) => {
    const _bind = f(a);
    if (_bind === undefined) {
      return 1;
    } else {
      const _Some = _bind;
      const _x = _Some;
      return yield_(_x);
    }
  });
}
function moonbitlang$core$builtin$$Iter$append$3$(self, a) {
  return (yield_) => moonbitlang$core$builtin$$Eq$op_equal$17$(moonbitlang$core$builtin$$Iter$run$3$(self, yield_), 1) ? yield_(a) : 0;
}
function moonbitlang$core$builtin$$Iter$to_array$18$(self) {
  const result = [];
  self((e) => {
    moonbitlang$core$array$$Array$push$18$(result, e);
    return 1;
  });
  return result;
}
function moonbitlang$core$builtin$$Iter$collect$7$(self) {
  const result = [];
  self((_p) => {
    moonbitlang$core$array$$Array$push$7$(result, _p);
    return 1;
  });
  return result;
}
function moonbitlang$core$builtin$$Iter$collect$3$(self) {
  const result = [];
  self((_p) => {
    moonbitlang$core$array$$Array$push$3$(result, _p);
    return 1;
  });
  return result;
}
function jian$mbtlex$lib$type$$Regex$get_capture_names_rec(self) {
  let _tmp = self;
  _L: while (true) {
    const self$2 = _tmp;
    let re1;
    let re2;
    _L$2: {
      let re;
      _L$3: {
        switch (self$2.$tag) {
          case 10: {
            const _Capture = self$2;
            const _x = _Capture._0;
            const _x$2 = _Capture._1;
            return moonbitlang$core$builtin$$Iter$append$3$(jian$mbtlex$lib$type$$Regex$get_capture_names_rec(_x), _x$2);
          }
          case 6: {
            const _Repetition = self$2;
            const _x$3 = _Repetition._0;
            re = _x$3;
            break _L$3;
          }
          case 7: {
            const _Option = self$2;
            const _x$4 = _Option._0;
            re = _x$4;
            break _L$3;
          }
          case 8: {
            const _Alter = self$2;
            const _x$5 = _Alter._0;
            const _x$6 = _Alter._1;
            re1 = _x$5;
            re2 = _x$6;
            break _L$2;
          }
          case 9: {
            const _Concat = self$2;
            const _x$7 = _Concat._0;
            const _x$8 = _Concat._1;
            re1 = _x$7;
            re2 = _x$8;
            break _L$2;
          }
          default: {
            return moonbitlang$core$builtin$$Iter$empty$3$();
          }
        }
      }
      _tmp = re;
      continue;
    }
    const _bind = jian$mbtlex$lib$type$$Regex$get_capture_names_rec(re1);
    const _bind$2 = jian$mbtlex$lib$type$$Regex$get_capture_names_rec(re2);
    return (_p) => _bind(_p) === 1 && _bind$2(_p) === 1 ? 1 : 0;
  }
}
function jian$mbtlex$lib$type$$Regex$get_capture_names(self) {
  const result = moonbitlang$core$builtin$$Iter$collect$3$(jian$mbtlex$lib$type$$Regex$get_capture_names_rec(self));
  moonbitlang$core$array$$Array$sort$3$(result);
  let _tmp = 1;
  while (true) {
    const i = _tmp;
    if (i < result.length) {
      if (moonbitlang$core$array$$Array$op_get$3$(result, i - 1 | 0) === moonbitlang$core$array$$Array$op_get$3$(result, i)) {
        moonbitlang$core$builtin$$abort$49$("duplicated capture var");
      }
      _tmp = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return result;
}
function moonbitlang$core$builtin$$Eq$op_equal$45$(_x_21, _x_22) {
  return moonbitlang$core$array$$FixedArray$op_equal$7$(_x_21.bits, _x_22.bits) && _x_21.len === _x_22.len;
}
function jian$mbtlex$lib$type$$Bitset$new(len) {
  return { bits: moonbitlang$core$array$$FixedArray$makei$7$((len + 64 | 0) / 64 | 0, (_i) => 0), len: len };
}
function jian$mbtlex$lib$type$$Bitset$copy(self) {
  return { bits: moonbitlang$core$array$$FixedArray$copy$7$(self.bits), len: self.len };
}
function jian$mbtlex$lib$type$$Bitset$get(self, index) {
  return (self.bits[index / 64 | 0] & 1 << (index % 64 | 0)) !== 0;
}
function jian$mbtlex$lib$type$$Bitset$set(self, index, value) {
  const t = index / 64 | 0;
  self.bits[t] = self.bits[t] | moonbitlang$core$bool$$Bool$to_int(value) << index;
}
function jian$mbtlex$lib$type$$Bitset$union(self, other) {
  return self.len !== other.len ? moonbitlang$core$builtin$$abort$45$("") : { bits: moonbitlang$core$array$$FixedArray$makei$7$(self.bits.length, (i) => self.bits[i] | other.bits[i]), len: self.len };
}
function jian$mbtlex$lib$parser$$ParserBuf$from_string(content) {
  return { ptr: 0, content: content };
}
function jian$mbtlex$lib$parser$$ParserBuf$step(self, i) {
  return { ptr: self.ptr + i | 0, content: self.content };
}
function jian$mbtlex$lib$parser$$ParserBuf$step$46$i$46$default() {
  return 1;
}
function jian$mbtlex$lib$parser$$ParserBuf$peek(self, i) {
  return (self.ptr + i | 0) >= self.content.length ? -1 : self.content.charCodeAt(self.ptr + i | 0);
}
function jian$mbtlex$lib$parser$$ParserBuf$peek$46$i$46$default() {
  return 0;
}
function jian$mbtlex$lib$parser$$ParserBuf$get_str(self, i) {
  return (self.ptr + i | 0) > self.content.length ? undefined : moonbitlang$core$string$$String$substring(self.content, self.ptr, self.ptr + i | 0);
}
function jian$mbtlex$lib$parser$$ParserBuf$match_str(self, pattern) {
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < pattern.length) {
      if (moonbitlang$core$builtin$$op_notequal$53$(jian$mbtlex$lib$parser$$ParserBuf$peek(self, i), pattern.charCodeAt(i))) {
        return undefined;
      }
      _tmp = i + 1 | 0;
      continue;
    } else {
      return jian$mbtlex$lib$parser$$ParserBuf$step(self, pattern.length);
    }
  }
}
function jian$mbtlex$lib$parser$$ParserBuf$skip_ws(self) {
  let _tmp = self;
  while (true) {
    const p = _tmp;
    _L: {
      _L$2: {
        const _bind = jian$mbtlex$lib$parser$$ParserBuf$peek(p, jian$mbtlex$lib$parser$$ParserBuf$peek$46$i$46$default());
        if (_bind === -1) {
          break _L;
        } else {
          const _Some = _bind;
          const _x = _Some;
          switch (_x) {
            case 32: {
              break _L$2;
            }
            case 10: {
              break _L$2;
            }
            default: {
              break _L;
            }
          }
        }
      }
      _tmp = jian$mbtlex$lib$parser$$ParserBuf$step(p, jian$mbtlex$lib$parser$$ParserBuf$step$46$i$46$default());
      continue;
    }
    return p;
  }
}
function jian$mbtlex$lib$parser$$ParserBuf$match_str_array(self, patterns) {
  let p = self;
  const _len = patterns.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const pattern = moonbitlang$core$array$$Array$op_get$3$(patterns, _i);
      const _bind = jian$mbtlex$lib$parser$$ParserBuf$match_str(jian$mbtlex$lib$parser$$ParserBuf$skip_ws(p), pattern);
      if (_bind === undefined) {
        return undefined;
      } else {
        const _Some = _bind;
        const _x = _Some;
        p = _x;
      }
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return p;
}
function jian$mbtlex$lib$parser$$bind_none$31$(opt, f) {
  return opt === undefined ? f() : opt;
}
function jian$mbtlex$lib$parser$$ParserBuf$match_re(self, re) {
  switch (re.$tag) {
    case 0: {
      return moonbitlang$core$option$$Option$map$41$(jian$mbtlex$lib$parser$$ParserBuf$peek(self, jian$mbtlex$lib$parser$$ParserBuf$peek$46$i$46$default()), (c) => ({ _0: jian$mbtlex$lib$parser$$ParserBuf$step(self, jian$mbtlex$lib$parser$$ParserBuf$step$46$i$46$default()), _1: moonbitlang$core$string$$String$from_array([c]) }));
    }
    case 1: {
      return moonbitlang$core$option$$when$31$(self.ptr === self.content.length, () => ({ _0: self, _1: "" }));
    }
    case 2: {
      const _ReStr = re;
      const _x = _ReStr._0;
      return moonbitlang$core$option$$Option$map$40$(jian$mbtlex$lib$parser$$ParserBuf$match_str(self, _x), (p) => ({ _0: p, _1: _x }));
    }
    case 3: {
      const _ReChar = re;
      const _x$2 = _ReChar._0;
      return moonbitlang$core$option$$Option$bind$41$(jian$mbtlex$lib$parser$$ParserBuf$peek(self, jian$mbtlex$lib$parser$$ParserBuf$peek$46$i$46$default()), (c) => moonbitlang$core$option$$when$31$(_x$2 === c, () => ({ _0: jian$mbtlex$lib$parser$$ParserBuf$step(self, jian$mbtlex$lib$parser$$ParserBuf$step$46$i$46$default()), _1: moonbitlang$core$string$$String$from_array([c]) })));
    }
    case 4: {
      const _CharSet = re;
      const _x$3 = _CharSet._0;
      return moonbitlang$core$option$$Option$bind$41$(jian$mbtlex$lib$parser$$ParserBuf$peek(self, jian$mbtlex$lib$parser$$ParserBuf$peek$46$i$46$default()), (c) => moonbitlang$core$option$$when$31$(moonbitlang$core$array$$Array$contains$2$(_x$3, c), () => ({ _0: jian$mbtlex$lib$parser$$ParserBuf$step(self, jian$mbtlex$lib$parser$$ParserBuf$step$46$i$46$default()), _1: moonbitlang$core$string$$String$from_array([c]) })));
    }
    case 5: {
      const _RevCharSet = re;
      const _x$4 = _RevCharSet._0;
      return moonbitlang$core$option$$Option$bind$41$(jian$mbtlex$lib$parser$$ParserBuf$peek(self, jian$mbtlex$lib$parser$$ParserBuf$peek$46$i$46$default()), (c) => moonbitlang$core$option$$unless$31$(moonbitlang$core$array$$Array$contains$2$(_x$4, c), () => ({ _0: jian$mbtlex$lib$parser$$ParserBuf$step(self, jian$mbtlex$lib$parser$$ParserBuf$step$46$i$46$default()), _1: moonbitlang$core$string$$String$from_array([c]) })));
    }
    case 6: {
      const _Repetition = re;
      const _x$5 = _Repetition._0;
      const _bind = jian$mbtlex$lib$parser$$ParserBuf$match_re(self, _x$5);
      if (_bind === undefined) {
        return undefined;
      } else {
        const _Some = _bind;
        const _x$6 = _Some;
        const _x$7 = _x$6._0;
        const _x$8 = _x$6._1;
        return moonbitlang$core$option$$Option$map$39$(jian$mbtlex$lib$parser$$ParserBuf$match_re(_x$7, new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Option(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Repetition(_x$5))), (_param1) => {
          const _x$9 = _param1._0;
          const _x$10 = _param1._1;
          return { _0: _x$9, _1: `${_x$8}${_x$10}` };
        });
      }
    }
    case 7: {
      const _Option = re;
      const _x$6 = _Option._0;
      return jian$mbtlex$lib$parser$$bind_none$31$(jian$mbtlex$lib$parser$$ParserBuf$match_re(self, _x$6), () => ({ _0: self, _1: "" }));
    }
    case 8: {
      const _Alter = re;
      const _x$7 = _Alter._0;
      const _x$8 = _Alter._1;
      return jian$mbtlex$lib$parser$$bind_none$31$(jian$mbtlex$lib$parser$$ParserBuf$match_re(self, _x$7), () => jian$mbtlex$lib$parser$$ParserBuf$match_re(self, _x$8));
    }
    case 9: {
      const _Concat = re;
      const _x$9 = _Concat._0;
      const _x$10 = _Concat._1;
      return moonbitlang$core$option$$Option$bind$39$(jian$mbtlex$lib$parser$$ParserBuf$match_re(self, _x$9), (_param2) => {
        const _x$11 = _param2._0;
        const _x$12 = _param2._1;
        return moonbitlang$core$option$$Option$map$39$(jian$mbtlex$lib$parser$$ParserBuf$match_re(_x$11, _x$10), (_param3) => {
          const _x$13 = _param3._0;
          const _x$14 = _param3._1;
          return { _0: _x$13, _1: `${_x$12}${_x$14}` };
        });
      });
    }
    default: {
      return moonbitlang$core$builtin$$abort$46$("Capture is not allowed in ParserBuf");
    }
  }
}
function jian$mbtlex$lib$parser$$ParserBuf$repeat_match$63$(self, match_fn) {
  let _tmp = self;
  let _tmp$2 = [];
  while (true) {
    const p = _tmp;
    const arr = _tmp$2;
    const _bind = match_fn(p);
    if (_bind === undefined) {
      return { _0: p, _1: arr };
    } else {
      const _Some = _bind;
      const _x = _Some;
      const _x$2 = _x._0;
      const _x$3 = _x._1;
      moonbitlang$core$array$$Array$push$63$(arr, _x$3);
      _tmp = _x$2;
      continue;
    }
  }
}
function jian$mbtlex$lib$parser$$ParserBuf$repeat_match$62$(self, match_fn) {
  let _tmp = self;
  let _tmp$2 = [];
  while (true) {
    const p = _tmp;
    const arr = _tmp$2;
    const _bind = match_fn(p);
    if (_bind === undefined) {
      return { _0: p, _1: arr };
    } else {
      const _Some = _bind;
      const _x = _Some;
      const _x$2 = _x._0;
      const _x$3 = _x._1;
      moonbitlang$core$array$$Array$push$62$(arr, _x$3);
      _tmp = _x$2;
      continue;
    }
  }
}
function jian$mbtlex$lib$parser$$ParserBuf$repeat_match$65$(self, match_fn) {
  let _tmp = self;
  let _tmp$2 = [];
  while (true) {
    const p = _tmp;
    const arr = _tmp$2;
    const _bind = match_fn(p);
    if (_bind === undefined) {
      return { _0: p, _1: arr };
    } else {
      const _Some = _bind;
      const _x = _Some;
      const _x$2 = _x._0;
      const _x$3 = _x._1;
      moonbitlang$core$array$$Array$push$65$(arr, _x$3);
      _tmp = _x$2;
      continue;
    }
  }
}
function jian$mbtlex$lib$parser$$ParserBuf$repeat_match$8$(self, match_fn) {
  let _tmp = self;
  let _tmp$2 = [];
  while (true) {
    const p = _tmp;
    const arr = _tmp$2;
    const _bind = match_fn(p);
    if (_bind === undefined) {
      return { _0: p, _1: arr };
    } else {
      const _Some = _bind;
      const _x = _Some;
      const _x$2 = _x._0;
      const _x$3 = _x._1;
      moonbitlang$core$array$$Array$push$8$(arr, _x$3);
      _tmp = _x$2;
      continue;
    }
  }
}
function jian$mbtlex$lib$parser$$ParserBuf$repeat_match$67$(self, match_fn) {
  let _tmp = self;
  let _tmp$2 = [];
  while (true) {
    const p = _tmp;
    const arr = _tmp$2;
    const _bind = match_fn(p);
    if (_bind === undefined) {
      return { _0: p, _1: arr };
    } else {
      const _Some = _bind;
      const _x = _Some;
      const _x$2 = _x._0;
      const _x$3 = _x._1;
      moonbitlang$core$array$$Array$push$67$(arr, _x$3);
      _tmp = _x$2;
      continue;
    }
  }
}
function jian$mbtlex$lib$parser$$ch_range(ch_begin, ch_end) {
  const ch_begin$2 = ch_begin;
  const ch_end$2 = ch_end;
  return moonbitlang$core$array$$Array$makei$2$((ch_end$2 - ch_begin$2 | 0) + 1 | 0, (i) => i + ch_begin$2 | 0);
}
function jian$mbtlex$lib$parser$$char$46$hex_char_to_int$112$(c) {
  const c$2 = c;
  return c$2 >= 48 && c$2 <= 57 ? c$2 - 48 | 0 : c$2 >= 97 && c$2 <= 102 ? (c$2 - 97 | 0) + 10 | 0 : c$2 >= 65 && c$2 <= 70 ? (c$2 - 65 | 0) + 10 | 0 : moonbitlang$core$builtin$$abort$7$("illegal hex char");
}
function jian$mbtlex$lib$parser$$ParserBuf$char(self) {
  return moonbitlang$core$option$$Option$map$34$(jian$mbtlex$lib$parser$$ParserBuf$match_re(self, jian$mbtlex$lib$parser$$char_re), (_param4) => {
    const _x = _param4._0;
    const _x$2 = _param4._1;
    let ch;
    if (_x$2.length === 3) {
      ch = _x$2.charCodeAt(1);
    } else {
      if (_x$2.length === 4) {
        const _bind = _x$2.charCodeAt(2);
        switch (_bind) {
          case 116: {
            ch = 9;
            break;
          }
          case 114: {
            ch = 13;
            break;
          }
          case 110: {
            ch = 10;
            break;
          }
          case 92: {
            ch = 92;
            break;
          }
          case 39: {
            ch = 39;
            break;
          }
          default: {
            ch = moonbitlang$core$builtin$$abort$2$("unsupported escaped char");
          }
        }
      } else {
        if (_x$2.length === 6) {
          const c1 = jian$mbtlex$lib$parser$$char$46$hex_char_to_int$112$(_x$2.charCodeAt(3));
          const c2 = jian$mbtlex$lib$parser$$char$46$hex_char_to_int$112$(_x$2.charCodeAt(4));
          ch = (Math.imul(c1, 16) | 0) + c2 | 0;
        } else {
          ch = moonbitlang$core$builtin$$abort$2$("illegal char");
        }
      }
    }
    return { _0: _x, _1: ch };
  });
}
function jian$mbtlex$lib$parser$$ParserBuf$string(self) {
  return moonbitlang$core$option$$Option$map$39$(jian$mbtlex$lib$parser$$ParserBuf$match_re(self, jian$mbtlex$lib$parser$$string_re), (_param5) => {
    const _x = _param5._0;
    const _x$2 = _param5._1;
    return { _0: _x, _1: moonbitlang$core$string$$String$substring(_x$2, 1, _x$2.length - 1 | 0) };
  });
}
function jian$mbtlex$lib$parser$$ParserBuf$charset_inside(self) {
  const _bind = jian$mbtlex$lib$parser$$ParserBuf$repeat_match$63$(self, (p) => {
    const c = jian$mbtlex$lib$parser$$ParserBuf$char(jian$mbtlex$lib$parser$$ParserBuf$skip_ws(p));
    return moonbitlang$core$option$$Option$bind$32$(c, (_param6) => {
      const _x = _param6._0;
      const _x$2 = _param6._1;
      const p$2 = jian$mbtlex$lib$parser$$ParserBuf$skip_ws(_x);
      if (moonbitlang$core$option$$Option$op_equal$2$(jian$mbtlex$lib$parser$$ParserBuf$peek(p$2, jian$mbtlex$lib$parser$$ParserBuf$peek$46$i$46$default()), 45)) {
        const ch_end = jian$mbtlex$lib$parser$$ParserBuf$char(jian$mbtlex$lib$parser$$ParserBuf$skip_ws(jian$mbtlex$lib$parser$$ParserBuf$step(p$2, jian$mbtlex$lib$parser$$ParserBuf$step$46$i$46$default())));
        return moonbitlang$core$option$$Option$map$32$(ch_end, (_param7) => {
          const _x$3 = _param7._0;
          const _x$4 = _param7._1;
          return { _0: _x$3, _1: jian$mbtlex$lib$parser$$ch_range(_x$2, _x$4) };
        });
      } else {
        return { _0: p$2, _1: [_x$2] };
      }
    });
  });
  const _x = _bind._0;
  const _x$2 = _bind._1;
  return { _0: _x, _1: moonbitlang$core$array$$Array$flatten$2$(_x$2) };
}
function jian$mbtlex$lib$parser$$ParserBuf$identifier(self) {
  const re = new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Concat(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$CharSet(jian$mbtlex$lib$parser$$ch_range(97, 122)), new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Option(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Repetition(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$CharSet(moonbitlang$core$array$$Array$flatten$2$([jian$mbtlex$lib$parser$$ch_range(97, 122), jian$mbtlex$lib$parser$$ch_range(65, 90), jian$mbtlex$lib$parser$$ch_range(48, 57), [95]])))));
  return jian$mbtlex$lib$parser$$ParserBuf$match_re(self, re);
}
function jian$mbtlex$lib$parser$$ParserBuf$regex_nonleftrec(self) {
  const p = jian$mbtlex$lib$parser$$ParserBuf$skip_ws(self);
  _L: {
    _L$2: {
      const _bind = jian$mbtlex$lib$parser$$ParserBuf$peek(p, jian$mbtlex$lib$parser$$ParserBuf$peek$46$i$46$default());
      const _bind$2 = jian$mbtlex$lib$parser$$ParserBuf$peek(p, 1);
      if (_bind === -1) {
        break _L;
      } else {
        const _Some = _bind;
        const _x = _Some;
        switch (_x) {
          case 39: {
            return moonbitlang$core$option$$Option$map$35$(jian$mbtlex$lib$parser$$ParserBuf$char(p), (_param8) => {
              const _x$2 = _param8._0;
              const _x$3 = _param8._1;
              return { _0: _x$2, _1: new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$ReChar(_x$3) };
            });
          }
          case 34: {
            return moonbitlang$core$option$$Option$map$37$(jian$mbtlex$lib$parser$$ParserBuf$string(p), (_param9) => {
              const _x$2 = _param9._0;
              const _x$3 = _param9._1;
              return { _0: _x$2, _1: new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$ReStr(_x$3) };
            });
          }
          case 91: {
            if (_bind$2 === -1) {
              break _L$2;
            } else {
              const _Some$2 = _bind$2;
              const _x$2 = _Some$2;
              if (_x$2 === 94) {
                const _bind$3 = jian$mbtlex$lib$parser$$ParserBuf$charset_inside(jian$mbtlex$lib$parser$$ParserBuf$step(p, 2));
                const _x$3 = _bind$3._0;
                const _x$4 = _bind$3._1;
                return moonbitlang$core$option$$Option$map$36$(jian$mbtlex$lib$parser$$ParserBuf$match_str(_x$3, "]"), (p$2) => ({ _0: p$2, _1: new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$RevCharSet(_x$4) }));
              } else {
                break _L$2;
              }
            }
          }
          case 40: {
            return moonbitlang$core$option$$Option$bind$38$(jian$mbtlex$lib$parser$$ParserBuf$regex(jian$mbtlex$lib$parser$$ParserBuf$step(p, jian$mbtlex$lib$parser$$ParserBuf$step$46$i$46$default())), (_param10) => {
              const _x$2 = _param10._0;
              const _x$3 = _param10._1;
              return moonbitlang$core$option$$Option$map$36$(jian$mbtlex$lib$parser$$ParserBuf$match_str(_x$2, ")"), (p$2) => ({ _0: p$2, _1: _x$3 }));
            });
          }
          case 101: {
            return moonbitlang$core$option$$Option$map$36$(jian$mbtlex$lib$parser$$ParserBuf$match_str(p, "eof"), (p$2) => ({ _0: p$2, _1: $64$jian$47$mbtlex$47$lib$47$type$46$Regex$EOF }));
          }
          case 95: {
            return { _0: jian$mbtlex$lib$parser$$ParserBuf$step(p, jian$mbtlex$lib$parser$$ParserBuf$step$46$i$46$default()), _1: $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Underscore };
          }
          default: {
            break _L;
          }
        }
      }
    }
    const _bind = jian$mbtlex$lib$parser$$ParserBuf$charset_inside(jian$mbtlex$lib$parser$$ParserBuf$step(p, jian$mbtlex$lib$parser$$ParserBuf$step$46$i$46$default()));
    const _x = _bind._0;
    const _x$2 = _bind._1;
    return moonbitlang$core$option$$Option$map$36$(jian$mbtlex$lib$parser$$ParserBuf$match_str(_x, "]"), (p$2) => ({ _0: p$2, _1: new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$CharSet(_x$2) }));
  }
  return undefined;
}
function jian$mbtlex$lib$parser$$ParserBuf$regex(self) {
  const _bind = jian$mbtlex$lib$parser$$ParserBuf$repeat_match$62$(self, (p) => moonbitlang$core$option$$Option$bind$38$(jian$mbtlex$lib$parser$$ParserBuf$regex_nonleftrec(p), (_param13) => {
    const _x = _param13._0;
    const _x$2 = _param13._1;
    return jian$mbtlex$lib$parser$$ParserBuf$regex_leftrec(_x, _x$2);
  }));
  const _x = _bind._0;
  const _x$2 = _bind._1;
  if (_x$2.length === 0) {
    return undefined;
  } else {
    const head = moonbitlang$core$option$$Option$unwrap$62$(moonbitlang$core$array$$Array$get$62$(_x$2, 0));
    return { _0: _x, _1: moonbitlang$core$array$$Array$fold$109$(moonbitlang$core$array$$Array$split_at$62$(_x$2, 1)._1, head, (a, b) => new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Concat(a, b)) };
  }
}
function jian$mbtlex$lib$parser$$ParserBuf$regex_leftrec(self, re) {
  let _tmp = self;
  let _tmp$2 = re;
  _L: while (true) {
    const self$2 = _tmp;
    const re$2 = _tmp$2;
    const p = jian$mbtlex$lib$parser$$ParserBuf$skip_ws(self$2);
    _L$2: {
      const _bind = jian$mbtlex$lib$parser$$ParserBuf$peek(p, jian$mbtlex$lib$parser$$ParserBuf$peek$46$i$46$default());
      if (_bind === -1) {
        break _L$2;
      } else {
        const _Some = _bind;
        const _x = _Some;
        switch (_x) {
          case 124: {
            return moonbitlang$core$option$$Option$map$38$(jian$mbtlex$lib$parser$$ParserBuf$regex(jian$mbtlex$lib$parser$$ParserBuf$step(p, jian$mbtlex$lib$parser$$ParserBuf$step$46$i$46$default())), (_param11) => {
              const _x$2 = _param11._0;
              const _x$3 = _param11._1;
              return { _0: _x$2, _1: new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Alter(re$2, _x$3) };
            });
          }
          case 42: {
            const _tmp$3 = jian$mbtlex$lib$parser$$ParserBuf$step(p, jian$mbtlex$lib$parser$$ParserBuf$step$46$i$46$default());
            const _tmp$4 = new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Option(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Repetition(re$2));
            _tmp = _tmp$3;
            _tmp$2 = _tmp$4;
            continue _L;
          }
          case 43: {
            const _tmp$5 = jian$mbtlex$lib$parser$$ParserBuf$step(p, jian$mbtlex$lib$parser$$ParserBuf$step$46$i$46$default());
            const _tmp$6 = new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Repetition(re$2);
            _tmp = _tmp$5;
            _tmp$2 = _tmp$6;
            continue _L;
          }
          case 63: {
            const _tmp$7 = jian$mbtlex$lib$parser$$ParserBuf$step(p, jian$mbtlex$lib$parser$$ParserBuf$step$46$i$46$default());
            const _tmp$8 = new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Option(re$2);
            _tmp = _tmp$7;
            _tmp$2 = _tmp$8;
            continue _L;
          }
          case 97: {
            return moonbitlang$core$option$$Option$bind$36$(jian$mbtlex$lib$parser$$ParserBuf$match_str(p, "as"), (p$2) => moonbitlang$core$option$$Option$map$37$(jian$mbtlex$lib$parser$$ParserBuf$identifier(jian$mbtlex$lib$parser$$ParserBuf$skip_ws(p$2)), (_param12) => {
              const _x$2 = _param12._0;
              const _x$3 = _param12._1;
              return { _0: _x$2, _1: new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Capture(re$2, _x$3) };
            }));
          }
          default: {
            break _L$2;
          }
        }
      }
    }
    return { _0: p, _1: re$2 };
  }
}
function jian$mbtlex$lib$parser$$ParserBuf$ty(self) {
  const stack = [];
  let _tmp = 0;
  _L: while (true) {
    const i = _tmp;
    _L$2: {
      let c;
      _L$3: {
        _L$4: {
          const _bind = jian$mbtlex$lib$parser$$ParserBuf$peek(self, i);
          if (_bind === -1) {
            return undefined;
          } else {
            const _Some = _bind;
            const _x = _Some;
            switch (_x) {
              case 91: {
                c = _x;
                break _L$4;
              }
              case 40: {
                c = _x;
                break _L$4;
              }
              case 44: {
                if (moonbitlang$core$array$$Array$is_empty$2$(stack)) {
                  return { _0: jian$mbtlex$lib$parser$$ParserBuf$step(self, i), _1: moonbitlang$core$option$$Option$unwrap$3$(jian$mbtlex$lib$parser$$ParserBuf$get_str(self, i)) };
                }
                break;
              }
              case 123: {
                if (moonbitlang$core$array$$Array$is_empty$2$(stack)) {
                  return { _0: jian$mbtlex$lib$parser$$ParserBuf$step(self, i), _1: moonbitlang$core$option$$Option$unwrap$3$(jian$mbtlex$lib$parser$$ParserBuf$get_str(self, i)) };
                } else {
                  return undefined;
                }
              }
              case 41: {
                if (moonbitlang$core$array$$Array$is_empty$2$(stack)) {
                  return { _0: jian$mbtlex$lib$parser$$ParserBuf$step(self, i), _1: moonbitlang$core$option$$Option$unwrap$3$(jian$mbtlex$lib$parser$$ParserBuf$get_str(self, i)) };
                } else {
                  if (moonbitlang$core$builtin$$op_notequal$53$(moonbitlang$core$array$$Array$pop$2$(stack), 40)) {
                    return undefined;
                  }
                }
                break;
              }
              case 93: {
                if (moonbitlang$core$builtin$$op_notequal$53$(moonbitlang$core$array$$Array$pop$2$(stack), 91)) {
                  return undefined;
                }
                break;
              }
              default: {
                break _L$2;
              }
            }
          }
          break _L$3;
        }
        moonbitlang$core$array$$Array$push$2$(stack, c);
      }
      break _L$2;
    }
    _tmp = i + 1 | 0;
    continue;
  }
}
function jian$mbtlex$lib$parser$$ParserBuf$var_definition(self) {
  return moonbitlang$core$option$$Option$bind$43$(jian$mbtlex$lib$parser$$ParserBuf$identifier(jian$mbtlex$lib$parser$$ParserBuf$skip_ws(self)), (_param14) => {
    const _x = _param14._0;
    const _x$2 = _param14._1;
    return moonbitlang$core$option$$Option$bind$42$(jian$mbtlex$lib$parser$$ParserBuf$match_str(jian$mbtlex$lib$parser$$ParserBuf$skip_ws(_x), ":"), (p) => {
      const _bind = jian$mbtlex$lib$parser$$ParserBuf$ty(p);
      if (_bind === undefined) {
        return undefined;
      } else {
        const _Some = _bind;
        const _x$3 = _Some;
        const _x$4 = _x$3._0;
        const _x$5 = _x$3._1;
        return { _0: _x$4, _1: { identifier: _x$2, ty: _x$5 } };
      }
    });
  });
}
function jian$mbtlex$lib$parser$$ParserBuf$code_block(self) {
  const re = new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Option(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Repetition(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Alter(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$RevCharSet([123, 125, 39, 34]), new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Alter(jian$mbtlex$lib$parser$$char_re, jian$mbtlex$lib$parser$$string_re))));
  return moonbitlang$core$option$$Option$bind$40$(jian$mbtlex$lib$parser$$ParserBuf$match_str(jian$mbtlex$lib$parser$$ParserBuf$skip_ws(self), "{"), (p) => {
    const strbuf = [];
    let mut_p = p;
    let _tmp = 1;
    _L: while (true) {
      const count = _tmp;
      const _bind = jian$mbtlex$lib$parser$$ParserBuf$match_re(mut_p, re);
      if (_bind === undefined) {
        return undefined;
      } else {
        const _Some = _bind;
        const _x = _Some;
        const _x$2 = _x._0;
        const _x$3 = _x._1;
        moonbitlang$core$array$$Array$push$3$(strbuf, _x$3);
        _L$2: {
          const _bind$2 = jian$mbtlex$lib$parser$$ParserBuf$peek(_x$2, jian$mbtlex$lib$parser$$ParserBuf$peek$46$i$46$default());
          if (_bind$2 === -1) {
            break _L$2;
          } else {
            const _Some$2 = _bind$2;
            const _x$4 = _Some$2;
            switch (_x$4) {
              case 123: {
                moonbitlang$core$array$$Array$push$3$(strbuf, "{");
                mut_p = jian$mbtlex$lib$parser$$ParserBuf$step(_x$2, jian$mbtlex$lib$parser$$ParserBuf$step$46$i$46$default());
                _tmp = count + 1 | 0;
                continue _L;
              }
              case 125: {
                mut_p = jian$mbtlex$lib$parser$$ParserBuf$step(_x$2, jian$mbtlex$lib$parser$$ParserBuf$step$46$i$46$default());
                if (count === 1) {
                  break _L;
                } else {
                  moonbitlang$core$array$$Array$push$3$(strbuf, "}");
                  _tmp = count - 1 | 0;
                  continue _L;
                }
              }
              default: {
                break _L$2;
              }
            }
          }
        }
        moonbitlang$core$builtin$$abort$49$("unreachable");
      }
      continue;
    }
    return { _0: mut_p, _1: moonbitlang$core$array$$Array$fold$108$(strbuf, "", (a, b) => `${a}${b}`) };
  });
}
function jian$mbtlex$lib$parser$$ParserBuf$rule(self) {
  const _bind = jian$mbtlex$lib$parser$$ParserBuf$match_str(jian$mbtlex$lib$parser$$ParserBuf$skip_ws(self), "rule");
  if (_bind === undefined) {
    return undefined;
  } else {
    const _Some = _bind;
    const _x = _Some;
    const _bind$2 = jian$mbtlex$lib$parser$$ParserBuf$identifier(jian$mbtlex$lib$parser$$ParserBuf$skip_ws(_x));
    if (_bind$2 === undefined) {
      return undefined;
    } else {
      const _Some$2 = _bind$2;
      const _x$2 = _Some$2;
      const _x$3 = _x$2._0;
      const _x$4 = _x$2._1;
      const _bind$3 = jian$mbtlex$lib$parser$$ParserBuf$match_str(jian$mbtlex$lib$parser$$ParserBuf$skip_ws(_x$3), "(");
      if (_bind$3 === undefined) {
        return undefined;
      } else {
        const _Some$3 = _bind$3;
        const _x$5 = _Some$3;
        const _bind$4 = jian$mbtlex$lib$parser$$ParserBuf$repeat_match$8$(_x$5, (p) => {
          const _bind$5 = jian$mbtlex$lib$parser$$ParserBuf$var_definition(p);
          if (_bind$5 === undefined) {
            return undefined;
          } else {
            const _Some$4 = _bind$5;
            const _x$6 = _Some$4;
            const _x$7 = _x$6._0;
            const _x$8 = _x$6._1;
            const _bind$6 = jian$mbtlex$lib$parser$$ParserBuf$match_re(jian$mbtlex$lib$parser$$ParserBuf$skip_ws(_x$7), new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$Option(new $64$jian$47$mbtlex$47$lib$47$type$46$Regex$ReStr(",")));
            if (_bind$6 === undefined) {
              return undefined;
            } else {
              const _Some$5 = _bind$6;
              const _x$9 = _Some$5;
              const _x$10 = _x$9._0;
              return { _0: _x$10, _1: _x$8 };
            }
          }
        });
        const _x$6 = _bind$4._0;
        const _x$7 = _bind$4._1;
        const _bind$5 = jian$mbtlex$lib$parser$$ParserBuf$match_str_array(_x$6, [")", "->"]);
        if (_bind$5 === undefined) {
          return undefined;
        } else {
          const _Some$4 = _bind$5;
          const _x$8 = _Some$4;
          const _bind$6 = jian$mbtlex$lib$parser$$ParserBuf$ty(_x$8);
          if (_bind$6 === undefined) {
            return undefined;
          } else {
            const _Some$5 = _bind$6;
            const _x$9 = _Some$5;
            const _x$10 = _x$9._0;
            const _x$11 = _x$9._1;
            const _bind$7 = jian$mbtlex$lib$parser$$ParserBuf$match_str_array(_x$10, ["{", "parse", "{"]);
            if (_bind$7 === undefined) {
              return undefined;
            } else {
              const _Some$6 = _bind$7;
              const _x$12 = _Some$6;
              const _bind$8 = jian$mbtlex$lib$parser$$ParserBuf$repeat_match$65$(_x$12, (p) => {
                const p$2 = jian$mbtlex$lib$parser$$ParserBuf$skip_ws(p);
                const _bind$9 = jian$mbtlex$lib$parser$$ParserBuf$regex(p$2);
                if (_bind$9 === undefined) {
                  return undefined;
                } else {
                  const _Some$7 = _bind$9;
                  const _x$13 = _Some$7;
                  const _x$14 = _x$13._0;
                  const _x$15 = _x$13._1;
                  const _bind$10 = jian$mbtlex$lib$parser$$ParserBuf$match_str(jian$mbtlex$lib$parser$$ParserBuf$skip_ws(_x$14), "=>");
                  if (_bind$10 === undefined) {
                    return undefined;
                  } else {
                    const _Some$8 = _bind$10;
                    const _x$16 = _Some$8;
                    const _bind$11 = jian$mbtlex$lib$parser$$ParserBuf$code_block(_x$16);
                    if (_bind$11 === undefined) {
                      return undefined;
                    } else {
                      const _Some$9 = _bind$11;
                      const _x$17 = _Some$9;
                      const _x$18 = _x$17._0;
                      const _x$19 = _x$17._1;
                      return { _0: _x$18, _1: { _0: _x$15, _1: _x$19 } };
                    }
                  }
                }
              });
              const _x$13 = _bind$8._0;
              const _x$14 = _bind$8._1;
              const _bind$9 = jian$mbtlex$lib$parser$$ParserBuf$match_str_array(_x$13, ["}", "}"]);
              if (_bind$9 === undefined) {
                return undefined;
              } else {
                const _Some$7 = _bind$9;
                const _x$15 = _Some$7;
                return { _0: _x$15, _1: { name: _x$4, return_type: _x$11, vars: _x$7, patterns: _x$14 } };
              }
            }
          }
        }
      }
    }
  }
}
function jian$mbtlex$lib$parser$$ParserBuf$lex(self) {
  const _bind = jian$mbtlex$lib$parser$$ParserBuf$code_block(self);
  if (_bind === undefined) {
    return undefined;
  } else {
    const _Some = _bind;
    const _x = _Some;
    const _x$2 = _x._0;
    const _x$3 = _x._1;
    const _bind$2 = jian$mbtlex$lib$parser$$ParserBuf$repeat_match$67$(_x$2, jian$mbtlex$lib$parser$$ParserBuf$rule);
    const _x$4 = _bind$2._0;
    const _x$5 = _bind$2._1;
    const _bind$3 = jian$mbtlex$lib$parser$$ParserBuf$code_block(_x$4);
    if (_bind$3 === undefined) {
      return undefined;
    } else {
      const _Some$2 = _bind$3;
      const _x$6 = _Some$2;
      const _x$7 = _x$6._0;
      const _x$8 = _x$6._1;
      return { _0: _x$7, _1: { header: _x$3, rules: _x$5, trailer: _x$8 } };
    }
  }
}
function moonbitlang$core$builtin$$Eq$op_equal$20$(_x_240, _x_241) {
  return moonbitlang$core$array$$Array$op_equal$9$(_x_240, _x_241);
}
function moonbitlang$core$builtin$$Hash$hash_combine$20$(self, hasher) {
  moonbitlang$core$array$$Array$each$9$(self, (x) => {
    moonbitlang$core$builtin$$Hasher$combine$9$(hasher, x);
  });
}
function jian$mbtlex$lib$automaton$$TagState$new(size) {
  return moonbitlang$core$array$$Array$make$9$(size, undefined);
}
function jian$mbtlex$lib$automaton$$TagState$copy(self) {
  return moonbitlang$core$array$$Array$copy$9$(self);
}
function jian$mbtlex$lib$automaton$$TagState$update_by_tag(self, tag, rank) {
  const r = moonbitlang$core$array$$Array$op_get$9$(self, tag);
  if (moonbitlang$core$option$$Option$is_empty$7$(r) || moonbitlang$core$option$$Option$unwrap$7$(r) > rank) {
    moonbitlang$core$array$$Array$op_set$9$(self, tag, rank);
  }
  return self;
}
function jian$mbtlex$lib$automaton$$TagState$update_by_tags(self, tags) {
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < self.length) {
      if (jian$mbtlex$lib$type$$Bitset$get(tags, i)) {
        jian$mbtlex$lib$automaton$$TagState$update_by_tag(self, i, -1);
      }
      _tmp = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return self;
}
function jian$mbtlex$lib$automaton$$TagState$tagState_min(self, other) {
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < self.length) {
      const _bind = moonbitlang$core$array$$Array$op_get$9$(self, i);
      const _bind$2 = moonbitlang$core$array$$Array$op_get$9$(other, i);
      if (_bind === undefined) {
        return other;
      } else {
        if (_bind$2 === undefined) {
          return self;
        } else {
          const _Some = _bind;
          const _x = _Some;
          const _Some$2 = _bind$2;
          const _x$2 = _Some$2;
          if (_x !== _x$2) {
            return _x < _x$2 ? self : other;
          }
        }
      }
      _tmp = i + 1 | 0;
      continue;
    } else {
      return self;
    }
  }
}
function jian$mbtlex$lib$automaton$$DFA$new(code_blocks, captures, start_action) {
  return { graph: [moonbitlang$core$builtin$$Map$new$83$(moonbitlang$core$builtin$$Map$new$46$capacity$46$default$83$())], end_nodes: moonbitlang$core$builtin$$Map$new$82$(moonbitlang$core$builtin$$Map$new$46$capacity$46$default$82$()), code_blocks: code_blocks, captures: captures, start_action: start_action, node_count: 1 };
}
function jian$mbtlex$lib$automaton$$DFA$new_node(self) {
  const id = self.node_count;
  self.node_count = self.node_count + 1 | 0;
  moonbitlang$core$array$$Array$push$71$(self.graph, moonbitlang$core$builtin$$Map$new$83$(moonbitlang$core$builtin$$Map$new$46$capacity$46$default$83$()));
  return id;
}
function jian$mbtlex$lib$automaton$$DFA$add_edge(self, from, e, action, to) {
  moonbitlang$core$builtin$$Map$set$83$(moonbitlang$core$array$$Array$op_get$71$(self.graph, from), e, { _0: to, _1: action });
}
function jian$mbtlex$lib$automaton$$state_canonicalize(state, tag_count) {
  const mat = moonbitlang$core$array$$Array$makei$10$(tag_count, (_i) => []);
  const _bind = moonbitlang$core$immut$hashmap$$T$iter$15$(state);
  _bind((pair) => {
    const tags = pair._1;
    const _arr = tags;
    const _len = _arr.length;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const rank = moonbitlang$core$array$$Array$op_get$9$(_arr, _i);
        if (!moonbitlang$core$option$$Option$is_empty$7$(rank)) {
          moonbitlang$core$array$$Array$push$7$(moonbitlang$core$array$$Array$op_get$10$(mat, _i), moonbitlang$core$option$$Option$unwrap$7$(rank));
        }
        _tmp = _i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    return 1;
  });
  moonbitlang$core$array$$Array$map_inplace$10$(mat, (x) => moonbitlang$core$sorted_set$$T$to_array$7$(moonbitlang$core$sorted_set$$T$from_iter$7$(moonbitlang$core$array$$Array$iter$7$(x))));
  const _bind$2 = moonbitlang$core$immut$hashmap$$T$iter$15$(state);
  const new_state = moonbitlang$core$immut$hashmap$$T$from_iter$15$((_p) => _bind$2((_p$2) => {
    const tags = _p$2._1;
    moonbitlang$core$array$$Array$mapi_inplace$9$(tags, (tag, op) => moonbitlang$core$option$$Option$map$33$(op, (x) => {
      const _arr = moonbitlang$core$array$$Array$op_get$10$(mat, tag);
      const _len = _arr.length;
      let _tmp = 0;
      while (true) {
        const _i = _tmp;
        if (_i < _len) {
          const y = moonbitlang$core$array$$Array$op_get$7$(_arr, _i);
          if (x === y) {
            return _i;
          }
          _tmp = _i + 1 | 0;
          continue;
        } else {
          return moonbitlang$core$builtin$$abort$7$("unreachable");
        }
      }
    }));
    return _p({ _0: _p$2._0, _1: tags });
  }));
  return { _0: new_state, _1: mat };
}
function jian$mbtlex$lib$automaton$$DFA$register_node(self, nfa, node, os) {
  const code_blocks = moonbitlang$core$builtin$$Iter$collect$7$(moonbitlang$core$builtin$$Iter$map_option$111$(moonbitlang$core$immut$hashmap$$T$iter$15$(os), (x) => moonbitlang$core$builtin$$Map$get$33$(nfa.end_nodes, x._0)));
  if (!moonbitlang$core$array$$Array$is_empty$7$(code_blocks)) {
    const min_code_block = moonbitlang$core$array$$Array$fold$33$(code_blocks, moonbitlang$core$array$$Array$op_get$7$(code_blocks, 0), moonbitlang$core$math$$minimum$7$);
    const _bind = moonbitlang$core$immut$hashmap$$T$iter$15$(os);
    const end_nodes = moonbitlang$core$builtin$$Iter$to_array$18$((_p) => _bind((_p$2) => moonbitlang$core$option$$Option$op_equal$7$(moonbitlang$core$builtin$$Map$get$33$(nfa.end_nodes, _p$2._0), min_code_block) ? _p(_p$2) : 1));
    if (end_nodes.length === 1) {
      const tagState = moonbitlang$core$array$$Array$op_get$18$(end_nodes, 0)._1;
      const min_tags = moonbitlang$core$array$$Array$map$94$(moonbitlang$core$array$$Array$op_get$58$(nfa.captures, min_code_block), (_param1) => {
        const _x = _param1._1;
        const _x$2 = _x._0;
        const _x$3 = _x._1;
        return { _0: { _0: _x$2, _1: moonbitlang$core$option$$Option$unwrap$7$(moonbitlang$core$array$$Array$op_get$9$(tagState, _x$2)) }, _1: { _0: _x$3, _1: moonbitlang$core$option$$Option$unwrap$7$(moonbitlang$core$array$$Array$op_get$9$(tagState, _x$3)) } };
      });
      moonbitlang$core$builtin$$Map$set$82$(self.end_nodes, node, { _0: min_code_block, _1: min_tags });
      return;
    } else {
      moonbitlang$core$builtin$$abort$49$("error");
      return;
    }
  } else {
    return;
  }
}
function jian$mbtlex$lib$automaton$$get_eps_closure$46$get_bits$113$(_env, n) {
  const result = _env._1;
  const empty_bits = _env._0;
  return moonbitlang$core$builtin$$Map$get_or_default$14$(result, n, empty_bits);
}
function jian$mbtlex$lib$automaton$$NFA$get_eps_closure(self) {
  return moonbitlang$core$array$$Array$makei$5$(self.node_count, (x) => {
    const empty_bits = jian$mbtlex$lib$type$$Bitset$new(self.tag_count);
    const result = moonbitlang$core$builtin$$Map$from_array$14$([{ _0: x, _1: empty_bits }]);
    const _env = { _0: empty_bits, _1: result };
    const queue = moonbitlang$core$queue$$T$from_array$7$([x]);
    while (true) {
      if (!moonbitlang$core$queue$$T$is_empty$7$(queue)) {
        const o = moonbitlang$core$queue$$T$unsafe_pop$7$(queue);
        const o_bits = jian$mbtlex$lib$automaton$$get_eps_closure$46$get_bits$113$(_env, o);
        const _arr = moonbitlang$core$builtin$$Map$get_or_default$81$(moonbitlang$core$array$$Array$op_get$61$(self.graph, o), $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$Eps, []);
        const _len = _arr.length;
        let _tmp = 0;
        while (true) {
          const _i = _tmp;
          if (_i < _len) {
            const e = moonbitlang$core$array$$Array$op_get$60$(_arr, _i);
            const _x = e._0;
            const _x$2 = e._1;
            let new_u_bits = jian$mbtlex$lib$type$$Bitset$union(jian$mbtlex$lib$automaton$$get_eps_closure$46$get_bits$113$(_env, _x), o_bits);
            if (!moonbitlang$core$option$$Option$is_empty$7$(_x$2)) {
              new_u_bits = jian$mbtlex$lib$type$$Bitset$copy(new_u_bits);
              jian$mbtlex$lib$type$$Bitset$set(new_u_bits, moonbitlang$core$option$$Option$unwrap$7$(_x$2), true);
            }
            if (moonbitlang$core$builtin$$op_notequal$50$(new_u_bits, moonbitlang$core$builtin$$Map$get$14$(result, _x))) {
              moonbitlang$core$builtin$$Map$set$14$(result, _x, new_u_bits);
              moonbitlang$core$queue$$T$push$7$(queue, _x);
            }
            _tmp = _i + 1 | 0;
            continue;
          } else {
            break;
          }
        }
        continue;
      } else {
        break;
      }
    }
    return moonbitlang$core$immut$hashmap$$T$from_iter$14$(moonbitlang$core$builtin$$Map$iter$14$(result));
  });
}
function jian$mbtlex$lib$automaton$$from_nfa$46$get_id$114$(_env, state) {
  const node_map = _env._3;
  const dfa = _env._2;
  const nfa = _env._1;
  const queue = _env._0;
  return moonbitlang$core$builtin$$Map$get_or_init$86$(node_map, state, () => {
    const node = jian$mbtlex$lib$automaton$$DFA$new_node(dfa);
    jian$mbtlex$lib$automaton$$DFA$register_node(dfa, nfa, node, state);
    moonbitlang$core$queue$$T$push$6$(queue, state);
    return node;
  });
}
function jian$mbtlex$lib$automaton$$from_nfa$46$42$bind$115$(_bind, _p) {
  return _bind((_p$2) => _p(_p$2._0));
}
function jian$mbtlex$lib$automaton$$DFA$from_nfa(nfa) {
  const eps_closure = jian$mbtlex$lib$automaton$$NFA$get_eps_closure(nfa);
  const initial = moonbitlang$core$array$$Array$op_get$5$(eps_closure, 1);
  const _bind = moonbitlang$core$immut$hashmap$$T$iter$14$(initial);
  const initial_state = moonbitlang$core$immut$hashmap$$T$from_iter$15$((_p) => _bind((_p$2) => {
    const _x = _p$2._0;
    const _x$2 = _p$2._1;
    return _p({ _0: _x, _1: jian$mbtlex$lib$automaton$$TagState$update_by_tags(jian$mbtlex$lib$automaton$$TagState$new(nfa.tag_count), _x$2) });
  }));
  const _bind$2 = jian$mbtlex$lib$automaton$$state_canonicalize(initial_state, nfa.tag_count);
  const _x = _bind$2._0;
  const _x$2 = _bind$2._1;
  const captures = moonbitlang$core$array$$Array$map$97$(nfa.captures, (x) => moonbitlang$core$array$$Array$map$96$(x, (y) => y._0));
  const dfa = jian$mbtlex$lib$automaton$$DFA$new(nfa.code_blocks, captures, _x$2);
  const node_map = moonbitlang$core$builtin$$Map$new$86$(moonbitlang$core$builtin$$Map$new$46$capacity$46$default$86$());
  const queue = moonbitlang$core$queue$$T$new$6$();
  const _env = { _0: queue, _1: nfa, _2: dfa, _3: node_map };
  jian$mbtlex$lib$automaton$$from_nfa$46$get_id$114$(_env, _x);
  while (true) {
    if (!moonbitlang$core$queue$$T$is_empty$6$(queue)) {
      const cur_state = moonbitlang$core$option$$Option$unwrap$6$(moonbitlang$core$queue$$T$pop$6$(queue));
      const from_n = moonbitlang$core$option$$Option$unwrap$7$(moonbitlang$core$builtin$$Map$get$86$(node_map, cur_state));
      const next_states = moonbitlang$core$builtin$$Map$new$85$(moonbitlang$core$builtin$$Map$new$46$capacity$46$default$85$());
      const _bind$3 = moonbitlang$core$immut$hashmap$$T$iter$15$(cur_state);
      jian$mbtlex$lib$automaton$$from_nfa$46$42$bind$115$(_bind$3, (node) => {
        const node_tagState = moonbitlang$core$option$$Option$unwrap$20$(moonbitlang$core$immut$hashmap$$T$op_get$15$(cur_state, node));
        const _bind$4 = moonbitlang$core$builtin$$Map$iter2$81$(moonbitlang$core$array$$Array$op_get$61$(nfa.graph, node));
        _bind$4((edge, targets) => {
          if (edge.$tag === 1) {
            const _EChar = edge;
            const _x$3 = _EChar._0;
            const state_map = { val: moonbitlang$core$option$$Option$or_else$6$(moonbitlang$core$builtin$$Map$op_get$85$(next_states, _x$3), () => moonbitlang$core$immut$hashmap$$T$new$15$()) };
            const _len = targets.length;
            let _tmp = 0;
            while (true) {
              const _i = _tmp;
              if (_i < _len) {
                const pair = moonbitlang$core$array$$Array$op_get$60$(targets, _i);
                const _x$4 = pair._0;
                const _x$5 = pair._1;
                if (moonbitlang$core$option$$Option$is_empty$7$(_x$5)) {
                  const _bind$5 = moonbitlang$core$immut$hashmap$$T$iter$14$(moonbitlang$core$array$$Array$op_get$5$(eps_closure, _x$4));
                  _bind$5((pair$2) => {
                    const _x$6 = pair$2._0;
                    const _x$7 = pair$2._1;
                    const upd_tagState = jian$mbtlex$lib$automaton$$TagState$update_by_tags(jian$mbtlex$lib$automaton$$TagState$copy(node_tagState), _x$7);
                    const old_tagState = moonbitlang$core$immut$hashmap$$T$op_get$15$(state_map.val, _x$6);
                    const new_tagState = moonbitlang$core$option$$Option$is_empty$20$(old_tagState) ? upd_tagState : jian$mbtlex$lib$automaton$$TagState$tagState_min(upd_tagState, moonbitlang$core$option$$Option$unwrap$20$(old_tagState));
                    state_map.val = moonbitlang$core$immut$hashmap$$T$add$15$(state_map.val, _x$6, new_tagState);
                    return 1;
                  });
                } else {
                  moonbitlang$core$builtin$$abort$49$("error");
                }
                _tmp = _i + 1 | 0;
                continue;
              } else {
                break;
              }
            }
            moonbitlang$core$builtin$$Map$set$85$(next_states, _x$3, state_map.val);
          }
          return 1;
        });
        return 1;
      });
      const _bind$4 = moonbitlang$core$builtin$$Map$iter2$85$(next_states);
      _bind$4((ch, state) => {
        const _bind$5 = jian$mbtlex$lib$automaton$$state_canonicalize(state, nfa.tag_count);
        const _x$3 = _bind$5._0;
        const _x$4 = _bind$5._1;
        const to_n = jian$mbtlex$lib$automaton$$from_nfa$46$get_id$114$(_env, _x$3);
        jian$mbtlex$lib$automaton$$DFA$add_edge(dfa, from_n, ch, _x$4, to_n);
        return 1;
      });
      continue;
    } else {
      break;
    }
  }
  return dfa;
}
function jian$mbtlex$lib$automaton$$NFA$add_edge(self, from, s, tag, to) {
  moonbitlang$core$array$$Array$push$60$(moonbitlang$core$builtin$$Map$get_or_init$81$(moonbitlang$core$array$$Array$op_get$61$(self.graph, from), s, () => []), { _0: to, _1: tag });
}
function jian$mbtlex$lib$automaton$$NFA$add_edge$46$tag$46$default() {
  return undefined;
}
function jian$mbtlex$lib$automaton$$NFA$new_node(self) {
  const new_id = self.node_count;
  self.node_count = self.node_count + 1 | 0;
  moonbitlang$core$array$$Array$push$61$(self.graph, moonbitlang$core$builtin$$Map$new$81$(moonbitlang$core$builtin$$Map$new$46$capacity$46$default$81$()));
  return (new_id + 1 | 0) === self.graph.length ? new_id : $panic();
}
function jian$mbtlex$lib$automaton$$NFA$register_regex_rec(self, node, re, name2tag) {
  let _tmp = self;
  let _tmp$2 = node;
  let _tmp$3 = re;
  let _tmp$4 = name2tag;
  _L: while (true) {
    const self$2 = _tmp;
    const node$2 = _tmp$2;
    const re$2 = _tmp$3;
    const name2tag$2 = _tmp$4;
    switch (re$2.$tag) {
      case 0: {
        const next_node = jian$mbtlex$lib$automaton$$NFA$new_node(self$2);
        let _tmp$5 = 1;
        while (true) {
          const c = _tmp$5;
          if (c < 128) {
            jian$mbtlex$lib$automaton$$NFA$add_edge(self$2, node$2, new $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$EChar(c), jian$mbtlex$lib$automaton$$NFA$add_edge$46$tag$46$default(), next_node);
            _tmp$5 = c + 1 | 0;
            continue;
          } else {
            break;
          }
        }
        return next_node;
      }
      case 1: {
        const next_node$2 = jian$mbtlex$lib$automaton$$NFA$new_node(self$2);
        jian$mbtlex$lib$automaton$$NFA$add_edge(self$2, node$2, new $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$EChar(0), jian$mbtlex$lib$automaton$$NFA$add_edge$46$tag$46$default(), next_node$2);
        return next_node$2;
      }
      case 3: {
        const _ReChar = re$2;
        const _x = _ReChar._0;
        const next_node$3 = jian$mbtlex$lib$automaton$$NFA$new_node(self$2);
        jian$mbtlex$lib$automaton$$NFA$add_edge(self$2, node$2, new $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$EChar(_x), jian$mbtlex$lib$automaton$$NFA$add_edge$46$tag$46$default(), next_node$3);
        return next_node$3;
      }
      case 2: {
        const _ReStr = re$2;
        const _x$2 = _ReStr._0;
        const next_node$4 = { val: node$2 };
        const last_node = { val: node$2 };
        const _bind = moonbitlang$core$string$$String$iter(_x$2);
        _bind((c) => {
          next_node$4.val = jian$mbtlex$lib$automaton$$NFA$new_node(self$2);
          jian$mbtlex$lib$automaton$$NFA$add_edge(self$2, last_node.val, new $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$EChar(c), jian$mbtlex$lib$automaton$$NFA$add_edge$46$tag$46$default(), next_node$4.val);
          last_node.val = next_node$4.val;
          return 1;
        });
        return next_node$4.val;
      }
      case 4: {
        const _CharSet = re$2;
        const _x$3 = _CharSet._0;
        const next_node$5 = jian$mbtlex$lib$automaton$$NFA$new_node(self$2);
        const _len = _x$3.length;
        let _tmp$6 = 0;
        while (true) {
          const _i = _tmp$6;
          if (_i < _len) {
            const c = moonbitlang$core$array$$Array$op_get$2$(_x$3, _i);
            jian$mbtlex$lib$automaton$$NFA$add_edge(self$2, node$2, new $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$EChar(c), jian$mbtlex$lib$automaton$$NFA$add_edge$46$tag$46$default(), next_node$5);
            _tmp$6 = _i + 1 | 0;
            continue;
          } else {
            break;
          }
        }
        return next_node$5;
      }
      case 5: {
        const _RevCharSet = re$2;
        const _x$4 = _RevCharSet._0;
        const next_node$6 = jian$mbtlex$lib$automaton$$NFA$new_node(self$2);
        let _tmp$7 = 1;
        while (true) {
          const c = _tmp$7;
          if (c < 128) {
            const c$2 = c;
            if (!moonbitlang$core$array$$Array$contains$2$(_x$4, c$2)) {
              jian$mbtlex$lib$automaton$$NFA$add_edge(self$2, node$2, new $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$EChar(c$2), jian$mbtlex$lib$automaton$$NFA$add_edge$46$tag$46$default(), next_node$6);
            }
            _tmp$7 = c + 1 | 0;
            continue;
          } else {
            break;
          }
        }
        return next_node$6;
      }
      case 7: {
        const _Option = re$2;
        const _x$5 = _Option._0;
        const new_node = jian$mbtlex$lib$automaton$$NFA$new_node(self$2);
        const final_ = jian$mbtlex$lib$automaton$$NFA$register_regex_rec(self$2, new_node, _x$5, name2tag$2);
        const new_final = jian$mbtlex$lib$automaton$$NFA$new_node(self$2);
        jian$mbtlex$lib$automaton$$NFA$add_edge(self$2, node$2, $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$Eps, jian$mbtlex$lib$automaton$$NFA$add_edge$46$tag$46$default(), new_node);
        jian$mbtlex$lib$automaton$$NFA$add_edge(self$2, final_, $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$Eps, jian$mbtlex$lib$automaton$$NFA$add_edge$46$tag$46$default(), new_final);
        jian$mbtlex$lib$automaton$$NFA$add_edge(self$2, node$2, $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$Eps, jian$mbtlex$lib$automaton$$NFA$add_edge$46$tag$46$default(), new_final);
        return new_final;
      }
      case 6: {
        const _Repetition = re$2;
        const _x$6 = _Repetition._0;
        const new_node$2 = jian$mbtlex$lib$automaton$$NFA$new_node(self$2);
        const final_$2 = jian$mbtlex$lib$automaton$$NFA$register_regex_rec(self$2, new_node$2, _x$6, name2tag$2);
        const new_final$2 = jian$mbtlex$lib$automaton$$NFA$new_node(self$2);
        jian$mbtlex$lib$automaton$$NFA$add_edge(self$2, node$2, $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$Eps, jian$mbtlex$lib$automaton$$NFA$add_edge$46$tag$46$default(), new_node$2);
        jian$mbtlex$lib$automaton$$NFA$add_edge(self$2, final_$2, $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$Eps, jian$mbtlex$lib$automaton$$NFA$add_edge$46$tag$46$default(), new_final$2);
        jian$mbtlex$lib$automaton$$NFA$add_edge(self$2, new_final$2, $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$Eps, jian$mbtlex$lib$automaton$$NFA$add_edge$46$tag$46$default(), node$2);
        return new_final$2;
      }
      case 9: {
        const _Concat = re$2;
        const _x$7 = _Concat._0;
        const _x$8 = _Concat._1;
        const mid = jian$mbtlex$lib$automaton$$NFA$register_regex_rec(self$2, node$2, _x$7, name2tag$2);
        _tmp$2 = mid;
        _tmp$3 = _x$8;
        continue _L;
      }
      case 8: {
        const _Alter = re$2;
        const _x$9 = _Alter._0;
        const _x$10 = _Alter._1;
        const final_1 = jian$mbtlex$lib$automaton$$NFA$register_regex_rec(self$2, node$2, _x$9, name2tag$2);
        const final_2 = jian$mbtlex$lib$automaton$$NFA$register_regex_rec(self$2, node$2, _x$10, name2tag$2);
        const final_$3 = jian$mbtlex$lib$automaton$$NFA$new_node(self$2);
        jian$mbtlex$lib$automaton$$NFA$add_edge(self$2, final_1, $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$Eps, jian$mbtlex$lib$automaton$$NFA$add_edge$46$tag$46$default(), final_$3);
        jian$mbtlex$lib$automaton$$NFA$add_edge(self$2, final_2, $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$Eps, jian$mbtlex$lib$automaton$$NFA$add_edge$46$tag$46$default(), final_$3);
        return final_$3;
      }
      default: {
        const _Capture = re$2;
        const _x$11 = _Capture._0;
        const _x$12 = _Capture._1;
        const start = jian$mbtlex$lib$automaton$$NFA$new_node(self$2);
        const final_$4 = jian$mbtlex$lib$automaton$$NFA$new_node(self$2);
        const tail = jian$mbtlex$lib$automaton$$NFA$register_regex_rec(self$2, start, _x$11, name2tag$2);
        const _bind$2 = name2tag$2(_x$12);
        const _x$13 = _bind$2._0;
        const _x$14 = _bind$2._1;
        jian$mbtlex$lib$automaton$$NFA$add_edge(self$2, node$2, $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$Eps, _x$13, start);
        jian$mbtlex$lib$automaton$$NFA$add_edge(self$2, tail, $64$jian$47$mbtlex$47$lib$47$automaton$46$Symbol$Eps, _x$14, final_$4);
        return final_$4;
      }
    }
  }
}
function jian$mbtlex$lib$automaton$$NFA$register_regex(self, node, re, code_block, name2tag) {
  const final_ = jian$mbtlex$lib$automaton$$NFA$register_regex_rec(self, node, re, name2tag);
  const id = self.code_blocks.length;
  moonbitlang$core$array$$Array$push$3$(self.code_blocks, code_block);
  moonbitlang$core$builtin$$Map$set$33$(self.end_nodes, final_, id);
}
function jian$mbtlex$lib$automaton$$NFA$new_nfa() {
  return { graph: [moonbitlang$core$builtin$$Map$new$81$(moonbitlang$core$builtin$$Map$new$46$capacity$46$default$81$())], end_nodes: moonbitlang$core$builtin$$Map$new$33$(moonbitlang$core$builtin$$Map$new$46$capacity$46$default$33$()), code_blocks: [], captures: [], node_count: 1, tag_count: 0 };
}
function jian$mbtlex$lib$automaton$$NFA$from_rule(rule) {
  const nfa = jian$mbtlex$lib$automaton$$NFA$new_nfa();
  const node = jian$mbtlex$lib$automaton$$NFA$new_node(nfa);
  const _arr = rule.patterns;
  const _len = _arr.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const pattern = moonbitlang$core$array$$Array$op_get$65$(_arr, _i);
      const _x = pattern._0;
      const _x$2 = pattern._1;
      const capture_names = moonbitlang$core$array$$Array$map$98$(jian$mbtlex$lib$type$$Regex$get_capture_names(_x), (name) => {
        const begin_tag = nfa.tag_count;
        const end_tag = nfa.tag_count + 1 | 0;
        nfa.tag_count = nfa.tag_count + 2 | 0;
        return { _0: name, _1: { _0: begin_tag, _1: end_tag } };
      });
      const map = moonbitlang$core$builtin$$Map$from_array$84$(capture_names);
      jian$mbtlex$lib$automaton$$NFA$register_regex(nfa, node, _x, _x$2, (x) => moonbitlang$core$option$$Option$unwrap$64$(moonbitlang$core$builtin$$Map$get$84$(map, x)));
      moonbitlang$core$array$$Array$push$58$(nfa.captures, capture_names);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return nfa;
}
function jian$mbtlex$lib$automaton$$DFA$from_rule(rule) {
  return jian$mbtlex$lib$automaton$$DFA$from_nfa(jian$mbtlex$lib$automaton$$NFA$from_rule(rule));
}
function moonbitlang$core$builtin$$Eq$op_equal$80$(_x_110, _x_111) {
  if (_x_110.$tag === 0) {
    if (_x_111.$tag === 0) {
      return true;
    } else {
      return false;
    }
  } else {
    const _EChar = _x_110;
    const _x = _EChar._0;
    if (_x_111.$tag === 1) {
      const _EChar$2 = _x_111;
      const _x$2 = _EChar$2._0;
      return _x === _x$2;
    } else {
      return false;
    }
  }
}
function moonbitlang$core$builtin$$Hash$hash_combine$80$(_x_104, _x_105) {
  if (_x_104.$tag === 0) {
    moonbitlang$core$builtin$$Hasher$combine_int(_x_105, 0);
    return;
  } else {
    const _EChar = _x_104;
    const _x = _EChar._0;
    moonbitlang$core$builtin$$Hasher$combine_int(_x_105, 1);
    moonbitlang$core$builtin$$Hash$hash_combine$2$(_x, _x_105);
    return;
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$Lexbuf$from_string(content) {
  return { content: content, pos: 0 };
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$Lexbuf$next(self) {
  if (self.pos < self.content.length) {
    const ch = self.content.charCodeAt(self.pos);
    self.pos = self.pos + 1 | 0;
    return ch;
  } else {
    return -1;
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$Lexbuf$substring(self, start, end) {
  return moonbitlang$core$string$$String$substring(self.content, start, end);
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$LexEngine$run(self, lexbuf) {
  let state = 1;
  let tagState = [];
  const backtrace = moonbitlang$core$array$$Array$make$56$(self.code_blocks_n, undefined);
  const _arr = self.start_tags;
  const _len = _arr.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const tag = moonbitlang$core$array$$Array$op_get$7$(_arr, _i);
      while (true) {
        if (tagState.length <= tag) {
          moonbitlang$core$array$$Array$push$10$(tagState, []);
          continue;
        } else {
          break;
        }
      }
      moonbitlang$core$array$$Array$push$7$(moonbitlang$core$array$$Array$op_get$10$(tagState, tag), lexbuf.pos);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  while (true) {
    if (state !== 0) {
      const _bind = moonbitlang$core$array$$Array$op_get$11$(self.end_nodes, state);
      if (_bind === undefined) {
      } else {
        const _Some = _bind;
        const _x = _Some;
        moonbitlang$core$array$$Array$op_set$56$(backtrace, _x._0, { _0: lexbuf.pos, _1: state, _2: tagState });
      }
      const _bind$2 = jian$mbtlex$lib$codegen$internal$codeblock_parser$$Lexbuf$next(lexbuf);
      let b;
      if (_bind$2 === -1) {
        b = 0;
      } else {
        const _Some = _bind$2;
        const _x = _Some;
        b = _x;
      }
      const _func = moonbitlang$core$array$$Array$op_get$57$(self.graph, state);
      const next = _func(b);
      state = next._0;
      const new_tagState = [];
      let _tmp$2 = 0;
      while (true) {
        const i = _tmp$2;
        if (i < next._1.length) {
          moonbitlang$core$array$$Array$push$10$(new_tagState, []);
          let _tmp$3 = 0;
          while (true) {
            const j = _tmp$3;
            if (j < moonbitlang$core$array$$Array$op_get$10$(next._1, i).length) {
              const t = moonbitlang$core$array$$Array$op_get$7$(moonbitlang$core$array$$Array$op_get$10$(next._1, i), j);
              if (t === -1) {
                moonbitlang$core$array$$Array$push$7$(moonbitlang$core$array$$Array$op_get$10$(new_tagState, i), lexbuf.pos);
              } else {
                moonbitlang$core$array$$Array$push$7$(moonbitlang$core$array$$Array$op_get$10$(new_tagState, i), moonbitlang$core$array$$Array$op_get$7$(moonbitlang$core$array$$Array$op_get$10$(tagState, i), t));
              }
              _tmp$3 = j + 1 | 0;
              continue;
            } else {
              break;
            }
          }
          _tmp$2 = i + 1 | 0;
          continue;
        } else {
          break;
        }
      }
      tagState = new_tagState;
      continue;
    } else {
      break;
    }
  }
  const _len$2 = backtrace.length;
  let _tmp$2 = 0;
  while (true) {
    const _i = _tmp$2;
    if (_i < _len$2) {
      const b = moonbitlang$core$array$$Array$op_get$56$(backtrace, _i);
      if (b === undefined) {
      } else {
        const _Some = b;
        const _x = _Some;
        const _x$2 = _x._0;
        const _x$3 = _x._1;
        const _x$4 = _x._2;
        lexbuf.pos = _x$2;
        const captures = moonbitlang$core$array$$Array$map$95$(moonbitlang$core$option$$Option$unwrap$76$(moonbitlang$core$array$$Array$op_get$11$(self.end_nodes, _x$3))._1, (_param1) => {
          const _x$5 = _param1._0;
          const _x$6 = _x$5._0;
          const _x$7 = _x$5._1;
          const _x$8 = _param1._1;
          const _x$9 = _x$8._0;
          const _x$10 = _x$8._1;
          return { _0: moonbitlang$core$array$$Array$op_get$7$(moonbitlang$core$array$$Array$op_get$10$(_x$4, _x$6), _x$7), _1: moonbitlang$core$array$$Array$op_get$7$(moonbitlang$core$array$$Array$op_get$10$(_x$4, _x$9), _x$10) };
        });
        return { _0: _i, _1: captures };
      }
      _tmp$2 = _i + 1 | 0;
      continue;
    } else {
      return { _0: self.code_blocks_n, _1: [] };
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_0(input) {
  return { _0: 0, _1: [] };
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_1(input) {
  if (1 <= input && input <= 35) {
    return { _0: 5, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
  } else {
    if (input === 36) {
      return { _0: 2, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_1 };
    } else {
      if (37 <= input && input <= 122) {
        return { _0: 5, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
      } else {
        switch (input) {
          case 123: {
            return { _0: 3, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
          }
          case 124: {
            return { _0: 5, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
          }
          case 125: {
            return { _0: 4, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
          }
          default: {
            return 126 <= input && input <= 127 ? { _0: 5, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
          }
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_2(input) {
  if (65 <= input && input <= 90) {
    return { _0: 6, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
  } else {
    if (input === 95) {
      return { _0: 6, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
    } else {
      if (97 <= input && input <= 100) {
        return { _0: 6, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
      } else {
        if (input === 101) {
          return { _0: 7, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_2 };
        } else {
          if (102 <= input && input <= 114) {
            return { _0: 6, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
          } else {
            if (input === 115) {
              return { _0: 8, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_2 };
            } else {
              return 116 <= input && input <= 122 ? { _0: 6, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
            }
          }
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_3(input) {
  return { _0: 0, _1: [] };
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_4(input) {
  return { _0: 0, _1: [] };
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_5(input) {
  return { _0: 0, _1: [] };
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_6(input) {
  if (48 <= input && input <= 57) {
    return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
  } else {
    if (65 <= input && input <= 90) {
      return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
    } else {
      if (input === 95) {
        return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
      } else {
        return 97 <= input && input <= 122 ? { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_7(input) {
  if (48 <= input && input <= 57) {
    return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
  } else {
    if (65 <= input && input <= 90) {
      return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
    } else {
      if (input === 95) {
        return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
      } else {
        if (97 <= input && input <= 109) {
          return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
        } else {
          if (input === 110) {
            return { _0: 10, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_2 };
          } else {
            return 111 <= input && input <= 122 ? { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
          }
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_8(input) {
  if (48 <= input && input <= 57) {
    return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
  } else {
    if (65 <= input && input <= 90) {
      return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
    } else {
      if (input === 95) {
        return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
      } else {
        if (97 <= input && input <= 115) {
          return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
        } else {
          if (input === 116) {
            return { _0: 11, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_2 };
          } else {
            return 117 <= input && input <= 122 ? { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
          }
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_9(input) {
  if (48 <= input && input <= 57) {
    return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
  } else {
    if (65 <= input && input <= 90) {
      return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
    } else {
      if (input === 95) {
        return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
      } else {
        return 97 <= input && input <= 122 ? { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_10(input) {
  if (48 <= input && input <= 57) {
    return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
  } else {
    if (65 <= input && input <= 90) {
      return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
    } else {
      if (input === 95) {
        return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
      } else {
        if (97 <= input && input <= 99) {
          return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
        } else {
          if (input === 100) {
            return { _0: 12, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_2 };
          } else {
            return 101 <= input && input <= 122 ? { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
          }
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_11(input) {
  if (48 <= input && input <= 57) {
    return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
  } else {
    if (65 <= input && input <= 90) {
      return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
    } else {
      switch (input) {
        case 95: {
          return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
        }
        case 97: {
          return { _0: 13, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_2 };
        }
        default: {
          return 98 <= input && input <= 122 ? { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_12(input) {
  if (48 <= input && input <= 57) {
    return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
  } else {
    if (65 <= input && input <= 90) {
      return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
    } else {
      if (input === 95) {
        return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
      } else {
        if (97 <= input && input <= 111) {
          return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
        } else {
          if (input === 112) {
            return { _0: 14, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_2 };
          } else {
            return 113 <= input && input <= 122 ? { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
          }
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_13(input) {
  if (48 <= input && input <= 57) {
    return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
  } else {
    if (65 <= input && input <= 90) {
      return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
    } else {
      if (input === 95) {
        return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
      } else {
        if (97 <= input && input <= 113) {
          return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
        } else {
          if (input === 114) {
            return { _0: 15, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_2 };
          } else {
            return 115 <= input && input <= 122 ? { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
          }
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_14(input) {
  if (48 <= input && input <= 57) {
    return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
  } else {
    if (65 <= input && input <= 90) {
      return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
    } else {
      if (input === 95) {
        return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
      } else {
        if (97 <= input && input <= 110) {
          return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
        } else {
          if (input === 111) {
            return { _0: 16, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_2 };
          } else {
            return 112 <= input && input <= 122 ? { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
          }
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_15(input) {
  if (48 <= input && input <= 57) {
    return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
  } else {
    if (65 <= input && input <= 90) {
      return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
    } else {
      if (input === 95) {
        return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
      } else {
        if (97 <= input && input <= 115) {
          return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
        } else {
          if (input === 116) {
            return { _0: 17, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_2 };
          } else {
            return 117 <= input && input <= 122 ? { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
          }
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_16(input) {
  if (48 <= input && input <= 57) {
    return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
  } else {
    if (65 <= input && input <= 90) {
      return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
    } else {
      if (input === 95) {
        return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
      } else {
        if (97 <= input && input <= 114) {
          return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
        } else {
          if (input === 115) {
            return { _0: 18, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_3 };
          } else {
            return 116 <= input && input <= 122 ? { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
          }
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_17(input) {
  if (48 <= input && input <= 57) {
    return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
  } else {
    if (65 <= input && input <= 90) {
      return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
    } else {
      if (input === 95) {
        return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
      } else {
        if (97 <= input && input <= 111) {
          return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
        } else {
          if (input === 112) {
            return { _0: 19, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_2 };
          } else {
            return 113 <= input && input <= 122 ? { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
          }
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_18(input) {
  if (input === 40) {
    return { _0: 20, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_4 };
  } else {
    if (48 <= input && input <= 57) {
      return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
    } else {
      if (65 <= input && input <= 90) {
        return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
      } else {
        if (input === 95) {
          return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
        } else {
          return 97 <= input && input <= 122 ? { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_19(input) {
  if (48 <= input && input <= 57) {
    return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
  } else {
    if (65 <= input && input <= 90) {
      return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
    } else {
      if (input === 95) {
        return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
      } else {
        if (97 <= input && input <= 110) {
          return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
        } else {
          if (input === 111) {
            return { _0: 21, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_2 };
          } else {
            return 112 <= input && input <= 122 ? { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
          }
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_20(input) {
  switch (input) {
    case 9: {
      return { _0: 23, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_4 };
    }
    case 32: {
      return { _0: 23, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_4 };
    }
    default: {
      if (65 <= input && input <= 90) {
        return { _0: 22, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_5 };
      } else {
        if (input === 95) {
          return { _0: 22, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_5 };
        } else {
          return 97 <= input && input <= 122 ? { _0: 22, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_5 } : { _0: 0, _1: [] };
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_21(input) {
  if (48 <= input && input <= 57) {
    return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
  } else {
    if (65 <= input && input <= 90) {
      return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
    } else {
      if (input === 95) {
        return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
      } else {
        if (97 <= input && input <= 114) {
          return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
        } else {
          if (input === 115) {
            return { _0: 24, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_3 };
          } else {
            return 116 <= input && input <= 122 ? { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
          }
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_22(input) {
  switch (input) {
    case 9: {
      return { _0: 25, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_6 };
    }
    case 32: {
      return { _0: 25, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_6 };
    }
    case 41: {
      return { _0: 26, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_7 };
    }
    default: {
      if (48 <= input && input <= 57) {
        return { _0: 27, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_5 };
      } else {
        if (65 <= input && input <= 90) {
          return { _0: 27, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_5 };
        } else {
          if (input === 95) {
            return { _0: 27, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_5 };
          } else {
            return 97 <= input && input <= 122 ? { _0: 27, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_5 } : { _0: 0, _1: [] };
          }
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_23(input) {
  switch (input) {
    case 9: {
      return { _0: 23, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_4 };
    }
    case 32: {
      return { _0: 23, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_4 };
    }
    default: {
      if (65 <= input && input <= 90) {
        return { _0: 22, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_5 };
      } else {
        if (input === 95) {
          return { _0: 22, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_5 };
        } else {
          return 97 <= input && input <= 122 ? { _0: 22, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_5 } : { _0: 0, _1: [] };
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_24(input) {
  if (input === 40) {
    return { _0: 20, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_4 };
  } else {
    if (48 <= input && input <= 57) {
      return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
    } else {
      if (65 <= input && input <= 90) {
        return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
      } else {
        if (input === 95) {
          return { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 };
        } else {
          return 97 <= input && input <= 122 ? { _0: 9, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_0 } : { _0: 0, _1: [] };
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_25(input) {
  switch (input) {
    case 9: {
      return { _0: 25, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_6 };
    }
    case 32: {
      return { _0: 25, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_6 };
    }
    case 41: {
      return { _0: 26, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_7 };
    }
    default: {
      return { _0: 0, _1: [] };
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_26(input) {
  return { _0: 0, _1: [] };
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_state_27(input) {
  switch (input) {
    case 9: {
      return { _0: 25, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_6 };
    }
    case 32: {
      return { _0: 25, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_6 };
    }
    case 41: {
      return { _0: 26, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_7 };
    }
    default: {
      if (48 <= input && input <= 57) {
        return { _0: 27, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_5 };
      } else {
        if (65 <= input && input <= 90) {
          return { _0: 27, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_5 };
        } else {
          if (input === 95) {
            return { _0: 27, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_5 };
          } else {
            return 97 <= input && input <= 122 ? { _0: 27, _1: jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace_tag_action_5 } : { _0: 0, _1: [] };
          }
        }
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace(subst, lexbuf) {
  let _tmp = subst;
  let _tmp$2 = lexbuf;
  _L: while (true) {
    const subst$2 = _tmp;
    const lexbuf$2 = _tmp$2;
    const _bind = jian$mbtlex$lib$codegen$internal$codeblock_parser$$LexEngine$run(jian$mbtlex$lib$codegen$internal$codeblock_parser$$__mbtlex_engine_scan_codeblock_rbrace, lexbuf$2);
    const _x = _bind._0;
    switch (_x) {
      case 0: {
        jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace(subst$2, lexbuf$2);
        continue _L;
      }
      case 1: {
        return;
      }
      case 2: {
        const _x$2 = _bind._1;
        const _bind$2 = moonbitlang$core$array$$Array$op_get$64$(_x$2, 0);
        const _x$3 = _bind$2._0;
        const _x$4 = _bind$2._1;
        jian$mbtlex$lib$codegen$internal$codeblock_parser$$Lexbuf$substring(lexbuf$2, _x$3, _x$4);
        const _bind$3 = moonbitlang$core$array$$Array$op_get$64$(_x$2, 1);
        const _x$5 = _bind$3._0;
        const _x$6 = _bind$3._1;
        const t1 = jian$mbtlex$lib$codegen$internal$codeblock_parser$$Lexbuf$substring(lexbuf$2, _x$5, _x$6);
        const _bind$4 = moonbitlang$core$array$$Array$op_get$64$(_x$2, 2);
        const _x$7 = _bind$4._0;
        const _x$8 = _bind$4._1;
        const t2 = jian$mbtlex$lib$codegen$internal$codeblock_parser$$Lexbuf$substring(lexbuf$2, _x$7, _x$8);
        let _tmp$3;
        switch (t1) {
          case "startpos": {
            _tmp$3 = new $64$jian$47$mbtlex$47$lib$47$codegen$47$internal$47$codeblock_parser$46$SubstItemDesc$StartPosOf(t2);
            break;
          }
          case "endpos": {
            _tmp$3 = new $64$jian$47$mbtlex$47$lib$47$codegen$47$internal$47$codeblock_parser$46$SubstItemDesc$EndPosOf(t2);
            break;
          }
          default: {
            _tmp$3 = $panic();
          }
        }
        moonbitlang$core$array$$Array$push$68$(subst$2, { start: _x$3, end: _x$4, desc: _tmp$3 });
        continue _L;
      }
      case 3: {
        continue _L;
      }
      case 4: {
        continue _L;
      }
      case 5: {
        return;
      }
      default: {
        moonbitlang$core$builtin$$abort$49$("lex: fail to match");
        return;
      }
    }
  }
}
function jian$mbtlex$lib$codegen$internal$codeblock_parser$$parse_codeblock(str) {
  const lexbuf = jian$mbtlex$lib$codegen$internal$codeblock_parser$$Lexbuf$from_string(str);
  const subst = [];
  jian$mbtlex$lib$codegen$internal$codeblock_parser$$scan_codeblock_rbrace(subst, lexbuf);
  return subst;
}
function jian$mbtlex$lib$codegen$$fix_indent(code) {
  const code$2 = `\n${code}`;
  let ptr = 0;
  let indent_count = 0;
  const buf = moonbitlang$core$builtin$$StringBuilder$new(code$2.length);
  while (true) {
    if (ptr < code$2.length) {
      const ch = code$2.charCodeAt(ptr);
      ptr = ptr + 1 | 0;
      moonbitlang$core$builtin$$StringBuilder$write_char(buf, ch);
      switch (ch) {
        case 10: {
          if (indent_count === 0) {
            while (true) {
              if (ptr < code$2.length && moonbitlang$core$array$$Array$contains$2$([9, 32], code$2.charCodeAt(ptr))) {
                ptr = ptr + 1 | 0;
                continue;
              } else {
                break;
              }
            }
          } else {
            moonbitlang$core$builtin$$StringBuilder$write_char(buf, 32);
          }
          break;
        }
        case 123: {
          indent_count = indent_count + 1 | 0;
          break;
        }
        case 125: {
          indent_count = indent_count - 1 | 0;
          break;
        }
        case 92: {
          if (ptr < code$2.length) {
            moonbitlang$core$builtin$$StringBuilder$write_char(buf, code$2.charCodeAt(ptr));
            ptr = ptr + 1 | 0;
          }
          break;
        }
        case 34: {
          while (true) {
            if (ptr < code$2.length) {
              const ch$2 = code$2.charCodeAt(ptr);
              moonbitlang$core$builtin$$StringBuilder$write_char(buf, code$2.charCodeAt(ptr));
              if (code$2.charCodeAt(ptr) === 92) {
                if ((ptr + 1 | 0) < code$2.length) {
                  moonbitlang$core$builtin$$StringBuilder$write_char(buf, code$2.charCodeAt(ptr + 1 | 0));
                }
                ptr = ptr + 2 | 0;
              } else {
                ptr = ptr + 1 | 0;
              }
              if (ch$2 === 34) {
                break;
              }
              continue;
            } else {
              break;
            }
          }
          break;
        }
      }
      continue;
    } else {
      break;
    }
  }
  return moonbitlang$core$builtin$$StringBuilder$to_string(buf);
}
function jian$mbtlex$lib$codegen$$rewrite_codeblock(codeblock, subst) {
  const buf = moonbitlang$core$builtin$$StringBuilder$new(moonbitlang$core$builtin$$StringBuilder$new$46$size_hint$46$default());
  let last_index = 0;
  const _len = subst.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const item = moonbitlang$core$array$$Array$op_get$68$(subst, _i);
      moonbitlang$core$builtin$$StringBuilder$write_substring(buf, codeblock, last_index, item.start - last_index | 0);
      const _bind = item.desc;
      if (_bind.$tag === 0) {
        const _StartPosOf = _bind;
        const _x = _StartPosOf._0;
        moonbitlang$core$builtin$$StringBuilder$write_string(buf, `_start_pos_of_${_x}`);
      } else {
        const _EndPosOf = _bind;
        const _x = _EndPosOf._0;
        moonbitlang$core$builtin$$StringBuilder$write_string(buf, `_end_pos_of_${_x}`);
      }
      last_index = item.end;
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  if (last_index < codeblock.length) {
    moonbitlang$core$builtin$$StringBuilder$write_substring(buf, codeblock, last_index, codeblock.length - last_index | 0);
  }
  return moonbitlang$core$builtin$$StringBuilder$to_string(buf);
}
function jian$mbtlex$lib$codegen$$group_trans$46$add$116$(_env, char, target) {
  const last_target = _env._3;
  const first_char = _env._2;
  const result = _env._1;
  const last_char = _env._0;
  if (moonbitlang$core$builtin$$op_notequal$51$(target, last_target.val)) {
    if (last_char.val !== -1) {
      moonbitlang$core$array$$Array$push$70$(result, { _0: { _0: first_char.val, _1: last_char.val }, _1: last_target.val });
    }
    last_target.val = target;
    first_char.val = char;
    return;
  } else {
    return;
  }
}
function jian$mbtlex$lib$codegen$$group_trans(trans) {
  const result = moonbitlang$core$array$$Array$new$70$(moonbitlang$core$array$$Array$new$46$capacity$46$default$70$());
  const first_char = { val: -1 };
  const last_char = { val: -1 };
  const last_target = { val: { _0: 0, _1: [] } };
  const _env = { _0: last_char, _1: result, _2: first_char, _3: last_target };
  let _tmp = 0;
  while (true) {
    const char = _tmp;
    if (char < 128) {
      const _bind = moonbitlang$core$builtin$$Map$op_get$83$(trans, char);
      if (_bind === undefined) {
        jian$mbtlex$lib$codegen$$group_trans$46$add$116$(_env, char, { _0: 0, _1: [] });
        last_char.val = -1;
        first_char.val = char + 1 | 0;
      } else {
        const _Some = _bind;
        const _x = _Some;
        const _x$2 = _x._0;
        const _x$3 = _x._1;
        jian$mbtlex$lib$codegen$$group_trans$46$add$116$(_env, char, { _0: _x$2, _1: _x$3 });
        last_char.val = char;
      }
      _tmp = char + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  if (last_char.val !== -1) {
    moonbitlang$core$array$$Array$push$70$(result, { _0: { _0: first_char.val, _1: last_char.val }, _1: last_target.val });
  }
  return result;
}
function jian$mbtlex$lib$codegen$$codegen_rule$46$get_tag_action_id$117$(_env, tag_action) {
  const next_tag_action_id = _env._1;
  const tag_action_dedup = _env._0;
  const _bind = moonbitlang$core$sorted_map$$T$op_get$24$(tag_action_dedup, tag_action);
  if (_bind === undefined) {
    const id = next_tag_action_id.val;
    moonbitlang$core$sorted_map$$T$op_set$24$(tag_action_dedup, tag_action, id);
    next_tag_action_id.val = next_tag_action_id.val + 1 | 0;
    return id;
  } else {
    const _Some = _bind;
    const _x = _Some;
    return _x;
  }
}
function jian$mbtlex$lib$codegen$$codegen_rule(rule) {
  const dfa = jian$mbtlex$lib$automaton$$DFA$from_rule(rule);
  const engine = `__mbtlex_engine_${rule.name}`;
  const next_tag_action_row_id = { val: 0 };
  const tag_action_row_dedup = moonbitlang$core$sorted_map$$new$25$();
  const next_tag_action_id = { val: 0 };
  const tag_action_dedup = moonbitlang$core$sorted_map$$new$24$();
  const _env = { _0: tag_action_dedup, _1: next_tag_action_id };
  const states_code = moonbitlang$core$builtin$$StringBuilder$new(moonbitlang$core$builtin$$StringBuilder$new$46$size_hint$46$default());
  const graph_code = moonbitlang$core$builtin$$StringBuilder$new(moonbitlang$core$builtin$$StringBuilder$new$46$size_hint$46$default());
  moonbitlang$core$builtin$$StringBuilder$write_string(graph_code, "[");
  const _arr = dfa.graph;
  const _len = _arr.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const trans = moonbitlang$core$array$$Array$op_get$71$(_arr, _i);
      moonbitlang$core$builtin$$StringBuilder$write_string(states_code, `fn ${rule.name}_state_${moonbitlang$core$int$$Int$to_string(_i)}(input : LexInput) -> (LexState, LexTagAction) {\n  match input {\n`);
      const _arr$2 = jian$mbtlex$lib$codegen$$group_trans(trans);
      const _len$2 = _arr$2.length;
      let _tmp$2 = 0;
      while (true) {
        const _i$2 = _tmp$2;
        if (_i$2 < _len$2) {
          const tran = moonbitlang$core$array$$Array$op_get$70$(_arr$2, _i$2);
          const _x = tran._0;
          const _x$2 = _x._0;
          const _x$3 = _x._1;
          const _x$4 = tran._1;
          const _x$5 = _x$4._0;
          const _x$6 = _x$4._1;
          if (_x$2 === _x$3) {
            moonbitlang$core$builtin$$StringBuilder$write_string(states_code, `    ${moonbitlang$core$int$$Int$to_string(_x$2)} => (${moonbitlang$core$int$$Int$to_string(_x$5)}, ${rule.name}_tag_action_${moonbitlang$core$int$$Int$to_string(jian$mbtlex$lib$codegen$$codegen_rule$46$get_tag_action_id$117$(_env, _x$6))})\n`);
          } else {
            moonbitlang$core$builtin$$StringBuilder$write_string(states_code, `    ${moonbitlang$core$int$$Int$to_string(_x$2)}..=${moonbitlang$core$int$$Int$to_string(_x$3)} => (${moonbitlang$core$int$$Int$to_string(_x$5)}, ${rule.name}_tag_action_${moonbitlang$core$int$$Int$to_string(jian$mbtlex$lib$codegen$$codegen_rule$46$get_tag_action_id$117$(_env, _x$6))})\n`);
          }
          _tmp$2 = _i$2 + 1 | 0;
          continue;
        } else {
          break;
        }
      }
      if (moonbitlang$core$builtin$$Map$size$83$(trans) < 128) {
        moonbitlang$core$builtin$$StringBuilder$write_string(states_code, "    _ => (0, [])\n");
      } else {
        moonbitlang$core$builtin$$StringBuilder$write_string(states_code, "    _ => panic()\n");
      }
      moonbitlang$core$builtin$$StringBuilder$write_string(states_code, "  }\n}\n");
      moonbitlang$core$builtin$$StringBuilder$write_string(graph_code, `${rule.name}_state_${moonbitlang$core$int$$Int$to_string(_i)}, `);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  moonbitlang$core$builtin$$StringBuilder$write_string(graph_code, "]");
  const end_nodes = moonbitlang$core$array$$Array$makei$11$(dfa.node_count, (i) => moonbitlang$core$builtin$$Map$get$82$(dfa.end_nodes, i));
  const shared_tag_actions_code = moonbitlang$core$builtin$$StringBuilder$new(moonbitlang$core$builtin$$StringBuilder$new$46$size_hint$46$default());
  const _bind = moonbitlang$core$sorted_map$$T$iter2$24$(tag_action_dedup);
  _bind((tag_action, id) => {
    const rows_code = moonbitlang$core$builtin$$StringBuilder$new(moonbitlang$core$builtin$$StringBuilder$new$46$size_hint$46$default());
    moonbitlang$core$builtin$$StringBuilder$write_string(rows_code, "[");
    const _len$2 = tag_action.length;
    let _tmp$2 = 0;
    while (true) {
      const _i = _tmp$2;
      if (_i < _len$2) {
        const row = moonbitlang$core$array$$Array$op_get$10$(tag_action, _i);
        if (_i > 0) {
          moonbitlang$core$builtin$$StringBuilder$write_string(rows_code, ", ");
        }
        const _tmp$3 = rule.name;
        const _bind$2 = moonbitlang$core$sorted_map$$T$op_get$25$(tag_action_row_dedup, row);
        let _tmp$4;
        if (_bind$2 === undefined) {
          const id$2 = next_tag_action_row_id.val;
          moonbitlang$core$sorted_map$$T$op_set$25$(tag_action_row_dedup, row, id$2);
          next_tag_action_row_id.val = next_tag_action_row_id.val + 1 | 0;
          _tmp$4 = id$2;
        } else {
          const _Some = _bind$2;
          const _x = _Some;
          _tmp$4 = _x;
        }
        moonbitlang$core$builtin$$StringBuilder$write_string(rows_code, `${_tmp$3}_tag_action_row_${moonbitlang$core$int$$Int$to_string(_tmp$4)}`);
        _tmp$2 = _i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    moonbitlang$core$builtin$$StringBuilder$write_string(rows_code, "]");
    moonbitlang$core$builtin$$StringBuilder$write_string(shared_tag_actions_code, `let ${rule.name}_tag_action_${moonbitlang$core$int$$Int$to_string(id)} : Array[Array[Int]] = ${moonbitlang$core$builtin$$StringBuilder$to_string(rows_code)}\n`);
    return 1;
  });
  const start_tags = [];
  const _arr$2 = dfa.start_action;
  const _len$2 = _arr$2.length;
  let _tmp$2 = 0;
  while (true) {
    const _i = _tmp$2;
    if (_i < _len$2) {
      const action = moonbitlang$core$array$$Array$op_get$10$(_arr$2, _i);
      if (!moonbitlang$core$array$$Array$is_empty$7$(action)) {
        moonbitlang$core$array$$Array$push$7$(start_tags, _i);
      }
      _tmp$2 = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  const shared_tag_action_rows_code = moonbitlang$core$builtin$$StringBuilder$new(moonbitlang$core$builtin$$StringBuilder$new$46$size_hint$46$default());
  const _bind$2 = moonbitlang$core$sorted_map$$T$iter2$25$(tag_action_row_dedup);
  _bind$2((tag_action_row, id) => {
    moonbitlang$core$builtin$$StringBuilder$write_string(shared_tag_action_rows_code, `let ${rule.name}_tag_action_row_${moonbitlang$core$int$$Int$to_string(id)} : Array[Int] = ${moonbitlang$core$builtin$$Show$to_string$106$(tag_action_row)}\n`);
    return 1;
  });
  const _tmp$3 = moonbitlang$core$builtin$$StringBuilder$to_string(shared_tag_action_rows_code);
  const _tmp$4 = moonbitlang$core$builtin$$StringBuilder$to_string(shared_tag_actions_code);
  const _tmp$5 = moonbitlang$core$builtin$$StringBuilder$to_string(states_code);
  const _tmp$6 = `let ${engine}: LexEngine = { graph: ${moonbitlang$core$builtin$$StringBuilder$to_string(graph_code)}, end_nodes: ${moonbitlang$core$builtin$$Show$to_string$105$(end_nodes)}, start_tags: ${moonbitlang$core$builtin$$Show$to_string$106$(start_tags)}, code_blocks_n: ${moonbitlang$core$int$$Int$to_string(dfa.code_blocks.length)} }`;
  const _tmp$7 = `fn ${rule.name}(`;
  const self = [];
  moonbitlang$core$array$$Array$push_iter$8$(self, moonbitlang$core$array$$Array$iter$8$(rule.vars));
  moonbitlang$core$array$$Array$push$8$(self, { identifier: "lexbuf", ty: "Lexbuf" });
  const _lhs = moonbitlang$core$array$$Array$map$99$(self, (p) => `${p.identifier} : ${p.ty}`);
  const _tmp$8 = moonbitlang$core$string$$String$concat(_lhs, ", ");
  const _lhs$2 = [_tmp$7, _tmp$8, ")", "->", rule.return_type, "{"];
  const _tmp$9 = moonbitlang$core$string$$String$concat(_lhs$2, " ");
  const _lhs$3 = moonbitlang$core$array$$Array$flatten$3$([[`match ${engine}.run(lexbuf) {`], moonbitlang$core$array$$Array$makei$3$(dfa.code_blocks.length, (i) => {
    const codeblock = moonbitlang$core$array$$Array$op_get$3$(dfa.code_blocks, i);
    const subst = jian$mbtlex$lib$codegen$internal$codeblock_parser$$parse_codeblock(codeblock);
    const _lhs$4 = moonbitlang$core$array$$Array$flatten$3$([[`(${moonbitlang$core$int$$Int$to_string(i)}, __mbtlex_captures) => {`], moonbitlang$core$array$$Array$mapi$108$(moonbitlang$core$array$$Array$op_get$69$(dfa.captures, i), (i$2, name) => {
      let inject_ignore;
      let _tmp$10;
      let _return_value;
      _L: {
        _L$2: {
          const _len$3 = subst.length;
          let _tmp$11 = 0;
          while (true) {
            const _i = _tmp$11;
            if (_i < _len$3) {
              const item = moonbitlang$core$array$$Array$op_get$68$(subst, _i);
              let n;
              _L$3: {
                const _bind$3 = item.desc;
                if (_bind$3.$tag === 0) {
                  const _StartPosOf = _bind$3;
                  const _x = _StartPosOf._0;
                  n = _x;
                  break _L$3;
                } else {
                  const _EndPosOf = _bind$3;
                  const _x = _EndPosOf._0;
                  n = _x;
                  break _L$3;
                }
              }
              if (n === name) {
                _return_value = true;
                break _L$2;
              }
              _tmp$11 = _i + 1 | 0;
              continue;
            } else {
              break;
            }
          }
          _tmp$10 = false;
          break _L;
        }
        _tmp$10 = _return_value;
      }
      if (_tmp$10) {
        inject_ignore = `ignore(${name})`;
      } else {
        inject_ignore = "";
      }
      return `let (_start_pos_of_${name}, _end_pos_of_${name}) = __mbtlex_captures[${moonbitlang$core$int$$Int$to_string(i$2)}]\nlet ${name}: String = lexbuf.substring(_start_pos_of_${name}, _end_pos_of_${name})\n${inject_ignore}`;
    }), [jian$mbtlex$lib$codegen$$rewrite_codeblock(codeblock, subst)], ["}"]]);
    return moonbitlang$core$string$$String$concat(_lhs$4, "\n");
  }), ["_ => abort(\"lex: fail to match\")"], ["}"]]);
  const _lhs$4 = [_tmp$3, _tmp$4, _tmp$5, _tmp$6, _tmp$9, moonbitlang$core$string$$String$concat(_lhs$3, "\n"), "}"];
  return moonbitlang$core$string$$String$concat(_lhs$4, "\n");
}
function jian$mbtlex$lib$codegen$$codegen_lex(lex) {
  const _tmp = lex.header;
  const _lhs = moonbitlang$core$array$$Array$map$100$(lex.rules, jian$mbtlex$lib$codegen$$codegen_rule);
  const _tmp$2 = moonbitlang$core$string$$String$concat(_lhs, "\n");
  const _lhs$2 = [jian$mbtlex$lib$codegen$$runtime, _tmp, _tmp$2, lex.trailer];
  return jian$mbtlex$lib$codegen$$fix_indent(moonbitlang$core$string$$String$concat(_lhs$2, "\n\n"));
}
function Yoorkin$trie$$T$lookup$118$(self, path) {
  let _tmp = moonbitlang$core$array$$Array$op_as_view$2$(moonbitlang$core$string$$String$to_array(path), 0, undefined);
  let _tmp$2 = self;
  while (true) {
    const _param = _tmp;
    const _param$2 = _tmp$2;
    if (moonbitlang$core$array$$ArrayView$length$2$(_param) === 0) {
      return _param$2.value;
    } else {
      const _x = moonbitlang$core$array$$ArrayView$op_get$2$(_param, 0);
      const _x$2 = moonbitlang$core$array$$ArrayView$op_as_view$2$(_param, 1, moonbitlang$core$array$$ArrayView$length$2$(_param) - 0 | 0);
      const _bind = moonbitlang$core$immut$sorted_map$$T$op_get$21$(_param$2.forks, _x);
      if (_bind === undefined) {
        return undefined;
      } else {
        const _Some = _bind;
        const _x$3 = _Some;
        _tmp = _x$2;
        _tmp$2 = _x$3;
        continue;
      }
    }
  }
}
function Yoorkin$trie$$T$add$118$(self, path, value) {
  return Yoorkin$trie$$add$46$aux$47$3071(value, moonbitlang$core$array$$Array$op_as_view$2$(moonbitlang$core$string$$String$to_array(path), 0, undefined), self);
}
function Yoorkin$trie$$add$46$aux$47$3071(value, _param1, _param2) {
  if (moonbitlang$core$array$$ArrayView$length$2$(_param1) === 0) {
    return { value: value, forks: _param2.forks };
  } else {
    const _x = moonbitlang$core$array$$ArrayView$op_get$2$(_param1, 0);
    const _x$2 = moonbitlang$core$array$$ArrayView$op_as_view$2$(_param1, 1, moonbitlang$core$array$$ArrayView$length$2$(_param1) - 0 | 0);
    const subtree = moonbitlang$core$option$$Option$or$44$(moonbitlang$core$immut$sorted_map$$T$op_get$21$(_param2.forks, _x), { value: undefined, forks: moonbitlang$core$immut$sorted_map$$T$empty$21$() });
    return { value: _param2.value, forks: moonbitlang$core$immut$sorted_map$$T$add$21$(_param2.forks, _x, Yoorkin$trie$$add$46$aux$47$3071(value, _x$2, subtree)) };
  }
}
function Yoorkin$trie$$empty$118$() {
  return { value: undefined, forks: moonbitlang$core$immut$sorted_map$$T$empty$21$() };
}
function Yoorkin$ArgParser$$interpret(trie, xs, fallback) {
  let _tmp = moonbitlang$core$array$$Array$op_as_view$3$(xs, 0, undefined);
  _L: while (true) {
    const _param = _tmp;
    if (moonbitlang$core$array$$ArrayView$length$3$(_param) === 0) {
      return;
    } else {
      const _x = moonbitlang$core$array$$ArrayView$op_get$3$(_param, 0);
      const _x$2 = moonbitlang$core$array$$ArrayView$op_as_view$3$(_param, 1, moonbitlang$core$array$$ArrayView$length$3$(_param) - 0 | 0);
      const _bind = Yoorkin$trie$$T$lookup$118$(trie, _x);
      if (_bind === undefined) {
        fallback(_x);
        _tmp = _x$2;
        continue;
      } else {
        const _Some = _bind;
        const _x$3 = _Some;
        _L$2: {
          switch (_x$3.$tag) {
            case 1: {
              const _String = _x$3;
              const _x$4 = _String._0;
              if (moonbitlang$core$array$$ArrayView$length$3$(_x$2) >= 1) {
                const _x$5 = moonbitlang$core$array$$ArrayView$op_get$3$(_x$2, 0);
                const _x$6 = moonbitlang$core$array$$ArrayView$op_as_view$3$(_x$2, 1, moonbitlang$core$array$$ArrayView$length$3$(_x$2) - 0 | 0);
                _x$4(_x$5);
                _tmp = _x$6;
                continue _L;
              } else {
                break _L$2;
              }
            }
            case 2: {
              const _Set_string = _x$3;
              const _x$5 = _Set_string._0;
              if (moonbitlang$core$array$$ArrayView$length$3$(_x$2) >= 1) {
                const _x$6 = moonbitlang$core$array$$ArrayView$op_get$3$(_x$2, 0);
                const _x$7 = moonbitlang$core$array$$ArrayView$op_as_view$3$(_x$2, 1, moonbitlang$core$array$$ArrayView$length$3$(_x$2) - 0 | 0);
                _x$5.val = _x$6;
                _tmp = _x$7;
                continue _L;
              } else {
                break _L$2;
              }
            }
            case 3: {
              const _Set = _x$3;
              const _x$6 = _Set._0;
              _x$6.val = true;
              _tmp = _x$2;
              continue _L;
            }
            case 4: {
              const _Clear = _x$3;
              const _x$7 = _Clear._0;
              _x$7.val = false;
              _tmp = _x$2;
              continue _L;
            }
            default: {
              const _Unit = _x$3;
              const _x$8 = _Unit._0;
              _x$8();
              _tmp = _x$2;
              continue _L;
            }
          }
        }
        moonbitlang$core$builtin$$println$3$(`missing argument for ${_x}`);
        return;
      }
    }
  }
}
function Yoorkin$ArgParser$$parse$46$aux$113$(_param1, _param2) {
  const _x = _param1._0;
  const _x$2 = _param1._1;
  const _x$3 = _param2._0;
  const _x$4 = _param2._1;
  const _x$5 = _param2._2;
  const _x$6 = _param2._3;
  const trie = Yoorkin$trie$$T$add$118$(Yoorkin$trie$$T$add$118$(_x, _x$3, _x$5), _x$4, _x$5);
  const help_msg = `${_x$2}  ${_x$3}\t${_x$4}\t${_x$6}\n`;
  return { _0: trie, _1: help_msg };
}
function Yoorkin$ArgParser$$parse(speclist, rest, usage_msg, argv) {
  const _bind = moonbitlang$core$array$$Array$fold$110$(speclist, { _0: Yoorkin$trie$$empty$118$(), _1: `${usage_msg}\n options:\n` }, Yoorkin$ArgParser$$parse$46$aux$113$);
  const _x = _bind._0;
  const _x$2 = _bind._1;
  const help_spec = new $64$Yoorkin$47$ArgParser$46$Spec$Unit(() => {
    moonbitlang$core$builtin$$println$3$(_x$2);
  });
  const trie = Yoorkin$trie$$T$add$118$(Yoorkin$trie$$T$add$118$(_x, "--help", help_spec), "-h", help_spec);
  Yoorkin$ArgParser$$interpret(trie, argv, rest);
}
function moonbitlang$x$sys$internal$ffi$$get_cli_args() {
  return moonbitlang$x$sys$internal$ffi$$get_cli_args_internal();
}
function moonbitlang$x$sys$$get_cli_args() {
  return moonbitlang$x$sys$internal$ffi$$get_cli_args();
}
function moonbitlang$x$fs$internal$ffi$$read_file_to_string(path) {
  return moonbitlang$x$fs$internal$ffi$$read_file_to_string_internal(path);
}
function moonbitlang$x$fs$internal$ffi$$write_string_to_file(path, content) {
  moonbitlang$x$fs$internal$ffi$$write_string_to_file_internal(path, content);
}
function moonbitlang$x$fs$internal$ffi$$path_exists(path) {
  return moonbitlang$x$fs$internal$ffi$$path_exists_internal(path);
}
function moonbitlang$x$fs$$IOError$to_string(self) {
  const _NotFound = self;
  const _x = _NotFound._0;
  return `\`${_x}\` does not exist`;
}
function moonbitlang$core$builtin$$Show$output$104$(self, logger) {
  logger.method_0(logger.self, moonbitlang$x$fs$$IOError$to_string(self));
}
function moonbitlang$x$fs$$write_string_to_file(path, content) {
  moonbitlang$x$fs$internal$ffi$$write_string_to_file(path, content);
}
function moonbitlang$x$fs$$path_exists(path) {
  return moonbitlang$x$fs$internal$ffi$$path_exists(path);
}
function moonbitlang$x$fs$$read_file_to_string(path) {
  if (moonbitlang$x$fs$$path_exists(path)) {
    return new Result$Ok$7$(moonbitlang$x$fs$internal$ffi$$read_file_to_string(path));
  } else {
    return new Result$Err$6$(new Error$moonbitlang$47$x$47$fs$46$IOError$46$NotFound(path));
  }
}
(() => {
  const output_file = moonbitlang$core$ref$$Ref$new$3$("");
  const input_file = moonbitlang$core$ref$$Ref$new$3$("");
  const exit = { val: false };
  Yoorkin$ArgParser$$parse([{ _0: "--output-file", _1: "-o", _2: new $64$Yoorkin$47$ArgParser$46$Spec$Set_string(output_file), _3: "Output file" }, { _0: "--version", _1: "-v", _2: new $64$Yoorkin$47$ArgParser$46$Spec$Unit(() => {
    exit.val = true;
    moonbitlang$core$builtin$$println$3$("moonlex 0.1.0");
  }), _3: "Show version" }], (rest) => {
    input_file.val = rest;
  }, jian$mbtlex$main$$_init$42$46$usage$1$, moonbitlang$x$sys$$get_cli_args());
  if (exit.val) {
    return;
  }
  if (moonbitlang$core$builtin$$op_notequal$3$(input_file.val, "")) {
    let lexer_spec_src;
    let _try_err;
    _L: {
      _L$2: {
        const _bind = moonbitlang$x$fs$$read_file_to_string(input_file.val);
        if (_bind.$tag === 1) {
          const _ok = _bind;
          lexer_spec_src = _ok._0;
        } else {
          const _err = _bind;
          const _tmp = _err._0;
          _try_err = _tmp;
          break _L$2;
        }
        break _L;
      }
      lexer_spec_src = moonbitlang$core$builtin$$abort$3$(moonbitlang$core$builtin$$Show$to_string$107$(_try_err));
    }
    const parser_buf = jian$mbtlex$lib$parser$$ParserBuf$from_string(lexer_spec_src);
    const _bind = jian$mbtlex$lib$parser$$ParserBuf$lex(parser_buf);
    if (_bind === undefined) {
      moonbitlang$core$builtin$$abort$49$("");
      return;
    } else {
      const _Some = _bind;
      const _x = _Some;
      const _x$2 = _x._1;
      const output = jian$mbtlex$lib$codegen$$codegen_lex(_x$2);
      if (output_file.val === "") {
        moonbitlang$core$builtin$$println$3$(output);
        return;
      } else {
        moonbitlang$x$fs$$write_string_to_file(output_file.val, output);
        return;
      }
    }
  } else {
    moonbitlang$core$builtin$$abort$49$("Input file is required");
    return;
  }
})();
