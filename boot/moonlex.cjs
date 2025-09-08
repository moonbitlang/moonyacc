const $64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$EOF = { $tag: 0 };
function $64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Character(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Character.prototype.$tag = 1;
function $64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Repetition(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Repetition.prototype.$tag = 2;
const $64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Epsilon = { $tag: 3 };
function $64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Alter(param0, param1) {
  this._0 = param0;
  this._1 = param1;
}
$64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Alter.prototype.$tag = 4;
function $64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Concat(param0, param1) {
  this._0 = param0;
  this._1 = param1;
}
$64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Concat.prototype.$tag = 5;
function $64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Capture(param0, param1) {
  this._0 = param0;
  this._1 = param1;
}
$64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Capture.prototype.$tag = 6;
const $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$ = { $tag: 0 };
function $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Node$0$(param0, param1, param2, param3, param4) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
  this._4 = param4;
}
$64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Node$0$.prototype.$tag = 1;
const $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$ = { $tag: 0 };
function $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Node$1$(param0, param1, param2, param3, param4) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
  this._4 = param4;
}
$64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Node$1$.prototype.$tag = 1;
class $PanicError extends Error {}
function $panic() {
  throw new $PanicError();
}
const Option$None$2$ = { $tag: 0 };
function Option$Some$2$(param0) {
  this._0 = param0;
}
Option$Some$2$.prototype.$tag = 1;
const Option$None$3$ = { $tag: 0 };
function Option$Some$3$(param0) {
  this._0 = param0;
}
Option$Some$3$.prototype.$tag = 1;
function $compare_int(a, b) {
  return (a >= b) - (a <= b);
}
const Option$None$4$ = { $tag: 0 };
function Option$Some$4$(param0) {
  this._0 = param0;
}
Option$Some$4$.prototype.$tag = 1;
function $make_array_len_and_init(a, b) {
  const arr = new Array(a);
  for (let i = 0; i < a; i++) {
    arr[i] = b;
  }
  return arr;
}
function $bound_check(arr, index) {
  if (index < 0 || index >= arr.length) throw new Error("Index out of bounds");
}
const $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$5$(param0, param1, param2, param3) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
}
$64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$5$.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$6$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$6$(param0, param1, param2, param3) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
}
$64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$6$.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$7$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$7$(param0, param1, param2, param3) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
}
$64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$7$.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$8$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$8$(param0, param1, param2, param3) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
}
$64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$8$.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$9$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$9$(param0, param1, param2, param3) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
}
$64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$9$.prototype.$tag = 1;
function Result$Err$10$(param0) {
  this._0 = param0;
}
Result$Err$10$.prototype.$tag = 0;
function Result$Ok$10$(param0) {
  this._0 = param0;
}
Result$Ok$10$.prototype.$tag = 1;
function Error$moonbitlang$47$ulex$47$lib$47$parser$46$ParseError$46$UnexpectedToken(param0, param1, param2) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
}
Error$moonbitlang$47$ulex$47$lib$47$parser$46$ParseError$46$UnexpectedToken.prototype.$tag = 14;
const Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void = { $tag: 13 };
function Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__String__String_$46$YYObj__String__String_(param0) {
  this._0 = param0;
}
Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__String__String_$46$YYObj__String__String_.prototype.$tag = 12;
function Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Lex$46$YYObj__Context______type_Lex(param0) {
  this._0 = param0;
}
Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Lex$46$YYObj__Context______type_Lex.prototype.$tag = 11;
function Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context_____Context$46$YYObj__Context_____Context(param0) {
  this._0 = param0;
}
Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context_____Context$46$YYObj__Context_____Context.prototype.$tag = 10;
function Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______list_List__type_Rule_$46$YYObj__Context______list_List__type_Rule_(param0) {
  this._0 = param0;
}
Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______list_List__type_Rule_$46$YYObj__Context______list_List__type_Rule_.prototype.$tag = 9;
function Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Rule$46$YYObj__Context______type_Rule(param0) {
  this._0 = param0;
}
Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Rule$46$YYObj__Context______type_Rule.prototype.$tag = 8;
function Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______list_List___type_Regex__String____type_CodeBlock__$46$YYObj__Context______list_List___type_Regex__String____type_CodeBlock__(param0) {
  this._0 = param0;
}
Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______list_List___type_Regex__String____type_CodeBlock__$46$YYObj__Context______list_List___type_Regex__String____type_CodeBlock__.prototype.$tag = 7;
function Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Char$46$YYObj_Char(param0) {
  this._0 = param0;
}
Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Char$46$YYObj_Char.prototype.$tag = 6;
function Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context_______type_Regex__String____type_CodeBlock_$46$YYObj__Context_______type_Regex__String____type_CodeBlock_(param0) {
  this._0 = param0;
}
Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context_______type_Regex__String____type_CodeBlock_$46$YYObj__Context_______type_Regex__String____type_CodeBlock_.prototype.$tag = 5;
function Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__char_set_T$46$YYObj__char_set_T(param0) {
  this._0 = param0;
}
Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__char_set_T$46$YYObj__char_set_T.prototype.$tag = 4;
function Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_String$46$YYObj_String(param0) {
  this._0 = param0;
}
Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_String$46$YYObj_String.prototype.$tag = 3;
function Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex(param0) {
  this._0 = param0;
}
Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex.prototype.$tag = 2;
function Error$moonbitlang$47$x$47$fs$46$IOError$46$IOError(param0) {
  this._0 = param0;
}
Error$moonbitlang$47$x$47$fs$46$IOError$46$IOError.prototype.$tag = 1;
function Error$moonbitlang$47$core$47$strconv$46$StrConvError$46$StrConvError(param0) {
  this._0 = param0;
}
Error$moonbitlang$47$core$47$strconv$46$StrConvError$46$StrConvError.prototype.$tag = 0;
function Result$Err$11$(param0) {
  this._0 = param0;
}
Result$Err$11$.prototype.$tag = 0;
function Result$Ok$11$(param0) {
  this._0 = param0;
}
Result$Ok$11$.prototype.$tag = 1;
function Result$Err$12$(param0) {
  this._0 = param0;
}
Result$Err$12$.prototype.$tag = 0;
function Result$Ok$12$(param0) {
  this._0 = param0;
}
Result$Ok$12$.prototype.$tag = 1;
function Result$Err$13$(param0) {
  this._0 = param0;
}
Result$Err$13$.prototype.$tag = 0;
function Result$Ok$13$(param0) {
  this._0 = param0;
}
Result$Ok$13$.prototype.$tag = 1;
const $9223372036854775807L = { hi: 2147483647, lo: -1 };
const $10L = { hi: 0, lo: 10 };
const $1L = { hi: 0, lo: 1 };
const $16L = { hi: 0, lo: 16 };
const $_9223372036854775808L = { hi: -2147483648, lo: 0 };
const $0L = { hi: 0, lo: 0 };
function $makebytes(a, b) {
  const arr = new Uint8Array(a);
  for (let i = 0; i < a; i++) {
    arr[i] = b;
  }
  return arr;
}
const $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$14$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$14$(param0, param1, param2, param3, param4) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
  this._4 = param4;
}
$64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$14$.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$15$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$15$(param0, param1, param2, param3, param4) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
  this._4 = param4;
}
$64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$15$.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$16$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$16$(param0, param1, param2, param3, param4) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
  this._4 = param4;
}
$64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$16$.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$17$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$17$(param0, param1, param2, param3, param4) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
  this._4 = param4;
}
$64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$17$.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$18$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$18$(param0, param1, param2, param3, param4) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
  this._4 = param4;
}
$64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$18$.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$19$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$19$(param0, param1, param2, param3, param4) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
  this._4 = param4;
}
$64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$19$.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$20$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$20$(param0, param1, param2, param3, param4) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
  this._4 = param4;
}
$64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$20$.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$21$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$21$(param0, param1, param2, param3, param4) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
  this._4 = param4;
}
$64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$21$.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$22$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$22$(param0, param1, param2, param3, param4) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
  this._4 = param4;
}
$64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$22$.prototype.$tag = 1;
const Option$None$23$ = { $tag: 0 };
function Option$Some$23$(param0) {
  this._0 = param0;
}
Option$Some$23$.prototype.$tag = 1;
function $unsafe_make_string(a, b) {
  return String.fromCodePoint(b).repeat(a);
}
const Option$None$24$ = { $tag: 0 };
function Option$Some$24$(param0) {
  this._0 = param0;
}
Option$Some$24$.prototype.$tag = 1;
const moonbitlang$core$builtin$$JSArray$push = (arr, val) => { arr.push(val); };
const $64$moonbitlang$47$core$47$builtin$46$ForeachResult$Continue$25$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$builtin$46$ForeachResult$Break$25$(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$core$47$builtin$46$ForeachResult$Break$25$.prototype.$tag = 1;
function $64$moonbitlang$47$core$47$builtin$46$ForeachResult$Return$25$(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$core$47$builtin$46$ForeachResult$Return$25$.prototype.$tag = 2;
function $64$moonbitlang$47$core$47$builtin$46$ForeachResult$Error$25$(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$core$47$builtin$46$ForeachResult$Error$25$.prototype.$tag = 3;
function $64$moonbitlang$47$core$47$builtin$46$ForeachResult$JumpOuter$25$(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$core$47$builtin$46$ForeachResult$JumpOuter$25$.prototype.$tag = 4;
const $bytes_literal$0 = new Uint8Array();
const moonbitlang$core$builtin$$get_int64_wasm_helper = function f() {
  if (f._exports) return f._exports;
  return f._exports = new WebAssembly.Instance(new WebAssembly.Module(new Uint8Array([0, 97, 115, 109, 1, 0, 0, 0, 1, 13, 2, 96, 0, 1, 127, 96, 4, 127, 127, 127, 127, 1, 127, 3, 7, 6, 0, 1, 1, 1, 1, 1, 6, 6, 1, 127, 1, 65, 0, 11, 7, 50, 6, 3, 109, 117, 108, 0, 1, 5, 100, 105, 118, 95, 115, 0, 2, 5, 100, 105, 118, 95, 117, 0, 3, 5, 114, 101, 109, 95, 115, 0, 4, 5, 114, 101, 109, 95, 117, 0, 5, 8, 103, 101, 116, 95, 104, 105, 103, 104, 0, 0, 10, 191, 1, 6, 4, 0, 35, 0, 11, 36, 1, 1, 126, 32, 0, 173, 32, 1, 173, 66, 32, 134, 132, 32, 2, 173, 32, 3, 173, 66, 32, 134, 132, 126, 34, 4, 66, 32, 135, 167, 36, 0, 32, 4, 167, 11, 36, 1, 1, 126, 32, 0, 173, 32, 1, 173, 66, 32, 134, 132, 32, 2, 173, 32, 3, 173, 66, 32, 134, 132, 127, 34, 4, 66, 32, 135, 167, 36, 0, 32, 4, 167, 11, 36, 1, 1, 126, 32, 0, 173, 32, 1, 173, 66, 32, 134, 132, 32, 2, 173, 32, 3, 173, 66, 32, 134, 132, 128, 34, 4, 66, 32, 135, 167, 36, 0, 32, 4, 167, 11, 36, 1, 1, 126, 32, 0, 173, 32, 1, 173, 66, 32, 134, 132, 32, 2, 173, 32, 3, 173, 66, 32, 134, 132, 129, 34, 4, 66, 32, 135, 167, 36, 0, 32, 4, 167, 11, 36, 1, 1, 126, 32, 0, 173, 32, 1, 173, 66, 32, 134, 132, 32, 2, 173, 32, 3, 173, 66, 32, 134, 132, 130, 34, 4, 66, 32, 135, 167, 36, 0, 32, 4, 167, 11])), {}).exports;
};
const moonbitlang$core$builtin$$MyInt64$compare = (a, b) => {
  const ahi = a.hi;
  const bhi = b.hi;
  if (ahi < bhi) {
    return -1;
  }
  if (ahi > bhi) {
    return 1;
  }
  const alo = a.lo >>> 0;
  const blo = b.lo >>> 0;
  if (alo < blo) {
    return -1;
  }
  if (alo > blo) {
    return 1;
  }
  return 0;
};
const moonbitlang$core$builtin$$JSArray$pop = (arr) => arr.pop();
const moonbitlang$core$builtin$$JSArray$set_length = (arr, len) => { arr.length = len; };
const $64$moonbitlang$47$core$47$list$46$List$Empty$26$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$list$46$List$More$26$(param0, param1) {
  this._0 = param0;
  this._1 = param1;
}
$64$moonbitlang$47$core$47$list$46$List$More$26$.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$list$46$List$Empty$27$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$list$46$List$More$27$(param0, param1) {
  this._0 = param0;
  this._1 = param1;
}
$64$moonbitlang$47$core$47$list$46$List$More$27$.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$list$46$List$Empty$28$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$list$46$List$More$28$(param0, param1) {
  this._0 = param0;
  this._1 = param1;
}
$64$moonbitlang$47$core$47$list$46$List$More$28$.prototype.$tag = 1;
const $64$moonbitlang$47$x$47$encoding$46$Decode$End = { $tag: 0 };
function $64$moonbitlang$47$x$47$encoding$46$Decode$Refill(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$x$47$encoding$46$Decode$Refill.prototype.$tag = 1;
function $64$moonbitlang$47$x$47$encoding$46$Decode$Malformed(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$x$47$encoding$46$Decode$Malformed.prototype.$tag = 2;
function $64$moonbitlang$47$x$47$encoding$46$Decode$Uchar(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$x$47$encoding$46$Decode$Uchar.prototype.$tag = 3;
function $64$moonbitlang$47$x$47$encoding$46$UTF16Decode$Hi(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$x$47$encoding$46$UTF16Decode$Hi.prototype.$tag = 0;
function $64$moonbitlang$47$x$47$encoding$46$UTF16Decode$UTF16Malformed(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$x$47$encoding$46$UTF16Decode$UTF16Malformed.prototype.$tag = 1;
function $64$moonbitlang$47$x$47$encoding$46$UTF16Decode$UTF16Uchar(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$x$47$encoding$46$UTF16Decode$UTF16Uchar.prototype.$tag = 2;
function $bytes_equal(a, b) {
    if (a.length !== b.length) return false;
  for (let i = 0; i < a.length; i++) {
    if (a[i] !== b[i]) return false;
  }
  return true;
}
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Accept = { $tag: 0 };
function $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift.prototype.$tag = 1;
function $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Reduce(param0, param1, param2) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
}
$64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Reduce.prototype.$tag = 2;
function $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(param0, param1, param2) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
}
$64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead.prototype.$tag = 3;
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error = { $tag: 4 };
function Result$Err$29$(param0) {
  this._0 = param0;
}
Result$Err$29$.prototype.$tag = 0;
function Result$Ok$29$(param0) {
  this._0 = param0;
}
Result$Ok$29$.prototype.$tag = 1;
function Result$Err$30$(param0) {
  this._0 = param0;
}
Result$Err$30$.prototype.$tag = 0;
function Result$Ok$30$(param0) {
  this._0 = param0;
}
Result$Ok$30$.prototype.$tag = 1;
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$EOI = { $tag: 0 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$EOF = { $tag: 1 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$PARSE_LBRACE = { $tag: 2 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$REGEX = { $tag: 3 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$AS = { $tag: 4 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$UNDERSCORE = { $tag: 5 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$RBRACE = { $tag: 6 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$LPAREN = { $tag: 7 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$RPAREN = { $tag: 8 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$LBRACKET = { $tag: 9 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$RBRACKET = { $tag: 10 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$EQ = { $tag: 11 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$SEMICOLON = { $tag: 12 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$FAT_ARROW = { $tag: 13 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$BAR = { $tag: 14 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$STAR = { $tag: 15 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$PLUS = { $tag: 16 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$QUESTION = { $tag: 17 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$MINUS = { $tag: 18 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$CARET = { $tag: 19 };
const $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$BACKSLASH = { $tag: 20 };
function $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE.prototype.$tag = 21;
function $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$LBRACE_CODE_RBRACE(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$LBRACE_CODE_RBRACE.prototype.$tag = 22;
function $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$LC_IDENT(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$LC_IDENT.prototype.$tag = 23;
function $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$CHAR(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$CHAR.prototype.$tag = 24;
function $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$STRING(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$STRING.prototype.$tag = 25;
function Result$Err$31$(param0) {
  this._0 = param0;
}
Result$Err$31$.prototype.$tag = 0;
function Result$Ok$31$(param0) {
  this._0 = param0;
}
Result$Ok$31$.prototype.$tag = 1;
const $64$moonbitlang$47$ulex$47$lib$47$util$47$eof_char_set$46$EofCharRepr$Eof = { $tag: 0 };
function $64$moonbitlang$47$ulex$47$lib$47$util$47$eof_char_set$46$EofCharRepr$Char(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$util$47$eof_char_set$46$EofCharRepr$Char.prototype.$tag = 1;
function $i32_ctz(a) {
  a >>>= 0;
  if (a === 0) return 32;
  a &= -a;
  return 31 - Math.clz32(a);
}
const $64$moonbitlang$47$ulex$47$lib$47$util$47$immut_map$46$T$Empty$32$ = { $tag: 0 };
function $64$moonbitlang$47$ulex$47$lib$47$util$47$immut_map$46$T$Node$32$(param0, param1, param2, param3, param4) {
  this._0 = param0;
  this._1 = param1;
  this._2 = param2;
  this._3 = param3;
  this._4 = param4;
}
$64$moonbitlang$47$ulex$47$lib$47$util$47$immut_map$46$T$Node$32$.prototype.$tag = 1;
function $64$moonbitlang$47$ulex$47$lib$47$automaton$46$StaticKnownTagPosition$RelativeToStart(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$automaton$46$StaticKnownTagPosition$RelativeToStart.prototype.$tag = 0;
function $64$moonbitlang$47$ulex$47$lib$47$automaton$46$StaticKnownTagPosition$RelativeToEnd(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$automaton$46$StaticKnownTagPosition$RelativeToEnd.prototype.$tag = 1;
const $64$moonbitlang$47$ulex$47$lib$47$automaton$46$Input$Eps = { $tag: 0 };
function $64$moonbitlang$47$ulex$47$lib$47$automaton$46$Input$EpsWithTag(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$automaton$46$Input$EpsWithTag.prototype.$tag = 1;
function $64$moonbitlang$47$ulex$47$lib$47$automaton$46$Input$EChar(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$automaton$46$Input$EChar.prototype.$tag = 2;
function $64$moonbitlang$47$ulex$47$lib$47$automaton$46$NFACapturePosition$Dynamic_nfa(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$automaton$46$NFACapturePosition$Dynamic_nfa.prototype.$tag = 0;
function $64$moonbitlang$47$ulex$47$lib$47$automaton$46$NFACapturePosition$Static_nfa(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$automaton$46$NFACapturePosition$Static_nfa.prototype.$tag = 1;
function $64$moonbitlang$47$ulex$47$lib$47$automaton$46$DFACapturePosition$Dynamic_dfa(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$automaton$46$DFACapturePosition$Dynamic_dfa.prototype.$tag = 0;
function $64$moonbitlang$47$ulex$47$lib$47$automaton$46$DFACapturePosition$Static_dfa(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$automaton$46$DFACapturePosition$Static_dfa.prototype.$tag = 1;
function $64$moonbitlang$47$ulex$47$lib$47$automaton$46$TagOp$Set(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$automaton$46$TagOp$Set.prototype.$tag = 0;
function $64$moonbitlang$47$ulex$47$lib$47$automaton$46$TagOp$Copy(param0, param1) {
  this._0 = param0;
  this._1 = param1;
}
$64$moonbitlang$47$ulex$47$lib$47$automaton$46$TagOp$Copy.prototype.$tag = 1;
const $64$moonbitlang$47$core$47$builtin$46$ForeachResult$Continue$33$ = { $tag: 0 };
function $64$moonbitlang$47$core$47$builtin$46$ForeachResult$Break$33$(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$core$47$builtin$46$ForeachResult$Break$33$.prototype.$tag = 1;
function $64$moonbitlang$47$core$47$builtin$46$ForeachResult$Return$33$(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$core$47$builtin$46$ForeachResult$Return$33$.prototype.$tag = 2;
function $64$moonbitlang$47$core$47$builtin$46$ForeachResult$Error$33$(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$core$47$builtin$46$ForeachResult$Error$33$.prototype.$tag = 3;
function $64$moonbitlang$47$core$47$builtin$46$ForeachResult$JumpOuter$33$(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$core$47$builtin$46$ForeachResult$JumpOuter$33$.prototype.$tag = 4;
function $64$moonbitlang$47$ulex$47$lib$47$codegen$47$codeblock_parser$46$SubstItemDesc$StartPosOf(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$codegen$47$codeblock_parser$46$SubstItemDesc$StartPosOf.prototype.$tag = 0;
function $64$moonbitlang$47$ulex$47$lib$47$codegen$47$codeblock_parser$46$SubstItemDesc$EndPosOf(param0) {
  this._0 = param0;
}
$64$moonbitlang$47$ulex$47$lib$47$codegen$47$codeblock_parser$46$SubstItemDesc$EndPosOf.prototype.$tag = 1;
const $64$moonbitlang$47$ulex$47$lib$47$codegen$47$codeblock_parser$46$SubstItemDesc$StartPos = { $tag: 2 };
const $64$moonbitlang$47$ulex$47$lib$47$codegen$47$codeblock_parser$46$SubstItemDesc$EndPos = { $tag: 3 };
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
const moonbitlang$x$sys$internal$ffi$$get_cli_args_internal = function() {
  return process.argv.slice(1);
 };
const moonbitlang$x$fs$$read_file_ffi = function(path) {
   var fs = require('fs');
   try {
     const content = fs.readFileSync(path);
     globalThis.fileContent = content;
     return 0;
   } catch (error) {
     globalThis.errorMessage = error.message;
     return -1;
   }
 };
const moonbitlang$x$fs$$write_file_ffi = function(path, content) {
   var fs = require('fs');
   try {
     fs.writeFileSync(path, Buffer.from(content));
     return 0;
   } catch (error) {
     globalThis.errorMessage = error.message;
     return -1;
   }
 };
const moonbitlang$x$fs$$get_file_content_ffi = function() {
   return globalThis.fileContent;
 };
const moonbitlang$x$fs$$get_error_message_ffi = function() {
   return globalThis.errorMessage || '';
 };
function Result$Err$34$(param0) {
  this._0 = param0;
}
Result$Err$34$.prototype.$tag = 0;
function Result$Ok$34$(param0) {
  this._0 = param0;
}
Result$Ok$34$.prototype.$tag = 1;
function Result$Err$35$(param0) {
  this._0 = param0;
}
Result$Err$35$.prototype.$tag = 0;
function Result$Ok$35$(param0) {
  this._0 = param0;
}
Result$Ok$35$.prototype.$tag = 1;
function Result$Err$36$(param0) {
  this._0 = param0;
}
Result$Err$36$.prototype.$tag = 0;
function Result$Ok$36$(param0) {
  this._0 = param0;
}
Result$Ok$36$.prototype.$tag = 1;
const moonbitlang$ulex$main$util$$ffi_exit = (code) => { process.exit(code); };
const moonbitlang$ulex$main$util$$println_to_stderr = (msg) => { console.error("%s", msg); };
const moonbitlang$core$strconv$$base_err_str = "invalid base";
const moonbitlang$core$strconv$$range_err_str = "value out of range";
const moonbitlang$core$strconv$$syntax_err_str = "invalid syntax";
const moonbitlang$core$strconv$$parse_int64$46$inner$46$42$bind$124$610 = "";
const moonbitlang$core$int$$max_value = 2147483647;
const moonbitlang$x$encoding$$utf_8_len = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
const moonbitlang$ulex$lib$regex$$eof = { desc: $64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$EOF, class_: 1, len: undefined };
const moonbitlang$ulex$lib$regex$$epsilon = { desc: $64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Epsilon, class_: 1, len: 0 };
const moonbitlang$ulex$lib$util$immut_map$$rand_state = { val: 1 };
const moonbitlang$ulex$lib$codegen$$codegen_rule$46$42$bind$124$318 = "(";
const moonbitlang$ulex$lib$codegen$$codegen_rule$46$42$bind$124$317 = "[";
const moonbitlang$ulex$lib$codegen$$codegen_rule$46$42$bind$124$311 = "]";
const moonbitlang$ulex$lib$codegen$$codegen_lex$46$42$bind$124$324 = "\n";
const moonbitlang$ulex$lib$codegen$$codegen_lex$46$42$bind$124$325 = "\n\n";
const moonbitlang$ulex$main$$array_to_or_list$46$42$bind$124$42 = ", ";
const moonbitlang$ulex$main$$_init$42$46$usage$124$1 = "Usage: moonlex [options] <input-file>";
const moonbitlang$ulex$lib$util$char_set$$empty = $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$;
const moonbitlang$ulex$lib$util$char_set$$any = moonbitlang$ulex$lib$util$char_set$$range(0, 1114111);
const moonbitlang$ulex$lib$util$eof_char_set$$empty = $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$;
const moonbitlang$ulex$lib$util$eof_char_set$$eof = moonbitlang$ulex$lib$util$diet$$singleton$0$(-1);
function moonbitlang$core$abort$$abort$1$(msg) {
  $panic();
}
function moonbitlang$core$abort$$abort$2$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$3$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$4$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$5$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$6$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$7$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$8$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$9$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$10$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$11$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$12$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$13$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$14$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$15$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$16$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$17$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$18$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$19$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$20$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$21$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$22$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$23$(msg) {
  return $panic();
}
function moonbitlang$core$abort$$abort$24$(msg) {
  return $panic();
}
function moonbitlang$core$ref$$new$2$(x) {
  return { val: x };
}
function moonbitlang$core$array$$ArrayView$rev_inplace$14$(self) {
  const mid_len = self.len / 2 | 0;
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < mid_len) {
      const j = (self.len - i | 0) - 1 | 0;
      moonbitlang$core$array$$ArrayView$swap$14$(self, i, j);
      _tmp = i + 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$array$$ArrayView$rev_inplace$15$(self) {
  const mid_len = self.len / 2 | 0;
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < mid_len) {
      const j = (self.len - i | 0) - 1 | 0;
      moonbitlang$core$array$$ArrayView$swap$15$(self, i, j);
      _tmp = i + 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$array$$ArrayView$iter$2$(self) {
  const _p = (yield_) => {
    const _len = self.len;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const v = self.buf[self.start + _i | 0];
        const _bind = yield_(v);
        if (_bind === 1) {
        } else {
          return 0;
        }
        _tmp = _i + 1 | 0;
        continue;
      } else {
        return 1;
      }
    }
  };
  return _p;
}
function moonbitlang$core$array$$ArrayView$join$2$(self, separator) {
  if (self.len === 0) {
    return "";
  } else {
    const _hd = self.buf[self.start];
    const _bind = self.buf;
    const _bind$2 = 1 + self.start | 0;
    const _some = self.len;
    const _bind$3 = _some - 1 | 0;
    const _x = { buf: _bind, start: _bind$2, len: _bind$3 };
    const hd = moonbitlang$core$string$$ToStringView$to_string_view$2$(_hd);
    let size_hint = hd.end - hd.start | 0;
    const _len = _x.len;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const s = _bind[_bind$2 + _i | 0];
        const _tmp$2 = size_hint;
        const _p = moonbitlang$core$string$$ToStringView$to_string_view$2$(s);
        size_hint = _tmp$2 + ((_p.end - _p.start | 0) + (separator.end - separator.start | 0) | 0) | 0;
        _tmp = _i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    size_hint = size_hint << 1;
    const buf = moonbitlang$core$builtin$$StringBuilder$new$46$inner(size_hint);
    moonbitlang$core$builtin$$Logger$write_substring$25$(buf, hd.str, hd.start, hd.end - hd.start | 0);
    if (moonbitlang$core$string$$String$char_length_eq$46$inner(separator.str, 0, separator.start, separator.end)) {
      const _len$2 = _x.len;
      let _tmp$2 = 0;
      while (true) {
        const _i = _tmp$2;
        if (_i < _len$2) {
          const s = _bind[_bind$2 + _i | 0];
          const s$2 = moonbitlang$core$string$$ToStringView$to_string_view$2$(s);
          moonbitlang$core$builtin$$Logger$write_substring$25$(buf, s$2.str, s$2.start, s$2.end - s$2.start | 0);
          _tmp$2 = _i + 1 | 0;
          continue;
        } else {
          break;
        }
      }
    } else {
      const _len$2 = _x.len;
      let _tmp$2 = 0;
      while (true) {
        const _i = _tmp$2;
        if (_i < _len$2) {
          const s = _bind[_bind$2 + _i | 0];
          const s$2 = moonbitlang$core$string$$ToStringView$to_string_view$2$(s);
          moonbitlang$core$builtin$$Logger$write_substring$25$(buf, separator.str, separator.start, separator.end - separator.start | 0);
          moonbitlang$core$builtin$$Logger$write_substring$25$(buf, s$2.str, s$2.start, s$2.end - s$2.start | 0);
          _tmp$2 = _i + 1 | 0;
          continue;
        } else {
          break;
        }
      }
    }
    return buf.val;
  }
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
function moonbitlang$core$array$$choose_pivot$46$sort_2$47$78(_env, a, b) {
  const arr = _env._1;
  const swaps = _env._0;
  if (moonbitlang$core$builtin$$op_gt$14$(moonbitlang$core$array$$ArrayView$op_get$14$(arr, a), moonbitlang$core$array$$ArrayView$op_get$14$(arr, b))) {
    moonbitlang$core$array$$ArrayView$swap$14$(arr, a, b);
    swaps.val = swaps.val + 1 | 0;
    return;
  } else {
    return;
  }
}
function moonbitlang$core$array$$choose_pivot$46$sort_3$47$79(_env, a, b, c) {
  moonbitlang$core$array$$choose_pivot$46$sort_2$47$78(_env, a, b);
  moonbitlang$core$array$$choose_pivot$46$sort_2$47$78(_env, b, c);
  moonbitlang$core$array$$choose_pivot$46$sort_2$47$78(_env, a, b);
}
function moonbitlang$core$array$$choose_pivot$14$(arr) {
  const len = arr.len;
  const swaps = { val: 0 };
  const b = Math.imul(len / 4 | 0, 2) | 0;
  if (len >= 8) {
    const a = Math.imul(len / 4 | 0, 1) | 0;
    const c = Math.imul(len / 4 | 0, 3) | 0;
    const _env = { _0: swaps, _1: arr };
    if (len > 50) {
      moonbitlang$core$array$$choose_pivot$46$sort_3$47$79(_env, a - 1 | 0, a, a + 1 | 0);
      moonbitlang$core$array$$choose_pivot$46$sort_3$47$79(_env, b - 1 | 0, b, b + 1 | 0);
      moonbitlang$core$array$$choose_pivot$46$sort_3$47$79(_env, c - 1 | 0, c, c + 1 | 0);
    }
    moonbitlang$core$array$$choose_pivot$46$sort_3$47$79(_env, a, b, c);
  }
  if (swaps.val === 12) {
    moonbitlang$core$array$$ArrayView$rev_inplace$14$(arr);
    return { _0: (len - b | 0) - 1 | 0, _1: true };
  } else {
    return { _0: b, _1: swaps.val === 0 };
  }
}
function moonbitlang$core$array$$choose_pivot$46$sort_2$47$96(_env, a, b) {
  const arr = _env._1;
  const swaps = _env._0;
  if (moonbitlang$core$builtin$$op_gt$15$(moonbitlang$core$array$$ArrayView$op_get$15$(arr, a), moonbitlang$core$array$$ArrayView$op_get$15$(arr, b))) {
    moonbitlang$core$array$$ArrayView$swap$15$(arr, a, b);
    swaps.val = swaps.val + 1 | 0;
    return;
  } else {
    return;
  }
}
function moonbitlang$core$array$$choose_pivot$46$sort_3$47$97(_env, a, b, c) {
  moonbitlang$core$array$$choose_pivot$46$sort_2$47$96(_env, a, b);
  moonbitlang$core$array$$choose_pivot$46$sort_2$47$96(_env, b, c);
  moonbitlang$core$array$$choose_pivot$46$sort_2$47$96(_env, a, b);
}
function moonbitlang$core$array$$choose_pivot$15$(arr) {
  const len = arr.len;
  const swaps = { val: 0 };
  const b = Math.imul(len / 4 | 0, 2) | 0;
  if (len >= 8) {
    const a = Math.imul(len / 4 | 0, 1) | 0;
    const c = Math.imul(len / 4 | 0, 3) | 0;
    const _env = { _0: swaps, _1: arr };
    if (len > 50) {
      moonbitlang$core$array$$choose_pivot$46$sort_3$47$97(_env, a - 1 | 0, a, a + 1 | 0);
      moonbitlang$core$array$$choose_pivot$46$sort_3$47$97(_env, b - 1 | 0, b, b + 1 | 0);
      moonbitlang$core$array$$choose_pivot$46$sort_3$47$97(_env, c - 1 | 0, c, c + 1 | 0);
    }
    moonbitlang$core$array$$choose_pivot$46$sort_3$47$97(_env, a, b, c);
  }
  if (swaps.val === 12) {
    moonbitlang$core$array$$ArrayView$rev_inplace$15$(arr);
    return { _0: (len - b | 0) - 1 | 0, _1: true };
  } else {
    return { _0: b, _1: swaps.val === 0 };
  }
}
function moonbitlang$core$array$$sift_down$14$(arr, index) {
  let index$2 = index;
  const len = arr.len;
  let child = (Math.imul(index$2, 2) | 0) + 1 | 0;
  while (true) {
    if (child < len) {
      if ((child + 1 | 0) < len && moonbitlang$core$builtin$$op_lt$14$(moonbitlang$core$array$$ArrayView$op_get$14$(arr, child), moonbitlang$core$array$$ArrayView$op_get$14$(arr, child + 1 | 0))) {
        child = child + 1 | 0;
      }
      if (moonbitlang$core$builtin$$op_ge$14$(moonbitlang$core$array$$ArrayView$op_get$14$(arr, index$2), moonbitlang$core$array$$ArrayView$op_get$14$(arr, child))) {
        return undefined;
      }
      moonbitlang$core$array$$ArrayView$swap$14$(arr, index$2, child);
      index$2 = child;
      child = (Math.imul(index$2, 2) | 0) + 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$array$$sift_down$15$(arr, index) {
  let index$2 = index;
  const len = arr.len;
  let child = (Math.imul(index$2, 2) | 0) + 1 | 0;
  while (true) {
    if (child < len) {
      if ((child + 1 | 0) < len && moonbitlang$core$builtin$$op_lt$15$(moonbitlang$core$array$$ArrayView$op_get$15$(arr, child), moonbitlang$core$array$$ArrayView$op_get$15$(arr, child + 1 | 0))) {
        child = child + 1 | 0;
      }
      if (moonbitlang$core$builtin$$op_ge$15$(moonbitlang$core$array$$ArrayView$op_get$15$(arr, index$2), moonbitlang$core$array$$ArrayView$op_get$15$(arr, child))) {
        return undefined;
      }
      moonbitlang$core$array$$ArrayView$swap$15$(arr, index$2, child);
      index$2 = child;
      child = (Math.imul(index$2, 2) | 0) + 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$array$$heap_sort$14$(arr) {
  const len = arr.len;
  let _tmp = (len / 2 | 0) - 1 | 0;
  while (true) {
    const i = _tmp;
    if (i >= 0) {
      moonbitlang$core$array$$sift_down$14$(arr, i);
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
      moonbitlang$core$array$$ArrayView$swap$14$(arr, 0, i);
      moonbitlang$core$array$$sift_down$14$(moonbitlang$core$array$$ArrayView$op_as_view$46$inner$14$(arr, 0, i), 0);
      _tmp$2 = i - 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$array$$heap_sort$15$(arr) {
  const len = arr.len;
  let _tmp = (len / 2 | 0) - 1 | 0;
  while (true) {
    const i = _tmp;
    if (i >= 0) {
      moonbitlang$core$array$$sift_down$15$(arr, i);
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
      moonbitlang$core$array$$ArrayView$swap$15$(arr, 0, i);
      moonbitlang$core$array$$sift_down$15$(moonbitlang$core$array$$ArrayView$op_as_view$46$inner$15$(arr, 0, i), 0);
      _tmp$2 = i - 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$array$$partition$14$(arr, pivot_index) {
  moonbitlang$core$array$$ArrayView$swap$14$(arr, pivot_index, arr.len - 1 | 0);
  const pivot = moonbitlang$core$array$$ArrayView$op_get$14$(arr, arr.len - 1 | 0);
  let i = 0;
  let partitioned = true;
  const _end832 = arr.len - 1 | 0;
  let _tmp = 0;
  while (true) {
    const j = _tmp;
    if (j < _end832) {
      if (moonbitlang$core$builtin$$op_lt$14$(moonbitlang$core$array$$ArrayView$op_get$14$(arr, j), pivot)) {
        if (i !== j) {
          moonbitlang$core$array$$ArrayView$swap$14$(arr, i, j);
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
  moonbitlang$core$array$$ArrayView$swap$14$(arr, i, arr.len - 1 | 0);
  return { _0: i, _1: partitioned };
}
function moonbitlang$core$array$$partition$15$(arr, pivot_index) {
  moonbitlang$core$array$$ArrayView$swap$15$(arr, pivot_index, arr.len - 1 | 0);
  const pivot = moonbitlang$core$array$$ArrayView$op_get$15$(arr, arr.len - 1 | 0);
  let i = 0;
  let partitioned = true;
  const _end832 = arr.len - 1 | 0;
  let _tmp = 0;
  while (true) {
    const j = _tmp;
    if (j < _end832) {
      if (moonbitlang$core$builtin$$op_lt$15$(moonbitlang$core$array$$ArrayView$op_get$15$(arr, j), pivot)) {
        if (i !== j) {
          moonbitlang$core$array$$ArrayView$swap$15$(arr, i, j);
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
  moonbitlang$core$array$$ArrayView$swap$15$(arr, i, arr.len - 1 | 0);
  return { _0: i, _1: partitioned };
}
function moonbitlang$core$array$$try_bubble_sort$14$(arr) {
  let tries = 0;
  const _end847 = arr.len;
  let _tmp = 1;
  while (true) {
    const i = _tmp;
    if (i < _end847) {
      let sorted = true;
      let _tmp$2 = i;
      while (true) {
        const j = _tmp$2;
        if (j > 0 && moonbitlang$core$builtin$$op_gt$14$(moonbitlang$core$array$$ArrayView$op_get$14$(arr, j - 1 | 0), moonbitlang$core$array$$ArrayView$op_get$14$(arr, j))) {
          sorted = false;
          moonbitlang$core$array$$ArrayView$swap$14$(arr, j, j - 1 | 0);
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
function moonbitlang$core$array$$try_bubble_sort$15$(arr) {
  let tries = 0;
  const _end847 = arr.len;
  let _tmp = 1;
  while (true) {
    const i = _tmp;
    if (i < _end847) {
      let sorted = true;
      let _tmp$2 = i;
      while (true) {
        const j = _tmp$2;
        if (j > 0 && moonbitlang$core$builtin$$op_gt$15$(moonbitlang$core$array$$ArrayView$op_get$15$(arr, j - 1 | 0), moonbitlang$core$array$$ArrayView$op_get$15$(arr, j))) {
          sorted = false;
          moonbitlang$core$array$$ArrayView$swap$15$(arr, j, j - 1 | 0);
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
function moonbitlang$core$array$$ArrayView$insertion_sort$14$(arr) {
  const _end838 = arr.len;
  let _tmp = 1;
  while (true) {
    const i = _tmp;
    if (i < _end838) {
      let _tmp$2 = i;
      while (true) {
        const j = _tmp$2;
        if (j > 0 && moonbitlang$core$builtin$$op_gt$14$(moonbitlang$core$array$$ArrayView$op_get$14$(arr, j - 1 | 0), moonbitlang$core$array$$ArrayView$op_get$14$(arr, j))) {
          moonbitlang$core$array$$ArrayView$swap$14$(arr, j, j - 1 | 0);
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
function moonbitlang$core$array$$ArrayView$insertion_sort$15$(arr) {
  const _end838 = arr.len;
  let _tmp = 1;
  while (true) {
    const i = _tmp;
    if (i < _end838) {
      let _tmp$2 = i;
      while (true) {
        const j = _tmp$2;
        if (j > 0 && moonbitlang$core$builtin$$op_gt$15$(moonbitlang$core$array$$ArrayView$op_get$15$(arr, j - 1 | 0), moonbitlang$core$array$$ArrayView$op_get$15$(arr, j))) {
          moonbitlang$core$array$$ArrayView$swap$15$(arr, j, j - 1 | 0);
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
function moonbitlang$core$array$$quick_sort$14$(arr, pred, limit) {
  let limit$2 = limit;
  let arr$2 = arr;
  let pred$2 = pred;
  let was_partitioned = true;
  let balanced = true;
  while (true) {
    const _p = arr$2;
    const len = _p.len;
    if (len <= 16) {
      if (len >= 2) {
        moonbitlang$core$array$$ArrayView$insertion_sort$14$(arr$2);
      }
      return undefined;
    }
    if (limit$2 === 0) {
      moonbitlang$core$array$$heap_sort$14$(arr$2);
      return undefined;
    }
    const _bind = moonbitlang$core$array$$choose_pivot$14$(arr$2);
    const _pivot_index = _bind._0;
    const _likely_sorted = _bind._1;
    if (was_partitioned && (balanced && _likely_sorted)) {
      if (moonbitlang$core$array$$try_bubble_sort$14$(arr$2)) {
        return undefined;
      }
    }
    const _bind$2 = moonbitlang$core$array$$partition$14$(arr$2, _pivot_index);
    const _pivot = _bind$2._0;
    const _partitioned = _bind$2._1;
    was_partitioned = _partitioned;
    const _p$2 = len - _pivot | 0;
    balanced = (_pivot > _p$2 ? _p$2 : _pivot) >= (len / 8 | 0);
    if (!balanced) {
      limit$2 = limit$2 - 1 | 0;
    }
    const _bind$3 = pred$2;
    if (_bind$3 === undefined) {
    } else {
      const _Some = _bind$3;
      const _pred = _Some;
      if (moonbitlang$core$builtin$$Eq$equal$26$(_pred, moonbitlang$core$array$$ArrayView$op_get$14$(arr$2, _pivot))) {
        let i = _pivot;
        while (true) {
          if (i < len && moonbitlang$core$builtin$$Eq$equal$26$(_pred, moonbitlang$core$array$$ArrayView$op_get$14$(arr$2, i))) {
            i = i + 1 | 0;
            continue;
          } else {
            break;
          }
        }
        arr$2 = moonbitlang$core$array$$ArrayView$op_as_view$46$inner$14$(arr$2, i, len);
        continue;
      }
    }
    const left = moonbitlang$core$array$$ArrayView$op_as_view$46$inner$14$(arr$2, 0, _pivot);
    const right = moonbitlang$core$array$$ArrayView$op_as_view$46$inner$14$(arr$2, _pivot + 1 | 0, len);
    if (left.len < right.len) {
      moonbitlang$core$array$$quick_sort$14$(left, pred$2, limit$2);
      pred$2 = moonbitlang$core$array$$ArrayView$op_get$14$(arr$2, _pivot);
      arr$2 = right;
    } else {
      moonbitlang$core$array$$quick_sort$14$(right, moonbitlang$core$array$$ArrayView$op_get$14$(arr$2, _pivot), limit$2);
      arr$2 = left;
    }
    continue;
  }
}
function moonbitlang$core$array$$quick_sort$15$(arr, pred, limit) {
  let limit$2 = limit;
  let arr$2 = arr;
  let pred$2 = pred;
  let was_partitioned = true;
  let balanced = true;
  while (true) {
    const _p = arr$2;
    const len = _p.len;
    if (len <= 16) {
      if (len >= 2) {
        moonbitlang$core$array$$ArrayView$insertion_sort$15$(arr$2);
      }
      return undefined;
    }
    if (limit$2 === 0) {
      moonbitlang$core$array$$heap_sort$15$(arr$2);
      return undefined;
    }
    const _bind = moonbitlang$core$array$$choose_pivot$15$(arr$2);
    const _pivot_index = _bind._0;
    const _likely_sorted = _bind._1;
    if (was_partitioned && (balanced && _likely_sorted)) {
      if (moonbitlang$core$array$$try_bubble_sort$15$(arr$2)) {
        return undefined;
      }
    }
    const _bind$2 = moonbitlang$core$array$$partition$15$(arr$2, _pivot_index);
    const _pivot = _bind$2._0;
    const _partitioned = _bind$2._1;
    was_partitioned = _partitioned;
    const _p$2 = len - _pivot | 0;
    balanced = (_pivot > _p$2 ? _p$2 : _pivot) >= (len / 8 | 0);
    if (!balanced) {
      limit$2 = limit$2 - 1 | 0;
    }
    const _bind$3 = pred$2;
    if (_bind$3 === undefined) {
    } else {
      const _Some = _bind$3;
      const _pred = _Some;
      if (moonbitlang$core$builtin$$Eq$equal$15$(_pred, moonbitlang$core$array$$ArrayView$op_get$15$(arr$2, _pivot))) {
        let i = _pivot;
        while (true) {
          if (i < len && moonbitlang$core$builtin$$Eq$equal$15$(_pred, moonbitlang$core$array$$ArrayView$op_get$15$(arr$2, i))) {
            i = i + 1 | 0;
            continue;
          } else {
            break;
          }
        }
        arr$2 = moonbitlang$core$array$$ArrayView$op_as_view$46$inner$15$(arr$2, i, len);
        continue;
      }
    }
    const left = moonbitlang$core$array$$ArrayView$op_as_view$46$inner$15$(arr$2, 0, _pivot);
    const right = moonbitlang$core$array$$ArrayView$op_as_view$46$inner$15$(arr$2, _pivot + 1 | 0, len);
    if (left.len < right.len) {
      moonbitlang$core$array$$quick_sort$15$(left, pred$2, limit$2);
      pred$2 = moonbitlang$core$array$$ArrayView$op_get$15$(arr$2, _pivot);
      arr$2 = right;
    } else {
      moonbitlang$core$array$$quick_sort$15$(right, moonbitlang$core$array$$ArrayView$op_get$15$(arr$2, _pivot), limit$2);
      arr$2 = left;
    }
    continue;
  }
}
function moonbitlang$core$array$$Array$sort$14$(self) {
  const len = self.length;
  moonbitlang$core$array$$quick_sort$14$(moonbitlang$core$array$$Array$op_as_view$46$inner$14$(self, 0, len), undefined, moonbitlang$core$array$$get_limit(len));
}
function moonbitlang$core$array$$Array$sort$15$(self) {
  const len = self.length;
  moonbitlang$core$array$$quick_sort$15$(moonbitlang$core$array$$Array$op_as_view$46$inner$15$(self, 0, len), undefined, moonbitlang$core$array$$get_limit(len));
}
function moonbitlang$core$array$$FixedArray$blit_from_bytesview(self, bytes_offset, src) {
  moonbitlang$core$array$$FixedArray$blit_from_bytes(self, bytes_offset, src.bytes, src.start, src.len);
}
function moonbitlang$core$array$$Array$push_iter$2$(self, iter) {
  iter((x) => {
    moonbitlang$core$array$$Array$push$2$(self, x);
    return 1;
  });
}
function moonbitlang$core$array$$Array$push_iter$27$(self, iter) {
  iter((x) => {
    moonbitlang$core$array$$Array$push$27$(self, x);
    return 1;
  });
}
function moonbitlang$core$array$$Array$join$2$(self, separator) {
  return moonbitlang$core$array$$ArrayView$join$2$({ buf: self, start: 0, len: self.length }, separator);
}
function moonbitlang$core$builtin$$Eq$equal$28$(self, other) {
  return moonbitlang$core$builtin$$Eq$equal$29$(self.value, other.value);
}
function moonbitlang$core$builtin$$Eq$equal$30$(self, other) {
  const _p = self.value;
  const _p$2 = other.value;
  return _p._0 === _p$2._0 && _p._1 === _p$2._1;
}
function moonbitlang$core$sorted_set$$new$29$() {
  return { root: undefined, size: 0 };
}
function moonbitlang$core$sorted_set$$new$31$() {
  return { root: undefined, size: 0 };
}
function moonbitlang$core$sorted_set$$new$4$() {
  return { root: undefined, size: 0 };
}
function moonbitlang$core$sorted_set$$height_ge$29$(x1, x2) {
  if (x2 === undefined) {
    return true;
  } else {
    const _Some = x2;
    const _n2 = _Some;
    if (x1 === undefined) {
      return false;
    } else {
      const _Some$2 = x1;
      const _n1 = _Some$2;
      return _n1.height >= _n2.height;
    }
  }
}
function moonbitlang$core$sorted_set$$height_ge$31$(x1, x2) {
  if (x2 === undefined) {
    return true;
  } else {
    const _Some = x2;
    const _n2 = _Some;
    if (x1 === undefined) {
      return false;
    } else {
      const _Some$2 = x1;
      const _n1 = _Some$2;
      return _n1.height >= _n2.height;
    }
  }
}
function moonbitlang$core$sorted_set$$height_ge$4$(x1, x2) {
  if (x2 === undefined) {
    return true;
  } else {
    const _Some = x2;
    const _n2 = _Some;
    if (x1 === undefined) {
      return false;
    } else {
      const _Some$2 = x1;
      const _n1 = _Some$2;
      return _n1.height >= _n2.height;
    }
  }
}
function moonbitlang$core$sorted_set$$Node$update_height$29$(self) {
  const _p = self.left;
  let _p$2;
  if (_p === undefined) {
    _p$2 = 0;
  } else {
    const _p$3 = _p;
    const _p$4 = _p$3;
    _p$2 = _p$4.height;
  }
  const _p$3 = self.right;
  let _p$4;
  if (_p$3 === undefined) {
    _p$4 = 0;
  } else {
    const _p$5 = _p$3;
    const _p$6 = _p$5;
    _p$4 = _p$6.height;
  }
  self.height = 1 + (_p$2 > _p$4 ? _p$2 : _p$4) | 0;
}
function moonbitlang$core$sorted_set$$Node$update_height$31$(self) {
  const _p = self.left;
  let _p$2;
  if (_p === undefined) {
    _p$2 = 0;
  } else {
    const _p$3 = _p;
    const _p$4 = _p$3;
    _p$2 = _p$4.height;
  }
  const _p$3 = self.right;
  let _p$4;
  if (_p$3 === undefined) {
    _p$4 = 0;
  } else {
    const _p$5 = _p$3;
    const _p$6 = _p$5;
    _p$4 = _p$6.height;
  }
  self.height = 1 + (_p$2 > _p$4 ? _p$2 : _p$4) | 0;
}
function moonbitlang$core$sorted_set$$Node$update_height$4$(self) {
  const _p = self.left;
  let _p$2;
  if (_p === undefined) {
    _p$2 = 0;
  } else {
    const _p$3 = _p;
    const _p$4 = _p$3;
    _p$2 = _p$4.height;
  }
  const _p$3 = self.right;
  let _p$4;
  if (_p$3 === undefined) {
    _p$4 = 0;
  } else {
    const _p$5 = _p$3;
    const _p$6 = _p$5;
    _p$4 = _p$6.height;
  }
  self.height = 1 + (_p$2 > _p$4 ? _p$2 : _p$4) | 0;
}
function moonbitlang$core$sorted_set$$rotate_l$29$(n) {
  const _p = n.right;
  let r;
  if (_p === undefined) {
    r = $panic();
  } else {
    const _p$2 = _p;
    r = _p$2;
  }
  n.right = r.left;
  r.left = n;
  moonbitlang$core$sorted_set$$Node$update_height$29$(n);
  moonbitlang$core$sorted_set$$Node$update_height$29$(r);
  return r;
}
function moonbitlang$core$sorted_set$$rotate_l$31$(n) {
  const _p = n.right;
  let r;
  if (_p === undefined) {
    r = $panic();
  } else {
    const _p$2 = _p;
    r = _p$2;
  }
  n.right = r.left;
  r.left = n;
  moonbitlang$core$sorted_set$$Node$update_height$31$(n);
  moonbitlang$core$sorted_set$$Node$update_height$31$(r);
  return r;
}
function moonbitlang$core$sorted_set$$rotate_l$4$(n) {
  const _p = n.right;
  let r;
  if (_p === undefined) {
    r = $panic();
  } else {
    const _p$2 = _p;
    r = _p$2;
  }
  n.right = r.left;
  r.left = n;
  moonbitlang$core$sorted_set$$Node$update_height$4$(n);
  moonbitlang$core$sorted_set$$Node$update_height$4$(r);
  return r;
}
function moonbitlang$core$sorted_set$$rotate_r$29$(n) {
  const _p = n.left;
  let l;
  if (_p === undefined) {
    l = $panic();
  } else {
    const _p$2 = _p;
    l = _p$2;
  }
  n.left = l.right;
  l.right = n;
  moonbitlang$core$sorted_set$$Node$update_height$29$(n);
  moonbitlang$core$sorted_set$$Node$update_height$29$(l);
  return l;
}
function moonbitlang$core$sorted_set$$rotate_r$31$(n) {
  const _p = n.left;
  let l;
  if (_p === undefined) {
    l = $panic();
  } else {
    const _p$2 = _p;
    l = _p$2;
  }
  n.left = l.right;
  l.right = n;
  moonbitlang$core$sorted_set$$Node$update_height$31$(n);
  moonbitlang$core$sorted_set$$Node$update_height$31$(l);
  return l;
}
function moonbitlang$core$sorted_set$$rotate_r$4$(n) {
  const _p = n.left;
  let l;
  if (_p === undefined) {
    l = $panic();
  } else {
    const _p$2 = _p;
    l = _p$2;
  }
  n.left = l.right;
  l.right = n;
  moonbitlang$core$sorted_set$$Node$update_height$4$(n);
  moonbitlang$core$sorted_set$$Node$update_height$4$(l);
  return l;
}
function moonbitlang$core$sorted_set$$rotate_lr$29$(n) {
  const _p = n.left;
  let l;
  if (_p === undefined) {
    l = $panic();
  } else {
    const _p$2 = _p;
    l = _p$2;
  }
  const v = moonbitlang$core$sorted_set$$rotate_l$29$(l);
  n.left = v;
  return moonbitlang$core$sorted_set$$rotate_r$29$(n);
}
function moonbitlang$core$sorted_set$$rotate_lr$31$(n) {
  const _p = n.left;
  let l;
  if (_p === undefined) {
    l = $panic();
  } else {
    const _p$2 = _p;
    l = _p$2;
  }
  const v = moonbitlang$core$sorted_set$$rotate_l$31$(l);
  n.left = v;
  return moonbitlang$core$sorted_set$$rotate_r$31$(n);
}
function moonbitlang$core$sorted_set$$rotate_lr$4$(n) {
  const _p = n.left;
  let l;
  if (_p === undefined) {
    l = $panic();
  } else {
    const _p$2 = _p;
    l = _p$2;
  }
  const v = moonbitlang$core$sorted_set$$rotate_l$4$(l);
  n.left = v;
  return moonbitlang$core$sorted_set$$rotate_r$4$(n);
}
function moonbitlang$core$sorted_set$$rotate_rl$29$(n) {
  const _p = n.right;
  let r;
  if (_p === undefined) {
    r = $panic();
  } else {
    const _p$2 = _p;
    r = _p$2;
  }
  const v = moonbitlang$core$sorted_set$$rotate_r$29$(r);
  n.right = v;
  return moonbitlang$core$sorted_set$$rotate_l$29$(n);
}
function moonbitlang$core$sorted_set$$rotate_rl$31$(n) {
  const _p = n.right;
  let r;
  if (_p === undefined) {
    r = $panic();
  } else {
    const _p$2 = _p;
    r = _p$2;
  }
  const v = moonbitlang$core$sorted_set$$rotate_r$31$(r);
  n.right = v;
  return moonbitlang$core$sorted_set$$rotate_l$31$(n);
}
function moonbitlang$core$sorted_set$$rotate_rl$4$(n) {
  const _p = n.right;
  let r;
  if (_p === undefined) {
    r = $panic();
  } else {
    const _p$2 = _p;
    r = _p$2;
  }
  const v = moonbitlang$core$sorted_set$$rotate_r$4$(r);
  n.right = v;
  return moonbitlang$core$sorted_set$$rotate_l$4$(n);
}
function moonbitlang$core$sorted_set$$balance$29$(root) {
  const l = root.left;
  const r = root.right;
  let hl;
  if (l === undefined) {
    hl = 0;
  } else {
    const _p = l;
    const _p$2 = _p;
    hl = _p$2.height;
  }
  let hr;
  if (r === undefined) {
    hr = 0;
  } else {
    const _p = r;
    const _p$2 = _p;
    hr = _p$2.height;
  }
  let new_root;
  if (hl > (hr + 1 | 0)) {
    let _bind;
    if (l === undefined) {
      _bind = $panic();
    } else {
      const _p = l;
      _bind = _p;
    }
    const _ll = _bind.left;
    const _lr = _bind.right;
    new_root = moonbitlang$core$sorted_set$$height_ge$29$(_ll, _lr) ? moonbitlang$core$sorted_set$$rotate_r$29$(root) : moonbitlang$core$sorted_set$$rotate_lr$29$(root);
  } else {
    if (hr > (hl + 1 | 0)) {
      let _bind;
      if (r === undefined) {
        _bind = $panic();
      } else {
        const _p = r;
        _bind = _p;
      }
      const _rl = _bind.left;
      const _rr = _bind.right;
      new_root = moonbitlang$core$sorted_set$$height_ge$29$(_rr, _rl) ? moonbitlang$core$sorted_set$$rotate_l$29$(root) : moonbitlang$core$sorted_set$$rotate_rl$29$(root);
    } else {
      new_root = root;
    }
  }
  moonbitlang$core$sorted_set$$Node$update_height$29$(new_root);
  return new_root;
}
function moonbitlang$core$sorted_set$$balance$31$(root) {
  const l = root.left;
  const r = root.right;
  let hl;
  if (l === undefined) {
    hl = 0;
  } else {
    const _p = l;
    const _p$2 = _p;
    hl = _p$2.height;
  }
  let hr;
  if (r === undefined) {
    hr = 0;
  } else {
    const _p = r;
    const _p$2 = _p;
    hr = _p$2.height;
  }
  let new_root;
  if (hl > (hr + 1 | 0)) {
    let _bind;
    if (l === undefined) {
      _bind = $panic();
    } else {
      const _p = l;
      _bind = _p;
    }
    const _ll = _bind.left;
    const _lr = _bind.right;
    new_root = moonbitlang$core$sorted_set$$height_ge$31$(_ll, _lr) ? moonbitlang$core$sorted_set$$rotate_r$31$(root) : moonbitlang$core$sorted_set$$rotate_lr$31$(root);
  } else {
    if (hr > (hl + 1 | 0)) {
      let _bind;
      if (r === undefined) {
        _bind = $panic();
      } else {
        const _p = r;
        _bind = _p;
      }
      const _rl = _bind.left;
      const _rr = _bind.right;
      new_root = moonbitlang$core$sorted_set$$height_ge$31$(_rr, _rl) ? moonbitlang$core$sorted_set$$rotate_l$31$(root) : moonbitlang$core$sorted_set$$rotate_rl$31$(root);
    } else {
      new_root = root;
    }
  }
  moonbitlang$core$sorted_set$$Node$update_height$31$(new_root);
  return new_root;
}
function moonbitlang$core$sorted_set$$balance$4$(root) {
  const l = root.left;
  const r = root.right;
  let hl;
  if (l === undefined) {
    hl = 0;
  } else {
    const _p = l;
    const _p$2 = _p;
    hl = _p$2.height;
  }
  let hr;
  if (r === undefined) {
    hr = 0;
  } else {
    const _p = r;
    const _p$2 = _p;
    hr = _p$2.height;
  }
  let new_root;
  if (hl > (hr + 1 | 0)) {
    let _bind;
    if (l === undefined) {
      _bind = $panic();
    } else {
      const _p = l;
      _bind = _p;
    }
    const _ll = _bind.left;
    const _lr = _bind.right;
    new_root = moonbitlang$core$sorted_set$$height_ge$4$(_ll, _lr) ? moonbitlang$core$sorted_set$$rotate_r$4$(root) : moonbitlang$core$sorted_set$$rotate_lr$4$(root);
  } else {
    if (hr > (hl + 1 | 0)) {
      let _bind;
      if (r === undefined) {
        _bind = $panic();
      } else {
        const _p = r;
        _bind = _p;
      }
      const _rl = _bind.left;
      const _rr = _bind.right;
      new_root = moonbitlang$core$sorted_set$$height_ge$4$(_rr, _rl) ? moonbitlang$core$sorted_set$$rotate_l$4$(root) : moonbitlang$core$sorted_set$$rotate_rl$4$(root);
    } else {
      new_root = root;
    }
  }
  moonbitlang$core$sorted_set$$Node$update_height$4$(new_root);
  return new_root;
}
function moonbitlang$core$sorted_set$$new_node$46$inner$29$(value, left, right, height) {
  return { value: value, left: left, right: right, height: height };
}
function moonbitlang$core$sorted_set$$new_node$46$inner$31$(value, left, right, height) {
  return { value: value, left: left, right: right, height: height };
}
function moonbitlang$core$sorted_set$$new_node$46$inner$4$(value, left, right, height) {
  return { value: value, left: left, right: right, height: height };
}
function moonbitlang$core$sorted_set$$new_node$29$(value, left$46$opt, right$46$opt, height$46$opt) {
  let left;
  if (left$46$opt.$tag === 1) {
    const _Some = left$46$opt;
    left = _Some._0;
  } else {
    left = undefined;
  }
  let right;
  if (right$46$opt.$tag === 1) {
    const _Some = right$46$opt;
    right = _Some._0;
  } else {
    right = undefined;
  }
  let height;
  if (height$46$opt === undefined) {
    height = 1;
  } else {
    const _Some = height$46$opt;
    height = _Some;
  }
  return moonbitlang$core$sorted_set$$new_node$46$inner$29$(value, left, right, height);
}
function moonbitlang$core$sorted_set$$new_node$31$(value, left$46$opt, right$46$opt, height$46$opt) {
  let left;
  if (left$46$opt.$tag === 1) {
    const _Some = left$46$opt;
    left = _Some._0;
  } else {
    left = undefined;
  }
  let right;
  if (right$46$opt.$tag === 1) {
    const _Some = right$46$opt;
    right = _Some._0;
  } else {
    right = undefined;
  }
  let height;
  if (height$46$opt === undefined) {
    height = 1;
  } else {
    const _Some = height$46$opt;
    height = _Some;
  }
  return moonbitlang$core$sorted_set$$new_node$46$inner$31$(value, left, right, height);
}
function moonbitlang$core$sorted_set$$new_node$4$(value, left$46$opt, right$46$opt, height$46$opt) {
  let left;
  if (left$46$opt.$tag === 1) {
    const _Some = left$46$opt;
    left = _Some._0;
  } else {
    left = undefined;
  }
  let right;
  if (right$46$opt.$tag === 1) {
    const _Some = right$46$opt;
    right = _Some._0;
  } else {
    right = undefined;
  }
  let height;
  if (height$46$opt === undefined) {
    height = 1;
  } else {
    const _Some = height$46$opt;
    height = _Some;
  }
  return moonbitlang$core$sorted_set$$new_node$46$inner$4$(value, left, right, height);
}
function moonbitlang$core$sorted_set$$add_node$29$(root, value) {
  if (root === undefined) {
    return { _0: moonbitlang$core$sorted_set$$new_node$29$(value, Option$None$2$, Option$None$2$, undefined), _1: true };
  } else {
    const _Some = root;
    const _n = _Some;
    const comp = moonbitlang$core$builtin$$Compare$compare$29$(value, _n.value);
    if (comp === 0) {
      _n.value = value;
      return { _0: _n, _1: false };
    } else {
      const l = _n.left;
      const r = _n.right;
      if (comp < 0) {
        const _bind = moonbitlang$core$sorted_set$$add_node$29$(l, value);
        const _nl = _bind._0;
        const _inserted = _bind._1;
        _n.left = _nl;
        return { _0: moonbitlang$core$sorted_set$$balance$29$(_n), _1: _inserted };
      } else {
        const _bind = moonbitlang$core$sorted_set$$add_node$29$(r, value);
        const _nr = _bind._0;
        const _inserted = _bind._1;
        _n.right = _nr;
        return { _0: moonbitlang$core$sorted_set$$balance$29$(_n), _1: _inserted };
      }
    }
  }
}
function moonbitlang$core$sorted_set$$add_node$31$(root, value) {
  if (root === undefined) {
    return { _0: moonbitlang$core$sorted_set$$new_node$31$(value, Option$None$3$, Option$None$3$, undefined), _1: true };
  } else {
    const _Some = root;
    const _n = _Some;
    const _p = _n.value;
    const _p$2 = $compare_int(value._0, _p._0);
    const comp = _p$2 === 0 ? $compare_int(value._1, _p._1) : _p$2;
    if (comp === 0) {
      _n.value = value;
      return { _0: _n, _1: false };
    } else {
      const l = _n.left;
      const r = _n.right;
      if (comp < 0) {
        const _bind = moonbitlang$core$sorted_set$$add_node$31$(l, value);
        const _nl = _bind._0;
        const _inserted = _bind._1;
        _n.left = _nl;
        return { _0: moonbitlang$core$sorted_set$$balance$31$(_n), _1: _inserted };
      } else {
        const _bind = moonbitlang$core$sorted_set$$add_node$31$(r, value);
        const _nr = _bind._0;
        const _inserted = _bind._1;
        _n.right = _nr;
        return { _0: moonbitlang$core$sorted_set$$balance$31$(_n), _1: _inserted };
      }
    }
  }
}
function moonbitlang$core$sorted_set$$add_node$4$(root, value) {
  if (root === undefined) {
    return { _0: moonbitlang$core$sorted_set$$new_node$4$(value, Option$None$4$, Option$None$4$, undefined), _1: true };
  } else {
    const _Some = root;
    const _n = _Some;
    const comp = $compare_int(value, _n.value);
    if (comp === 0) {
      _n.value = value;
      return { _0: _n, _1: false };
    } else {
      const l = _n.left;
      const r = _n.right;
      if (comp < 0) {
        const _bind = moonbitlang$core$sorted_set$$add_node$4$(l, value);
        const _nl = _bind._0;
        const _inserted = _bind._1;
        _n.left = _nl;
        return { _0: moonbitlang$core$sorted_set$$balance$4$(_n), _1: _inserted };
      } else {
        const _bind = moonbitlang$core$sorted_set$$add_node$4$(r, value);
        const _nr = _bind._0;
        const _inserted = _bind._1;
        _n.right = _nr;
        return { _0: moonbitlang$core$sorted_set$$balance$4$(_n), _1: _inserted };
      }
    }
  }
}
function moonbitlang$core$sorted_set$$SortedSet$add$29$(self, value) {
  const _bind = moonbitlang$core$sorted_set$$add_node$29$(self.root, value);
  const _new_root = _bind._0;
  const _inserted = _bind._1;
  if (moonbitlang$core$builtin$$op_notequal$32$(self.root, _new_root)) {
    self.root = _new_root;
  }
  if (_inserted) {
    self.size = self.size + 1 | 0;
    return;
  } else {
    return;
  }
}
function moonbitlang$core$sorted_set$$SortedSet$add$31$(self, value) {
  const _bind = moonbitlang$core$sorted_set$$add_node$31$(self.root, value);
  const _new_root = _bind._0;
  const _inserted = _bind._1;
  if (moonbitlang$core$builtin$$op_notequal$33$(self.root, _new_root)) {
    self.root = _new_root;
  }
  if (_inserted) {
    self.size = self.size + 1 | 0;
    return;
  } else {
    return;
  }
}
function moonbitlang$core$sorted_set$$SortedSet$add$4$(self, value) {
  const _bind = moonbitlang$core$sorted_set$$add_node$4$(self.root, value);
  const _new_root = _bind._0;
  const _inserted = _bind._1;
  if (moonbitlang$core$builtin$$op_notequal$34$(self.root, _new_root)) {
    self.root = _new_root;
  }
  if (_inserted) {
    self.size = self.size + 1 | 0;
    return;
  } else {
    return;
  }
}
function moonbitlang$core$sorted_set$$to_array$46$dfs$47$443(_env, root) {
  const i = _env._1;
  const arr = _env._0;
  let _tmp = root;
  while (true) {
    const root$2 = _tmp;
    if (root$2 === undefined) {
      return;
    } else {
      const _Some = root$2;
      const _root = _Some;
      moonbitlang$core$sorted_set$$to_array$46$dfs$47$443(_env, _root.left);
      moonbitlang$core$array$$Array$op_set$4$(arr, i.val, _root.value);
      i.val = i.val + 1 | 0;
      _tmp = _root.right;
      continue;
    }
  }
}
function moonbitlang$core$sorted_set$$SortedSet$to_array$4$(self) {
  if (self.size === 0) {
    return [];
  } else {
    const _p = self.root;
    let _tmp;
    if (_p === undefined) {
      _tmp = $panic();
    } else {
      const _p$2 = _p;
      _tmp = _p$2;
    }
    const padding = _tmp.value;
    const arr = moonbitlang$core$array$$Array$make$4$(self.size, padding);
    const i = { val: 0 };
    const _env = { _0: arr, _1: i };
    moonbitlang$core$sorted_set$$to_array$46$dfs$47$443(_env, self.root);
    return arr;
  }
}
function moonbitlang$core$sorted_set$$iter$46$go$47$457(yield_, x) {
  let _tmp = x;
  while (true) {
    const x$2 = _tmp;
    if (x$2 === undefined) {
      return 1;
    } else {
      const _Some = x$2;
      const _x = _Some;
      const _left = _x.left;
      const _right = _x.right;
      const _value = _x.value;
      const _bind = moonbitlang$core$sorted_set$$iter$46$go$47$457(yield_, _left);
      if (_bind === 0) {
        return 0;
      } else {
        const _bind$2 = yield_(_value);
        if (_bind$2 === 0) {
          return 0;
        } else {
          _tmp = _right;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$sorted_set$$SortedSet$iter$29$(self) {
  const _p = (yield_) => moonbitlang$core$sorted_set$$iter$46$go$47$457(yield_, self.root);
  return _p;
}
function moonbitlang$core$sorted_set$$iter$46$go$47$471(yield_, x) {
  let _tmp = x;
  while (true) {
    const x$2 = _tmp;
    if (x$2 === undefined) {
      return 1;
    } else {
      const _Some = x$2;
      const _x = _Some;
      const _left = _x.left;
      const _right = _x.right;
      const _value = _x.value;
      const _bind = moonbitlang$core$sorted_set$$iter$46$go$47$471(yield_, _left);
      if (_bind === 0) {
        return 0;
      } else {
        const _bind$2 = yield_(_value);
        if (_bind$2 === 0) {
          return 0;
        } else {
          _tmp = _right;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$sorted_set$$SortedSet$iter$31$(self) {
  const _p = (yield_) => moonbitlang$core$sorted_set$$iter$46$go$47$471(yield_, self.root);
  return _p;
}
function moonbitlang$core$sorted_set$$iter$46$go$47$485(yield_, x) {
  let _tmp = x;
  while (true) {
    const x$2 = _tmp;
    if (x$2 === undefined) {
      return 1;
    } else {
      const _Some = x$2;
      const _x = _Some;
      const _left = _x.left;
      const _right = _x.right;
      const _value = _x.value;
      const _bind = moonbitlang$core$sorted_set$$iter$46$go$47$485(yield_, _left);
      if (_bind === 0) {
        return 0;
      } else {
        const _bind$2 = yield_(_value);
        if (_bind$2 === 0) {
          return 0;
        } else {
          _tmp = _right;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$sorted_set$$SortedSet$iter$4$(self) {
  const _p = (yield_) => moonbitlang$core$sorted_set$$iter$46$go$47$485(yield_, self.root);
  return _p;
}
function moonbitlang$core$sorted_set$$from_iter$4$(iter) {
  const s = moonbitlang$core$sorted_set$$new$4$();
  moonbitlang$core$builtin$$Iter$each$35$(iter, (e) => {
    moonbitlang$core$sorted_set$$SortedSet$add$4$(s, e);
  });
  return s;
}
function moonbitlang$core$set$$Set$new$46$inner$36$(capacity) {
  const capacity$2 = moonbitlang$core$int$$Int$next_power_of_two(capacity);
  const _bind = capacity$2 - 1 | 0;
  const _bind$2 = (Math.imul(capacity$2, 13) | 0) / 16 | 0;
  const _bind$3 = $make_array_len_and_init(capacity$2, undefined);
  const _bind$4 = undefined;
  return { entries: _bind$3, size: 0, capacity: capacity$2, capacity_mask: _bind, grow_at: _bind$2, head: _bind$4, tail: -1 };
}
function moonbitlang$core$set$$Set$add_entry_to_tail$36$(self, idx, entry) {
  const _bind = self.tail;
  if (_bind === -1) {
    self.head = entry;
  } else {
    const _tmp = self.entries;
    $bound_check(_tmp, _bind);
    const _p = _tmp[_bind];
    let _tmp$2;
    if (_p === undefined) {
      _tmp$2 = $panic();
    } else {
      const _p$2 = _p;
      _tmp$2 = _p$2;
    }
    _tmp$2.next = entry;
  }
  self.tail = idx;
  const _tmp = self.entries;
  $bound_check(_tmp, idx);
  _tmp[idx] = entry;
  self.size = self.size + 1 | 0;
}
function moonbitlang$core$set$$Set$set_entry$36$(self, entry, new_idx) {
  const _tmp = self.entries;
  $bound_check(_tmp, new_idx);
  _tmp[new_idx] = entry;
  const _bind = entry.next;
  if (_bind === undefined) {
    self.tail = new_idx;
    return;
  } else {
    const _Some = _bind;
    const _next = _Some;
    _next.prev = new_idx;
    return;
  }
}
function moonbitlang$core$set$$Set$push_away$36$(self, idx, entry) {
  let _tmp = entry.psl + 1 | 0;
  let _tmp$2 = idx + 1 & self.capacity_mask;
  let _tmp$3 = entry;
  while (true) {
    const psl = _tmp;
    const idx$2 = _tmp$2;
    const entry$2 = _tmp$3;
    const _tmp$4 = self.entries;
    $bound_check(_tmp$4, idx$2);
    const _bind = _tmp$4[idx$2];
    if (_bind === undefined) {
      entry$2.psl = psl;
      moonbitlang$core$set$$Set$set_entry$36$(self, entry$2, idx$2);
      break;
    } else {
      const _Some = _bind;
      const _curr_entry = _Some;
      if (psl > _curr_entry.psl) {
        entry$2.psl = psl;
        moonbitlang$core$set$$Set$set_entry$36$(self, entry$2, idx$2);
        _tmp = _curr_entry.psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        _tmp$3 = _curr_entry;
        continue;
      } else {
        _tmp = psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        continue;
      }
    }
  }
}
function moonbitlang$core$set$$Set$add_with_hash$36$(self, key, hash) {
  if (self.size >= self.grow_at) {
    moonbitlang$core$set$$Set$grow$36$(self);
  }
  let _bind;
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const psl = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind$2 = _tmp$3[idx];
    if (_bind$2 === undefined) {
      _bind = { _0: idx, _1: psl };
      break;
    } else {
      const _Some = _bind$2;
      const _curr_entry = _Some;
      if (_curr_entry.hash === hash && moonbitlang$core$builtin$$Eq$equal$37$(_curr_entry.key, key)) {
        return undefined;
      }
      if (psl > _curr_entry.psl) {
        moonbitlang$core$set$$Set$push_away$36$(self, idx, _curr_entry);
        _bind = { _0: idx, _1: psl };
        break;
      }
      _tmp = psl + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
  const _idx = _bind._0;
  const _psl = _bind._1;
  const _bind$2 = self.tail;
  const _bind$3 = undefined;
  const entry = { prev: _bind$2, next: _bind$3, psl: _psl, hash: hash, key: key };
  moonbitlang$core$set$$Set$add_entry_to_tail$36$(self, _idx, entry);
}
function moonbitlang$core$set$$Set$grow$36$(self) {
  const old_head = self.head;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  const _p = self.capacity;
  self.grow_at = (Math.imul(_p, 13) | 0) / 16 | 0;
  self.size = 0;
  self.head = undefined;
  self.tail = -1;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _next = _x.next;
      const _key = _x.key;
      const _hash = _x.hash;
      moonbitlang$core$set$$Set$add_with_hash$36$(self, _key, _hash);
      _tmp = _next;
      continue;
    }
  }
}
function moonbitlang$core$set$$Set$add_and_check$36$(self, key) {
  if (self.size >= self.grow_at) {
    moonbitlang$core$set$$Set$grow$36$(self);
  }
  const hash = moonbitlang$core$builtin$$Hash$hash$38$(key);
  let _bind;
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const psl = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind$2 = _tmp$3[idx];
    if (_bind$2 === undefined) {
      _bind = { _0: idx, _1: psl, _2: true };
      break;
    } else {
      const _Some = _bind$2;
      const _curr_entry = _Some;
      if (_curr_entry.hash === hash && moonbitlang$core$builtin$$Eq$equal$37$(_curr_entry.key, key)) {
        _bind = { _0: idx, _1: psl, _2: false };
        break;
      }
      if (psl > _curr_entry.psl) {
        moonbitlang$core$set$$Set$push_away$36$(self, idx, _curr_entry);
        _bind = { _0: idx, _1: psl, _2: true };
        break;
      }
      _tmp = psl + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
  const _idx = _bind._0;
  const _psl = _bind._1;
  const _added = _bind._2;
  if (_added) {
    const _bind$2 = self.tail;
    const _bind$3 = undefined;
    const entry = { prev: _bind$2, next: _bind$3, psl: _psl, hash: hash, key: key };
    moonbitlang$core$set$$Set$add_entry_to_tail$36$(self, _idx, entry);
  }
  return _added;
}
function moonbitlang$core$immut$sorted_set$$SortedSet$size$4$(self) {
  if (self.$tag === 0) {
    return 0;
  } else {
    const _Node = self;
    return _Node._2;
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$size$10$(self) {
  if (self.$tag === 0) {
    return 0;
  } else {
    const _Node = self;
    return _Node._2;
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$size$39$(self) {
  if (self.$tag === 0) {
    return 0;
  } else {
    const _Node = self;
    return _Node._2;
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$size$40$(self) {
  if (self.$tag === 0) {
    return 0;
  } else {
    const _Node = self;
    return _Node._2;
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$size$18$(self) {
  if (self.$tag === 0) {
    return 0;
  } else {
    const _Node = self;
    return _Node._2;
  }
}
function moonbitlang$core$immut$sorted_set$$create$4$(left, value, right) {
  return new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$5$(left, right, (moonbitlang$core$immut$sorted_set$$SortedSet$size$4$(left) + moonbitlang$core$immut$sorted_set$$SortedSet$size$4$(right) | 0) + 1 | 0, value);
}
function moonbitlang$core$immut$sorted_set$$create$10$(left, value, right) {
  return new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$6$(left, right, (moonbitlang$core$immut$sorted_set$$SortedSet$size$10$(left) + moonbitlang$core$immut$sorted_set$$SortedSet$size$10$(right) | 0) + 1 | 0, value);
}
function moonbitlang$core$immut$sorted_set$$create$39$(left, value, right) {
  return new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$7$(left, right, (moonbitlang$core$immut$sorted_set$$SortedSet$size$39$(left) + moonbitlang$core$immut$sorted_set$$SortedSet$size$39$(right) | 0) + 1 | 0, value);
}
function moonbitlang$core$immut$sorted_set$$create$40$(left, value, right) {
  return new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$8$(left, right, (moonbitlang$core$immut$sorted_set$$SortedSet$size$40$(left) + moonbitlang$core$immut$sorted_set$$SortedSet$size$40$(right) | 0) + 1 | 0, value);
}
function moonbitlang$core$immut$sorted_set$$create$18$(left, value, right) {
  return new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$9$(left, right, (moonbitlang$core$immut$sorted_set$$SortedSet$size$18$(left) + moonbitlang$core$immut$sorted_set$$SortedSet$size$18$(right) | 0) + 1 | 0, value);
}
function moonbitlang$core$immut$sorted_set$$balance$4$(left, value, right) {
  const left_size = moonbitlang$core$immut$sorted_set$$SortedSet$size$4$(left);
  const right_size = moonbitlang$core$immut$sorted_set$$SortedSet$size$4$(right);
  if ((left_size + right_size | 0) < 2) {
    return moonbitlang$core$immut$sorted_set$$create$4$(left, value, right);
  } else {
    if (left_size > (Math.imul(right_size, 5) | 0)) {
      if (left.$tag === 0) {
        return moonbitlang$core$abort$$abort$10$("balance: left is empty.");
      } else {
        const _Node = left;
        const _ll = _Node._0;
        const _lv = _Node._3;
        const _lr = _Node._1;
        if (moonbitlang$core$immut$sorted_set$$SortedSet$size$4$(_ll) >= moonbitlang$core$immut$sorted_set$$SortedSet$size$4$(_lr)) {
          return moonbitlang$core$immut$sorted_set$$create$4$(_ll, _lv, moonbitlang$core$immut$sorted_set$$create$4$(_lr, value, right));
        } else {
          if (_lr.$tag === 0) {
            return moonbitlang$core$abort$$abort$10$("balance: right left.right is empty.");
          } else {
            const _Node$2 = _lr;
            const _lrl = _Node$2._0;
            const _lrv = _Node$2._3;
            const _lrr = _Node$2._1;
            return moonbitlang$core$immut$sorted_set$$create$4$(moonbitlang$core$immut$sorted_set$$create$4$(_ll, _lv, _lrl), _lrv, moonbitlang$core$immut$sorted_set$$create$4$(_lrr, value, right));
          }
        }
      }
    } else {
      if (right_size > (Math.imul(left_size, 5) | 0)) {
        if (right.$tag === 0) {
          return moonbitlang$core$abort$$abort$10$("balance: right is empty");
        } else {
          const _Node = right;
          const _rl = _Node._0;
          const _rv = _Node._3;
          const _rr = _Node._1;
          if (moonbitlang$core$immut$sorted_set$$SortedSet$size$4$(_rr) >= moonbitlang$core$immut$sorted_set$$SortedSet$size$4$(_rl)) {
            return moonbitlang$core$immut$sorted_set$$create$4$(moonbitlang$core$immut$sorted_set$$create$4$(left, value, _rl), _rv, _rr);
          } else {
            if (_rl.$tag === 0) {
              return moonbitlang$core$abort$$abort$10$("balance: right.left is empty");
            } else {
              const _Node$2 = _rl;
              const _rll = _Node$2._0;
              const _rlv = _Node$2._3;
              const _rlr = _Node$2._1;
              return moonbitlang$core$immut$sorted_set$$create$4$(moonbitlang$core$immut$sorted_set$$create$4$(left, value, _rll), _rlv, moonbitlang$core$immut$sorted_set$$create$4$(_rlr, _rv, _rr));
            }
          }
        }
      } else {
        return moonbitlang$core$immut$sorted_set$$create$4$(left, value, right);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$balance$10$(left, value, right) {
  const left_size = moonbitlang$core$immut$sorted_set$$SortedSet$size$10$(left);
  const right_size = moonbitlang$core$immut$sorted_set$$SortedSet$size$10$(right);
  if ((left_size + right_size | 0) < 2) {
    return moonbitlang$core$immut$sorted_set$$create$10$(left, value, right);
  } else {
    if (left_size > (Math.imul(right_size, 5) | 0)) {
      if (left.$tag === 0) {
        return moonbitlang$core$abort$$abort$11$("balance: left is empty.");
      } else {
        const _Node = left;
        const _ll = _Node._0;
        const _lv = _Node._3;
        const _lr = _Node._1;
        if (moonbitlang$core$immut$sorted_set$$SortedSet$size$10$(_ll) >= moonbitlang$core$immut$sorted_set$$SortedSet$size$10$(_lr)) {
          return moonbitlang$core$immut$sorted_set$$create$10$(_ll, _lv, moonbitlang$core$immut$sorted_set$$create$10$(_lr, value, right));
        } else {
          if (_lr.$tag === 0) {
            return moonbitlang$core$abort$$abort$11$("balance: right left.right is empty.");
          } else {
            const _Node$2 = _lr;
            const _lrl = _Node$2._0;
            const _lrv = _Node$2._3;
            const _lrr = _Node$2._1;
            return moonbitlang$core$immut$sorted_set$$create$10$(moonbitlang$core$immut$sorted_set$$create$10$(_ll, _lv, _lrl), _lrv, moonbitlang$core$immut$sorted_set$$create$10$(_lrr, value, right));
          }
        }
      }
    } else {
      if (right_size > (Math.imul(left_size, 5) | 0)) {
        if (right.$tag === 0) {
          return moonbitlang$core$abort$$abort$11$("balance: right is empty");
        } else {
          const _Node = right;
          const _rl = _Node._0;
          const _rv = _Node._3;
          const _rr = _Node._1;
          if (moonbitlang$core$immut$sorted_set$$SortedSet$size$10$(_rr) >= moonbitlang$core$immut$sorted_set$$SortedSet$size$10$(_rl)) {
            return moonbitlang$core$immut$sorted_set$$create$10$(moonbitlang$core$immut$sorted_set$$create$10$(left, value, _rl), _rv, _rr);
          } else {
            if (_rl.$tag === 0) {
              return moonbitlang$core$abort$$abort$11$("balance: right.left is empty");
            } else {
              const _Node$2 = _rl;
              const _rll = _Node$2._0;
              const _rlv = _Node$2._3;
              const _rlr = _Node$2._1;
              return moonbitlang$core$immut$sorted_set$$create$10$(moonbitlang$core$immut$sorted_set$$create$10$(left, value, _rll), _rlv, moonbitlang$core$immut$sorted_set$$create$10$(_rlr, _rv, _rr));
            }
          }
        }
      } else {
        return moonbitlang$core$immut$sorted_set$$create$10$(left, value, right);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$balance$39$(left, value, right) {
  const left_size = moonbitlang$core$immut$sorted_set$$SortedSet$size$39$(left);
  const right_size = moonbitlang$core$immut$sorted_set$$SortedSet$size$39$(right);
  if ((left_size + right_size | 0) < 2) {
    return moonbitlang$core$immut$sorted_set$$create$39$(left, value, right);
  } else {
    if (left_size > (Math.imul(right_size, 5) | 0)) {
      if (left.$tag === 0) {
        return moonbitlang$core$abort$$abort$16$("balance: left is empty.");
      } else {
        const _Node = left;
        const _ll = _Node._0;
        const _lv = _Node._3;
        const _lr = _Node._1;
        if (moonbitlang$core$immut$sorted_set$$SortedSet$size$39$(_ll) >= moonbitlang$core$immut$sorted_set$$SortedSet$size$39$(_lr)) {
          return moonbitlang$core$immut$sorted_set$$create$39$(_ll, _lv, moonbitlang$core$immut$sorted_set$$create$39$(_lr, value, right));
        } else {
          if (_lr.$tag === 0) {
            return moonbitlang$core$abort$$abort$16$("balance: right left.right is empty.");
          } else {
            const _Node$2 = _lr;
            const _lrl = _Node$2._0;
            const _lrv = _Node$2._3;
            const _lrr = _Node$2._1;
            return moonbitlang$core$immut$sorted_set$$create$39$(moonbitlang$core$immut$sorted_set$$create$39$(_ll, _lv, _lrl), _lrv, moonbitlang$core$immut$sorted_set$$create$39$(_lrr, value, right));
          }
        }
      }
    } else {
      if (right_size > (Math.imul(left_size, 5) | 0)) {
        if (right.$tag === 0) {
          return moonbitlang$core$abort$$abort$16$("balance: right is empty");
        } else {
          const _Node = right;
          const _rl = _Node._0;
          const _rv = _Node._3;
          const _rr = _Node._1;
          if (moonbitlang$core$immut$sorted_set$$SortedSet$size$39$(_rr) >= moonbitlang$core$immut$sorted_set$$SortedSet$size$39$(_rl)) {
            return moonbitlang$core$immut$sorted_set$$create$39$(moonbitlang$core$immut$sorted_set$$create$39$(left, value, _rl), _rv, _rr);
          } else {
            if (_rl.$tag === 0) {
              return moonbitlang$core$abort$$abort$16$("balance: right.left is empty");
            } else {
              const _Node$2 = _rl;
              const _rll = _Node$2._0;
              const _rlv = _Node$2._3;
              const _rlr = _Node$2._1;
              return moonbitlang$core$immut$sorted_set$$create$39$(moonbitlang$core$immut$sorted_set$$create$39$(left, value, _rll), _rlv, moonbitlang$core$immut$sorted_set$$create$39$(_rlr, _rv, _rr));
            }
          }
        }
      } else {
        return moonbitlang$core$immut$sorted_set$$create$39$(left, value, right);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$balance$40$(left, value, right) {
  const left_size = moonbitlang$core$immut$sorted_set$$SortedSet$size$40$(left);
  const right_size = moonbitlang$core$immut$sorted_set$$SortedSet$size$40$(right);
  if ((left_size + right_size | 0) < 2) {
    return moonbitlang$core$immut$sorted_set$$create$40$(left, value, right);
  } else {
    if (left_size > (Math.imul(right_size, 5) | 0)) {
      if (left.$tag === 0) {
        return moonbitlang$core$abort$$abort$19$("balance: left is empty.");
      } else {
        const _Node = left;
        const _ll = _Node._0;
        const _lv = _Node._3;
        const _lr = _Node._1;
        if (moonbitlang$core$immut$sorted_set$$SortedSet$size$40$(_ll) >= moonbitlang$core$immut$sorted_set$$SortedSet$size$40$(_lr)) {
          return moonbitlang$core$immut$sorted_set$$create$40$(_ll, _lv, moonbitlang$core$immut$sorted_set$$create$40$(_lr, value, right));
        } else {
          if (_lr.$tag === 0) {
            return moonbitlang$core$abort$$abort$19$("balance: right left.right is empty.");
          } else {
            const _Node$2 = _lr;
            const _lrl = _Node$2._0;
            const _lrv = _Node$2._3;
            const _lrr = _Node$2._1;
            return moonbitlang$core$immut$sorted_set$$create$40$(moonbitlang$core$immut$sorted_set$$create$40$(_ll, _lv, _lrl), _lrv, moonbitlang$core$immut$sorted_set$$create$40$(_lrr, value, right));
          }
        }
      }
    } else {
      if (right_size > (Math.imul(left_size, 5) | 0)) {
        if (right.$tag === 0) {
          return moonbitlang$core$abort$$abort$19$("balance: right is empty");
        } else {
          const _Node = right;
          const _rl = _Node._0;
          const _rv = _Node._3;
          const _rr = _Node._1;
          if (moonbitlang$core$immut$sorted_set$$SortedSet$size$40$(_rr) >= moonbitlang$core$immut$sorted_set$$SortedSet$size$40$(_rl)) {
            return moonbitlang$core$immut$sorted_set$$create$40$(moonbitlang$core$immut$sorted_set$$create$40$(left, value, _rl), _rv, _rr);
          } else {
            if (_rl.$tag === 0) {
              return moonbitlang$core$abort$$abort$19$("balance: right.left is empty");
            } else {
              const _Node$2 = _rl;
              const _rll = _Node$2._0;
              const _rlv = _Node$2._3;
              const _rlr = _Node$2._1;
              return moonbitlang$core$immut$sorted_set$$create$40$(moonbitlang$core$immut$sorted_set$$create$40$(left, value, _rll), _rlv, moonbitlang$core$immut$sorted_set$$create$40$(_rlr, _rv, _rr));
            }
          }
        }
      } else {
        return moonbitlang$core$immut$sorted_set$$create$40$(left, value, right);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$balance$18$(left, value, right) {
  const left_size = moonbitlang$core$immut$sorted_set$$SortedSet$size$18$(left);
  const right_size = moonbitlang$core$immut$sorted_set$$SortedSet$size$18$(right);
  if ((left_size + right_size | 0) < 2) {
    return moonbitlang$core$immut$sorted_set$$create$18$(left, value, right);
  } else {
    if (left_size > (Math.imul(right_size, 5) | 0)) {
      if (left.$tag === 0) {
        return moonbitlang$core$abort$$abort$22$("balance: left is empty.");
      } else {
        const _Node = left;
        const _ll = _Node._0;
        const _lv = _Node._3;
        const _lr = _Node._1;
        if (moonbitlang$core$immut$sorted_set$$SortedSet$size$18$(_ll) >= moonbitlang$core$immut$sorted_set$$SortedSet$size$18$(_lr)) {
          return moonbitlang$core$immut$sorted_set$$create$18$(_ll, _lv, moonbitlang$core$immut$sorted_set$$create$18$(_lr, value, right));
        } else {
          if (_lr.$tag === 0) {
            return moonbitlang$core$abort$$abort$22$("balance: right left.right is empty.");
          } else {
            const _Node$2 = _lr;
            const _lrl = _Node$2._0;
            const _lrv = _Node$2._3;
            const _lrr = _Node$2._1;
            return moonbitlang$core$immut$sorted_set$$create$18$(moonbitlang$core$immut$sorted_set$$create$18$(_ll, _lv, _lrl), _lrv, moonbitlang$core$immut$sorted_set$$create$18$(_lrr, value, right));
          }
        }
      }
    } else {
      if (right_size > (Math.imul(left_size, 5) | 0)) {
        if (right.$tag === 0) {
          return moonbitlang$core$abort$$abort$22$("balance: right is empty");
        } else {
          const _Node = right;
          const _rl = _Node._0;
          const _rv = _Node._3;
          const _rr = _Node._1;
          if (moonbitlang$core$immut$sorted_set$$SortedSet$size$18$(_rr) >= moonbitlang$core$immut$sorted_set$$SortedSet$size$18$(_rl)) {
            return moonbitlang$core$immut$sorted_set$$create$18$(moonbitlang$core$immut$sorted_set$$create$18$(left, value, _rl), _rv, _rr);
          } else {
            if (_rl.$tag === 0) {
              return moonbitlang$core$abort$$abort$22$("balance: right.left is empty");
            } else {
              const _Node$2 = _rl;
              const _rll = _Node$2._0;
              const _rlv = _Node$2._3;
              const _rlr = _Node$2._1;
              return moonbitlang$core$immut$sorted_set$$create$18$(moonbitlang$core$immut$sorted_set$$create$18$(left, value, _rll), _rlv, moonbitlang$core$immut$sorted_set$$create$18$(_rlr, _rv, _rr));
            }
          }
        }
      } else {
        return moonbitlang$core$immut$sorted_set$$create$18$(left, value, right);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$add$4$(self, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$5$($64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$, $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$, 1, value);
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _right = _Node._1;
    const _node_value = _Node._3;
    const compare_result = $compare_int(value, _node_value);
    if (compare_result === 0) {
      return self;
    } else {
      if (compare_result < 0) {
        const ll = moonbitlang$core$immut$sorted_set$$SortedSet$add$4$(_left, value);
        return _left === ll ? self : moonbitlang$core$immut$sorted_set$$balance$4$(ll, _node_value, _right);
      } else {
        const rr = moonbitlang$core$immut$sorted_set$$SortedSet$add$4$(_right, value);
        return _right === rr ? self : moonbitlang$core$immut$sorted_set$$balance$4$(_left, _node_value, rr);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$add$10$(self, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$6$($64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$6$, $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$6$, 1, value);
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _right = _Node._1;
    const _node_value = _Node._3;
    const compare_result = moonbitlang$core$builtin$$Compare$compare$41$(value, _node_value);
    if (compare_result === 0) {
      return self;
    } else {
      if (compare_result < 0) {
        const ll = moonbitlang$core$immut$sorted_set$$SortedSet$add$10$(_left, value);
        return _left === ll ? self : moonbitlang$core$immut$sorted_set$$balance$10$(ll, _node_value, _right);
      } else {
        const rr = moonbitlang$core$immut$sorted_set$$SortedSet$add$10$(_right, value);
        return _right === rr ? self : moonbitlang$core$immut$sorted_set$$balance$10$(_left, _node_value, rr);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$add$39$(self, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$7$($64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$7$, $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$7$, 1, value);
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _right = _Node._1;
    const _node_value = _Node._3;
    const compare_result = moonbitlang$core$builtin$$Compare$compare$39$(value, _node_value);
    if (compare_result === 0) {
      return self;
    } else {
      if (compare_result < 0) {
        const ll = moonbitlang$core$immut$sorted_set$$SortedSet$add$39$(_left, value);
        return _left === ll ? self : moonbitlang$core$immut$sorted_set$$balance$39$(ll, _node_value, _right);
      } else {
        const rr = moonbitlang$core$immut$sorted_set$$SortedSet$add$39$(_right, value);
        return _right === rr ? self : moonbitlang$core$immut$sorted_set$$balance$39$(_left, _node_value, rr);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$add$40$(self, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$8$($64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$8$, $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$8$, 1, value);
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _right = _Node._1;
    const _node_value = _Node._3;
    const compare_result = moonbitlang$core$builtin$$Compare$compare$42$(value, _node_value);
    if (compare_result === 0) {
      return self;
    } else {
      if (compare_result < 0) {
        const ll = moonbitlang$core$immut$sorted_set$$SortedSet$add$40$(_left, value);
        return _left === ll ? self : moonbitlang$core$immut$sorted_set$$balance$40$(ll, _node_value, _right);
      } else {
        const rr = moonbitlang$core$immut$sorted_set$$SortedSet$add$40$(_right, value);
        return _right === rr ? self : moonbitlang$core$immut$sorted_set$$balance$40$(_left, _node_value, rr);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$add$18$(self, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$9$($64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$9$, $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$9$, 1, value);
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _right = _Node._1;
    const _node_value = _Node._3;
    const compare_result = $compare_int(value.id, _node_value.id);
    if (compare_result === 0) {
      return self;
    } else {
      if (compare_result < 0) {
        const ll = moonbitlang$core$immut$sorted_set$$SortedSet$add$18$(_left, value);
        return _left === ll ? self : moonbitlang$core$immut$sorted_set$$balance$18$(ll, _node_value, _right);
      } else {
        const rr = moonbitlang$core$immut$sorted_set$$SortedSet$add$18$(_right, value);
        return _right === rr ? self : moonbitlang$core$immut$sorted_set$$balance$18$(_left, _node_value, rr);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$remove_min$10$(self) {
  if (self.$tag === 0) {
    return moonbitlang$core$abort$$abort$11$("remove_min: empty ImmutableSet");
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _right = _Node._1;
    const _value = _Node._3;
    if (_left.$tag === 0) {
      return _right;
    } else {
      return moonbitlang$core$immut$sorted_set$$balance$10$(moonbitlang$core$immut$sorted_set$$SortedSet$remove_min$10$(_left), _value, _right);
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$remove_min$4$(self) {
  if (self.$tag === 0) {
    return moonbitlang$core$abort$$abort$10$("remove_min: empty ImmutableSet");
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _right = _Node._1;
    const _value = _Node._3;
    if (_left.$tag === 0) {
      return _right;
    } else {
      return moonbitlang$core$immut$sorted_set$$balance$4$(moonbitlang$core$immut$sorted_set$$SortedSet$remove_min$4$(_left), _value, _right);
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$min$10$(self) {
  let _tmp = self;
  while (true) {
    const self$2 = _tmp;
    if (self$2.$tag === 0) {
      return moonbitlang$core$abort$$abort$10$("min: there are no values in sorted_set.");
    } else {
      const _Node = self$2;
      const _left = _Node._0;
      const _value = _Node._3;
      if (_left.$tag === 0) {
        return _value;
      } else {
        _tmp = _left;
        continue;
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$min$4$(self) {
  let _tmp = self;
  while (true) {
    const self$2 = _tmp;
    if (self$2.$tag === 0) {
      return moonbitlang$core$abort$$abort$4$("min: there are no values in sorted_set.");
    } else {
      const _Node = self$2;
      const _left = _Node._0;
      const _value = _Node._3;
      if (_left.$tag === 0) {
        return _value;
      } else {
        _tmp = _left;
        continue;
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$min$18$(self) {
  let _tmp = self;
  while (true) {
    const self$2 = _tmp;
    if (self$2.$tag === 0) {
      return moonbitlang$core$abort$$abort$18$("min: there are no values in sorted_set.");
    } else {
      const _Node = self$2;
      const _left = _Node._0;
      const _value = _Node._3;
      if (_left.$tag === 0) {
        return _value;
      } else {
        _tmp = _left;
        continue;
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$merge$10$(self, other) {
  if (self.$tag === 0) {
    return other;
  } else {
    if (other.$tag === 0) {
      return self;
    } else {
      return moonbitlang$core$immut$sorted_set$$balance$10$(self, moonbitlang$core$immut$sorted_set$$SortedSet$min$10$(other), moonbitlang$core$immut$sorted_set$$SortedSet$remove_min$10$(other));
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$remove$10$(self, value) {
  if (self.$tag === 0) {
    return $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$6$;
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _right = _Node._1;
    const _node_value = _Node._3;
    const compare_result = moonbitlang$core$builtin$$Compare$compare$41$(value, _node_value);
    if (compare_result === 0) {
      return moonbitlang$core$immut$sorted_set$$SortedSet$merge$10$(_left, _right);
    } else {
      if (compare_result < 0) {
        const new_left = moonbitlang$core$immut$sorted_set$$SortedSet$remove$10$(_left, value);
        return _left === new_left ? self : moonbitlang$core$immut$sorted_set$$balance$10$(new_left, _node_value, _right);
      } else {
        const new_right = moonbitlang$core$immut$sorted_set$$SortedSet$remove$10$(_right, value);
        return _right === new_right ? self : moonbitlang$core$immut$sorted_set$$balance$10$(_left, _node_value, new_right);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$max$18$(self) {
  let _tmp = self;
  while (true) {
    const self$2 = _tmp;
    if (self$2.$tag === 0) {
      return moonbitlang$core$abort$$abort$18$("max: there are no values in ImmutableSet.");
    } else {
      const _Node = self$2;
      const _right = _Node._1;
      const _value = _Node._3;
      if (_right.$tag === 0) {
        return _value;
      } else {
        _tmp = _right;
        continue;
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$add_max_value$4$(self, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$5$($64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$, $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$, 1, value);
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _node_value = _Node._3;
    const _right = _Node._1;
    return moonbitlang$core$immut$sorted_set$$balance$4$(_left, _node_value, moonbitlang$core$immut$sorted_set$$SortedSet$add_max_value$4$(_right, value));
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$add_max_value$40$(self, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$8$($64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$8$, $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$8$, 1, value);
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _node_value = _Node._3;
    const _right = _Node._1;
    return moonbitlang$core$immut$sorted_set$$balance$40$(_left, _node_value, moonbitlang$core$immut$sorted_set$$SortedSet$add_max_value$40$(_right, value));
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$add_max_value$18$(self, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$9$($64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$9$, $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$9$, 1, value);
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _node_value = _Node._3;
    const _right = _Node._1;
    return moonbitlang$core$immut$sorted_set$$balance$18$(_left, _node_value, moonbitlang$core$immut$sorted_set$$SortedSet$add_max_value$18$(_right, value));
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$add_min_value$4$(self, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$5$($64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$, $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$, 1, value);
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _node_value = _Node._3;
    const _right = _Node._1;
    return moonbitlang$core$immut$sorted_set$$balance$4$(moonbitlang$core$immut$sorted_set$$SortedSet$add_min_value$4$(_left, value), _node_value, _right);
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$add_min_value$40$(self, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$8$($64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$8$, $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$8$, 1, value);
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _node_value = _Node._3;
    const _right = _Node._1;
    return moonbitlang$core$immut$sorted_set$$balance$40$(moonbitlang$core$immut$sorted_set$$SortedSet$add_min_value$40$(_left, value), _node_value, _right);
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$add_min_value$18$(self, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$9$($64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$9$, $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$9$, 1, value);
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _node_value = _Node._3;
    const _right = _Node._1;
    return moonbitlang$core$immut$sorted_set$$balance$18$(moonbitlang$core$immut$sorted_set$$SortedSet$add_min_value$18$(_left, value), _node_value, _right);
  }
}
function moonbitlang$core$immut$sorted_set$$join$4$(left, value, right) {
  if (left.$tag === 0) {
    return moonbitlang$core$immut$sorted_set$$SortedSet$add_min_value$4$(right, value);
  } else {
    if (right.$tag === 0) {
      return moonbitlang$core$immut$sorted_set$$SortedSet$add_max_value$4$(left, value);
    } else {
      const _Node = left;
      const _ll = _Node._0;
      const _lv = _Node._3;
      const _lr = _Node._1;
      const _ls = _Node._2;
      const _Node$2 = right;
      const _rl = _Node$2._0;
      const _rv = _Node$2._3;
      const _rr = _Node$2._1;
      const _rs = _Node$2._2;
      return _ls > (Math.imul(_rs, 5) | 0) ? moonbitlang$core$immut$sorted_set$$balance$4$(_ll, _lv, moonbitlang$core$immut$sorted_set$$join$4$(_lr, value, right)) : _rs > (Math.imul(_ls, 5) | 0) ? moonbitlang$core$immut$sorted_set$$balance$4$(moonbitlang$core$immut$sorted_set$$join$4$(left, value, _rl), _rv, _rr) : moonbitlang$core$immut$sorted_set$$create$4$(left, value, right);
    }
  }
}
function moonbitlang$core$immut$sorted_set$$join$40$(left, value, right) {
  if (left.$tag === 0) {
    return moonbitlang$core$immut$sorted_set$$SortedSet$add_min_value$40$(right, value);
  } else {
    if (right.$tag === 0) {
      return moonbitlang$core$immut$sorted_set$$SortedSet$add_max_value$40$(left, value);
    } else {
      const _Node = left;
      const _ll = _Node._0;
      const _lv = _Node._3;
      const _lr = _Node._1;
      const _ls = _Node._2;
      const _Node$2 = right;
      const _rl = _Node$2._0;
      const _rv = _Node$2._3;
      const _rr = _Node$2._1;
      const _rs = _Node$2._2;
      return _ls > (Math.imul(_rs, 5) | 0) ? moonbitlang$core$immut$sorted_set$$balance$40$(_ll, _lv, moonbitlang$core$immut$sorted_set$$join$40$(_lr, value, right)) : _rs > (Math.imul(_ls, 5) | 0) ? moonbitlang$core$immut$sorted_set$$balance$40$(moonbitlang$core$immut$sorted_set$$join$40$(left, value, _rl), _rv, _rr) : moonbitlang$core$immut$sorted_set$$create$40$(left, value, right);
    }
  }
}
function moonbitlang$core$immut$sorted_set$$join$18$(left, value, right) {
  if (left.$tag === 0) {
    return moonbitlang$core$immut$sorted_set$$SortedSet$add_min_value$18$(right, value);
  } else {
    if (right.$tag === 0) {
      return moonbitlang$core$immut$sorted_set$$SortedSet$add_max_value$18$(left, value);
    } else {
      const _Node = left;
      const _ll = _Node._0;
      const _lv = _Node._3;
      const _lr = _Node._1;
      const _ls = _Node._2;
      const _Node$2 = right;
      const _rl = _Node$2._0;
      const _rv = _Node$2._3;
      const _rr = _Node$2._1;
      const _rs = _Node$2._2;
      return _ls > (Math.imul(_rs, 5) | 0) ? moonbitlang$core$immut$sorted_set$$balance$18$(_ll, _lv, moonbitlang$core$immut$sorted_set$$join$18$(_lr, value, right)) : _rs > (Math.imul(_ls, 5) | 0) ? moonbitlang$core$immut$sorted_set$$balance$18$(moonbitlang$core$immut$sorted_set$$join$18$(left, value, _rl), _rv, _rr) : moonbitlang$core$immut$sorted_set$$create$18$(left, value, right);
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$split$4$(self, divide) {
  if (self.$tag === 0) {
    return { _0: $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$, _1: false, _2: $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$ };
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _right = _Node._1;
    const _value = _Node._3;
    const compare_result = $compare_int(divide, _value);
    if (compare_result === 0) {
      return { _0: _left, _1: true, _2: _right };
    } else {
      if (compare_result < 0) {
        const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$split$4$(_left, divide);
        const _left_left = _bind._0;
        const _present = _bind._1;
        const _right_left = _bind._2;
        return { _0: _left_left, _1: _present, _2: moonbitlang$core$immut$sorted_set$$join$4$(_right_left, _value, _right) };
      } else {
        const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$split$4$(_right, divide);
        const _left_right = _bind._0;
        const _present = _bind._1;
        const _right_right = _bind._2;
        return { _0: moonbitlang$core$immut$sorted_set$$join$4$(_left, _value, _left_right), _1: _present, _2: _right_right };
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$split$40$(self, divide) {
  if (self.$tag === 0) {
    return { _0: $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$8$, _1: false, _2: $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$8$ };
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _right = _Node._1;
    const _value = _Node._3;
    const compare_result = moonbitlang$core$builtin$$Compare$compare$42$(divide, _value);
    if (compare_result === 0) {
      return { _0: _left, _1: true, _2: _right };
    } else {
      if (compare_result < 0) {
        const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$split$40$(_left, divide);
        const _left_left = _bind._0;
        const _present = _bind._1;
        const _right_left = _bind._2;
        return { _0: _left_left, _1: _present, _2: moonbitlang$core$immut$sorted_set$$join$40$(_right_left, _value, _right) };
      } else {
        const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$split$40$(_right, divide);
        const _left_right = _bind._0;
        const _present = _bind._1;
        const _right_right = _bind._2;
        return { _0: moonbitlang$core$immut$sorted_set$$join$40$(_left, _value, _left_right), _1: _present, _2: _right_right };
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$split$18$(self, divide) {
  if (self.$tag === 0) {
    return { _0: $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$9$, _1: false, _2: $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$9$ };
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _right = _Node._1;
    const _value = _Node._3;
    const compare_result = $compare_int(divide.id, _value.id);
    if (compare_result === 0) {
      return { _0: _left, _1: true, _2: _right };
    } else {
      if (compare_result < 0) {
        const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$split$18$(_left, divide);
        const _left_left = _bind._0;
        const _present = _bind._1;
        const _right_left = _bind._2;
        return { _0: _left_left, _1: _present, _2: moonbitlang$core$immut$sorted_set$$join$18$(_right_left, _value, _right) };
      } else {
        const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$split$18$(_right, divide);
        const _left_right = _bind._0;
        const _present = _bind._1;
        const _right_right = _bind._2;
        return { _0: moonbitlang$core$immut$sorted_set$$join$18$(_left, _value, _left_right), _1: _present, _2: _right_right };
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$is_empty$10$(self) {
  if (self.$tag === 0) {
    return true;
  } else {
    return false;
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$is_empty$4$(self) {
  if (self.$tag === 0) {
    return true;
  } else {
    return false;
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$contains$10$(self, value) {
  let _tmp = self;
  while (true) {
    const self$2 = _tmp;
    if (self$2.$tag === 0) {
      return false;
    } else {
      const _Node = self$2;
      const _left = _Node._0;
      const _right = _Node._1;
      const _node_value = _Node._3;
      const compare_result = moonbitlang$core$builtin$$Compare$compare$41$(value, _node_value);
      if (compare_result === 0) {
        return true;
      } else {
        _tmp = compare_result < 0 ? _left : _right;
        continue;
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$contains$4$(self, value) {
  let _tmp = self;
  while (true) {
    const self$2 = _tmp;
    if (self$2.$tag === 0) {
      return false;
    } else {
      const _Node = self$2;
      const _left = _Node._0;
      const _right = _Node._1;
      const _node_value = _Node._3;
      const compare_result = $compare_int(value, _node_value);
      if (compare_result === 0) {
        return true;
      } else {
        _tmp = compare_result < 0 ? _left : _right;
        continue;
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$union$4$(self, other) {
  if (self.$tag === 0) {
    return other;
  } else {
    if (other.$tag === 0) {
      return self;
    } else {
      const _Node = self;
      const _l1 = _Node._0;
      const _v1 = _Node._3;
      const _r1 = _Node._1;
      const _s1 = _Node._2;
      const _Node$2 = other;
      const _l2 = _Node$2._0;
      const _v2 = _Node$2._3;
      const _r2 = _Node$2._1;
      const _s2 = _Node$2._2;
      if (_s1 >= _s2) {
        if (_s2 === 1) {
          return moonbitlang$core$immut$sorted_set$$SortedSet$add$4$(self, _v2);
        } else {
          const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$split$4$(other, _v1);
          const _l2$2 = _bind._0;
          const _r2$2 = _bind._2;
          return moonbitlang$core$immut$sorted_set$$join$4$(moonbitlang$core$immut$sorted_set$$SortedSet$union$4$(_l1, _l2$2), _v1, moonbitlang$core$immut$sorted_set$$SortedSet$union$4$(_r1, _r2$2));
        }
      } else {
        if (_s1 === 1) {
          return moonbitlang$core$immut$sorted_set$$SortedSet$add$4$(other, _v1);
        } else {
          const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$split$4$(self, _v2);
          const _l1$2 = _bind._0;
          const _r1$2 = _bind._2;
          return moonbitlang$core$immut$sorted_set$$join$4$(moonbitlang$core$immut$sorted_set$$SortedSet$union$4$(_l1$2, _l2), _v2, moonbitlang$core$immut$sorted_set$$SortedSet$union$4$(_r1$2, _r2));
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$union$40$(self, other) {
  if (self.$tag === 0) {
    return other;
  } else {
    if (other.$tag === 0) {
      return self;
    } else {
      const _Node = self;
      const _l1 = _Node._0;
      const _v1 = _Node._3;
      const _r1 = _Node._1;
      const _s1 = _Node._2;
      const _Node$2 = other;
      const _l2 = _Node$2._0;
      const _v2 = _Node$2._3;
      const _r2 = _Node$2._1;
      const _s2 = _Node$2._2;
      if (_s1 >= _s2) {
        if (_s2 === 1) {
          return moonbitlang$core$immut$sorted_set$$SortedSet$add$40$(self, _v2);
        } else {
          const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$split$40$(other, _v1);
          const _l2$2 = _bind._0;
          const _r2$2 = _bind._2;
          return moonbitlang$core$immut$sorted_set$$join$40$(moonbitlang$core$immut$sorted_set$$SortedSet$union$40$(_l1, _l2$2), _v1, moonbitlang$core$immut$sorted_set$$SortedSet$union$40$(_r1, _r2$2));
        }
      } else {
        if (_s1 === 1) {
          return moonbitlang$core$immut$sorted_set$$SortedSet$add$40$(other, _v1);
        } else {
          const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$split$40$(self, _v2);
          const _l1$2 = _bind._0;
          const _r1$2 = _bind._2;
          return moonbitlang$core$immut$sorted_set$$join$40$(moonbitlang$core$immut$sorted_set$$SortedSet$union$40$(_l1$2, _l2), _v2, moonbitlang$core$immut$sorted_set$$SortedSet$union$40$(_r1$2, _r2));
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$union$18$(self, other) {
  if (self.$tag === 0) {
    return other;
  } else {
    if (other.$tag === 0) {
      return self;
    } else {
      const _Node = self;
      const _l1 = _Node._0;
      const _v1 = _Node._3;
      const _r1 = _Node._1;
      const _s1 = _Node._2;
      const _Node$2 = other;
      const _l2 = _Node$2._0;
      const _v2 = _Node$2._3;
      const _r2 = _Node$2._1;
      const _s2 = _Node$2._2;
      if (_s1 >= _s2) {
        if (_s2 === 1) {
          return moonbitlang$core$immut$sorted_set$$SortedSet$add$18$(self, _v2);
        } else {
          const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$split$18$(other, _v1);
          const _l2$2 = _bind._0;
          const _r2$2 = _bind._2;
          return moonbitlang$core$immut$sorted_set$$join$18$(moonbitlang$core$immut$sorted_set$$SortedSet$union$18$(_l1, _l2$2), _v1, moonbitlang$core$immut$sorted_set$$SortedSet$union$18$(_r1, _r2$2));
        }
      } else {
        if (_s1 === 1) {
          return moonbitlang$core$immut$sorted_set$$SortedSet$add$18$(other, _v1);
        } else {
          const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$split$18$(self, _v2);
          const _l1$2 = _bind._0;
          const _r1$2 = _bind._2;
          return moonbitlang$core$immut$sorted_set$$join$18$(moonbitlang$core$immut$sorted_set$$SortedSet$union$18$(_l1$2, _l2), _v2, moonbitlang$core$immut$sorted_set$$SortedSet$union$18$(_r1$2, _r2));
        }
      }
    }
  }
}
function moonbitlang$core$builtin$$Add$add$41$(self, other) {
  return moonbitlang$core$immut$sorted_set$$SortedSet$union$4$(self, other);
}
function moonbitlang$core$builtin$$Add$add$43$(self, other) {
  return moonbitlang$core$immut$sorted_set$$SortedSet$union$40$(self, other);
}
function moonbitlang$core$immut$sorted_set$$SortedSet$concat$4$(self, other) {
  if (self.$tag === 0) {
    return other;
  } else {
    if (other.$tag === 0) {
      return self;
    } else {
      return moonbitlang$core$immut$sorted_set$$join$4$(self, moonbitlang$core$immut$sorted_set$$SortedSet$min$4$(other), moonbitlang$core$immut$sorted_set$$SortedSet$remove_min$4$(other));
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$intersection$4$(self, other) {
  _L: {
    if (self.$tag === 0) {
      break _L;
    } else {
      if (other.$tag === 0) {
        break _L;
      } else {
        const _Node = self;
        const _l1 = _Node._0;
        const _v1 = _Node._3;
        const _r1 = _Node._1;
        const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$split$4$(other, _v1);
        const _l2 = _bind._0;
        const _x = _bind._1;
        if (_x === false) {
          const _r2 = _bind._2;
          return moonbitlang$core$immut$sorted_set$$SortedSet$concat$4$(moonbitlang$core$immut$sorted_set$$SortedSet$intersection$4$(_l1, _l2), moonbitlang$core$immut$sorted_set$$SortedSet$intersection$4$(_r1, _r2));
        } else {
          const _r2 = _bind._2;
          return moonbitlang$core$immut$sorted_set$$join$4$(moonbitlang$core$immut$sorted_set$$SortedSet$intersection$4$(_l1, _l2), _v1, moonbitlang$core$immut$sorted_set$$SortedSet$intersection$4$(_r1, _r2));
        }
      }
    }
  }
  return $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$;
}
function moonbitlang$core$immut$sorted_set$$SortedSet$difference$4$(self, other) {
  if (self.$tag === 0) {
    return $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$;
  } else {
    if (other.$tag === 0) {
      return self;
    } else {
      const _Node = self;
      const _l1 = _Node._0;
      const _v1 = _Node._3;
      const _r1 = _Node._1;
      const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$split$4$(other, _v1);
      const _l2 = _bind._0;
      const _x = _bind._1;
      if (_x === false) {
        const _r2 = _bind._2;
        return moonbitlang$core$immut$sorted_set$$join$4$(moonbitlang$core$immut$sorted_set$$SortedSet$difference$4$(_l1, _l2), _v1, moonbitlang$core$immut$sorted_set$$SortedSet$difference$4$(_r1, _r2));
      } else {
        const _r2 = _bind._2;
        return moonbitlang$core$immut$sorted_set$$SortedSet$concat$4$(moonbitlang$core$immut$sorted_set$$SortedSet$difference$4$(_l1, _l2), moonbitlang$core$immut$sorted_set$$SortedSet$difference$4$(_r1, _r2));
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$subset$4$(self, other) {
  let _tmp = self;
  let _tmp$2 = other;
  while (true) {
    const self$2 = _tmp;
    const other$2 = _tmp$2;
    if (self$2.$tag === 0) {
      return true;
    } else {
      if (other$2.$tag === 0) {
        return false;
      } else {
        const _Node = self$2;
        const _l1 = _Node._0;
        const _v1 = _Node._3;
        const _r1 = _Node._1;
        const _Node$2 = other$2;
        const _l2 = _Node$2._0;
        const _v2 = _Node$2._3;
        const _r2 = _Node$2._1;
        const compare_result = $compare_int(_v1, _v2);
        if (compare_result === 0) {
          if (moonbitlang$core$immut$sorted_set$$SortedSet$subset$4$(_l1, _l2)) {
            _tmp = _r1;
            _tmp$2 = _r2;
            continue;
          } else {
            return false;
          }
        } else {
          if (compare_result < 0) {
            if (moonbitlang$core$immut$sorted_set$$SortedSet$subset$4$(new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$5$(_l1, $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$, 1, _v1), _l2)) {
              _tmp = _r1;
              _tmp$2 = self$2;
              continue;
            } else {
              return false;
            }
          } else {
            if (moonbitlang$core$immut$sorted_set$$SortedSet$subset$4$(new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$5$($64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$, _r1, 1, _v1), _r2)) {
              _tmp = _l1;
              _tmp$2 = self$2;
              continue;
            } else {
              return false;
            }
          }
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$try_join$18$(left, value, right) {
  let _tmp;
  let _tmp$2;
  if (moonbitlang$core$builtin$$Eq$equal$44$(left, $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$9$)) {
    _tmp$2 = true;
  } else {
    const _p = moonbitlang$core$immut$sorted_set$$SortedSet$max$18$(left);
    _tmp$2 = $compare_int(_p.id, value.id) < 0;
  }
  if (_tmp$2) {
    let _tmp$3;
    if (moonbitlang$core$builtin$$Eq$equal$44$(right, $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$9$)) {
      _tmp$3 = true;
    } else {
      const _p = moonbitlang$core$immut$sorted_set$$SortedSet$min$18$(right);
      _tmp$3 = $compare_int(value.id, _p.id) < 0;
    }
    _tmp = _tmp$3;
  } else {
    _tmp = false;
  }
  if (_tmp) {
    return moonbitlang$core$immut$sorted_set$$join$18$(left, value, right);
  } else {
    return moonbitlang$core$immut$sorted_set$$SortedSet$union$18$(left, moonbitlang$core$immut$sorted_set$$SortedSet$add$18$(right, value));
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$map$45$(self, f) {
  if (self.$tag === 0) {
    return $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$9$;
  } else {
    const _Node = self;
    const _left = _Node._0;
    const _value = _Node._3;
    const _right = _Node._1;
    return moonbitlang$core$immut$sorted_set$$try_join$18$(moonbitlang$core$immut$sorted_set$$SortedSet$map$45$(_left, f), f(_value), moonbitlang$core$immut$sorted_set$$SortedSet$map$45$(_right, f));
  }
}
function moonbitlang$core$immut$sorted_set$$iter$46$go$47$1039(yield_, t) {
  let _tmp = t;
  while (true) {
    const t$2 = _tmp;
    if (t$2.$tag === 0) {
      return 1;
    } else {
      const _Node = t$2;
      const _left = _Node._0;
      const _right = _Node._1;
      const _value = _Node._3;
      const _bind = moonbitlang$core$immut$sorted_set$$iter$46$go$47$1039(yield_, _left);
      if (_bind === 0) {
        return 0;
      } else {
        const _bind$2 = yield_(_value);
        if (_bind$2 === 0) {
          return 0;
        } else {
          _tmp = _right;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$iter$4$(self) {
  const _p = (yield_) => moonbitlang$core$immut$sorted_set$$iter$46$go$47$1039(yield_, self);
  return _p;
}
function moonbitlang$core$immut$sorted_set$$iter$46$go$47$1052(yield_, t) {
  let _tmp = t;
  while (true) {
    const t$2 = _tmp;
    if (t$2.$tag === 0) {
      return 1;
    } else {
      const _Node = t$2;
      const _left = _Node._0;
      const _right = _Node._1;
      const _value = _Node._3;
      const _bind = moonbitlang$core$immut$sorted_set$$iter$46$go$47$1052(yield_, _left);
      if (_bind === 0) {
        return 0;
      } else {
        const _bind$2 = yield_(_value);
        if (_bind$2 === 0) {
          return 0;
        } else {
          _tmp = _right;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$iter$18$(self) {
  const _p = (yield_) => moonbitlang$core$immut$sorted_set$$iter$46$go$47$1052(yield_, self);
  return _p;
}
function moonbitlang$core$immut$sorted_set$$iter$46$go$47$1065(yield_, t) {
  let _tmp = t;
  while (true) {
    const t$2 = _tmp;
    if (t$2.$tag === 0) {
      return 1;
    } else {
      const _Node = t$2;
      const _left = _Node._0;
      const _right = _Node._1;
      const _value = _Node._3;
      const _bind = moonbitlang$core$immut$sorted_set$$iter$46$go$47$1065(yield_, _left);
      if (_bind === 0) {
        return 0;
      } else {
        const _bind$2 = yield_(_value);
        if (_bind$2 === 0) {
          return 0;
        } else {
          _tmp = _right;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$iter$10$(self) {
  const _p = (yield_) => moonbitlang$core$immut$sorted_set$$iter$46$go$47$1065(yield_, self);
  return _p;
}
function moonbitlang$core$immut$sorted_set$$iter$46$go$47$1078(yield_, t) {
  let _tmp = t;
  while (true) {
    const t$2 = _tmp;
    if (t$2.$tag === 0) {
      return 1;
    } else {
      const _Node = t$2;
      const _left = _Node._0;
      const _right = _Node._1;
      const _value = _Node._3;
      const _bind = moonbitlang$core$immut$sorted_set$$iter$46$go$47$1078(yield_, _left);
      if (_bind === 0) {
        return 0;
      } else {
        const _bind$2 = yield_(_value);
        if (_bind$2 === 0) {
          return 0;
        } else {
          _tmp = _right;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$iter$40$(self) {
  const _p = (yield_) => moonbitlang$core$immut$sorted_set$$iter$46$go$47$1078(yield_, self);
  return _p;
}
function moonbitlang$core$immut$sorted_set$$iter$46$go$47$1091(yield_, t) {
  let _tmp = t;
  while (true) {
    const t$2 = _tmp;
    if (t$2.$tag === 0) {
      return 1;
    } else {
      const _Node = t$2;
      const _left = _Node._0;
      const _right = _Node._1;
      const _value = _Node._3;
      const _bind = moonbitlang$core$immut$sorted_set$$iter$46$go$47$1091(yield_, _left);
      if (_bind === 0) {
        return 0;
      } else {
        const _bind$2 = yield_(_value);
        if (_bind$2 === 0) {
          return 0;
        } else {
          _tmp = _right;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_set$$SortedSet$iter$39$(self) {
  const _p = (yield_) => moonbitlang$core$immut$sorted_set$$iter$46$go$47$1091(yield_, self);
  return _p;
}
function moonbitlang$core$builtin$$Hash$hash_combine$41$(self, hasher) {
  const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$iter$4$(self);
  _bind((t) => {
    moonbitlang$core$builtin$$Hash$hash_combine$4$(t, hasher);
    return 1;
  });
}
function moonbitlang$core$immut$sorted_set$$from_iter$4$(iter) {
  const _bind = $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$;
  const _acc = { val: _bind };
  iter((_p) => {
    const s = _acc.val;
    _acc.val = moonbitlang$core$immut$sorted_set$$SortedSet$add$4$(s, _p);
    return 1;
  });
  return _acc.val;
}
function moonbitlang$core$immut$sorted_set$$InorderIterator$move_left$4$(self, node) {
  let _tmp = node;
  while (true) {
    const _param = _tmp;
    if (_param.$tag === 0) {
      return;
    } else {
      const _Node = _param;
      const _left = _Node._0;
      const _self = self;
      moonbitlang$core$array$$Array$push$10$(_self, _Node);
      _tmp = _left;
      continue;
    }
  }
}
function moonbitlang$core$immut$sorted_set$$InorderIterator$move_left$18$(self, node) {
  let _tmp = node;
  while (true) {
    const _param = _tmp;
    if (_param.$tag === 0) {
      return;
    } else {
      const _Node = _param;
      const _left = _Node._0;
      const _self = self;
      moonbitlang$core$array$$Array$push$22$(_self, _Node);
      _tmp = _left;
      continue;
    }
  }
}
function moonbitlang$core$immut$sorted_set$$InorderIterator$new$4$(root) {
  const it = [];
  moonbitlang$core$immut$sorted_set$$InorderIterator$move_left$4$(it, root);
  return it;
}
function moonbitlang$core$immut$sorted_set$$InorderIterator$new$18$(root) {
  const it = [];
  moonbitlang$core$immut$sorted_set$$InorderIterator$move_left$18$(it, root);
  return it;
}
function moonbitlang$core$immut$sorted_set$$InorderIterator$next$4$(self) {
  const _s = self;
  const _bind = moonbitlang$core$array$$Array$pop$10$(_s);
  if (_bind === undefined) {
    return undefined;
  } else {
    const _Some = _bind;
    const _curr = _Some;
    if (_curr.$tag === 1) {
      const _Node = _curr;
      const _right = _Node._1;
      const _value = _Node._3;
      moonbitlang$core$immut$sorted_set$$InorderIterator$move_left$4$(self, _right);
      return _value;
    } else {
      return $panic();
    }
  }
}
function moonbitlang$core$immut$sorted_set$$InorderIterator$next$18$(self) {
  const _s = self;
  const _bind = moonbitlang$core$array$$Array$pop$22$(_s);
  if (_bind === undefined) {
    return undefined;
  } else {
    const _Some = _bind;
    const _curr = _Some;
    if (_curr.$tag === 1) {
      const _Node = _curr;
      const _right = _Node._1;
      const _value = _Node._3;
      moonbitlang$core$immut$sorted_set$$InorderIterator$move_left$18$(self, _right);
      return _value;
    } else {
      return $panic();
    }
  }
}
function moonbitlang$core$builtin$$Eq$equal$41$(self, other) {
  const iter = moonbitlang$core$immut$sorted_set$$InorderIterator$new$4$(self);
  const iter1 = moonbitlang$core$immut$sorted_set$$InorderIterator$new$4$(other);
  let _tmp = moonbitlang$core$immut$sorted_set$$InorderIterator$next$4$(iter);
  let _tmp$2 = moonbitlang$core$immut$sorted_set$$InorderIterator$next$4$(iter1);
  while (true) {
    const _param_0 = _tmp;
    const _param_1 = _tmp$2;
    if (_param_0 === undefined) {
      return _param_1 === undefined;
    } else {
      const _Some = _param_0;
      const _a = _Some;
      if (_param_1 === undefined) {
        return false;
      } else {
        const _Some$2 = _param_1;
        const _b = _Some$2;
        if (_a === _b) {
          _tmp = moonbitlang$core$immut$sorted_set$$InorderIterator$next$4$(iter);
          _tmp$2 = moonbitlang$core$immut$sorted_set$$InorderIterator$next$4$(iter1);
          continue;
        } else {
          return false;
        }
      }
    }
  }
}
function moonbitlang$core$builtin$$Eq$equal$44$(self, other) {
  const iter = moonbitlang$core$immut$sorted_set$$InorderIterator$new$18$(self);
  const iter1 = moonbitlang$core$immut$sorted_set$$InorderIterator$new$18$(other);
  let _tmp = moonbitlang$core$immut$sorted_set$$InorderIterator$next$18$(iter);
  let _tmp$2 = moonbitlang$core$immut$sorted_set$$InorderIterator$next$18$(iter1);
  while (true) {
    const _param_0 = _tmp;
    const _param_1 = _tmp$2;
    if (_param_0 === undefined) {
      return _param_1 === undefined;
    } else {
      const _Some = _param_0;
      const _a = _Some;
      if (_param_1 === undefined) {
        return false;
      } else {
        const _Some$2 = _param_1;
        const _b = _Some$2;
        if (_a.id === _b.id) {
          _tmp = moonbitlang$core$immut$sorted_set$$InorderIterator$next$18$(iter);
          _tmp$2 = moonbitlang$core$immut$sorted_set$$InorderIterator$next$18$(iter1);
          continue;
        } else {
          return false;
        }
      }
    }
  }
}
function moonbitlang$core$builtin$$Compare$compare$41$(self, other) {
  const iter = moonbitlang$core$immut$sorted_set$$InorderIterator$new$4$(self);
  const iter1 = moonbitlang$core$immut$sorted_set$$InorderIterator$new$4$(other);
  let _tmp = moonbitlang$core$immut$sorted_set$$InorderIterator$next$4$(iter);
  let _tmp$2 = moonbitlang$core$immut$sorted_set$$InorderIterator$next$4$(iter1);
  while (true) {
    const _param_0 = _tmp;
    const _param_1 = _tmp$2;
    if (_param_0 === undefined) {
      return _param_1 === undefined ? 0 : -1;
    } else {
      const _Some = _param_0;
      const _a = _Some;
      if (_param_1 === undefined) {
        return 1;
      } else {
        const _Some$2 = _param_1;
        const _b = _Some$2;
        const cmp = $compare_int(_a, _b);
        if (cmp === 0) {
          _tmp = moonbitlang$core$immut$sorted_set$$InorderIterator$next$4$(iter);
          _tmp$2 = moonbitlang$core$immut$sorted_set$$InorderIterator$next$4$(iter1);
          continue;
        } else {
          return cmp;
        }
      }
    }
  }
}
function moonbitlang$core$strconv$$base_err$46$() {
  return new Result$Err$10$(new Error$moonbitlang$47$core$47$strconv$46$StrConvError$46$StrConvError(moonbitlang$core$strconv$$base_err_str));
}
function moonbitlang$core$strconv$$check_and_consume_base(view, base) {
  if (base === 0) {
    _L: {
      let rest;
      _L$2: {
        let rest$2;
        _L$3: {
          let rest$3;
          _L$4: {
            if (moonbitlang$core$string$$String$char_length_ge$46$inner(view.str, 2, view.start, view.end)) {
              const _x = moonbitlang$core$string$$String$unsafe_char_at(view.str, moonbitlang$core$string$$String$offset_of_nth_char$46$inner(view.str, 0, view.start, view.end));
              if (_x === 48) {
                const _x$2 = moonbitlang$core$string$$String$unsafe_char_at(view.str, moonbitlang$core$string$$String$offset_of_nth_char$46$inner(view.str, 1, view.start, view.end));
                switch (_x$2) {
                  case 120: {
                    const _tmp = view.str;
                    const _bind = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(view.str, 2, view.start, view.end);
                    let _tmp$2;
                    if (_bind === undefined) {
                      _tmp$2 = view.end;
                    } else {
                      const _Some = _bind;
                      _tmp$2 = _Some;
                    }
                    const _tmp$3 = _tmp$2;
                    const _x$3 = { str: _tmp, start: _tmp$3, end: view.end };
                    rest$3 = _x$3;
                    break _L$4;
                  }
                  case 88: {
                    const _tmp$4 = view.str;
                    const _bind$2 = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(view.str, 2, view.start, view.end);
                    let _tmp$5;
                    if (_bind$2 === undefined) {
                      _tmp$5 = view.end;
                    } else {
                      const _Some = _bind$2;
                      _tmp$5 = _Some;
                    }
                    const _tmp$6 = _tmp$5;
                    const _x$4 = { str: _tmp$4, start: _tmp$6, end: view.end };
                    rest$3 = _x$4;
                    break _L$4;
                  }
                  case 111: {
                    const _tmp$7 = view.str;
                    const _bind$3 = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(view.str, 2, view.start, view.end);
                    let _tmp$8;
                    if (_bind$3 === undefined) {
                      _tmp$8 = view.end;
                    } else {
                      const _Some = _bind$3;
                      _tmp$8 = _Some;
                    }
                    const _tmp$9 = _tmp$8;
                    const _x$5 = { str: _tmp$7, start: _tmp$9, end: view.end };
                    rest$2 = _x$5;
                    break _L$3;
                  }
                  case 79: {
                    const _tmp$10 = view.str;
                    const _bind$4 = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(view.str, 2, view.start, view.end);
                    let _tmp$11;
                    if (_bind$4 === undefined) {
                      _tmp$11 = view.end;
                    } else {
                      const _Some = _bind$4;
                      _tmp$11 = _Some;
                    }
                    const _tmp$12 = _tmp$11;
                    const _x$6 = { str: _tmp$10, start: _tmp$12, end: view.end };
                    rest$2 = _x$6;
                    break _L$3;
                  }
                  case 98: {
                    const _tmp$13 = view.str;
                    const _bind$5 = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(view.str, 2, view.start, view.end);
                    let _tmp$14;
                    if (_bind$5 === undefined) {
                      _tmp$14 = view.end;
                    } else {
                      const _Some = _bind$5;
                      _tmp$14 = _Some;
                    }
                    const _tmp$15 = _tmp$14;
                    const _x$7 = { str: _tmp$13, start: _tmp$15, end: view.end };
                    rest = _x$7;
                    break _L$2;
                  }
                  case 66: {
                    const _tmp$16 = view.str;
                    const _bind$6 = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(view.str, 2, view.start, view.end);
                    let _tmp$17;
                    if (_bind$6 === undefined) {
                      _tmp$17 = view.end;
                    } else {
                      const _Some = _bind$6;
                      _tmp$17 = _Some;
                    }
                    const _tmp$18 = _tmp$17;
                    const _x$8 = { str: _tmp$16, start: _tmp$18, end: view.end };
                    rest = _x$8;
                    break _L$2;
                  }
                  default: {
                    break _L;
                  }
                }
              } else {
                break _L;
              }
            } else {
              break _L;
            }
          }
          return new Result$Ok$10$({ _0: 16, _1: rest$3, _2: true });
        }
        return new Result$Ok$10$({ _0: 8, _1: rest$2, _2: true });
      }
      return new Result$Ok$10$({ _0: 2, _1: rest, _2: true });
    }
    return new Result$Ok$10$({ _0: 10, _1: view, _2: false });
  } else {
    _L: {
      let rest;
      _L$2: {
        let rest$2;
        _L$3: {
          let rest$3;
          _L$4: {
            if (moonbitlang$core$string$$String$char_length_ge$46$inner(view.str, 2, view.start, view.end)) {
              const _x = moonbitlang$core$string$$String$unsafe_char_at(view.str, moonbitlang$core$string$$String$offset_of_nth_char$46$inner(view.str, 0, view.start, view.end));
              if (_x === 48) {
                const _x$2 = moonbitlang$core$string$$String$unsafe_char_at(view.str, moonbitlang$core$string$$String$offset_of_nth_char$46$inner(view.str, 1, view.start, view.end));
                switch (_x$2) {
                  case 120: {
                    const _tmp = view.str;
                    const _bind = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(view.str, 2, view.start, view.end);
                    let _tmp$2;
                    if (_bind === undefined) {
                      _tmp$2 = view.end;
                    } else {
                      const _Some = _bind;
                      _tmp$2 = _Some;
                    }
                    const _tmp$3 = _tmp$2;
                    const _x$3 = { str: _tmp, start: _tmp$3, end: view.end };
                    if (base === 16) {
                      rest$3 = _x$3;
                      break _L$4;
                    } else {
                      break _L;
                    }
                  }
                  case 88: {
                    const _tmp$4 = view.str;
                    const _bind$2 = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(view.str, 2, view.start, view.end);
                    let _tmp$5;
                    if (_bind$2 === undefined) {
                      _tmp$5 = view.end;
                    } else {
                      const _Some = _bind$2;
                      _tmp$5 = _Some;
                    }
                    const _tmp$6 = _tmp$5;
                    const _x$4 = { str: _tmp$4, start: _tmp$6, end: view.end };
                    if (base === 16) {
                      rest$3 = _x$4;
                      break _L$4;
                    } else {
                      break _L;
                    }
                  }
                  case 111: {
                    const _tmp$7 = view.str;
                    const _bind$3 = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(view.str, 2, view.start, view.end);
                    let _tmp$8;
                    if (_bind$3 === undefined) {
                      _tmp$8 = view.end;
                    } else {
                      const _Some = _bind$3;
                      _tmp$8 = _Some;
                    }
                    const _tmp$9 = _tmp$8;
                    const _x$5 = { str: _tmp$7, start: _tmp$9, end: view.end };
                    if (base === 8) {
                      rest$2 = _x$5;
                      break _L$3;
                    } else {
                      break _L;
                    }
                  }
                  case 79: {
                    const _tmp$10 = view.str;
                    const _bind$4 = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(view.str, 2, view.start, view.end);
                    let _tmp$11;
                    if (_bind$4 === undefined) {
                      _tmp$11 = view.end;
                    } else {
                      const _Some = _bind$4;
                      _tmp$11 = _Some;
                    }
                    const _tmp$12 = _tmp$11;
                    const _x$6 = { str: _tmp$10, start: _tmp$12, end: view.end };
                    if (base === 8) {
                      rest$2 = _x$6;
                      break _L$3;
                    } else {
                      break _L;
                    }
                  }
                  case 98: {
                    const _tmp$13 = view.str;
                    const _bind$5 = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(view.str, 2, view.start, view.end);
                    let _tmp$14;
                    if (_bind$5 === undefined) {
                      _tmp$14 = view.end;
                    } else {
                      const _Some = _bind$5;
                      _tmp$14 = _Some;
                    }
                    const _tmp$15 = _tmp$14;
                    const _x$7 = { str: _tmp$13, start: _tmp$15, end: view.end };
                    if (base === 2) {
                      rest = _x$7;
                      break _L$2;
                    } else {
                      break _L;
                    }
                  }
                  case 66: {
                    const _tmp$16 = view.str;
                    const _bind$6 = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(view.str, 2, view.start, view.end);
                    let _tmp$17;
                    if (_bind$6 === undefined) {
                      _tmp$17 = view.end;
                    } else {
                      const _Some = _bind$6;
                      _tmp$17 = _Some;
                    }
                    const _tmp$18 = _tmp$17;
                    const _x$8 = { str: _tmp$16, start: _tmp$18, end: view.end };
                    if (base === 2) {
                      rest = _x$8;
                      break _L$2;
                    } else {
                      break _L;
                    }
                  }
                  default: {
                    break _L;
                  }
                }
              } else {
                break _L;
              }
            } else {
              break _L;
            }
          }
          return new Result$Ok$10$({ _0: 16, _1: rest$3, _2: true });
        }
        return new Result$Ok$10$({ _0: 8, _1: rest$2, _2: true });
      }
      return new Result$Ok$10$({ _0: 2, _1: rest, _2: true });
    }
    return base >= 2 && base <= 36 ? new Result$Ok$10$({ _0: base, _1: view, _2: false }) : moonbitlang$core$strconv$$base_err$46$();
  }
}
function moonbitlang$core$strconv$$range_err$1$() {
  return new Result$Err$11$(new Error$moonbitlang$47$core$47$strconv$46$StrConvError$46$StrConvError(moonbitlang$core$strconv$$range_err_str));
}
function moonbitlang$core$strconv$$range_err$47$() {
  return new Result$Err$12$(new Error$moonbitlang$47$core$47$strconv$46$StrConvError$46$StrConvError(moonbitlang$core$strconv$$range_err_str));
}
function moonbitlang$core$strconv$$syntax_err$4$() {
  return new Result$Err$13$(new Error$moonbitlang$47$core$47$strconv$46$StrConvError$46$StrConvError(moonbitlang$core$strconv$$syntax_err_str));
}
function moonbitlang$core$strconv$$syntax_err$47$() {
  return new Result$Err$12$(new Error$moonbitlang$47$core$47$strconv$46$StrConvError$46$StrConvError(moonbitlang$core$strconv$$syntax_err_str));
}
function moonbitlang$core$strconv$$overflow_threshold(base, neg) {
  return !neg ? (base === 10 ? moonbitlang$core$builtin$$Add$add$47$(moonbitlang$core$builtin$$Div$div$47$($9223372036854775807L, $10L), $1L) : base === 16 ? moonbitlang$core$builtin$$Add$add$47$(moonbitlang$core$builtin$$Div$div$47$($9223372036854775807L, $16L), $1L) : moonbitlang$core$builtin$$Add$add$47$(moonbitlang$core$builtin$$Div$div$47$($9223372036854775807L, moonbitlang$core$int$$Int$to_int64(base)), $1L)) : base === 10 ? moonbitlang$core$builtin$$Div$div$47$($_9223372036854775808L, $10L) : base === 16 ? moonbitlang$core$builtin$$Div$div$47$($_9223372036854775808L, $16L) : moonbitlang$core$builtin$$Div$div$47$($_9223372036854775808L, moonbitlang$core$int$$Int$to_int64(base));
}
function moonbitlang$core$strconv$$parse_int64$46$inner(str, base) {
  if (moonbitlang$core$builtin$$op_notequal$3$(str, { str: moonbitlang$core$strconv$$parse_int64$46$inner$46$42$bind$124$610, start: 0, end: moonbitlang$core$strconv$$parse_int64$46$inner$46$42$bind$124$610.length })) {
    let _bind;
    let rest;
    _L: {
      _L$2: {
        const _bind$2 = moonbitlang$core$string$$View$view$46$inner(str, 0, undefined);
        if (moonbitlang$core$string$$String$char_length_ge$46$inner(_bind$2.str, 1, _bind$2.start, _bind$2.end)) {
          const _x = moonbitlang$core$string$$String$unsafe_char_at(_bind$2.str, moonbitlang$core$string$$String$offset_of_nth_char$46$inner(_bind$2.str, 0, _bind$2.start, _bind$2.end));
          switch (_x) {
            case 43: {
              const _tmp = _bind$2.str;
              const _bind$3 = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(_bind$2.str, 1, _bind$2.start, _bind$2.end);
              let _tmp$2;
              if (_bind$3 === undefined) {
                _tmp$2 = _bind$2.end;
              } else {
                const _Some = _bind$3;
                _tmp$2 = _Some;
              }
              const _tmp$3 = _tmp$2;
              const _x$2 = { str: _tmp, start: _tmp$3, end: _bind$2.end };
              _bind = { _0: false, _1: _x$2 };
              break;
            }
            case 45: {
              const _tmp$4 = _bind$2.str;
              const _bind$4 = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(_bind$2.str, 1, _bind$2.start, _bind$2.end);
              let _tmp$5;
              if (_bind$4 === undefined) {
                _tmp$5 = _bind$2.end;
              } else {
                const _Some = _bind$4;
                _tmp$5 = _Some;
              }
              const _tmp$6 = _tmp$5;
              const _x$3 = { str: _tmp$4, start: _tmp$6, end: _bind$2.end };
              _bind = { _0: true, _1: _x$3 };
              break;
            }
            default: {
              rest = _bind$2;
              break _L$2;
            }
          }
        } else {
          rest = _bind$2;
          break _L$2;
        }
        break _L;
      }
      _bind = { _0: false, _1: rest };
    }
    const _neg = _bind._0;
    const _rest = _bind._1;
    const _bind$2 = moonbitlang$core$strconv$$check_and_consume_base(_rest, base);
    let _bind$3;
    if (_bind$2.$tag === 1) {
      const _ok = _bind$2;
      _bind$3 = _ok._0;
    } else {
      return _bind$2;
    }
    const _num_base = _bind$3._0;
    const _rest$2 = _bind$3._1;
    const _allow_underscore = _bind$3._2;
    const overflow_threshold = moonbitlang$core$strconv$$overflow_threshold(_num_base, _neg);
    let has_digit;
    if (moonbitlang$core$string$$String$char_length_ge$46$inner(_rest$2.str, 1, _rest$2.start, _rest$2.end)) {
      const _x = moonbitlang$core$string$$String$unsafe_char_at(_rest$2.str, moonbitlang$core$string$$String$offset_of_nth_char$46$inner(_rest$2.str, 0, _rest$2.start, _rest$2.end));
      if (_x >= 48 && _x <= 57) {
        has_digit = true;
      } else {
        if (_x >= 97 && _x <= 122) {
          has_digit = true;
        } else {
          if (_x >= 65 && _x <= 90) {
            has_digit = true;
          } else {
            if (moonbitlang$core$string$$String$char_length_ge$46$inner(_rest$2.str, 2, _rest$2.start, _rest$2.end)) {
              if (_x === 95) {
                const _x$2 = moonbitlang$core$string$$String$unsafe_char_at(_rest$2.str, moonbitlang$core$string$$String$offset_of_nth_char$46$inner(_rest$2.str, 1, _rest$2.start, _rest$2.end));
                has_digit = _x$2 >= 48 && _x$2 <= 57 ? true : _x$2 >= 97 && _x$2 <= 122 ? true : _x$2 >= 65 && _x$2 <= 90;
              } else {
                has_digit = false;
              }
            } else {
              has_digit = false;
            }
          }
        }
      }
    } else {
      has_digit = false;
    }
    if (has_digit) {
      let _tmp;
      let _tmp$2 = _rest$2;
      let _tmp$3 = $0L;
      let _tmp$4 = _allow_underscore;
      while (true) {
        const _param_0 = _tmp$2;
        const _param_1 = _tmp$3;
        const _param_2 = _tmp$4;
        let acc;
        let rest$2;
        let c;
        _L$2: {
          if (moonbitlang$core$string$$String$char_length_eq$46$inner(_param_0.str, 1, _param_0.start, _param_0.end)) {
            const _x = moonbitlang$core$string$$String$unsafe_char_at(_param_0.str, moonbitlang$core$string$$String$offset_of_nth_char$46$inner(_param_0.str, 0, _param_0.start, _param_0.end));
            if (_x === 95) {
              const _bind$4 = moonbitlang$core$strconv$$syntax_err$47$();
              if (_bind$4.$tag === 1) {
                const _ok = _bind$4;
                _tmp = _ok._0;
                break;
              } else {
                return _bind$4;
              }
            } else {
              const _tmp$5 = _param_0.str;
              const _bind$4 = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(_param_0.str, 1, _param_0.start, _param_0.end);
              let _tmp$6;
              if (_bind$4 === undefined) {
                _tmp$6 = _param_0.end;
              } else {
                const _Some = _bind$4;
                _tmp$6 = _Some;
              }
              const _tmp$7 = _tmp$6;
              const _x$2 = { str: _tmp$5, start: _tmp$7, end: _param_0.end };
              acc = _param_1;
              rest$2 = _x$2;
              c = _x;
              break _L$2;
            }
          } else {
            if (moonbitlang$core$string$$String$char_length_ge$46$inner(_param_0.str, 1, _param_0.start, _param_0.end)) {
              const _x = moonbitlang$core$string$$String$unsafe_char_at(_param_0.str, moonbitlang$core$string$$String$offset_of_nth_char$46$inner(_param_0.str, 0, _param_0.start, _param_0.end));
              if (_x === 95) {
                if (_param_2 === false) {
                  const _bind$4 = moonbitlang$core$strconv$$syntax_err$47$();
                  if (_bind$4.$tag === 1) {
                    const _ok = _bind$4;
                    _tmp = _ok._0;
                    break;
                  } else {
                    return _bind$4;
                  }
                } else {
                  const _tmp$5 = _param_0.str;
                  const _bind$4 = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(_param_0.str, 1, _param_0.start, _param_0.end);
                  let _tmp$6;
                  if (_bind$4 === undefined) {
                    _tmp$6 = _param_0.end;
                  } else {
                    const _Some = _bind$4;
                    _tmp$6 = _Some;
                  }
                  const _tmp$7 = _tmp$6;
                  const _x$2 = { str: _tmp$5, start: _tmp$7, end: _param_0.end };
                  _tmp$2 = _x$2;
                  _tmp$4 = false;
                  continue;
                }
              } else {
                const _tmp$5 = _param_0.str;
                const _bind$4 = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(_param_0.str, 1, _param_0.start, _param_0.end);
                let _tmp$6;
                if (_bind$4 === undefined) {
                  _tmp$6 = _param_0.end;
                } else {
                  const _Some = _bind$4;
                  _tmp$6 = _Some;
                }
                const _tmp$7 = _tmp$6;
                const _x$2 = { str: _tmp$5, start: _tmp$7, end: _param_0.end };
                acc = _param_1;
                rest$2 = _x$2;
                c = _x;
                break _L$2;
              }
            } else {
              _tmp = _param_1;
              break;
            }
          }
        }
        const c$2 = c;
        let d;
        if (c$2 >= 48 && c$2 <= 57) {
          d = c$2 - 48 | 0;
        } else {
          if (c$2 >= 97 && c$2 <= 122) {
            d = c$2 + -87 | 0;
          } else {
            if (c$2 >= 65 && c$2 <= 90) {
              d = c$2 + -55 | 0;
            } else {
              const _bind$4 = moonbitlang$core$strconv$$syntax_err$4$();
              if (_bind$4.$tag === 1) {
                const _ok = _bind$4;
                d = _ok._0;
              } else {
                return _bind$4;
              }
            }
          }
        }
        if (d < _num_base) {
          if (_neg) {
            if (moonbitlang$core$builtin$$op_ge$47$(acc, overflow_threshold)) {
              const next_acc = moonbitlang$core$builtin$$Sub$sub$47$(moonbitlang$core$builtin$$Mul$mul$47$(acc, moonbitlang$core$int$$Int$to_int64(_num_base)), moonbitlang$core$int$$Int$to_int64(d));
              if (moonbitlang$core$builtin$$op_le$47$(next_acc, acc)) {
                _tmp$2 = rest$2;
                _tmp$3 = next_acc;
                _tmp$4 = true;
                continue;
              } else {
                const _bind$4 = moonbitlang$core$strconv$$range_err$47$();
                if (_bind$4.$tag === 1) {
                  const _ok = _bind$4;
                  _tmp = _ok._0;
                  break;
                } else {
                  return _bind$4;
                }
              }
            } else {
              const _bind$4 = moonbitlang$core$strconv$$range_err$47$();
              if (_bind$4.$tag === 1) {
                const _ok = _bind$4;
                _tmp = _ok._0;
                break;
              } else {
                return _bind$4;
              }
            }
          } else {
            if (moonbitlang$core$builtin$$op_lt$47$(acc, overflow_threshold)) {
              const next_acc = moonbitlang$core$builtin$$Add$add$47$(moonbitlang$core$builtin$$Mul$mul$47$(acc, moonbitlang$core$int$$Int$to_int64(_num_base)), moonbitlang$core$int$$Int$to_int64(d));
              if (moonbitlang$core$builtin$$op_ge$47$(next_acc, acc)) {
                _tmp$2 = rest$2;
                _tmp$3 = next_acc;
                _tmp$4 = true;
                continue;
              } else {
                const _bind$4 = moonbitlang$core$strconv$$range_err$47$();
                if (_bind$4.$tag === 1) {
                  const _ok = _bind$4;
                  _tmp = _ok._0;
                  break;
                } else {
                  return _bind$4;
                }
              }
            } else {
              const _bind$4 = moonbitlang$core$strconv$$range_err$47$();
              if (_bind$4.$tag === 1) {
                const _ok = _bind$4;
                _tmp = _ok._0;
                break;
              } else {
                return _bind$4;
              }
            }
          }
        } else {
          const _bind$4 = moonbitlang$core$strconv$$syntax_err$47$();
          if (_bind$4.$tag === 1) {
            const _ok = _bind$4;
            _tmp = _ok._0;
            break;
          } else {
            return _bind$4;
          }
        }
      }
      return new Result$Ok$12$(_tmp);
    } else {
      return moonbitlang$core$strconv$$syntax_err$47$();
    }
  } else {
    return moonbitlang$core$strconv$$syntax_err$47$();
  }
}
function moonbitlang$core$strconv$$parse_int$46$inner(str, base) {
  const _bind = moonbitlang$core$strconv$$parse_int64$46$inner(str, base);
  let n;
  if (_bind.$tag === 1) {
    const _ok = _bind;
    n = _ok._0;
  } else {
    return _bind;
  }
  if (moonbitlang$core$builtin$$op_lt$47$(n, moonbitlang$core$int$$Int$to_int64(-2147483648)) || moonbitlang$core$builtin$$op_gt$47$(n, moonbitlang$core$int$$Int$to_int64(2147483647))) {
    const _bind$2 = moonbitlang$core$strconv$$range_err$1$();
    if (_bind$2.$tag === 1) {
      const _ok = _bind$2;
      _ok._0;
    } else {
      return _bind$2;
    }
  }
  return new Result$Ok$13$(moonbitlang$core$int64$$Int64$to_int(n));
}
function moonbitlang$core$result$$Result$unwrap$48$(self) {
  if (self.$tag === 1) {
    const _Ok = self;
    return _Ok._0;
  } else {
    return moonbitlang$core$abort$$abort$2$("called `Result::unwrap()` on an `Err` value");
  }
}
function moonbitlang$core$result$$Result$unwrap$49$(self) {
  if (self.$tag === 1) {
    const _Ok = self;
    _Ok._0;
    return;
  } else {
    moonbitlang$core$abort$$abort$1$("called `Result::unwrap()` on an `Err` value");
    return;
  }
}
function moonbitlang$core$result$$Result$unwrap$50$(self) {
  if (self.$tag === 1) {
    const _Ok = self;
    return _Ok._0;
  } else {
    return moonbitlang$core$abort$$abort$4$("called `Result::unwrap()` on an `Err` value");
  }
}
function moonbitlang$core$builtin$$Hash$hash_combine$51$(self, hasher) {
  moonbitlang$core$builtin$$Hasher$combine_char(hasher, self);
}
function moonbitlang$core$bytes$$View$op_get(self, index) {
  if (index >= 0 && index < self.len) {
    const _tmp = self.bytes;
    const _tmp$2 = self.start + index | 0;
    $bound_check(_tmp, _tmp$2);
    return _tmp[_tmp$2];
  } else {
    return moonbitlang$core$abort$$abort$24$(`index out of bounds: the len is from 0 to ${moonbitlang$core$builtin$$Show$to_string$4$(self.len)} but the index is ${moonbitlang$core$builtin$$Show$to_string$4$(index)}`);
  }
}
function moonbitlang$core$bytes$$Bytes$op_as_view$46$inner(self, start, end) {
  const len = self.length;
  let end$2;
  if (end === undefined) {
    end$2 = len;
  } else {
    const _Some = end;
    const _end = _Some;
    end$2 = _end < 0 ? len + _end | 0 : _end;
  }
  const start$2 = start < 0 ? len + start | 0 : start;
  return start$2 >= 0 && (start$2 <= end$2 && end$2 <= len) ? { bytes: self, start: start$2, len: end$2 - start$2 | 0 } : moonbitlang$core$abort$$abort$23$("Invalid index for View");
}
function moonbitlang$core$bytes$$View$iter(self) {
  const _p = (yield_) => {
    const _end268 = self.len;
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < _end268) {
        const _bind = yield_(moonbitlang$core$bytes$$View$op_get(self, i));
        if (_bind === 1) {
        } else {
          return 0;
        }
        _tmp = i + 1 | 0;
        continue;
      } else {
        return 1;
      }
    }
  };
  return _p;
}
function moonbitlang$core$builtin$$Eq$equal$23$(self, other) {
  if (self.len === other.len) {
    const _end239 = self.len;
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < _end239) {
        const _tmp$2 = self.bytes;
        const _tmp$3 = self.start + i | 0;
        $bound_check(_tmp$2, _tmp$3);
        const _p = _tmp$2[_tmp$3];
        const _tmp$4 = other.bytes;
        const _tmp$5 = other.start + i | 0;
        $bound_check(_tmp$4, _tmp$5);
        const _p$2 = _tmp$4[_tmp$5];
        if (_p === _p$2) {
        } else {
          return false;
        }
        _tmp = i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    return true;
  } else {
    return false;
  }
}
function moonbitlang$core$bytes$$Bytes$from_array(arr) {
  return moonbitlang$core$bytes$$Bytes$makei$52$(arr.length, (i) => moonbitlang$core$array$$Array$op_get$24$(arr, i));
}
function moonbitlang$core$bytes$$Bytes$from_fixedarray(arr, len) {
  let len$2;
  if (len === undefined) {
    len$2 = arr.length;
  } else {
    const _Some = len;
    len$2 = _Some;
  }
  return moonbitlang$core$bytes$$Bytes$makei$52$(len$2, (i) => {
    $bound_check(arr, i);
    return arr[i];
  });
}
function moonbitlang$core$bytes$$from_fixedarray(arr, len) {
  return moonbitlang$core$bytes$$Bytes$from_fixedarray(arr, len);
}
function moonbitlang$core$bytes$$Bytes$to_fixedarray(self, len) {
  let len$2;
  if (len === undefined) {
    len$2 = self.length;
  } else {
    const _Some = len;
    len$2 = _Some;
  }
  const arr = $makebytes(len$2, 0);
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < len$2) {
      $bound_check(self, i);
      $bound_check(arr, i);
      arr[i] = self[i];
      _tmp = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return arr;
}
function moonbitlang$core$bytes$$Bytes$iter(self) {
  const _p = (yield_) => {
    const _end144 = self.length;
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < _end144) {
        $bound_check(self, i);
        if (moonbitlang$core$builtin$$Eq$equal$53$(yield_(self[i]), 0)) {
          return 0;
        }
        _tmp = i + 1 | 0;
        continue;
      } else {
        return 1;
      }
    }
  };
  return _p;
}
function moonbitlang$core$immut$sorted_map$$SortedMap$size$54$(self) {
  if (self.$tag === 0) {
    return 0;
  } else {
    const _Tree = self;
    return _Tree._2;
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$size$55$(self) {
  if (self.$tag === 0) {
    return 0;
  } else {
    const _Tree = self;
    return _Tree._2;
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$size$56$(self) {
  if (self.$tag === 0) {
    return 0;
  } else {
    const _Tree = self;
    return _Tree._2;
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$size$57$(self) {
  if (self.$tag === 0) {
    return 0;
  } else {
    const _Tree = self;
    return _Tree._2;
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$size$58$(self) {
  if (self.$tag === 0) {
    return 0;
  } else {
    const _Tree = self;
    return _Tree._2;
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$size$59$(self) {
  if (self.$tag === 0) {
    return 0;
  } else {
    const _Tree = self;
    return _Tree._2;
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$size$60$(self) {
  if (self.$tag === 0) {
    return 0;
  } else {
    const _Tree = self;
    return _Tree._2;
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$size$61$(self) {
  if (self.$tag === 0) {
    return 0;
  } else {
    const _Tree = self;
    return _Tree._2;
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$size$62$(self) {
  if (self.$tag === 0) {
    return 0;
  } else {
    const _Tree = self;
    return _Tree._2;
  }
}
function moonbitlang$core$immut$sorted_map$$make_tree$54$(key, value, l, r) {
  const size = (moonbitlang$core$immut$sorted_map$$SortedMap$size$54$(l) + moonbitlang$core$immut$sorted_map$$SortedMap$size$54$(r) | 0) + 1 | 0;
  return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$15$(key, value, size, l, r);
}
function moonbitlang$core$immut$sorted_map$$make_tree$55$(key, value, l, r) {
  const size = (moonbitlang$core$immut$sorted_map$$SortedMap$size$55$(l) + moonbitlang$core$immut$sorted_map$$SortedMap$size$55$(r) | 0) + 1 | 0;
  return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$16$(key, value, size, l, r);
}
function moonbitlang$core$immut$sorted_map$$make_tree$56$(key, value, l, r) {
  const size = (moonbitlang$core$immut$sorted_map$$SortedMap$size$56$(l) + moonbitlang$core$immut$sorted_map$$SortedMap$size$56$(r) | 0) + 1 | 0;
  return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$17$(key, value, size, l, r);
}
function moonbitlang$core$immut$sorted_map$$make_tree$57$(key, value, l, r) {
  const size = (moonbitlang$core$immut$sorted_map$$SortedMap$size$57$(l) + moonbitlang$core$immut$sorted_map$$SortedMap$size$57$(r) | 0) + 1 | 0;
  return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$18$(key, value, size, l, r);
}
function moonbitlang$core$immut$sorted_map$$make_tree$58$(key, value, l, r) {
  const size = (moonbitlang$core$immut$sorted_map$$SortedMap$size$58$(l) + moonbitlang$core$immut$sorted_map$$SortedMap$size$58$(r) | 0) + 1 | 0;
  return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$19$(key, value, size, l, r);
}
function moonbitlang$core$immut$sorted_map$$make_tree$59$(key, value, l, r) {
  const size = (moonbitlang$core$immut$sorted_map$$SortedMap$size$59$(l) + moonbitlang$core$immut$sorted_map$$SortedMap$size$59$(r) | 0) + 1 | 0;
  return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$20$(key, value, size, l, r);
}
function moonbitlang$core$immut$sorted_map$$make_tree$60$(key, value, l, r) {
  const size = (moonbitlang$core$immut$sorted_map$$SortedMap$size$60$(l) + moonbitlang$core$immut$sorted_map$$SortedMap$size$60$(r) | 0) + 1 | 0;
  return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$21$(key, value, size, l, r);
}
function moonbitlang$core$immut$sorted_map$$make_tree$61$(key, value, l, r) {
  const size = (moonbitlang$core$immut$sorted_map$$SortedMap$size$61$(l) + moonbitlang$core$immut$sorted_map$$SortedMap$size$61$(r) | 0) + 1 | 0;
  return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$22$(key, value, size, l, r);
}
function moonbitlang$core$immut$sorted_map$$make_tree$62$(key, value, l, r) {
  const size = (moonbitlang$core$immut$sorted_map$$SortedMap$size$62$(l) + moonbitlang$core$immut$sorted_map$$SortedMap$size$62$(r) | 0) + 1 | 0;
  return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$14$(key, value, size, l, r);
}
function moonbitlang$core$immut$sorted_map$$SortedMap$get$54$(self, key) {
  let _tmp = self;
  while (true) {
    const _param = _tmp;
    if (_param.$tag === 0) {
      return undefined;
    } else {
      const _Tree = _param;
      const _k = _Tree._0;
      const _value = _Tree._1;
      const _l = _Tree._3;
      const _r = _Tree._4;
      const c = $compare_int(key, _k);
      if (c === 0) {
        return _value;
      } else {
        if (c < 0) {
          _tmp = _l;
          continue;
        } else {
          _tmp = _r;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$get$55$(self, key) {
  let _tmp = self;
  while (true) {
    const _param = _tmp;
    if (_param.$tag === 0) {
      return Option$None$23$;
    } else {
      const _Tree = _param;
      const _k = _Tree._0;
      const _value = _Tree._1;
      const _l = _Tree._3;
      const _r = _Tree._4;
      const c = $compare_int(key, _k);
      if (c === 0) {
        return new Option$Some$23$(_value);
      } else {
        if (c < 0) {
          _tmp = _l;
          continue;
        } else {
          _tmp = _r;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$get$56$(self, key) {
  let _tmp = self;
  while (true) {
    const _param = _tmp;
    if (_param.$tag === 0) {
      return undefined;
    } else {
      const _Tree = _param;
      const _k = _Tree._0;
      const _value = _Tree._1;
      const _l = _Tree._3;
      const _r = _Tree._4;
      const c = moonbitlang$core$builtin$$Compare$compare$29$(key, _k);
      if (c === 0) {
        return _value;
      } else {
        if (c < 0) {
          _tmp = _l;
          continue;
        } else {
          _tmp = _r;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$get$57$(self, key) {
  let _tmp = self;
  while (true) {
    const _param = _tmp;
    if (_param.$tag === 0) {
      return undefined;
    } else {
      const _Tree = _param;
      const _k = _Tree._0;
      const _value = _Tree._1;
      const _l = _Tree._3;
      const _r = _Tree._4;
      const c = $compare_int(key.id, _k.id);
      if (c === 0) {
        return _value;
      } else {
        if (c < 0) {
          _tmp = _l;
          continue;
        } else {
          _tmp = _r;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$get$59$(self, key) {
  let _tmp = self;
  while (true) {
    const _param = _tmp;
    if (_param.$tag === 0) {
      return undefined;
    } else {
      const _Tree = _param;
      const _k = _Tree._0;
      const _value = _Tree._1;
      const _l = _Tree._3;
      const _r = _Tree._4;
      const c = $compare_int(key.num, _k.num);
      if (c === 0) {
        return _value;
      } else {
        if (c < 0) {
          _tmp = _l;
          continue;
        } else {
          _tmp = _r;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$get$58$(self, key) {
  let _tmp = self;
  while (true) {
    const _param = _tmp;
    if (_param.$tag === 0) {
      return undefined;
    } else {
      const _Tree = _param;
      const _k = _Tree._0;
      const _value = _Tree._1;
      const _l = _Tree._3;
      const _r = _Tree._4;
      const c = $compare_int(key, _k);
      if (c === 0) {
        return _value;
      } else {
        if (c < 0) {
          _tmp = _l;
          continue;
        } else {
          _tmp = _r;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$get$61$(self, key) {
  let _tmp = self;
  while (true) {
    const _param = _tmp;
    if (_param.$tag === 0) {
      return undefined;
    } else {
      const _Tree = _param;
      const _k = _Tree._0;
      const _value = _Tree._1;
      const _l = _Tree._3;
      const _r = _Tree._4;
      const c = moonbitlang$core$builtin$$Compare$compare$63$(key, _k);
      if (c === 0) {
        return _value;
      } else {
        if (c < 0) {
          _tmp = _l;
          continue;
        } else {
          _tmp = _r;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$get$62$(self, key) {
  let _tmp = self;
  while (true) {
    const _param = _tmp;
    if (_param.$tag === 0) {
      return undefined;
    } else {
      const _Tree = _param;
      const _k = _Tree._0;
      const _value = _Tree._1;
      const _l = _Tree._3;
      const _r = _Tree._4;
      const c = moonbitlang$core$builtin$$Compare$compare$2$(key, _k);
      if (c === 0) {
        return _value;
      } else {
        if (c < 0) {
          _tmp = _l;
          continue;
        } else {
          _tmp = _r;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$map_with_key$64$(self, f) {
  if (self.$tag === 0) {
    return $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$19$;
  } else {
    const _Tree = self;
    const _k = _Tree._0;
    const _value = _Tree._1;
    const _l = _Tree._3;
    const _r = _Tree._4;
    const _size = _Tree._2;
    return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$19$(_k, f(_k, _value), _size, moonbitlang$core$immut$sorted_map$$SortedMap$map_with_key$64$(_l, f), moonbitlang$core$immut$sorted_map$$SortedMap$map_with_key$64$(_r, f));
  }
}
function moonbitlang$core$immut$sorted_map$$balance$54$(key, value, l, r) {
  const ln = moonbitlang$core$immut$sorted_map$$SortedMap$size$54$(l);
  const rn = moonbitlang$core$immut$sorted_map$$SortedMap$size$54$(r);
  if ((ln + rn | 0) < 2) {
    return moonbitlang$core$immut$sorted_map$$make_tree$54$(key, value, l, r);
  } else {
    if (rn > (Math.imul(5, ln) | 0)) {
      if (r.$tag === 1) {
        const _Tree = r;
        const _rl = _Tree._3;
        const _rr = _Tree._4;
        const rln = moonbitlang$core$immut$sorted_map$$SortedMap$size$54$(_rl);
        const rrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$54$(_rr);
        if (rln < rrn) {
          if (r.$tag === 1) {
            const _Tree$2 = r;
            const _k2 = _Tree$2._0;
            const _v2 = _Tree$2._1;
            const _y = _Tree$2._3;
            const _z = _Tree$2._4;
            return moonbitlang$core$immut$sorted_map$$make_tree$54$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$54$(key, value, l, _y), _z);
          } else {
            return $panic();
          }
        } else {
          _L: {
            if (r.$tag === 1) {
              const _Tree$2 = r;
              const _k3 = _Tree$2._0;
              const _v3 = _Tree$2._1;
              const _x = _Tree$2._3;
              if (_x.$tag === 1) {
                const _Tree$3 = _x;
                const _k2 = _Tree$3._0;
                const _v2 = _Tree$3._1;
                const _y1 = _Tree$3._3;
                const _y2 = _Tree$3._4;
                const _z = _Tree$2._4;
                return moonbitlang$core$immut$sorted_map$$make_tree$54$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$54$(key, value, l, _y1), moonbitlang$core$immut$sorted_map$$make_tree$54$(_k3, _v3, _y2, _z));
              } else {
                break _L;
              }
            } else {
              break _L;
            }
          }
          return $panic();
        }
      } else {
        return $panic();
      }
    } else {
      if (ln > (Math.imul(5, rn) | 0)) {
        if (l.$tag === 1) {
          const _Tree = l;
          const _ll = _Tree._3;
          const _lr = _Tree._4;
          const lln = moonbitlang$core$immut$sorted_map$$SortedMap$size$54$(_ll);
          const lrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$54$(_lr);
          if (lrn < lln) {
            if (l.$tag === 1) {
              const _Tree$2 = l;
              const _k1 = _Tree$2._0;
              const _v1 = _Tree$2._1;
              const _x = _Tree$2._3;
              const _y = _Tree$2._4;
              return moonbitlang$core$immut$sorted_map$$make_tree$54$(_k1, _v1, _x, moonbitlang$core$immut$sorted_map$$make_tree$54$(key, value, _y, r));
            } else {
              return $panic();
            }
          } else {
            _L: {
              if (l.$tag === 1) {
                const _Tree$2 = l;
                const _k1 = _Tree$2._0;
                const _v1 = _Tree$2._1;
                const _x = _Tree$2._3;
                const _x$2 = _Tree$2._4;
                if (_x$2.$tag === 1) {
                  const _Tree$3 = _x$2;
                  const _k2 = _Tree$3._0;
                  const _v2 = _Tree$3._1;
                  const _y1 = _Tree$3._3;
                  const _y2 = _Tree$3._4;
                  return moonbitlang$core$immut$sorted_map$$make_tree$54$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$54$(_k1, _v1, _x, _y1), moonbitlang$core$immut$sorted_map$$make_tree$54$(key, value, _y2, r));
                } else {
                  break _L;
                }
              } else {
                break _L;
              }
            }
            return $panic();
          }
        } else {
          return $panic();
        }
      } else {
        return moonbitlang$core$immut$sorted_map$$make_tree$54$(key, value, l, r);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$balance$55$(key, value, l, r) {
  const ln = moonbitlang$core$immut$sorted_map$$SortedMap$size$55$(l);
  const rn = moonbitlang$core$immut$sorted_map$$SortedMap$size$55$(r);
  if ((ln + rn | 0) < 2) {
    return moonbitlang$core$immut$sorted_map$$make_tree$55$(key, value, l, r);
  } else {
    if (rn > (Math.imul(5, ln) | 0)) {
      if (r.$tag === 1) {
        const _Tree = r;
        const _rl = _Tree._3;
        const _rr = _Tree._4;
        const rln = moonbitlang$core$immut$sorted_map$$SortedMap$size$55$(_rl);
        const rrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$55$(_rr);
        if (rln < rrn) {
          if (r.$tag === 1) {
            const _Tree$2 = r;
            const _k2 = _Tree$2._0;
            const _v2 = _Tree$2._1;
            const _y = _Tree$2._3;
            const _z = _Tree$2._4;
            return moonbitlang$core$immut$sorted_map$$make_tree$55$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$55$(key, value, l, _y), _z);
          } else {
            return $panic();
          }
        } else {
          _L: {
            if (r.$tag === 1) {
              const _Tree$2 = r;
              const _k3 = _Tree$2._0;
              const _v3 = _Tree$2._1;
              const _x = _Tree$2._3;
              if (_x.$tag === 1) {
                const _Tree$3 = _x;
                const _k2 = _Tree$3._0;
                const _v2 = _Tree$3._1;
                const _y1 = _Tree$3._3;
                const _y2 = _Tree$3._4;
                const _z = _Tree$2._4;
                return moonbitlang$core$immut$sorted_map$$make_tree$55$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$55$(key, value, l, _y1), moonbitlang$core$immut$sorted_map$$make_tree$55$(_k3, _v3, _y2, _z));
              } else {
                break _L;
              }
            } else {
              break _L;
            }
          }
          return $panic();
        }
      } else {
        return $panic();
      }
    } else {
      if (ln > (Math.imul(5, rn) | 0)) {
        if (l.$tag === 1) {
          const _Tree = l;
          const _ll = _Tree._3;
          const _lr = _Tree._4;
          const lln = moonbitlang$core$immut$sorted_map$$SortedMap$size$55$(_ll);
          const lrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$55$(_lr);
          if (lrn < lln) {
            if (l.$tag === 1) {
              const _Tree$2 = l;
              const _k1 = _Tree$2._0;
              const _v1 = _Tree$2._1;
              const _x = _Tree$2._3;
              const _y = _Tree$2._4;
              return moonbitlang$core$immut$sorted_map$$make_tree$55$(_k1, _v1, _x, moonbitlang$core$immut$sorted_map$$make_tree$55$(key, value, _y, r));
            } else {
              return $panic();
            }
          } else {
            _L: {
              if (l.$tag === 1) {
                const _Tree$2 = l;
                const _k1 = _Tree$2._0;
                const _v1 = _Tree$2._1;
                const _x = _Tree$2._3;
                const _x$2 = _Tree$2._4;
                if (_x$2.$tag === 1) {
                  const _Tree$3 = _x$2;
                  const _k2 = _Tree$3._0;
                  const _v2 = _Tree$3._1;
                  const _y1 = _Tree$3._3;
                  const _y2 = _Tree$3._4;
                  return moonbitlang$core$immut$sorted_map$$make_tree$55$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$55$(_k1, _v1, _x, _y1), moonbitlang$core$immut$sorted_map$$make_tree$55$(key, value, _y2, r));
                } else {
                  break _L;
                }
              } else {
                break _L;
              }
            }
            return $panic();
          }
        } else {
          return $panic();
        }
      } else {
        return moonbitlang$core$immut$sorted_map$$make_tree$55$(key, value, l, r);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$balance$56$(key, value, l, r) {
  const ln = moonbitlang$core$immut$sorted_map$$SortedMap$size$56$(l);
  const rn = moonbitlang$core$immut$sorted_map$$SortedMap$size$56$(r);
  if ((ln + rn | 0) < 2) {
    return moonbitlang$core$immut$sorted_map$$make_tree$56$(key, value, l, r);
  } else {
    if (rn > (Math.imul(5, ln) | 0)) {
      if (r.$tag === 1) {
        const _Tree = r;
        const _rl = _Tree._3;
        const _rr = _Tree._4;
        const rln = moonbitlang$core$immut$sorted_map$$SortedMap$size$56$(_rl);
        const rrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$56$(_rr);
        if (rln < rrn) {
          if (r.$tag === 1) {
            const _Tree$2 = r;
            const _k2 = _Tree$2._0;
            const _v2 = _Tree$2._1;
            const _y = _Tree$2._3;
            const _z = _Tree$2._4;
            return moonbitlang$core$immut$sorted_map$$make_tree$56$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$56$(key, value, l, _y), _z);
          } else {
            return $panic();
          }
        } else {
          _L: {
            if (r.$tag === 1) {
              const _Tree$2 = r;
              const _k3 = _Tree$2._0;
              const _v3 = _Tree$2._1;
              const _x = _Tree$2._3;
              if (_x.$tag === 1) {
                const _Tree$3 = _x;
                const _k2 = _Tree$3._0;
                const _v2 = _Tree$3._1;
                const _y1 = _Tree$3._3;
                const _y2 = _Tree$3._4;
                const _z = _Tree$2._4;
                return moonbitlang$core$immut$sorted_map$$make_tree$56$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$56$(key, value, l, _y1), moonbitlang$core$immut$sorted_map$$make_tree$56$(_k3, _v3, _y2, _z));
              } else {
                break _L;
              }
            } else {
              break _L;
            }
          }
          return $panic();
        }
      } else {
        return $panic();
      }
    } else {
      if (ln > (Math.imul(5, rn) | 0)) {
        if (l.$tag === 1) {
          const _Tree = l;
          const _ll = _Tree._3;
          const _lr = _Tree._4;
          const lln = moonbitlang$core$immut$sorted_map$$SortedMap$size$56$(_ll);
          const lrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$56$(_lr);
          if (lrn < lln) {
            if (l.$tag === 1) {
              const _Tree$2 = l;
              const _k1 = _Tree$2._0;
              const _v1 = _Tree$2._1;
              const _x = _Tree$2._3;
              const _y = _Tree$2._4;
              return moonbitlang$core$immut$sorted_map$$make_tree$56$(_k1, _v1, _x, moonbitlang$core$immut$sorted_map$$make_tree$56$(key, value, _y, r));
            } else {
              return $panic();
            }
          } else {
            _L: {
              if (l.$tag === 1) {
                const _Tree$2 = l;
                const _k1 = _Tree$2._0;
                const _v1 = _Tree$2._1;
                const _x = _Tree$2._3;
                const _x$2 = _Tree$2._4;
                if (_x$2.$tag === 1) {
                  const _Tree$3 = _x$2;
                  const _k2 = _Tree$3._0;
                  const _v2 = _Tree$3._1;
                  const _y1 = _Tree$3._3;
                  const _y2 = _Tree$3._4;
                  return moonbitlang$core$immut$sorted_map$$make_tree$56$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$56$(_k1, _v1, _x, _y1), moonbitlang$core$immut$sorted_map$$make_tree$56$(key, value, _y2, r));
                } else {
                  break _L;
                }
              } else {
                break _L;
              }
            }
            return $panic();
          }
        } else {
          return $panic();
        }
      } else {
        return moonbitlang$core$immut$sorted_map$$make_tree$56$(key, value, l, r);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$balance$57$(key, value, l, r) {
  const ln = moonbitlang$core$immut$sorted_map$$SortedMap$size$57$(l);
  const rn = moonbitlang$core$immut$sorted_map$$SortedMap$size$57$(r);
  if ((ln + rn | 0) < 2) {
    return moonbitlang$core$immut$sorted_map$$make_tree$57$(key, value, l, r);
  } else {
    if (rn > (Math.imul(5, ln) | 0)) {
      if (r.$tag === 1) {
        const _Tree = r;
        const _rl = _Tree._3;
        const _rr = _Tree._4;
        const rln = moonbitlang$core$immut$sorted_map$$SortedMap$size$57$(_rl);
        const rrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$57$(_rr);
        if (rln < rrn) {
          if (r.$tag === 1) {
            const _Tree$2 = r;
            const _k2 = _Tree$2._0;
            const _v2 = _Tree$2._1;
            const _y = _Tree$2._3;
            const _z = _Tree$2._4;
            return moonbitlang$core$immut$sorted_map$$make_tree$57$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$57$(key, value, l, _y), _z);
          } else {
            return $panic();
          }
        } else {
          _L: {
            if (r.$tag === 1) {
              const _Tree$2 = r;
              const _k3 = _Tree$2._0;
              const _v3 = _Tree$2._1;
              const _x = _Tree$2._3;
              if (_x.$tag === 1) {
                const _Tree$3 = _x;
                const _k2 = _Tree$3._0;
                const _v2 = _Tree$3._1;
                const _y1 = _Tree$3._3;
                const _y2 = _Tree$3._4;
                const _z = _Tree$2._4;
                return moonbitlang$core$immut$sorted_map$$make_tree$57$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$57$(key, value, l, _y1), moonbitlang$core$immut$sorted_map$$make_tree$57$(_k3, _v3, _y2, _z));
              } else {
                break _L;
              }
            } else {
              break _L;
            }
          }
          return $panic();
        }
      } else {
        return $panic();
      }
    } else {
      if (ln > (Math.imul(5, rn) | 0)) {
        if (l.$tag === 1) {
          const _Tree = l;
          const _ll = _Tree._3;
          const _lr = _Tree._4;
          const lln = moonbitlang$core$immut$sorted_map$$SortedMap$size$57$(_ll);
          const lrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$57$(_lr);
          if (lrn < lln) {
            if (l.$tag === 1) {
              const _Tree$2 = l;
              const _k1 = _Tree$2._0;
              const _v1 = _Tree$2._1;
              const _x = _Tree$2._3;
              const _y = _Tree$2._4;
              return moonbitlang$core$immut$sorted_map$$make_tree$57$(_k1, _v1, _x, moonbitlang$core$immut$sorted_map$$make_tree$57$(key, value, _y, r));
            } else {
              return $panic();
            }
          } else {
            _L: {
              if (l.$tag === 1) {
                const _Tree$2 = l;
                const _k1 = _Tree$2._0;
                const _v1 = _Tree$2._1;
                const _x = _Tree$2._3;
                const _x$2 = _Tree$2._4;
                if (_x$2.$tag === 1) {
                  const _Tree$3 = _x$2;
                  const _k2 = _Tree$3._0;
                  const _v2 = _Tree$3._1;
                  const _y1 = _Tree$3._3;
                  const _y2 = _Tree$3._4;
                  return moonbitlang$core$immut$sorted_map$$make_tree$57$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$57$(_k1, _v1, _x, _y1), moonbitlang$core$immut$sorted_map$$make_tree$57$(key, value, _y2, r));
                } else {
                  break _L;
                }
              } else {
                break _L;
              }
            }
            return $panic();
          }
        } else {
          return $panic();
        }
      } else {
        return moonbitlang$core$immut$sorted_map$$make_tree$57$(key, value, l, r);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$balance$58$(key, value, l, r) {
  const ln = moonbitlang$core$immut$sorted_map$$SortedMap$size$58$(l);
  const rn = moonbitlang$core$immut$sorted_map$$SortedMap$size$58$(r);
  if ((ln + rn | 0) < 2) {
    return moonbitlang$core$immut$sorted_map$$make_tree$58$(key, value, l, r);
  } else {
    if (rn > (Math.imul(5, ln) | 0)) {
      if (r.$tag === 1) {
        const _Tree = r;
        const _rl = _Tree._3;
        const _rr = _Tree._4;
        const rln = moonbitlang$core$immut$sorted_map$$SortedMap$size$58$(_rl);
        const rrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$58$(_rr);
        if (rln < rrn) {
          if (r.$tag === 1) {
            const _Tree$2 = r;
            const _k2 = _Tree$2._0;
            const _v2 = _Tree$2._1;
            const _y = _Tree$2._3;
            const _z = _Tree$2._4;
            return moonbitlang$core$immut$sorted_map$$make_tree$58$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$58$(key, value, l, _y), _z);
          } else {
            return $panic();
          }
        } else {
          _L: {
            if (r.$tag === 1) {
              const _Tree$2 = r;
              const _k3 = _Tree$2._0;
              const _v3 = _Tree$2._1;
              const _x = _Tree$2._3;
              if (_x.$tag === 1) {
                const _Tree$3 = _x;
                const _k2 = _Tree$3._0;
                const _v2 = _Tree$3._1;
                const _y1 = _Tree$3._3;
                const _y2 = _Tree$3._4;
                const _z = _Tree$2._4;
                return moonbitlang$core$immut$sorted_map$$make_tree$58$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$58$(key, value, l, _y1), moonbitlang$core$immut$sorted_map$$make_tree$58$(_k3, _v3, _y2, _z));
              } else {
                break _L;
              }
            } else {
              break _L;
            }
          }
          return $panic();
        }
      } else {
        return $panic();
      }
    } else {
      if (ln > (Math.imul(5, rn) | 0)) {
        if (l.$tag === 1) {
          const _Tree = l;
          const _ll = _Tree._3;
          const _lr = _Tree._4;
          const lln = moonbitlang$core$immut$sorted_map$$SortedMap$size$58$(_ll);
          const lrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$58$(_lr);
          if (lrn < lln) {
            if (l.$tag === 1) {
              const _Tree$2 = l;
              const _k1 = _Tree$2._0;
              const _v1 = _Tree$2._1;
              const _x = _Tree$2._3;
              const _y = _Tree$2._4;
              return moonbitlang$core$immut$sorted_map$$make_tree$58$(_k1, _v1, _x, moonbitlang$core$immut$sorted_map$$make_tree$58$(key, value, _y, r));
            } else {
              return $panic();
            }
          } else {
            _L: {
              if (l.$tag === 1) {
                const _Tree$2 = l;
                const _k1 = _Tree$2._0;
                const _v1 = _Tree$2._1;
                const _x = _Tree$2._3;
                const _x$2 = _Tree$2._4;
                if (_x$2.$tag === 1) {
                  const _Tree$3 = _x$2;
                  const _k2 = _Tree$3._0;
                  const _v2 = _Tree$3._1;
                  const _y1 = _Tree$3._3;
                  const _y2 = _Tree$3._4;
                  return moonbitlang$core$immut$sorted_map$$make_tree$58$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$58$(_k1, _v1, _x, _y1), moonbitlang$core$immut$sorted_map$$make_tree$58$(key, value, _y2, r));
                } else {
                  break _L;
                }
              } else {
                break _L;
              }
            }
            return $panic();
          }
        } else {
          return $panic();
        }
      } else {
        return moonbitlang$core$immut$sorted_map$$make_tree$58$(key, value, l, r);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$balance$59$(key, value, l, r) {
  const ln = moonbitlang$core$immut$sorted_map$$SortedMap$size$59$(l);
  const rn = moonbitlang$core$immut$sorted_map$$SortedMap$size$59$(r);
  if ((ln + rn | 0) < 2) {
    return moonbitlang$core$immut$sorted_map$$make_tree$59$(key, value, l, r);
  } else {
    if (rn > (Math.imul(5, ln) | 0)) {
      if (r.$tag === 1) {
        const _Tree = r;
        const _rl = _Tree._3;
        const _rr = _Tree._4;
        const rln = moonbitlang$core$immut$sorted_map$$SortedMap$size$59$(_rl);
        const rrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$59$(_rr);
        if (rln < rrn) {
          if (r.$tag === 1) {
            const _Tree$2 = r;
            const _k2 = _Tree$2._0;
            const _v2 = _Tree$2._1;
            const _y = _Tree$2._3;
            const _z = _Tree$2._4;
            return moonbitlang$core$immut$sorted_map$$make_tree$59$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$59$(key, value, l, _y), _z);
          } else {
            return $panic();
          }
        } else {
          _L: {
            if (r.$tag === 1) {
              const _Tree$2 = r;
              const _k3 = _Tree$2._0;
              const _v3 = _Tree$2._1;
              const _x = _Tree$2._3;
              if (_x.$tag === 1) {
                const _Tree$3 = _x;
                const _k2 = _Tree$3._0;
                const _v2 = _Tree$3._1;
                const _y1 = _Tree$3._3;
                const _y2 = _Tree$3._4;
                const _z = _Tree$2._4;
                return moonbitlang$core$immut$sorted_map$$make_tree$59$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$59$(key, value, l, _y1), moonbitlang$core$immut$sorted_map$$make_tree$59$(_k3, _v3, _y2, _z));
              } else {
                break _L;
              }
            } else {
              break _L;
            }
          }
          return $panic();
        }
      } else {
        return $panic();
      }
    } else {
      if (ln > (Math.imul(5, rn) | 0)) {
        if (l.$tag === 1) {
          const _Tree = l;
          const _ll = _Tree._3;
          const _lr = _Tree._4;
          const lln = moonbitlang$core$immut$sorted_map$$SortedMap$size$59$(_ll);
          const lrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$59$(_lr);
          if (lrn < lln) {
            if (l.$tag === 1) {
              const _Tree$2 = l;
              const _k1 = _Tree$2._0;
              const _v1 = _Tree$2._1;
              const _x = _Tree$2._3;
              const _y = _Tree$2._4;
              return moonbitlang$core$immut$sorted_map$$make_tree$59$(_k1, _v1, _x, moonbitlang$core$immut$sorted_map$$make_tree$59$(key, value, _y, r));
            } else {
              return $panic();
            }
          } else {
            _L: {
              if (l.$tag === 1) {
                const _Tree$2 = l;
                const _k1 = _Tree$2._0;
                const _v1 = _Tree$2._1;
                const _x = _Tree$2._3;
                const _x$2 = _Tree$2._4;
                if (_x$2.$tag === 1) {
                  const _Tree$3 = _x$2;
                  const _k2 = _Tree$3._0;
                  const _v2 = _Tree$3._1;
                  const _y1 = _Tree$3._3;
                  const _y2 = _Tree$3._4;
                  return moonbitlang$core$immut$sorted_map$$make_tree$59$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$59$(_k1, _v1, _x, _y1), moonbitlang$core$immut$sorted_map$$make_tree$59$(key, value, _y2, r));
                } else {
                  break _L;
                }
              } else {
                break _L;
              }
            }
            return $panic();
          }
        } else {
          return $panic();
        }
      } else {
        return moonbitlang$core$immut$sorted_map$$make_tree$59$(key, value, l, r);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$balance$60$(key, value, l, r) {
  const ln = moonbitlang$core$immut$sorted_map$$SortedMap$size$60$(l);
  const rn = moonbitlang$core$immut$sorted_map$$SortedMap$size$60$(r);
  if ((ln + rn | 0) < 2) {
    return moonbitlang$core$immut$sorted_map$$make_tree$60$(key, value, l, r);
  } else {
    if (rn > (Math.imul(5, ln) | 0)) {
      if (r.$tag === 1) {
        const _Tree = r;
        const _rl = _Tree._3;
        const _rr = _Tree._4;
        const rln = moonbitlang$core$immut$sorted_map$$SortedMap$size$60$(_rl);
        const rrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$60$(_rr);
        if (rln < rrn) {
          if (r.$tag === 1) {
            const _Tree$2 = r;
            const _k2 = _Tree$2._0;
            const _v2 = _Tree$2._1;
            const _y = _Tree$2._3;
            const _z = _Tree$2._4;
            return moonbitlang$core$immut$sorted_map$$make_tree$60$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$60$(key, value, l, _y), _z);
          } else {
            return $panic();
          }
        } else {
          _L: {
            if (r.$tag === 1) {
              const _Tree$2 = r;
              const _k3 = _Tree$2._0;
              const _v3 = _Tree$2._1;
              const _x = _Tree$2._3;
              if (_x.$tag === 1) {
                const _Tree$3 = _x;
                const _k2 = _Tree$3._0;
                const _v2 = _Tree$3._1;
                const _y1 = _Tree$3._3;
                const _y2 = _Tree$3._4;
                const _z = _Tree$2._4;
                return moonbitlang$core$immut$sorted_map$$make_tree$60$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$60$(key, value, l, _y1), moonbitlang$core$immut$sorted_map$$make_tree$60$(_k3, _v3, _y2, _z));
              } else {
                break _L;
              }
            } else {
              break _L;
            }
          }
          return $panic();
        }
      } else {
        return $panic();
      }
    } else {
      if (ln > (Math.imul(5, rn) | 0)) {
        if (l.$tag === 1) {
          const _Tree = l;
          const _ll = _Tree._3;
          const _lr = _Tree._4;
          const lln = moonbitlang$core$immut$sorted_map$$SortedMap$size$60$(_ll);
          const lrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$60$(_lr);
          if (lrn < lln) {
            if (l.$tag === 1) {
              const _Tree$2 = l;
              const _k1 = _Tree$2._0;
              const _v1 = _Tree$2._1;
              const _x = _Tree$2._3;
              const _y = _Tree$2._4;
              return moonbitlang$core$immut$sorted_map$$make_tree$60$(_k1, _v1, _x, moonbitlang$core$immut$sorted_map$$make_tree$60$(key, value, _y, r));
            } else {
              return $panic();
            }
          } else {
            _L: {
              if (l.$tag === 1) {
                const _Tree$2 = l;
                const _k1 = _Tree$2._0;
                const _v1 = _Tree$2._1;
                const _x = _Tree$2._3;
                const _x$2 = _Tree$2._4;
                if (_x$2.$tag === 1) {
                  const _Tree$3 = _x$2;
                  const _k2 = _Tree$3._0;
                  const _v2 = _Tree$3._1;
                  const _y1 = _Tree$3._3;
                  const _y2 = _Tree$3._4;
                  return moonbitlang$core$immut$sorted_map$$make_tree$60$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$60$(_k1, _v1, _x, _y1), moonbitlang$core$immut$sorted_map$$make_tree$60$(key, value, _y2, r));
                } else {
                  break _L;
                }
              } else {
                break _L;
              }
            }
            return $panic();
          }
        } else {
          return $panic();
        }
      } else {
        return moonbitlang$core$immut$sorted_map$$make_tree$60$(key, value, l, r);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$balance$61$(key, value, l, r) {
  const ln = moonbitlang$core$immut$sorted_map$$SortedMap$size$61$(l);
  const rn = moonbitlang$core$immut$sorted_map$$SortedMap$size$61$(r);
  if ((ln + rn | 0) < 2) {
    return moonbitlang$core$immut$sorted_map$$make_tree$61$(key, value, l, r);
  } else {
    if (rn > (Math.imul(5, ln) | 0)) {
      if (r.$tag === 1) {
        const _Tree = r;
        const _rl = _Tree._3;
        const _rr = _Tree._4;
        const rln = moonbitlang$core$immut$sorted_map$$SortedMap$size$61$(_rl);
        const rrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$61$(_rr);
        if (rln < rrn) {
          if (r.$tag === 1) {
            const _Tree$2 = r;
            const _k2 = _Tree$2._0;
            const _v2 = _Tree$2._1;
            const _y = _Tree$2._3;
            const _z = _Tree$2._4;
            return moonbitlang$core$immut$sorted_map$$make_tree$61$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$61$(key, value, l, _y), _z);
          } else {
            return $panic();
          }
        } else {
          _L: {
            if (r.$tag === 1) {
              const _Tree$2 = r;
              const _k3 = _Tree$2._0;
              const _v3 = _Tree$2._1;
              const _x = _Tree$2._3;
              if (_x.$tag === 1) {
                const _Tree$3 = _x;
                const _k2 = _Tree$3._0;
                const _v2 = _Tree$3._1;
                const _y1 = _Tree$3._3;
                const _y2 = _Tree$3._4;
                const _z = _Tree$2._4;
                return moonbitlang$core$immut$sorted_map$$make_tree$61$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$61$(key, value, l, _y1), moonbitlang$core$immut$sorted_map$$make_tree$61$(_k3, _v3, _y2, _z));
              } else {
                break _L;
              }
            } else {
              break _L;
            }
          }
          return $panic();
        }
      } else {
        return $panic();
      }
    } else {
      if (ln > (Math.imul(5, rn) | 0)) {
        if (l.$tag === 1) {
          const _Tree = l;
          const _ll = _Tree._3;
          const _lr = _Tree._4;
          const lln = moonbitlang$core$immut$sorted_map$$SortedMap$size$61$(_ll);
          const lrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$61$(_lr);
          if (lrn < lln) {
            if (l.$tag === 1) {
              const _Tree$2 = l;
              const _k1 = _Tree$2._0;
              const _v1 = _Tree$2._1;
              const _x = _Tree$2._3;
              const _y = _Tree$2._4;
              return moonbitlang$core$immut$sorted_map$$make_tree$61$(_k1, _v1, _x, moonbitlang$core$immut$sorted_map$$make_tree$61$(key, value, _y, r));
            } else {
              return $panic();
            }
          } else {
            _L: {
              if (l.$tag === 1) {
                const _Tree$2 = l;
                const _k1 = _Tree$2._0;
                const _v1 = _Tree$2._1;
                const _x = _Tree$2._3;
                const _x$2 = _Tree$2._4;
                if (_x$2.$tag === 1) {
                  const _Tree$3 = _x$2;
                  const _k2 = _Tree$3._0;
                  const _v2 = _Tree$3._1;
                  const _y1 = _Tree$3._3;
                  const _y2 = _Tree$3._4;
                  return moonbitlang$core$immut$sorted_map$$make_tree$61$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$61$(_k1, _v1, _x, _y1), moonbitlang$core$immut$sorted_map$$make_tree$61$(key, value, _y2, r));
                } else {
                  break _L;
                }
              } else {
                break _L;
              }
            }
            return $panic();
          }
        } else {
          return $panic();
        }
      } else {
        return moonbitlang$core$immut$sorted_map$$make_tree$61$(key, value, l, r);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$balance$62$(key, value, l, r) {
  const ln = moonbitlang$core$immut$sorted_map$$SortedMap$size$62$(l);
  const rn = moonbitlang$core$immut$sorted_map$$SortedMap$size$62$(r);
  if ((ln + rn | 0) < 2) {
    return moonbitlang$core$immut$sorted_map$$make_tree$62$(key, value, l, r);
  } else {
    if (rn > (Math.imul(5, ln) | 0)) {
      if (r.$tag === 1) {
        const _Tree = r;
        const _rl = _Tree._3;
        const _rr = _Tree._4;
        const rln = moonbitlang$core$immut$sorted_map$$SortedMap$size$62$(_rl);
        const rrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$62$(_rr);
        if (rln < rrn) {
          if (r.$tag === 1) {
            const _Tree$2 = r;
            const _k2 = _Tree$2._0;
            const _v2 = _Tree$2._1;
            const _y = _Tree$2._3;
            const _z = _Tree$2._4;
            return moonbitlang$core$immut$sorted_map$$make_tree$62$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$62$(key, value, l, _y), _z);
          } else {
            return $panic();
          }
        } else {
          _L: {
            if (r.$tag === 1) {
              const _Tree$2 = r;
              const _k3 = _Tree$2._0;
              const _v3 = _Tree$2._1;
              const _x = _Tree$2._3;
              if (_x.$tag === 1) {
                const _Tree$3 = _x;
                const _k2 = _Tree$3._0;
                const _v2 = _Tree$3._1;
                const _y1 = _Tree$3._3;
                const _y2 = _Tree$3._4;
                const _z = _Tree$2._4;
                return moonbitlang$core$immut$sorted_map$$make_tree$62$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$62$(key, value, l, _y1), moonbitlang$core$immut$sorted_map$$make_tree$62$(_k3, _v3, _y2, _z));
              } else {
                break _L;
              }
            } else {
              break _L;
            }
          }
          return $panic();
        }
      } else {
        return $panic();
      }
    } else {
      if (ln > (Math.imul(5, rn) | 0)) {
        if (l.$tag === 1) {
          const _Tree = l;
          const _ll = _Tree._3;
          const _lr = _Tree._4;
          const lln = moonbitlang$core$immut$sorted_map$$SortedMap$size$62$(_ll);
          const lrn = moonbitlang$core$immut$sorted_map$$SortedMap$size$62$(_lr);
          if (lrn < lln) {
            if (l.$tag === 1) {
              const _Tree$2 = l;
              const _k1 = _Tree$2._0;
              const _v1 = _Tree$2._1;
              const _x = _Tree$2._3;
              const _y = _Tree$2._4;
              return moonbitlang$core$immut$sorted_map$$make_tree$62$(_k1, _v1, _x, moonbitlang$core$immut$sorted_map$$make_tree$62$(key, value, _y, r));
            } else {
              return $panic();
            }
          } else {
            _L: {
              if (l.$tag === 1) {
                const _Tree$2 = l;
                const _k1 = _Tree$2._0;
                const _v1 = _Tree$2._1;
                const _x = _Tree$2._3;
                const _x$2 = _Tree$2._4;
                if (_x$2.$tag === 1) {
                  const _Tree$3 = _x$2;
                  const _k2 = _Tree$3._0;
                  const _v2 = _Tree$3._1;
                  const _y1 = _Tree$3._3;
                  const _y2 = _Tree$3._4;
                  return moonbitlang$core$immut$sorted_map$$make_tree$62$(_k2, _v2, moonbitlang$core$immut$sorted_map$$make_tree$62$(_k1, _v1, _x, _y1), moonbitlang$core$immut$sorted_map$$make_tree$62$(key, value, _y2, r));
                } else {
                  break _L;
                }
              } else {
                break _L;
              }
            }
            return $panic();
          }
        } else {
          return $panic();
        }
      } else {
        return moonbitlang$core$immut$sorted_map$$make_tree$62$(key, value, l, r);
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$add$54$(self, key, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$15$(key, value, 1, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$15$, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$15$);
  } else {
    const _Tree = self;
    const _k = _Tree._0;
    const _v = _Tree._1;
    const _l = _Tree._3;
    const _r = _Tree._4;
    const c = $compare_int(key, _k);
    return c === 0 ? moonbitlang$core$immut$sorted_map$$make_tree$54$(_k, value, _l, _r) : c < 0 ? moonbitlang$core$immut$sorted_map$$balance$54$(_k, _v, moonbitlang$core$immut$sorted_map$$SortedMap$add$54$(_l, key, value), _r) : moonbitlang$core$immut$sorted_map$$balance$54$(_k, _v, _l, moonbitlang$core$immut$sorted_map$$SortedMap$add$54$(_r, key, value));
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$add$55$(self, key, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$16$(key, value, 1, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$16$, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$16$);
  } else {
    const _Tree = self;
    const _k = _Tree._0;
    const _v = _Tree._1;
    const _l = _Tree._3;
    const _r = _Tree._4;
    const c = $compare_int(key, _k);
    return c === 0 ? moonbitlang$core$immut$sorted_map$$make_tree$55$(_k, value, _l, _r) : c < 0 ? moonbitlang$core$immut$sorted_map$$balance$55$(_k, _v, moonbitlang$core$immut$sorted_map$$SortedMap$add$55$(_l, key, value), _r) : moonbitlang$core$immut$sorted_map$$balance$55$(_k, _v, _l, moonbitlang$core$immut$sorted_map$$SortedMap$add$55$(_r, key, value));
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$add$56$(self, key, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$17$(key, value, 1, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$17$, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$17$);
  } else {
    const _Tree = self;
    const _k = _Tree._0;
    const _v = _Tree._1;
    const _l = _Tree._3;
    const _r = _Tree._4;
    const c = moonbitlang$core$builtin$$Compare$compare$29$(key, _k);
    return c === 0 ? moonbitlang$core$immut$sorted_map$$make_tree$56$(_k, value, _l, _r) : c < 0 ? moonbitlang$core$immut$sorted_map$$balance$56$(_k, _v, moonbitlang$core$immut$sorted_map$$SortedMap$add$56$(_l, key, value), _r) : moonbitlang$core$immut$sorted_map$$balance$56$(_k, _v, _l, moonbitlang$core$immut$sorted_map$$SortedMap$add$56$(_r, key, value));
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$add$57$(self, key, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$18$(key, value, 1, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$18$, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$18$);
  } else {
    const _Tree = self;
    const _k = _Tree._0;
    const _v = _Tree._1;
    const _l = _Tree._3;
    const _r = _Tree._4;
    const c = $compare_int(key.id, _k.id);
    return c === 0 ? moonbitlang$core$immut$sorted_map$$make_tree$57$(_k, value, _l, _r) : c < 0 ? moonbitlang$core$immut$sorted_map$$balance$57$(_k, _v, moonbitlang$core$immut$sorted_map$$SortedMap$add$57$(_l, key, value), _r) : moonbitlang$core$immut$sorted_map$$balance$57$(_k, _v, _l, moonbitlang$core$immut$sorted_map$$SortedMap$add$57$(_r, key, value));
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$add$58$(self, key, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$19$(key, value, 1, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$19$, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$19$);
  } else {
    const _Tree = self;
    const _k = _Tree._0;
    const _v = _Tree._1;
    const _l = _Tree._3;
    const _r = _Tree._4;
    const c = $compare_int(key, _k);
    return c === 0 ? moonbitlang$core$immut$sorted_map$$make_tree$58$(_k, value, _l, _r) : c < 0 ? moonbitlang$core$immut$sorted_map$$balance$58$(_k, _v, moonbitlang$core$immut$sorted_map$$SortedMap$add$58$(_l, key, value), _r) : moonbitlang$core$immut$sorted_map$$balance$58$(_k, _v, _l, moonbitlang$core$immut$sorted_map$$SortedMap$add$58$(_r, key, value));
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$add$59$(self, key, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$20$(key, value, 1, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$20$, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$20$);
  } else {
    const _Tree = self;
    const _k = _Tree._0;
    const _v = _Tree._1;
    const _l = _Tree._3;
    const _r = _Tree._4;
    const c = $compare_int(key.num, _k.num);
    return c === 0 ? moonbitlang$core$immut$sorted_map$$make_tree$59$(_k, value, _l, _r) : c < 0 ? moonbitlang$core$immut$sorted_map$$balance$59$(_k, _v, moonbitlang$core$immut$sorted_map$$SortedMap$add$59$(_l, key, value), _r) : moonbitlang$core$immut$sorted_map$$balance$59$(_k, _v, _l, moonbitlang$core$immut$sorted_map$$SortedMap$add$59$(_r, key, value));
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$add$60$(self, key, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$21$(key, value, 1, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$21$, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$21$);
  } else {
    const _Tree = self;
    const _k = _Tree._0;
    const _v = _Tree._1;
    const _l = _Tree._3;
    const _r = _Tree._4;
    const c = moonbitlang$core$builtin$$Compare$compare$2$(key, _k);
    return c === 0 ? moonbitlang$core$immut$sorted_map$$make_tree$60$(_k, value, _l, _r) : c < 0 ? moonbitlang$core$immut$sorted_map$$balance$60$(_k, _v, moonbitlang$core$immut$sorted_map$$SortedMap$add$60$(_l, key, value), _r) : moonbitlang$core$immut$sorted_map$$balance$60$(_k, _v, _l, moonbitlang$core$immut$sorted_map$$SortedMap$add$60$(_r, key, value));
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$add$61$(self, key, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$22$(key, value, 1, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$22$, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$22$);
  } else {
    const _Tree = self;
    const _k = _Tree._0;
    const _v = _Tree._1;
    const _l = _Tree._3;
    const _r = _Tree._4;
    const c = moonbitlang$core$builtin$$Compare$compare$63$(key, _k);
    return c === 0 ? moonbitlang$core$immut$sorted_map$$make_tree$61$(_k, value, _l, _r) : c < 0 ? moonbitlang$core$immut$sorted_map$$balance$61$(_k, _v, moonbitlang$core$immut$sorted_map$$SortedMap$add$61$(_l, key, value), _r) : moonbitlang$core$immut$sorted_map$$balance$61$(_k, _v, _l, moonbitlang$core$immut$sorted_map$$SortedMap$add$61$(_r, key, value));
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$add$62$(self, key, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Tree$14$(key, value, 1, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$14$, $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$14$);
  } else {
    const _Tree = self;
    const _k = _Tree._0;
    const _v = _Tree._1;
    const _l = _Tree._3;
    const _r = _Tree._4;
    const c = moonbitlang$core$builtin$$Compare$compare$2$(key, _k);
    return c === 0 ? moonbitlang$core$immut$sorted_map$$make_tree$62$(_k, value, _l, _r) : c < 0 ? moonbitlang$core$immut$sorted_map$$balance$62$(_k, _v, moonbitlang$core$immut$sorted_map$$SortedMap$add$62$(_l, key, value), _r) : moonbitlang$core$immut$sorted_map$$balance$62$(_k, _v, _l, moonbitlang$core$immut$sorted_map$$SortedMap$add$62$(_r, key, value));
  }
}
function moonbitlang$core$immut$sorted_map$$iter$46$go$47$2008(yield_, t) {
  let _tmp = t;
  while (true) {
    const t$2 = _tmp;
    if (t$2.$tag === 0) {
      return 1;
    } else {
      const _Tree = t$2;
      const _k = _Tree._0;
      const _value = _Tree._1;
      const _l = _Tree._3;
      const _r = _Tree._4;
      const _bind = moonbitlang$core$immut$sorted_map$$iter$46$go$47$2008(yield_, _l);
      if (_bind === 0) {
        return 0;
      } else {
        const _bind$2 = yield_({ _0: _k, _1: _value });
        if (_bind$2 === 0) {
          return 0;
        } else {
          _tmp = _r;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$iter$60$(self) {
  const _p = (yield_) => moonbitlang$core$immut$sorted_map$$iter$46$go$47$2008(yield_, self);
  return _p;
}
function moonbitlang$core$immut$sorted_map$$iter$46$go$47$2022(yield_, t) {
  let _tmp = t;
  while (true) {
    const t$2 = _tmp;
    if (t$2.$tag === 0) {
      return 1;
    } else {
      const _Tree = t$2;
      const _k = _Tree._0;
      const _value = _Tree._1;
      const _l = _Tree._3;
      const _r = _Tree._4;
      const _bind = moonbitlang$core$immut$sorted_map$$iter$46$go$47$2022(yield_, _l);
      if (_bind === 0) {
        return 0;
      } else {
        const _bind$2 = yield_({ _0: _k, _1: _value });
        if (_bind$2 === 0) {
          return 0;
        } else {
          _tmp = _r;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$iter$58$(self) {
  const _p = (yield_) => moonbitlang$core$immut$sorted_map$$iter$46$go$47$2022(yield_, self);
  return _p;
}
function moonbitlang$core$immut$sorted_map$$iter2$46$go$47$2036(yield_, t) {
  let _tmp = t;
  while (true) {
    const t$2 = _tmp;
    if (t$2.$tag === 0) {
      return 1;
    } else {
      const _Tree = t$2;
      const _k = _Tree._0;
      const _value = _Tree._1;
      const _l = _Tree._3;
      const _r = _Tree._4;
      const _bind = moonbitlang$core$immut$sorted_map$$iter2$46$go$47$2036(yield_, _l);
      if (_bind === 0) {
        return 0;
      } else {
        const _bind$2 = yield_(_k, _value);
        if (_bind$2 === 0) {
          return 0;
        } else {
          _tmp = _r;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$iter2$55$(self) {
  const _p = (yield_) => moonbitlang$core$immut$sorted_map$$iter2$46$go$47$2036(yield_, self);
  return _p;
}
function moonbitlang$core$immut$sorted_map$$iter2$46$go$47$2050(yield_, t) {
  let _tmp = t;
  while (true) {
    const t$2 = _tmp;
    if (t$2.$tag === 0) {
      return 1;
    } else {
      const _Tree = t$2;
      const _k = _Tree._0;
      const _value = _Tree._1;
      const _l = _Tree._3;
      const _r = _Tree._4;
      const _bind = moonbitlang$core$immut$sorted_map$$iter2$46$go$47$2050(yield_, _l);
      if (_bind === 0) {
        return 0;
      } else {
        const _bind$2 = yield_(_k, _value);
        if (_bind$2 === 0) {
          return 0;
        } else {
          _tmp = _r;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$iter2$56$(self) {
  const _p = (yield_) => moonbitlang$core$immut$sorted_map$$iter2$46$go$47$2050(yield_, self);
  return _p;
}
function moonbitlang$core$immut$sorted_map$$iter2$46$go$47$2064(yield_, t) {
  let _tmp = t;
  while (true) {
    const t$2 = _tmp;
    if (t$2.$tag === 0) {
      return 1;
    } else {
      const _Tree = t$2;
      const _k = _Tree._0;
      const _value = _Tree._1;
      const _l = _Tree._3;
      const _r = _Tree._4;
      const _bind = moonbitlang$core$immut$sorted_map$$iter2$46$go$47$2064(yield_, _l);
      if (_bind === 0) {
        return 0;
      } else {
        const _bind$2 = yield_(_k, _value);
        if (_bind$2 === 0) {
          return 0;
        } else {
          _tmp = _r;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$immut$sorted_map$$SortedMap$iter2$58$(self) {
  const _p = (yield_) => moonbitlang$core$immut$sorted_map$$iter2$46$go$47$2064(yield_, self);
  return _p;
}
function moonbitlang$core$immut$sorted_map$$from_iter$60$(iter) {
  const _bind = $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$21$;
  const _acc = { val: _bind };
  iter((_p) => {
    const m = _acc.val;
    _acc.val = moonbitlang$core$immut$sorted_map$$SortedMap$add$60$(m, _p._0, _p._1);
    return 1;
  });
  return _acc.val;
}
function moonbitlang$core$immut$sorted_map$$SortedMap$keys_as_iter$58$(self) {
  const _bind = moonbitlang$core$immut$sorted_map$$SortedMap$iter$58$(self);
  return (_p) => _bind((_p$2) => _p(_p$2._0));
}
function moonbitlang$core$immut$sorted_map$$InorderIterator$move_left$55$(self, node) {
  let _tmp = node;
  while (true) {
    const _param = _tmp;
    if (_param.$tag === 0) {
      return;
    } else {
      const _Tree = _param;
      const _left = _Tree._3;
      const _self = self;
      moonbitlang$core$array$$Array$push$65$(_self, _Tree);
      _tmp = _left;
      continue;
    }
  }
}
function moonbitlang$core$immut$sorted_map$$InorderIterator$move_left$58$(self, node) {
  let _tmp = node;
  while (true) {
    const _param = _tmp;
    if (_param.$tag === 0) {
      return;
    } else {
      const _Tree = _param;
      const _left = _Tree._3;
      const _self = self;
      moonbitlang$core$array$$Array$push$66$(_self, _Tree);
      _tmp = _left;
      continue;
    }
  }
}
function moonbitlang$core$immut$sorted_map$$InorderIterator$new$55$(root) {
  const it = [];
  moonbitlang$core$immut$sorted_map$$InorderIterator$move_left$55$(it, root);
  return it;
}
function moonbitlang$core$immut$sorted_map$$InorderIterator$new$58$(root) {
  const it = [];
  moonbitlang$core$immut$sorted_map$$InorderIterator$move_left$58$(it, root);
  return it;
}
function moonbitlang$core$immut$sorted_map$$InorderIterator$next$55$(self) {
  const _s = self;
  const _bind = moonbitlang$core$array$$Array$pop$65$(_s);
  if (_bind === undefined) {
    return undefined;
  } else {
    const _Some = _bind;
    const _curr = _Some;
    if (_curr.$tag === 1) {
      const _Tree = _curr;
      const _key = _Tree._0;
      const _right = _Tree._4;
      const _value = _Tree._1;
      moonbitlang$core$immut$sorted_map$$InorderIterator$move_left$55$(self, _right);
      return { _0: _key, _1: _value };
    } else {
      return $panic();
    }
  }
}
function moonbitlang$core$immut$sorted_map$$InorderIterator$next$58$(self) {
  const _s = self;
  const _bind = moonbitlang$core$array$$Array$pop$66$(_s);
  if (_bind === undefined) {
    return undefined;
  } else {
    const _Some = _bind;
    const _curr = _Some;
    if (_curr.$tag === 1) {
      const _Tree = _curr;
      const _key = _Tree._0;
      const _right = _Tree._4;
      const _value = _Tree._1;
      moonbitlang$core$immut$sorted_map$$InorderIterator$move_left$58$(self, _right);
      return { _0: _key, _1: _value };
    } else {
      return $panic();
    }
  }
}
function moonbitlang$core$builtin$$Eq$equal$67$(self, other) {
  const iter = moonbitlang$core$immut$sorted_map$$InorderIterator$new$55$(self);
  const iter1 = moonbitlang$core$immut$sorted_map$$InorderIterator$new$55$(other);
  let _tmp = moonbitlang$core$immut$sorted_map$$InorderIterator$next$55$(iter);
  let _tmp$2 = moonbitlang$core$immut$sorted_map$$InorderIterator$next$55$(iter1);
  while (true) {
    const _param_0 = _tmp;
    const _param_1 = _tmp$2;
    if (_param_0 === undefined) {
      return _param_1 === undefined;
    } else {
      const _Some = _param_0;
      const _a = _Some;
      if (_param_1 === undefined) {
        return false;
      } else {
        const _Some$2 = _param_1;
        const _b = _Some$2;
        if (moonbitlang$core$builtin$$Eq$equal$68$(_a, _b)) {
          _tmp = moonbitlang$core$immut$sorted_map$$InorderIterator$next$55$(iter);
          _tmp$2 = moonbitlang$core$immut$sorted_map$$InorderIterator$next$55$(iter1);
          continue;
        } else {
          return false;
        }
      }
    }
  }
}
function moonbitlang$core$builtin$$Eq$equal$69$(self, other) {
  const iter = moonbitlang$core$immut$sorted_map$$InorderIterator$new$58$(self);
  const iter1 = moonbitlang$core$immut$sorted_map$$InorderIterator$new$58$(other);
  let _tmp = moonbitlang$core$immut$sorted_map$$InorderIterator$next$58$(iter);
  let _tmp$2 = moonbitlang$core$immut$sorted_map$$InorderIterator$next$58$(iter1);
  while (true) {
    const _param_0 = _tmp;
    const _param_1 = _tmp$2;
    if (_param_0 === undefined) {
      return _param_1 === undefined;
    } else {
      const _Some = _param_0;
      const _a = _Some;
      if (_param_1 === undefined) {
        return false;
      } else {
        const _Some$2 = _param_1;
        const _b = _Some$2;
        if (_a._0 === _b._0 && _a._1 === _b._1) {
          _tmp = moonbitlang$core$immut$sorted_map$$InorderIterator$next$58$(iter);
          _tmp$2 = moonbitlang$core$immut$sorted_map$$InorderIterator$next$58$(iter1);
          continue;
        } else {
          return false;
        }
      }
    }
  }
}
function moonbitlang$core$builtin$$Compare$compare$67$(self, other) {
  const iter = moonbitlang$core$immut$sorted_map$$InorderIterator$new$55$(self);
  const iter1 = moonbitlang$core$immut$sorted_map$$InorderIterator$new$55$(other);
  let _tmp = moonbitlang$core$immut$sorted_map$$InorderIterator$next$55$(iter);
  let _tmp$2 = moonbitlang$core$immut$sorted_map$$InorderIterator$next$55$(iter1);
  while (true) {
    const _param_0 = _tmp;
    const _param_1 = _tmp$2;
    if (_param_0 === undefined) {
      return _param_1 === undefined ? 0 : -1;
    } else {
      const _Some = _param_0;
      const _a = _Some;
      if (_param_1 === undefined) {
        return 1;
      } else {
        const _Some$2 = _param_1;
        const _b = _Some$2;
        const cmp = moonbitlang$core$builtin$$Compare$compare$68$(_a, _b);
        if (cmp === 0) {
          _tmp = moonbitlang$core$immut$sorted_map$$InorderIterator$next$55$(iter);
          _tmp$2 = moonbitlang$core$immut$sorted_map$$InorderIterator$next$55$(iter1);
          continue;
        } else {
          return cmp;
        }
      }
    }
  }
}
function moonbitlang$core$builtin$$Compare$compare$69$(self, other) {
  const iter = moonbitlang$core$immut$sorted_map$$InorderIterator$new$58$(self);
  const iter1 = moonbitlang$core$immut$sorted_map$$InorderIterator$new$58$(other);
  let _tmp = moonbitlang$core$immut$sorted_map$$InorderIterator$next$58$(iter);
  let _tmp$2 = moonbitlang$core$immut$sorted_map$$InorderIterator$next$58$(iter1);
  while (true) {
    const _param_0 = _tmp;
    const _param_1 = _tmp$2;
    if (_param_0 === undefined) {
      return _param_1 === undefined ? 0 : -1;
    } else {
      const _Some = _param_0;
      const _a = _Some;
      if (_param_1 === undefined) {
        return 1;
      } else {
        const _Some$2 = _param_1;
        const _b = _Some$2;
        const _p = $compare_int(_a._0, _b._0);
        const cmp = _p === 0 ? $compare_int(_a._1, _b._1) : _p;
        if (cmp === 0) {
          _tmp = moonbitlang$core$immut$sorted_map$$InorderIterator$next$58$(iter);
          _tmp$2 = moonbitlang$core$immut$sorted_map$$InorderIterator$next$58$(iter1);
          continue;
        } else {
          return cmp;
        }
      }
    }
  }
}
function moonbitlang$core$builtin$$Hash$hash_combine$69$(self, hasher) {
  const _bind = moonbitlang$core$immut$sorted_map$$SortedMap$iter$58$(self);
  _bind((e) => {
    moonbitlang$core$builtin$$Hasher$combine$4$(hasher, e._0);
    moonbitlang$core$builtin$$Hasher$combine$4$(hasher, e._1);
    return 1;
  });
}
function moonbitlang$core$option$$Option$unwrap_or_else$70$(self, default_) {
  if (self === undefined) {
    return default_();
  } else {
    const _Some = self;
    const _t = _Some;
    return _t;
  }
}
function moonbitlang$core$sorted_map$$new_node$71$(key, value) {
  return { key: key, value: value, left: undefined, right: undefined, height: 1 };
}
function moonbitlang$core$sorted_map$$new_node$72$(key, value) {
  return { key: key, value: value, left: undefined, right: undefined, height: 1 };
}
function moonbitlang$core$builtin$$Eq$equal$73$(self, other) {
  return moonbitlang$core$builtin$$Eq$equal$67$(self.key, other.key);
}
function moonbitlang$core$sorted_map$$height_ge$71$(x1, x2) {
  if (x2 === undefined) {
    return true;
  } else {
    const _Some = x2;
    const _n2 = _Some;
    if (x1 === undefined) {
      return false;
    } else {
      const _Some$2 = x1;
      const _n1 = _Some$2;
      return _n1.height >= _n2.height;
    }
  }
}
function moonbitlang$core$sorted_map$$height_ge$72$(x1, x2) {
  if (x2 === undefined) {
    return true;
  } else {
    const _Some = x2;
    const _n2 = _Some;
    if (x1 === undefined) {
      return false;
    } else {
      const _Some$2 = x1;
      const _n1 = _Some$2;
      return _n1.height >= _n2.height;
    }
  }
}
function moonbitlang$core$sorted_map$$Node$update_height$71$(self) {
  const _p = self.left;
  let _p$2;
  if (_p === undefined) {
    _p$2 = 0;
  } else {
    const _p$3 = _p;
    const _p$4 = _p$3;
    _p$2 = _p$4.height;
  }
  const _p$3 = self.right;
  let _p$4;
  if (_p$3 === undefined) {
    _p$4 = 0;
  } else {
    const _p$5 = _p$3;
    const _p$6 = _p$5;
    _p$4 = _p$6.height;
  }
  self.height = 1 + (_p$2 > _p$4 ? _p$2 : _p$4) | 0;
}
function moonbitlang$core$sorted_map$$Node$update_height$72$(self) {
  const _p = self.left;
  let _p$2;
  if (_p === undefined) {
    _p$2 = 0;
  } else {
    const _p$3 = _p;
    const _p$4 = _p$3;
    _p$2 = _p$4.height;
  }
  const _p$3 = self.right;
  let _p$4;
  if (_p$3 === undefined) {
    _p$4 = 0;
  } else {
    const _p$5 = _p$3;
    const _p$6 = _p$5;
    _p$4 = _p$6.height;
  }
  self.height = 1 + (_p$2 > _p$4 ? _p$2 : _p$4) | 0;
}
function moonbitlang$core$sorted_map$$rotate_l$71$(n) {
  const _p = n.right;
  let r;
  if (_p === undefined) {
    r = $panic();
  } else {
    const _p$2 = _p;
    r = _p$2;
  }
  n.right = r.left;
  r.left = n;
  moonbitlang$core$sorted_map$$Node$update_height$71$(n);
  moonbitlang$core$sorted_map$$Node$update_height$71$(r);
  return r;
}
function moonbitlang$core$sorted_map$$rotate_l$72$(n) {
  const _p = n.right;
  let r;
  if (_p === undefined) {
    r = $panic();
  } else {
    const _p$2 = _p;
    r = _p$2;
  }
  n.right = r.left;
  r.left = n;
  moonbitlang$core$sorted_map$$Node$update_height$72$(n);
  moonbitlang$core$sorted_map$$Node$update_height$72$(r);
  return r;
}
function moonbitlang$core$sorted_map$$rotate_r$71$(n) {
  const _p = n.left;
  let l;
  if (_p === undefined) {
    l = $panic();
  } else {
    const _p$2 = _p;
    l = _p$2;
  }
  n.left = l.right;
  l.right = n;
  moonbitlang$core$sorted_map$$Node$update_height$71$(n);
  moonbitlang$core$sorted_map$$Node$update_height$71$(l);
  return l;
}
function moonbitlang$core$sorted_map$$rotate_r$72$(n) {
  const _p = n.left;
  let l;
  if (_p === undefined) {
    l = $panic();
  } else {
    const _p$2 = _p;
    l = _p$2;
  }
  n.left = l.right;
  l.right = n;
  moonbitlang$core$sorted_map$$Node$update_height$72$(n);
  moonbitlang$core$sorted_map$$Node$update_height$72$(l);
  return l;
}
function moonbitlang$core$sorted_map$$rotate_lr$71$(n) {
  const _p = n.left;
  let l;
  if (_p === undefined) {
    l = $panic();
  } else {
    const _p$2 = _p;
    l = _p$2;
  }
  const v = moonbitlang$core$sorted_map$$rotate_l$71$(l);
  n.left = v;
  return moonbitlang$core$sorted_map$$rotate_r$71$(n);
}
function moonbitlang$core$sorted_map$$rotate_lr$72$(n) {
  const _p = n.left;
  let l;
  if (_p === undefined) {
    l = $panic();
  } else {
    const _p$2 = _p;
    l = _p$2;
  }
  const v = moonbitlang$core$sorted_map$$rotate_l$72$(l);
  n.left = v;
  return moonbitlang$core$sorted_map$$rotate_r$72$(n);
}
function moonbitlang$core$sorted_map$$rotate_rl$71$(n) {
  const _p = n.right;
  let r;
  if (_p === undefined) {
    r = $panic();
  } else {
    const _p$2 = _p;
    r = _p$2;
  }
  const v = moonbitlang$core$sorted_map$$rotate_r$71$(r);
  n.right = v;
  return moonbitlang$core$sorted_map$$rotate_l$71$(n);
}
function moonbitlang$core$sorted_map$$rotate_rl$72$(n) {
  const _p = n.right;
  let r;
  if (_p === undefined) {
    r = $panic();
  } else {
    const _p$2 = _p;
    r = _p$2;
  }
  const v = moonbitlang$core$sorted_map$$rotate_r$72$(r);
  n.right = v;
  return moonbitlang$core$sorted_map$$rotate_l$72$(n);
}
function moonbitlang$core$sorted_map$$balance$71$(root) {
  const l = root.left;
  const r = root.right;
  let hl;
  if (l === undefined) {
    hl = 0;
  } else {
    const _p = l;
    const _p$2 = _p;
    hl = _p$2.height;
  }
  let hr;
  if (r === undefined) {
    hr = 0;
  } else {
    const _p = r;
    const _p$2 = _p;
    hr = _p$2.height;
  }
  let new_root;
  if (hl > (hr + 1 | 0)) {
    let _bind;
    if (l === undefined) {
      _bind = $panic();
    } else {
      const _p = l;
      _bind = _p;
    }
    const _ll = _bind.left;
    const _lr = _bind.right;
    new_root = moonbitlang$core$sorted_map$$height_ge$71$(_ll, _lr) ? moonbitlang$core$sorted_map$$rotate_r$71$(root) : moonbitlang$core$sorted_map$$rotate_lr$71$(root);
  } else {
    if (hr > (hl + 1 | 0)) {
      let _bind;
      if (r === undefined) {
        _bind = $panic();
      } else {
        const _p = r;
        _bind = _p;
      }
      const _rl = _bind.left;
      const _rr = _bind.right;
      new_root = moonbitlang$core$sorted_map$$height_ge$71$(_rr, _rl) ? moonbitlang$core$sorted_map$$rotate_l$71$(root) : moonbitlang$core$sorted_map$$rotate_rl$71$(root);
    } else {
      new_root = root;
    }
  }
  moonbitlang$core$sorted_map$$Node$update_height$71$(new_root);
  return new_root;
}
function moonbitlang$core$sorted_map$$balance$72$(root) {
  const l = root.left;
  const r = root.right;
  let hl;
  if (l === undefined) {
    hl = 0;
  } else {
    const _p = l;
    const _p$2 = _p;
    hl = _p$2.height;
  }
  let hr;
  if (r === undefined) {
    hr = 0;
  } else {
    const _p = r;
    const _p$2 = _p;
    hr = _p$2.height;
  }
  let new_root;
  if (hl > (hr + 1 | 0)) {
    let _bind;
    if (l === undefined) {
      _bind = $panic();
    } else {
      const _p = l;
      _bind = _p;
    }
    const _ll = _bind.left;
    const _lr = _bind.right;
    new_root = moonbitlang$core$sorted_map$$height_ge$72$(_ll, _lr) ? moonbitlang$core$sorted_map$$rotate_r$72$(root) : moonbitlang$core$sorted_map$$rotate_lr$72$(root);
  } else {
    if (hr > (hl + 1 | 0)) {
      let _bind;
      if (r === undefined) {
        _bind = $panic();
      } else {
        const _p = r;
        _bind = _p;
      }
      const _rl = _bind.left;
      const _rr = _bind.right;
      new_root = moonbitlang$core$sorted_map$$height_ge$72$(_rr, _rl) ? moonbitlang$core$sorted_map$$rotate_l$72$(root) : moonbitlang$core$sorted_map$$rotate_rl$72$(root);
    } else {
      new_root = root;
    }
  }
  moonbitlang$core$sorted_map$$Node$update_height$72$(new_root);
  return new_root;
}
function moonbitlang$core$sorted_map$$add_node$71$(root, key, value) {
  if (root === undefined) {
    return { _0: moonbitlang$core$sorted_map$$new_node$71$(key, value), _1: true };
  } else {
    const _Some = root;
    const _n = _Some;
    if (moonbitlang$core$builtin$$Eq$equal$67$(key, _n.key)) {
      _n.value = value;
      return { _0: _n, _1: false };
    } else {
      const l = _n.left;
      const r = _n.right;
      if (moonbitlang$core$builtin$$op_lt$65$(key, _n.key)) {
        const _bind = moonbitlang$core$sorted_map$$add_node$71$(l, key, value);
        const _nl = _bind._0;
        const _inserted = _bind._1;
        _n.left = _nl;
        return { _0: moonbitlang$core$sorted_map$$balance$71$(_n), _1: _inserted };
      } else {
        const _bind = moonbitlang$core$sorted_map$$add_node$71$(r, key, value);
        const _nr = _bind._0;
        const _inserted = _bind._1;
        _n.right = _nr;
        return { _0: moonbitlang$core$sorted_map$$balance$71$(_n), _1: _inserted };
      }
    }
  }
}
function moonbitlang$core$sorted_map$$add_node$72$(root, key, value) {
  if (root === undefined) {
    return { _0: moonbitlang$core$sorted_map$$new_node$72$(key, value), _1: true };
  } else {
    const _Some = root;
    const _n = _Some;
    if (key === _n.key) {
      _n.value = value;
      return { _0: _n, _1: false };
    } else {
      const l = _n.left;
      const r = _n.right;
      if (key < _n.key) {
        const _bind = moonbitlang$core$sorted_map$$add_node$72$(l, key, value);
        const _nl = _bind._0;
        const _inserted = _bind._1;
        _n.left = _nl;
        return { _0: moonbitlang$core$sorted_map$$balance$72$(_n), _1: _inserted };
      } else {
        const _bind = moonbitlang$core$sorted_map$$add_node$72$(r, key, value);
        const _nr = _bind._0;
        const _inserted = _bind._1;
        _n.right = _nr;
        return { _0: moonbitlang$core$sorted_map$$balance$72$(_n), _1: _inserted };
      }
    }
  }
}
function moonbitlang$core$sorted_map$$SortedMap$add$71$(self, key, value) {
  const _bind = moonbitlang$core$sorted_map$$add_node$71$(self.root, key, value);
  const _new_root = _bind._0;
  const _inserted = _bind._1;
  if (moonbitlang$core$builtin$$op_notequal$74$(self.root, _new_root)) {
    self.root = _new_root;
  }
  if (_inserted) {
    self.size = self.size + 1 | 0;
    return;
  } else {
    return;
  }
}
function moonbitlang$core$sorted_map$$SortedMap$add$72$(self, key, value) {
  const _bind = moonbitlang$core$sorted_map$$add_node$72$(self.root, key, value);
  const _new_root = _bind._0;
  const _inserted = _bind._1;
  if (moonbitlang$core$builtin$$op_notequal$75$(self.root, _new_root)) {
    self.root = _new_root;
  }
  if (_inserted) {
    self.size = self.size + 1 | 0;
    return;
  } else {
    return;
  }
}
function moonbitlang$core$sorted_map$$SortedMap$op_set$71$(self, key, value) {
  moonbitlang$core$sorted_map$$SortedMap$add$71$(self, key, value);
}
function moonbitlang$core$sorted_map$$SortedMap$op_set$72$(self, key, value) {
  moonbitlang$core$sorted_map$$SortedMap$add$72$(self, key, value);
}
function moonbitlang$core$sorted_map$$new$71$() {
  return { root: undefined, size: 0 };
}
function moonbitlang$core$sorted_map$$new$72$() {
  return { root: undefined, size: 0 };
}
function moonbitlang$core$sorted_map$$SortedMap$get$71$(self, key) {
  let _tmp = self.root;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return undefined;
    } else {
      const _Some = _param;
      const _node = _Some;
      const cmp = moonbitlang$core$builtin$$Compare$compare$67$(key, _node.key);
      if (cmp === 0) {
        return _node.value;
      } else {
        if (cmp > 0) {
          _tmp = _node.right;
          continue;
        } else {
          _tmp = _node.left;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$sorted_map$$SortedMap$get$72$(self, key) {
  let _tmp = self.root;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return undefined;
    } else {
      const _Some = _param;
      const _node = _Some;
      const cmp = $compare_int(key, _node.key);
      if (cmp === 0) {
        return _node.value;
      } else {
        if (cmp > 0) {
          _tmp = _node.right;
          continue;
        } else {
          _tmp = _node.left;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$sorted_map$$iter2$46$go$47$2321(yield_, x) {
  let _tmp = x;
  while (true) {
    const x$2 = _tmp;
    if (x$2 === undefined) {
      return 1;
    } else {
      const _Some = x$2;
      const _x = _Some;
      const _left = _x.left;
      const _right = _x.right;
      const _key = _x.key;
      const _value = _x.value;
      const _bind = moonbitlang$core$sorted_map$$iter2$46$go$47$2321(yield_, _left);
      if (_bind === 0) {
        return 0;
      } else {
        const _bind$2 = yield_(_key, _value);
        if (_bind$2 === 0) {
          return 0;
        } else {
          _tmp = _right;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$sorted_map$$SortedMap$iter2$71$(self) {
  const _p = (yield_) => moonbitlang$core$sorted_map$$iter2$46$go$47$2321(yield_, self.root);
  return _p;
}
function moonbitlang$core$builtin$$Logger$write_object$4$(self, obj) {
  moonbitlang$core$builtin$$Show$output$4$(obj, self);
}
function moonbitlang$core$builtin$$Eq$equal$53$(_x_2701, _x_2702) {
  if (_x_2701 === 0) {
    if (_x_2702 === 0) {
      return true;
    } else {
      return false;
    }
  } else {
    if (_x_2702 === 1) {
      return true;
    } else {
      return false;
    }
  }
}
function moonbitlang$core$builtin$$op_ge$47$(self_, other) {
  return moonbitlang$core$builtin$$Compare$compare$47$(self_, other) >= 0;
}
function moonbitlang$core$builtin$$op_ge$14$(self_, other) {
  return moonbitlang$core$builtin$$Compare$compare$26$(self_, other) >= 0;
}
function moonbitlang$core$builtin$$op_ge$15$(self_, other) {
  return moonbitlang$core$builtin$$Compare$compare$15$(self_, other) >= 0;
}
function moonbitlang$core$builtin$$op_le$47$(self_, other) {
  return moonbitlang$core$builtin$$Compare$compare$47$(self_, other) <= 0;
}
function moonbitlang$core$builtin$$op_lt$47$(self_, other) {
  return moonbitlang$core$builtin$$Compare$compare$47$(self_, other) < 0;
}
function moonbitlang$core$builtin$$op_lt$76$(self_, other) {
  return $compare_int(self_.num, other.num) < 0;
}
function moonbitlang$core$builtin$$op_lt$0$(self_, other) {
  return $compare_int(self_, other) < 0;
}
function moonbitlang$core$builtin$$op_lt$14$(self_, other) {
  return moonbitlang$core$builtin$$Compare$compare$26$(self_, other) < 0;
}
function moonbitlang$core$builtin$$op_lt$15$(self_, other) {
  return moonbitlang$core$builtin$$Compare$compare$15$(self_, other) < 0;
}
function moonbitlang$core$builtin$$op_lt$65$(self_, other) {
  return moonbitlang$core$builtin$$Compare$compare$67$(self_, other) < 0;
}
function moonbitlang$core$array$$FixedArray$unsafe_blit$24$(dst, dst_offset, src, src_offset, len) {
  if (dst === src && dst_offset < src_offset) {
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < len) {
        const _tmp$2 = dst_offset + i | 0;
        const _tmp$3 = src_offset + i | 0;
        $bound_check(src, _tmp$3);
        $bound_check(dst, _tmp$2);
        dst[_tmp$2] = src[_tmp$3];
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
        const _tmp$2 = dst_offset + i | 0;
        const _tmp$3 = src_offset + i | 0;
        $bound_check(src, _tmp$3);
        $bound_check(dst, _tmp$2);
        dst[_tmp$2] = src[_tmp$3];
        _tmp = i - 1 | 0;
        continue;
      } else {
        return;
      }
    }
  }
}
function moonbitlang$core$array$$FixedArray$unsafe_blit$77$(dst, dst_offset, src, src_offset, len) {
  if (dst === src && dst_offset < src_offset) {
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < len) {
        const _tmp$2 = dst_offset + i | 0;
        const _tmp$3 = src_offset + i | 0;
        $bound_check(src, _tmp$3);
        $bound_check(dst, _tmp$2);
        dst[_tmp$2] = src[_tmp$3];
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
        const _tmp$2 = dst_offset + i | 0;
        const _tmp$3 = src_offset + i | 0;
        $bound_check(src, _tmp$3);
        $bound_check(dst, _tmp$2);
        dst[_tmp$2] = src[_tmp$3];
        _tmp = i - 1 | 0;
        continue;
      } else {
        return;
      }
    }
  }
}
function moonbitlang$core$builtin$$StringBuilder$new$46$inner(size_hint) {
  return { val: "" };
}
function moonbitlang$core$builtin$$Logger$write_char$25$(self, ch) {
  const _bind = self;
  _bind.val = `${_bind.val}${String.fromCodePoint(ch)}`;
}
function moonbitlang$core$builtin$$op_gt$47$(self_, other) {
  return moonbitlang$core$builtin$$Compare$compare$47$(self_, other) > 0;
}
function moonbitlang$core$builtin$$op_gt$76$(self_, other) {
  return $compare_int(self_.num, other.num) > 0;
}
function moonbitlang$core$builtin$$op_gt$0$(self_, other) {
  return $compare_int(self_, other) > 0;
}
function moonbitlang$core$builtin$$op_gt$14$(self_, other) {
  return moonbitlang$core$builtin$$Compare$compare$26$(self_, other) > 0;
}
function moonbitlang$core$builtin$$op_gt$15$(self_, other) {
  return moonbitlang$core$builtin$$Compare$compare$15$(self_, other) > 0;
}
function moonbitlang$core$builtin$$code_point_of_surrogate_pair(leading, trailing) {
  return (((Math.imul(leading - 55296 | 0, 1024) | 0) + trailing | 0) - 56320 | 0) + 65536 | 0;
}
function moonbitlang$core$string$$String$unsafe_char_at(self, index) {
  const c1 = self.charCodeAt(index);
  if (55296 <= c1 && c1 <= 56319) {
    const _tmp = index + 1 | 0;
    const c2 = self.charCodeAt(_tmp);
    return moonbitlang$core$builtin$$code_point_of_surrogate_pair(c1, c2);
  } else {
    return c1;
  }
}
function moonbitlang$core$builtin$$op_notequal$3$(x, y) {
  return !moonbitlang$core$builtin$$Eq$equal$3$(x, y);
}
function moonbitlang$core$builtin$$op_notequal$32$(x, y) {
  return !moonbitlang$core$builtin$$Eq$equal$78$(x, y);
}
function moonbitlang$core$builtin$$op_notequal$33$(x, y) {
  return !moonbitlang$core$builtin$$Eq$equal$79$(x, y);
}
function moonbitlang$core$builtin$$op_notequal$15$(x, y) {
  return !moonbitlang$core$builtin$$Eq$equal$15$(x, y);
}
function moonbitlang$core$builtin$$op_notequal$74$(x, y) {
  return !moonbitlang$core$builtin$$Eq$equal$80$(x, y);
}
function moonbitlang$core$builtin$$op_notequal$75$(x, y) {
  return !moonbitlang$core$builtin$$Eq$equal$81$(x, y);
}
function moonbitlang$core$builtin$$op_notequal$34$(x, y) {
  return !moonbitlang$core$builtin$$Eq$equal$82$(x, y);
}
function moonbitlang$core$array$$Array$op_get$83$(self, index) {
  const len = self.length;
  if (index >= 0 && index < len) {
    $bound_check(self, index);
    return self[index];
  } else {
    return $panic();
  }
}
function moonbitlang$core$array$$Array$op_get$84$(self, index) {
  const len = self.length;
  if (index >= 0 && index < len) {
    $bound_check(self, index);
    return self[index];
  } else {
    return $panic();
  }
}
function moonbitlang$core$array$$Array$op_get$24$(self, index) {
  const len = self.length;
  if (index >= 0 && index < len) {
    $bound_check(self, index);
    return self[index];
  } else {
    return $panic();
  }
}
function moonbitlang$core$array$$Array$op_get$85$(self, index) {
  const len = self.length;
  if (index >= 0 && index < len) {
    $bound_check(self, index);
    return self[index];
  } else {
    return $panic();
  }
}
function moonbitlang$core$array$$Array$op_get$86$(self, index) {
  const len = self.length;
  if (index >= 0 && index < len) {
    $bound_check(self, index);
    return self[index];
  } else {
    return $panic();
  }
}
function moonbitlang$core$array$$Array$op_get$15$(self, index) {
  const len = self.length;
  if (index >= 0 && index < len) {
    $bound_check(self, index);
    return self[index];
  } else {
    return $panic();
  }
}
function moonbitlang$core$array$$Array$op_get$76$(self, index) {
  const len = self.length;
  if (index >= 0 && index < len) {
    $bound_check(self, index);
    return self[index];
  } else {
    return $panic();
  }
}
function moonbitlang$core$array$$Array$op_get$87$(self, index) {
  const len = self.length;
  if (index >= 0 && index < len) {
    $bound_check(self, index);
    return self[index];
  } else {
    return $panic();
  }
}
function moonbitlang$core$array$$Array$op_get$4$(self, index) {
  const len = self.length;
  if (index >= 0 && index < len) {
    $bound_check(self, index);
    return self[index];
  } else {
    return $panic();
  }
}
function moonbitlang$core$array$$Array$op_get$40$(self, index) {
  const len = self.length;
  if (index >= 0 && index < len) {
    $bound_check(self, index);
    return self[index];
  } else {
    return $panic();
  }
}
function moonbitlang$core$array$$Array$op_get$88$(self, index) {
  const len = self.length;
  if (index >= 0 && index < len) {
    $bound_check(self, index);
    return self[index];
  } else {
    return $panic();
  }
}
function moonbitlang$core$array$$Array$op_get$89$(self, index) {
  const len = self.length;
  if (index >= 0 && index < len) {
    $bound_check(self, index);
    return self[index];
  } else {
    return $panic();
  }
}
function moonbitlang$core$array$$Array$op_get$27$(self, index) {
  const len = self.length;
  if (index >= 0 && index < len) {
    $bound_check(self, index);
    return self[index];
  } else {
    return $panic();
  }
}
function moonbitlang$core$builtin$$Logger$write_string$25$(self, str) {
  const _bind = self;
  _bind.val = `${_bind.val}${str}`;
}
function moonbitlang$core$builtin$$Show$output$90$(self, logger) {
  const _a = self._0;
  const _b = self._1;
  logger.method_0(logger.self, "(");
  moonbitlang$core$builtin$$Logger$write_object$4$(logger, _a);
  logger.method_0(logger.self, ", ");
  moonbitlang$core$builtin$$Logger$write_object$4$(logger, _b);
  logger.method_0(logger.self, ")");
}
function moonbitlang$core$builtin$$Hasher$combine$40$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$42$(value, self);
}
function moonbitlang$core$builtin$$Hasher$combine$39$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$39$(value, self);
}
function moonbitlang$core$builtin$$Hasher$combine$2$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$2$(value, self);
}
function moonbitlang$core$builtin$$Hasher$combine$10$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$41$(value, self);
}
function moonbitlang$core$builtin$$Hasher$combine$91$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$92$(value, self);
}
function moonbitlang$core$builtin$$Hasher$combine$93$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$93$(value, self);
}
function moonbitlang$core$builtin$$Hasher$combine$76$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$76$(value, self);
}
function moonbitlang$core$builtin$$Hasher$combine$0$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$0$(value, self);
}
function moonbitlang$core$builtin$$Hasher$combine$36$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$37$(value, self);
}
function moonbitlang$core$builtin$$Hasher$combine$4$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$4$(value, self);
}
function moonbitlang$core$builtin$$Hasher$combine$27$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$27$(value, self);
}
function moonbitlang$core$builtin$$Hasher$combine$51$(self, value) {
  moonbitlang$core$builtin$$Hash$hash_combine$51$(value, self);
}
function moonbitlang$core$builtin$$Hash$hash_combine$42$(self, hasher) {
  const _a = self._0;
  const _b = self._1;
  moonbitlang$core$builtin$$Hasher$combine$76$(hasher, _a);
  moonbitlang$core$builtin$$Hasher$combine$93$(hasher, _b);
}
function moonbitlang$core$builtin$$Hash$hash_combine$94$(self, hasher) {
  const _a = self._0;
  const _b = self._1;
  moonbitlang$core$builtin$$Hasher$combine$0$(hasher, _a);
  moonbitlang$core$builtin$$Hasher$combine$0$(hasher, _b);
}
function moonbitlang$core$builtin$$Hash$hash_combine$37$(self, hasher) {
  const _a = self._0;
  const _b = self._1;
  moonbitlang$core$builtin$$Hasher$combine$27$(hasher, _a);
  moonbitlang$core$builtin$$Hasher$combine$4$(hasher, _b);
}
function moonbitlang$core$builtin$$Hash$hash_combine$95$(self, hasher) {
  const _a = self._0;
  const _b = self._1;
  moonbitlang$core$builtin$$Hasher$combine$51$(hasher, _a);
  moonbitlang$core$builtin$$Hasher$combine$51$(hasher, _b);
}
function moonbitlang$core$builtin$$Eq$equal$96$(self, other) {
  return self._0 === other._0 && moonbitlang$core$builtin$$Eq$equal$97$(self._1, other._1);
}
function moonbitlang$core$builtin$$Eq$equal$42$(self, other) {
  const _p = self._0;
  const _p$2 = other._0;
  if (_p.num === _p$2.num) {
    return moonbitlang$core$builtin$$Eq$equal$93$(self._1, other._1);
  } else {
    return false;
  }
}
function moonbitlang$core$builtin$$Eq$equal$26$(self, other) {
  const _p = self._0;
  const _p$2 = other._0;
  if (_p._0 === _p$2._0 && _p._1 === _p$2._1) {
    return self._1 === other._1;
  } else {
    return false;
  }
}
function moonbitlang$core$builtin$$Eq$equal$98$(self, other) {
  return moonbitlang$core$builtin$$Eq$equal$99$(self._0, other._0) && moonbitlang$core$builtin$$Eq$equal$99$(self._1, other._1);
}
function moonbitlang$core$builtin$$Eq$equal$94$(self, other) {
  const _p = self._0;
  const _p$2 = other._0;
  if (_p === _p$2) {
    const _p$3 = self._1;
    const _p$4 = other._1;
    return _p$3 === _p$4;
  } else {
    return false;
  }
}
function moonbitlang$core$builtin$$Eq$equal$68$(self, other) {
  return self._0 === other._0 && moonbitlang$core$builtin$$Eq$equal$100$(self._1, other._1);
}
function moonbitlang$core$builtin$$Eq$equal$37$(self, other) {
  return moonbitlang$core$builtin$$Eq$equal$27$(self._0, other._0) && self._1 === other._1;
}
function moonbitlang$core$builtin$$Compare$compare$68$(self, other) {
  const t0 = $compare_int(self._0, other._0);
  return t0 === 0 ? moonbitlang$core$builtin$$Compare$compare$100$(self._1, other._1) : t0;
}
function moonbitlang$core$builtin$$Compare$compare$63$(self, other) {
  const t0 = moonbitlang$core$builtin$$Compare$compare$2$(self._0, other._0);
  return t0 === 0 ? moonbitlang$core$builtin$$Compare$compare$101$(self._1, other._1) : t0;
}
function moonbitlang$core$builtin$$Compare$compare$42$(self, other) {
  const _p = self._0;
  const _p$2 = other._0;
  const t0 = $compare_int(_p.num, _p$2.num);
  return t0 === 0 ? moonbitlang$core$builtin$$Compare$compare$93$(self._1, other._1) : t0;
}
function moonbitlang$core$builtin$$Compare$compare$26$(self, other) {
  const _p = self._0;
  const _p$2 = other._0;
  const _p$3 = $compare_int(_p._0, _p$2._0);
  const t0 = _p$3 === 0 ? $compare_int(_p._1, _p$2._1) : _p$3;
  return t0 === 0 ? $compare_int(self._1, other._1) : t0;
}
function moonbitlang$core$builtin$$Compare$compare$94$(self, other) {
  const _p = self._0;
  const _p$2 = other._0;
  const t0 = $compare_int(_p, _p$2);
  if (t0 === 0) {
    const _p$3 = self._1;
    const _p$4 = other._1;
    return $compare_int(_p$3, _p$4);
  } else {
    return t0;
  }
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
function moonbitlang$core$builtin$$Hasher$new$46$inner(seed) {
  return { acc: (seed >>> 0) + (374761393 >>> 0) | 0 };
}
function moonbitlang$core$builtin$$Hash$hash$102$(self) {
  const _self = moonbitlang$core$builtin$$Hasher$new$46$inner(0);
  moonbitlang$core$builtin$$Hasher$combine$40$(_self, self);
  return moonbitlang$core$builtin$$Hasher$finalize(_self);
}
function moonbitlang$core$builtin$$Hash$hash$103$(self) {
  const _self = moonbitlang$core$builtin$$Hasher$new$46$inner(0);
  moonbitlang$core$builtin$$Hasher$combine$39$(_self, self);
  return moonbitlang$core$builtin$$Hasher$finalize(_self);
}
function moonbitlang$core$builtin$$Hash$hash$104$(self) {
  const _self = moonbitlang$core$builtin$$Hasher$new$46$inner(0);
  moonbitlang$core$builtin$$Hasher$combine$2$(_self, self);
  return moonbitlang$core$builtin$$Hasher$finalize(_self);
}
function moonbitlang$core$builtin$$Hash$hash$105$(self) {
  const _self = moonbitlang$core$builtin$$Hasher$new$46$inner(0);
  moonbitlang$core$builtin$$Hasher$combine$10$(_self, self);
  return moonbitlang$core$builtin$$Hasher$finalize(_self);
}
function moonbitlang$core$builtin$$Hash$hash$106$(self) {
  const _self = moonbitlang$core$builtin$$Hasher$new$46$inner(0);
  moonbitlang$core$builtin$$Hasher$combine$91$(_self, self);
  return moonbitlang$core$builtin$$Hasher$finalize(_self);
}
function moonbitlang$core$builtin$$Hash$hash$38$(self) {
  const _self = moonbitlang$core$builtin$$Hasher$new$46$inner(0);
  moonbitlang$core$builtin$$Hasher$combine$36$(_self, self);
  return moonbitlang$core$builtin$$Hasher$finalize(_self);
}
function moonbitlang$core$builtin$$Show$to_string$107$(self) {
  const logger = moonbitlang$core$builtin$$StringBuilder$new$46$inner(0);
  moonbitlang$core$builtin$$Show$output$108$(self, { self: logger, method_0: moonbitlang$core$builtin$$Logger$write_string$25$, method_1: moonbitlang$core$builtin$$Logger$write_substring$25$, method_2: moonbitlang$core$builtin$$Logger$write_char$25$ });
  return logger.val;
}
function moonbitlang$core$builtin$$Show$to_string$109$(self) {
  const logger = moonbitlang$core$builtin$$StringBuilder$new$46$inner(0);
  moonbitlang$core$builtin$$Show$output$90$(self, { self: logger, method_0: moonbitlang$core$builtin$$Logger$write_string$25$, method_1: moonbitlang$core$builtin$$Logger$write_substring$25$, method_2: moonbitlang$core$builtin$$Logger$write_char$25$ });
  return logger.val;
}
function moonbitlang$core$builtin$$MyInt64$from_int(value) {
  return { hi: value >> 31 & -1, lo: value | 0 };
}
function moonbitlang$core$int$$Int$to_int64(self) {
  return moonbitlang$core$builtin$$MyInt64$from_int(self);
}
function moonbitlang$core$int64$$Int64$to_int(self) {
  const _p = self;
  return _p.lo;
}
function moonbitlang$core$builtin$$output$46$inner$46$write_digits$124$1947(_env, num) {
  const logger = _env._1;
  const radix = _env._0;
  const num2 = num / radix | 0;
  if (num2 !== 0) {
    moonbitlang$core$builtin$$output$46$inner$46$write_digits$124$1947(_env, num2);
  }
  const _p = "0123456789abcdefghijklmnopqrstuvwxyz";
  const _p$2 = num % radix | 0;
  const _p$3 = _p$2 < 0 ? 0 - _p$2 | 0 : _p$2;
  $bound_check(_p, _p$3);
  logger.method_2(logger.self, _p.charCodeAt(_p$3));
}
function moonbitlang$core$int$$Int$output$46$inner(self, logger, radix) {
  if (self < 0) {
    logger.method_2(logger.self, 45);
  }
  const _env = { _0: radix, _1: logger };
  moonbitlang$core$builtin$$output$46$inner$46$write_digits$124$1947(_env, self < 0 ? 0 - self | 0 : self);
}
function moonbitlang$core$int$$Int$output_size_hint$46$inner(radix) {
  return radix >= 2 && radix < 7 ? 36 : radix >= 8 && radix < 15 ? 18 : radix >= 16 && radix <= 36 ? 10 : moonbitlang$core$abort$$abort$4$("radix must be between 2 and 36");
}
function moonbitlang$core$int$$Int$to_string$46$inner(self, radix) {
  const buf = moonbitlang$core$builtin$$StringBuilder$new$46$inner(moonbitlang$core$int$$Int$output_size_hint$46$inner(radix));
  moonbitlang$core$int$$Int$output$46$inner(self, { self: buf, method_0: moonbitlang$core$builtin$$Logger$write_string$25$, method_1: moonbitlang$core$builtin$$Logger$write_substring$25$, method_2: moonbitlang$core$builtin$$Logger$write_char$25$ }, radix);
  return buf.val;
}
function moonbitlang$core$builtin$$Show$to_string$4$(self) {
  return moonbitlang$core$int$$Int$to_string$46$inner(self, 10);
}
function moonbitlang$core$array$$FixedArray$blit_from_string(self, bytes_offset, str, str_offset, length) {
  const e1 = (bytes_offset + (Math.imul(length, 2) | 0) | 0) - 1 | 0;
  const e2 = (str_offset + length | 0) - 1 | 0;
  const len1 = self.length;
  const len2 = str.length;
  if (length >= 0 && (bytes_offset >= 0 && (e1 < len1 && (str_offset >= 0 && e2 < len2)))) {
    const end_str_offset = str_offset + length | 0;
    let _tmp = str_offset;
    let _tmp$2 = bytes_offset;
    while (true) {
      const i = _tmp;
      const j = _tmp$2;
      if (i < end_str_offset) {
        const c = str.charCodeAt(i);
        const _p = c & 255;
        $bound_check(self, j);
        self[j] = _p & 255;
        const _tmp$3 = j + 1 | 0;
        const _p$2 = c >>> 8 | 0;
        $bound_check(self, _tmp$3);
        self[_tmp$3] = _p$2 & 255;
        _tmp = i + 1 | 0;
        _tmp$2 = j + 2 | 0;
        continue;
      } else {
        return;
      }
    }
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$string$$String$substring$46$inner(self, start, end) {
  const len = self.length;
  let end$2;
  if (end === undefined) {
    end$2 = len;
  } else {
    const _Some = end;
    end$2 = _Some;
  }
  return start >= 0 && (start <= end$2 && end$2 <= len) ? self.substring(start, end$2) : $panic();
}
function moonbitlang$core$builtin$$Logger$write_substring$25$(self, str, start, len) {
  const _bind = self;
  _bind.val = `${_bind.val}${moonbitlang$core$string$$String$substring$46$inner(str, start, start + len | 0)}`;
}
function moonbitlang$core$builtin$$unsafe_make_string(_tmp, _tmp$2) {
  return $unsafe_make_string(_tmp, _tmp$2);
}
function moonbitlang$core$string$$String$make(length, value) {
  if (length >= 0) {
    if (value <= 65535) {
      return moonbitlang$core$builtin$$unsafe_make_string(length, value);
    } else {
      const buf = moonbitlang$core$builtin$$StringBuilder$new$46$inner(Math.imul(2, length) | 0);
      let _tmp = 0;
      while (true) {
        const _ = _tmp;
        if (_ < length) {
          moonbitlang$core$builtin$$Logger$write_char$25$(buf, value);
          _tmp = _ + 1 | 0;
          continue;
        } else {
          break;
        }
      }
      return buf.val;
    }
  } else {
    return moonbitlang$core$abort$$abort$2$("invalid length");
  }
}
function moonbitlang$core$builtin$$Show$output$4$(self, logger) {
  moonbitlang$core$int$$Int$output$46$inner(self, logger, 10);
}
function moonbitlang$core$array$$Array$iter$84$(self) {
  const _p = (yield_) => {
    const _len = self.length;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const v = self[_i];
        const _bind = yield_(v);
        if (_bind === 1) {
        } else {
          return 0;
        }
        _tmp = _i + 1 | 0;
        continue;
      } else {
        return 1;
      }
    }
  };
  return _p;
}
function moonbitlang$core$array$$Array$iter$2$(self) {
  const _p = (yield_) => {
    const _len = self.length;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const v = self[_i];
        const _bind = yield_(v);
        if (_bind === 1) {
        } else {
          return 0;
        }
        _tmp = _i + 1 | 0;
        continue;
      } else {
        return 1;
      }
    }
  };
  return _p;
}
function moonbitlang$core$array$$Array$iter$110$(self) {
  const _p = (yield_) => {
    const _len = self.length;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const v = self[_i];
        const _bind = yield_(v);
        if (_bind === 1) {
        } else {
          return 0;
        }
        _tmp = _i + 1 | 0;
        continue;
      } else {
        return 1;
      }
    }
  };
  return _p;
}
function moonbitlang$core$array$$Array$iter$111$(self) {
  const _p = (yield_) => {
    const _len = self.length;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const v = self[_i];
        const _bind = yield_(v);
        if (_bind === 1) {
        } else {
          return 0;
        }
        _tmp = _i + 1 | 0;
        continue;
      } else {
        return 1;
      }
    }
  };
  return _p;
}
function moonbitlang$core$array$$Array$iter$76$(self) {
  const _p = (yield_) => {
    const _len = self.length;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const v = self[_i];
        const _bind = yield_(v);
        if (_bind === 1) {
        } else {
          return 0;
        }
        _tmp = _i + 1 | 0;
        continue;
      } else {
        return 1;
      }
    }
  };
  return _p;
}
function moonbitlang$core$array$$Array$iter$4$(self) {
  const _p = (yield_) => {
    const _len = self.length;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const v = self[_i];
        const _bind = yield_(v);
        if (_bind === 1) {
        } else {
          return 0;
        }
        _tmp = _i + 1 | 0;
        continue;
      } else {
        return 1;
      }
    }
  };
  return _p;
}
function moonbitlang$core$array$$Array$iter$27$(self) {
  const _p = (yield_) => {
    const _len = self.length;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const v = self[_i];
        const _bind = yield_(v);
        if (_bind === 1) {
        } else {
          return 0;
        }
        _tmp = _i + 1 | 0;
        continue;
      } else {
        return 1;
      }
    }
  };
  return _p;
}
function moonbitlang$core$builtin$$Eq$equal$78$(self, other) {
  if (self === undefined) {
    return other === undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    if (other === undefined) {
      return false;
    } else {
      const _Some$2 = other;
      const _y = _Some$2;
      return moonbitlang$core$builtin$$Eq$equal$28$(_x, _y);
    }
  }
}
function moonbitlang$core$builtin$$Eq$equal$79$(self, other) {
  if (self === undefined) {
    return other === undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    if (other === undefined) {
      return false;
    } else {
      const _Some$2 = other;
      const _y = _Some$2;
      return moonbitlang$core$builtin$$Eq$equal$30$(_x, _y);
    }
  }
}
function moonbitlang$core$builtin$$Eq$equal$112$(self, other) {
  if (self === undefined) {
    return other === undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    if (other === undefined) {
      return false;
    } else {
      const _Some$2 = other;
      const _y = _Some$2;
      return _x === _y;
    }
  }
}
function moonbitlang$core$builtin$$Eq$equal$80$(self, other) {
  if (self === undefined) {
    return other === undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    if (other === undefined) {
      return false;
    } else {
      const _Some$2 = other;
      const _y = _Some$2;
      return moonbitlang$core$builtin$$Eq$equal$73$(_x, _y);
    }
  }
}
function moonbitlang$core$builtin$$Eq$equal$81$(self, other) {
  if (self === undefined) {
    return other === undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    if (other === undefined) {
      return false;
    } else {
      const _Some$2 = other;
      const _y = _Some$2;
      return _x.key === _y.key;
    }
  }
}
function moonbitlang$core$builtin$$Eq$equal$82$(self, other) {
  if (self === undefined) {
    return other === undefined;
  } else {
    const _Some = self;
    const _x = _Some;
    if (other === undefined) {
      return false;
    } else {
      const _Some$2 = other;
      const _y = _Some$2;
      return _x.value === _y.value;
    }
  }
}
function moonbitlang$core$option$$Option$unwrap$29$(self) {
  if (self.$tag === 0) {
    return $panic();
  } else {
    const _Some = self;
    return _Some._0;
  }
}
function moonbitlang$core$int$$Int$next_power_of_two(self) {
  if (self >= 0) {
    if (self <= 1) {
      return 1;
    }
    if (self > 1073741824) {
      return 1073741824;
    }
    return (2147483647 >> (Math.clz32(self - 1 | 0) - 1 | 0)) + 1 | 0;
  } else {
    return $panic();
  }
}
function moonbitlang$core$builtin$$Map$new$46$inner$113$(capacity) {
  const capacity$2 = moonbitlang$core$int$$Int$next_power_of_two(capacity);
  const _bind = capacity$2 - 1 | 0;
  const _bind$2 = (Math.imul(capacity$2, 13) | 0) / 16 | 0;
  const _bind$3 = $make_array_len_and_init(capacity$2, undefined);
  const _bind$4 = undefined;
  return { entries: _bind$3, size: 0, capacity: capacity$2, capacity_mask: _bind, grow_at: _bind$2, head: _bind$4, tail: -1 };
}
function moonbitlang$core$builtin$$Map$new$46$inner$114$(capacity) {
  const capacity$2 = moonbitlang$core$int$$Int$next_power_of_two(capacity);
  const _bind = capacity$2 - 1 | 0;
  const _bind$2 = (Math.imul(capacity$2, 13) | 0) / 16 | 0;
  const _bind$3 = $make_array_len_and_init(capacity$2, undefined);
  const _bind$4 = undefined;
  return { entries: _bind$3, size: 0, capacity: capacity$2, capacity_mask: _bind, grow_at: _bind$2, head: _bind$4, tail: -1 };
}
function moonbitlang$core$builtin$$Map$new$46$inner$115$(capacity) {
  const capacity$2 = moonbitlang$core$int$$Int$next_power_of_two(capacity);
  const _bind = capacity$2 - 1 | 0;
  const _bind$2 = (Math.imul(capacity$2, 13) | 0) / 16 | 0;
  const _bind$3 = $make_array_len_and_init(capacity$2, undefined);
  const _bind$4 = undefined;
  return { entries: _bind$3, size: 0, capacity: capacity$2, capacity_mask: _bind, grow_at: _bind$2, head: _bind$4, tail: -1 };
}
function moonbitlang$core$builtin$$Map$new$46$inner$58$(capacity) {
  const capacity$2 = moonbitlang$core$int$$Int$next_power_of_two(capacity);
  const _bind = capacity$2 - 1 | 0;
  const _bind$2 = (Math.imul(capacity$2, 13) | 0) / 16 | 0;
  const _bind$3 = $make_array_len_and_init(capacity$2, undefined);
  const _bind$4 = undefined;
  return { entries: _bind$3, size: 0, capacity: capacity$2, capacity_mask: _bind, grow_at: _bind$2, head: _bind$4, tail: -1 };
}
function moonbitlang$core$builtin$$Map$new$46$inner$116$(capacity) {
  const capacity$2 = moonbitlang$core$int$$Int$next_power_of_two(capacity);
  const _bind = capacity$2 - 1 | 0;
  const _bind$2 = (Math.imul(capacity$2, 13) | 0) / 16 | 0;
  const _bind$3 = $make_array_len_and_init(capacity$2, undefined);
  const _bind$4 = undefined;
  return { entries: _bind$3, size: 0, capacity: capacity$2, capacity_mask: _bind, grow_at: _bind$2, head: _bind$4, tail: -1 };
}
function moonbitlang$core$builtin$$Map$new$46$inner$117$(capacity) {
  const capacity$2 = moonbitlang$core$int$$Int$next_power_of_two(capacity);
  const _bind = capacity$2 - 1 | 0;
  const _bind$2 = (Math.imul(capacity$2, 13) | 0) / 16 | 0;
  const _bind$3 = $make_array_len_and_init(capacity$2, undefined);
  const _bind$4 = undefined;
  return { entries: _bind$3, size: 0, capacity: capacity$2, capacity_mask: _bind, grow_at: _bind$2, head: _bind$4, tail: -1 };
}
function moonbitlang$core$builtin$$Map$new$46$inner$118$(capacity) {
  const capacity$2 = moonbitlang$core$int$$Int$next_power_of_two(capacity);
  const _bind = capacity$2 - 1 | 0;
  const _bind$2 = (Math.imul(capacity$2, 13) | 0) / 16 | 0;
  const _bind$3 = $make_array_len_and_init(capacity$2, undefined);
  const _bind$4 = undefined;
  return { entries: _bind$3, size: 0, capacity: capacity$2, capacity_mask: _bind, grow_at: _bind$2, head: _bind$4, tail: -1 };
}
function moonbitlang$core$builtin$$Map$new$46$inner$119$(capacity) {
  const capacity$2 = moonbitlang$core$int$$Int$next_power_of_two(capacity);
  const _bind = capacity$2 - 1 | 0;
  const _bind$2 = (Math.imul(capacity$2, 13) | 0) / 16 | 0;
  const _bind$3 = $make_array_len_and_init(capacity$2, undefined);
  const _bind$4 = undefined;
  return { entries: _bind$3, size: 0, capacity: capacity$2, capacity_mask: _bind, grow_at: _bind$2, head: _bind$4, tail: -1 };
}
function moonbitlang$core$builtin$$Map$new$46$inner$120$(capacity) {
  const capacity$2 = moonbitlang$core$int$$Int$next_power_of_two(capacity);
  const _bind = capacity$2 - 1 | 0;
  const _bind$2 = (Math.imul(capacity$2, 13) | 0) / 16 | 0;
  const _bind$3 = $make_array_len_and_init(capacity$2, undefined);
  const _bind$4 = undefined;
  return { entries: _bind$3, size: 0, capacity: capacity$2, capacity_mask: _bind, grow_at: _bind$2, head: _bind$4, tail: -1 };
}
function moonbitlang$core$builtin$$Map$new$46$inner$121$(capacity) {
  const capacity$2 = moonbitlang$core$int$$Int$next_power_of_two(capacity);
  const _bind = capacity$2 - 1 | 0;
  const _bind$2 = (Math.imul(capacity$2, 13) | 0) / 16 | 0;
  const _bind$3 = $make_array_len_and_init(capacity$2, undefined);
  const _bind$4 = undefined;
  return { entries: _bind$3, size: 0, capacity: capacity$2, capacity_mask: _bind, grow_at: _bind$2, head: _bind$4, tail: -1 };
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$114$(self, idx, entry) {
  const _bind = self.tail;
  if (_bind === -1) {
    self.head = entry;
  } else {
    const _tmp = self.entries;
    $bound_check(_tmp, _bind);
    const _p = _tmp[_bind];
    let _tmp$2;
    if (_p === undefined) {
      _tmp$2 = $panic();
    } else {
      const _p$2 = _p;
      _tmp$2 = _p$2;
    }
    _tmp$2.next = entry;
  }
  self.tail = idx;
  const _tmp = self.entries;
  $bound_check(_tmp, idx);
  _tmp[idx] = entry;
  self.size = self.size + 1 | 0;
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$115$(self, idx, entry) {
  const _bind = self.tail;
  if (_bind === -1) {
    self.head = entry;
  } else {
    const _tmp = self.entries;
    $bound_check(_tmp, _bind);
    const _p = _tmp[_bind];
    let _tmp$2;
    if (_p === undefined) {
      _tmp$2 = $panic();
    } else {
      const _p$2 = _p;
      _tmp$2 = _p$2;
    }
    _tmp$2.next = entry;
  }
  self.tail = idx;
  const _tmp = self.entries;
  $bound_check(_tmp, idx);
  _tmp[idx] = entry;
  self.size = self.size + 1 | 0;
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$58$(self, idx, entry) {
  const _bind = self.tail;
  if (_bind === -1) {
    self.head = entry;
  } else {
    const _tmp = self.entries;
    $bound_check(_tmp, _bind);
    const _p = _tmp[_bind];
    let _tmp$2;
    if (_p === undefined) {
      _tmp$2 = $panic();
    } else {
      const _p$2 = _p;
      _tmp$2 = _p$2;
    }
    _tmp$2.next = entry;
  }
  self.tail = idx;
  const _tmp = self.entries;
  $bound_check(_tmp, idx);
  _tmp[idx] = entry;
  self.size = self.size + 1 | 0;
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$120$(self, idx, entry) {
  const _bind = self.tail;
  if (_bind === -1) {
    self.head = entry;
  } else {
    const _tmp = self.entries;
    $bound_check(_tmp, _bind);
    const _p = _tmp[_bind];
    let _tmp$2;
    if (_p === undefined) {
      _tmp$2 = $panic();
    } else {
      const _p$2 = _p;
      _tmp$2 = _p$2;
    }
    _tmp$2.next = entry;
  }
  self.tail = idx;
  const _tmp = self.entries;
  $bound_check(_tmp, idx);
  _tmp[idx] = entry;
  self.size = self.size + 1 | 0;
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$116$(self, idx, entry) {
  const _bind = self.tail;
  if (_bind === -1) {
    self.head = entry;
  } else {
    const _tmp = self.entries;
    $bound_check(_tmp, _bind);
    const _p = _tmp[_bind];
    let _tmp$2;
    if (_p === undefined) {
      _tmp$2 = $panic();
    } else {
      const _p$2 = _p;
      _tmp$2 = _p$2;
    }
    _tmp$2.next = entry;
  }
  self.tail = idx;
  const _tmp = self.entries;
  $bound_check(_tmp, idx);
  _tmp[idx] = entry;
  self.size = self.size + 1 | 0;
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$117$(self, idx, entry) {
  const _bind = self.tail;
  if (_bind === -1) {
    self.head = entry;
  } else {
    const _tmp = self.entries;
    $bound_check(_tmp, _bind);
    const _p = _tmp[_bind];
    let _tmp$2;
    if (_p === undefined) {
      _tmp$2 = $panic();
    } else {
      const _p$2 = _p;
      _tmp$2 = _p$2;
    }
    _tmp$2.next = entry;
  }
  self.tail = idx;
  const _tmp = self.entries;
  $bound_check(_tmp, idx);
  _tmp[idx] = entry;
  self.size = self.size + 1 | 0;
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$118$(self, idx, entry) {
  const _bind = self.tail;
  if (_bind === -1) {
    self.head = entry;
  } else {
    const _tmp = self.entries;
    $bound_check(_tmp, _bind);
    const _p = _tmp[_bind];
    let _tmp$2;
    if (_p === undefined) {
      _tmp$2 = $panic();
    } else {
      const _p$2 = _p;
      _tmp$2 = _p$2;
    }
    _tmp$2.next = entry;
  }
  self.tail = idx;
  const _tmp = self.entries;
  $bound_check(_tmp, idx);
  _tmp[idx] = entry;
  self.size = self.size + 1 | 0;
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$119$(self, idx, entry) {
  const _bind = self.tail;
  if (_bind === -1) {
    self.head = entry;
  } else {
    const _tmp = self.entries;
    $bound_check(_tmp, _bind);
    const _p = _tmp[_bind];
    let _tmp$2;
    if (_p === undefined) {
      _tmp$2 = $panic();
    } else {
      const _p$2 = _p;
      _tmp$2 = _p$2;
    }
    _tmp$2.next = entry;
  }
  self.tail = idx;
  const _tmp = self.entries;
  $bound_check(_tmp, idx);
  _tmp[idx] = entry;
  self.size = self.size + 1 | 0;
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$113$(self, idx, entry) {
  const _bind = self.tail;
  if (_bind === -1) {
    self.head = entry;
  } else {
    const _tmp = self.entries;
    $bound_check(_tmp, _bind);
    const _p = _tmp[_bind];
    let _tmp$2;
    if (_p === undefined) {
      _tmp$2 = $panic();
    } else {
      const _p$2 = _p;
      _tmp$2 = _p$2;
    }
    _tmp$2.next = entry;
  }
  self.tail = idx;
  const _tmp = self.entries;
  $bound_check(_tmp, idx);
  _tmp[idx] = entry;
  self.size = self.size + 1 | 0;
}
function moonbitlang$core$builtin$$Map$add_entry_to_tail$121$(self, idx, entry) {
  const _bind = self.tail;
  if (_bind === -1) {
    self.head = entry;
  } else {
    const _tmp = self.entries;
    $bound_check(_tmp, _bind);
    const _p = _tmp[_bind];
    let _tmp$2;
    if (_p === undefined) {
      _tmp$2 = $panic();
    } else {
      const _p$2 = _p;
      _tmp$2 = _p$2;
    }
    _tmp$2.next = entry;
  }
  self.tail = idx;
  const _tmp = self.entries;
  $bound_check(_tmp, idx);
  _tmp[idx] = entry;
  self.size = self.size + 1 | 0;
}
function moonbitlang$core$builtin$$Map$set_entry$114$(self, entry, new_idx) {
  const _tmp = self.entries;
  $bound_check(_tmp, new_idx);
  _tmp[new_idx] = entry;
  const _bind = entry.next;
  if (_bind === undefined) {
    self.tail = new_idx;
    return;
  } else {
    const _Some = _bind;
    const _next = _Some;
    _next.prev = new_idx;
    return;
  }
}
function moonbitlang$core$builtin$$Map$set_entry$115$(self, entry, new_idx) {
  const _tmp = self.entries;
  $bound_check(_tmp, new_idx);
  _tmp[new_idx] = entry;
  const _bind = entry.next;
  if (_bind === undefined) {
    self.tail = new_idx;
    return;
  } else {
    const _Some = _bind;
    const _next = _Some;
    _next.prev = new_idx;
    return;
  }
}
function moonbitlang$core$builtin$$Map$set_entry$58$(self, entry, new_idx) {
  const _tmp = self.entries;
  $bound_check(_tmp, new_idx);
  _tmp[new_idx] = entry;
  const _bind = entry.next;
  if (_bind === undefined) {
    self.tail = new_idx;
    return;
  } else {
    const _Some = _bind;
    const _next = _Some;
    _next.prev = new_idx;
    return;
  }
}
function moonbitlang$core$builtin$$Map$set_entry$120$(self, entry, new_idx) {
  const _tmp = self.entries;
  $bound_check(_tmp, new_idx);
  _tmp[new_idx] = entry;
  const _bind = entry.next;
  if (_bind === undefined) {
    self.tail = new_idx;
    return;
  } else {
    const _Some = _bind;
    const _next = _Some;
    _next.prev = new_idx;
    return;
  }
}
function moonbitlang$core$builtin$$Map$set_entry$116$(self, entry, new_idx) {
  const _tmp = self.entries;
  $bound_check(_tmp, new_idx);
  _tmp[new_idx] = entry;
  const _bind = entry.next;
  if (_bind === undefined) {
    self.tail = new_idx;
    return;
  } else {
    const _Some = _bind;
    const _next = _Some;
    _next.prev = new_idx;
    return;
  }
}
function moonbitlang$core$builtin$$Map$set_entry$117$(self, entry, new_idx) {
  const _tmp = self.entries;
  $bound_check(_tmp, new_idx);
  _tmp[new_idx] = entry;
  const _bind = entry.next;
  if (_bind === undefined) {
    self.tail = new_idx;
    return;
  } else {
    const _Some = _bind;
    const _next = _Some;
    _next.prev = new_idx;
    return;
  }
}
function moonbitlang$core$builtin$$Map$set_entry$118$(self, entry, new_idx) {
  const _tmp = self.entries;
  $bound_check(_tmp, new_idx);
  _tmp[new_idx] = entry;
  const _bind = entry.next;
  if (_bind === undefined) {
    self.tail = new_idx;
    return;
  } else {
    const _Some = _bind;
    const _next = _Some;
    _next.prev = new_idx;
    return;
  }
}
function moonbitlang$core$builtin$$Map$set_entry$119$(self, entry, new_idx) {
  const _tmp = self.entries;
  $bound_check(_tmp, new_idx);
  _tmp[new_idx] = entry;
  const _bind = entry.next;
  if (_bind === undefined) {
    self.tail = new_idx;
    return;
  } else {
    const _Some = _bind;
    const _next = _Some;
    _next.prev = new_idx;
    return;
  }
}
function moonbitlang$core$builtin$$Map$set_entry$113$(self, entry, new_idx) {
  const _tmp = self.entries;
  $bound_check(_tmp, new_idx);
  _tmp[new_idx] = entry;
  const _bind = entry.next;
  if (_bind === undefined) {
    self.tail = new_idx;
    return;
  } else {
    const _Some = _bind;
    const _next = _Some;
    _next.prev = new_idx;
    return;
  }
}
function moonbitlang$core$builtin$$Map$set_entry$121$(self, entry, new_idx) {
  const _tmp = self.entries;
  $bound_check(_tmp, new_idx);
  _tmp[new_idx] = entry;
  const _bind = entry.next;
  if (_bind === undefined) {
    self.tail = new_idx;
    return;
  } else {
    const _Some = _bind;
    const _next = _Some;
    _next.prev = new_idx;
    return;
  }
}
function moonbitlang$core$builtin$$Map$push_away$114$(self, idx, entry) {
  let _tmp = entry.psl + 1 | 0;
  let _tmp$2 = idx + 1 & self.capacity_mask;
  let _tmp$3 = entry;
  while (true) {
    const psl = _tmp;
    const idx$2 = _tmp$2;
    const entry$2 = _tmp$3;
    const _tmp$4 = self.entries;
    $bound_check(_tmp$4, idx$2);
    const _bind = _tmp$4[idx$2];
    if (_bind === undefined) {
      entry$2.psl = psl;
      moonbitlang$core$builtin$$Map$set_entry$114$(self, entry$2, idx$2);
      break;
    } else {
      const _Some = _bind;
      const _curr_entry = _Some;
      if (psl > _curr_entry.psl) {
        entry$2.psl = psl;
        moonbitlang$core$builtin$$Map$set_entry$114$(self, entry$2, idx$2);
        _tmp = _curr_entry.psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        _tmp$3 = _curr_entry;
        continue;
      } else {
        _tmp = psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$push_away$115$(self, idx, entry) {
  let _tmp = entry.psl + 1 | 0;
  let _tmp$2 = idx + 1 & self.capacity_mask;
  let _tmp$3 = entry;
  while (true) {
    const psl = _tmp;
    const idx$2 = _tmp$2;
    const entry$2 = _tmp$3;
    const _tmp$4 = self.entries;
    $bound_check(_tmp$4, idx$2);
    const _bind = _tmp$4[idx$2];
    if (_bind === undefined) {
      entry$2.psl = psl;
      moonbitlang$core$builtin$$Map$set_entry$115$(self, entry$2, idx$2);
      break;
    } else {
      const _Some = _bind;
      const _curr_entry = _Some;
      if (psl > _curr_entry.psl) {
        entry$2.psl = psl;
        moonbitlang$core$builtin$$Map$set_entry$115$(self, entry$2, idx$2);
        _tmp = _curr_entry.psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        _tmp$3 = _curr_entry;
        continue;
      } else {
        _tmp = psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$push_away$58$(self, idx, entry) {
  let _tmp = entry.psl + 1 | 0;
  let _tmp$2 = idx + 1 & self.capacity_mask;
  let _tmp$3 = entry;
  while (true) {
    const psl = _tmp;
    const idx$2 = _tmp$2;
    const entry$2 = _tmp$3;
    const _tmp$4 = self.entries;
    $bound_check(_tmp$4, idx$2);
    const _bind = _tmp$4[idx$2];
    if (_bind === undefined) {
      entry$2.psl = psl;
      moonbitlang$core$builtin$$Map$set_entry$58$(self, entry$2, idx$2);
      break;
    } else {
      const _Some = _bind;
      const _curr_entry = _Some;
      if (psl > _curr_entry.psl) {
        entry$2.psl = psl;
        moonbitlang$core$builtin$$Map$set_entry$58$(self, entry$2, idx$2);
        _tmp = _curr_entry.psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        _tmp$3 = _curr_entry;
        continue;
      } else {
        _tmp = psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$push_away$120$(self, idx, entry) {
  let _tmp = entry.psl + 1 | 0;
  let _tmp$2 = idx + 1 & self.capacity_mask;
  let _tmp$3 = entry;
  while (true) {
    const psl = _tmp;
    const idx$2 = _tmp$2;
    const entry$2 = _tmp$3;
    const _tmp$4 = self.entries;
    $bound_check(_tmp$4, idx$2);
    const _bind = _tmp$4[idx$2];
    if (_bind === undefined) {
      entry$2.psl = psl;
      moonbitlang$core$builtin$$Map$set_entry$120$(self, entry$2, idx$2);
      break;
    } else {
      const _Some = _bind;
      const _curr_entry = _Some;
      if (psl > _curr_entry.psl) {
        entry$2.psl = psl;
        moonbitlang$core$builtin$$Map$set_entry$120$(self, entry$2, idx$2);
        _tmp = _curr_entry.psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        _tmp$3 = _curr_entry;
        continue;
      } else {
        _tmp = psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$push_away$116$(self, idx, entry) {
  let _tmp = entry.psl + 1 | 0;
  let _tmp$2 = idx + 1 & self.capacity_mask;
  let _tmp$3 = entry;
  while (true) {
    const psl = _tmp;
    const idx$2 = _tmp$2;
    const entry$2 = _tmp$3;
    const _tmp$4 = self.entries;
    $bound_check(_tmp$4, idx$2);
    const _bind = _tmp$4[idx$2];
    if (_bind === undefined) {
      entry$2.psl = psl;
      moonbitlang$core$builtin$$Map$set_entry$116$(self, entry$2, idx$2);
      break;
    } else {
      const _Some = _bind;
      const _curr_entry = _Some;
      if (psl > _curr_entry.psl) {
        entry$2.psl = psl;
        moonbitlang$core$builtin$$Map$set_entry$116$(self, entry$2, idx$2);
        _tmp = _curr_entry.psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        _tmp$3 = _curr_entry;
        continue;
      } else {
        _tmp = psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$push_away$117$(self, idx, entry) {
  let _tmp = entry.psl + 1 | 0;
  let _tmp$2 = idx + 1 & self.capacity_mask;
  let _tmp$3 = entry;
  while (true) {
    const psl = _tmp;
    const idx$2 = _tmp$2;
    const entry$2 = _tmp$3;
    const _tmp$4 = self.entries;
    $bound_check(_tmp$4, idx$2);
    const _bind = _tmp$4[idx$2];
    if (_bind === undefined) {
      entry$2.psl = psl;
      moonbitlang$core$builtin$$Map$set_entry$117$(self, entry$2, idx$2);
      break;
    } else {
      const _Some = _bind;
      const _curr_entry = _Some;
      if (psl > _curr_entry.psl) {
        entry$2.psl = psl;
        moonbitlang$core$builtin$$Map$set_entry$117$(self, entry$2, idx$2);
        _tmp = _curr_entry.psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        _tmp$3 = _curr_entry;
        continue;
      } else {
        _tmp = psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$push_away$118$(self, idx, entry) {
  let _tmp = entry.psl + 1 | 0;
  let _tmp$2 = idx + 1 & self.capacity_mask;
  let _tmp$3 = entry;
  while (true) {
    const psl = _tmp;
    const idx$2 = _tmp$2;
    const entry$2 = _tmp$3;
    const _tmp$4 = self.entries;
    $bound_check(_tmp$4, idx$2);
    const _bind = _tmp$4[idx$2];
    if (_bind === undefined) {
      entry$2.psl = psl;
      moonbitlang$core$builtin$$Map$set_entry$118$(self, entry$2, idx$2);
      break;
    } else {
      const _Some = _bind;
      const _curr_entry = _Some;
      if (psl > _curr_entry.psl) {
        entry$2.psl = psl;
        moonbitlang$core$builtin$$Map$set_entry$118$(self, entry$2, idx$2);
        _tmp = _curr_entry.psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        _tmp$3 = _curr_entry;
        continue;
      } else {
        _tmp = psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$push_away$119$(self, idx, entry) {
  let _tmp = entry.psl + 1 | 0;
  let _tmp$2 = idx + 1 & self.capacity_mask;
  let _tmp$3 = entry;
  while (true) {
    const psl = _tmp;
    const idx$2 = _tmp$2;
    const entry$2 = _tmp$3;
    const _tmp$4 = self.entries;
    $bound_check(_tmp$4, idx$2);
    const _bind = _tmp$4[idx$2];
    if (_bind === undefined) {
      entry$2.psl = psl;
      moonbitlang$core$builtin$$Map$set_entry$119$(self, entry$2, idx$2);
      break;
    } else {
      const _Some = _bind;
      const _curr_entry = _Some;
      if (psl > _curr_entry.psl) {
        entry$2.psl = psl;
        moonbitlang$core$builtin$$Map$set_entry$119$(self, entry$2, idx$2);
        _tmp = _curr_entry.psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        _tmp$3 = _curr_entry;
        continue;
      } else {
        _tmp = psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$push_away$113$(self, idx, entry) {
  let _tmp = entry.psl + 1 | 0;
  let _tmp$2 = idx + 1 & self.capacity_mask;
  let _tmp$3 = entry;
  while (true) {
    const psl = _tmp;
    const idx$2 = _tmp$2;
    const entry$2 = _tmp$3;
    const _tmp$4 = self.entries;
    $bound_check(_tmp$4, idx$2);
    const _bind = _tmp$4[idx$2];
    if (_bind === undefined) {
      entry$2.psl = psl;
      moonbitlang$core$builtin$$Map$set_entry$113$(self, entry$2, idx$2);
      break;
    } else {
      const _Some = _bind;
      const _curr_entry = _Some;
      if (psl > _curr_entry.psl) {
        entry$2.psl = psl;
        moonbitlang$core$builtin$$Map$set_entry$113$(self, entry$2, idx$2);
        _tmp = _curr_entry.psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        _tmp$3 = _curr_entry;
        continue;
      } else {
        _tmp = psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$push_away$121$(self, idx, entry) {
  let _tmp = entry.psl + 1 | 0;
  let _tmp$2 = idx + 1 & self.capacity_mask;
  let _tmp$3 = entry;
  while (true) {
    const psl = _tmp;
    const idx$2 = _tmp$2;
    const entry$2 = _tmp$3;
    const _tmp$4 = self.entries;
    $bound_check(_tmp$4, idx$2);
    const _bind = _tmp$4[idx$2];
    if (_bind === undefined) {
      entry$2.psl = psl;
      moonbitlang$core$builtin$$Map$set_entry$121$(self, entry$2, idx$2);
      break;
    } else {
      const _Some = _bind;
      const _curr_entry = _Some;
      if (psl > _curr_entry.psl) {
        entry$2.psl = psl;
        moonbitlang$core$builtin$$Map$set_entry$121$(self, entry$2, idx$2);
        _tmp = _curr_entry.psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        _tmp$3 = _curr_entry;
        continue;
      } else {
        _tmp = psl + 1 | 0;
        _tmp$2 = idx$2 + 1 & self.capacity_mask;
        continue;
      }
    }
  }
}
function moonbitlang$core$builtin$$Map$set_with_hash$114$(self, key, value, hash) {
  if (self.size >= self.grow_at) {
    moonbitlang$core$builtin$$Map$grow$114$(self);
  }
  let _bind;
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const psl = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind$2 = _tmp$3[idx];
    if (_bind$2 === undefined) {
      _bind = { _0: idx, _1: psl };
      break;
    } else {
      const _Some = _bind$2;
      const _curr_entry = _Some;
      if (_curr_entry.hash === hash && _curr_entry.key === key) {
        _curr_entry.value = value;
        return undefined;
      }
      if (psl > _curr_entry.psl) {
        moonbitlang$core$builtin$$Map$push_away$114$(self, idx, _curr_entry);
        _bind = { _0: idx, _1: psl };
        break;
      }
      _tmp = psl + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
  const _idx = _bind._0;
  const _psl = _bind._1;
  const _bind$2 = self.tail;
  const _bind$3 = undefined;
  const entry = { prev: _bind$2, next: _bind$3, psl: _psl, hash: hash, key: key, value: value };
  moonbitlang$core$builtin$$Map$add_entry_to_tail$114$(self, _idx, entry);
}
function moonbitlang$core$builtin$$Map$set_with_hash$115$(self, key, value, hash) {
  if (self.size >= self.grow_at) {
    moonbitlang$core$builtin$$Map$grow$115$(self);
  }
  let _bind;
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const psl = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind$2 = _tmp$3[idx];
    if (_bind$2 === undefined) {
      _bind = { _0: idx, _1: psl };
      break;
    } else {
      const _Some = _bind$2;
      const _curr_entry = _Some;
      if (_curr_entry.hash === hash && _curr_entry.key === key) {
        _curr_entry.value = value;
        return undefined;
      }
      if (psl > _curr_entry.psl) {
        moonbitlang$core$builtin$$Map$push_away$115$(self, idx, _curr_entry);
        _bind = { _0: idx, _1: psl };
        break;
      }
      _tmp = psl + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
  const _idx = _bind._0;
  const _psl = _bind._1;
  const _bind$2 = self.tail;
  const _bind$3 = undefined;
  const entry = { prev: _bind$2, next: _bind$3, psl: _psl, hash: hash, key: key, value: value };
  moonbitlang$core$builtin$$Map$add_entry_to_tail$115$(self, _idx, entry);
}
function moonbitlang$core$builtin$$Map$set_with_hash$58$(self, key, value, hash) {
  if (self.size >= self.grow_at) {
    moonbitlang$core$builtin$$Map$grow$58$(self);
  }
  let _bind;
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const psl = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind$2 = _tmp$3[idx];
    if (_bind$2 === undefined) {
      _bind = { _0: idx, _1: psl };
      break;
    } else {
      const _Some = _bind$2;
      const _curr_entry = _Some;
      if (_curr_entry.hash === hash && _curr_entry.key === key) {
        _curr_entry.value = value;
        return undefined;
      }
      if (psl > _curr_entry.psl) {
        moonbitlang$core$builtin$$Map$push_away$58$(self, idx, _curr_entry);
        _bind = { _0: idx, _1: psl };
        break;
      }
      _tmp = psl + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
  const _idx = _bind._0;
  const _psl = _bind._1;
  const _bind$2 = self.tail;
  const _bind$3 = undefined;
  const entry = { prev: _bind$2, next: _bind$3, psl: _psl, hash: hash, key: key, value: value };
  moonbitlang$core$builtin$$Map$add_entry_to_tail$58$(self, _idx, entry);
}
function moonbitlang$core$builtin$$Map$set_with_hash$120$(self, key, value, hash) {
  if (self.size >= self.grow_at) {
    moonbitlang$core$builtin$$Map$grow$120$(self);
  }
  let _bind;
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const psl = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind$2 = _tmp$3[idx];
    if (_bind$2 === undefined) {
      _bind = { _0: idx, _1: psl };
      break;
    } else {
      const _Some = _bind$2;
      const _curr_entry = _Some;
      if (_curr_entry.hash === hash && _curr_entry.key === key) {
        _curr_entry.value = value;
        return undefined;
      }
      if (psl > _curr_entry.psl) {
        moonbitlang$core$builtin$$Map$push_away$120$(self, idx, _curr_entry);
        _bind = { _0: idx, _1: psl };
        break;
      }
      _tmp = psl + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
  const _idx = _bind._0;
  const _psl = _bind._1;
  const _bind$2 = self.tail;
  const _bind$3 = undefined;
  const entry = { prev: _bind$2, next: _bind$3, psl: _psl, hash: hash, key: key, value: value };
  moonbitlang$core$builtin$$Map$add_entry_to_tail$120$(self, _idx, entry);
}
function moonbitlang$core$builtin$$Map$set_with_hash$116$(self, key, value, hash) {
  if (self.size >= self.grow_at) {
    moonbitlang$core$builtin$$Map$grow$116$(self);
  }
  let _bind;
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const psl = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind$2 = _tmp$3[idx];
    if (_bind$2 === undefined) {
      _bind = { _0: idx, _1: psl };
      break;
    } else {
      const _Some = _bind$2;
      const _curr_entry = _Some;
      if (_curr_entry.hash === hash && _curr_entry.key === key) {
        _curr_entry.value = value;
        return undefined;
      }
      if (psl > _curr_entry.psl) {
        moonbitlang$core$builtin$$Map$push_away$116$(self, idx, _curr_entry);
        _bind = { _0: idx, _1: psl };
        break;
      }
      _tmp = psl + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
  const _idx = _bind._0;
  const _psl = _bind._1;
  const _bind$2 = self.tail;
  const _bind$3 = undefined;
  const entry = { prev: _bind$2, next: _bind$3, psl: _psl, hash: hash, key: key, value: value };
  moonbitlang$core$builtin$$Map$add_entry_to_tail$116$(self, _idx, entry);
}
function moonbitlang$core$builtin$$Map$set_with_hash$117$(self, key, value, hash) {
  if (self.size >= self.grow_at) {
    moonbitlang$core$builtin$$Map$grow$117$(self);
  }
  let _bind;
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const psl = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind$2 = _tmp$3[idx];
    if (_bind$2 === undefined) {
      _bind = { _0: idx, _1: psl };
      break;
    } else {
      const _Some = _bind$2;
      const _curr_entry = _Some;
      if (_curr_entry.hash === hash && _curr_entry.key === key) {
        _curr_entry.value = value;
        return undefined;
      }
      if (psl > _curr_entry.psl) {
        moonbitlang$core$builtin$$Map$push_away$117$(self, idx, _curr_entry);
        _bind = { _0: idx, _1: psl };
        break;
      }
      _tmp = psl + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
  const _idx = _bind._0;
  const _psl = _bind._1;
  const _bind$2 = self.tail;
  const _bind$3 = undefined;
  const entry = { prev: _bind$2, next: _bind$3, psl: _psl, hash: hash, key: key, value: value };
  moonbitlang$core$builtin$$Map$add_entry_to_tail$117$(self, _idx, entry);
}
function moonbitlang$core$builtin$$Map$set_with_hash$118$(self, key, value, hash) {
  if (self.size >= self.grow_at) {
    moonbitlang$core$builtin$$Map$grow$118$(self);
  }
  let _bind;
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const psl = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind$2 = _tmp$3[idx];
    if (_bind$2 === undefined) {
      _bind = { _0: idx, _1: psl };
      break;
    } else {
      const _Some = _bind$2;
      const _curr_entry = _Some;
      if (_curr_entry.hash === hash && moonbitlang$core$builtin$$Eq$equal$41$(_curr_entry.key, key)) {
        _curr_entry.value = value;
        return undefined;
      }
      if (psl > _curr_entry.psl) {
        moonbitlang$core$builtin$$Map$push_away$118$(self, idx, _curr_entry);
        _bind = { _0: idx, _1: psl };
        break;
      }
      _tmp = psl + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
  const _idx = _bind._0;
  const _psl = _bind._1;
  const _bind$2 = self.tail;
  const _bind$3 = undefined;
  const entry = { prev: _bind$2, next: _bind$3, psl: _psl, hash: hash, key: key, value: value };
  moonbitlang$core$builtin$$Map$add_entry_to_tail$118$(self, _idx, entry);
}
function moonbitlang$core$builtin$$Map$set_with_hash$119$(self, key, value, hash) {
  if (self.size >= self.grow_at) {
    moonbitlang$core$builtin$$Map$grow$119$(self);
  }
  let _bind;
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const psl = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind$2 = _tmp$3[idx];
    if (_bind$2 === undefined) {
      _bind = { _0: idx, _1: psl };
      break;
    } else {
      const _Some = _bind$2;
      const _curr_entry = _Some;
      if (_curr_entry.hash === hash && moonbitlang$core$builtin$$Eq$equal$42$(_curr_entry.key, key)) {
        _curr_entry.value = value;
        return undefined;
      }
      if (psl > _curr_entry.psl) {
        moonbitlang$core$builtin$$Map$push_away$119$(self, idx, _curr_entry);
        _bind = { _0: idx, _1: psl };
        break;
      }
      _tmp = psl + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
  const _idx = _bind._0;
  const _psl = _bind._1;
  const _bind$2 = self.tail;
  const _bind$3 = undefined;
  const entry = { prev: _bind$2, next: _bind$3, psl: _psl, hash: hash, key: key, value: value };
  moonbitlang$core$builtin$$Map$add_entry_to_tail$119$(self, _idx, entry);
}
function moonbitlang$core$builtin$$Map$set_with_hash$113$(self, key, value, hash) {
  if (self.size >= self.grow_at) {
    moonbitlang$core$builtin$$Map$grow$113$(self);
  }
  let _bind;
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const psl = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind$2 = _tmp$3[idx];
    if (_bind$2 === undefined) {
      _bind = { _0: idx, _1: psl };
      break;
    } else {
      const _Some = _bind$2;
      const _curr_entry = _Some;
      if (_curr_entry.hash === hash && moonbitlang$core$builtin$$Eq$equal$39$(_curr_entry.key, key)) {
        _curr_entry.value = value;
        return undefined;
      }
      if (psl > _curr_entry.psl) {
        moonbitlang$core$builtin$$Map$push_away$113$(self, idx, _curr_entry);
        _bind = { _0: idx, _1: psl };
        break;
      }
      _tmp = psl + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
  const _idx = _bind._0;
  const _psl = _bind._1;
  const _bind$2 = self.tail;
  const _bind$3 = undefined;
  const entry = { prev: _bind$2, next: _bind$3, psl: _psl, hash: hash, key: key, value: value };
  moonbitlang$core$builtin$$Map$add_entry_to_tail$113$(self, _idx, entry);
}
function moonbitlang$core$builtin$$Map$set_with_hash$121$(self, key, value, hash) {
  if (self.size >= self.grow_at) {
    moonbitlang$core$builtin$$Map$grow$121$(self);
  }
  let _bind;
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const psl = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind$2 = _tmp$3[idx];
    if (_bind$2 === undefined) {
      _bind = { _0: idx, _1: psl };
      break;
    } else {
      const _Some = _bind$2;
      const _curr_entry = _Some;
      if (_curr_entry.hash === hash && _curr_entry.key === key) {
        _curr_entry.value = value;
        return undefined;
      }
      if (psl > _curr_entry.psl) {
        moonbitlang$core$builtin$$Map$push_away$121$(self, idx, _curr_entry);
        _bind = { _0: idx, _1: psl };
        break;
      }
      _tmp = psl + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
  const _idx = _bind._0;
  const _psl = _bind._1;
  const _bind$2 = self.tail;
  const _bind$3 = undefined;
  const entry = { prev: _bind$2, next: _bind$3, psl: _psl, hash: hash, key: key, value: value };
  moonbitlang$core$builtin$$Map$add_entry_to_tail$121$(self, _idx, entry);
}
function moonbitlang$core$builtin$$Map$grow$114$(self) {
  const old_head = self.head;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  const _p = self.capacity;
  self.grow_at = (Math.imul(_p, 13) | 0) / 16 | 0;
  self.size = 0;
  self.head = undefined;
  self.tail = -1;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _next = _x.next;
      const _key = _x.key;
      const _value = _x.value;
      const _hash = _x.hash;
      moonbitlang$core$builtin$$Map$set_with_hash$114$(self, _key, _value, _hash);
      _tmp = _next;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$grow$115$(self) {
  const old_head = self.head;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  const _p = self.capacity;
  self.grow_at = (Math.imul(_p, 13) | 0) / 16 | 0;
  self.size = 0;
  self.head = undefined;
  self.tail = -1;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _next = _x.next;
      const _key = _x.key;
      const _value = _x.value;
      const _hash = _x.hash;
      moonbitlang$core$builtin$$Map$set_with_hash$115$(self, _key, _value, _hash);
      _tmp = _next;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$grow$58$(self) {
  const old_head = self.head;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  const _p = self.capacity;
  self.grow_at = (Math.imul(_p, 13) | 0) / 16 | 0;
  self.size = 0;
  self.head = undefined;
  self.tail = -1;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _next = _x.next;
      const _key = _x.key;
      const _value = _x.value;
      const _hash = _x.hash;
      moonbitlang$core$builtin$$Map$set_with_hash$58$(self, _key, _value, _hash);
      _tmp = _next;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$grow$120$(self) {
  const old_head = self.head;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  const _p = self.capacity;
  self.grow_at = (Math.imul(_p, 13) | 0) / 16 | 0;
  self.size = 0;
  self.head = undefined;
  self.tail = -1;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _next = _x.next;
      const _key = _x.key;
      const _value = _x.value;
      const _hash = _x.hash;
      moonbitlang$core$builtin$$Map$set_with_hash$120$(self, _key, _value, _hash);
      _tmp = _next;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$grow$116$(self) {
  const old_head = self.head;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  const _p = self.capacity;
  self.grow_at = (Math.imul(_p, 13) | 0) / 16 | 0;
  self.size = 0;
  self.head = undefined;
  self.tail = -1;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _next = _x.next;
      const _key = _x.key;
      const _value = _x.value;
      const _hash = _x.hash;
      moonbitlang$core$builtin$$Map$set_with_hash$116$(self, _key, _value, _hash);
      _tmp = _next;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$grow$117$(self) {
  const old_head = self.head;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  const _p = self.capacity;
  self.grow_at = (Math.imul(_p, 13) | 0) / 16 | 0;
  self.size = 0;
  self.head = undefined;
  self.tail = -1;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _next = _x.next;
      const _key = _x.key;
      const _value = _x.value;
      const _hash = _x.hash;
      moonbitlang$core$builtin$$Map$set_with_hash$117$(self, _key, _value, _hash);
      _tmp = _next;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$grow$118$(self) {
  const old_head = self.head;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  const _p = self.capacity;
  self.grow_at = (Math.imul(_p, 13) | 0) / 16 | 0;
  self.size = 0;
  self.head = undefined;
  self.tail = -1;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _next = _x.next;
      const _key = _x.key;
      const _value = _x.value;
      const _hash = _x.hash;
      moonbitlang$core$builtin$$Map$set_with_hash$118$(self, _key, _value, _hash);
      _tmp = _next;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$grow$119$(self) {
  const old_head = self.head;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  const _p = self.capacity;
  self.grow_at = (Math.imul(_p, 13) | 0) / 16 | 0;
  self.size = 0;
  self.head = undefined;
  self.tail = -1;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _next = _x.next;
      const _key = _x.key;
      const _value = _x.value;
      const _hash = _x.hash;
      moonbitlang$core$builtin$$Map$set_with_hash$119$(self, _key, _value, _hash);
      _tmp = _next;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$grow$113$(self) {
  const old_head = self.head;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  const _p = self.capacity;
  self.grow_at = (Math.imul(_p, 13) | 0) / 16 | 0;
  self.size = 0;
  self.head = undefined;
  self.tail = -1;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _next = _x.next;
      const _key = _x.key;
      const _value = _x.value;
      const _hash = _x.hash;
      moonbitlang$core$builtin$$Map$set_with_hash$113$(self, _key, _value, _hash);
      _tmp = _next;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$grow$121$(self) {
  const old_head = self.head;
  const new_capacity = self.capacity << 1;
  self.entries = $make_array_len_and_init(new_capacity, undefined);
  self.capacity = new_capacity;
  self.capacity_mask = new_capacity - 1 | 0;
  const _p = self.capacity;
  self.grow_at = (Math.imul(_p, 13) | 0) / 16 | 0;
  self.size = 0;
  self.head = undefined;
  self.tail = -1;
  let _tmp = old_head;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _x = _Some;
      const _next = _x.next;
      const _key = _x.key;
      const _value = _x.value;
      const _hash = _x.hash;
      moonbitlang$core$builtin$$Map$set_with_hash$121$(self, _key, _value, _hash);
      _tmp = _next;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$set$114$(self, key, value) {
  moonbitlang$core$builtin$$Map$set_with_hash$114$(self, key, value, moonbitlang$core$builtin$$Hash$hash$4$(key));
}
function moonbitlang$core$builtin$$Map$set$115$(self, key, value) {
  moonbitlang$core$builtin$$Map$set_with_hash$115$(self, key, value, moonbitlang$core$builtin$$Hash$hash$4$(key));
}
function moonbitlang$core$builtin$$Map$set$58$(self, key, value) {
  moonbitlang$core$builtin$$Map$set_with_hash$58$(self, key, value, moonbitlang$core$builtin$$Hash$hash$4$(key));
}
function moonbitlang$core$builtin$$Map$set$120$(self, key, value) {
  moonbitlang$core$builtin$$Map$set_with_hash$120$(self, key, value, moonbitlang$core$builtin$$Hash$hash$4$(key));
}
function moonbitlang$core$builtin$$Map$set$116$(self, key, value) {
  moonbitlang$core$builtin$$Map$set_with_hash$116$(self, key, value, moonbitlang$core$builtin$$Hash$hash$4$(key));
}
function moonbitlang$core$builtin$$Map$set$117$(self, key, value) {
  moonbitlang$core$builtin$$Map$set_with_hash$117$(self, key, value, moonbitlang$core$builtin$$Hash$hash$4$(key));
}
function moonbitlang$core$builtin$$Map$set$118$(self, key, value) {
  moonbitlang$core$builtin$$Map$set_with_hash$118$(self, key, value, moonbitlang$core$builtin$$Hash$hash$105$(key));
}
function moonbitlang$core$builtin$$Map$set$119$(self, key, value) {
  moonbitlang$core$builtin$$Map$set_with_hash$119$(self, key, value, moonbitlang$core$builtin$$Hash$hash$102$(key));
}
function moonbitlang$core$builtin$$Map$set$113$(self, key, value) {
  moonbitlang$core$builtin$$Map$set_with_hash$113$(self, key, value, moonbitlang$core$builtin$$Hash$hash$103$(key));
}
function moonbitlang$core$builtin$$Map$set$121$(self, key, value) {
  moonbitlang$core$builtin$$Map$set_with_hash$121$(self, key, value, moonbitlang$core$builtin$$Hash$hash$104$(key));
}
function moonbitlang$core$builtin$$Map$from_array$114$(arr) {
  const m = moonbitlang$core$builtin$$Map$new$46$inner$114$(arr.length);
  const _p = arr.length;
  let _tmp = 0;
  while (true) {
    const _p$2 = _tmp;
    if (_p$2 < _p) {
      const _p$3 = arr[_p$2];
      moonbitlang$core$builtin$$Map$set$114$(m, _p$3._0, _p$3._1);
      _tmp = _p$2 + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return m;
}
function moonbitlang$core$builtin$$Map$from_array$115$(arr) {
  const m = moonbitlang$core$builtin$$Map$new$46$inner$115$(arr.length);
  const _p = arr.length;
  let _tmp = 0;
  while (true) {
    const _p$2 = _tmp;
    if (_p$2 < _p) {
      const _p$3 = arr[_p$2];
      moonbitlang$core$builtin$$Map$set$115$(m, _p$3._0, _p$3._1);
      _tmp = _p$2 + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return m;
}
function moonbitlang$core$builtin$$Map$from_array$58$(arr) {
  const m = moonbitlang$core$builtin$$Map$new$46$inner$58$(arr.length);
  const _p = arr.length;
  let _tmp = 0;
  while (true) {
    const _p$2 = _tmp;
    if (_p$2 < _p) {
      const _p$3 = arr[_p$2];
      moonbitlang$core$builtin$$Map$set$58$(m, _p$3._0, _p$3._1);
      _tmp = _p$2 + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return m;
}
function moonbitlang$core$builtin$$Map$from_array$117$(arr) {
  const m = moonbitlang$core$builtin$$Map$new$46$inner$117$(arr.length);
  const _p = arr.length;
  let _tmp = 0;
  while (true) {
    const _p$2 = _tmp;
    if (_p$2 < _p) {
      const _p$3 = arr[_p$2];
      moonbitlang$core$builtin$$Map$set$117$(m, _p$3._0, _p$3._1);
      _tmp = _p$2 + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return m;
}
function moonbitlang$core$builtin$$Map$from_array$118$(arr) {
  const m = moonbitlang$core$builtin$$Map$new$46$inner$118$(arr.length);
  const _p = arr.length;
  let _tmp = 0;
  while (true) {
    const _p$2 = _tmp;
    if (_p$2 < _p) {
      const _p$3 = arr[_p$2];
      moonbitlang$core$builtin$$Map$set$118$(m, _p$3._0, _p$3._1);
      _tmp = _p$2 + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return m;
}
function moonbitlang$core$builtin$$Map$from_array$119$(arr) {
  const m = moonbitlang$core$builtin$$Map$new$46$inner$119$(arr.length);
  const _p = arr.length;
  let _tmp = 0;
  while (true) {
    const _p$2 = _tmp;
    if (_p$2 < _p) {
      const _p$3 = arr[_p$2];
      moonbitlang$core$builtin$$Map$set$119$(m, _p$3._0, _p$3._1);
      _tmp = _p$2 + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return m;
}
function moonbitlang$core$builtin$$Map$from_array$120$(arr) {
  const m = moonbitlang$core$builtin$$Map$new$46$inner$120$(arr.length);
  const _p = arr.length;
  let _tmp = 0;
  while (true) {
    const _p$2 = _tmp;
    if (_p$2 < _p) {
      const _p$3 = arr[_p$2];
      moonbitlang$core$builtin$$Map$set$120$(m, _p$3._0, _p$3._1);
      _tmp = _p$2 + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return m;
}
function moonbitlang$core$builtin$$Map$from_array$116$(arr) {
  const m = moonbitlang$core$builtin$$Map$new$46$inner$116$(arr.length);
  const _p = arr.length;
  let _tmp = 0;
  while (true) {
    const _p$2 = _tmp;
    if (_p$2 < _p) {
      const _p$3 = arr[_p$2];
      moonbitlang$core$builtin$$Map$set$116$(m, _p$3._0, _p$3._1);
      _tmp = _p$2 + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return m;
}
function moonbitlang$core$builtin$$Map$from_array$121$(arr) {
  const m = moonbitlang$core$builtin$$Map$new$46$inner$121$(arr.length);
  const _p = arr.length;
  let _tmp = 0;
  while (true) {
    const _p$2 = _tmp;
    if (_p$2 < _p) {
      const _p$3 = arr[_p$2];
      moonbitlang$core$builtin$$Map$set$121$(m, _p$3._0, _p$3._1);
      _tmp = _p$2 + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return m;
}
function moonbitlang$core$builtin$$Map$op_set$114$(self, key, value) {
  moonbitlang$core$builtin$$Map$set$114$(self, key, value);
}
function moonbitlang$core$builtin$$Map$op_set$115$(self, key, value) {
  moonbitlang$core$builtin$$Map$set$115$(self, key, value);
}
function moonbitlang$core$builtin$$Map$op_set$58$(self, key, value) {
  moonbitlang$core$builtin$$Map$set$58$(self, key, value);
}
function moonbitlang$core$builtin$$Map$op_set$117$(self, key, value) {
  moonbitlang$core$builtin$$Map$set$117$(self, key, value);
}
function moonbitlang$core$builtin$$Map$op_set$120$(self, key, value) {
  moonbitlang$core$builtin$$Map$set$120$(self, key, value);
}
function moonbitlang$core$builtin$$Map$op_set$116$(self, key, value) {
  moonbitlang$core$builtin$$Map$set$116$(self, key, value);
}
function moonbitlang$core$builtin$$Map$op_set$119$(self, key, value) {
  moonbitlang$core$builtin$$Map$set$119$(self, key, value);
}
function moonbitlang$core$builtin$$Map$op_set$113$(self, key, value) {
  moonbitlang$core$builtin$$Map$set$113$(self, key, value);
}
function moonbitlang$core$builtin$$Map$op_set$118$(self, key, value) {
  moonbitlang$core$builtin$$Map$set$118$(self, key, value);
}
function moonbitlang$core$builtin$$Map$get$120$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$4$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind = _tmp$3[idx];
    if (_bind === undefined) {
      return Option$None$24$;
    } else {
      const _Some = _bind;
      const _entry = _Some;
      if (_entry.hash === hash && _entry.key === key) {
        return new Option$Some$24$(_entry.value);
      }
      if (i > _entry.psl) {
        return Option$None$24$;
      }
      _tmp = i + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$get$116$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$4$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind = _tmp$3[idx];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _entry = _Some;
      if (_entry.hash === hash && _entry.key === key) {
        return _entry.value;
      }
      if (i > _entry.psl) {
        return undefined;
      }
      _tmp = i + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$get$114$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$4$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind = _tmp$3[idx];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _entry = _Some;
      if (_entry.hash === hash && _entry.key === key) {
        return _entry.value;
      }
      if (i > _entry.psl) {
        return undefined;
      }
      _tmp = i + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$get$115$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$4$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind = _tmp$3[idx];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _entry = _Some;
      if (_entry.hash === hash && _entry.key === key) {
        return _entry.value;
      }
      if (i > _entry.psl) {
        return undefined;
      }
      _tmp = i + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$get$58$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$4$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind = _tmp$3[idx];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _entry = _Some;
      if (_entry.hash === hash && _entry.key === key) {
        return _entry.value;
      }
      if (i > _entry.psl) {
        return undefined;
      }
      _tmp = i + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$get$119$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$102$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind = _tmp$3[idx];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _entry = _Some;
      if (_entry.hash === hash && moonbitlang$core$builtin$$Eq$equal$42$(_entry.key, key)) {
        return _entry.value;
      }
      if (i > _entry.psl) {
        return undefined;
      }
      _tmp = i + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$get$113$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$103$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind = _tmp$3[idx];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _entry = _Some;
      if (_entry.hash === hash && moonbitlang$core$builtin$$Eq$equal$39$(_entry.key, key)) {
        return _entry.value;
      }
      if (i > _entry.psl) {
        return undefined;
      }
      _tmp = i + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$get$121$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$104$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind = _tmp$3[idx];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _entry = _Some;
      if (_entry.hash === hash && _entry.key === key) {
        return _entry.value;
      }
      if (i > _entry.psl) {
        return undefined;
      }
      _tmp = i + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$get$117$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$4$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind = _tmp$3[idx];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _entry = _Some;
      if (_entry.hash === hash && _entry.key === key) {
        return _entry.value;
      }
      if (i > _entry.psl) {
        return undefined;
      }
      _tmp = i + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$get$118$(self, key) {
  const hash = moonbitlang$core$builtin$$Hash$hash$105$(key);
  let _tmp = 0;
  let _tmp$2 = hash & self.capacity_mask;
  while (true) {
    const i = _tmp;
    const idx = _tmp$2;
    const _tmp$3 = self.entries;
    $bound_check(_tmp$3, idx);
    const _bind = _tmp$3[idx];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _entry = _Some;
      if (_entry.hash === hash && moonbitlang$core$builtin$$Eq$equal$41$(_entry.key, key)) {
        return _entry.value;
      }
      if (i > _entry.psl) {
        return undefined;
      }
      _tmp = i + 1 | 0;
      _tmp$2 = idx + 1 & self.capacity_mask;
      continue;
    }
  }
}
function moonbitlang$core$builtin$$Map$iter$114$(self) {
  const _p = (yield_) => {
    let _tmp = self.head;
    while (true) {
      const _param = _tmp;
      if (_param === undefined) {
        return 1;
      } else {
        const _Some = _param;
        const _x = _Some;
        const _key = _x.key;
        const _value = _x.value;
        const _next = _x.next;
        const _bind = yield_({ _0: _key, _1: _value });
        if (_bind === 1) {
          _tmp = _next;
          continue;
        } else {
          return 0;
        }
      }
    }
  };
  return _p;
}
function moonbitlang$core$builtin$$Map$iter$120$(self) {
  const _p = (yield_) => {
    let _tmp = self.head;
    while (true) {
      const _param = _tmp;
      if (_param === undefined) {
        return 1;
      } else {
        const _Some = _param;
        const _x = _Some;
        const _key = _x.key;
        const _value = _x.value;
        const _next = _x.next;
        const _bind = yield_({ _0: _key, _1: _value });
        if (_bind === 1) {
          _tmp = _next;
          continue;
        } else {
          return 0;
        }
      }
    }
  };
  return _p;
}
function moonbitlang$core$builtin$$Map$iter$116$(self) {
  const _p = (yield_) => {
    let _tmp = self.head;
    while (true) {
      const _param = _tmp;
      if (_param === undefined) {
        return 1;
      } else {
        const _Some = _param;
        const _x = _Some;
        const _key = _x.key;
        const _value = _x.value;
        const _next = _x.next;
        const _bind = yield_({ _0: _key, _1: _value });
        if (_bind === 1) {
          _tmp = _next;
          continue;
        } else {
          return 0;
        }
      }
    }
  };
  return _p;
}
function moonbitlang$core$builtin$$Map$iter$113$(self) {
  const _p = (yield_) => {
    let _tmp = self.head;
    while (true) {
      const _param = _tmp;
      if (_param === undefined) {
        return 1;
      } else {
        const _Some = _param;
        const _x = _Some;
        const _key = _x.key;
        const _value = _x.value;
        const _next = _x.next;
        const _bind = yield_({ _0: _key, _1: _value });
        if (_bind === 1) {
          _tmp = _next;
          continue;
        } else {
          return 0;
        }
      }
    }
  };
  return _p;
}
function moonbitlang$core$builtin$$Map$iter2$120$(self) {
  const _p = (yield_) => {
    let _tmp = self.head;
    while (true) {
      const _param = _tmp;
      if (_param === undefined) {
        return 1;
      } else {
        const _Some = _param;
        const _x = _Some;
        const _key = _x.key;
        const _value = _x.value;
        const _next = _x.next;
        const _bind = yield_(_key, _value);
        if (_bind === 1) {
          _tmp = _next;
          continue;
        } else {
          return 0;
        }
      }
    }
  };
  return _p;
}
function moonbitlang$core$builtin$$Map$iter2$115$(self) {
  const _p = (yield_) => {
    let _tmp = self.head;
    while (true) {
      const _param = _tmp;
      if (_param === undefined) {
        return 1;
      } else {
        const _Some = _param;
        const _x = _Some;
        const _key = _x.key;
        const _value = _x.value;
        const _next = _x.next;
        const _bind = yield_(_key, _value);
        if (_bind === 1) {
          _tmp = _next;
          continue;
        } else {
          return 0;
        }
      }
    }
  };
  return _p;
}
function moonbitlang$core$builtin$$Map$iter2$116$(self) {
  const _p = (yield_) => {
    let _tmp = self.head;
    while (true) {
      const _param = _tmp;
      if (_param === undefined) {
        return 1;
      } else {
        const _Some = _param;
        const _x = _Some;
        const _key = _x.key;
        const _value = _x.value;
        const _next = _x.next;
        const _bind = yield_(_key, _value);
        if (_bind === 1) {
          _tmp = _next;
          continue;
        } else {
          return 0;
        }
      }
    }
  };
  return _p;
}
function moonbitlang$core$builtin$$Map$iter2$119$(self) {
  const _p = (yield_) => {
    let _tmp = self.head;
    while (true) {
      const _param = _tmp;
      if (_param === undefined) {
        return 1;
      } else {
        const _Some = _param;
        const _x = _Some;
        const _key = _x.key;
        const _value = _x.value;
        const _next = _x.next;
        const _bind = yield_(_key, _value);
        if (_bind === 1) {
          _tmp = _next;
          continue;
        } else {
          return 0;
        }
      }
    }
  };
  return _p;
}
function moonbitlang$core$builtin$$Map$keys$116$(self) {
  const _p = (yield_) => {
    let _tmp = self.head;
    while (true) {
      const _param = _tmp;
      if (_param === undefined) {
        return 1;
      } else {
        const _Some = _param;
        const _x = _Some;
        const _key = _x.key;
        const _next = _x.next;
        const _bind = yield_(_key);
        if (_bind === 1) {
          _tmp = _next;
          continue;
        } else {
          return 0;
        }
      }
    }
  };
  return _p;
}
function moonbitlang$core$builtin$$Map$from_iter$120$(iter) {
  const m = moonbitlang$core$builtin$$Map$from_array$120$([]);
  iter((e) => {
    moonbitlang$core$builtin$$Map$set$120$(m, e._0, e._1);
    return 1;
  });
  return m;
}
function moonbitlang$core$builtin$$Map$from_iter$116$(iter) {
  const m = moonbitlang$core$builtin$$Map$from_array$116$([]);
  iter((e) => {
    moonbitlang$core$builtin$$Map$set$116$(m, e._0, e._1);
    return 1;
  });
  return m;
}
function moonbitlang$core$builtin$$Map$from_iter$121$(iter) {
  const m = moonbitlang$core$builtin$$Map$from_array$121$([]);
  iter((e) => {
    moonbitlang$core$builtin$$Map$set$121$(m, e._0, e._1);
    return 1;
  });
  return m;
}
function moonbitlang$core$array$$Array$push$2$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$51$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$9$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$24$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$108$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$15$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$88$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$14$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$122$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$123$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$4$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$124$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$125$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$76$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$85$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$126$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$127$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$40$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$89$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$128$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$110$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$129$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$65$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$10$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$27$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$130$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$131$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$22$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$91$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$66$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$132$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$array$$Array$push$133$(self, value) {
  moonbitlang$core$builtin$$JSArray$push(self, value);
}
function moonbitlang$core$builtin$$Iter$run$134$(self, f) {
  const _func = self;
  return _func(f);
}
function moonbitlang$core$builtin$$Iter$run$40$(self, f) {
  const _func = self;
  return _func(f);
}
function moonbitlang$core$builtin$$Iter$run$131$(self, f) {
  const _func = self;
  return _func(f);
}
function moonbitlang$core$builtin$$Iter$each$35$(self, f) {
  const _foreach_result = { val: $64$moonbitlang$47$core$47$builtin$46$ForeachResult$Continue$25$ };
  self((a) => {
    f(a);
    return 1;
  });
  const _tmp = _foreach_result.val;
  switch (_tmp.$tag) {
    case 0: {
      return;
    }
    case 1: {
      const _break = _tmp;
      _break._0;
      return;
    }
    case 2: {
      const _return = _tmp;
      return _return._0;
    }
    case 3: {
      $panic();
      return;
    }
    default: {
      $panic();
      return;
    }
  }
}
function moonbitlang$core$builtin$$Iter$empty$4$() {
  return (_discard_) => 1;
}
function moonbitlang$core$int$$Int$until$46$inner(self, end, step, inclusive) {
  if (step === 0) {
    return moonbitlang$core$builtin$$Iter$empty$4$();
  }
  return (yield_) => {
    let i = self;
    while (true) {
      if (step > 0 && i < end || (step < 0 && i > end || inclusive && i === end)) {
        if (moonbitlang$core$builtin$$Eq$equal$53$(yield_(i), 0)) {
          return 0;
        }
        const next = i + step | 0;
        if (step > 0 && next >= i || step < 0 && next <= i) {
          i = next;
        } else {
          return 1;
        }
        continue;
      } else {
        return 1;
      }
    }
  };
}
function moonbitlang$core$builtin$$Iter$filter_map$135$(self, f) {
  return (yield_) => moonbitlang$core$builtin$$Iter$run$40$(self, (a) => {
    const _bind = f(a);
    if (_bind === undefined) {
      return 1;
    } else {
      const _Some = _bind;
      const _b = _Some;
      return yield_(_b);
    }
  });
}
function moonbitlang$core$builtin$$Iter$to_array$14$(self) {
  const result = [];
  self((e) => {
    moonbitlang$core$array$$Array$push$14$(result, e);
    return 1;
  });
  return result;
}
function moonbitlang$core$builtin$$Iter$to_array$125$(self) {
  const result = [];
  self((e) => {
    moonbitlang$core$array$$Array$push$125$(result, e);
    return 1;
  });
  return result;
}
function moonbitlang$core$builtin$$Iter$to_array$127$(self) {
  const result = [];
  self((e) => {
    moonbitlang$core$array$$Array$push$127$(result, e);
    return 1;
  });
  return result;
}
function moonbitlang$core$builtin$$Iter$to_array$40$(self) {
  const result = [];
  self((e) => {
    moonbitlang$core$array$$Array$push$40$(result, e);
    return 1;
  });
  return result;
}
function moonbitlang$core$builtin$$Iter$to_array$131$(self) {
  const result = [];
  self((e) => {
    moonbitlang$core$array$$Array$push$131$(result, e);
    return 1;
  });
  return result;
}
function moonbitlang$core$builtin$$Iter$to_array$27$(self) {
  const result = [];
  self((e) => {
    moonbitlang$core$array$$Array$push$27$(result, e);
    return 1;
  });
  return result;
}
function moonbitlang$core$builtin$$Iter$collect$4$(self) {
  const result = [];
  moonbitlang$core$builtin$$Iter$each$35$(self, (e) => {
    moonbitlang$core$array$$Array$push$4$(result, e);
  });
  return result;
}
function moonbitlang$core$builtin$$Iter$join(self, sep) {
  const buf = moonbitlang$core$builtin$$StringBuilder$new$46$inner(0);
  const first = { val: true };
  self((str) => {
    if (first.val) {
      first.val = false;
    } else {
      moonbitlang$core$builtin$$Logger$write_string$25$(buf, sep);
    }
    moonbitlang$core$builtin$$Logger$write_string$25$(buf, str);
    return 1;
  });
  return buf.val;
}
function moonbitlang$core$builtin$$Iter$maximum$4$(self) {
  const res = { val: undefined };
  self((x) => {
    const _bind = res.val;
    if (_bind === undefined) {
      res.val = x;
    } else {
      const _Some = _bind;
      const _max = _Some;
      if (x > _max) {
        res.val = x;
      }
    }
    return 1;
  });
  return res.val;
}
function moonbitlang$core$bytes$$Bytes$make(len, init) {
  if (len < 0) {
    return $bytes_literal$0;
  }
  return $makebytes(len, init);
}
function moonbitlang$core$builtin$$MyInt64$add_hi_lo(self, bhi, blo) {
  const _ahi = self.hi;
  const _alo = self.lo;
  const lo = _alo + blo | 0;
  const s = lo >> 31;
  const as_ = _alo >> 31;
  const bs = blo >> 31;
  const c = (as_ & bs | ~s & (as_ ^ bs)) & 1;
  const hi = (_ahi + bhi | 0) + c | 0;
  return { hi: hi, lo: lo };
}
function moonbitlang$core$builtin$$Add$add$136$(self, other) {
  return moonbitlang$core$builtin$$MyInt64$add_hi_lo(self, other.hi, other.lo);
}
function moonbitlang$core$builtin$$Sub$sub$136$(self, other) {
  return other.lo === 0 ? { hi: self.hi - other.hi | 0, lo: self.lo } : moonbitlang$core$builtin$$MyInt64$add_hi_lo(self, ~other.hi, ~other.lo + 1 | 0);
}
function moonbitlang$core$builtin$$Mul$mul$136$(self, other) {
  const _ahi = self.hi;
  const _alo = self.lo;
  const _bhi = other.hi;
  const _blo = other.lo;
  const ahi = _ahi;
  const alo = _alo;
  const bhi = _bhi;
  const blo = _blo;
  const a48 = ahi >>> 16 | 0;
  const a32 = ahi & 65535;
  const a16 = alo >>> 16 | 0;
  const a00 = alo & 65535;
  const b48 = bhi >>> 16 | 0;
  const b32 = bhi & 65535;
  const b16 = blo >>> 16 | 0;
  const b00 = blo & 65535;
  const c00 = Math.imul(a00, b00) | 0;
  const c16 = c00 >>> 16 | 0;
  const c00$2 = c00 & 65535;
  const c16$2 = (c16 >>> 0) + ((Math.imul(a16, b00) | 0) >>> 0) | 0;
  const c32 = c16$2 >>> 16 | 0;
  const c16$3 = c16$2 & 65535;
  const c16$4 = (c16$3 >>> 0) + ((Math.imul(a00, b16) | 0) >>> 0) | 0;
  const c32$2 = (c32 >>> 0) + ((c16$4 >>> 16 | 0) >>> 0) | 0;
  const c16$5 = c16$4 & 65535;
  const c32$3 = (c32$2 >>> 0) + ((Math.imul(a32, b00) | 0) >>> 0) | 0;
  const c48 = c32$3 >>> 16 | 0;
  const c32$4 = c32$3 & 65535;
  const c32$5 = (c32$4 >>> 0) + ((Math.imul(a16, b16) | 0) >>> 0) | 0;
  const c48$2 = (c48 >>> 0) + ((c32$5 >>> 16 | 0) >>> 0) | 0;
  const c32$6 = c32$5 & 65535;
  const c32$7 = (c32$6 >>> 0) + ((Math.imul(a00, b32) | 0) >>> 0) | 0;
  const c48$3 = (c48$2 >>> 0) + ((c32$7 >>> 16 | 0) >>> 0) | 0;
  const c32$8 = c32$7 & 65535;
  const c48$4 = (((((((c48$3 >>> 0) + ((Math.imul(a48, b00) | 0) >>> 0) | 0) >>> 0) + ((Math.imul(a32, b16) | 0) >>> 0) | 0) >>> 0) + ((Math.imul(a16, b32) | 0) >>> 0) | 0) >>> 0) + ((Math.imul(a00, b48) | 0) >>> 0) | 0;
  const c48$5 = c48$4 & 65535;
  return { hi: c48$5 << 16 | c32$8, lo: c16$5 << 16 | c00$2 };
}
function moonbitlang$core$builtin$$Div$div$136$(self, other) {
  const exports = moonbitlang$core$builtin$$get_int64_wasm_helper();
  const _ahi = self.hi;
  const _alo = self.lo;
  const _bhi = other.hi;
  const _blo = other.lo;
  const _func = exports.div_s;
  const lo = _func(_alo, _ahi, _blo, _bhi);
  const _func$2 = exports.get_high;
  const hi = _func$2();
  return { hi: hi, lo: lo };
}
function moonbitlang$core$builtin$$Add$add$47$(self, other) {
  return moonbitlang$core$builtin$$Add$add$136$(self, other);
}
function moonbitlang$core$builtin$$Sub$sub$47$(self, other) {
  return moonbitlang$core$builtin$$Sub$sub$136$(self, other);
}
function moonbitlang$core$builtin$$Mul$mul$47$(self, other) {
  return moonbitlang$core$builtin$$Mul$mul$136$(self, other);
}
function moonbitlang$core$builtin$$Div$div$47$(self, other) {
  return moonbitlang$core$builtin$$Div$div$136$(self, other);
}
function moonbitlang$core$builtin$$Compare$compare$47$(self, other) {
  return moonbitlang$core$builtin$$MyInt64$compare(self, other);
}
function moonbitlang$core$builtin$$Hasher$consume4(self, input) {
  const _p = (self.acc >>> 0) + ((Math.imul(input, -1028477379) | 0) >>> 0) | 0;
  const _p$2 = 17;
  self.acc = Math.imul(_p << _p$2 | (_p >>> (32 - _p$2 | 0) | 0), 668265263) | 0;
}
function moonbitlang$core$builtin$$Hasher$combine_uint(self, value) {
  self.acc = (self.acc >>> 0) + (4 >>> 0) | 0;
  moonbitlang$core$builtin$$Hasher$consume4(self, value);
}
function moonbitlang$core$builtin$$Hasher$combine_int(self, value) {
  moonbitlang$core$builtin$$Hasher$combine_uint(self, value);
}
function moonbitlang$core$builtin$$Hasher$combine_string(self, value) {
  const _end907 = value.length;
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < _end907) {
      moonbitlang$core$builtin$$Hasher$combine_uint(self, value.charCodeAt(i));
      _tmp = i + 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$core$builtin$$Hasher$combine_char(self, value) {
  moonbitlang$core$builtin$$Hasher$combine_uint(self, value);
}
function moonbitlang$core$builtin$$Hash$hash_combine$2$(self, hasher) {
  moonbitlang$core$builtin$$Hasher$combine_string(hasher, self);
}
function moonbitlang$core$builtin$$Hash$hash$4$(self) {
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
function moonbitlang$core$builtin$$Hash$hash_combine$4$(self, hasher) {
  moonbitlang$core$builtin$$Hasher$combine_int(hasher, self);
}
function moonbitlang$core$array$$FixedArray$blit_to$46$inner$24$(self, dst, len, src_offset, dst_offset) {
  if (dst_offset >= 0 && (src_offset >= 0 && ((dst_offset + len | 0) <= dst.length && (src_offset + len | 0) <= self.length))) {
    moonbitlang$core$array$$FixedArray$unsafe_blit$24$(dst, dst_offset, self, src_offset, len);
    return;
  } else {
    moonbitlang$core$abort$$abort$1$(`bounds check failed: dst_offset = ${moonbitlang$core$builtin$$Show$to_string$4$(dst_offset)}, src_offset = ${moonbitlang$core$builtin$$Show$to_string$4$(src_offset)}, len = ${moonbitlang$core$builtin$$Show$to_string$4$(len)}, dst.length = ${moonbitlang$core$builtin$$Show$to_string$4$(dst.length)}, self.length = ${moonbitlang$core$builtin$$Show$to_string$4$(self.length)}`);
    return;
  }
}
function moonbitlang$core$builtin$$Default$default$137$() {
  return new Uint8Array([]);
}
function moonbitlang$core$array$$Array$unsafe_pop$9$(self) {
  return moonbitlang$core$builtin$$JSArray$pop(self);
}
function moonbitlang$core$array$$Array$unsafe_pop$126$(self) {
  return moonbitlang$core$builtin$$JSArray$pop(self);
}
function moonbitlang$core$array$$Array$unsafe_pop$65$(self) {
  return moonbitlang$core$builtin$$JSArray$pop(self);
}
function moonbitlang$core$array$$Array$unsafe_pop$10$(self) {
  return moonbitlang$core$builtin$$JSArray$pop(self);
}
function moonbitlang$core$array$$Array$unsafe_pop$130$(self) {
  return moonbitlang$core$builtin$$JSArray$pop(self);
}
function moonbitlang$core$array$$Array$unsafe_pop$22$(self) {
  return moonbitlang$core$builtin$$JSArray$pop(self);
}
function moonbitlang$core$array$$Array$unsafe_pop$91$(self) {
  return moonbitlang$core$builtin$$JSArray$pop(self);
}
function moonbitlang$core$array$$Array$unsafe_pop$66$(self) {
  return moonbitlang$core$builtin$$JSArray$pop(self);
}
function moonbitlang$core$array$$Array$unsafe_pop$133$(self) {
  return moonbitlang$core$builtin$$JSArray$pop(self);
}
function moonbitlang$core$bytes$$Bytes$makei$52$(length, value) {
  if (length <= 0) {
    return $bytes_literal$0;
  }
  const arr = $makebytes(length, value(0));
  let _tmp = 1;
  while (true) {
    const i = _tmp;
    if (i < length) {
      $bound_check(arr, i);
      arr[i] = value(i);
      _tmp = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return arr;
}
function moonbitlang$core$builtin$$println$2$(input) {
  console.log(input);
}
function moonbitlang$core$builtin$$println$31$(input) {
  console.log(moonbitlang$core$builtin$$Show$to_string$109$(input));
}
function moonbitlang$core$array$$FixedArray$blit_from_bytes(self, bytes_offset, src, src_offset, length) {
  const e1 = (bytes_offset + length | 0) - 1 | 0;
  const e2 = (src_offset + length | 0) - 1 | 0;
  const len1 = self.length;
  const len2 = src.length;
  if (length >= 0 && (bytes_offset >= 0 && (e1 < len1 && (src_offset >= 0 && e2 < len2)))) {
    moonbitlang$core$array$$FixedArray$unsafe_blit$24$(self, bytes_offset, src, src_offset, length);
    return;
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$array$$ArrayView$op_get$9$(self, index) {
  if (index >= 0 && index < self.len) {
    const _tmp = self.buf;
    const _tmp$2 = self.start + index | 0;
    $bound_check(_tmp, _tmp$2);
    return _tmp[_tmp$2];
  } else {
    return moonbitlang$core$abort$$abort$9$(`index out of bounds: the len is from 0 to ${moonbitlang$core$builtin$$Show$to_string$4$(self.len)} but the index is ${moonbitlang$core$builtin$$Show$to_string$4$(index)}`);
  }
}
function moonbitlang$core$array$$ArrayView$op_get$14$(self, index) {
  if (index >= 0 && index < self.len) {
    const _tmp = self.buf;
    const _tmp$2 = self.start + index | 0;
    $bound_check(_tmp, _tmp$2);
    return _tmp[_tmp$2];
  } else {
    return moonbitlang$core$abort$$abort$14$(`index out of bounds: the len is from 0 to ${moonbitlang$core$builtin$$Show$to_string$4$(self.len)} but the index is ${moonbitlang$core$builtin$$Show$to_string$4$(index)}`);
  }
}
function moonbitlang$core$array$$ArrayView$op_get$15$(self, index) {
  if (index >= 0 && index < self.len) {
    const _tmp = self.buf;
    const _tmp$2 = self.start + index | 0;
    $bound_check(_tmp, _tmp$2);
    return _tmp[_tmp$2];
  } else {
    return moonbitlang$core$abort$$abort$15$(`index out of bounds: the len is from 0 to ${moonbitlang$core$builtin$$Show$to_string$4$(self.len)} but the index is ${moonbitlang$core$builtin$$Show$to_string$4$(index)}`);
  }
}
function moonbitlang$core$array$$ArrayView$swap$14$(self, i, j) {
  if (i >= 0 && (i < self.len && (j >= 0 && j < self.len))) {
    const _tmp = self.buf;
    const _tmp$2 = self.start + i | 0;
    $bound_check(_tmp, _tmp$2);
    const temp = _tmp[_tmp$2];
    const _tmp$3 = self.buf;
    const _tmp$4 = self.start + i | 0;
    const _tmp$5 = self.buf;
    const _tmp$6 = self.start + j | 0;
    $bound_check(_tmp$5, _tmp$6);
    $bound_check(_tmp$3, _tmp$4);
    _tmp$3[_tmp$4] = _tmp$5[_tmp$6];
    const _tmp$7 = self.buf;
    const _tmp$8 = self.start + j | 0;
    $bound_check(_tmp$7, _tmp$8);
    _tmp$7[_tmp$8] = temp;
    return;
  } else {
    moonbitlang$core$abort$$abort$1$(`index out of bounds: the len is from 0 to ${moonbitlang$core$builtin$$Show$to_string$4$(self.len)} but the index is (${moonbitlang$core$builtin$$Show$to_string$4$(i)}, ${moonbitlang$core$builtin$$Show$to_string$4$(j)})`);
    return;
  }
}
function moonbitlang$core$array$$ArrayView$swap$15$(self, i, j) {
  if (i >= 0 && (i < self.len && (j >= 0 && j < self.len))) {
    const _tmp = self.buf;
    const _tmp$2 = self.start + i | 0;
    $bound_check(_tmp, _tmp$2);
    const temp = _tmp[_tmp$2];
    const _tmp$3 = self.buf;
    const _tmp$4 = self.start + i | 0;
    const _tmp$5 = self.buf;
    const _tmp$6 = self.start + j | 0;
    $bound_check(_tmp$5, _tmp$6);
    $bound_check(_tmp$3, _tmp$4);
    _tmp$3[_tmp$4] = _tmp$5[_tmp$6];
    const _tmp$7 = self.buf;
    const _tmp$8 = self.start + j | 0;
    $bound_check(_tmp$7, _tmp$8);
    _tmp$7[_tmp$8] = temp;
    return;
  } else {
    moonbitlang$core$abort$$abort$1$(`index out of bounds: the len is from 0 to ${moonbitlang$core$builtin$$Show$to_string$4$(self.len)} but the index is (${moonbitlang$core$builtin$$Show$to_string$4$(i)}, ${moonbitlang$core$builtin$$Show$to_string$4$(j)})`);
    return;
  }
}
function moonbitlang$core$array$$Array$op_as_view$46$inner$9$(self, start, end) {
  const len = self.length;
  let end$2;
  if (end === undefined) {
    end$2 = len;
  } else {
    const _Some = end;
    const _end = _Some;
    end$2 = _end < 0 ? len + _end | 0 : _end;
  }
  const start$2 = start < 0 ? len + start | 0 : start;
  return start$2 >= 0 && (start$2 <= end$2 && end$2 <= len) ? { buf: self, start: start$2, len: end$2 - start$2 | 0 } : moonbitlang$core$abort$$abort$6$("View index out of bounds");
}
function moonbitlang$core$array$$Array$op_as_view$46$inner$14$(self, start, end) {
  const len = self.length;
  let end$2;
  if (end === undefined) {
    end$2 = len;
  } else {
    const _Some = end;
    const _end = _Some;
    end$2 = _end < 0 ? len + _end | 0 : _end;
  }
  const start$2 = start < 0 ? len + start | 0 : start;
  return start$2 >= 0 && (start$2 <= end$2 && end$2 <= len) ? { buf: self, start: start$2, len: end$2 - start$2 | 0 } : moonbitlang$core$abort$$abort$12$("View index out of bounds");
}
function moonbitlang$core$array$$Array$op_as_view$46$inner$15$(self, start, end) {
  const len = self.length;
  let end$2;
  if (end === undefined) {
    end$2 = len;
  } else {
    const _Some = end;
    const _end = _Some;
    end$2 = _end < 0 ? len + _end | 0 : _end;
  }
  const start$2 = start < 0 ? len + start | 0 : start;
  return start$2 >= 0 && (start$2 <= end$2 && end$2 <= len) ? { buf: self, start: start$2, len: end$2 - start$2 | 0 } : moonbitlang$core$abort$$abort$13$("View index out of bounds");
}
function moonbitlang$core$array$$Array$op_as_view$46$inner$89$(self, start, end) {
  const len = self.length;
  let end$2;
  if (end === undefined) {
    end$2 = len;
  } else {
    const _Some = end;
    const _end = _Some;
    end$2 = _end < 0 ? len + _end | 0 : _end;
  }
  const start$2 = start < 0 ? len + start | 0 : start;
  return start$2 >= 0 && (start$2 <= end$2 && end$2 <= len) ? { buf: self, start: start$2, len: end$2 - start$2 | 0 } : moonbitlang$core$abort$$abort$17$("View index out of bounds");
}
function moonbitlang$core$array$$Array$op_as_view$46$inner$27$(self, start, end) {
  const len = self.length;
  let end$2;
  if (end === undefined) {
    end$2 = len;
  } else {
    const _Some = end;
    const _end = _Some;
    end$2 = _end < 0 ? len + _end | 0 : _end;
  }
  const start$2 = start < 0 ? len + start | 0 : start;
  return start$2 >= 0 && (start$2 <= end$2 && end$2 <= len) ? { buf: self, start: start$2, len: end$2 - start$2 | 0 } : moonbitlang$core$abort$$abort$21$("View index out of bounds");
}
function moonbitlang$core$array$$ArrayView$op_as_view$46$inner$14$(self, start, end) {
  const len = self.len;
  let end$2;
  if (end === undefined) {
    end$2 = len;
  } else {
    const _Some = end;
    const _end = _Some;
    end$2 = _end < 0 ? len + _end | 0 : _end;
  }
  const start$2 = start < 0 ? len + start | 0 : start;
  return start$2 >= 0 && (start$2 <= end$2 && end$2 <= len) ? { buf: self.buf, start: self.start + start$2 | 0, len: end$2 - start$2 | 0 } : moonbitlang$core$abort$$abort$12$("View index out of bounds");
}
function moonbitlang$core$array$$ArrayView$op_as_view$46$inner$15$(self, start, end) {
  const len = self.len;
  let end$2;
  if (end === undefined) {
    end$2 = len;
  } else {
    const _Some = end;
    const _end = _Some;
    end$2 = _end < 0 ? len + _end | 0 : _end;
  }
  const start$2 = start < 0 ? len + start | 0 : start;
  return start$2 >= 0 && (start$2 <= end$2 && end$2 <= len) ? { buf: self.buf, start: self.start + start$2 | 0, len: end$2 - start$2 | 0 } : moonbitlang$core$abort$$abort$13$("View index out of bounds");
}
function moonbitlang$core$array$$Array$new$46$inner$27$(capacity) {
  return [];
}
function moonbitlang$core$array$$Array$unsafe_truncate_to_length$15$(self, new_len) {
  moonbitlang$core$builtin$$JSArray$set_length(self, new_len);
}
function moonbitlang$core$array$$Array$pop$126$(self) {
  if (self.length === 0) {
    return undefined;
  } else {
    const v = moonbitlang$core$array$$Array$unsafe_pop$126$(self);
    return v;
  }
}
function moonbitlang$core$array$$Array$pop$65$(self) {
  if (self.length === 0) {
    return undefined;
  } else {
    const v = moonbitlang$core$array$$Array$unsafe_pop$65$(self);
    return v;
  }
}
function moonbitlang$core$array$$Array$pop$10$(self) {
  if (self.length === 0) {
    return undefined;
  } else {
    const v = moonbitlang$core$array$$Array$unsafe_pop$10$(self);
    return v;
  }
}
function moonbitlang$core$array$$Array$pop$130$(self) {
  if (self.length === 0) {
    return undefined;
  } else {
    const v = moonbitlang$core$array$$Array$unsafe_pop$130$(self);
    return v;
  }
}
function moonbitlang$core$array$$Array$pop$22$(self) {
  if (self.length === 0) {
    return undefined;
  } else {
    const v = moonbitlang$core$array$$Array$unsafe_pop$22$(self);
    return v;
  }
}
function moonbitlang$core$array$$Array$pop$91$(self) {
  if (self.length === 0) {
    return undefined;
  } else {
    const v = moonbitlang$core$array$$Array$unsafe_pop$91$(self);
    return v;
  }
}
function moonbitlang$core$array$$Array$pop$66$(self) {
  if (self.length === 0) {
    return undefined;
  } else {
    const v = moonbitlang$core$array$$Array$unsafe_pop$66$(self);
    return v;
  }
}
function moonbitlang$core$array$$Array$pop$133$(self) {
  if (self.length === 0) {
    return undefined;
  } else {
    const v = moonbitlang$core$array$$Array$unsafe_pop$133$(self);
    return v;
  }
}
function moonbitlang$core$array$$Array$unsafe_grow_to_length$27$(self, new_len) {
  if (new_len >= self.length) {
    moonbitlang$core$builtin$$JSArray$set_length(self, new_len);
    return;
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$array$$Array$unsafe_blit$27$(dst, dst_offset, src, src_offset, len) {
  moonbitlang$core$array$$FixedArray$unsafe_blit$77$(dst, dst_offset, src, src_offset, len);
}
function moonbitlang$core$array$$Array$blit_to$46$inner$27$(self, dst, len, src_offset, dst_offset) {
  if (len >= 0 && (dst_offset >= 0 && (src_offset >= 0 && (dst_offset <= dst.length && (src_offset + len | 0) <= self.length)))) {
    if ((dst_offset + len | 0) > dst.length) {
      moonbitlang$core$array$$Array$unsafe_grow_to_length$27$(dst, dst_offset + len | 0);
    }
    moonbitlang$core$array$$Array$unsafe_blit$27$(dst, dst_offset, self, src_offset, len);
    return;
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$array$$Array$make$4$(len, elem) {
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
function moonbitlang$core$array$$Array$op_set$15$(self, index, value) {
  const len = self.length;
  if (index >= 0 && index < len) {
    $bound_check(self, index);
    self[index] = value;
    return;
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$array$$Array$op_set$87$(self, index, value) {
  const len = self.length;
  if (index >= 0 && index < len) {
    $bound_check(self, index);
    self[index] = value;
    return;
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$array$$Array$op_set$4$(self, index, value) {
  const len = self.length;
  if (index >= 0 && index < len) {
    $bound_check(self, index);
    self[index] = value;
    return;
  } else {
    $panic();
    return;
  }
}
function moonbitlang$core$builtin$$Eq$equal$97$(self, other) {
  const self_len = self.length;
  const other_len = other.length;
  if (self_len === other_len) {
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < self_len) {
        if (moonbitlang$core$builtin$$Eq$equal$98$(self[i], other[i])) {
        } else {
          return false;
        }
        _tmp = i + 1 | 0;
        continue;
      } else {
        return true;
      }
    }
  } else {
    return false;
  }
}
function moonbitlang$core$builtin$$Eq$equal$100$(self, other) {
  const self_len = self.length;
  const other_len = other.length;
  if (self_len === other_len) {
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < self_len) {
        if (moonbitlang$core$builtin$$Eq$equal$15$(self[i], other[i])) {
        } else {
          return false;
        }
        _tmp = i + 1 | 0;
        continue;
      } else {
        return true;
      }
    }
  } else {
    return false;
  }
}
function moonbitlang$core$builtin$$Compare$compare$100$(self, other) {
  const len_self = self.length;
  const len_other = other.length;
  const cmp = $compare_int(len_self, len_other);
  if (cmp === 0) {
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < len_self) {
        const cmp$2 = moonbitlang$core$builtin$$Compare$compare$15$(self[i], other[i]);
        if (cmp$2 === 0) {
        } else {
          return cmp$2;
        }
        _tmp = i + 1 | 0;
        continue;
      } else {
        return 0;
      }
    }
  } else {
    return cmp;
  }
}
function moonbitlang$core$array$$Array$append$27$(self, other) {
  moonbitlang$core$array$$Array$blit_to$46$inner$27$(other, self, other.length, 0, self.length);
}
function moonbitlang$core$array$$Array$search$4$(self, value) {
  const _len = self.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const v = self[_i];
      if (v === value) {
        return _i;
      }
      _tmp = _i + 1 | 0;
      continue;
    } else {
      return undefined;
    }
  }
}
function moonbitlang$core$array$$Array$repeat$27$(self, times) {
  const v = moonbitlang$core$array$$Array$new$46$inner$27$(Math.imul(self.length, times) | 0);
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < times) {
      moonbitlang$core$array$$Array$append$27$(v, self);
      _tmp = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return v;
}
function moonbitlang$core$array$$Array$dedup$15$(self) {
  if (self.length === 0) {
    return undefined;
  }
  let w = 1;
  const _end74 = self.length;
  let _tmp = 1;
  while (true) {
    const i = _tmp;
    if (i < _end74) {
      if (moonbitlang$core$builtin$$op_notequal$15$(moonbitlang$core$array$$Array$op_get$15$(self, i), moonbitlang$core$array$$Array$op_get$15$(self, w - 1 | 0))) {
        moonbitlang$core$array$$Array$op_set$15$(self, w, moonbitlang$core$array$$Array$op_get$15$(self, i));
        w = w + 1 | 0;
      }
      _tmp = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  moonbitlang$core$array$$Array$unsafe_truncate_to_length$15$(self, w);
}
function moonbitlang$core$queue$$new$138$() {
  return { length: 0, first: undefined, last: undefined };
}
function moonbitlang$core$queue$$new$76$() {
  return { length: 0, first: undefined, last: undefined };
}
function moonbitlang$core$queue$$from_array$76$(arr) {
  if (arr.length > 0) {
    const length = arr.length;
    const last = { content: moonbitlang$core$array$$Array$op_get$76$(arr, length - 1 | 0), next: undefined };
    let first;
    let _tmp = length - 2 | 0;
    let _tmp$2 = last;
    while (true) {
      const i = _tmp;
      const x = _tmp$2;
      if (i >= 0) {
        _tmp = i - 1 | 0;
        _tmp$2 = { content: moonbitlang$core$array$$Array$op_get$76$(arr, i), next: x };
        continue;
      } else {
        first = x;
        break;
      }
    }
    return { length: length, first: first, last: last };
  } else {
    return moonbitlang$core$queue$$new$76$();
  }
}
function moonbitlang$core$queue$$Queue$clear$138$(self) {
  self.length = 0;
  self.first = undefined;
  self.last = undefined;
}
function moonbitlang$core$queue$$Queue$clear$76$(self) {
  self.length = 0;
  self.first = undefined;
  self.last = undefined;
}
function moonbitlang$core$queue$$Queue$push$138$(self, x) {
  const cell = { content: x, next: undefined };
  const _bind = self.last;
  if (_bind === undefined) {
    self.length = 1;
    self.first = cell;
    self.last = cell;
    return;
  } else {
    const _Some = _bind;
    const _last = _Some;
    _last.next = cell;
    self.length = self.length + 1 | 0;
    self.last = cell;
    return;
  }
}
function moonbitlang$core$queue$$Queue$push$76$(self, x) {
  const cell = { content: x, next: undefined };
  const _bind = self.last;
  if (_bind === undefined) {
    self.length = 1;
    self.first = cell;
    self.last = cell;
    return;
  } else {
    const _Some = _bind;
    const _last = _Some;
    _last.next = cell;
    self.length = self.length + 1 | 0;
    self.last = cell;
    return;
  }
}
function moonbitlang$core$queue$$Queue$pop$138$(self) {
  const _bind = self.first;
  if (_bind === undefined) {
    return undefined;
  } else {
    const _Some = _bind;
    const _x = _Some;
    const _content = _x.content;
    const _x$2 = _x.next;
    if (_x$2 === undefined) {
      moonbitlang$core$queue$$Queue$clear$138$(self);
      return _content;
    } else {
      self.length = self.length - 1 | 0;
      self.first = _x$2;
      return _content;
    }
  }
}
function moonbitlang$core$queue$$Queue$pop$76$(self) {
  const _bind = self.first;
  if (_bind === undefined) {
    return undefined;
  } else {
    const _Some = _bind;
    const _x = _Some;
    const _content = _x.content;
    const _x$2 = _x.next;
    if (_x$2 === undefined) {
      moonbitlang$core$queue$$Queue$clear$76$(self);
      return _content;
    } else {
      self.length = self.length - 1 | 0;
      self.first = _x$2;
      return _content;
    }
  }
}
function moonbitlang$core$list$$List$to_array$129$(self) {
  if (self.$tag === 0) {
    return [];
  } else {
    const _More = self;
    const _x = _More._0;
    const _xs = _More._1;
    const arr = [_x];
    let _tmp = _xs;
    while (true) {
      const _param = _tmp;
      if (_param.$tag === 0) {
        break;
      } else {
        const _More$2 = _param;
        const _x$2 = _More$2._0;
        const _xs$2 = _More$2._1;
        moonbitlang$core$array$$Array$push$129$(arr, _x$2);
        _tmp = _xs$2;
        continue;
      }
    }
    return arr;
  }
}
function moonbitlang$core$list$$List$to_array$132$(self) {
  if (self.$tag === 0) {
    return [];
  } else {
    const _More = self;
    const _x = _More._0;
    const _xs = _More._1;
    const arr = [_x];
    let _tmp = _xs;
    while (true) {
      const _param = _tmp;
      if (_param.$tag === 0) {
        break;
      } else {
        const _More$2 = _param;
        const _x$2 = _More$2._0;
        const _xs$2 = _More$2._1;
        moonbitlang$core$array$$Array$push$132$(arr, _x$2);
        _tmp = _xs$2;
        continue;
      }
    }
    return arr;
  }
}
function moonbitlang$core$list$$List$unsafe_head$8$(self) {
  if (self.$tag === 0) {
    return moonbitlang$core$abort$$abort$8$("head of empty list");
  } else {
    const _More = self;
    return _More._0;
  }
}
function moonbitlang$core$list$$List$unsafe_tail$8$(self) {
  if (self.$tag === 0) {
    return moonbitlang$core$abort$$abort$7$("tail of empty list");
  } else {
    const _More = self;
    return _More._1;
  }
}
function moonbitlang$core$list$$List$drop$8$(self, n) {
  if (n <= 0) {
    return self;
  } else {
    let _tmp = n;
    let _tmp$2 = self;
    while (true) {
      const _param_0 = _tmp;
      const _param_1 = _tmp$2;
      if (_param_1.$tag === 0) {
        return $64$moonbitlang$47$core$47$list$46$List$Empty$26$;
      } else {
        if (_param_0 === 1) {
          const _More = _param_1;
          return _More._1;
        } else {
          const _More = _param_1;
          const _xs = _More._1;
          _tmp = _param_0 - 1 | 0;
          _tmp$2 = _xs;
          continue;
        }
      }
    }
  }
}
function moonbitlang$core$string$$String$view$46$inner(self, start_offset, end_offset) {
  let end_offset$2;
  if (end_offset === undefined) {
    end_offset$2 = self.length;
  } else {
    const _Some = end_offset;
    end_offset$2 = _Some;
  }
  return start_offset >= 0 && (start_offset <= end_offset$2 && end_offset$2 <= self.length) ? { str: self, start: start_offset, end: end_offset$2 } : moonbitlang$core$abort$$abort$3$("Invalid index for View");
}
function moonbitlang$core$string$$View$view$46$inner(self, start_offset, end_offset) {
  let end_offset$2;
  if (end_offset === undefined) {
    end_offset$2 = self.end - self.start | 0;
  } else {
    const _Some = end_offset;
    end_offset$2 = _Some;
  }
  return start_offset >= 0 && (start_offset <= end_offset$2 && end_offset$2 <= (self.end - self.start | 0)) ? { str: self.str, start: self.start + start_offset | 0, end: self.start + end_offset$2 | 0 } : moonbitlang$core$abort$$abort$3$("Invalid index for View");
}
function moonbitlang$core$string$$String$offset_of_nth_char_backward(self, n, start_offset, end_offset) {
  let char_count = 0;
  let utf16_offset = end_offset;
  while (true) {
    if ((utf16_offset - 1 | 0) >= start_offset && char_count < n) {
      const _tmp = utf16_offset - 1 | 0;
      const c = self.charCodeAt(_tmp);
      if (56320 <= c && c <= 57343) {
        utf16_offset = utf16_offset - 2 | 0;
      } else {
        utf16_offset = utf16_offset - 1 | 0;
      }
      char_count = char_count + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return char_count < n || utf16_offset < start_offset ? undefined : utf16_offset;
}
function moonbitlang$core$string$$String$offset_of_nth_char_forward(self, n, start_offset, end_offset) {
  if (start_offset >= 0 && start_offset <= end_offset) {
    let utf16_offset = start_offset;
    let char_count = 0;
    while (true) {
      if (utf16_offset < end_offset && char_count < n) {
        const _tmp = utf16_offset;
        const c = self.charCodeAt(_tmp);
        if (55296 <= c && c <= 56319) {
          utf16_offset = utf16_offset + 2 | 0;
        } else {
          utf16_offset = utf16_offset + 1 | 0;
        }
        char_count = char_count + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    return char_count < n || utf16_offset >= end_offset ? undefined : utf16_offset;
  } else {
    return moonbitlang$core$abort$$abort$5$("Invalid start index");
  }
}
function moonbitlang$core$string$$String$offset_of_nth_char$46$inner(self, i, start_offset, end_offset) {
  let end_offset$2;
  if (end_offset === undefined) {
    end_offset$2 = self.length;
  } else {
    const _Some = end_offset;
    end_offset$2 = _Some;
  }
  return i >= 0 ? moonbitlang$core$string$$String$offset_of_nth_char_forward(self, i, start_offset, end_offset$2) : moonbitlang$core$string$$String$offset_of_nth_char_backward(self, -i | 0, start_offset, end_offset$2);
}
function moonbitlang$core$string$$String$char_length_eq$46$inner(self, len, start_offset, end_offset) {
  let end_offset$2;
  if (end_offset === undefined) {
    end_offset$2 = self.length;
  } else {
    const _Some = end_offset;
    end_offset$2 = _Some;
  }
  let _tmp = start_offset;
  let _tmp$2 = 0;
  while (true) {
    const index = _tmp;
    const count = _tmp$2;
    if (index < end_offset$2 && count < len) {
      const c1 = self.charCodeAt(index);
      if (55296 <= c1 && c1 <= 56319 && (index + 1 | 0) < end_offset$2) {
        const _tmp$3 = index + 1 | 0;
        const c2 = self.charCodeAt(_tmp$3);
        if (56320 <= c2 && c2 <= 57343) {
          _tmp = index + 2 | 0;
          _tmp$2 = count + 1 | 0;
          continue;
        } else {
          moonbitlang$core$abort$$abort$1$("invalid surrogate pair");
        }
      }
      _tmp = index + 1 | 0;
      _tmp$2 = count + 1 | 0;
      continue;
    } else {
      return count === len && index === end_offset$2;
    }
  }
}
function moonbitlang$core$string$$String$char_length_ge$46$inner(self, len, start_offset, end_offset) {
  let end_offset$2;
  if (end_offset === undefined) {
    end_offset$2 = self.length;
  } else {
    const _Some = end_offset;
    end_offset$2 = _Some;
  }
  let _tmp = start_offset;
  let _tmp$2 = 0;
  while (true) {
    const index = _tmp;
    const count = _tmp$2;
    if (index < end_offset$2 && count < len) {
      const c1 = self.charCodeAt(index);
      if (55296 <= c1 && c1 <= 56319 && (index + 1 | 0) < end_offset$2) {
        const _tmp$3 = index + 1 | 0;
        const c2 = self.charCodeAt(_tmp$3);
        if (56320 <= c2 && c2 <= 57343) {
          _tmp = index + 2 | 0;
          _tmp$2 = count + 1 | 0;
          continue;
        } else {
          moonbitlang$core$abort$$abort$1$("invalid surrogate pair");
        }
      }
      _tmp = index + 1 | 0;
      _tmp$2 = count + 1 | 0;
      continue;
    } else {
      return count >= len;
    }
  }
}
function moonbitlang$core$string$$code_point_of_surrogate_pair(leading, trailing) {
  return (((Math.imul(leading - 55296 | 0, 1024) | 0) + trailing | 0) - 56320 | 0) + 65536 | 0;
}
function moonbitlang$core$builtin$$Eq$equal$3$(self, other) {
  const len = self.end - self.start | 0;
  if (len === (other.end - other.start | 0)) {
    if (self.str === other.str && self.start === other.start) {
      return true;
    }
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < len) {
        const _tmp$2 = self.str;
        const _tmp$3 = self.start + i | 0;
        const _tmp$4 = _tmp$2.charCodeAt(_tmp$3);
        const _tmp$5 = other.str;
        const _tmp$6 = other.start + i | 0;
        if (_tmp$4 === _tmp$5.charCodeAt(_tmp$6)) {
        } else {
          return false;
        }
        _tmp = i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    return true;
  } else {
    return false;
  }
}
function moonbitlang$core$string$$String$from_array(chars) {
  const buf = moonbitlang$core$builtin$$StringBuilder$new$46$inner(Math.imul(chars.length, 4) | 0);
  const _len = chars.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const c = chars[_i];
      moonbitlang$core$builtin$$Logger$write_char$25$(buf, c);
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return buf.val;
}
function moonbitlang$core$string$$ToStringView$to_string_view$2$(self) {
  return { str: self, start: 0, end: self.length };
}
function moonbitlang$core$builtin$$Compare$compare$2$(self, other) {
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
function moonbitlang$core$string$$String$to_bytes(self) {
  const array = $makebytes(Math.imul(self.length, 2) | 0, 0);
  moonbitlang$core$array$$FixedArray$blit_from_string(array, 0, self, 0, self.length);
  return array;
}
function moonbitlang$core$string$$String$iter(self) {
  const _p = (yield_) => {
    const len = self.length;
    let _tmp = 0;
    while (true) {
      const index = _tmp;
      if (index < len) {
        const c1 = self.charCodeAt(index);
        if (55296 <= c1 && c1 <= 56319 && (index + 1 | 0) < len) {
          const _tmp$2 = index + 1 | 0;
          const c2 = self.charCodeAt(_tmp$2);
          if (56320 <= c2 && c2 <= 57343) {
            const c = moonbitlang$core$string$$code_point_of_surrogate_pair(c1, c2);
            const _bind = yield_(c);
            if (_bind === 1) {
              _tmp = index + 2 | 0;
              continue;
            } else {
              return 0;
            }
          }
        }
        const _bind = yield_(c1);
        if (_bind === 1) {
        } else {
          return 0;
        }
        _tmp = index + 1 | 0;
        continue;
      } else {
        return 1;
      }
    }
  };
  return _p;
}
function moonbitlang$core$string$$boyer_moore_horspool_find(haystack, needle) {
  const haystack_len = haystack.end - haystack.start | 0;
  const needle_len = needle.end - needle.start | 0;
  if (needle_len > 0) {
    if (haystack_len >= needle_len) {
      const skip_table = $make_array_len_and_init(256, needle_len);
      const _end353 = needle_len - 1 | 0;
      let _tmp = 0;
      while (true) {
        const i = _tmp;
        if (i < _end353) {
          const _tmp$2 = needle.str;
          const _tmp$3 = needle.start + i | 0;
          const _tmp$4 = _tmp$2.charCodeAt(_tmp$3) & 255;
          $bound_check(skip_table, _tmp$4);
          skip_table[_tmp$4] = (needle_len - 1 | 0) - i | 0;
          _tmp = i + 1 | 0;
          continue;
        } else {
          break;
        }
      }
      let _tmp$2 = 0;
      while (true) {
        const i = _tmp$2;
        if (i <= (haystack_len - needle_len | 0)) {
          const _end359 = needle_len - 1 | 0;
          let _tmp$3 = 0;
          while (true) {
            const j = _tmp$3;
            if (j <= _end359) {
              const _p = i + j | 0;
              const _tmp$4 = haystack.str;
              const _tmp$5 = haystack.start + _p | 0;
              const _tmp$6 = _tmp$4.charCodeAt(_tmp$5);
              const _tmp$7 = needle.str;
              const _tmp$8 = needle.start + j | 0;
              if (_tmp$6 !== _tmp$7.charCodeAt(_tmp$8)) {
                break;
              }
              _tmp$3 = j + 1 | 0;
              continue;
            } else {
              return i;
            }
          }
          const _p = (i + needle_len | 0) - 1 | 0;
          const _tmp$4 = haystack.str;
          const _tmp$5 = haystack.start + _p | 0;
          const _tmp$6 = _tmp$4.charCodeAt(_tmp$5) & 255;
          $bound_check(skip_table, _tmp$6);
          _tmp$2 = i + skip_table[_tmp$6] | 0;
          continue;
        } else {
          break;
        }
      }
      return undefined;
    } else {
      return undefined;
    }
  } else {
    return 0;
  }
}
function moonbitlang$core$string$$brute_force_find(haystack, needle) {
  const haystack_len = haystack.end - haystack.start | 0;
  const needle_len = needle.end - needle.start | 0;
  if (needle_len > 0) {
    if (haystack_len >= needle_len) {
      const _p = 0;
      const _tmp = needle.str;
      const _tmp$2 = needle.start + _p | 0;
      const needle_first = _tmp.charCodeAt(_tmp$2);
      const forward_len = haystack_len - needle_len | 0;
      let i = 0;
      while (true) {
        if (i <= forward_len) {
          while (true) {
            let _tmp$3;
            if (i <= forward_len) {
              const _p$2 = i;
              const _tmp$4 = haystack.str;
              const _tmp$5 = haystack.start + _p$2 | 0;
              _tmp$3 = _tmp$4.charCodeAt(_tmp$5) !== needle_first;
            } else {
              _tmp$3 = false;
            }
            if (_tmp$3) {
              i = i + 1 | 0;
              continue;
            } else {
              break;
            }
          }
          if (i <= forward_len) {
            let _tmp$3 = 1;
            while (true) {
              const j = _tmp$3;
              if (j < needle_len) {
                const _p$2 = i + j | 0;
                const _tmp$4 = haystack.str;
                const _tmp$5 = haystack.start + _p$2 | 0;
                const _tmp$6 = _tmp$4.charCodeAt(_tmp$5);
                const _tmp$7 = needle.str;
                const _tmp$8 = needle.start + j | 0;
                if (_tmp$6 !== _tmp$7.charCodeAt(_tmp$8)) {
                  break;
                }
                _tmp$3 = j + 1 | 0;
                continue;
              } else {
                return i;
              }
            }
            i = i + 1 | 0;
          }
          continue;
        } else {
          break;
        }
      }
      return undefined;
    } else {
      return undefined;
    }
  } else {
    return 0;
  }
}
function moonbitlang$core$string$$View$find(self, str) {
  return (str.end - str.start | 0) <= 4 ? moonbitlang$core$string$$brute_force_find(self, str) : moonbitlang$core$string$$boyer_moore_horspool_find(self, str);
}
function moonbitlang$core$string$$boyer_moore_horspool_rev_find(haystack, needle) {
  const haystack_len = haystack.end - haystack.start | 0;
  const needle_len = needle.end - needle.start | 0;
  if (needle_len > 0) {
    if (haystack_len >= needle_len) {
      const skip_table = $make_array_len_and_init(256, needle_len);
      let _tmp = needle_len - 1 | 0;
      while (true) {
        const i = _tmp;
        if (i > 0) {
          const _tmp$2 = needle.str;
          const _tmp$3 = needle.start + i | 0;
          const _tmp$4 = _tmp$2.charCodeAt(_tmp$3) & 255;
          $bound_check(skip_table, _tmp$4);
          skip_table[_tmp$4] = i;
          _tmp = i - 1 | 0;
          continue;
        } else {
          break;
        }
      }
      let _tmp$2 = haystack_len - needle_len | 0;
      while (true) {
        const i = _tmp$2;
        if (i >= 0) {
          let _tmp$3 = 0;
          while (true) {
            const j = _tmp$3;
            if (j < needle_len) {
              const _p = i + j | 0;
              const _tmp$4 = haystack.str;
              const _tmp$5 = haystack.start + _p | 0;
              const _tmp$6 = _tmp$4.charCodeAt(_tmp$5);
              const _tmp$7 = needle.str;
              const _tmp$8 = needle.start + j | 0;
              if (_tmp$6 !== _tmp$7.charCodeAt(_tmp$8)) {
                break;
              }
              _tmp$3 = j + 1 | 0;
              continue;
            } else {
              return i;
            }
          }
          const _tmp$4 = haystack.str;
          const _tmp$5 = haystack.start + i | 0;
          const _tmp$6 = _tmp$4.charCodeAt(_tmp$5) & 255;
          $bound_check(skip_table, _tmp$6);
          _tmp$2 = i - skip_table[_tmp$6] | 0;
          continue;
        } else {
          break;
        }
      }
      return undefined;
    } else {
      return undefined;
    }
  } else {
    return haystack_len;
  }
}
function moonbitlang$core$string$$String$find(self, str) {
  return moonbitlang$core$string$$View$find({ str: self, start: 0, end: self.length }, str);
}
function moonbitlang$core$string$$brute_force_rev_find(haystack, needle) {
  const haystack_len = haystack.end - haystack.start | 0;
  const needle_len = needle.end - needle.start | 0;
  if (needle_len > 0) {
    if (haystack_len >= needle_len) {
      const _p = 0;
      const _tmp = needle.str;
      const _tmp$2 = needle.start + _p | 0;
      const needle_first = _tmp.charCodeAt(_tmp$2);
      let i = haystack_len - needle_len | 0;
      while (true) {
        if (i >= 0) {
          while (true) {
            let _tmp$3;
            if (i >= 0) {
              const _p$2 = i;
              const _tmp$4 = haystack.str;
              const _tmp$5 = haystack.start + _p$2 | 0;
              _tmp$3 = _tmp$4.charCodeAt(_tmp$5) !== needle_first;
            } else {
              _tmp$3 = false;
            }
            if (_tmp$3) {
              i = i - 1 | 0;
              continue;
            } else {
              break;
            }
          }
          if (i >= 0) {
            let _tmp$3 = 1;
            while (true) {
              const j = _tmp$3;
              if (j < needle_len) {
                const _p$2 = i + j | 0;
                const _tmp$4 = haystack.str;
                const _tmp$5 = haystack.start + _p$2 | 0;
                const _tmp$6 = _tmp$4.charCodeAt(_tmp$5);
                const _tmp$7 = needle.str;
                const _tmp$8 = needle.start + j | 0;
                if (_tmp$6 !== _tmp$7.charCodeAt(_tmp$8)) {
                  break;
                }
                _tmp$3 = j + 1 | 0;
                continue;
              } else {
                return i;
              }
            }
            i = i - 1 | 0;
          }
          continue;
        } else {
          break;
        }
      }
      return undefined;
    } else {
      return undefined;
    }
  } else {
    return haystack_len;
  }
}
function moonbitlang$core$string$$View$rev_find(self, str) {
  return (str.end - str.start | 0) <= 4 ? moonbitlang$core$string$$brute_force_rev_find(self, str) : moonbitlang$core$string$$boyer_moore_horspool_rev_find(self, str);
}
function moonbitlang$core$string$$String$rev_find(self, str) {
  return moonbitlang$core$string$$View$rev_find({ str: self, start: 0, end: self.length }, str);
}
function moonbitlang$core$buffer$$Buffer$grow_if_necessary(self, required) {
  const start = self.data.length <= 0 ? 1 : self.data.length;
  let enough_space;
  let _tmp = start;
  while (true) {
    const space = _tmp;
    if (space >= required) {
      enough_space = space;
      break;
    }
    _tmp = Math.imul(space, 2) | 0;
    continue;
  }
  if (enough_space !== self.data.length) {
    const new_data = $makebytes(enough_space, 0);
    moonbitlang$core$array$$FixedArray$unsafe_blit$24$(new_data, 0, self.data, 0, self.len);
    self.data = new_data;
    return;
  } else {
    return;
  }
}
function moonbitlang$core$buffer$$Buffer$write_byte(self, value) {
  moonbitlang$core$buffer$$Buffer$grow_if_necessary(self, self.len + 1 | 0);
  const _tmp = self.data;
  const _tmp$2 = self.len;
  $bound_check(_tmp, _tmp$2);
  _tmp[_tmp$2] = value;
  self.len = self.len + 1 | 0;
}
function moonbitlang$core$buffer$$Buffer$contents(self) {
  return moonbitlang$core$bytes$$from_fixedarray(self.data, self.len);
}
function moonbitlang$core$buffer$$new$46$inner(size_hint) {
  const initial = size_hint < 1 ? 1 : size_hint;
  const data = $makebytes(initial, 0);
  return { data: data, len: 0, initial_data: data };
}
function moonbitlang$core$buffer$$Buffer$write_bytes(self, value) {
  const val_len = value.length;
  moonbitlang$core$buffer$$Buffer$grow_if_necessary(self, self.len + val_len | 0);
  moonbitlang$core$array$$FixedArray$blit_from_bytes(self.data, self.len, value, 0, val_len);
  self.len = self.len + val_len | 0;
}
function moonbitlang$core$buffer$$Buffer$write_iter(self, iter) {
  iter((byte) => {
    moonbitlang$core$buffer$$Buffer$write_byte(self, byte);
    return 1;
  });
}
function moonbitlang$core$buffer$$Buffer$to_bytes(self) {
  return moonbitlang$core$bytes$$from_fixedarray(self.data, self.len);
}
function moonbitlang$ulex$lib$util$diet$$Tree$size$0$(self) {
  if (self.$tag === 0) {
    return 0;
  } else {
    const _Node = self;
    return _Node._2;
  }
}
function moonbitlang$ulex$lib$util$diet$$Tree$size$51$(self) {
  if (self.$tag === 0) {
    return 0;
  } else {
    const _Node = self;
    return _Node._2;
  }
}
function moonbitlang$ulex$lib$util$diet$$make_node$0$(min, max, l, r) {
  const size = (moonbitlang$ulex$lib$util$diet$$Tree$size$0$(l) + moonbitlang$ulex$lib$util$diet$$Tree$size$0$(r) | 0) + 1 | 0;
  return new $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Node$1$(l, r, size, min, max);
}
function moonbitlang$ulex$lib$util$diet$$make_node$51$(min, max, l, r) {
  const size = (moonbitlang$ulex$lib$util$diet$$Tree$size$51$(l) + moonbitlang$ulex$lib$util$diet$$Tree$size$51$(r) | 0) + 1 | 0;
  return new $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Node$0$(l, r, size, min, max);
}
function moonbitlang$ulex$lib$util$diet$$single_l$0$(min, max, l, r) {
  if (r.$tag === 1) {
    const _Node = r;
    return moonbitlang$ulex$lib$util$diet$$make_node$0$(_Node._3, _Node._4, moonbitlang$ulex$lib$util$diet$$make_node$0$(min, max, l, _Node._0), _Node._1);
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$util$diet$$single_l$51$(min, max, l, r) {
  if (r.$tag === 1) {
    const _Node = r;
    return moonbitlang$ulex$lib$util$diet$$make_node$51$(_Node._3, _Node._4, moonbitlang$ulex$lib$util$diet$$make_node$51$(min, max, l, _Node._0), _Node._1);
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$util$diet$$single_r$0$(min, max, l, r) {
  if (l.$tag === 1) {
    const _Node = l;
    return moonbitlang$ulex$lib$util$diet$$make_node$0$(_Node._3, _Node._4, _Node._0, moonbitlang$ulex$lib$util$diet$$make_node$0$(min, max, _Node._1, r));
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$util$diet$$single_r$51$(min, max, l, r) {
  if (l.$tag === 1) {
    const _Node = l;
    return moonbitlang$ulex$lib$util$diet$$make_node$51$(_Node._3, _Node._4, _Node._0, moonbitlang$ulex$lib$util$diet$$make_node$51$(min, max, _Node._1, r));
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$util$diet$$double_l$0$(min, max, l, r) {
  _L: {
    if (r.$tag === 1) {
      const _Node = r;
      const _x = _Node._0;
      if (_x.$tag === 1) {
        const _Node$2 = _x;
        return moonbitlang$ulex$lib$util$diet$$make_node$0$(_Node$2._3, _Node$2._4, moonbitlang$ulex$lib$util$diet$$make_node$0$(min, max, l, _Node$2._0), moonbitlang$ulex$lib$util$diet$$make_node$0$(_Node._3, _Node._4, _Node$2._1, _Node._1));
      } else {
        break _L;
      }
    } else {
      break _L;
    }
  }
  return $panic();
}
function moonbitlang$ulex$lib$util$diet$$double_l$51$(min, max, l, r) {
  _L: {
    if (r.$tag === 1) {
      const _Node = r;
      const _x = _Node._0;
      if (_x.$tag === 1) {
        const _Node$2 = _x;
        return moonbitlang$ulex$lib$util$diet$$make_node$51$(_Node$2._3, _Node$2._4, moonbitlang$ulex$lib$util$diet$$make_node$51$(min, max, l, _Node$2._0), moonbitlang$ulex$lib$util$diet$$make_node$51$(_Node._3, _Node._4, _Node$2._1, _Node._1));
      } else {
        break _L;
      }
    } else {
      break _L;
    }
  }
  return $panic();
}
function moonbitlang$ulex$lib$util$diet$$double_r$0$(min, max, l, r) {
  _L: {
    if (l.$tag === 1) {
      const _Node = l;
      const _x = _Node._1;
      if (_x.$tag === 1) {
        const _Node$2 = _x;
        return moonbitlang$ulex$lib$util$diet$$make_node$0$(_Node$2._3, _Node$2._4, moonbitlang$ulex$lib$util$diet$$make_node$0$(_Node._3, _Node._4, _Node._0, _Node$2._0), moonbitlang$ulex$lib$util$diet$$make_node$0$(min, max, _Node$2._1, r));
      } else {
        break _L;
      }
    } else {
      break _L;
    }
  }
  return $panic();
}
function moonbitlang$ulex$lib$util$diet$$double_r$51$(min, max, l, r) {
  _L: {
    if (l.$tag === 1) {
      const _Node = l;
      const _x = _Node._1;
      if (_x.$tag === 1) {
        const _Node$2 = _x;
        return moonbitlang$ulex$lib$util$diet$$make_node$51$(_Node$2._3, _Node$2._4, moonbitlang$ulex$lib$util$diet$$make_node$51$(_Node._3, _Node._4, _Node._0, _Node$2._0), moonbitlang$ulex$lib$util$diet$$make_node$51$(min, max, _Node$2._1, r));
      } else {
        break _L;
      }
    } else {
      break _L;
    }
  }
  return $panic();
}
function moonbitlang$ulex$lib$util$diet$$balance$0$(min, max, l, r) {
  const l_size = moonbitlang$ulex$lib$util$diet$$Tree$size$0$(l);
  const r_size = moonbitlang$ulex$lib$util$diet$$Tree$size$0$(r);
  if ((l_size + r_size | 0) <= 1) {
    return moonbitlang$ulex$lib$util$diet$$make_node$0$(min, max, l, r);
  } else {
    if ((r_size + 1 | 0) > (Math.imul(3, l_size + 1 | 0) | 0)) {
      if (r.$tag === 1) {
        const _Node = r;
        return (moonbitlang$ulex$lib$util$diet$$Tree$size$0$(_Node._0) + 1 | 0) < (Math.imul(2, moonbitlang$ulex$lib$util$diet$$Tree$size$0$(_Node._1) + 1 | 0) | 0) ? moonbitlang$ulex$lib$util$diet$$single_l$0$(min, max, l, _Node) : moonbitlang$ulex$lib$util$diet$$double_l$0$(min, max, l, _Node);
      } else {
        return $panic();
      }
    } else {
      if ((l_size + 1 | 0) > (Math.imul(3, r_size + 1 | 0) | 0)) {
        if (l.$tag === 1) {
          const _Node = l;
          return (moonbitlang$ulex$lib$util$diet$$Tree$size$0$(_Node._1) + 1 | 0) < (Math.imul(2, moonbitlang$ulex$lib$util$diet$$Tree$size$0$(_Node._0) + 1 | 0) | 0) ? moonbitlang$ulex$lib$util$diet$$single_r$0$(min, max, _Node, r) : moonbitlang$ulex$lib$util$diet$$double_r$0$(min, max, _Node, r);
        } else {
          return $panic();
        }
      } else {
        return moonbitlang$ulex$lib$util$diet$$make_node$0$(min, max, l, r);
      }
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$balance$51$(min, max, l, r) {
  const l_size = moonbitlang$ulex$lib$util$diet$$Tree$size$51$(l);
  const r_size = moonbitlang$ulex$lib$util$diet$$Tree$size$51$(r);
  if ((l_size + r_size | 0) <= 1) {
    return moonbitlang$ulex$lib$util$diet$$make_node$51$(min, max, l, r);
  } else {
    if ((r_size + 1 | 0) > (Math.imul(3, l_size + 1 | 0) | 0)) {
      if (r.$tag === 1) {
        const _Node = r;
        return (moonbitlang$ulex$lib$util$diet$$Tree$size$51$(_Node._0) + 1 | 0) < (Math.imul(2, moonbitlang$ulex$lib$util$diet$$Tree$size$51$(_Node._1) + 1 | 0) | 0) ? moonbitlang$ulex$lib$util$diet$$single_l$51$(min, max, l, _Node) : moonbitlang$ulex$lib$util$diet$$double_l$51$(min, max, l, _Node);
      } else {
        return $panic();
      }
    } else {
      if ((l_size + 1 | 0) > (Math.imul(3, r_size + 1 | 0) | 0)) {
        if (l.$tag === 1) {
          const _Node = l;
          return (moonbitlang$ulex$lib$util$diet$$Tree$size$51$(_Node._1) + 1 | 0) < (Math.imul(2, moonbitlang$ulex$lib$util$diet$$Tree$size$51$(_Node._0) + 1 | 0) | 0) ? moonbitlang$ulex$lib$util$diet$$single_r$51$(min, max, _Node, r) : moonbitlang$ulex$lib$util$diet$$double_r$51$(min, max, _Node, r);
        } else {
          return $panic();
        }
      } else {
        return moonbitlang$ulex$lib$util$diet$$make_node$51$(min, max, l, r);
      }
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$split_leftmost$0$(t) {
  if (t.$tag === 0) {
    return $panic();
  } else {
    const _Node = t;
    const _x = _Node._0;
    if (_x.$tag === 0) {
      const _right = _Node._1;
      const _min = _Node._3;
      const _max = _Node._4;
      return { _0: { _0: _min, _1: _max }, _1: _right };
    } else {
      const _bind = moonbitlang$ulex$lib$util$diet$$split_leftmost$0$(_Node._0);
      const _x$2 = _bind._0;
      const _min = _x$2._0;
      const _max = _x$2._1;
      const _l = _bind._1;
      return { _0: { _0: _min, _1: _max }, _1: moonbitlang$ulex$lib$util$diet$$make_node$0$(_Node._3, _Node._4, _l, _Node._1) };
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$split_leftmost$51$(t) {
  if (t.$tag === 0) {
    return $panic();
  } else {
    const _Node = t;
    const _x = _Node._0;
    if (_x.$tag === 0) {
      const _right = _Node._1;
      const _min = _Node._3;
      const _max = _Node._4;
      return { _0: { _0: _min, _1: _max }, _1: _right };
    } else {
      const _bind = moonbitlang$ulex$lib$util$diet$$split_leftmost$51$(_Node._0);
      const _x$2 = _bind._0;
      const _min = _x$2._0;
      const _max = _x$2._1;
      const _l = _bind._1;
      return { _0: { _0: _min, _1: _max }, _1: moonbitlang$ulex$lib$util$diet$$make_node$51$(_Node._3, _Node._4, _l, _Node._1) };
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$concat$0$(l, r) {
  if (l.$tag === 0) {
    return r;
  } else {
    if (r.$tag === 0) {
      return l;
    } else {
      const _Node = l;
      const _Node$2 = r;
      const _bind = moonbitlang$ulex$lib$util$diet$$split_leftmost$0$(_Node$2);
      const _x = _bind._0;
      const _min = _x._0;
      const _max = _x._1;
      const _r = _bind._1;
      return moonbitlang$ulex$lib$util$diet$$balance$0$(_min, _max, _Node, _r);
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$concat$51$(l, r) {
  if (l.$tag === 0) {
    return r;
  } else {
    if (r.$tag === 0) {
      return l;
    } else {
      const _Node = l;
      const _Node$2 = r;
      const _bind = moonbitlang$ulex$lib$util$diet$$split_leftmost$51$(_Node$2);
      const _x = _bind._0;
      const _min = _x._0;
      const _max = _x._1;
      const _r = _bind._1;
      return moonbitlang$ulex$lib$util$diet$$balance$51$(_min, _max, _Node, _r);
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$split_rightmost$0$(t) {
  if (t.$tag === 0) {
    return $panic();
  } else {
    const _Node = t;
    const _left = _Node._0;
    const _x = _Node._1;
    if (_x.$tag === 0) {
      const _min = _Node._3;
      const _max = _Node._4;
      return { _0: { _0: _min, _1: _max }, _1: _left };
    } else {
      const _bind = moonbitlang$ulex$lib$util$diet$$split_rightmost$0$(_Node._1);
      const _x$2 = _bind._0;
      const _min = _x$2._0;
      const _max = _x$2._1;
      const _r = _bind._1;
      return { _0: { _0: _min, _1: _max }, _1: moonbitlang$ulex$lib$util$diet$$make_node$0$(_Node._3, _Node._4, _Node._0, _r) };
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$split_rightmost$51$(t) {
  if (t.$tag === 0) {
    return $panic();
  } else {
    const _Node = t;
    const _left = _Node._0;
    const _x = _Node._1;
    if (_x.$tag === 0) {
      const _min = _Node._3;
      const _max = _Node._4;
      return { _0: { _0: _min, _1: _max }, _1: _left };
    } else {
      const _bind = moonbitlang$ulex$lib$util$diet$$split_rightmost$51$(_Node._1);
      const _x$2 = _bind._0;
      const _min = _x$2._0;
      const _max = _x$2._1;
      const _r = _bind._1;
      return { _0: { _0: _min, _1: _max }, _1: moonbitlang$ulex$lib$util$diet$$make_node$51$(_Node._3, _Node._4, _Node._0, _r) };
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$InorderIterator$move_left$0$(self, node) {
  let _tmp = node;
  while (true) {
    const _param = _tmp;
    if (_param.$tag === 0) {
      return;
    } else {
      const _Node = _param;
      const _left = _Node._0;
      moonbitlang$core$array$$Array$push$130$(self, _Node);
      _tmp = _left;
      continue;
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$InorderIterator$move_left$51$(self, node) {
  let _tmp = node;
  while (true) {
    const _param = _tmp;
    if (_param.$tag === 0) {
      return;
    } else {
      const _Node = _param;
      const _left = _Node._0;
      moonbitlang$core$array$$Array$push$133$(self, _Node);
      _tmp = _left;
      continue;
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$InorderIterator$new$0$(root) {
  const it = [];
  moonbitlang$ulex$lib$util$diet$$InorderIterator$move_left$0$(it, root);
  return it;
}
function moonbitlang$ulex$lib$util$diet$$InorderIterator$new$51$(root) {
  const it = [];
  moonbitlang$ulex$lib$util$diet$$InorderIterator$move_left$51$(it, root);
  return it;
}
function moonbitlang$ulex$lib$util$diet$$InorderIterator$next$0$(self) {
  const _bind = moonbitlang$core$array$$Array$pop$130$(self);
  if (_bind === undefined) {
    return undefined;
  } else {
    const _Some = _bind;
    const _curr = _Some;
    if (_curr.$tag === 1) {
      const _Node = _curr;
      const _min = _Node._3;
      const _max = _Node._4;
      const _right = _Node._1;
      moonbitlang$ulex$lib$util$diet$$InorderIterator$move_left$0$(self, _right);
      return { _0: _min, _1: _max };
    } else {
      return $panic();
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$InorderIterator$next$51$(self) {
  const _bind = moonbitlang$core$array$$Array$pop$133$(self);
  if (_bind === undefined) {
    return undefined;
  } else {
    const _Some = _bind;
    const _curr = _Some;
    if (_curr.$tag === 1) {
      const _Node = _curr;
      const _min = _Node._3;
      const _max = _Node._4;
      const _right = _Node._1;
      moonbitlang$ulex$lib$util$diet$$InorderIterator$move_left$51$(self, _right);
      return { _0: _min, _1: _max };
    } else {
      return $panic();
    }
  }
}
function moonbitlang$core$builtin$$Eq$equal$139$(self, other) {
  const iter = moonbitlang$ulex$lib$util$diet$$InorderIterator$new$0$(self);
  const iter1 = moonbitlang$ulex$lib$util$diet$$InorderIterator$new$0$(other);
  let _tmp = moonbitlang$ulex$lib$util$diet$$InorderIterator$next$0$(iter);
  let _tmp$2 = moonbitlang$ulex$lib$util$diet$$InorderIterator$next$0$(iter1);
  while (true) {
    const _param_0 = _tmp;
    const _param_1 = _tmp$2;
    if (_param_0 === undefined) {
      return _param_1 === undefined;
    } else {
      const _Some = _param_0;
      const _a = _Some;
      if (_param_1 === undefined) {
        return false;
      } else {
        const _Some$2 = _param_1;
        const _b = _Some$2;
        if (moonbitlang$core$builtin$$Eq$equal$94$(_a, _b)) {
          _tmp = moonbitlang$ulex$lib$util$diet$$InorderIterator$next$0$(iter);
          _tmp$2 = moonbitlang$ulex$lib$util$diet$$InorderIterator$next$0$(iter1);
          continue;
        } else {
          return false;
        }
      }
    }
  }
}
function moonbitlang$core$builtin$$Eq$equal$140$(self, other) {
  const iter = moonbitlang$ulex$lib$util$diet$$InorderIterator$new$51$(self);
  const iter1 = moonbitlang$ulex$lib$util$diet$$InorderIterator$new$51$(other);
  let _tmp = moonbitlang$ulex$lib$util$diet$$InorderIterator$next$51$(iter);
  let _tmp$2 = moonbitlang$ulex$lib$util$diet$$InorderIterator$next$51$(iter1);
  while (true) {
    const _param_0 = _tmp;
    const _param_1 = _tmp$2;
    if (_param_0 === undefined) {
      return _param_1 === undefined;
    } else {
      const _Some = _param_0;
      const _a = _Some;
      if (_param_1 === undefined) {
        return false;
      } else {
        const _Some$2 = _param_1;
        const _b = _Some$2;
        if (_a._0 === _b._0 && _a._1 === _b._1) {
          _tmp = moonbitlang$ulex$lib$util$diet$$InorderIterator$next$51$(iter);
          _tmp$2 = moonbitlang$ulex$lib$util$diet$$InorderIterator$next$51$(iter1);
          continue;
        } else {
          return false;
        }
      }
    }
  }
}
function moonbitlang$core$builtin$$Compare$compare$139$(self, other) {
  const iter = moonbitlang$ulex$lib$util$diet$$InorderIterator$new$0$(self);
  const iter1 = moonbitlang$ulex$lib$util$diet$$InorderIterator$new$0$(other);
  let _tmp = moonbitlang$ulex$lib$util$diet$$InorderIterator$next$0$(iter);
  let _tmp$2 = moonbitlang$ulex$lib$util$diet$$InorderIterator$next$0$(iter1);
  while (true) {
    const _param_0 = _tmp;
    const _param_1 = _tmp$2;
    if (_param_0 === undefined) {
      return _param_1 === undefined ? 0 : -1;
    } else {
      const _Some = _param_0;
      const _a = _Some;
      if (_param_1 === undefined) {
        return 1;
      } else {
        const _Some$2 = _param_1;
        const _b = _Some$2;
        const cmp = moonbitlang$core$builtin$$Compare$compare$94$(_a, _b);
        if (cmp === 0) {
          _tmp = moonbitlang$ulex$lib$util$diet$$InorderIterator$next$0$(iter);
          _tmp$2 = moonbitlang$ulex$lib$util$diet$$InorderIterator$next$0$(iter1);
          continue;
        } else {
          return cmp;
        }
      }
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$Tree$iter_intervals$0$(self) {
  const _p = (yield_) => {
    if (self.$tag === 0) {
      return 1;
    } else {
      const _Node = self;
      const _bind = moonbitlang$core$builtin$$Iter$run$134$(moonbitlang$ulex$lib$util$diet$$Tree$iter_intervals$0$(_Node._0), yield_);
      if (_bind === 1) {
        const _bind$2 = yield_({ _0: _Node._3, _1: _Node._4 });
        if (_bind$2 === 1) {
          const _bind$3 = moonbitlang$core$builtin$$Iter$run$134$(moonbitlang$ulex$lib$util$diet$$Tree$iter_intervals$0$(_Node._1), yield_);
          if (_bind$3 === 1) {
            return 1;
          } else {
            return 0;
          }
        } else {
          return 0;
        }
      } else {
        return 0;
      }
    }
  };
  return _p;
}
function moonbitlang$ulex$lib$util$diet$$Tree$iter_intervals$51$(self) {
  const _p = (yield_) => {
    if (self.$tag === 0) {
      return 1;
    } else {
      const _Node = self;
      const _bind = moonbitlang$core$builtin$$Iter$run$131$(moonbitlang$ulex$lib$util$diet$$Tree$iter_intervals$51$(_Node._0), yield_);
      if (_bind === 1) {
        const _bind$2 = yield_({ _0: _Node._3, _1: _Node._4 });
        if (_bind$2 === 1) {
          const _bind$3 = moonbitlang$core$builtin$$Iter$run$131$(moonbitlang$ulex$lib$util$diet$$Tree$iter_intervals$51$(_Node._1), yield_);
          if (_bind$3 === 1) {
            return 1;
          } else {
            return 0;
          }
        } else {
          return 0;
        }
      } else {
        return 0;
      }
    }
  };
  return _p;
}
function moonbitlang$core$builtin$$Hash$hash_combine$139$(self, hasher) {
  const _bind = moonbitlang$ulex$lib$util$diet$$Tree$iter_intervals$0$(self);
  _bind((interval) => {
    moonbitlang$core$builtin$$Hash$hash_combine$94$(interval, hasher);
    return 1;
  });
}
function moonbitlang$core$builtin$$Hash$hash_combine$140$(self, hasher) {
  const _bind = moonbitlang$ulex$lib$util$diet$$Tree$iter_intervals$51$(self);
  _bind((interval) => {
    moonbitlang$core$builtin$$Hash$hash_combine$95$(interval, hasher);
    return 1;
  });
}
function moonbitlang$ulex$lib$util$diet$$Tree$slice_from$0$(self, x) {
  let _tmp = self;
  while (true) {
    const self$2 = _tmp;
    if (self$2.$tag === 0) {
      return $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$;
    } else {
      const _Node = self$2;
      if (moonbitlang$core$builtin$$op_lt$0$(x, _Node._3)) {
        return moonbitlang$ulex$lib$util$diet$$balance$0$(_Node._3, _Node._4, moonbitlang$ulex$lib$util$diet$$Tree$slice_from$0$(_Node._0, x), _Node._1);
      } else {
        if (moonbitlang$core$builtin$$op_gt$0$(x, _Node._4)) {
          _tmp = _Node._1;
          continue;
        } else {
          return moonbitlang$ulex$lib$util$diet$$balance$0$(x, _Node._4, $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$, _Node._1);
        }
      }
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$Tree$slice_from$51$(self, x) {
  let _tmp = self;
  while (true) {
    const self$2 = _tmp;
    if (self$2.$tag === 0) {
      return $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$;
    } else {
      const _Node = self$2;
      if (x < _Node._3) {
        return moonbitlang$ulex$lib$util$diet$$balance$51$(_Node._3, _Node._4, moonbitlang$ulex$lib$util$diet$$Tree$slice_from$51$(_Node._0, x), _Node._1);
      } else {
        if (x > _Node._4) {
          _tmp = _Node._1;
          continue;
        } else {
          return moonbitlang$ulex$lib$util$diet$$balance$51$(x, _Node._4, $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$, _Node._1);
        }
      }
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$Tree$slice_until$0$(self, x) {
  let _tmp = self;
  while (true) {
    const self$2 = _tmp;
    if (self$2.$tag === 0) {
      return $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$;
    } else {
      const _Node = self$2;
      if (moonbitlang$core$builtin$$op_gt$0$(x, _Node._4)) {
        return moonbitlang$ulex$lib$util$diet$$balance$0$(_Node._3, _Node._4, _Node._0, moonbitlang$ulex$lib$util$diet$$Tree$slice_until$0$(_Node._1, x));
      } else {
        if (moonbitlang$core$builtin$$op_lt$0$(x, _Node._3)) {
          _tmp = _Node._0;
          continue;
        } else {
          return moonbitlang$ulex$lib$util$diet$$balance$0$(_Node._3, x, _Node._0, $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$);
        }
      }
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$Tree$slice_until$51$(self, x) {
  let _tmp = self;
  while (true) {
    const self$2 = _tmp;
    if (self$2.$tag === 0) {
      return $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$;
    } else {
      const _Node = self$2;
      if (x > _Node._4) {
        return moonbitlang$ulex$lib$util$diet$$balance$51$(_Node._3, _Node._4, _Node._0, moonbitlang$ulex$lib$util$diet$$Tree$slice_until$51$(_Node._1, x));
      } else {
        if (x < _Node._3) {
          _tmp = _Node._0;
          continue;
        } else {
          return moonbitlang$ulex$lib$util$diet$$balance$51$(_Node._3, x, _Node._0, $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$);
        }
      }
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$Tree$slice_before$0$(self, x) {
  const _p = -1;
  if (x === _p) {
    return $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$;
  } else {
    return moonbitlang$ulex$lib$util$diet$$Tree$slice_until$0$(self, x > -1 ? x - 1 | 0 : $panic());
  }
}
function moonbitlang$ulex$lib$util$diet$$Tree$slice_before$51$(self, x) {
  return x === 0 ? $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$ : moonbitlang$ulex$lib$util$diet$$Tree$slice_until$51$(self, x - 1 | 0);
}
function moonbitlang$ulex$lib$util$diet$$Tree$slice_after$0$(self, x) {
  const _p = 1114111;
  if (x === _p) {
    return $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$;
  } else {
    return moonbitlang$ulex$lib$util$diet$$Tree$slice_from$0$(self, x < 1114111 ? x + 1 | 0 : $panic());
  }
}
function moonbitlang$ulex$lib$util$diet$$Tree$slice_after$51$(self, x) {
  return x === 1114111 ? $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$ : moonbitlang$ulex$lib$util$diet$$Tree$slice_from$51$(self, x + 1 | 0);
}
function moonbitlang$ulex$lib$util$diet$$Tree$slice$0$(self, min, max) {
  if (min === undefined) {
    if (max === undefined) {
      return $panic();
    } else {
      const _Some = max;
      const _max = _Some;
      return moonbitlang$ulex$lib$util$diet$$Tree$slice_until$0$(self, _max);
    }
  } else {
    const _Some = min;
    const _min = _Some;
    if (max === undefined) {
      return moonbitlang$ulex$lib$util$diet$$Tree$slice_from$0$(self, _min);
    } else {
      const _Some$2 = max;
      const _max = _Some$2;
      return moonbitlang$ulex$lib$util$diet$$Tree$slice_until$0$(moonbitlang$ulex$lib$util$diet$$Tree$slice_from$0$(self, _min), _max);
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$Tree$slice$51$(self, min, max) {
  if (min === -1) {
    if (max === -1) {
      return $panic();
    } else {
      const _Some = max;
      const _max = _Some;
      return moonbitlang$ulex$lib$util$diet$$Tree$slice_until$51$(self, _max);
    }
  } else {
    const _Some = min;
    const _min = _Some;
    if (max === -1) {
      return moonbitlang$ulex$lib$util$diet$$Tree$slice_from$51$(self, _min);
    } else {
      const _Some$2 = max;
      const _max = _Some$2;
      return moonbitlang$ulex$lib$util$diet$$Tree$slice_until$51$(moonbitlang$ulex$lib$util$diet$$Tree$slice_from$51$(self, _min), _max);
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$Tree$is_empty$0$(self) {
  if (self.$tag === 0) {
    return true;
  } else {
    return false;
  }
}
function moonbitlang$ulex$lib$util$diet$$Tree$is_empty$51$(self) {
  if (self.$tag === 0) {
    return true;
  } else {
    return false;
  }
}
function moonbitlang$ulex$lib$util$diet$$Tree$contains$0$(self, x) {
  let _tmp = self;
  while (true) {
    const self$2 = _tmp;
    if (self$2.$tag === 0) {
      return false;
    } else {
      const _Node = self$2;
      if (moonbitlang$core$builtin$$op_lt$0$(x, _Node._3)) {
        _tmp = _Node._0;
        continue;
      } else {
        if (moonbitlang$core$builtin$$op_gt$0$(x, _Node._4)) {
          _tmp = _Node._1;
          continue;
        } else {
          return true;
        }
      }
    }
  }
}
function moonbitlang$ulex$lib$util$diet$$union$0$(t1, t2) {
  let t;
  _L: {
    if (t1.$tag === 0) {
      if (t2.$tag === 0) {
        return $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$;
      } else {
        const _Node = t2;
        t = _Node;
        break _L;
      }
    } else {
      const _Node = t1;
      if (t2.$tag === 0) {
        t = _Node;
        break _L;
      } else {
        const _Node$2 = t2;
        let t1$2;
        let t2$2;
        _L$2: {
          if (_Node._2 >= _Node$2._2) {
            t1$2 = _Node;
            t2$2 = _Node$2;
            break _L$2;
          } else {
            t1$2 = _Node$2;
            t2$2 = _Node;
            break _L$2;
          }
        }
        return moonbitlang$ulex$lib$util$diet$$union_aux$0$(t1$2, t2$2);
      }
    }
  }
  return t;
}
function moonbitlang$ulex$lib$util$diet$$union$51$(t1, t2) {
  let t;
  _L: {
    if (t1.$tag === 0) {
      if (t2.$tag === 0) {
        return $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$;
      } else {
        const _Node = t2;
        t = _Node;
        break _L;
      }
    } else {
      const _Node = t1;
      if (t2.$tag === 0) {
        t = _Node;
        break _L;
      } else {
        const _Node$2 = t2;
        let t1$2;
        let t2$2;
        _L$2: {
          if (_Node._2 >= _Node$2._2) {
            t1$2 = _Node;
            t2$2 = _Node$2;
            break _L$2;
          } else {
            t1$2 = _Node$2;
            t2$2 = _Node;
            break _L$2;
          }
        }
        return moonbitlang$ulex$lib$util$diet$$union_aux$51$(t1$2, t2$2);
      }
    }
  }
  return t;
}
function moonbitlang$ulex$lib$util$diet$$union_aux$0$(t1, t2) {
  if (t1.$tag === 1) {
    const _Node = t1;
    if (t2.$tag === 1) {
      const _Node$2 = t2;
      const l1 = _Node._0;
      const r1 = _Node._1;
      const l2 = moonbitlang$ulex$lib$util$diet$$Tree$slice_before$0$(_Node$2, _Node._3);
      const r2 = moonbitlang$ulex$lib$util$diet$$Tree$slice_after$0$(_Node$2, _Node._4);
      let _bind;
      const _p = _Node._3;
      const _p$2 = -1;
      if (_p === _p$2) {
        _bind = { _0: _Node._3, _1: $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$ };
      } else {
        const l = moonbitlang$ulex$lib$util$diet$$union$0$(l1, l2);
        if (l.$tag === 0) {
          _bind = { _0: _Node._3, _1: $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$ };
        } else {
          const _bind$2 = moonbitlang$ulex$lib$util$diet$$split_rightmost$0$(l);
          const _x = _bind$2._0;
          const _min = _x._0;
          const _max = _x._1;
          const _l3 = _bind$2._1;
          let _tmp;
          if (moonbitlang$core$builtin$$op_lt$0$(_max, 1114111)) {
            const _p$3 = _max < 1114111 ? _max + 1 | 0 : $panic();
            const _p$4 = _Node._3;
            _tmp = _p$3 === _p$4;
          } else {
            _tmp = false;
          }
          if (_tmp) {
            _bind = { _0: _min, _1: _l3 };
          } else {
            _bind = { _0: _Node._3, _1: l };
          }
        }
      }
      const _min = _bind._0;
      const _l = _bind._1;
      let _bind$2;
      const _p$3 = _Node._4;
      const _p$4 = 1114111;
      if (_p$3 === _p$4) {
        _bind$2 = { _0: _Node._4, _1: $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$ };
      } else {
        const r = moonbitlang$ulex$lib$util$diet$$union$0$(r1, r2);
        if (r.$tag === 0) {
          _bind$2 = { _0: _Node._4, _1: $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$ };
        } else {
          const _bind$3 = moonbitlang$ulex$lib$util$diet$$split_leftmost$0$(r);
          const _x = _bind$3._0;
          const _min$2 = _x._0;
          const _max = _x._1;
          const _r3 = _bind$3._1;
          let _tmp;
          if (moonbitlang$core$builtin$$op_gt$0$(_min$2, -1)) {
            const _p$5 = _min$2 > -1 ? _min$2 - 1 | 0 : $panic();
            const _p$6 = _Node._4;
            _tmp = _p$5 === _p$6;
          } else {
            _tmp = false;
          }
          if (_tmp) {
            _bind$2 = { _0: _max, _1: _r3 };
          } else {
            _bind$2 = { _0: _Node._4, _1: r };
          }
        }
      }
      const _max = _bind$2._0;
      const _r = _bind$2._1;
      return moonbitlang$ulex$lib$util$diet$$balance$0$(_min, _max, _l, _r);
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$util$diet$$union_aux$51$(t1, t2) {
  if (t1.$tag === 1) {
    const _Node = t1;
    if (t2.$tag === 1) {
      const _Node$2 = t2;
      const l1 = _Node._0;
      const r1 = _Node._1;
      const l2 = moonbitlang$ulex$lib$util$diet$$Tree$slice_before$51$(_Node$2, _Node._3);
      const r2 = moonbitlang$ulex$lib$util$diet$$Tree$slice_after$51$(_Node$2, _Node._4);
      let _bind;
      if (_Node._3 === 0) {
        _bind = { _0: _Node._3, _1: $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$ };
      } else {
        const l = moonbitlang$ulex$lib$util$diet$$union$51$(l1, l2);
        if (l.$tag === 0) {
          _bind = { _0: _Node._3, _1: $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$ };
        } else {
          const _bind$2 = moonbitlang$ulex$lib$util$diet$$split_rightmost$51$(l);
          const _x = _bind$2._0;
          const _min = _x._0;
          const _max = _x._1;
          const _l3 = _bind$2._1;
          _bind = _max < 1114111 && (_max + 1 | 0) === _Node._3 ? { _0: _min, _1: _l3 } : { _0: _Node._3, _1: l };
        }
      }
      const _min = _bind._0;
      const _l = _bind._1;
      let _bind$2;
      if (_Node._4 === 1114111) {
        _bind$2 = { _0: _Node._4, _1: $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$ };
      } else {
        const r = moonbitlang$ulex$lib$util$diet$$union$51$(r1, r2);
        if (r.$tag === 0) {
          _bind$2 = { _0: _Node._4, _1: $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$ };
        } else {
          const _bind$3 = moonbitlang$ulex$lib$util$diet$$split_leftmost$51$(r);
          const _x = _bind$3._0;
          const _min$2 = _x._0;
          const _max = _x._1;
          const _r3 = _bind$3._1;
          _bind$2 = _min$2 > 0 && (_min$2 - 1 | 0) === _Node._4 ? { _0: _max, _1: _r3 } : { _0: _Node._4, _1: r };
        }
      }
      const _max = _bind$2._0;
      const _r = _bind$2._1;
      return moonbitlang$ulex$lib$util$diet$$balance$51$(_min, _max, _l, _r);
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$util$diet$$intersection$0$(t1, t2) {
  _L: {
    if (t1.$tag === 0) {
      break _L;
    } else {
      if (t2.$tag === 0) {
        break _L;
      } else {
        const _Node = t1;
        const _Node$2 = t2;
        let t1$2;
        let t2$2;
        _L$2: {
          if (_Node._2 >= _Node$2._2) {
            t1$2 = _Node;
            t2$2 = _Node$2;
            break _L$2;
          } else {
            t1$2 = _Node$2;
            t2$2 = _Node;
            break _L$2;
          }
        }
        return moonbitlang$ulex$lib$util$diet$$intersection_aux$0$(t1$2, t2$2);
      }
    }
  }
  return $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$;
}
function moonbitlang$ulex$lib$util$diet$$intersection$51$(t1, t2) {
  _L: {
    if (t1.$tag === 0) {
      break _L;
    } else {
      if (t2.$tag === 0) {
        break _L;
      } else {
        const _Node = t1;
        const _Node$2 = t2;
        let t1$2;
        let t2$2;
        _L$2: {
          if (_Node._2 >= _Node$2._2) {
            t1$2 = _Node;
            t2$2 = _Node$2;
            break _L$2;
          } else {
            t1$2 = _Node$2;
            t2$2 = _Node;
            break _L$2;
          }
        }
        return moonbitlang$ulex$lib$util$diet$$intersection_aux$51$(t1$2, t2$2);
      }
    }
  }
  return $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$;
}
function moonbitlang$ulex$lib$util$diet$$intersection_aux$0$(t1, t2) {
  if (t1.$tag === 1) {
    const _Node = t1;
    if (t2.$tag === 1) {
      const _Node$2 = t2;
      const l1 = _Node._0;
      const r1 = _Node._1;
      const l2 = moonbitlang$ulex$lib$util$diet$$Tree$slice_before$0$(_Node$2, _Node._3);
      const r2 = moonbitlang$ulex$lib$util$diet$$Tree$slice_after$0$(_Node$2, _Node._4);
      const l = moonbitlang$ulex$lib$util$diet$$intersection$0$(l1, l2);
      const r = moonbitlang$ulex$lib$util$diet$$intersection$0$(r1, r2);
      const m = moonbitlang$ulex$lib$util$diet$$Tree$slice$0$(_Node$2, _Node._3, _Node._4);
      return moonbitlang$ulex$lib$util$diet$$concat$0$(moonbitlang$ulex$lib$util$diet$$concat$0$(l, m), r);
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$util$diet$$intersection_aux$51$(t1, t2) {
  if (t1.$tag === 1) {
    const _Node = t1;
    if (t2.$tag === 1) {
      const _Node$2 = t2;
      const l1 = _Node._0;
      const r1 = _Node._1;
      const l2 = moonbitlang$ulex$lib$util$diet$$Tree$slice_before$51$(_Node$2, _Node._3);
      const r2 = moonbitlang$ulex$lib$util$diet$$Tree$slice_after$51$(_Node$2, _Node._4);
      const l = moonbitlang$ulex$lib$util$diet$$intersection$51$(l1, l2);
      const r = moonbitlang$ulex$lib$util$diet$$intersection$51$(r1, r2);
      const m = moonbitlang$ulex$lib$util$diet$$Tree$slice$51$(_Node$2, _Node._3, _Node._4);
      return moonbitlang$ulex$lib$util$diet$$concat$51$(moonbitlang$ulex$lib$util$diet$$concat$51$(l, m), r);
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$util$diet$$interval$51$(min, max) {
  return moonbitlang$ulex$lib$util$diet$$make_node$51$(min, max, $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$, $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$);
}
function moonbitlang$ulex$lib$util$diet$$interval$0$(min, max) {
  return moonbitlang$ulex$lib$util$diet$$make_node$0$(min, max, $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$, $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$);
}
function moonbitlang$ulex$lib$util$diet$$complement_aux$0$(min, max, t) {
  if (t.$tag === 0) {
    return moonbitlang$ulex$lib$util$diet$$interval$0$(min, max);
  } else {
    const _Node = t;
    let l;
    const _p = _Node._3;
    const _p$2 = -1;
    if (_p === _p$2) {
      l = $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$;
    } else {
      const _p$3 = _Node._3;
      const _tmp = _p$3 > -1 ? _p$3 - 1 | 0 : $panic();
      l = moonbitlang$ulex$lib$util$diet$$complement_aux$0$(min, _tmp, _Node._0);
    }
    let r;
    const _p$3 = _Node._4;
    const _p$4 = 1114111;
    if (_p$3 === _p$4) {
      r = $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$;
    } else {
      const _p$5 = _Node._4;
      const _tmp = _p$5 < 1114111 ? _p$5 + 1 | 0 : $panic();
      r = moonbitlang$ulex$lib$util$diet$$complement_aux$0$(_tmp, max, _Node._1);
    }
    return moonbitlang$ulex$lib$util$diet$$concat$0$(l, r);
  }
}
function moonbitlang$ulex$lib$util$diet$$complement_aux$51$(min, max, t) {
  if (t.$tag === 0) {
    return moonbitlang$ulex$lib$util$diet$$interval$51$(min, max);
  } else {
    const _Node = t;
    let l;
    if (_Node._3 === 0) {
      l = $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$;
    } else {
      const _p = _Node._3;
      const _tmp = _p - 1 | 0;
      l = moonbitlang$ulex$lib$util$diet$$complement_aux$51$(min, _tmp, _Node._0);
    }
    let r;
    if (_Node._4 === 1114111) {
      r = $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$;
    } else {
      const _p = _Node._4;
      const _tmp = _p + 1 | 0;
      r = moonbitlang$ulex$lib$util$diet$$complement_aux$51$(_tmp, max, _Node._1);
    }
    return moonbitlang$ulex$lib$util$diet$$concat$51$(l, r);
  }
}
function moonbitlang$ulex$lib$util$diet$$Tree$complement$0$(self) {
  return moonbitlang$ulex$lib$util$diet$$complement_aux$0$(-1, 1114111, self);
}
function moonbitlang$ulex$lib$util$diet$$Tree$complement$51$(self) {
  return moonbitlang$ulex$lib$util$diet$$complement_aux$51$(0, 1114111, self);
}
function moonbitlang$ulex$lib$util$diet$$difference$0$(t1, t2) {
  return moonbitlang$ulex$lib$util$diet$$intersection$0$(t1, moonbitlang$ulex$lib$util$diet$$Tree$complement$0$(t2));
}
function moonbitlang$ulex$lib$util$diet$$difference$51$(t1, t2) {
  return moonbitlang$ulex$lib$util$diet$$intersection$51$(t1, moonbitlang$ulex$lib$util$diet$$Tree$complement$51$(t2));
}
function moonbitlang$ulex$lib$util$diet$$Tree$unsafe_choose$0$(self) {
  if (self.$tag === 0) {
    return $panic();
  } else {
    const _Node = self;
    return _Node._3;
  }
}
function moonbitlang$ulex$lib$util$diet$$singleton$0$(x) {
  return moonbitlang$ulex$lib$util$diet$$make_node$0$(x, x, $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$, $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$1$);
}
function moonbitlang$ulex$lib$util$diet$$singleton$51$(x) {
  return moonbitlang$ulex$lib$util$diet$$make_node$51$(x, x, $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$, $64$moonbitlang$47$ulex$47$lib$47$util$47$diet$46$Tree$Empty$0$);
}
function moonbitlang$core$builtin$$Eq$equal$27$(_x_47, _x_48) {
  return moonbitlang$core$builtin$$Eq$equal$140$(_x_47, _x_48);
}
function moonbitlang$core$builtin$$Hash$hash_combine$27$(_x_43, _x_44) {
  moonbitlang$core$builtin$$Hash$hash_combine$140$(_x_43, _x_44);
}
function moonbitlang$ulex$lib$util$char_set$$singleton(x) {
  return moonbitlang$ulex$lib$util$diet$$singleton$51$(x);
}
function moonbitlang$ulex$lib$util$char_set$$range(min, max) {
  return moonbitlang$ulex$lib$util$diet$$interval$51$(min, max);
}
function moonbitlang$ulex$lib$util$char_set$$CharSet$complement(self) {
  return moonbitlang$ulex$lib$util$diet$$Tree$complement$51$(self);
}
function moonbitlang$ulex$lib$util$char_set$$CharSet$negated(self) {
  return moonbitlang$ulex$lib$util$char_set$$CharSet$complement(self);
}
function moonbitlang$ulex$lib$util$char_set$$CharSet$is_empty(self) {
  return moonbitlang$ulex$lib$util$diet$$Tree$is_empty$51$(self);
}
function moonbitlang$ulex$lib$util$char_set$$CharSet$union(self, other) {
  return moonbitlang$ulex$lib$util$diet$$union$51$(self, other);
}
function moonbitlang$ulex$lib$util$char_set$$CharSet$intersection(self, other) {
  return moonbitlang$ulex$lib$util$diet$$intersection$51$(self, other);
}
function moonbitlang$ulex$lib$util$char_set$$CharSet$difference(self, other) {
  return moonbitlang$ulex$lib$util$diet$$difference$51$(self, other);
}
function moonbitlang$core$builtin$$Add$add$27$(self, other) {
  return moonbitlang$ulex$lib$util$char_set$$CharSet$union(self, other);
}
function moonbitlang$core$builtin$$Sub$sub$27$(self, other) {
  return moonbitlang$ulex$lib$util$char_set$$CharSet$difference(self, other);
}
function moonbitlang$core$builtin$$BitAnd$land$27$(self, other) {
  return moonbitlang$ulex$lib$util$char_set$$CharSet$intersection(self, other);
}
function moonbitlang$ulex$lib$util$char_set$$CharSet$iter_ranges(self) {
  return moonbitlang$ulex$lib$util$diet$$Tree$iter_intervals$51$(self);
}
function moonbitlang$x$encoding$$slice(bytes, offset, length) {
  const new_bytes = $makebytes(length, 48);
  moonbitlang$core$array$$FixedArray$blit_to$46$inner$24$(bytes, new_bytes, length, offset, 0);
  return moonbitlang$core$bytes$$Bytes$from_fixedarray(new_bytes, undefined);
}
function moonbitlang$x$encoding$$malformed(bytes, offset, length) {
  return new $64$moonbitlang$47$x$47$encoding$46$Decode$Malformed(moonbitlang$x$encoding$$slice(bytes, offset, length));
}
function moonbitlang$x$encoding$$malformed_pair(be, hi, bytes, offset, length) {
  const bs1 = $makebytes(length, 0);
  moonbitlang$core$array$$FixedArray$blit_to$46$inner$24$(bytes, bs1, length, offset, 0);
  const bs0 = $makebytes(2, 0);
  let j0;
  let j1;
  _L: {
    if (be) {
      j0 = 0;
      j1 = 1;
      break _L;
    } else {
      j0 = 1;
      j1 = 0;
      break _L;
    }
  }
  $bound_check(bs0, j0);
  bs0[j0] = hi >> 8 & 255;
  $bound_check(bs0, j1);
  bs0[j1] = hi & 255;
  const bs = moonbitlang$core$buffer$$new$46$inner(bs0.length + bs1.length | 0);
  moonbitlang$core$buffer$$Buffer$write_bytes(bs, moonbitlang$core$bytes$$Bytes$from_fixedarray(bs0, 2));
  moonbitlang$core$buffer$$Buffer$write_bytes(bs, moonbitlang$core$bytes$$Bytes$from_fixedarray(bs1, length));
  return new $64$moonbitlang$47$x$47$encoding$46$Decode$Malformed(moonbitlang$x$encoding$$slice(moonbitlang$core$bytes$$Bytes$to_fixedarray(moonbitlang$core$buffer$$Buffer$to_bytes(bs), undefined), 0, bs.len));
}
function moonbitlang$x$encoding$$write_utf16be_char(buf, value) {
  const code = value;
  if (code >>> 0 < 65536 >>> 0) {
    const _p = code >>> 8 | 0;
    const b0 = _p & 255;
    const _p$2 = code & 255;
    const b1 = _p$2 & 255;
    moonbitlang$core$buffer$$Buffer$write_byte(buf, b0);
    moonbitlang$core$buffer$$Buffer$write_byte(buf, b1);
    return;
  } else {
    if (code >>> 0 < 1114112 >>> 0) {
      const hi = (code >>> 0) - (65536 >>> 0) | 0;
      const lo = hi >>> 10 | 55296;
      const hi$2 = hi & 1023 | 56320;
      const _p = lo >>> 8 | 0;
      const b0 = _p & 255;
      const _p$2 = lo & 255;
      const b1 = _p$2 & 255;
      const _p$3 = hi$2 >>> 8 | 0;
      const b2 = _p$3 & 255;
      const _p$4 = hi$2 & 255;
      const b3 = _p$4 & 255;
      moonbitlang$core$buffer$$Buffer$write_byte(buf, b0);
      moonbitlang$core$buffer$$Buffer$write_byte(buf, b1);
      moonbitlang$core$buffer$$Buffer$write_byte(buf, b2);
      moonbitlang$core$buffer$$Buffer$write_byte(buf, b3);
      return;
    } else {
      moonbitlang$core$abort$$abort$1$("Char out of range");
      return;
    }
  }
}
function moonbitlang$x$encoding$$write_utf8_char(buf, value) {
  const code = value;
  if (code >>> 0 < 128 >>> 0) {
    const _p = code & 127 | 0;
    const b0 = _p & 255;
    moonbitlang$core$buffer$$Buffer$write_byte(buf, b0);
    return;
  } else {
    if (code >>> 0 < 2048 >>> 0) {
      const _p = code >>> 6 & 31 | 192;
      const b0 = _p & 255;
      const _p$2 = code & 63 | 128;
      const b1 = _p$2 & 255;
      moonbitlang$core$buffer$$Buffer$write_byte(buf, b0);
      moonbitlang$core$buffer$$Buffer$write_byte(buf, b1);
      return;
    } else {
      if (code >>> 0 < 65536 >>> 0) {
        const _p = code >>> 12 & 15 | 224;
        const b0 = _p & 255;
        const _p$2 = code >>> 6 & 63 | 128;
        const b1 = _p$2 & 255;
        const _p$3 = code & 63 | 128;
        const b2 = _p$3 & 255;
        moonbitlang$core$buffer$$Buffer$write_byte(buf, b0);
        moonbitlang$core$buffer$$Buffer$write_byte(buf, b1);
        moonbitlang$core$buffer$$Buffer$write_byte(buf, b2);
        return;
      } else {
        if (code >>> 0 < 1114112 >>> 0) {
          const _p = code >>> 18 & 7 | 240;
          const b0 = _p & 255;
          const _p$2 = code >>> 12 & 63 | 128;
          const b1 = _p$2 & 255;
          const _p$3 = code >>> 6 & 63 | 128;
          const b2 = _p$3 & 255;
          const _p$4 = code & 63 | 128;
          const b3 = _p$4 & 255;
          moonbitlang$core$buffer$$Buffer$write_byte(buf, b0);
          moonbitlang$core$buffer$$Buffer$write_byte(buf, b1);
          moonbitlang$core$buffer$$Buffer$write_byte(buf, b2);
          moonbitlang$core$buffer$$Buffer$write_byte(buf, b3);
          return;
        } else {
          moonbitlang$core$abort$$abort$1$("Char out of range");
          return;
        }
      }
    }
  }
}
function moonbitlang$x$encoding$$encode(encoding, src) {
  _L: {
    _L$2: {
      switch (encoding) {
        case 1: {
          break _L$2;
        }
        case 2: {
          break _L$2;
        }
      }
      break _L;
    }
    return moonbitlang$core$string$$String$to_bytes(src);
  }
  const new_buf = moonbitlang$core$buffer$$new$46$inner(Math.imul(src.length, 4) | 0);
  let write;
  switch (encoding) {
    case 0: {
      write = moonbitlang$x$encoding$$write_utf8_char;
      break;
    }
    case 3: {
      write = moonbitlang$x$encoding$$write_utf16be_char;
      break;
    }
    default: {
      write = moonbitlang$core$abort$$abort$20$("unreachable");
    }
  }
  const _bind = moonbitlang$core$string$$String$iter(src);
  _bind((char) => {
    write(new_buf, char);
    return 1;
  });
  return moonbitlang$core$buffer$$Buffer$to_bytes(new_buf);
}
function moonbitlang$x$encoding$$r_utf_16(bytes, offset0, offset1) {
  $bound_check(bytes, offset0);
  const b0 = bytes[offset0];
  $bound_check(bytes, offset1);
  const b1 = bytes[offset1];
  const u = b0 << 8 | b1;
  return u < 55296 || u > 57343 ? new $64$moonbitlang$47$x$47$encoding$46$UTF16Decode$UTF16Uchar(u) : u > 56319 ? new $64$moonbitlang$47$x$47$encoding$46$UTF16Decode$UTF16Malformed(moonbitlang$x$encoding$$slice(bytes, offset0 > offset1 ? offset1 : offset0, 2)) : new $64$moonbitlang$47$x$47$encoding$46$UTF16Decode$Hi(u);
}
function moonbitlang$x$encoding$$curry$141$(f) {
  return (x) => (y) => f(x, y);
}
function moonbitlang$x$encoding$$curry$142$(f) {
  return (x) => (y) => f(x, y);
}
function moonbitlang$x$encoding$$Decoder$eoi(self) {
  self.i = moonbitlang$core$builtin$$Default$default$137$();
}
function moonbitlang$x$encoding$$Decoder$ret(self, k, v) {
  self.k = k;
  return v;
}
function moonbitlang$x$encoding$$Decoder$refill(self, k) {
  moonbitlang$x$encoding$$Decoder$eoi(self);
  return moonbitlang$x$encoding$$Decoder$ret(self, k, new $64$moonbitlang$47$x$47$encoding$46$Decode$Refill(moonbitlang$core$bytes$$Bytes$from_fixedarray(self.t, undefined)));
}
function moonbitlang$x$encoding$$t_fill$46$blit$124$69(decoder, l) {
  moonbitlang$core$array$$FixedArray$blit_to$46$inner$24$(decoder.i, decoder.t, l, decoder.i_pos, decoder.t_len);
  decoder.i_pos = decoder.i_pos + l | 0;
  decoder.t_len = decoder.t_len + l | 0;
}
function moonbitlang$x$encoding$$t_fill(k, decoder) {
  const rem = decoder.i.length - decoder.i_pos | 0;
  if (rem < 0) {
    const _func = k;
    return _func(decoder);
  } else {
    const need = decoder.t_need - decoder.t_len | 0;
    if (rem < need) {
      moonbitlang$x$encoding$$t_fill$46$blit$124$69(decoder, rem);
      const _func = moonbitlang$x$encoding$$curry$141$(moonbitlang$x$encoding$$t_fill);
      return moonbitlang$x$encoding$$Decoder$refill(decoder, _func(k));
    } else {
      moonbitlang$x$encoding$$t_fill$46$blit$124$69(decoder, need);
      const _func = k;
      return _func(decoder);
    }
  }
}
function moonbitlang$x$encoding$$r_utf_16_lo(hi, bytes, offset0, offset1) {
  $bound_check(bytes, offset0);
  const b0 = bytes[offset0];
  $bound_check(bytes, offset1);
  const b1 = bytes[offset1];
  const lo = b0 << 8 | b1;
  if (lo < 56320 || lo > 57343) {
    $bound_check(bytes, offset0);
    const _tmp = bytes[offset0];
    $bound_check(bytes, offset1);
    return new $64$moonbitlang$47$x$47$encoding$46$Decode$Malformed(new Uint8Array([_tmp, bytes[offset1]]));
  } else {
    return new $64$moonbitlang$47$x$47$encoding$46$Decode$Uchar((hi & 1023) << 10 | ((lo & 1023) + 65536 | 0));
  }
}
function moonbitlang$x$encoding$$Decoder$t_need(self, need) {
  self.t_len = 0;
  self.t_need = need;
}
function moonbitlang$x$encoding$$Decoder$decode_utf_16be(self) {
  const rem = self.i.length - self.i_pos | 0;
  if (rem <= 0) {
    return $64$moonbitlang$47$x$47$encoding$46$Decode$End;
  } else {
    if (rem < 2) {
      moonbitlang$x$encoding$$Decoder$t_need(self, 2);
      return moonbitlang$x$encoding$$t_fill(moonbitlang$x$encoding$$Decoder$t_decode_utf_16be, self);
    } else {
      const j = self.i_pos;
      self.i_pos = self.i_pos + 2 | 0;
      return moonbitlang$x$encoding$$Decoder$decode_utf_16be_lo(self, moonbitlang$x$encoding$$r_utf_16(self.i, j, j + 1 | 0));
    }
  }
}
function moonbitlang$x$encoding$$Decoder$decode_utf_16be_lo(self, decode) {
  switch (decode.$tag) {
    case 2: {
      const _UTF16Uchar = decode;
      const _x = _UTF16Uchar._0;
      return moonbitlang$x$encoding$$Decoder$ret(self, moonbitlang$x$encoding$$Decoder$decode_utf_16be, new $64$moonbitlang$47$x$47$encoding$46$Decode$Uchar(_x));
    }
    case 1: {
      const _UTF16Malformed = decode;
      const _x$2 = _UTF16Malformed._0;
      return moonbitlang$x$encoding$$Decoder$ret(self, moonbitlang$x$encoding$$Decoder$decode_utf_16be, new $64$moonbitlang$47$x$47$encoding$46$Decode$Malformed(_x$2));
    }
    default: {
      const _Hi = decode;
      const _hi = _Hi._0;
      const rem = self.i.length - self.i_pos | 0;
      if (rem < 2) {
        moonbitlang$x$encoding$$Decoder$t_need(self, 2);
        const _func = moonbitlang$x$encoding$$curry$142$(moonbitlang$x$encoding$$t_decode_utf_16be_lo);
        return moonbitlang$x$encoding$$t_fill(_func(_hi), self);
      } else {
        const j = self.i_pos;
        const dcd = moonbitlang$x$encoding$$r_utf_16_lo(_hi, self.i, j, j + 1 | 0);
        if (dcd.$tag === 3) {
          self.i_pos = self.i_pos + 2 | 0;
        }
        return moonbitlang$x$encoding$$Decoder$ret(self, moonbitlang$x$encoding$$Decoder$decode_utf_16be, dcd);
      }
    }
  }
}
function moonbitlang$x$encoding$$t_decode_utf_16be_lo(hi, self) {
  return self.t_len < self.t_need ? moonbitlang$x$encoding$$Decoder$ret(self, moonbitlang$x$encoding$$Decoder$decode_utf_16be, moonbitlang$x$encoding$$malformed_pair(true, hi, self.t, 0, self.t_len)) : moonbitlang$x$encoding$$Decoder$ret(self, moonbitlang$x$encoding$$Decoder$decode_utf_16be, moonbitlang$x$encoding$$r_utf_16_lo(hi, self.t, 0, 1));
}
function moonbitlang$x$encoding$$Decoder$t_decode_utf_16be(self) {
  return self.t_len < self.t_need ? moonbitlang$x$encoding$$Decoder$ret(self, moonbitlang$x$encoding$$Decoder$decode_utf_16be, moonbitlang$x$encoding$$malformed(self.t, 0, self.t_len)) : moonbitlang$x$encoding$$Decoder$decode_utf_16be_lo(self, moonbitlang$x$encoding$$r_utf_16(self.t, 0, 1));
}
function moonbitlang$x$encoding$$Decoder$decode_utf_16le(self) {
  const rem = self.i.length - self.i_pos | 0;
  if (rem <= 0) {
    return $64$moonbitlang$47$x$47$encoding$46$Decode$End;
  } else {
    if (rem < 2) {
      moonbitlang$x$encoding$$Decoder$t_need(self, 2);
      return moonbitlang$x$encoding$$t_fill(moonbitlang$x$encoding$$Decoder$t_decode_utf_16le, self);
    } else {
      const j = self.i_pos;
      self.i_pos = self.i_pos + 2 | 0;
      return moonbitlang$x$encoding$$Decoder$decode_utf_16le_lo(self, moonbitlang$x$encoding$$r_utf_16(self.i, j + 1 | 0, j));
    }
  }
}
function moonbitlang$x$encoding$$Decoder$decode_utf_16le_lo(self, v) {
  switch (v.$tag) {
    case 2: {
      const _UTF16Uchar = v;
      const _u = _UTF16Uchar._0;
      return moonbitlang$x$encoding$$Decoder$ret(self, moonbitlang$x$encoding$$Decoder$decode_utf_16le, new $64$moonbitlang$47$x$47$encoding$46$Decode$Uchar(_u));
    }
    case 1: {
      const _UTF16Malformed = v;
      const _s = _UTF16Malformed._0;
      return moonbitlang$x$encoding$$Decoder$ret(self, moonbitlang$x$encoding$$Decoder$decode_utf_16le, new $64$moonbitlang$47$x$47$encoding$46$Decode$Malformed(_s));
    }
    default: {
      const _Hi = v;
      const _hi = _Hi._0;
      const rem = self.i.length - self.i_pos | 0;
      if (rem < 2) {
        moonbitlang$x$encoding$$Decoder$t_need(self, 2);
        const _func = moonbitlang$x$encoding$$curry$142$(moonbitlang$x$encoding$$t_decode_utf_16le_lo);
        return moonbitlang$x$encoding$$t_fill(_func(_hi), self);
      } else {
        const j = self.i_pos;
        const dcd = moonbitlang$x$encoding$$r_utf_16_lo(_hi, self.i, j + 1 | 0, j);
        if (dcd.$tag === 3) {
          self.i_pos = self.i_pos + 2 | 0;
        }
        return moonbitlang$x$encoding$$Decoder$ret(self, moonbitlang$x$encoding$$Decoder$decode_utf_16le, dcd);
      }
    }
  }
}
function moonbitlang$x$encoding$$t_decode_utf_16le_lo(hi, decoder) {
  return decoder.t_len < decoder.t_need ? moonbitlang$x$encoding$$Decoder$ret(decoder, moonbitlang$x$encoding$$Decoder$decode_utf_16le, moonbitlang$x$encoding$$malformed_pair(false, hi, decoder.t, 0, decoder.t_len)) : moonbitlang$x$encoding$$Decoder$ret(decoder, moonbitlang$x$encoding$$Decoder$decode_utf_16le, moonbitlang$x$encoding$$r_utf_16_lo(hi, decoder.t, 1, 0));
}
function moonbitlang$x$encoding$$Decoder$t_decode_utf_16le(self) {
  return self.t_len < self.t_need ? moonbitlang$x$encoding$$Decoder$ret(self, moonbitlang$x$encoding$$Decoder$decode_utf_16le, moonbitlang$x$encoding$$malformed(self.t, 0, self.t_len)) : moonbitlang$x$encoding$$Decoder$decode_utf_16le_lo(self, moonbitlang$x$encoding$$r_utf_16(self.t, 1, 0));
}
function moonbitlang$x$encoding$$r_utf_8(bytes, offset, length) {
  let c;
  _L: {
    switch (length) {
      case 1: {
        $bound_check(bytes, offset);
        const _tmp = bytes[offset];
        c = _tmp;
        break _L;
      }
      case 2: {
        $bound_check(bytes, offset);
        const b0 = bytes[offset];
        const _tmp$2 = offset + 1 | 0;
        $bound_check(bytes, _tmp$2);
        const b1 = bytes[_tmp$2];
        if (b1 >> 6 !== 2) {
          return moonbitlang$x$encoding$$malformed(bytes, offset, length);
        } else {
          const _tmp$3 = (b0 & 31) << 6 | b1 & 63;
          c = _tmp$3;
          break _L;
        }
      }
      case 3: {
        $bound_check(bytes, offset);
        const b0$2 = bytes[offset];
        const _tmp$3 = offset + 1 | 0;
        $bound_check(bytes, _tmp$3);
        const b1$2 = bytes[_tmp$3];
        const _tmp$4 = offset + 2 | 0;
        $bound_check(bytes, _tmp$4);
        const b2 = bytes[_tmp$4];
        const c$2 = (b0$2 & 15) << 12 | ((b1$2 & 63) << 6 | b2 & 63);
        if (b2 >> 6 !== 2) {
          return moonbitlang$x$encoding$$malformed(bytes, offset, length);
        } else {
          switch (b0$2) {
            case 224: {
              if (b1$2 < 160 || 191 < b1$2) {
                return moonbitlang$x$encoding$$malformed(bytes, offset, length);
              } else {
                c = c$2;
                break _L;
              }
            }
            case 237: {
              if (b1$2 < 128 || 159 < b1$2) {
                return moonbitlang$x$encoding$$malformed(bytes, offset, length);
              } else {
                c = c$2;
                break _L;
              }
            }
            default: {
              if (b1$2 >> 6 !== 2) {
                return moonbitlang$x$encoding$$malformed(bytes, offset, length);
              } else {
                c = c$2;
                break _L;
              }
            }
          }
        }
      }
      case 4: {
        $bound_check(bytes, offset);
        const b0$3 = bytes[offset];
        const _tmp$5 = offset + 1 | 0;
        $bound_check(bytes, _tmp$5);
        const b1$3 = bytes[_tmp$5];
        const _tmp$6 = offset + 2 | 0;
        $bound_check(bytes, _tmp$6);
        const b2$2 = bytes[_tmp$6];
        const _tmp$7 = offset + 3 | 0;
        $bound_check(bytes, _tmp$7);
        const b3 = bytes[_tmp$7];
        const c$3 = (b0$3 & 7) << 18 | (b1$3 & 63) << 12 | (b2$2 & 63) << 6 | b3 & 63;
        if (b3 >> 6 !== 2 || b2$2 >> 6 !== 2) {
          return moonbitlang$x$encoding$$malformed(bytes, offset, length);
        } else {
          switch (b0$3) {
            case 240: {
              if (b1$3 < 144 || 191 < b1$3) {
                return moonbitlang$x$encoding$$malformed(bytes, offset, length);
              } else {
                c = c$3;
                break _L;
              }
            }
            case 244: {
              if (b1$3 < 128 || 143 < b1$3) {
                return moonbitlang$x$encoding$$malformed(bytes, offset, length);
              } else {
                c = c$3;
                break _L;
              }
            }
            default: {
              if (b1$3 >> 6 !== 2) {
                return moonbitlang$x$encoding$$malformed(bytes, offset, length);
              } else {
                c = c$3;
                break _L;
              }
            }
          }
        }
      }
      default: {
        return $panic();
      }
    }
  }
  return new $64$moonbitlang$47$x$47$encoding$46$Decode$Uchar(c);
}
function moonbitlang$x$encoding$$Decoder$decode_utf_8(self) {
  const rem = self.i.length - self.i_pos | 0;
  if (rem <= 0) {
    return $64$moonbitlang$47$x$47$encoding$46$Decode$End;
  } else {
    const _tmp = self.i;
    const _tmp$2 = self.i_pos;
    $bound_check(_tmp, _tmp$2);
    const idx = _tmp[_tmp$2];
    const need = moonbitlang$core$array$$Array$op_get$4$(moonbitlang$x$encoding$$utf_8_len, idx);
    if (rem < need) {
      moonbitlang$x$encoding$$Decoder$t_need(self, need);
      return moonbitlang$x$encoding$$t_fill(moonbitlang$x$encoding$$Decoder$t_decode_utf_8, self);
    } else {
      const j = self.i_pos;
      if (need === 0) {
        self.i_pos = self.i_pos + 1 | 0;
        return moonbitlang$x$encoding$$Decoder$ret(self, moonbitlang$x$encoding$$Decoder$decode_utf_8, moonbitlang$x$encoding$$malformed(self.i, j, 1));
      } else {
        self.i_pos = self.i_pos + need | 0;
        return moonbitlang$x$encoding$$Decoder$ret(self, moonbitlang$x$encoding$$Decoder$decode_utf_8, moonbitlang$x$encoding$$r_utf_8(self.i, j, need));
      }
    }
  }
}
function moonbitlang$x$encoding$$Decoder$t_decode_utf_8(self) {
  return self.t_len < self.t_need ? moonbitlang$x$encoding$$Decoder$ret(self, moonbitlang$x$encoding$$Decoder$decode_utf_8, moonbitlang$x$encoding$$malformed(self.t, 0, self.t_len)) : moonbitlang$x$encoding$$Decoder$ret(self, moonbitlang$x$encoding$$Decoder$decode_utf_8, moonbitlang$x$encoding$$r_utf_8(self.t, 0, self.t_len));
}
function moonbitlang$x$encoding$$decoder(encoding) {
  const i = moonbitlang$core$builtin$$Default$default$137$();
  const t = $makebytes(4, 0);
  let k;
  switch (encoding) {
    case 0: {
      k = moonbitlang$x$encoding$$Decoder$decode_utf_8;
      break;
    }
    case 1: {
      k = moonbitlang$x$encoding$$Decoder$decode_utf_16le;
      break;
    }
    case 2: {
      k = moonbitlang$x$encoding$$Decoder$decode_utf_16le;
      break;
    }
    default: {
      k = moonbitlang$x$encoding$$Decoder$decode_utf_16be;
    }
  }
  return { i: i, i_pos: 0, t: t, t_len: 0, t_need: 0, k: k };
}
function moonbitlang$x$encoding$$Decoder$decode_(self) {
  const _func = self.k;
  return _func(self);
}
function moonbitlang$x$encoding$$Decoder$i_cont(self, input) {
  const _p = self.i.length - self.i_pos | 0;
  const _p$2 = 0;
  const i_rem = _p > _p$2 ? _p : _p$2;
  const new_len = i_rem + input.len | 0;
  const new_i = $makebytes(new_len, 0);
  if (i_rem > 0) {
    moonbitlang$core$array$$FixedArray$blit_to$46$inner$24$(self.i, new_i, i_rem, self.i_pos, 0);
  }
  moonbitlang$core$array$$FixedArray$blit_from_bytesview(new_i, i_rem, input);
  self.i = new_i;
  self.i_pos = 0;
}
function moonbitlang$x$encoding$$Decoder$decode_lossy$46$inner(self, input, stream) {
  if (input.len > 0) {
    moonbitlang$x$encoding$$Decoder$i_cont(self, input);
  }
  if ((self.i.length - self.i_pos | 0) === 0) {
    return "";
  }
  const chars = [];
  let _tmp = moonbitlang$x$encoding$$Decoder$decode_(self);
  _L: while (true) {
    const _param = _tmp;
    switch (_param.$tag) {
      case 3: {
        const _Uchar = _param;
        const _u = _Uchar._0;
        moonbitlang$core$array$$Array$push$51$(chars, _u);
        _tmp = moonbitlang$x$encoding$$Decoder$decode_(self);
        continue _L;
      }
      case 2: {
        if (stream && self.t_need > 0) {
          return moonbitlang$core$string$$String$from_array(chars);
        } else {
          moonbitlang$core$array$$Array$push$51$(chars, 65533);
          _tmp = moonbitlang$x$encoding$$Decoder$decode_(self);
          continue _L;
        }
      }
      case 0: {
        return moonbitlang$core$string$$String$from_array(chars);
      }
      default: {
        if (stream) {
          return moonbitlang$core$string$$String$from_array(chars);
        } else {
          _tmp = moonbitlang$x$encoding$$Decoder$decode_(self);
          continue _L;
        }
      }
    }
  }
}
function moonbitlang$ulex$lib$regex$$utf8_bytes_to_char(bytes) {
  const decoder = moonbitlang$x$encoding$$decoder(0);
  const str = moonbitlang$x$encoding$$Decoder$decode_lossy$46$inner(decoder, moonbitlang$core$bytes$$Bytes$op_as_view$46$inner(bytes, 0, bytes.length), false);
  return moonbitlang$core$string$$String$char_length_eq$46$inner(str, 1, 0, str.length) ? moonbitlang$core$string$$String$unsafe_char_at(str, moonbitlang$core$string$$String$offset_of_nth_char$46$inner(str, 0, 0, str.length)) : $panic();
}
function moonbitlang$ulex$lib$regex$$lower_unicode_charclass_to_utf8$46$get_masked_range_cset$124$89(bytes, num_bytes, mask_index) {
  if (mask_index >= 1 && mask_index <= bytes.length) {
    const prefix = moonbitlang$core$bytes$$Bytes$op_as_view$46$inner(bytes, 0, mask_index);
    const masked_min_suffix = moonbitlang$core$bytes$$Bytes$make(num_bytes - mask_index | 0, 128);
    const masked_max_suffix = moonbitlang$core$bytes$$Bytes$make(num_bytes - mask_index | 0, 191);
    const _self = moonbitlang$core$buffer$$new$46$inner(0);
    moonbitlang$core$buffer$$Buffer$write_iter(_self, moonbitlang$core$bytes$$View$iter(prefix));
    moonbitlang$core$buffer$$Buffer$write_iter(_self, moonbitlang$core$bytes$$Bytes$iter(masked_min_suffix));
    const masked_min_bytes = moonbitlang$core$buffer$$Buffer$contents(_self);
    const _self$2 = moonbitlang$core$buffer$$new$46$inner(0);
    moonbitlang$core$buffer$$Buffer$write_iter(_self$2, moonbitlang$core$bytes$$View$iter(prefix));
    moonbitlang$core$buffer$$Buffer$write_iter(_self$2, moonbitlang$core$bytes$$Bytes$iter(masked_max_suffix));
    const masked_max_bytes = moonbitlang$core$buffer$$Buffer$contents(_self$2);
    const masked_min = moonbitlang$ulex$lib$regex$$utf8_bytes_to_char(masked_min_bytes);
    const masked_max = moonbitlang$ulex$lib$regex$$utf8_bytes_to_char(masked_max_bytes);
    return moonbitlang$ulex$lib$util$char_set$$range(masked_min, masked_max);
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$regex$$lower_unicode_charclass_to_utf8$46$add_branch$124$110(_env, range_cset, pin_index) {
  const _num_bytes = _env._2;
  const dedup = _env._1;
  const branches = _env._0;
  if (moonbitlang$core$set$$Set$add_and_check$36$(dedup, { _0: range_cset, _1: pin_index })) {
    const ranges = moonbitlang$core$builtin$$Iter$to_array$131$(moonbitlang$ulex$lib$util$char_set$$CharSet$iter_ranges(range_cset));
    if (ranges.length <= 1) {
      if (ranges.length === 1) {
        const _range = ranges[0];
        const _bind = _range._0;
        const _bind$2 = _range._1;
        const min_bytes = moonbitlang$x$encoding$$encode(0, moonbitlang$core$string$$String$make(1, _bind));
        const max_bytes = moonbitlang$x$encoding$$encode(0, moonbitlang$core$string$$String$make(1, _bind$2));
        if (pin_index >= _num_bytes) {
          if ($bytes_equal(min_bytes, max_bytes)) {
            const _self = [];
            const _bind$3 = moonbitlang$core$bytes$$Bytes$iter(min_bytes);
            moonbitlang$core$array$$Array$push_iter$27$(_self, (_p) => _bind$3((_p$2) => _p(moonbitlang$ulex$lib$util$char_set$$singleton(_p$2))));
            moonbitlang$core$array$$Array$push$89$(branches, _self);
            return;
          } else {
            $panic();
            return;
          }
        } else {
          const common_prefix = moonbitlang$core$bytes$$Bytes$op_as_view$46$inner(min_bytes, 0, pin_index);
          const common_prefix2 = moonbitlang$core$bytes$$Bytes$op_as_view$46$inner(max_bytes, 0, pin_index);
          if (moonbitlang$core$builtin$$Eq$equal$23$(common_prefix, common_prefix2)) {
            const _self = [];
            const _bind$3 = moonbitlang$core$bytes$$View$iter(common_prefix);
            moonbitlang$core$array$$Array$push_iter$27$(_self, moonbitlang$core$array$$Array$iter$27$(moonbitlang$core$builtin$$Iter$to_array$27$((_p) => _bind$3((_p$2) => _p(moonbitlang$ulex$lib$util$char_set$$singleton(_p$2))))));
            $bound_check(min_bytes, pin_index);
            const _tmp = min_bytes[pin_index];
            $bound_check(max_bytes, pin_index);
            moonbitlang$core$array$$Array$push$27$(_self, moonbitlang$ulex$lib$util$char_set$$range(_tmp, max_bytes[pin_index]));
            moonbitlang$core$array$$Array$push_iter$27$(_self, moonbitlang$core$array$$Array$iter$27$(moonbitlang$core$array$$Array$repeat$27$([moonbitlang$ulex$lib$util$char_set$$range(128, 191)], (_num_bytes - pin_index | 0) - 1 | 0)));
            moonbitlang$core$array$$Array$push$89$(branches, _self);
            return;
          } else {
            $panic();
            return;
          }
        }
      } else {
        return;
      }
    } else {
      $panic();
      return;
    }
  } else {
    return;
  }
}
function moonbitlang$ulex$lib$regex$$lower_unicode_charclass_to_utf8$46$process_endpoint$124$129(_env, bytes) {
  const _num_bytes = _env._2;
  const _env$2 = _env._1;
  const range_cset = _env._0;
  let _tmp = _num_bytes;
  while (true) {
    const i = _tmp;
    if (i >= 1) {
      const sub_range_cset = moonbitlang$core$builtin$$Sub$sub$27$(moonbitlang$core$builtin$$BitAnd$land$27$(moonbitlang$ulex$lib$regex$$lower_unicode_charclass_to_utf8$46$get_masked_range_cset$124$89(bytes, _num_bytes, i), range_cset), i === _num_bytes ? moonbitlang$ulex$lib$util$char_set$$empty : moonbitlang$ulex$lib$regex$$lower_unicode_charclass_to_utf8$46$get_masked_range_cset$124$89(bytes, _num_bytes, i + 1 | 0));
      moonbitlang$ulex$lib$regex$$lower_unicode_charclass_to_utf8$46$add_branch$124$110(_env$2, sub_range_cset, i);
      _tmp = i - 1 | 0;
      continue;
    } else {
      return;
    }
  }
}
function moonbitlang$ulex$lib$regex$$lower_unicode_charclass_to_utf8(cset) {
  const groups = [{ _0: 1, _1: moonbitlang$core$builtin$$BitAnd$land$27$(cset, moonbitlang$ulex$lib$util$char_set$$range(0, 127)) }, { _0: 2, _1: moonbitlang$core$builtin$$BitAnd$land$27$(cset, moonbitlang$ulex$lib$util$char_set$$range(128, 2047)) }, { _0: 3, _1: moonbitlang$core$builtin$$BitAnd$land$27$(cset, moonbitlang$ulex$lib$util$char_set$$range(2048, 65535)) }, { _0: 4, _1: moonbitlang$core$builtin$$BitAnd$land$27$(cset, moonbitlang$ulex$lib$util$char_set$$range(65536, 1114111)) }];
  const result = [];
  const _len = groups.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const group = groups[_i];
      const _num_bytes = group._0;
      const _cset = group._1;
      if (_num_bytes === 1) {
        if (!moonbitlang$ulex$lib$util$char_set$$CharSet$is_empty(_cset)) {
          moonbitlang$core$array$$Array$push$89$(result, [_cset]);
        }
      } else {
        const branches = [];
        const dedup = moonbitlang$core$set$$Set$new$46$inner$36$(8);
        const _env = { _0: branches, _1: dedup, _2: _num_bytes };
        const _bind = moonbitlang$ulex$lib$util$char_set$$CharSet$iter_ranges(_cset);
        _bind((range) => {
          const _bind$2 = range._0;
          const _bind$3 = range._1;
          const range_cset = moonbitlang$ulex$lib$util$char_set$$range(_bind$2, _bind$3);
          const min_bytes = moonbitlang$x$encoding$$encode(0, moonbitlang$core$string$$String$make(1, _bind$2));
          const max_bytes = moonbitlang$x$encoding$$encode(0, moonbitlang$core$string$$String$make(1, _bind$3));
          const _env$2 = { _0: range_cset, _1: _env, _2: _num_bytes };
          moonbitlang$ulex$lib$regex$$lower_unicode_charclass_to_utf8$46$process_endpoint$124$129(_env$2, min_bytes);
          const mid_range_csets = moonbitlang$core$builtin$$Sub$sub$27$(moonbitlang$core$builtin$$Sub$sub$27$(range_cset, moonbitlang$ulex$lib$regex$$lower_unicode_charclass_to_utf8$46$get_masked_range_cset$124$89(min_bytes, _num_bytes, 1)), moonbitlang$ulex$lib$regex$$lower_unicode_charclass_to_utf8$46$get_masked_range_cset$124$89(max_bytes, _num_bytes, 1));
          const _bind$4 = moonbitlang$ulex$lib$util$char_set$$CharSet$iter_ranges(mid_range_csets);
          _bind$4((mid_range) => {
            const _bind$5 = mid_range._0;
            const _bind$6 = mid_range._1;
            const mid_range_cset = moonbitlang$ulex$lib$util$char_set$$range(_bind$5, _bind$6);
            moonbitlang$ulex$lib$regex$$lower_unicode_charclass_to_utf8$46$add_branch$124$110(_env, mid_range_cset, 0);
            return 1;
          });
          moonbitlang$ulex$lib$regex$$lower_unicode_charclass_to_utf8$46$process_endpoint$124$129(_env$2, max_bytes);
          return 1;
        });
        const _len$2 = branches.length;
        let _tmp$2 = 0;
        while (true) {
          const _i$2 = _tmp$2;
          if (_i$2 < _len$2) {
            const branch = branches[_i$2];
            moonbitlang$core$array$$Array$push$89$(result, branch);
            _tmp$2 = _i$2 + 1 | 0;
            continue;
          } else {
            break;
          }
        }
      }
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return result;
}
function moonbitlang$ulex$lib$regex$$alt(re1, re2) {
  let _tmp = re1;
  let _tmp$2 = re2;
  _L: while (true) {
    const re1$2 = _tmp;
    const re2$2 = _tmp$2;
    const _bind = re1$2.class_;
    let class_;
    if (_bind === 0) {
      const _bind$2 = re2$2.class_;
      if (_bind$2 === 0) {
        class_ = 0;
      } else {
        class_ = 1;
      }
    } else {
      class_ = 1;
    }
    _L$2: {
      const _x = re1$2.desc;
      switch (_x.$tag) {
        case 4: {
          const _Alter = _x;
          const _re1 = _Alter._0;
          const _re2 = _Alter._1;
          _tmp = _re1;
          _tmp$2 = moonbitlang$ulex$lib$regex$$alt(_re2, re2$2);
          continue _L;
        }
        case 1: {
          const _Character = _x;
          const _cset1 = _Character._0;
          const _x$2 = re2$2.desc;
          if (_x$2.$tag === 1) {
            const _Character$2 = _x$2;
            const _cset2 = _Character$2._0;
            return { desc: new $64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Character(moonbitlang$core$builtin$$Add$add$27$(_cset1, _cset2)), class_: class_, len: 1 };
          } else {
            break _L$2;
          }
        }
        default: {
          break _L$2;
        }
      }
    }
    const _tmp$3 = new $64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Alter(re1$2, re2$2);
    let _tmp$4;
    _L$3: {
      _L$4: {
        const _bind$2 = re1$2.len;
        if (_bind$2 === undefined) {
          break _L$4;
        } else {
          const _Some = _bind$2;
          const _len1 = _Some;
          const _bind$3 = re2$2.len;
          if (_bind$3 === undefined) {
            break _L$4;
          } else {
            const _Some$2 = _bind$3;
            const _len2 = _Some$2;
            if (_len1 === _len2) {
              _tmp$4 = _len1;
            } else {
              break _L$4;
            }
          }
        }
        break _L$3;
      }
      _tmp$4 = undefined;
    }
    return { desc: _tmp$3, class_: class_, len: _tmp$4 };
  }
}
function moonbitlang$ulex$lib$regex$$seq(re1, re2) {
  let _tmp = re1;
  let _tmp$2 = re2;
  _L: while (true) {
    const re1$2 = _tmp;
    const re2$2 = _tmp$2;
    let re;
    _L$2: {
      const _x = re1$2.desc;
      switch (_x.$tag) {
        case 5: {
          const _Concat = _x;
          const _re1 = _Concat._0;
          const _re2 = _Concat._1;
          _tmp = _re1;
          _tmp$2 = moonbitlang$ulex$lib$regex$$seq(_re2, re2$2);
          continue _L;
        }
        case 3: {
          re = re2$2;
          break _L$2;
        }
        default: {
          const _x$2 = re2$2.desc;
          if (_x$2.$tag === 3) {
            re = re1$2;
            break _L$2;
          } else {
            const _tmp$3 = new $64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Concat(re1$2, re2$2);
            let _tmp$4;
            _L$3: {
              _L$4: {
                const _bind = re1$2.len;
                if (_bind === undefined) {
                  break _L$4;
                } else {
                  const _Some = _bind;
                  const _len1 = _Some;
                  const _bind$2 = re2$2.len;
                  if (_bind$2 === undefined) {
                    break _L$4;
                  } else {
                    const _Some$2 = _bind$2;
                    const _len2 = _Some$2;
                    _tmp$4 = _len1 + _len2 | 0;
                  }
                }
                break _L$3;
              }
              _tmp$4 = undefined;
            }
            return { desc: _tmp$3, class_: 1, len: _tmp$4 };
          }
        }
      }
    }
    return { desc: re.desc, class_: 1, len: re.len };
  }
}
function moonbitlang$ulex$lib$regex$$char_class(cset, as_bytes) {
  if (as_bytes === undefined) {
    return { desc: new $64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Character(cset), class_: 0, len: 1 };
  } else {
    const _Some = as_bytes;
    const _encoding = _Some;
    return moonbitlang$ulex$lib$regex$$lower_unicode_charclass(cset, _encoding);
  }
}
function moonbitlang$ulex$lib$regex$$lower_unicode_charclass$46$regex_of_branch$124$4(branch) {
  if (branch.length >= 1) {
    let regex = moonbitlang$ulex$lib$regex$$char_class(moonbitlang$core$array$$Array$op_get$27$(branch, 0), undefined);
    const _arr = moonbitlang$core$array$$Array$op_as_view$46$inner$27$(branch, 1, undefined);
    const _len = _arr.len;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const cset = _arr.buf[_arr.start + _i | 0];
        regex = moonbitlang$ulex$lib$regex$$seq(regex, moonbitlang$ulex$lib$regex$$char_class(cset, undefined));
        _tmp = _i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    return regex;
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$regex$$lower_unicode_charclass(cset, encoding) {
  let branches;
  _L: {
    _L$2: {
      switch (encoding) {
        case 2: {
          branches = moonbitlang$ulex$lib$regex$$lower_unicode_charclass_to_utf8(cset);
          break;
        }
        case 0: {
          break _L$2;
        }
        case 1: {
          break _L$2;
        }
        default: {
          break _L$2;
        }
      }
      break _L;
    }
    branches = $panic();
  }
  if (branches.length >= 1) {
    let regex = moonbitlang$ulex$lib$regex$$lower_unicode_charclass$46$regex_of_branch$124$4(moonbitlang$core$array$$Array$op_get$89$(branches, 0));
    const _arr = moonbitlang$core$array$$Array$op_as_view$46$inner$89$(branches, 1, undefined);
    const _len = _arr.len;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const branch = _arr.buf[_arr.start + _i | 0];
        regex = moonbitlang$ulex$lib$regex$$alt(regex, moonbitlang$ulex$lib$regex$$lower_unicode_charclass$46$regex_of_branch$124$4(branch));
        _tmp = _i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    return regex;
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$regex$$opt(re) {
  return moonbitlang$ulex$lib$regex$$alt(re, moonbitlang$ulex$lib$regex$$epsilon);
}
function moonbitlang$ulex$lib$regex$$plus(re) {
  const _tmp = new $64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Repetition(re);
  let _tmp$2;
  _L: {
    _L$2: {
      const _bind = re.len;
      if (_bind === undefined) {
        break _L$2;
      } else {
        const _Some = _bind;
        const _x = _Some;
        if (_x === 0) {
          _tmp$2 = 0;
        } else {
          break _L$2;
        }
      }
      break _L;
    }
    _tmp$2 = undefined;
  }
  return { desc: _tmp, class_: 1, len: _tmp$2 };
}
function moonbitlang$ulex$lib$regex$$star(re) {
  return moonbitlang$ulex$lib$regex$$opt(moonbitlang$ulex$lib$regex$$plus(re));
}
function moonbitlang$ulex$lib$regex$$bind(re, name) {
  return { desc: new $64$moonbitlang$47$ulex$47$lib$47$regex$46$RegexDesc$Capture(re, name), class_: re.class_, len: re.len };
}
function moonbitlang$ulex$lib$regex$$get_capture_vars(re) {
  let _tmp = re.desc;
  let _tmp$2 = re.class_;
  let _tmp$3 = re.len;
  _L: while (true) {
    const re_desc = _tmp;
    _L$2: {
      let re1;
      let re2;
      _L$3: {
        switch (re_desc.$tag) {
          case 6: {
            const _Capture = re_desc;
            const _re = _Capture._0;
            const _name = _Capture._1;
            return moonbitlang$core$immut$sorted_map$$SortedMap$add$60$(moonbitlang$ulex$lib$regex$$get_capture_vars(_re), _name, _re.class_);
          }
          case 2: {
            const _Repetition = re_desc;
            const _re$2 = _Repetition._0;
            _tmp = _re$2.desc;
            _tmp$2 = _re$2.class_;
            _tmp$3 = _re$2.len;
            continue _L;
          }
          case 4: {
            const _Alter = re_desc;
            const _re1 = _Alter._0;
            const _re2 = _Alter._1;
            re1 = _re1;
            re2 = _re2;
            break _L$3;
          }
          case 5: {
            const _Concat = re_desc;
            const _re1$2 = _Concat._0;
            const _re2$2 = _Concat._1;
            re1 = _re1$2;
            re2 = _re2$2;
            break _L$3;
          }
          case 0: {
            break _L$2;
          }
          case 1: {
            break _L$2;
          }
          default: {
            break _L$2;
          }
        }
      }
      const _bind = moonbitlang$core$immut$sorted_map$$SortedMap$iter$60$(moonbitlang$ulex$lib$regex$$get_capture_vars(re1));
      const _bind$2 = moonbitlang$core$immut$sorted_map$$SortedMap$iter$60$(moonbitlang$ulex$lib$regex$$get_capture_vars(re2));
      return moonbitlang$core$immut$sorted_map$$from_iter$60$((_p) => _bind(_p) === 1 && _bind$2(_p) === 1 ? 1 : 0);
    }
    return $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$21$;
  }
}
function moonbitlang$ulex$lib$regex$$lower(re, encoding) {
  if (encoding === undefined) {
    return re;
  } else {
    const _bind = re.desc;
    switch (_bind.$tag) {
      case 3: {
        return moonbitlang$ulex$lib$regex$$epsilon;
      }
      case 0: {
        return moonbitlang$ulex$lib$regex$$eof;
      }
      case 1: {
        const _Character = _bind;
        const _cset = _Character._0;
        if (encoding === undefined) {
          return moonbitlang$ulex$lib$regex$$char_class(_cset, undefined);
        } else {
          const _Some = encoding;
          const _encoding = _Some;
          return moonbitlang$ulex$lib$regex$$lower_unicode_charclass(_cset, _encoding);
        }
      }
      case 2: {
        const _Repetition = _bind;
        const _re = _Repetition._0;
        return moonbitlang$ulex$lib$regex$$plus(moonbitlang$ulex$lib$regex$$lower(_re, encoding));
      }
      case 5: {
        const _Concat = _bind;
        const _re1 = _Concat._0;
        const _re2 = _Concat._1;
        return moonbitlang$ulex$lib$regex$$seq(moonbitlang$ulex$lib$regex$$lower(_re1, encoding), moonbitlang$ulex$lib$regex$$lower(_re2, encoding));
      }
      case 4: {
        const _Alter = _bind;
        const _re1$2 = _Alter._0;
        const _re2$2 = _Alter._1;
        return moonbitlang$ulex$lib$regex$$alt(moonbitlang$ulex$lib$regex$$lower(_re1$2, encoding), moonbitlang$ulex$lib$regex$$lower(_re2$2, encoding));
      }
      default: {
        const _Capture = _bind;
        const _re$2 = _Capture._0;
        const _var_ = _Capture._1;
        return moonbitlang$ulex$lib$regex$$bind(moonbitlang$ulex$lib$regex$$lower(_re$2, encoding), _var_);
      }
    }
  }
}
function moonbitlang$ulex$45$runtime$lexbuf$$StringLexbuf$from_string(string) {
  return { data: string, end: string.length, pos: 0 };
}
function moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(self) {
  const pos = self.pos;
  const end = self.end;
  if (self.pos < end) {
    const _tmp = self.data;
    const c = _tmp.charCodeAt(pos);
    if (c >= 55296 && c <= 56319) {
      const pos2 = pos + 1 | 0;
      if (pos2 < end) {
        const _tmp$2 = self.data;
        const c2 = _tmp$2.charCodeAt(pos2);
        if (c2 >= 56320 && c2 <= 57343) {
          self.pos = pos2 + 1 | 0;
          return (((Math.imul(c - 55296 | 0, 1024) | 0) + c2 | 0) - 56320 | 0) + 65536 | 0;
        }
      }
    }
    self.pos = pos + 1 | 0;
    return c;
  }
  return -1;
}
function moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$reset$143$(self, pos) {
  self.pos = pos;
}
function moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_char$143$(self, start, _end) {
  return moonbitlang$core$string$$String$unsafe_char_at(self.data, start);
}
function moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_string$143$(self, start, end) {
  return moonbitlang$core$string$$String$substring$46$inner(self.data, start, end);
}
function moonbitlang$ulex$lib$parser$$Context$define_regex(self, name, regex) {
  return { named_regexes: moonbitlang$core$immut$sorted_map$$SortedMap$add$62$(self.named_regexes, name, regex) };
}
function moonbitlang$ulex$lib$parser$$Token$kind(self) {
  switch (self.$tag) {
    case 0: {
      return 0;
    }
    case 1: {
      return 1;
    }
    case 2: {
      return 2;
    }
    case 3: {
      return 3;
    }
    case 4: {
      return 4;
    }
    case 5: {
      return 5;
    }
    case 6: {
      return 6;
    }
    case 7: {
      return 7;
    }
    case 8: {
      return 8;
    }
    case 9: {
      return 9;
    }
    case 10: {
      return 10;
    }
    case 11: {
      return 11;
    }
    case 12: {
      return 12;
    }
    case 13: {
      return 13;
    }
    case 14: {
      return 14;
    }
    case 15: {
      return 15;
    }
    case 16: {
      return 16;
    }
    case 17: {
      return 17;
    }
    case 18: {
      return 18;
    }
    case 19: {
      return 19;
    }
    case 20: {
      return 20;
    }
    case 21: {
      return 21;
    }
    case 22: {
      return 22;
    }
    case 23: {
      return 23;
    }
    case 24: {
      return 24;
    }
    default: {
      return 25;
    }
  }
}
function moonbitlang$core$builtin$$Show$output$108$(self, logger) {
  let _tmp;
  switch (self) {
    case 0: {
      _tmp = "EOI";
      break;
    }
    case 1: {
      _tmp = "\"eof\"";
      break;
    }
    case 2: {
      _tmp = "\"parse {\"";
      break;
    }
    case 3: {
      _tmp = "\"regex\"";
      break;
    }
    case 4: {
      _tmp = "\"as\"";
      break;
    }
    case 5: {
      _tmp = "\"_\"";
      break;
    }
    case 6: {
      _tmp = "\"}\"";
      break;
    }
    case 7: {
      _tmp = "\"(\"";
      break;
    }
    case 8: {
      _tmp = "\")\"";
      break;
    }
    case 9: {
      _tmp = "\"[\"";
      break;
    }
    case 10: {
      _tmp = "\"]\"";
      break;
    }
    case 11: {
      _tmp = "\"=\"";
      break;
    }
    case 12: {
      _tmp = "\";\"";
      break;
    }
    case 13: {
      _tmp = "\"=>\"";
      break;
    }
    case 14: {
      _tmp = "\"|\"";
      break;
    }
    case 15: {
      _tmp = "\"*\"";
      break;
    }
    case 16: {
      _tmp = "\"+\"";
      break;
    }
    case 17: {
      _tmp = "\"?\"";
      break;
    }
    case 18: {
      _tmp = "\"-\"";
      break;
    }
    case 19: {
      _tmp = "\"^\"";
      break;
    }
    case 20: {
      _tmp = "BACKSLASH";
      break;
    }
    case 21: {
      _tmp = "RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE";
      break;
    }
    case 22: {
      _tmp = "LBRACE_CODE_RBRACE";
      break;
    }
    case 23: {
      _tmp = "LC_IDENT";
      break;
    }
    case 24: {
      _tmp = "CHAR";
      break;
    }
    default: {
      _tmp = "STRING";
    }
  }
  logger.method_0(logger.self, _tmp);
}
(() => {
})();
function moonbitlang$ulex$lib$parser$$yy_action_0(_last_pos, _args) {
  return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex((_ctx) => moonbitlang$ulex$lib$regex$$char_class(moonbitlang$ulex$lib$util$char_set$$any, undefined));
}
function moonbitlang$ulex$lib$parser$$yy_action_1(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 2) {
    const _YYObj__Context______type_Regex = _bind;
    const __dollar1 = _YYObj__Context______type_Regex._0;
    const _bind$2 = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 2)._0;
    if (_bind$2.$tag === 3) {
      const _YYObj_String = _bind$2;
      const __dollar3 = _YYObj_String._0;
      return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex((ctx) => moonbitlang$ulex$lib$regex$$bind(__dollar1(ctx), __dollar3));
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_2(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 2) {
    const _YYObj__Context______type_Regex = _bind;
    const __dollar1 = _YYObj__Context______type_Regex._0;
    const _bind$2 = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 2)._0;
    if (_bind$2.$tag === 2) {
      const _YYObj__Context______type_Regex$2 = _bind$2;
      const __dollar3 = _YYObj__Context______type_Regex$2._0;
      return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex((ctx) => moonbitlang$ulex$lib$regex$$alt(__dollar1(ctx), __dollar3(ctx)));
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_3(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 2) {
    const _YYObj__Context______type_Regex = _bind;
    const __dollar1 = _YYObj__Context______type_Regex._0;
    const _bind$2 = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 2)._0;
    if (_bind$2.$tag === 2) {
      const _YYObj__Context______type_Regex$2 = _bind$2;
      const __dollar3 = _YYObj__Context______type_Regex$2._0;
      return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex((ctx) => {
        _L: {
          const _bind$3 = __dollar1(ctx).desc;
          if (_bind$3.$tag === 1) {
            const _Character = _bind$3;
            const _cset1 = _Character._0;
            const _bind$4 = __dollar3(ctx).desc;
            if (_bind$4.$tag === 1) {
              const _Character$2 = _bind$4;
              const _cset2 = _Character$2._0;
              return moonbitlang$ulex$lib$regex$$char_class(moonbitlang$ulex$lib$util$char_set$$CharSet$difference(_cset1, _cset2), undefined);
            } else {
              break _L;
            }
          } else {
            break _L;
          }
        }
        return $panic();
      });
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_4(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 2) {
    const _YYObj__Context______type_Regex = _bind;
    const __dollar1 = _YYObj__Context______type_Regex._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex(__dollar1);
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_5(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 1)._0;
  if (_bind.$tag === 2) {
    const _YYObj__Context______type_Regex = _bind;
    const __dollar2 = _YYObj__Context______type_Regex._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex(__dollar2);
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_6(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 3) {
    const _YYObj_String = _bind;
    const __dollar1 = _YYObj_String._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex((ctx) => {
      const _p = moonbitlang$core$immut$sorted_map$$SortedMap$get$62$(ctx.named_regexes, __dollar1);
      if (_p === undefined) {
        return $panic();
      } else {
        const _p$2 = _p;
        return _p$2;
      }
    });
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_7(_last_pos, _args) {
  return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex((_ctx) => moonbitlang$ulex$lib$regex$$eof);
}
function moonbitlang$ulex$lib$parser$$yy_action_8(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 2)._0;
  if (_bind.$tag === 4) {
    const _YYObj__char_set_T = _bind;
    const __dollar3 = _YYObj__char_set_T._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__char_set_T$46$YYObj__char_set_T(moonbitlang$ulex$lib$util$char_set$$CharSet$negated(__dollar3));
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_9(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 2) {
    const _YYObj__Context______type_Regex = _bind;
    const __dollar1 = _YYObj__Context______type_Regex._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex(__dollar1);
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_10(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 2) {
    const _YYObj__Context______type_Regex = _bind;
    const __dollar1 = _YYObj__Context______type_Regex._0;
    const _bind$2 = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 2)._0;
    if (_bind$2.$tag === 3) {
      const _YYObj_String = _bind$2;
      const __dollar3 = _YYObj_String._0;
      return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context_______type_Regex__String____type_CodeBlock_$46$YYObj__Context_______type_Regex__String____type_CodeBlock_((ctx) => ({ _0: __dollar1(ctx), _1: undefined, _2: __dollar3 }));
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_11(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 3) {
    const _YYObj_String = _bind;
    const __dollar1 = _YYObj_String._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex((_ctx) => {
      const _bind$2 = moonbitlang$core$string$$String$iter(__dollar1);
      const _acc = { val: moonbitlang$ulex$lib$regex$$epsilon };
      _bind$2((_p) => {
        const acc = _acc.val;
        _acc.val = moonbitlang$ulex$lib$regex$$seq(acc, moonbitlang$ulex$lib$regex$$char_class(moonbitlang$ulex$lib$util$char_set$$singleton(_p), undefined));
        return 1;
      });
      return _acc.val;
    });
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_12(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 6) {
    const _YYObj_Char = _bind;
    const __dollar1 = _YYObj_Char._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__char_set_T$46$YYObj__char_set_T(moonbitlang$ulex$lib$util$char_set$$singleton(__dollar1));
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_13(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 2) {
    const _YYObj__Context______type_Regex = _bind;
    const __dollar1 = _YYObj__Context______type_Regex._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex(__dollar1);
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_14(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 2) {
    const _YYObj__Context______type_Regex = _bind;
    const __dollar1 = _YYObj__Context______type_Regex._0;
    const _bind$2 = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 1)._0;
    if (_bind$2.$tag === 2) {
      const _YYObj__Context______type_Regex$2 = _bind$2;
      const __dollar2 = _YYObj__Context______type_Regex$2._0;
      return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex((ctx) => moonbitlang$ulex$lib$regex$$seq(__dollar1(ctx), __dollar2(ctx)));
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_16(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 5) {
    const _YYObj__Context_______type_Regex__String____type_CodeBlock_ = _bind;
    const __dollar1 = _YYObj__Context_______type_Regex__String____type_CodeBlock_._0;
    const _bind$2 = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 1)._0;
    if (_bind$2.$tag === 7) {
      const _YYObj__Context______list_List___type_Regex__String____type_CodeBlock__ = _bind$2;
      const __dollar2 = _YYObj__Context______list_List___type_Regex__String____type_CodeBlock__._0;
      return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______list_List___type_Regex__String____type_CodeBlock__$46$YYObj__Context______list_List___type_Regex__String____type_CodeBlock__((ctx) => {
        const _p = __dollar1(ctx);
        const _p$2 = __dollar2(ctx);
        return new $64$moonbitlang$47$core$47$list$46$List$More$28$(_p, _p$2);
      });
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_17(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 2) {
    const _YYObj__Context______type_Regex = _bind;
    const __dollar1 = _YYObj__Context______type_Regex._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex(__dollar1);
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_18(_last_pos, _args) {
  return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______list_List___type_Regex__String____type_CodeBlock__$46$YYObj__Context______list_List___type_Regex__String____type_CodeBlock__((_ctx) => $64$moonbitlang$47$core$47$list$46$List$Empty$28$);
}
function moonbitlang$ulex$lib$parser$$yy_action_19(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 8) {
    const _YYObj__Context______type_Rule = _bind;
    const __dollar1 = _YYObj__Context______type_Rule._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______list_List__type_Rule_$46$YYObj__Context______list_List__type_Rule_((ctx) => {
      const _p = __dollar1(ctx);
      const _p$2 = $64$moonbitlang$47$core$47$list$46$List$Empty$27$;
      return new $64$moonbitlang$47$core$47$list$46$List$More$27$(_p, _p$2);
    });
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_20(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 1)._0;
  if (_bind.$tag === 10) {
    const _YYObj__Context_____Context = _bind;
    const __dollar2 = _YYObj__Context_____Context._0;
    const _bind$2 = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
    if (_bind$2.$tag === 3) {
      const _YYObj_String = _bind$2;
      const __dollar1 = _YYObj_String._0;
      const _bind$3 = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 2)._0;
      if (_bind$3.$tag === 9) {
        const _YYObj__Context______list_List__type_Rule_ = _bind$3;
        const __dollar3 = _YYObj__Context______list_List__type_Rule_._0;
        const _bind$4 = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 3)._0;
        if (_bind$4.$tag === 3) {
          const _YYObj_String$2 = _bind$4;
          const __dollar4 = _YYObj_String$2._0;
          return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Lex$46$YYObj__Context______type_Lex((ctx) => {
            const ctx$2 = __dollar2(ctx);
            return { header: __dollar1, rules: moonbitlang$core$list$$List$to_array$129$(__dollar3(ctx$2)), trailer: __dollar4 };
          });
        } else {
          return $panic();
        }
      } else {
        return $panic();
      }
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_21(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 2) {
    const _YYObj__Context______type_Regex = _bind;
    const __dollar1 = _YYObj__Context______type_Regex._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex((ctx) => moonbitlang$ulex$lib$regex$$opt(__dollar1(ctx)));
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_22(_last_pos, _args) {
  return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context_____Context$46$YYObj__Context_____Context((ctx) => ctx);
}
function moonbitlang$ulex$lib$parser$$yy_action_23(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 1)._0;
  if (_bind.$tag === 10) {
    const _YYObj__Context_____Context = _bind;
    const __dollar2 = _YYObj__Context_____Context._0;
    const _bind$2 = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
    if (_bind$2.$tag === 10) {
      const _YYObj__Context_____Context$2 = _bind$2;
      const __dollar1 = _YYObj__Context_____Context$2._0;
      return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context_____Context$46$YYObj__Context_____Context((ctx) => __dollar2(__dollar1(ctx)));
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_24(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 1)._0;
  if (_bind.$tag === 4) {
    const _YYObj__char_set_T = _bind;
    const __dollar2 = _YYObj__char_set_T._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__char_set_T$46$YYObj__char_set_T(__dollar2);
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_25(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 4) {
    const _YYObj__char_set_T = _bind;
    const __dollar1 = _YYObj__char_set_T._0;
    const _bind$2 = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 1)._0;
    if (_bind$2.$tag === 4) {
      const _YYObj__char_set_T$2 = _bind$2;
      const __dollar2 = _YYObj__char_set_T$2._0;
      return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__char_set_T$46$YYObj__char_set_T(moonbitlang$core$builtin$$Add$add$27$(__dollar1, __dollar2));
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_26(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 2) {
    const _YYObj__Context______type_Regex = _bind;
    const __dollar1 = _YYObj__Context______type_Regex._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex(__dollar1);
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_27(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 2) {
    const _YYObj__Context______type_Regex = _bind;
    const __dollar1 = _YYObj__Context______type_Regex._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex(__dollar1);
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_28(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 2)._0;
  if (_bind.$tag === 7) {
    const _YYObj__Context______list_List___type_Regex__String____type_CodeBlock__ = _bind;
    const __dollar3 = _YYObj__Context______list_List___type_Regex__String____type_CodeBlock__._0;
    const _bind$2 = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
    if (_bind$2.$tag === 12) {
      const _YYObj__String__String_ = _bind$2;
      const __dollar1 = _YYObj__String__String_._0;
      return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Rule$46$YYObj__Context______type_Rule((ctx) => {
        const pattern_and_actions = moonbitlang$core$list$$List$to_array$132$(__dollar3(ctx));
        const _p = new Array(pattern_and_actions.length);
        const _p$2 = pattern_and_actions.length;
        let _tmp = 0;
        while (true) {
          const _p$3 = _tmp;
          if (_p$3 < _p$2) {
            const _p$4 = pattern_and_actions[_p$3];
            const _p$5 = _p$4._0;
            const _p$6 = _p$4._1;
            _p[_p$3] = { _0: _p$5, _1: _p$6 };
            _tmp = _p$3 + 1 | 0;
            continue;
          } else {
            break;
          }
        }
        const patterns = _p;
        const _p$3 = new Array(pattern_and_actions.length);
        const _p$4 = pattern_and_actions.length;
        let _tmp$2 = 0;
        while (true) {
          const _p$5 = _tmp$2;
          if (_p$5 < _p$4) {
            const _p$6 = pattern_and_actions[_p$5];
            _p$3[_p$5] = _p$6._2;
            _tmp$2 = _p$5 + 1 | 0;
            continue;
          } else {
            break;
          }
        }
        const actions = _p$3;
        return { name: __dollar1._0, signature: __dollar1._1, lexee: "lexbuf", patterns: patterns, actions: actions };
      });
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_29(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 3) {
    const _YYObj_String = _bind;
    const __dollar1 = _YYObj_String._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_String$46$YYObj_String(__dollar1);
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_30(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 8) {
    const _YYObj__Context______type_Rule = _bind;
    const __dollar1 = _YYObj__Context______type_Rule._0;
    const _bind$2 = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 1)._0;
    if (_bind$2.$tag === 9) {
      const _YYObj__Context______list_List__type_Rule_ = _bind$2;
      const __dollar2 = _YYObj__Context______list_List__type_Rule_._0;
      return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______list_List__type_Rule_$46$YYObj__Context______list_List__type_Rule_((ctx) => {
        const _p = __dollar1(ctx);
        const _p$2 = __dollar2(ctx);
        return new $64$moonbitlang$47$core$47$list$46$List$More$27$(_p, _p$2);
      });
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_31(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 3) {
    const _YYObj_String = _bind;
    const __dollar1 = _YYObj_String._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_String$46$YYObj_String(__dollar1);
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_32(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 4) {
    const _YYObj__char_set_T = _bind;
    const __dollar1 = _YYObj__char_set_T._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex((_ctx) => moonbitlang$ulex$lib$regex$$char_class(__dollar1, undefined));
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_33(_last_pos, _args) {
  return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Lex$46$YYObj__Context______type_Lex((_ctx) => ({ header: "", rules: [], trailer: "" }));
}
function moonbitlang$ulex$lib$parser$$yy_action_34(_last_pos, _args) {
  return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_String$46$YYObj_String("");
}
function moonbitlang$ulex$lib$parser$$yy_action_35(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 2) {
    const _YYObj__Context______type_Regex = _bind;
    const __dollar1 = _YYObj__Context______type_Regex._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex((ctx) => moonbitlang$ulex$lib$regex$$star(__dollar1(ctx)));
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_36(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 6) {
    const _YYObj_Char = _bind;
    const __dollar1 = _YYObj_Char._0;
    const _bind$2 = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 2)._0;
    if (_bind$2.$tag === 6) {
      const _YYObj_Char$2 = _bind$2;
      const __dollar3 = _YYObj_Char$2._0;
      return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__char_set_T$46$YYObj__char_set_T(moonbitlang$ulex$lib$util$char_set$$range(__dollar1, __dollar3));
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_37(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 11) {
    const _YYObj__Context______type_Lex = _bind;
    const __dollar1 = _YYObj__Context______type_Lex._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Lex$46$YYObj__Context______type_Lex(__dollar1);
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_38(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 2) {
    const _YYObj__Context______type_Regex = _bind;
    const __dollar1 = _YYObj__Context______type_Regex._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex((ctx) => moonbitlang$ulex$lib$regex$$plus(__dollar1(ctx)));
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_39(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 1)._0;
  if (_bind.$tag === 3) {
    const _YYObj_String = _bind;
    const __dollar2 = _YYObj_String._0;
    const _bind$2 = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 3)._0;
    if (_bind$2.$tag === 2) {
      const _YYObj__Context______type_Regex = _bind$2;
      const __dollar4 = _YYObj__Context______type_Regex._0;
      return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context_____Context$46$YYObj__Context_____Context((ctx) => moonbitlang$ulex$lib$parser$$Context$define_regex(ctx, __dollar2, __dollar4(ctx)));
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_40(_last_pos, _args) {
  return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_String$46$YYObj_String("");
}
function moonbitlang$ulex$lib$parser$$yy_action_41(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 6) {
    const _YYObj_Char = _bind;
    const __dollar1 = _YYObj_Char._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex((_ctx) => moonbitlang$ulex$lib$regex$$char_class(moonbitlang$ulex$lib$util$char_set$$singleton(__dollar1), undefined));
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_42(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 2) {
    const _YYObj__Context______type_Regex = _bind;
    const __dollar1 = _YYObj__Context______type_Regex._0;
    const _bind$2 = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 2)._0;
    if (_bind$2.$tag === 2) {
      const _YYObj__Context______type_Regex$2 = _bind$2;
      const __dollar3 = _YYObj__Context______type_Regex$2._0;
      return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__Context______type_Regex$46$YYObj__Context______type_Regex((ctx) => {
        _L: {
          const _bind$3 = __dollar1(ctx).desc;
          if (_bind$3.$tag === 1) {
            const _Character = _bind$3;
            const _cset1 = _Character._0;
            const _bind$4 = __dollar3(ctx).desc;
            if (_bind$4.$tag === 1) {
              const _Character$2 = _bind$4;
              const _cset2 = _Character$2._0;
              return moonbitlang$ulex$lib$regex$$char_class(moonbitlang$ulex$lib$util$char_set$$CharSet$difference(_cset1, _cset2), undefined);
            } else {
              break _L;
            }
          } else {
            break _L;
          }
        }
        return $panic();
      });
    } else {
      return $panic();
    }
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_action_43(_last_pos, _args) {
  const _bind = moonbitlang$core$array$$ArrayView$op_get$9$(_args, 0)._0;
  if (_bind.$tag === 4) {
    const _YYObj__char_set_T = _bind;
    const __dollar1 = _YYObj__char_set_T._0;
    return new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__char_set_T$46$YYObj__char_set_T(__dollar1);
  } else {
    return $panic();
  }
}
function moonbitlang$ulex$lib$parser$$yy_input(token, _start_pos, _end_pos) {
  switch (token.$tag) {
    case 0: {
      return { _0: 0, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 1: {
      return { _0: 1, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 2: {
      return { _0: 2, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 3: {
      return { _0: 3, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 4: {
      return { _0: 4, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 5: {
      return { _0: 5, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 6: {
      return { _0: 6, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 7: {
      return { _0: 7, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 8: {
      return { _0: 8, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 9: {
      return { _0: 9, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 10: {
      return { _0: 10, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 11: {
      return { _0: 11, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 12: {
      return { _0: 12, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 13: {
      return { _0: 13, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 14: {
      return { _0: 14, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 15: {
      return { _0: 15, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 16: {
      return { _0: 16, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 17: {
      return { _0: 17, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 18: {
      return { _0: 18, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 19: {
      return { _0: 19, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 20: {
      return { _0: 20, _1: Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Void$46$YYObj_Void };
    }
    case 21: {
      const _RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE = token;
      const _data = _RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE._0;
      return { _0: 21, _1: new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj__String__String_$46$YYObj__String__String_(_data) };
    }
    case 22: {
      const _LBRACE_CODE_RBRACE = token;
      const _data$2 = _LBRACE_CODE_RBRACE._0;
      return { _0: 22, _1: new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_String$46$YYObj_String(_data$2) };
    }
    case 23: {
      const _LC_IDENT = token;
      const _data$3 = _LC_IDENT._0;
      return { _0: 23, _1: new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_String$46$YYObj_String(_data$3) };
    }
    case 24: {
      const _CHAR = token;
      const _data$4 = _CHAR._0;
      return { _0: 24, _1: new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_Char$46$YYObj_Char(_data$4) };
    }
    default: {
      const _STRING = token;
      const _data$5 = _STRING._0;
      return { _0: 25, _1: new Error$moonbitlang$47$ulex$47$lib$47$parser$46$YYObj_String$46$YYObj_String(_data$5) };
    }
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_13(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(1, 43, moonbitlang$ulex$lib$parser$$yy_action_7);
}
function moonbitlang$ulex$lib$parser$$yy_state_14(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(1, 43, moonbitlang$ulex$lib$parser$$yy_action_0);
}
function moonbitlang$ulex$lib$parser$$yy_state_15(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(1, 43, moonbitlang$ulex$lib$parser$$yy_action_11);
}
function moonbitlang$ulex$lib$parser$$yy_state_16(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(1, 43, moonbitlang$ulex$lib$parser$$yy_action_41);
}
function moonbitlang$ulex$lib$parser$$yy_state_17(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(1, 43, moonbitlang$ulex$lib$parser$$yy_action_6);
}
function moonbitlang$ulex$lib$parser$$yy_state_18(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(1, 43, moonbitlang$ulex$lib$parser$$yy_action_32);
}
function moonbitlang$ulex$lib$parser$$yy_state_12(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(3, 44, moonbitlang$ulex$lib$parser$$yy_action_24);
}
function moonbitlang$ulex$lib$parser$$yy_state_11(_lookahead) {
  if (_lookahead === 10) {
    return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_12);
  } else {
    return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_5(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(3, 46, moonbitlang$ulex$lib$parser$$yy_action_36);
}
function moonbitlang$ulex$lib$parser$$yy_state_4(_lookahead) {
  if (_lookahead === 24) {
    return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_5);
  } else {
    return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_3(_lookahead) {
  _L: {
    switch (_lookahead) {
      case 18: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_4);
      }
      case 10: {
        break _L;
      }
      case 24: {
        break _L;
      }
      default: {
        return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
      }
    }
  }
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Reduce(1, 46, moonbitlang$ulex$lib$parser$$yy_action_12);
}
function moonbitlang$ulex$lib$parser$$yy_state_7(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(2, 45, moonbitlang$ulex$lib$parser$$yy_action_25);
}
function moonbitlang$ulex$lib$parser$$yy_state_6(_lookahead) {
  switch (_lookahead) {
    case 24: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_3);
    }
    case 46: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_6);
    }
    case 45: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_7);
    }
    case 10: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Reduce(1, 45, moonbitlang$ulex$lib$parser$$yy_action_43);
    }
    default: {
      return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
    }
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_10(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(4, 44, moonbitlang$ulex$lib$parser$$yy_action_8);
}
function moonbitlang$ulex$lib$parser$$yy_state_9(_lookahead) {
  if (_lookahead === 10) {
    return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_10);
  } else {
    return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_8(_lookahead) {
  switch (_lookahead) {
    case 24: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_3);
    }
    case 46: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_6);
    }
    case 45: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_9);
    }
    default: {
      return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
    }
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_2(_lookahead) {
  switch (_lookahead) {
    case 24: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_3);
    }
    case 46: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_6);
    }
    case 19: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_8);
    }
    case 45: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_11);
    }
    default: {
      return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
    }
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_21(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(3, 43, moonbitlang$ulex$lib$parser$$yy_action_5);
}
function moonbitlang$ulex$lib$parser$$yy_state_20(_lookahead) {
  if (_lookahead === 8) {
    return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_21);
  } else {
    return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_23(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(2, 42, moonbitlang$ulex$lib$parser$$yy_action_21);
}
function moonbitlang$ulex$lib$parser$$yy_state_24(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(2, 42, moonbitlang$ulex$lib$parser$$yy_action_38);
}
function moonbitlang$ulex$lib$parser$$yy_state_25(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(2, 42, moonbitlang$ulex$lib$parser$$yy_action_35);
}
function moonbitlang$ulex$lib$parser$$yy_state_27(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(3, 41, moonbitlang$ulex$lib$parser$$yy_action_42);
}
function moonbitlang$ulex$lib$parser$$yy_state_30(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(3, 41, moonbitlang$ulex$lib$parser$$yy_action_3);
}
function moonbitlang$ulex$lib$parser$$yy_state_32(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(2, 40, moonbitlang$ulex$lib$parser$$yy_action_14);
}
function moonbitlang$ulex$lib$parser$$yy_state_35(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(3, 39, moonbitlang$ulex$lib$parser$$yy_action_2);
}
function moonbitlang$ulex$lib$parser$$yy_state_38(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(3, 38, moonbitlang$ulex$lib$parser$$yy_action_1);
}
function moonbitlang$ulex$lib$parser$$yy_state_37(_lookahead) {
  if (_lookahead === 23) {
    return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_38);
  } else {
    return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_36(_lookahead) {
  _L: {
    switch (_lookahead) {
      case 4: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_37);
      }
      case 0: {
        break _L;
      }
      case 8: {
        break _L;
      }
      case 12: {
        break _L;
      }
      case 13: {
        break _L;
      }
      default: {
        return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
      }
    }
  }
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Reduce(1, 38, moonbitlang$ulex$lib$parser$$yy_action_4);
}
function moonbitlang$ulex$lib$parser$$yy_state_19(_lookahead) {
  switch (_lookahead) {
    case 9: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_2);
    }
    case 1: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_13);
    }
    case 5: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_14);
    }
    case 25: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_15);
    }
    case 24: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_16);
    }
    case 23: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_17);
    }
    case 44: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_18);
    }
    case 7: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_19);
    }
    case 38: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_20);
    }
    case 43: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_22);
    }
    case 41: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_28);
    }
    case 42: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_31);
    }
    case 40: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_33);
    }
    case 39: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_36);
    }
    default: {
      return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
    }
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_22(_lookahead) {
  _L: {
    switch (_lookahead) {
      case 17: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_23);
      }
      case 16: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_24);
      }
      case 15: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_25);
      }
      case 20: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_26);
      }
      case 0: {
        break _L;
      }
      case 1: {
        break _L;
      }
      case 4: {
        break _L;
      }
      case 5: {
        break _L;
      }
      case 7: {
        break _L;
      }
      case 8: {
        break _L;
      }
      case 9: {
        break _L;
      }
      case 12: {
        break _L;
      }
      case 13: {
        break _L;
      }
      case 14: {
        break _L;
      }
      case 23: {
        break _L;
      }
      case 24: {
        break _L;
      }
      case 25: {
        break _L;
      }
      default: {
        return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
      }
    }
  }
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Reduce(1, 42, moonbitlang$ulex$lib$parser$$yy_action_27);
}
function moonbitlang$ulex$lib$parser$$yy_state_26(_lookahead) {
  switch (_lookahead) {
    case 9: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_2);
    }
    case 1: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_13);
    }
    case 5: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_14);
    }
    case 25: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_15);
    }
    case 24: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_16);
    }
    case 23: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_17);
    }
    case 44: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_18);
    }
    case 7: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_19);
    }
    case 43: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_27);
    }
    default: {
      return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
    }
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_28(_lookahead) {
  _L: {
    switch (_lookahead) {
      case 20: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_29);
      }
      case 0: {
        break _L;
      }
      case 4: {
        break _L;
      }
      case 8: {
        break _L;
      }
      case 12: {
        break _L;
      }
      case 13: {
        break _L;
      }
      case 14: {
        break _L;
      }
      default: {
        return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
      }
    }
  }
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Reduce(1, 40, moonbitlang$ulex$lib$parser$$yy_action_9);
}
function moonbitlang$ulex$lib$parser$$yy_state_29(_lookahead) {
  switch (_lookahead) {
    case 9: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_2);
    }
    case 1: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_13);
    }
    case 5: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_14);
    }
    case 25: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_15);
    }
    case 24: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_16);
    }
    case 23: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_17);
    }
    case 44: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_18);
    }
    case 7: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_19);
    }
    case 43: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_30);
    }
    default: {
      return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
    }
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_31(_lookahead) {
  _L: {
    switch (_lookahead) {
      case 9: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_2);
      }
      case 1: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_13);
      }
      case 5: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_14);
      }
      case 25: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_15);
      }
      case 24: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_16);
      }
      case 23: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_17);
      }
      case 44: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_18);
      }
      case 7: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_19);
      }
      case 43: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_22);
      }
      case 41: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_28);
      }
      case 42: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_31);
      }
      case 40: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_32);
      }
      case 0: {
        break _L;
      }
      case 4: {
        break _L;
      }
      case 8: {
        break _L;
      }
      case 12: {
        break _L;
      }
      case 13: {
        break _L;
      }
      case 14: {
        break _L;
      }
      default: {
        return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
      }
    }
  }
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Reduce(1, 40, moonbitlang$ulex$lib$parser$$yy_action_26);
}
function moonbitlang$ulex$lib$parser$$yy_state_33(_lookahead) {
  _L: {
    switch (_lookahead) {
      case 14: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_34);
      }
      case 0: {
        break _L;
      }
      case 4: {
        break _L;
      }
      case 8: {
        break _L;
      }
      case 12: {
        break _L;
      }
      case 13: {
        break _L;
      }
      default: {
        return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
      }
    }
  }
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Reduce(1, 39, moonbitlang$ulex$lib$parser$$yy_action_17);
}
function moonbitlang$ulex$lib$parser$$yy_state_34(_lookahead) {
  switch (_lookahead) {
    case 9: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_2);
    }
    case 1: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_13);
    }
    case 5: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_14);
    }
    case 25: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_15);
    }
    case 24: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_16);
    }
    case 23: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_17);
    }
    case 44: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_18);
    }
    case 7: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_19);
    }
    case 43: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_22);
    }
    case 41: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_28);
    }
    case 42: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_31);
    }
    case 40: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_33);
    }
    case 39: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_35);
    }
    default: {
      return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
    }
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_39(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(1, 37, moonbitlang$ulex$lib$parser$$yy_action_13);
}
function moonbitlang$ulex$lib$parser$$yy_state_43(_lookahead) {
  return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Accept;
}
function moonbitlang$ulex$lib$parser$$yy_state_44(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(1, 29, moonbitlang$ulex$lib$parser$$yy_action_29);
}
function moonbitlang$ulex$lib$parser$$yy_state_50(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(5, 32, moonbitlang$ulex$lib$parser$$yy_action_39);
}
function moonbitlang$ulex$lib$parser$$yy_state_49(_lookahead) {
  if (_lookahead === 12) {
    return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_50);
  } else {
    return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_48(_lookahead) {
  switch (_lookahead) {
    case 9: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_2);
    }
    case 1: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_13);
    }
    case 5: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_14);
    }
    case 25: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_15);
    }
    case 24: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_16);
    }
    case 23: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_17);
    }
    case 44: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_18);
    }
    case 7: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_19);
    }
    case 43: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_22);
    }
    case 41: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_28);
    }
    case 42: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_31);
    }
    case 40: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_33);
    }
    case 39: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_36);
    }
    case 38: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_39);
    }
    case 37: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_49);
    }
    default: {
      return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
    }
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_47(_lookahead) {
  if (_lookahead === 11) {
    return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_48);
  } else {
    return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_46(_lookahead) {
  if (_lookahead === 23) {
    return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_47);
  } else {
    return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_52(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(2, 31, moonbitlang$ulex$lib$parser$$yy_action_23);
}
function moonbitlang$ulex$lib$parser$$yy_state_51(_lookahead) {
  switch (_lookahead) {
    case 3: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_46);
    }
    case 32: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_51);
    }
    case 31: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_52);
    }
    case 21: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Reduce(0, 31, moonbitlang$ulex$lib$parser$$yy_action_22);
    }
    default: {
      return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
    }
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_58(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(3, 36, moonbitlang$ulex$lib$parser$$yy_action_10);
}
function moonbitlang$ulex$lib$parser$$yy_state_57(_lookahead) {
  if (_lookahead === 22) {
    return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_58);
  } else {
    return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_56(_lookahead) {
  if (_lookahead === 13) {
    return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_57);
  } else {
    return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_60(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(2, 35, moonbitlang$ulex$lib$parser$$yy_action_16);
}
function moonbitlang$ulex$lib$parser$$yy_state_59(_lookahead) {
  switch (_lookahead) {
    case 9: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_2);
    }
    case 1: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_13);
    }
    case 5: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_14);
    }
    case 25: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_15);
    }
    case 24: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_16);
    }
    case 23: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_17);
    }
    case 44: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_18);
    }
    case 7: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_19);
    }
    case 43: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_22);
    }
    case 41: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_28);
    }
    case 42: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_31);
    }
    case 40: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_33);
    }
    case 39: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_36);
    }
    case 38: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_39);
    }
    case 37: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_56);
    }
    case 36: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_59);
    }
    case 35: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_60);
    }
    case 6: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Reduce(0, 35, moonbitlang$ulex$lib$parser$$yy_action_18);
    }
    default: {
      return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
    }
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_63(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(5, 34, moonbitlang$ulex$lib$parser$$yy_action_28);
}
function moonbitlang$ulex$lib$parser$$yy_state_62(_lookahead) {
  if (_lookahead === 6) {
    return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_63);
  } else {
    return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_61(_lookahead) {
  if (_lookahead === 6) {
    return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_62);
  } else {
    return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_55(_lookahead) {
  switch (_lookahead) {
    case 9: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_2);
    }
    case 1: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_13);
    }
    case 5: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_14);
    }
    case 25: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_15);
    }
    case 24: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_16);
    }
    case 23: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_17);
    }
    case 44: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_18);
    }
    case 7: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_19);
    }
    case 43: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_22);
    }
    case 41: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_28);
    }
    case 42: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_31);
    }
    case 40: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_33);
    }
    case 39: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_36);
    }
    case 38: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_39);
    }
    case 37: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_56);
    }
    case 36: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_59);
    }
    case 35: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_61);
    }
    case 6: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Reduce(0, 35, moonbitlang$ulex$lib$parser$$yy_action_18);
    }
    default: {
      return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
    }
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_54(_lookahead) {
  if (_lookahead === 2) {
    return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_55);
  } else {
    return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_65(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(2, 33, moonbitlang$ulex$lib$parser$$yy_action_30);
}
function moonbitlang$ulex$lib$parser$$yy_state_64(_lookahead) {
  _L: {
    switch (_lookahead) {
      case 21: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_54);
      }
      case 34: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_64);
      }
      case 33: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_65);
      }
      case 0: {
        break _L;
      }
      case 22: {
        break _L;
      }
      default: {
        return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
      }
    }
  }
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Reduce(1, 33, moonbitlang$ulex$lib$parser$$yy_action_19);
}
function moonbitlang$ulex$lib$parser$$yy_state_67(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(1, 30, moonbitlang$ulex$lib$parser$$yy_action_31);
}
function moonbitlang$ulex$lib$parser$$yy_state_68(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(4, 28, moonbitlang$ulex$lib$parser$$yy_action_20);
}
function moonbitlang$ulex$lib$parser$$yy_state_66(_lookahead) {
  switch (_lookahead) {
    case 22: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_67);
    }
    case 30: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_68);
    }
    case 0: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Reduce(0, 30, moonbitlang$ulex$lib$parser$$yy_action_40);
    }
    default: {
      return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
    }
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_53(_lookahead) {
  switch (_lookahead) {
    case 21: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_54);
    }
    case 34: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_64);
    }
    case 33: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_66);
    }
    default: {
      return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
    }
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_45(_lookahead) {
  switch (_lookahead) {
    case 3: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_46);
    }
    case 32: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_51);
    }
    case 31: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_53);
    }
    case 21: {
      return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Reduce(0, 31, moonbitlang$ulex$lib$parser$$yy_action_22);
    }
    default: {
      return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
    }
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_70(_lookahead) {
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$ReduceNoLookahead(2, 26, moonbitlang$ulex$lib$parser$$yy_action_37);
}
function moonbitlang$ulex$lib$parser$$yy_state_69(_lookahead) {
  if (_lookahead === 0) {
    return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_70);
  } else {
    return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
  }
}
function moonbitlang$ulex$lib$parser$$yy_state_42(_lookahead) {
  _L: {
    switch (_lookahead) {
      case 26: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_43);
      }
      case 22: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_44);
      }
      case 29: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_45);
      }
      case 28: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Shift(moonbitlang$ulex$lib$parser$$yy_state_69);
      }
      case 0: {
        return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Reduce(0, 28, moonbitlang$ulex$lib$parser$$yy_action_33);
      }
      case 3: {
        break _L;
      }
      case 21: {
        break _L;
      }
      default: {
        return $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Error;
      }
    }
  }
  return new $64$moonbitlang$47$ulex$47$lib$47$parser$46$YYDecision$Reduce(0, 29, moonbitlang$ulex$lib$parser$$yy_action_34);
}
function moonbitlang$ulex$lib$parser$$error(stack, token, loc) {
  const expected = [];
  const _arr = [{ _0: 0, _1: 0 }, { _0: 1, _1: 1 }, { _0: 2, _1: 2 }, { _0: 3, _1: 3 }, { _0: 4, _1: 4 }, { _0: 5, _1: 5 }, { _0: 6, _1: 6 }, { _0: 7, _1: 7 }, { _0: 8, _1: 8 }, { _0: 9, _1: 9 }, { _0: 10, _1: 10 }, { _0: 11, _1: 11 }, { _0: 12, _1: 12 }, { _0: 13, _1: 13 }, { _0: 14, _1: 14 }, { _0: 15, _1: 15 }, { _0: 16, _1: 16 }, { _0: 17, _1: 17 }, { _0: 18, _1: 18 }, { _0: 19, _1: 19 }, { _0: 20, _1: 20 }, { _0: 21, _1: 21 }, { _0: 22, _1: 22 }, { _0: 23, _1: 23 }, { _0: 24, _1: 24 }, { _0: 25, _1: 25 }];
  const _len = _arr.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const term = _arr[_i];
      const kind = term._1;
      const symbol = term._0;
      let stack$2;
      _L: {
        stack$2 = stack;
        break _L;
      }
      let _tmp$2 = stack$2;
      _L$2: while (true) {
        const stack$3 = _tmp$2;
        if (stack$3.$tag === 0) {
          break;
        } else {
          const _More = stack$3;
          const _state = _More._0;
          let count;
          let symbol$2;
          _L$3: {
            _L$4: {
              const _bind = _state(symbol);
              switch (_bind.$tag) {
                case 0: {
                  break _L$4;
                }
                case 1: {
                  break _L$4;
                }
                case 2: {
                  const _Reduce = _bind;
                  const _count = _Reduce._0;
                  const _symbol = _Reduce._1;
                  count = _count;
                  symbol$2 = _symbol;
                  break _L$3;
                }
                case 3: {
                  const _ReduceNoLookahead = _bind;
                  const _count$2 = _ReduceNoLookahead._0;
                  const _symbol$2 = _ReduceNoLookahead._1;
                  count = _count$2;
                  symbol$2 = _symbol$2;
                  break _L$3;
                }
                default: {
                  break _L$2;
                }
              }
            }
            moonbitlang$core$array$$Array$push$108$(expected, kind);
            break;
          }
          let stack$4;
          let count$2;
          let symbol$3;
          _L$4: {
            stack$4 = stack$3;
            count$2 = count;
            symbol$3 = symbol$2;
            break _L$4;
          }
          let _tmp$3 = stack$4;
          let _tmp$4 = count$2;
          let _tmp$5 = symbol$3;
          _L$5: while (true) {
            const stack$5 = _tmp$3;
            const count$3 = _tmp$4;
            const symbol$4 = _tmp$5;
            const stack$6 = moonbitlang$core$list$$List$drop$8$(stack$5, count$3);
            if (stack$6.$tag === 1) {
              const _More$2 = stack$6;
              const _state$2 = _More$2._0;
              let count$4;
              let symbol$5;
              _L$6: {
                const _bind = _state$2(symbol$4);
                switch (_bind.$tag) {
                  case 1: {
                    const _Shift = _bind;
                    const _state$3 = _Shift._0;
                    _tmp$2 = new $64$moonbitlang$47$core$47$list$46$List$More$26$(_state$3, stack$6);
                    continue _L$2;
                  }
                  case 2: {
                    const _Reduce = _bind;
                    const _count = _Reduce._0;
                    const _symbol = _Reduce._1;
                    count$4 = _count;
                    symbol$5 = _symbol;
                    break _L$6;
                  }
                  case 3: {
                    const _ReduceNoLookahead = _bind;
                    const _count$2 = _ReduceNoLookahead._0;
                    const _symbol$2 = _ReduceNoLookahead._1;
                    count$4 = _count$2;
                    symbol$5 = _symbol$2;
                    break _L$6;
                  }
                  default: {
                    $panic();
                    break _L$2;
                  }
                }
              }
              _tmp$3 = stack$6;
              _tmp$4 = count$4;
              _tmp$5 = symbol$5;
              continue;
            } else {
              $panic();
              break _L$2;
            }
          }
        }
      }
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return new Result$Err$29$(new Error$moonbitlang$47$ulex$47$lib$47$parser$46$ParseError$46$UnexpectedToken(token, loc, expected));
}
function moonbitlang$ulex$lib$parser$$yy_parse$144$(read_token, start_pos, start, return_) {
  const _p = $64$moonbitlang$47$core$47$list$46$List$Empty$26$;
  let state_stack = new $64$moonbitlang$47$core$47$list$46$List$More$26$(start, _p);
  const data_stack = [];
  let last_pos = start_pos;
  let state = start;
  let lookahead = undefined;
  let last_shifted_state_stack = state_stack;
  while (true) {
    let decision;
    const _func = state;
    const _bind = _func(47);
    switch (_bind.$tag) {
      case 3: {
        decision = _bind;
        break;
      }
      case 0: {
        decision = _bind;
        break;
      }
      default: {
        const _bind$2 = lookahead;
        if (_bind$2 === undefined) {
          const _bind$3 = read_token();
          const _token = _bind$3._0;
          const _start_pos = _bind$3._1;
          const _end_pos = _bind$3._2;
          const _bind$4 = moonbitlang$ulex$lib$parser$$yy_input(_token, _start_pos, _end_pos);
          const _symbol = _bind$4._0;
          const _data = _bind$4._1;
          lookahead = { _0: _symbol, _1: { _0: _data, _1: _start_pos, _2: _end_pos }, _2: _token };
          const _func$2 = state;
          decision = _func$2(_symbol);
        } else {
          const _Some = _bind$2;
          const _la = _Some;
          const _func$2 = state;
          decision = _func$2(_la._0);
        }
      }
    }
    let action;
    let count;
    let symbol;
    _L: {
      _L$2: {
        switch (decision.$tag) {
          case 0: {
            return new Result$Ok$30$(return_(moonbitlang$core$array$$Array$unsafe_pop$9$(data_stack)._0));
          }
          case 1: {
            const _Shift = decision;
            const _next_state = _Shift._0;
            const _bind$3 = lookahead;
            if (_bind$3 === undefined) {
              $panic();
            } else {
              const _Some = _bind$3;
              const _la = _Some;
              moonbitlang$core$array$$Array$push$9$(data_stack, _la._1);
              const _p$2 = state_stack;
              state_stack = new $64$moonbitlang$47$core$47$list$46$List$More$26$(_next_state, _p$2);
              last_shifted_state_stack = state_stack;
              state = _next_state;
              last_pos = _la._1._2;
              lookahead = undefined;
            }
            break;
          }
          case 2: {
            const _Reduce = decision;
            const _count = _Reduce._0;
            const _symbol = _Reduce._1;
            const _action = _Reduce._2;
            action = _action;
            count = _count;
            symbol = _symbol;
            break _L$2;
          }
          case 3: {
            const _ReduceNoLookahead = decision;
            const _count$2 = _ReduceNoLookahead._0;
            const _symbol$2 = _ReduceNoLookahead._1;
            const _action$2 = _ReduceNoLookahead._2;
            action = _action$2;
            count = _count$2;
            symbol = _symbol$2;
            break _L$2;
          }
          default: {
            const _p$2 = lookahead;
            let _bind$4;
            if (_p$2 === undefined) {
              _bind$4 = $panic();
            } else {
              const _p$3 = _p$2;
              _bind$4 = _p$3;
            }
            const _x = _bind$4._1;
            const _start_pos = _x._1;
            const _end_pos = _x._2;
            const _token = _bind$4._2;
            const _bind$5 = moonbitlang$ulex$lib$parser$$error(last_shifted_state_stack, _token, { _0: _start_pos, _1: _end_pos });
            if (_bind$5.$tag === 1) {
              const _ok = _bind$5;
              _ok._0;
            } else {
              return _bind$5;
            }
          }
        }
        break _L;
      }
      let _tmp = count;
      let _tmp$2 = symbol;
      let _tmp$3 = action;
      _L$3: while (true) {
        const args = moonbitlang$core$array$$Array$op_as_view$46$inner$9$(data_stack, data_stack.length - count | 0, undefined);
        const data = action(last_pos, args);
        let start_pos$2;
        let end_pos;
        _L$4: {
          if (args.len === 0) {
            const _tmp$4 = last_pos;
            const _tmp$5 = last_pos;
            start_pos$2 = _tmp$4;
            end_pos = _tmp$5;
            break _L$4;
          } else {
            const _tmp$4 = moonbitlang$core$array$$ArrayView$op_get$9$(args, 0)._1;
            const _tmp$5 = moonbitlang$core$array$$ArrayView$op_get$9$(args, args.len - 1 | 0)._2;
            start_pos$2 = _tmp$4;
            end_pos = _tmp$5;
            break _L$4;
          }
        }
        let _tmp$4 = 0;
        while (true) {
          const i = _tmp$4;
          if (i < count) {
            moonbitlang$core$array$$Array$unsafe_pop$9$(data_stack);
            state_stack = moonbitlang$core$list$$List$unsafe_tail$8$(state_stack);
            _tmp$4 = i + 1 | 0;
            continue;
          } else {
            break;
          }
        }
        state = moonbitlang$core$list$$List$unsafe_head$8$(state_stack);
        moonbitlang$core$array$$Array$push$9$(data_stack, { _0: data, _1: start_pos$2, _2: end_pos });
        let action$2;
        let count$2;
        let symbol$2;
        _L$5: {
          const _func$2 = state;
          const _bind$3 = _func$2(symbol);
          switch (_bind$3.$tag) {
            case 0: {
              return new Result$Ok$30$(return_(moonbitlang$core$array$$Array$unsafe_pop$9$(data_stack)._0));
            }
            case 1: {
              const _Shift = _bind$3;
              const _next_state = _Shift._0;
              const _p$2 = state_stack;
              state_stack = new $64$moonbitlang$47$core$47$list$46$List$More$26$(_next_state, _p$2);
              state = _next_state;
              break _L$3;
            }
            case 2: {
              const _Reduce = _bind$3;
              const _count = _Reduce._0;
              const _symbol = _Reduce._1;
              const _action = _Reduce._2;
              action$2 = _action;
              count$2 = _count;
              symbol$2 = _symbol;
              break _L$5;
            }
            case 3: {
              const _ReduceNoLookahead = _bind$3;
              const _count$2 = _ReduceNoLookahead._0;
              const _symbol$2 = _ReduceNoLookahead._1;
              const _action$2 = _ReduceNoLookahead._2;
              action$2 = _action$2;
              count$2 = _count$2;
              symbol$2 = _symbol$2;
              break _L$5;
            }
            default: {
              $panic();
              break _L$3;
            }
          }
        }
        _tmp = count$2;
        _tmp$2 = symbol$2;
        _tmp$3 = action$2;
        continue;
      }
    }
    continue;
  }
}
function moonbitlang$ulex$lib$parser$$lex_eoi(read_token, start_pos) {
  return moonbitlang$ulex$lib$parser$$yy_parse$144$(read_token, start_pos, moonbitlang$ulex$lib$parser$$yy_state_42, (it) => {
    if (it.$tag === 11) {
      const _YYObj__Context______type_Lex = it;
      return _YYObj__Context______type_Lex._0;
    } else {
      return $panic();
    }
  });
}
function moonbitlang$ulex$lib$parser$$code_rbrace$143$(buffer, lexbuf) {
  _L: while (true) {
    let _match_pattern = moonbitlang$core$int$$max_value;
    let _match_start = lexbuf.pos;
    let _match_end = -1;
    let _capture_0_start = -1;
    let _capture_0_end = -1;
    let _tmp = 0;
    _L$2: while (true) {
      const _param = _tmp;
      switch (_param) {
        case 0: {
          const _bind = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind === -1) {
            _tmp = 1;
          } else {
            if (_bind >= 0 && _bind <= 33) {
              _tmp = 2;
            } else {
              if (_bind === 34) {
                _tmp = 3;
              } else {
                if (_bind >= 35 && _bind <= 38) {
                  _tmp = 2;
                } else {
                  if (_bind === 39) {
                    _tmp = 4;
                  } else {
                    if (_bind >= 40 && _bind <= 46) {
                      _tmp = 2;
                    } else {
                      if (_bind === 47) {
                        _tmp = 5;
                      } else {
                        if (_bind >= 48 && _bind <= 122) {
                          _tmp = 2;
                        } else {
                          if (_bind === 123) {
                            _tmp = 6;
                          } else {
                            if (_bind === 124) {
                              _tmp = 2;
                            } else {
                              if (_bind === 125) {
                                _tmp = 7;
                              } else {
                                if (_bind >= 126 && _bind <= 1114111) {
                                  _tmp = 2;
                                } else {
                                  break _L$2;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 1: {
          _match_pattern = 6;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 2: {
          _match_pattern = 5;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_start + 1 | 0;
          break _L$2;
        }
        case 3: {
          _match_pattern = 5;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_start + 1 | 0;
          const _bind$2 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$2 >= 0 && _bind$2 <= 33) {
            _tmp = 9;
          } else {
            if (_bind$2 === 34) {
              _tmp = 10;
            } else {
              if (_bind$2 >= 35 && _bind$2 <= 91) {
                _tmp = 9;
              } else {
                if (_bind$2 === 92) {
                  _tmp = 11;
                } else {
                  if (_bind$2 >= 93 && _bind$2 <= 1114111) {
                    _tmp = 9;
                  } else {
                    break _L$2;
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 4: {
          _match_pattern = 5;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_start + 1 | 0;
          const _bind$3 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$3 >= 0 && _bind$3 <= 38) {
            _tmp = 8;
          } else {
            if (_bind$3 >= 40 && _bind$3 <= 91) {
              _tmp = 8;
            } else {
              if (_bind$3 >= 93 && _bind$3 <= 1114111) {
                _tmp = 8;
              } else {
                break _L$2;
              }
            }
          }
          continue _L$2;
        }
        case 5: {
          _match_pattern = 5;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_start + 1 | 0;
          const _bind$4 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$4 === 47) {
            _tmp = 12;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 6: {
          _match_pattern = 3;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 7: {
          _match_pattern = 4;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 8: {
          const _bind$5 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$5 === 39) {
            _tmp = 13;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 9: {
          const _bind$6 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$6 >= 0 && _bind$6 <= 33) {
            _tmp = 9;
          } else {
            if (_bind$6 === 34) {
              _tmp = 10;
            } else {
              if (_bind$6 >= 35 && _bind$6 <= 91) {
                _tmp = 9;
              } else {
                if (_bind$6 === 92) {
                  _tmp = 11;
                } else {
                  if (_bind$6 >= 93 && _bind$6 <= 1114111) {
                    _tmp = 9;
                  } else {
                    break _L$2;
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 10: {
          _match_pattern = 1;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_end;
          break _L$2;
        }
        case 11: {
          const _bind$7 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$7 >= 0 && _bind$7 <= 1114111) {
            _tmp = 9;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 12: {
          const _bind$8 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$8 >= 0 && _bind$8 <= 9) {
            _tmp = 14;
          } else {
            if (_bind$8 >= 11 && _bind$8 <= 1114111) {
              _tmp = 14;
            } else {
              break _L$2;
            }
          }
          continue _L$2;
        }
        case 13: {
          _match_pattern = 2;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_start + 3 | 0;
          break _L$2;
        }
        case 14: {
          const _bind$9 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$9 >= 0 && _bind$9 <= 9) {
            _tmp = 14;
          } else {
            if (_bind$9 === 10) {
              _tmp = 15;
            } else {
              if (_bind$9 >= 11 && _bind$9 <= 1114111) {
                _tmp = 14;
              } else {
                break _L$2;
              }
            }
          }
          continue _L$2;
        }
        case 15: {
          _match_pattern = 0;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_end;
          break _L$2;
        }
        default: {
          $panic();
          break _L$2;
        }
      }
    }
    if (_match_pattern <= 6) {
      moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$reset$143$(lexbuf, _match_end);
      const _bind = _match_pattern;
      switch (_bind) {
        case 0: {
          const t = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_string$143$(lexbuf, _capture_0_start, _capture_0_end);
          moonbitlang$core$builtin$$Logger$write_string$25$(buffer, t);
          continue _L;
        }
        case 1: {
          const t$2 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_string$143$(lexbuf, _capture_0_start, _capture_0_end);
          moonbitlang$core$builtin$$Logger$write_string$25$(buffer, t$2);
          continue _L;
        }
        case 2: {
          const t$3 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_string$143$(lexbuf, _capture_0_start, _capture_0_end);
          moonbitlang$core$builtin$$Logger$write_string$25$(buffer, t$3);
          continue _L;
        }
        case 3: {
          moonbitlang$core$builtin$$Logger$write_string$25$(buffer, "{");
          moonbitlang$ulex$lib$parser$$code_rbrace$143$(buffer, lexbuf);
          moonbitlang$core$builtin$$Logger$write_string$25$(buffer, "}");
          continue _L;
        }
        case 4: {
          return _match_end;
        }
        case 5: {
          const t$4 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_char$143$(lexbuf, _capture_0_start, _capture_0_end);
          moonbitlang$core$builtin$$Logger$write_char$25$(buffer, t$4);
          continue _L;
        }
        case 6: {
          return moonbitlang$core$abort$$abort$4$("Unexpected end of input");
        }
        default: {
          return $panic();
        }
      }
    } else {
      return $panic();
    }
  }
}
function moonbitlang$ulex$lib$parser$$string_inner_rquote$143$(buffer, lexbuf) {
  _L: while (true) {
    let _match_pattern = moonbitlang$core$int$$max_value;
    let _match_start = lexbuf.pos;
    let _match_end = -1;
    let _capture_0_start = -1;
    let _capture_0_end = -1;
    let _tmp = 0;
    _L$2: while (true) {
      const _param = _tmp;
      switch (_param) {
        case 0: {
          const _bind = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind === -1) {
            _tmp = 1;
          } else {
            if (_bind >= 0 && _bind <= 33) {
              _tmp = 2;
            } else {
              if (_bind === 34) {
                _tmp = 3;
              } else {
                if (_bind >= 35 && _bind <= 91) {
                  _tmp = 2;
                } else {
                  if (_bind === 92) {
                    _tmp = 4;
                  } else {
                    if (_bind >= 93 && _bind <= 1114111) {
                      _tmp = 2;
                    } else {
                      break _L$2;
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 1: {
          _match_pattern = 12;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 2: {
          _match_pattern = 11;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_start + 1 | 0;
          break _L$2;
        }
        case 3: {
          _match_pattern = 0;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 4: {
          _match_pattern = 11;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_start + 1 | 0;
          const _bind$2 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          switch (_bind$2) {
            case 34: {
              _tmp = 5;
              break;
            }
            case 92: {
              _tmp = 6;
              break;
            }
            case 98: {
              _tmp = 7;
              break;
            }
            case 110: {
              _tmp = 8;
              break;
            }
            case 114: {
              _tmp = 9;
              break;
            }
            case 116: {
              _tmp = 10;
              break;
            }
            case 117: {
              _tmp = 11;
              break;
            }
            case 118: {
              _tmp = 12;
              break;
            }
            case 120: {
              _tmp = 13;
              break;
            }
            default: {
              break _L$2;
            }
          }
          continue _L$2;
        }
        case 5: {
          _match_pattern = 7;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 6: {
          _match_pattern = 6;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 7: {
          _match_pattern = 1;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 8: {
          _match_pattern = 5;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 9: {
          _match_pattern = 4;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 10: {
          _match_pattern = 2;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 11: {
          const _bind$3 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$3 >= 48 && _bind$3 <= 57) {
            _tmp = 14;
          } else {
            if (_bind$3 >= 65 && _bind$3 <= 70) {
              _tmp = 14;
            } else {
              if (_bind$3 >= 97 && _bind$3 <= 102) {
                _tmp = 14;
              } else {
                if (_bind$3 === 123) {
                  _tmp = 15;
                } else {
                  break _L$2;
                }
              }
            }
          }
          continue _L$2;
        }
        case 12: {
          _match_pattern = 3;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 13: {
          const _bind$4 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$4 >= 48 && _bind$4 <= 57) {
            _tmp = 16;
          } else {
            if (_bind$4 >= 65 && _bind$4 <= 70) {
              _tmp = 16;
            } else {
              if (_bind$4 >= 97 && _bind$4 <= 102) {
                _tmp = 16;
              } else {
                break _L$2;
              }
            }
          }
          continue _L$2;
        }
        case 14: {
          const _bind$5 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$5 >= 48 && _bind$5 <= 57) {
            _tmp = 18;
          } else {
            if (_bind$5 >= 65 && _bind$5 <= 70) {
              _tmp = 18;
            } else {
              if (_bind$5 >= 97 && _bind$5 <= 102) {
                _tmp = 18;
              } else {
                break _L$2;
              }
            }
          }
          continue _L$2;
        }
        case 15: {
          const _bind$6 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$6 >= 48 && _bind$6 <= 57) {
            _tmp = 17;
          } else {
            if (_bind$6 >= 65 && _bind$6 <= 70) {
              _tmp = 17;
            } else {
              if (_bind$6 >= 97 && _bind$6 <= 102) {
                _tmp = 17;
              } else {
                break _L$2;
              }
            }
          }
          continue _L$2;
        }
        case 16: {
          const _bind$7 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$7 >= 48 && _bind$7 <= 57) {
            _tmp = 19;
          } else {
            if (_bind$7 >= 65 && _bind$7 <= 70) {
              _tmp = 19;
            } else {
              if (_bind$7 >= 97 && _bind$7 <= 102) {
                _tmp = 19;
              } else {
                break _L$2;
              }
            }
          }
          continue _L$2;
        }
        case 17: {
          const _bind$8 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$8 >= 48 && _bind$8 <= 57) {
            _tmp = 17;
          } else {
            if (_bind$8 >= 65 && _bind$8 <= 70) {
              _tmp = 17;
            } else {
              if (_bind$8 >= 97 && _bind$8 <= 102) {
                _tmp = 17;
              } else {
                if (_bind$8 === 125) {
                  _tmp = 20;
                } else {
                  break _L$2;
                }
              }
            }
          }
          continue _L$2;
        }
        case 18: {
          const _bind$9 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$9 >= 48 && _bind$9 <= 57) {
            _tmp = 21;
          } else {
            if (_bind$9 >= 65 && _bind$9 <= 70) {
              _tmp = 21;
            } else {
              if (_bind$9 >= 97 && _bind$9 <= 102) {
                _tmp = 21;
              } else {
                break _L$2;
              }
            }
          }
          continue _L$2;
        }
        case 19: {
          const _bind$10 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$10 === 39) {
            _tmp = 22;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 20: {
          const _bind$11 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$11 === 39) {
            _tmp = 23;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 21: {
          const _bind$12 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$12 >= 48 && _bind$12 <= 57) {
            _tmp = 24;
          } else {
            if (_bind$12 >= 65 && _bind$12 <= 70) {
              _tmp = 24;
            } else {
              if (_bind$12 >= 97 && _bind$12 <= 102) {
                _tmp = 24;
              } else {
                break _L$2;
              }
            }
          }
          continue _L$2;
        }
        case 22: {
          _match_pattern = 8;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 2 | 0;
          _capture_0_end = _match_start + 4 | 0;
          break _L$2;
        }
        case 23: {
          _match_pattern = 10;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 3 | 0;
          _capture_0_end = _match_end + -2 | 0;
          break _L$2;
        }
        case 24: {
          const _bind$13 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$13 === 39) {
            _tmp = 25;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 25: {
          _match_pattern = 9;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 2 | 0;
          _capture_0_end = _match_start + 6 | 0;
          break _L$2;
        }
        default: {
          $panic();
          break _L$2;
        }
      }
    }
    if (_match_pattern <= 12) {
      moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$reset$143$(lexbuf, _match_end);
      const _bind = _match_pattern;
      switch (_bind) {
        case 0: {
          return _match_end;
        }
        case 1: {
          moonbitlang$core$builtin$$Logger$write_char$25$(buffer, 8);
          continue _L;
        }
        case 2: {
          moonbitlang$core$builtin$$Logger$write_char$25$(buffer, 9);
          continue _L;
        }
        case 3: {
          moonbitlang$core$builtin$$Logger$write_char$25$(buffer, 11);
          continue _L;
        }
        case 4: {
          moonbitlang$core$builtin$$Logger$write_char$25$(buffer, 13);
          continue _L;
        }
        case 5: {
          moonbitlang$core$builtin$$Logger$write_char$25$(buffer, 10);
          continue _L;
        }
        case 6: {
          moonbitlang$core$builtin$$Logger$write_char$25$(buffer, 92);
          continue _L;
        }
        case 7: {
          moonbitlang$core$builtin$$Logger$write_char$25$(buffer, 34);
          continue _L;
        }
        case 8: {
          const t = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_string$143$(lexbuf, _capture_0_start, _capture_0_end);
          let _tmp$2;
          let _try_err;
          _L$3: {
            _L$4: {
              const _bind$2 = moonbitlang$core$strconv$$parse_int$46$inner({ str: t, start: 0, end: t.length }, 16);
              let _tmp$3;
              if (_bind$2.$tag === 1) {
                const _ok = _bind$2;
                _tmp$3 = _ok._0;
              } else {
                const _err = _bind$2;
                const _tmp$4 = _err._0;
                _try_err = _tmp$4;
                break _L$4;
              }
              _tmp$2 = new Result$Ok$13$(_tmp$3);
              break _L$3;
            }
            _tmp$2 = new Result$Err$13$(_try_err);
          }
          const code = moonbitlang$core$result$$Result$unwrap$50$(_tmp$2);
          moonbitlang$core$builtin$$Logger$write_char$25$(buffer, code);
          continue _L;
        }
        case 9: {
          const t$2 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_string$143$(lexbuf, _capture_0_start, _capture_0_end);
          let _tmp$3;
          let _try_err$2;
          _L$4: {
            _L$5: {
              const _bind$2 = moonbitlang$core$strconv$$parse_int$46$inner({ str: t$2, start: 0, end: t$2.length }, 16);
              let _tmp$4;
              if (_bind$2.$tag === 1) {
                const _ok = _bind$2;
                _tmp$4 = _ok._0;
              } else {
                const _err = _bind$2;
                const _tmp$5 = _err._0;
                _try_err$2 = _tmp$5;
                break _L$5;
              }
              _tmp$3 = new Result$Ok$13$(_tmp$4);
              break _L$4;
            }
            _tmp$3 = new Result$Err$13$(_try_err$2);
          }
          const code$2 = moonbitlang$core$result$$Result$unwrap$50$(_tmp$3);
          moonbitlang$core$builtin$$Logger$write_char$25$(buffer, code$2);
          continue _L;
        }
        case 10: {
          const t$3 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_string$143$(lexbuf, _capture_0_start, _capture_0_end);
          let _tmp$4;
          let _try_err$3;
          _L$5: {
            _L$6: {
              const _bind$2 = moonbitlang$core$strconv$$parse_int$46$inner({ str: t$3, start: 0, end: t$3.length }, 16);
              let _tmp$5;
              if (_bind$2.$tag === 1) {
                const _ok = _bind$2;
                _tmp$5 = _ok._0;
              } else {
                const _err = _bind$2;
                const _tmp$6 = _err._0;
                _try_err$3 = _tmp$6;
                break _L$6;
              }
              _tmp$4 = new Result$Ok$13$(_tmp$5);
              break _L$5;
            }
            _tmp$4 = new Result$Err$13$(_try_err$3);
          }
          const code$3 = moonbitlang$core$result$$Result$unwrap$50$(_tmp$4);
          moonbitlang$core$builtin$$Logger$write_char$25$(buffer, code$3);
          continue _L;
        }
        case 11: {
          const t$4 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_char$143$(lexbuf, _capture_0_start, _capture_0_end);
          moonbitlang$core$builtin$$Logger$write_char$25$(buffer, t$4);
          continue _L;
        }
        case 12: {
          return moonbitlang$core$abort$$abort$4$("Unexpected end of input");
        }
        default: {
          return $panic();
        }
      }
    } else {
      return $panic();
    }
  }
}
function moonbitlang$ulex$lib$parser$$token$143$(lexbuf) {
  _L: while (true) {
    let _match_pattern = moonbitlang$core$int$$max_value;
    let _match_start = lexbuf.pos;
    let _match_end = -1;
    let _capture_0_start = -1;
    let _capture_0_end = -1;
    let _capture_1_start = -1;
    let _capture_1_end = -1;
    let _tag_0 = -1;
    let _tag_1 = -1;
    let _tag_1_1 = -1;
    let _tag_2 = -1;
    let _tag_2_1 = -1;
    let _tmp = 0;
    _L$2: while (true) {
      const _param = _tmp;
      switch (_param) {
        case 0: {
          const _bind = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind === -1) {
            _tmp = 1;
          } else {
            if (_bind >= 9 && _bind <= 10) {
              _tmp = 2;
            } else {
              if (_bind === 13) {
                _tmp = 2;
              } else {
                if (_bind === 32) {
                  _tmp = 2;
                } else {
                  if (_bind === 34) {
                    _tmp = 3;
                  } else {
                    if (_bind === 39) {
                      _tmp = 4;
                    } else {
                      if (_bind === 40) {
                        _tmp = 5;
                      } else {
                        if (_bind === 41) {
                          _tmp = 6;
                        } else {
                          if (_bind === 42) {
                            _tmp = 7;
                          } else {
                            if (_bind === 43) {
                              _tmp = 8;
                            } else {
                              if (_bind === 45) {
                                _tmp = 9;
                              } else {
                                if (_bind === 47) {
                                  _tmp = 10;
                                } else {
                                  if (_bind === 59) {
                                    _tmp = 11;
                                  } else {
                                    if (_bind === 61) {
                                      _tmp = 12;
                                    } else {
                                      if (_bind === 63) {
                                        _tmp = 13;
                                      } else {
                                        if (_bind === 91) {
                                          _tmp = 14;
                                        } else {
                                          if (_bind === 92) {
                                            _tmp = 15;
                                          } else {
                                            if (_bind === 93) {
                                              _tmp = 16;
                                            } else {
                                              if (_bind === 94) {
                                                _tmp = 17;
                                              } else {
                                                if (_bind === 95) {
                                                  _tmp = 18;
                                                } else {
                                                  if (_bind >= 97 && _bind <= 111) {
                                                    _tmp = 19;
                                                  } else {
                                                    if (_bind === 112) {
                                                      _tmp = 20;
                                                    } else {
                                                      if (_bind === 113) {
                                                        _tmp = 19;
                                                      } else {
                                                        if (_bind === 114) {
                                                          _tmp = 21;
                                                        } else {
                                                          if (_bind >= 115 && _bind <= 122) {
                                                            _tmp = 19;
                                                          } else {
                                                            if (_bind === 123) {
                                                              _tmp = 22;
                                                            } else {
                                                              if (_bind === 124) {
                                                                _tmp = 23;
                                                              } else {
                                                                if (_bind === 125) {
                                                                  _tmp = 24;
                                                                } else {
                                                                  break _L$2;
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 1: {
          _match_pattern = 2;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 2: {
          _match_pattern = 0;
          _match_end = lexbuf.pos;
          const _bind$2 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$2 >= 9 && _bind$2 <= 10) {
            _tmp = 2;
          } else {
            if (_bind$2 === 13) {
              _tmp = 2;
            } else {
              if (_bind$2 === 32) {
                _tmp = 2;
              } else {
                break _L$2;
              }
            }
          }
          continue _L$2;
        }
        case 3: {
          _match_pattern = 33;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 4: {
          const _bind$3 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$3 >= 0 && _bind$3 <= 38) {
            _tmp = 25;
          } else {
            if (_bind$3 >= 40 && _bind$3 <= 91) {
              _tmp = 25;
            } else {
              if (_bind$3 === 92) {
                _tmp = 26;
              } else {
                if (_bind$3 >= 93 && _bind$3 <= 1114111) {
                  _tmp = 25;
                } else {
                  break _L$2;
                }
              }
            }
          }
          continue _L$2;
        }
        case 5: {
          _match_pattern = 9;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 6: {
          _match_pattern = 10;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 7: {
          _match_pattern = 16;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 8: {
          _match_pattern = 17;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 9: {
          _match_pattern = 19;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 10: {
          const _bind$4 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$4 === 47) {
            _tmp = 30;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 11: {
          _match_pattern = 14;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 12: {
          _match_pattern = 13;
          _match_end = lexbuf.pos;
          const _bind$5 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$5 === 62) {
            _tmp = 27;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 13: {
          _match_pattern = 18;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 14: {
          _match_pattern = 11;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 15: {
          _match_pattern = 21;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 16: {
          _match_pattern = 12;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 17: {
          _match_pattern = 20;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 18: {
          _match_pattern = 6;
          _match_end = lexbuf.pos;
          const _bind$6 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$6 >= 48 && _bind$6 <= 57) {
            _tmp = 19;
          } else {
            if (_bind$6 >= 65 && _bind$6 <= 90) {
              _tmp = 19;
            } else {
              if (_bind$6 === 95) {
                _tmp = 19;
              } else {
                if (_bind$6 >= 97 && _bind$6 <= 122) {
                  _tmp = 19;
                } else {
                  break _L$2;
                }
              }
            }
          }
          continue _L$2;
        }
        case 19: {
          _match_pattern = 34;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_end;
          const _bind$7 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$7 >= 48 && _bind$7 <= 57) {
            _tmp = 19;
          } else {
            if (_bind$7 >= 65 && _bind$7 <= 90) {
              _tmp = 19;
            } else {
              if (_bind$7 === 95) {
                _tmp = 19;
              } else {
                if (_bind$7 >= 97 && _bind$7 <= 122) {
                  _tmp = 19;
                } else {
                  break _L$2;
                }
              }
            }
          }
          continue _L$2;
        }
        case 20: {
          _match_pattern = 34;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_end;
          const _bind$8 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$8 >= 48 && _bind$8 <= 57) {
            _tmp = 19;
          } else {
            if (_bind$8 >= 65 && _bind$8 <= 90) {
              _tmp = 19;
            } else {
              if (_bind$8 === 95) {
                _tmp = 19;
              } else {
                if (_bind$8 === 97) {
                  _tmp = 28;
                } else {
                  if (_bind$8 >= 98 && _bind$8 <= 122) {
                    _tmp = 19;
                  } else {
                    break _L$2;
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 21: {
          _match_pattern = 34;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_end;
          const _bind$9 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$9 >= 48 && _bind$9 <= 57) {
            _tmp = 19;
          } else {
            if (_bind$9 >= 65 && _bind$9 <= 90) {
              _tmp = 19;
            } else {
              if (_bind$9 === 95) {
                _tmp = 19;
              } else {
                if (_bind$9 >= 97 && _bind$9 <= 116) {
                  _tmp = 19;
                } else {
                  if (_bind$9 === 117) {
                    _tmp = 29;
                  } else {
                    if (_bind$9 >= 118 && _bind$9 <= 122) {
                      _tmp = 19;
                    } else {
                      break _L$2;
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 22: {
          _match_pattern = 7;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 23: {
          _match_pattern = 15;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 24: {
          _match_pattern = 8;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 25: {
          const _bind$10 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$10 === 39) {
            _tmp = 40;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 26: {
          const _bind$11 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          switch (_bind$11) {
            case 39: {
              _tmp = 31;
              break;
            }
            case 92: {
              _tmp = 32;
              break;
            }
            case 98: {
              _tmp = 33;
              break;
            }
            case 110: {
              _tmp = 34;
              break;
            }
            case 114: {
              _tmp = 35;
              break;
            }
            case 116: {
              _tmp = 36;
              break;
            }
            case 117: {
              _tmp = 37;
              break;
            }
            case 118: {
              _tmp = 38;
              break;
            }
            case 120: {
              _tmp = 39;
              break;
            }
            default: {
              break _L$2;
            }
          }
          continue _L$2;
        }
        case 27: {
          _match_pattern = 5;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 28: {
          _match_pattern = 34;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_end;
          const _bind$12 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$12 >= 48 && _bind$12 <= 57) {
            _tmp = 19;
          } else {
            if (_bind$12 >= 65 && _bind$12 <= 90) {
              _tmp = 19;
            } else {
              if (_bind$12 === 95) {
                _tmp = 19;
              } else {
                if (_bind$12 >= 97 && _bind$12 <= 113) {
                  _tmp = 19;
                } else {
                  if (_bind$12 === 114) {
                    _tmp = 41;
                  } else {
                    if (_bind$12 >= 115 && _bind$12 <= 122) {
                      _tmp = 19;
                    } else {
                      break _L$2;
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 29: {
          _match_pattern = 34;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_end;
          const _bind$13 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$13 >= 48 && _bind$13 <= 57) {
            _tmp = 19;
          } else {
            if (_bind$13 >= 65 && _bind$13 <= 90) {
              _tmp = 19;
            } else {
              if (_bind$13 === 95) {
                _tmp = 19;
              } else {
                if (_bind$13 >= 97 && _bind$13 <= 107) {
                  _tmp = 19;
                } else {
                  if (_bind$13 === 108) {
                    _tmp = 42;
                  } else {
                    if (_bind$13 >= 109 && _bind$13 <= 122) {
                      _tmp = 19;
                    } else {
                      break _L$2;
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 30: {
          _match_pattern = 1;
          _match_end = lexbuf.pos;
          const _bind$14 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$14 >= 0 && _bind$14 <= 9) {
            _tmp = 30;
          } else {
            if (_bind$14 === 10) {
              _tmp = 43;
            } else {
              if (_bind$14 >= 11 && _bind$14 <= 1114111) {
                _tmp = 30;
              } else {
                break _L$2;
              }
            }
          }
          continue _L$2;
        }
        case 31: {
          const _bind$15 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$15 === 39) {
            _tmp = 47;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 32: {
          const _bind$16 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$16 === 39) {
            _tmp = 48;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 33: {
          const _bind$17 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$17 === 39) {
            _tmp = 53;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 34: {
          const _bind$18 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$18 === 39) {
            _tmp = 49;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 35: {
          const _bind$19 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$19 === 39) {
            _tmp = 50;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 36: {
          const _bind$20 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$20 === 39) {
            _tmp = 52;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 37: {
          const _bind$21 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$21 >= 48 && _bind$21 <= 57) {
            _tmp = 44;
          } else {
            if (_bind$21 >= 65 && _bind$21 <= 70) {
              _tmp = 44;
            } else {
              if (_bind$21 >= 97 && _bind$21 <= 102) {
                _tmp = 44;
              } else {
                if (_bind$21 === 123) {
                  _tmp = 45;
                } else {
                  break _L$2;
                }
              }
            }
          }
          continue _L$2;
        }
        case 38: {
          const _bind$22 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$22 === 39) {
            _tmp = 51;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 39: {
          const _bind$23 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$23 >= 48 && _bind$23 <= 57) {
            _tmp = 46;
          } else {
            if (_bind$23 >= 65 && _bind$23 <= 70) {
              _tmp = 46;
            } else {
              if (_bind$23 >= 97 && _bind$23 <= 102) {
                _tmp = 46;
              } else {
                break _L$2;
              }
            }
          }
          continue _L$2;
        }
        case 40: {
          _match_pattern = 22;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 1 | 0;
          _capture_0_end = _match_start + 2 | 0;
          break _L$2;
        }
        case 41: {
          _match_pattern = 34;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_end;
          const _bind$24 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$24 >= 48 && _bind$24 <= 57) {
            _tmp = 19;
          } else {
            if (_bind$24 >= 65 && _bind$24 <= 90) {
              _tmp = 19;
            } else {
              if (_bind$24 === 95) {
                _tmp = 19;
              } else {
                if (_bind$24 >= 97 && _bind$24 <= 114) {
                  _tmp = 19;
                } else {
                  if (_bind$24 === 115) {
                    _tmp = 54;
                  } else {
                    if (_bind$24 >= 116 && _bind$24 <= 122) {
                      _tmp = 19;
                    } else {
                      break _L$2;
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 42: {
          _match_pattern = 34;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_end;
          const _bind$25 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$25 >= 48 && _bind$25 <= 57) {
            _tmp = 19;
          } else {
            if (_bind$25 >= 65 && _bind$25 <= 90) {
              _tmp = 19;
            } else {
              if (_bind$25 === 95) {
                _tmp = 19;
              } else {
                if (_bind$25 >= 97 && _bind$25 <= 100) {
                  _tmp = 19;
                } else {
                  if (_bind$25 === 101) {
                    _tmp = 55;
                  } else {
                    if (_bind$25 >= 102 && _bind$25 <= 122) {
                      _tmp = 19;
                    } else {
                      break _L$2;
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 43: {
          _match_pattern = 1;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 44: {
          const _bind$26 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$26 >= 48 && _bind$26 <= 57) {
            _tmp = 57;
          } else {
            if (_bind$26 >= 65 && _bind$26 <= 70) {
              _tmp = 57;
            } else {
              if (_bind$26 >= 97 && _bind$26 <= 102) {
                _tmp = 57;
              } else {
                break _L$2;
              }
            }
          }
          continue _L$2;
        }
        case 45: {
          const _bind$27 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$27 >= 48 && _bind$27 <= 57) {
            _tmp = 56;
          } else {
            if (_bind$27 >= 65 && _bind$27 <= 70) {
              _tmp = 56;
            } else {
              if (_bind$27 >= 97 && _bind$27 <= 102) {
                _tmp = 56;
              } else {
                break _L$2;
              }
            }
          }
          continue _L$2;
        }
        case 46: {
          const _bind$28 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$28 >= 48 && _bind$28 <= 57) {
            _tmp = 58;
          } else {
            if (_bind$28 >= 65 && _bind$28 <= 70) {
              _tmp = 58;
            } else {
              if (_bind$28 >= 97 && _bind$28 <= 102) {
                _tmp = 58;
              } else {
                break _L$2;
              }
            }
          }
          continue _L$2;
        }
        case 47: {
          _match_pattern = 29;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 48: {
          _match_pattern = 28;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 49: {
          _match_pattern = 27;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 50: {
          _match_pattern = 26;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 51: {
          _match_pattern = 25;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 52: {
          _match_pattern = 24;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 53: {
          _match_pattern = 23;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 54: {
          _match_pattern = 34;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_end;
          const _bind$29 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$29 >= 48 && _bind$29 <= 57) {
            _tmp = 19;
          } else {
            if (_bind$29 >= 65 && _bind$29 <= 90) {
              _tmp = 19;
            } else {
              if (_bind$29 === 95) {
                _tmp = 19;
              } else {
                if (_bind$29 >= 97 && _bind$29 <= 100) {
                  _tmp = 19;
                } else {
                  if (_bind$29 === 101) {
                    _tmp = 59;
                  } else {
                    if (_bind$29 >= 102 && _bind$29 <= 122) {
                      _tmp = 19;
                    } else {
                      break _L$2;
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 55: {
          _match_pattern = 34;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_end;
          const _bind$30 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$30 >= 9 && _bind$30 <= 10) {
            _tmp = 60;
          } else {
            if (_bind$30 === 13) {
              _tmp = 60;
            } else {
              if (_bind$30 === 32) {
                _tmp = 60;
              } else {
                if (_bind$30 >= 48 && _bind$30 <= 57) {
                  _tmp = 19;
                } else {
                  if (_bind$30 >= 65 && _bind$30 <= 90) {
                    _tmp = 19;
                  } else {
                    if (_bind$30 === 95) {
                      _tmp = 19;
                    } else {
                      if (_bind$30 >= 97 && _bind$30 <= 122) {
                        _tmp = 19;
                      } else {
                        break _L$2;
                      }
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 56: {
          const _bind$31 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$31 >= 48 && _bind$31 <= 57) {
            _tmp = 56;
          } else {
            if (_bind$31 >= 65 && _bind$31 <= 70) {
              _tmp = 56;
            } else {
              if (_bind$31 >= 97 && _bind$31 <= 102) {
                _tmp = 56;
              } else {
                if (_bind$31 === 125) {
                  _tmp = 61;
                } else {
                  break _L$2;
                }
              }
            }
          }
          continue _L$2;
        }
        case 57: {
          const _bind$32 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$32 >= 48 && _bind$32 <= 57) {
            _tmp = 62;
          } else {
            if (_bind$32 >= 65 && _bind$32 <= 70) {
              _tmp = 62;
            } else {
              if (_bind$32 >= 97 && _bind$32 <= 102) {
                _tmp = 62;
              } else {
                break _L$2;
              }
            }
          }
          continue _L$2;
        }
        case 58: {
          const _bind$33 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$33 === 39) {
            _tmp = 63;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 59: {
          _match_pattern = 34;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start;
          _capture_0_end = _match_end;
          const _bind$34 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$34 >= 9 && _bind$34 <= 10) {
            _tmp = 64;
          } else {
            if (_bind$34 === 13) {
              _tmp = 64;
            } else {
              if (_bind$34 === 32) {
                _tmp = 64;
              } else {
                if (_bind$34 >= 48 && _bind$34 <= 57) {
                  _tmp = 19;
                } else {
                  if (_bind$34 >= 65 && _bind$34 <= 90) {
                    _tmp = 19;
                  } else {
                    if (_bind$34 === 95) {
                      _tmp = 19;
                    } else {
                      if (_bind$34 >= 97 && _bind$34 <= 122) {
                        _tmp = 19;
                      } else {
                        if (_bind$34 === 123) {
                          _tmp = 65;
                        } else {
                          break _L$2;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 60: {
          _tag_0 = lexbuf.pos;
          const _bind$35 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$35 >= 9 && _bind$35 <= 10) {
            _tmp = 60;
          } else {
            if (_bind$35 === 13) {
              _tmp = 60;
            } else {
              if (_bind$35 === 32) {
                _tmp = 60;
              } else {
                if (_bind$35 === 95) {
                  _tmp = 66;
                } else {
                  if (_bind$35 >= 97 && _bind$35 <= 122) {
                    _tmp = 66;
                  } else {
                    break _L$2;
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 61: {
          const _bind$36 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$36 === 39) {
            _tmp = 67;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 62: {
          const _bind$37 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$37 >= 48 && _bind$37 <= 57) {
            _tmp = 68;
          } else {
            if (_bind$37 >= 65 && _bind$37 <= 70) {
              _tmp = 68;
            } else {
              if (_bind$37 >= 97 && _bind$37 <= 102) {
                _tmp = 68;
              } else {
                break _L$2;
              }
            }
          }
          continue _L$2;
        }
        case 63: {
          _match_pattern = 30;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 3 | 0;
          _capture_0_end = _match_start + 5 | 0;
          break _L$2;
        }
        case 64: {
          const _bind$38 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$38 >= 9 && _bind$38 <= 10) {
            _tmp = 64;
          } else {
            if (_bind$38 === 13) {
              _tmp = 64;
            } else {
              if (_bind$38 === 32) {
                _tmp = 64;
              } else {
                if (_bind$38 === 123) {
                  _tmp = 65;
                } else {
                  break _L$2;
                }
              }
            }
          }
          continue _L$2;
        }
        case 65: {
          _match_pattern = 4;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 66: {
          _tag_1 = lexbuf.pos;
          const _bind$39 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$39 >= 0 && _bind$39 <= 47) {
            _tmp = 69;
          } else {
            if (_bind$39 >= 48 && _bind$39 <= 57) {
              _tmp = 70;
            } else {
              if (_bind$39 >= 58 && _bind$39 <= 64) {
                _tmp = 69;
              } else {
                if (_bind$39 >= 65 && _bind$39 <= 90) {
                  _tmp = 70;
                } else {
                  if (_bind$39 >= 91 && _bind$39 <= 94) {
                    _tmp = 69;
                  } else {
                    if (_bind$39 === 95) {
                      _tmp = 70;
                    } else {
                      if (_bind$39 === 96) {
                        _tmp = 69;
                      } else {
                        if (_bind$39 >= 97 && _bind$39 <= 122) {
                          _tmp = 70;
                        } else {
                          if (_bind$39 >= 124 && _bind$39 <= 1114111) {
                            _tmp = 69;
                          } else {
                            break _L$2;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 67: {
          _match_pattern = 32;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 4 | 0;
          _capture_0_end = _match_end + -2 | 0;
          break _L$2;
        }
        case 68: {
          const _bind$40 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$40 === 39) {
            _tmp = 71;
          } else {
            break _L$2;
          }
          continue _L$2;
        }
        case 69: {
          _tag_2 = lexbuf.pos;
          const _bind$41 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$41 >= 0 && _bind$41 <= 8) {
            _tmp = 69;
          } else {
            if (_bind$41 >= 9 && _bind$41 <= 10) {
              _tmp = 72;
            } else {
              if (_bind$41 >= 11 && _bind$41 <= 12) {
                _tmp = 69;
              } else {
                if (_bind$41 === 13) {
                  _tmp = 72;
                } else {
                  if (_bind$41 >= 14 && _bind$41 <= 31) {
                    _tmp = 69;
                  } else {
                    if (_bind$41 === 32) {
                      _tmp = 72;
                    } else {
                      if (_bind$41 >= 33 && _bind$41 <= 122) {
                        _tmp = 69;
                      } else {
                        if (_bind$41 === 123) {
                          _tmp = 73;
                        } else {
                          if (_bind$41 >= 124 && _bind$41 <= 1114111) {
                            _tmp = 69;
                          } else {
                            break _L$2;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 70: {
          _tag_1_1 = _tag_1;
          _tag_1 = lexbuf.pos;
          _tag_2 = lexbuf.pos;
          const _bind$42 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$42 >= 0 && _bind$42 <= 8) {
            _tmp = 69;
          } else {
            if (_bind$42 >= 9 && _bind$42 <= 10) {
              _tmp = 72;
            } else {
              if (_bind$42 >= 11 && _bind$42 <= 12) {
                _tmp = 69;
              } else {
                if (_bind$42 === 13) {
                  _tmp = 72;
                } else {
                  if (_bind$42 >= 14 && _bind$42 <= 31) {
                    _tmp = 69;
                  } else {
                    if (_bind$42 === 32) {
                      _tmp = 72;
                    } else {
                      if (_bind$42 >= 33 && _bind$42 <= 47) {
                        _tmp = 69;
                      } else {
                        if (_bind$42 >= 48 && _bind$42 <= 57) {
                          _tmp = 70;
                        } else {
                          if (_bind$42 >= 58 && _bind$42 <= 64) {
                            _tmp = 69;
                          } else {
                            if (_bind$42 >= 65 && _bind$42 <= 90) {
                              _tmp = 70;
                            } else {
                              if (_bind$42 >= 91 && _bind$42 <= 94) {
                                _tmp = 69;
                              } else {
                                if (_bind$42 === 95) {
                                  _tmp = 70;
                                } else {
                                  if (_bind$42 === 96) {
                                    _tmp = 69;
                                  } else {
                                    if (_bind$42 >= 97 && _bind$42 <= 122) {
                                      _tmp = 70;
                                    } else {
                                      if (_bind$42 === 123) {
                                        _tmp = 74;
                                      } else {
                                        if (_bind$42 >= 124 && _bind$42 <= 1114111) {
                                          _tmp = 69;
                                        } else {
                                          break _L$2;
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 71: {
          _match_pattern = 31;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 3 | 0;
          _capture_0_end = _match_start + 7 | 0;
          break _L$2;
        }
        case 72: {
          _tag_2_1 = _tag_2;
          _tag_2 = lexbuf.pos;
          const _bind$43 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$43 >= 0 && _bind$43 <= 8) {
            _tmp = 69;
          } else {
            if (_bind$43 >= 9 && _bind$43 <= 10) {
              _tmp = 72;
            } else {
              if (_bind$43 >= 11 && _bind$43 <= 12) {
                _tmp = 69;
              } else {
                if (_bind$43 === 13) {
                  _tmp = 72;
                } else {
                  if (_bind$43 >= 14 && _bind$43 <= 31) {
                    _tmp = 69;
                  } else {
                    if (_bind$43 === 32) {
                      _tmp = 72;
                    } else {
                      if (_bind$43 >= 33 && _bind$43 <= 122) {
                        _tmp = 69;
                      } else {
                        if (_bind$43 === 123) {
                          _tmp = 73;
                        } else {
                          if (_bind$43 >= 124 && _bind$43 <= 1114111) {
                            _tmp = 69;
                          } else {
                            break _L$2;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 73: {
          _match_pattern = 3;
          _match_end = lexbuf.pos;
          _capture_0_start = _tag_0;
          _capture_0_end = _tag_1;
          _capture_1_start = _tag_0;
          _capture_1_end = _tag_2;
          break _L$2;
        }
        case 74: {
          _tag_1 = _tag_1_1;
          _match_pattern = 3;
          _match_end = lexbuf.pos;
          _capture_0_start = _tag_0;
          _capture_0_end = _tag_1;
          _capture_1_start = _tag_0;
          _capture_1_end = _tag_2;
          break _L$2;
        }
        default: {
          $panic();
          break _L$2;
        }
      }
    }
    if (_match_pattern <= 34) {
      moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$reset$143$(lexbuf, _match_end);
      const _bind = _match_pattern;
      switch (_bind) {
        case 0: {
          continue _L;
        }
        case 1: {
          continue _L;
        }
        case 2: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$EOI, _1: _match_start, _2: _match_end };
        }
        case 3: {
          const t1 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_string$143$(lexbuf, _capture_0_start, _capture_0_end);
          const t2 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_string$143$(lexbuf, _capture_1_start, _capture_1_end);
          return { _0: new $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$RULE_LC_IDENT_LPAREN_CODE_RPAREN_ARROW_CODE_LBRACE({ _0: t1, _1: t2 }), _1: _match_start, _2: _match_end };
        }
        case 4: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$PARSE_LBRACE, _1: _match_start, _2: _match_end };
        }
        case 5: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$FAT_ARROW, _1: _match_start, _2: _match_end };
        }
        case 6: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$UNDERSCORE, _1: _match_start, _2: _match_end };
        }
        case 7: {
          const buffer = moonbitlang$core$builtin$$StringBuilder$new$46$inner(0);
          const end_pos = moonbitlang$ulex$lib$parser$$code_rbrace$143$(buffer, lexbuf);
          return { _0: new $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$LBRACE_CODE_RBRACE(buffer.val), _1: _match_start, _2: end_pos };
        }
        case 8: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$RBRACE, _1: _match_start, _2: _match_end };
        }
        case 9: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$LPAREN, _1: _match_start, _2: _match_end };
        }
        case 10: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$RPAREN, _1: _match_start, _2: _match_end };
        }
        case 11: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$LBRACKET, _1: _match_start, _2: _match_end };
        }
        case 12: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$RBRACKET, _1: _match_start, _2: _match_end };
        }
        case 13: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$EQ, _1: _match_start, _2: _match_end };
        }
        case 14: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$SEMICOLON, _1: _match_start, _2: _match_end };
        }
        case 15: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$BAR, _1: _match_start, _2: _match_end };
        }
        case 16: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$STAR, _1: _match_start, _2: _match_end };
        }
        case 17: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$PLUS, _1: _match_start, _2: _match_end };
        }
        case 18: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$QUESTION, _1: _match_start, _2: _match_end };
        }
        case 19: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$MINUS, _1: _match_start, _2: _match_end };
        }
        case 20: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$CARET, _1: _match_start, _2: _match_end };
        }
        case 21: {
          return { _0: $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$BACKSLASH, _1: _match_start, _2: _match_end };
        }
        case 22: {
          const t = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_char$143$(lexbuf, _capture_0_start, _capture_0_end);
          return { _0: new $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$CHAR(t), _1: _match_start, _2: _match_end };
        }
        case 23: {
          return { _0: new $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$CHAR(8), _1: _match_start, _2: _match_end };
        }
        case 24: {
          return { _0: new $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$CHAR(9), _1: _match_start, _2: _match_end };
        }
        case 25: {
          return { _0: new $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$CHAR(11), _1: _match_start, _2: _match_end };
        }
        case 26: {
          return { _0: new $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$CHAR(13), _1: _match_start, _2: _match_end };
        }
        case 27: {
          return { _0: new $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$CHAR(10), _1: _match_start, _2: _match_end };
        }
        case 28: {
          return { _0: new $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$CHAR(92), _1: _match_start, _2: _match_end };
        }
        case 29: {
          return { _0: new $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$CHAR(39), _1: _match_start, _2: _match_end };
        }
        case 30: {
          const t$2 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_string$143$(lexbuf, _capture_0_start, _capture_0_end);
          let _tmp$2;
          let _try_err;
          _L$3: {
            _L$4: {
              const _bind$2 = moonbitlang$core$strconv$$parse_int$46$inner({ str: t$2, start: 0, end: t$2.length }, 16);
              let _tmp$3;
              if (_bind$2.$tag === 1) {
                const _ok = _bind$2;
                _tmp$3 = _ok._0;
              } else {
                const _err = _bind$2;
                const _tmp$4 = _err._0;
                _try_err = _tmp$4;
                break _L$4;
              }
              _tmp$2 = new Result$Ok$13$(_tmp$3);
              break _L$3;
            }
            _tmp$2 = new Result$Err$13$(_try_err);
          }
          const code = moonbitlang$core$result$$Result$unwrap$50$(_tmp$2);
          return { _0: new $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$CHAR(code), _1: _match_start, _2: _match_end };
        }
        case 31: {
          const t$3 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_string$143$(lexbuf, _capture_0_start, _capture_0_end);
          let _tmp$3;
          let _try_err$2;
          _L$4: {
            _L$5: {
              const _bind$2 = moonbitlang$core$strconv$$parse_int$46$inner({ str: t$3, start: 0, end: t$3.length }, 16);
              let _tmp$4;
              if (_bind$2.$tag === 1) {
                const _ok = _bind$2;
                _tmp$4 = _ok._0;
              } else {
                const _err = _bind$2;
                const _tmp$5 = _err._0;
                _try_err$2 = _tmp$5;
                break _L$5;
              }
              _tmp$3 = new Result$Ok$13$(_tmp$4);
              break _L$4;
            }
            _tmp$3 = new Result$Err$13$(_try_err$2);
          }
          const code$2 = moonbitlang$core$result$$Result$unwrap$50$(_tmp$3);
          return { _0: new $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$CHAR(code$2), _1: _match_start, _2: _match_end };
        }
        case 32: {
          const t$4 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_string$143$(lexbuf, _capture_0_start, _capture_0_end);
          let _tmp$4;
          let _try_err$3;
          _L$5: {
            _L$6: {
              const _bind$2 = moonbitlang$core$strconv$$parse_int$46$inner({ str: t$4, start: 0, end: t$4.length }, 16);
              let _tmp$5;
              if (_bind$2.$tag === 1) {
                const _ok = _bind$2;
                _tmp$5 = _ok._0;
              } else {
                const _err = _bind$2;
                const _tmp$6 = _err._0;
                _try_err$3 = _tmp$6;
                break _L$6;
              }
              _tmp$4 = new Result$Ok$13$(_tmp$5);
              break _L$5;
            }
            _tmp$4 = new Result$Err$13$(_try_err$3);
          }
          const code$3 = moonbitlang$core$result$$Result$unwrap$50$(_tmp$4);
          return { _0: new $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$CHAR(code$3), _1: _match_start, _2: _match_end };
        }
        case 33: {
          const buffer$2 = moonbitlang$core$builtin$$StringBuilder$new$46$inner(0);
          const end_pos$2 = moonbitlang$ulex$lib$parser$$string_inner_rquote$143$(buffer$2, lexbuf);
          return { _0: new $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$STRING(buffer$2.val), _1: _match_start, _2: end_pos$2 };
        }
        case 34: {
          const t$5 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_string$143$(lexbuf, _capture_0_start, _capture_0_end);
          let _tmp$5;
          switch (t$5) {
            case "eof": {
              _tmp$5 = $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$EOF;
              break;
            }
            case "regex": {
              _tmp$5 = $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$REGEX;
              break;
            }
            case "as": {
              _tmp$5 = $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$AS;
              break;
            }
            default: {
              _tmp$5 = new $64$moonbitlang$47$ulex$47$lib$47$parser$46$Token$LC_IDENT(t$5);
            }
          }
          return { _0: _tmp$5, _1: _match_start, _2: _match_end };
        }
        default: {
          return $panic();
        }
      }
    } else {
      return $panic();
    }
  }
}
function moonbitlang$ulex$lib$parser$$parse_lex_from_string(input) {
  const lexbuf = moonbitlang$ulex$45$runtime$lexbuf$$StringLexbuf$from_string(input);
  const _bind = moonbitlang$ulex$lib$parser$$lex_eoi(() => moonbitlang$ulex$lib$parser$$token$143$(lexbuf), 0);
  let _func;
  if (_bind.$tag === 1) {
    const _ok = _bind;
    _func = _ok._0;
  } else {
    return _bind;
  }
  return new Result$Ok$31$(_func({ named_regexes: $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$14$ }));
}
function moonbitlang$core$builtin$$Hash$hash_combine$0$(_x_70, _x_71) {
  moonbitlang$core$builtin$$Hash$hash_combine$4$(_x_70, _x_71);
}
function moonbitlang$core$builtin$$Eq$equal$39$(_x_60, _x_61) {
  return moonbitlang$core$builtin$$Eq$equal$139$(_x_60, _x_61);
}
function moonbitlang$core$builtin$$Compare$compare$39$(_x_56, _x_57) {
  return moonbitlang$core$builtin$$Compare$compare$139$(_x_56, _x_57);
}
function moonbitlang$core$builtin$$Hash$hash_combine$39$(_x_52, _x_53) {
  moonbitlang$core$builtin$$Hash$hash_combine$139$(_x_52, _x_53);
}
function moonbitlang$ulex$lib$util$eof_char_set$$range(min, max) {
  return moonbitlang$ulex$lib$util$diet$$interval$0$(min, max);
}
function moonbitlang$ulex$lib$util$eof_char_set$$from_char_set(cset) {
  const result = { val: moonbitlang$ulex$lib$util$eof_char_set$$empty };
  const _bind = moonbitlang$ulex$lib$util$char_set$$CharSet$iter_ranges(cset);
  _bind((r) => {
    result.val = moonbitlang$core$builtin$$Add$add$39$(result.val, moonbitlang$ulex$lib$util$eof_char_set$$range(r._0, r._1));
    return 1;
  });
  return result.val;
}
function moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$is_empty(self) {
  return moonbitlang$ulex$lib$util$diet$$Tree$is_empty$0$(self);
}
function moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$contains2(self, x) {
  return moonbitlang$ulex$lib$util$diet$$Tree$contains$0$(self, x);
}
function moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$union(self, other) {
  return moonbitlang$ulex$lib$util$diet$$union$0$(self, other);
}
function moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$intersection(self, other) {
  return moonbitlang$ulex$lib$util$diet$$intersection$0$(self, other);
}
function moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$difference(self, other) {
  return moonbitlang$ulex$lib$util$diet$$difference$0$(self, other);
}
function moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$subset(self, other) {
  return moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$is_empty(moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$difference(self, other));
}
function moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$unsafe_choose(self) {
  return moonbitlang$ulex$lib$util$diet$$Tree$unsafe_choose$0$(self);
}
function moonbitlang$core$builtin$$Add$add$39$(self, other) {
  return moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$union(self, other);
}
function moonbitlang$core$builtin$$Sub$sub$39$(self, other) {
  return moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$difference(self, other);
}
function moonbitlang$core$builtin$$BitAnd$land$39$(self, other) {
  return moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$intersection(self, other);
}
function moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$iter_ranges(self) {
  return moonbitlang$ulex$lib$util$diet$$Tree$iter_intervals$0$(self);
}
function moonbitlang$ulex$lib$util$bit_array$$BitArray$unsafe_set(self, index, value) {
  const word_index = index / 32 | 0;
  const bit_index = index % 32 | 0;
  $bound_check(self, word_index);
  const word = self[word_index];
  const new_word = value !== 0 ? word | 1 << bit_index : word & ~(1 << bit_index);
  $bound_check(self, word_index);
  self[word_index] = new_word;
}
function moonbitlang$ulex$lib$util$bit_array$$BitArray$iter(self) {
  const _p = (yield_) => {
    const _end4 = self.length;
    let _tmp = 0;
    while (true) {
      const i = _tmp;
      if (i < _end4) {
        _L: {
          $bound_check(self, i);
          let word = self[i];
          if (word === 0) {
            break _L;
          }
          const base = Math.imul(i, 32) | 0;
          while (true) {
            if (word !== 0) {
              const bit_pos = $i32_ctz(word);
              const _bind = yield_(base + bit_pos | 0);
              if (_bind === 0) {
                return 0;
              }
              word = word & (word - 1 | 0);
              continue;
            } else {
              break;
            }
          }
          break _L;
        }
        _tmp = i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    return 1;
  };
  return _p;
}
function moonbitlang$ulex$lib$util$immut_map$$InorderIterator$move_left$145$(self, node) {
  let _tmp = node;
  while (true) {
    const _param = _tmp;
    if (_param.$tag === 0) {
      return;
    } else {
      const _Node = _param;
      const _self = self;
      moonbitlang$core$array$$Array$push$91$(_self, _Node);
      _tmp = _Node._2;
      continue;
    }
  }
}
function moonbitlang$ulex$lib$util$immut_map$$InorderIterator$new$145$(root) {
  const it = [];
  moonbitlang$ulex$lib$util$immut_map$$InorderIterator$move_left$145$(it, root);
  return it;
}
function moonbitlang$ulex$lib$util$immut_map$$InorderIterator$next$145$(self) {
  const _s = self;
  const _bind = moonbitlang$core$array$$Array$pop$91$(_s);
  if (_bind === undefined) {
    return undefined;
  } else {
    const _Some = _bind;
    const _curr = _Some;
    if (_curr.$tag === 1) {
      const _Node = _curr;
      moonbitlang$ulex$lib$util$immut_map$$InorderIterator$move_left$145$(self, _Node._3);
      return { _0: _Node._0, _1: _Node._1 };
    } else {
      return $panic();
    }
  }
}
function moonbitlang$ulex$lib$util$immut_map$$random_priority() {
  moonbitlang$ulex$lib$util$immut_map$$rand_state.val = (Math.imul(moonbitlang$ulex$lib$util$immut_map$$rand_state.val, 1103515245) | 0) + 12345 & 2147483647;
  return moonbitlang$ulex$lib$util$immut_map$$rand_state.val;
}
function moonbitlang$ulex$lib$util$immut_map$$T$add$145$(self, key, value) {
  if (self.$tag === 0) {
    return new $64$moonbitlang$47$ulex$47$lib$47$util$47$immut_map$46$T$Node$32$(key, value, $64$moonbitlang$47$ulex$47$lib$47$util$47$immut_map$46$T$Empty$32$, $64$moonbitlang$47$ulex$47$lib$47$util$47$immut_map$46$T$Empty$32$, moonbitlang$ulex$lib$util$immut_map$$random_priority());
  } else {
    const _Node = self;
    if (moonbitlang$core$builtin$$op_lt$76$(key, _Node._0)) {
      const left = moonbitlang$ulex$lib$util$immut_map$$T$add$145$(_Node._2, key, value);
      if (left.$tag === 1) {
        const _Node$2 = left;
        return _Node$2._4 < _Node._4 ? new $64$moonbitlang$47$ulex$47$lib$47$util$47$immut_map$46$T$Node$32$(_Node$2._0, _Node$2._1, _Node$2._2, new $64$moonbitlang$47$ulex$47$lib$47$util$47$immut_map$46$T$Node$32$(_Node._0, _Node._1, _Node$2._3, _Node._3, _Node._4), _Node$2._4) : new $64$moonbitlang$47$ulex$47$lib$47$util$47$immut_map$46$T$Node$32$(_Node._0, _Node._1, _Node$2, _Node._3, _Node._4);
      } else {
        return $panic();
      }
    } else {
      if (moonbitlang$core$builtin$$op_gt$76$(key, _Node._0)) {
        const right = moonbitlang$ulex$lib$util$immut_map$$T$add$145$(_Node._3, key, value);
        if (right.$tag === 1) {
          const _Node$2 = right;
          return _Node$2._4 < _Node._4 ? new $64$moonbitlang$47$ulex$47$lib$47$util$47$immut_map$46$T$Node$32$(_Node$2._0, _Node$2._1, new $64$moonbitlang$47$ulex$47$lib$47$util$47$immut_map$46$T$Node$32$(_Node._0, _Node._1, _Node._2, _Node$2._2, _Node._4), _Node$2._3, _Node$2._4) : new $64$moonbitlang$47$ulex$47$lib$47$util$47$immut_map$46$T$Node$32$(_Node._0, _Node._1, _Node._2, _Node$2, _Node._4);
        } else {
          return $panic();
        }
      } else {
        return new $64$moonbitlang$47$ulex$47$lib$47$util$47$immut_map$46$T$Node$32$(_Node._0, value, _Node._2, _Node._3, _Node._4);
      }
    }
  }
}
function moonbitlang$ulex$lib$util$immut_map$$T$get$145$(self, key) {
  let _tmp = self;
  while (true) {
    const self$2 = _tmp;
    if (self$2.$tag === 0) {
      return undefined;
    } else {
      const _Node = self$2;
      if (moonbitlang$core$builtin$$op_lt$76$(key, _Node._0)) {
        _tmp = _Node._2;
        continue;
      } else {
        if (moonbitlang$core$builtin$$op_gt$76$(key, _Node._0)) {
          _tmp = _Node._3;
          continue;
        } else {
          return _Node._1;
        }
      }
    }
  }
}
function moonbitlang$ulex$lib$util$immut_map$$iter$46$go$47$6088(yield_, t) {
  let _tmp = t;
  while (true) {
    const t$2 = _tmp;
    if (t$2.$tag === 0) {
      return 1;
    } else {
      const _Node = t$2;
      const _bind = moonbitlang$ulex$lib$util$immut_map$$iter$46$go$47$6088(yield_, _Node._2);
      if (_bind === 0) {
        return 0;
      } else {
        const _bind$2 = yield_({ _0: _Node._0, _1: _Node._1 });
        if (_bind$2 === 0) {
          return 0;
        } else {
          _tmp = _Node._3;
          continue;
        }
      }
    }
  }
}
function moonbitlang$ulex$lib$util$immut_map$$T$iter$145$(self) {
  const _p = (yield_) => moonbitlang$ulex$lib$util$immut_map$$iter$46$go$47$6088(yield_, self);
  return _p;
}
function moonbitlang$ulex$lib$util$immut_map$$from_iter$145$(iter) {
  const map = { val: $64$moonbitlang$47$ulex$47$lib$47$util$47$immut_map$46$T$Empty$32$ };
  iter((it) => {
    const _key = it._0;
    const _value = it._1;
    map.val = moonbitlang$ulex$lib$util$immut_map$$T$add$145$(map.val, _key, _value);
    return 1;
  });
  return map.val;
}
function moonbitlang$core$builtin$$Eq$equal$92$(self, other) {
  const iter = moonbitlang$ulex$lib$util$immut_map$$InorderIterator$new$145$(self);
  const iter1 = moonbitlang$ulex$lib$util$immut_map$$InorderIterator$new$145$(other);
  let _tmp = moonbitlang$ulex$lib$util$immut_map$$InorderIterator$next$145$(iter);
  let _tmp$2 = moonbitlang$ulex$lib$util$immut_map$$InorderIterator$next$145$(iter1);
  while (true) {
    const _param_0 = _tmp;
    const _param_1 = _tmp$2;
    if (_param_0 === undefined) {
      return _param_1 === undefined;
    } else {
      const _Some = _param_0;
      const _a = _Some;
      if (_param_1 === undefined) {
        return false;
      } else {
        const _Some$2 = _param_1;
        const _b = _Some$2;
        if (moonbitlang$core$builtin$$Eq$equal$42$(_a, _b)) {
          _tmp = moonbitlang$ulex$lib$util$immut_map$$InorderIterator$next$145$(iter);
          _tmp$2 = moonbitlang$ulex$lib$util$immut_map$$InorderIterator$next$145$(iter1);
          continue;
        } else {
          return false;
        }
      }
    }
  }
}
function moonbitlang$core$builtin$$Hash$hash_combine$92$(self, hasher) {
  const _bind = moonbitlang$ulex$lib$util$immut_map$$T$iter$145$(self);
  _bind((e) => {
    moonbitlang$core$builtin$$Hasher$combine$76$(hasher, e._0);
    moonbitlang$core$builtin$$Hasher$combine$93$(hasher, e._1);
    return 1;
  });
}
function moonbitlang$ulex$lib$util$hashmap2$$new$146$(capacity) {
  const bucket = $make_array_len_and_init(capacity, undefined);
  return { bucket: bucket, entry: undefined, bitmask: capacity - 1 | 0, size: 0 };
}
function moonbitlang$ulex$lib$util$hashmap2$$T$get_entry_with_hash$146$(self, key, hash) {
  const bucket = self.bucket;
  const bitmask = self.bitmask;
  const ideal_index = hash & bitmask;
  let _tmp = ideal_index;
  while (true) {
    const index = _tmp;
    $bound_check(bucket, index);
    const _bind = bucket[index];
    if (_bind === undefined) {
      return undefined;
    } else {
      const _Some = _bind;
      const _entry = _Some;
      if (_entry.hash === hash && moonbitlang$core$builtin$$Eq$equal$92$(_entry.key, key)) {
        return _entry;
      }
      if ((index - ideal_index | 0) > _entry.psl) {
        return undefined;
      }
      _tmp = index + 1 & bitmask;
      continue;
    }
  }
}
function moonbitlang$ulex$lib$util$hashmap2$$T$put_entry$146$(self, index, bitmask, entry) {
  const bucket = self.bucket;
  let _tmp = index;
  let _tmp$2 = entry;
  while (true) {
    const index$2 = _tmp;
    const entry$2 = _tmp$2;
    $bound_check(bucket, index$2);
    const _bind = bucket[index$2];
    if (_bind === undefined) {
      $bound_check(bucket, index$2);
      bucket[index$2] = entry$2;
      break;
    } else {
      const _Some = _bind;
      const _old_entry = _Some;
      let entry$3;
      if (entry$2.psl > _old_entry.psl) {
        $bound_check(bucket, index$2);
        bucket[index$2] = entry$2;
        entry$3 = _old_entry;
      } else {
        entry$3 = entry$2;
      }
      entry$3.psl = entry$3.psl + 1 | 0;
      _tmp = index$2 + 1 & bitmask;
      _tmp$2 = entry$3;
      continue;
    }
  }
}
function moonbitlang$ulex$lib$util$hashmap2$$T$grow$146$(self) {
  const capacity = Math.imul(self.bitmask + 1 | 0, 2) | 0;
  const bitmask = capacity - 1 | 0;
  const bucket = $make_array_len_and_init(capacity, undefined);
  self.bucket = bucket;
  self.bitmask = bitmask;
  let _tmp = self.entry;
  while (true) {
    const _param = _tmp;
    if (_param === undefined) {
      return;
    } else {
      const _Some = _param;
      const _entry = _Some;
      _entry.psl = 0;
      moonbitlang$ulex$lib$util$hashmap2$$T$put_entry$146$(self, _entry.hash & bitmask, bitmask, _entry);
      _tmp = _entry.prev;
      continue;
    }
  }
}
function moonbitlang$ulex$lib$util$hashmap2$$T$get_or_init$146$(self, key, init) {
  const hash = moonbitlang$core$builtin$$Hash$hash$106$(key);
  const _bind = moonbitlang$ulex$lib$util$hashmap2$$T$get_entry_with_hash$146$(self, key, hash);
  if (_bind === undefined) {
    if (self.size > (self.bitmask / 2 | 0)) {
      moonbitlang$ulex$lib$util$hashmap2$$T$grow$146$(self);
    }
    const value = init(key);
    const entry = { value: value, psl: 0, key: key, hash: hash, prev: self.entry };
    self.entry = entry;
    self.size = self.size + 1 | 0;
    moonbitlang$ulex$lib$util$hashmap2$$T$put_entry$146$(self, hash & self.bitmask, self.bitmask, entry);
    return value;
  } else {
    const _Some = _bind;
    const _entry = _Some;
    return _entry.value;
  }
}
function moonbitlang$core$builtin$$Compare$compare$101$(_x_675, _x_676) {
  if (_x_675 === 0) {
    if (_x_676 === 0) {
      return 0;
    } else {
      return -1;
    }
  } else {
    if (_x_676 === 0) {
      return 1;
    } else {
      return 0;
    }
  }
}
function moonbitlang$core$builtin$$Eq$equal$93$(_x_663, _x_664) {
  return moonbitlang$core$builtin$$Eq$equal$69$(_x_663, _x_664);
}
function moonbitlang$core$builtin$$Hash$hash_combine$93$(_x_659, _x_660) {
  moonbitlang$core$builtin$$Hash$hash_combine$69$(_x_659, _x_660);
}
function moonbitlang$core$builtin$$Compare$compare$93$(_x_655, _x_656) {
  return moonbitlang$core$builtin$$Compare$compare$69$(_x_655, _x_656);
}
function moonbitlang$core$builtin$$Eq$equal$99$(_x_635, _x_636) {
  if (_x_635.$tag === 0) {
    const _Dynamic_dfa = _x_635;
    const _$42$x0_637 = _Dynamic_dfa._0;
    if (_x_636.$tag === 0) {
      const _Dynamic_dfa$2 = _x_636;
      const _$42$y0_638 = _Dynamic_dfa$2._0;
      return _$42$x0_637._0 === _$42$y0_638._0 && _$42$x0_637._1 === _$42$y0_638._1;
    } else {
      return false;
    }
  } else {
    const _Static_dfa = _x_635;
    const _$42$x0_639 = _Static_dfa._0;
    if (_x_636.$tag === 1) {
      const _Static_dfa$2 = _x_636;
      const _$42$y0_640 = _Static_dfa$2._0;
      return moonbitlang$core$builtin$$Eq$equal$147$(_$42$x0_639, _$42$y0_640);
    } else {
      return false;
    }
  }
}
function moonbitlang$core$builtin$$Eq$equal$29$(_x_619, _x_620) {
  return moonbitlang$core$builtin$$Eq$equal$100$(_x_619, _x_620);
}
function moonbitlang$core$builtin$$Compare$compare$29$(_x_615, _x_616) {
  return moonbitlang$core$builtin$$Compare$compare$100$(_x_615, _x_616);
}
function moonbitlang$core$builtin$$Eq$equal$15$(_x_589, _x_590) {
  if (_x_589.$tag === 0) {
    const _Set = _x_589;
    const _$42$x0_591 = _Set._0;
    if (_x_590.$tag === 0) {
      const _Set$2 = _x_590;
      const _$42$y0_592 = _Set$2._0;
      return _$42$x0_591._0 === _$42$y0_592._0 && _$42$x0_591._1 === _$42$y0_592._1;
    } else {
      return false;
    }
  } else {
    const _Copy = _x_589;
    const _$42$x0_593 = _Copy._0;
    const _$42$x1_594 = _Copy._1;
    if (_x_590.$tag === 1) {
      const _Copy$2 = _x_590;
      const _$42$y0_595 = _Copy$2._0;
      const _$42$y1_596 = _Copy$2._1;
      return _$42$x0_593._0 === _$42$y0_595._0 && _$42$x0_593._1 === _$42$y0_595._1 && (_$42$x1_594._0 === _$42$y1_596._0 && _$42$x1_594._1 === _$42$y1_596._1);
    } else {
      return false;
    }
  }
}
function moonbitlang$core$builtin$$Compare$compare$15$(_x_571, _x_572) {
  if (_x_571.$tag === 0) {
    const _Set = _x_571;
    const _$42$x0_573 = _Set._0;
    if (_x_572.$tag === 0) {
      const _Set$2 = _x_572;
      const _$42$y0_574 = _Set$2._0;
      const _p = $compare_int(_$42$x0_573._0, _$42$y0_574._0);
      return _p === 0 ? $compare_int(_$42$x0_573._1, _$42$y0_574._1) : _p;
    } else {
      return -1;
    }
  } else {
    const _Copy = _x_571;
    const _$42$x0_575 = _Copy._0;
    const _$42$x1_576 = _Copy._1;
    if (_x_572.$tag === 0) {
      return 1;
    } else {
      const _Copy$2 = _x_572;
      const _$42$y0_577 = _Copy$2._0;
      const _$42$y1_578 = _Copy$2._1;
      const _p = $compare_int(_$42$x0_575._0, _$42$y0_577._0);
      const _bind = _p === 0 ? $compare_int(_$42$x0_575._1, _$42$y0_577._1) : _p;
      if (_bind === 0) {
        const _p$2 = $compare_int(_$42$x1_576._0, _$42$y1_578._0);
        return _p$2 === 0 ? $compare_int(_$42$x1_576._1, _$42$y1_578._1) : _p$2;
      } else {
        return _bind;
      }
    }
  }
}
function moonbitlang$core$builtin$$Eq$equal$147$(_x_515, _x_516) {
  if (_x_515.$tag === 0) {
    const _RelativeToStart = _x_515;
    const _$42$x0_517 = _RelativeToStart._0;
    if (_x_516.$tag === 0) {
      const _RelativeToStart$2 = _x_516;
      const _$42$y0_518 = _RelativeToStart$2._0;
      return _$42$x0_517 === _$42$y0_518;
    } else {
      return false;
    }
  } else {
    const _RelativeToEnd = _x_515;
    const _$42$x0_519 = _RelativeToEnd._0;
    if (_x_516.$tag === 1) {
      const _RelativeToEnd$2 = _x_516;
      const _$42$y0_520 = _RelativeToEnd$2._0;
      return _$42$x0_519 === _$42$y0_520;
    } else {
      return false;
    }
  }
}
function moonbitlang$ulex$lib$automaton$$get_regex_static_known_tag_positions(re) {
  let map = $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$22$;
  const queue = [{ _0: re, _1: 0 }];
  while (true) {
    const _bind = moonbitlang$core$array$$Array$pop$126$(queue);
    if (_bind === undefined) {
      break;
    } else {
      const _Some = _bind;
      const _x = _Some;
      const _re = _x._0;
      const _offset = _x._1;
      const _bind$2 = _re.desc;
      switch (_bind$2.$tag) {
        case 3: {
          break;
        }
        case 0: {
          break;
        }
        case 1: {
          break;
        }
        case 6: {
          const _Capture = _bind$2;
          const _re$2 = _Capture._0;
          const _name = _Capture._1;
          moonbitlang$core$array$$Array$push$126$(queue, { _0: _re$2, _1: _offset });
          map = moonbitlang$core$immut$sorted_map$$SortedMap$add$61$(map, { _0: _name, _1: 1 }, new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$StaticKnownTagPosition$RelativeToEnd(_offset));
          const _bind$3 = _re$2.len;
          if (_bind$3 === undefined) {
          } else {
            const _Some$2 = _bind$3;
            const _len = _Some$2;
            map = moonbitlang$core$immut$sorted_map$$SortedMap$add$61$(map, { _0: _name, _1: 0 }, new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$StaticKnownTagPosition$RelativeToEnd(_offset - _len | 0));
          }
          break;
        }
        case 5: {
          const _Concat = _bind$2;
          const _re1 = _Concat._0;
          const _re2 = _Concat._1;
          moonbitlang$core$array$$Array$push$126$(queue, { _0: _re2, _1: _offset });
          const _bind$4 = _re2.len;
          if (_bind$4 === undefined) {
          } else {
            const _Some$2 = _bind$4;
            const _len = _Some$2;
            moonbitlang$core$array$$Array$push$126$(queue, { _0: _re1, _1: _offset - _len | 0 });
          }
          break;
        }
        case 4: {
          const _Alter = _bind$2;
          const _re1$2 = _Alter._0;
          const _re2$2 = _Alter._1;
          moonbitlang$core$array$$Array$push$126$(queue, { _0: _re1$2, _1: _offset });
          moonbitlang$core$array$$Array$push$126$(queue, { _0: _re2$2, _1: _offset });
          break;
        }
      }
      continue;
    }
  }
  const queue$2 = [{ _0: re, _1: 0 }];
  while (true) {
    const _bind = moonbitlang$core$array$$Array$pop$126$(queue$2);
    if (_bind === undefined) {
      break;
    } else {
      const _Some = _bind;
      const _x = _Some;
      const _re = _x._0;
      const _offset = _x._1;
      const _bind$2 = _re.desc;
      switch (_bind$2.$tag) {
        case 3: {
          break;
        }
        case 0: {
          break;
        }
        case 1: {
          break;
        }
        case 6: {
          const _Capture = _bind$2;
          const _re$2 = _Capture._0;
          const _name = _Capture._1;
          moonbitlang$core$array$$Array$push$126$(queue$2, { _0: _re$2, _1: _offset });
          map = moonbitlang$core$immut$sorted_map$$SortedMap$add$61$(map, { _0: _name, _1: 0 }, new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$StaticKnownTagPosition$RelativeToStart(_offset));
          const _bind$3 = _re$2.len;
          if (_bind$3 === undefined) {
          } else {
            const _Some$2 = _bind$3;
            const _len = _Some$2;
            map = moonbitlang$core$immut$sorted_map$$SortedMap$add$61$(map, { _0: _name, _1: 1 }, new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$StaticKnownTagPosition$RelativeToStart(_offset + _len | 0));
          }
          break;
        }
        case 5: {
          const _Concat = _bind$2;
          const _re1 = _Concat._0;
          const _re2 = _Concat._1;
          moonbitlang$core$array$$Array$push$126$(queue$2, { _0: _re1, _1: _offset });
          const _bind$4 = _re1.len;
          if (_bind$4 === undefined) {
          } else {
            const _Some$2 = _bind$4;
            const _len = _Some$2;
            moonbitlang$core$array$$Array$push$126$(queue$2, { _0: _re2, _1: _offset + _len | 0 });
          }
          break;
        }
        case 4: {
          const _Alter = _bind$2;
          const _re1$2 = _Alter._0;
          const _re2$2 = _Alter._1;
          moonbitlang$core$array$$Array$push$126$(queue$2, { _0: _re1$2, _1: _offset });
          moonbitlang$core$array$$Array$push$126$(queue$2, { _0: _re2$2, _1: _offset });
          break;
        }
      }
      continue;
    }
  }
  return map;
}
function moonbitlang$ulex$lib$automaton$$get_regex_captures(re, lowered_re) {
  const vars = moonbitlang$ulex$lib$regex$$get_capture_vars(re);
  const static_tag_positions = moonbitlang$ulex$lib$automaton$$get_regex_static_known_tag_positions(lowered_re);
  const _bind = moonbitlang$core$immut$sorted_map$$SortedMap$iter$60$(vars);
  return moonbitlang$core$builtin$$Iter$to_array$127$((_p) => _bind((_p$2) => {
    const _name = _p$2._0;
    const _re_class = _p$2._1;
    let var_type;
    if (_re_class === 0) {
      var_type = 0;
    } else {
      var_type = 1;
    }
    const start_pos = moonbitlang$core$immut$sorted_map$$SortedMap$get$61$(static_tag_positions, { _0: _name, _1: 0 });
    const end_pos = moonbitlang$core$immut$sorted_map$$SortedMap$get$61$(static_tag_positions, { _0: _name, _1: 1 });
    return _p({ _0: _name, _1: { _0: var_type, _1: { _0: start_pos, _1: end_pos } } });
  }));
}
function moonbitlang$ulex$lib$automaton$$NFAEpsClosure$new(nfa) {
  const _p = nfa.node_count;
  const _p$2 = (_p + 31 | 0) / 32 | 0;
  const _tmp = $make_array_len_and_init(_p$2, 0);
  return { nfa: nfa, eps: _tmp, tags: $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$20$, nodes: [] };
}
function moonbitlang$ulex$lib$automaton$$NFAEpsClosure$add$46$inner(self, node, tags) {
  const _p = self.eps;
  const _p$2 = node.num;
  const _tmp = _p$2 / 32 | 0;
  $bound_check(_p, _tmp);
  if ((_p[_tmp] >> (_p$2 % 32 | 0) & 1) !== 0) {
    const _p$3 = moonbitlang$core$immut$sorted_map$$SortedMap$get$59$(self.tags, node);
    const _p$4 = $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$;
    let prev_tags;
    if (_p$3 === undefined) {
      prev_tags = _p$4;
    } else {
      const _p$5 = _p$3;
      prev_tags = _p$5;
    }
    const changed = !moonbitlang$core$immut$sorted_set$$SortedSet$subset$4$(tags, prev_tags);
    if (changed) {
      self.tags = moonbitlang$core$immut$sorted_map$$SortedMap$add$59$(self.tags, node, moonbitlang$core$immut$sorted_set$$SortedSet$union$4$(prev_tags, tags));
    }
    return changed;
  } else {
    if (!moonbitlang$core$immut$sorted_set$$SortedSet$is_empty$4$(tags)) {
      self.tags = moonbitlang$core$immut$sorted_map$$SortedMap$add$59$(self.tags, node, tags);
    }
    moonbitlang$ulex$lib$util$bit_array$$BitArray$unsafe_set(self.eps, node.num, 1);
    if (self.nodes.length < 5) {
      moonbitlang$core$array$$Array$push$76$(self.nodes, node);
    }
    return true;
  }
}
function moonbitlang$ulex$lib$automaton$$NFAEpsClosure$add(self, node, tags$46$opt) {
  let tags;
  if (tags$46$opt === undefined) {
    tags = $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$;
  } else {
    const _Some = tags$46$opt;
    tags = _Some;
  }
  return moonbitlang$ulex$lib$automaton$$NFAEpsClosure$add$46$inner(self, node, tags);
}
function moonbitlang$ulex$lib$automaton$$NFAEpsClosure$get(self, node) {
  const _p = self.eps;
  const _p$2 = node.num;
  const _tmp = _p$2 / 32 | 0;
  $bound_check(_p, _tmp);
  if ((_p[_tmp] >> (_p$2 % 32 | 0) & 1) === 0) {
    return undefined;
  } else {
    const _p$3 = moonbitlang$core$immut$sorted_map$$SortedMap$get$59$(self.tags, node);
    const _p$4 = $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$;
    if (_p$3 === undefined) {
      return _p$4;
    } else {
      const _p$5 = _p$3;
      return _p$5;
    }
  }
}
function moonbitlang$ulex$lib$automaton$$NFAEpsClosure$iter(self) {
  if (self.nodes.length < 5) {
    const _bind = moonbitlang$core$array$$Array$iter$76$(self.nodes);
    return (_p) => _bind((_p$2) => {
      const _p$3 = moonbitlang$core$immut$sorted_map$$SortedMap$get$59$(self.tags, _p$2);
      const _p$4 = $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$;
      let _tmp;
      if (_p$3 === undefined) {
        _tmp = _p$4;
      } else {
        const _p$5 = _p$3;
        _tmp = _p$5;
      }
      return _p({ _0: _p$2, _1: _tmp });
    });
  } else {
    const _bind = moonbitlang$ulex$lib$util$bit_array$$BitArray$iter(self.eps);
    return (_p) => _bind((_p$2) => {
      const _tmp = moonbitlang$core$array$$Array$op_get$76$(self.nfa.graph, _p$2);
      const _p$3 = moonbitlang$core$immut$sorted_map$$SortedMap$get$59$(self.tags, moonbitlang$core$array$$Array$op_get$76$(self.nfa.graph, _p$2));
      const _p$4 = $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$;
      let _tmp$2;
      if (_p$3 === undefined) {
        _tmp$2 = _p$4;
      } else {
        const _p$5 = _p$3;
        _tmp$2 = _p$5;
      }
      return _p({ _0: _tmp, _1: _tmp$2 });
    });
  }
}
function moonbitlang$ulex$lib$automaton$$get_eps_closure$46$get_tags$124$389(result, n) {
  const _p = moonbitlang$ulex$lib$automaton$$NFAEpsClosure$get(result, n);
  const _p$2 = $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$;
  if (_p === undefined) {
    return _p$2;
  } else {
    const _p$3 = _p;
    return _p$3;
  }
}
function moonbitlang$ulex$lib$automaton$$NFA$get_eps_closure(self) {
  const _p = self.graph;
  const _p$2 = new Array(_p.length);
  const _p$3 = _p.length;
  let _tmp = 0;
  while (true) {
    const _p$4 = _tmp;
    if (_p$4 < _p$3) {
      const _p$5 = _p[_p$4];
      const _p$6 = moonbitlang$ulex$lib$automaton$$NFAEpsClosure$new(self);
      moonbitlang$ulex$lib$automaton$$NFAEpsClosure$add(_p$6, _p$5, undefined);
      const _p$7 = moonbitlang$core$queue$$from_array$76$([_p$5]);
      while (true) {
        const _p$8 = moonbitlang$core$queue$$Queue$pop$76$(_p$7);
        if (_p$8 === undefined) {
          break;
        } else {
          const _p$9 = _p$8;
          const _p$10 = _p$9;
          const _p$11 = moonbitlang$ulex$lib$automaton$$get_eps_closure$46$get_tags$124$389(_p$6, _p$10);
          const _p$12 = _p$10.eps;
          const _p$13 = _p$12.length;
          let _tmp$2 = 0;
          while (true) {
            const _p$14 = _tmp$2;
            if (_p$14 < _p$13) {
              const _p$15 = _p$12[_p$14];
              const _p$16 = moonbitlang$core$immut$sorted_set$$SortedSet$union$4$(moonbitlang$ulex$lib$automaton$$get_eps_closure$46$get_tags$124$389(_p$6, _p$15), _p$11);
              const _p$17 = moonbitlang$ulex$lib$automaton$$NFAEpsClosure$add$46$inner(_p$6, _p$15, _p$16);
              if (_p$17) {
                moonbitlang$core$queue$$Queue$push$76$(_p$7, _p$15);
              }
              _tmp$2 = _p$14 + 1 | 0;
              continue;
            } else {
              break;
            }
          }
          const _p$14 = _p$10.tagged_eps;
          const _p$15 = _p$14.length;
          let _tmp$3 = 0;
          while (true) {
            const _p$16 = _tmp$3;
            if (_p$16 < _p$15) {
              const _p$17 = _p$14[_p$16];
              const _p$18 = _p$17._0;
              const _p$19 = _p$17._1;
              const _p$20 = moonbitlang$core$immut$sorted_set$$SortedSet$add$4$(moonbitlang$core$immut$sorted_set$$SortedSet$union$4$(moonbitlang$ulex$lib$automaton$$get_eps_closure$46$get_tags$124$389(_p$6, _p$18), _p$11), _p$19);
              const _p$21 = moonbitlang$ulex$lib$automaton$$NFAEpsClosure$add$46$inner(_p$6, _p$18, _p$20);
              if (_p$21) {
                moonbitlang$core$queue$$Queue$push$76$(_p$7, _p$18);
              }
              _tmp$3 = _p$16 + 1 | 0;
              continue;
            } else {
              break;
            }
          }
          continue;
        }
      }
      _p$2[_p$4] = _p$6;
      _tmp = _p$4 + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return _p$2;
}
function moonbitlang$core$builtin$$Hash$hash_combine$76$(self, hasher) {
  moonbitlang$core$builtin$$Hasher$combine_int(hasher, self.num);
}
function moonbitlang$ulex$lib$automaton$$NFA$new_nfa() {
  return { graph: [], end_nodes: moonbitlang$core$builtin$$Map$new$46$inner$58$(8), pattern_captures: [], start_node: -1, node_count: 0, tag_count: 0 };
}
function moonbitlang$ulex$lib$automaton$$NFA$new_node(self) {
  const new_id = self.node_count;
  self.node_count = self.node_count + 1 | 0;
  const node = { num: new_id, eps: [], tagged_eps: [], trans: [] };
  moonbitlang$core$array$$Array$push$76$(self.graph, node);
  return (new_id + 1 | 0) === self.graph.length ? node : $panic();
}
function moonbitlang$ulex$lib$automaton$$NFA$add_edge(self, from, s, to) {
  switch (s.$tag) {
    case 0: {
      moonbitlang$core$array$$Array$push$76$(from.eps, to);
      return;
    }
    case 1: {
      const _EpsWithTag = s;
      const _tag = _EpsWithTag._0;
      moonbitlang$core$array$$Array$push$128$(from.tagged_eps, { _0: to, _1: _tag });
      return;
    }
    default: {
      const _EChar = s;
      const _c = _EChar._0;
      moonbitlang$core$array$$Array$push$110$(from.trans, { _0: _c, _1: to });
      return;
    }
  }
}
function moonbitlang$ulex$lib$automaton$$NFA$register_regex_rec(self, node, re, name2pos) {
  const new_node = moonbitlang$ulex$lib$automaton$$NFA$new_node(self);
  moonbitlang$ulex$lib$automaton$$NFA$add_edge(self, node, $64$moonbitlang$47$ulex$47$lib$47$automaton$46$Input$Eps, new_node);
  const _bind = re.desc;
  let final_;
  switch (_bind.$tag) {
    case 0: {
      const next_node = moonbitlang$ulex$lib$automaton$$NFA$new_node(self);
      moonbitlang$ulex$lib$automaton$$NFA$add_edge(self, new_node, new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$Input$EChar(moonbitlang$ulex$lib$util$eof_char_set$$eof), next_node);
      final_ = next_node;
      break;
    }
    case 1: {
      const _Character = _bind;
      const _cset = _Character._0;
      const next_node$2 = moonbitlang$ulex$lib$automaton$$NFA$new_node(self);
      moonbitlang$ulex$lib$automaton$$NFA$add_edge(self, new_node, new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$Input$EChar(moonbitlang$ulex$lib$util$eof_char_set$$from_char_set(_cset)), next_node$2);
      final_ = next_node$2;
      break;
    }
    case 3: {
      const next_node$3 = moonbitlang$ulex$lib$automaton$$NFA$new_node(self);
      moonbitlang$ulex$lib$automaton$$NFA$add_edge(self, new_node, $64$moonbitlang$47$ulex$47$lib$47$automaton$46$Input$Eps, next_node$3);
      final_ = next_node$3;
      break;
    }
    case 2: {
      const _Repetition = _bind;
      const _re = _Repetition._0;
      const final_$2 = moonbitlang$ulex$lib$automaton$$NFA$register_regex_rec(self, new_node, _re, name2pos);
      moonbitlang$ulex$lib$automaton$$NFA$add_edge(self, final_$2, $64$moonbitlang$47$ulex$47$lib$47$automaton$46$Input$Eps, new_node);
      final_ = final_$2;
      break;
    }
    case 5: {
      const _Concat = _bind;
      const _re1 = _Concat._0;
      const _re2 = _Concat._1;
      const mid = moonbitlang$ulex$lib$automaton$$NFA$register_regex_rec(self, new_node, _re1, name2pos);
      final_ = moonbitlang$ulex$lib$automaton$$NFA$register_regex_rec(self, mid, _re2, name2pos);
      break;
    }
    case 4: {
      const _Alter = _bind;
      const _re1$2 = _Alter._0;
      const _re2$2 = _Alter._1;
      const final_1 = moonbitlang$ulex$lib$automaton$$NFA$register_regex_rec(self, new_node, _re1$2, name2pos);
      const final_2 = moonbitlang$ulex$lib$automaton$$NFA$register_regex_rec(self, new_node, _re2$2, name2pos);
      const final_$3 = moonbitlang$ulex$lib$automaton$$NFA$new_node(self);
      moonbitlang$ulex$lib$automaton$$NFA$add_edge(self, final_1, $64$moonbitlang$47$ulex$47$lib$47$automaton$46$Input$Eps, final_$3);
      moonbitlang$ulex$lib$automaton$$NFA$add_edge(self, final_2, $64$moonbitlang$47$ulex$47$lib$47$automaton$46$Input$Eps, final_$3);
      final_ = final_$3;
      break;
    }
    default: {
      const _Capture = _bind;
      const _re$2 = _Capture._0;
      const _name = _Capture._1;
      const start = moonbitlang$ulex$lib$automaton$$NFA$new_node(self);
      const final_$4 = moonbitlang$ulex$lib$automaton$$NFA$new_node(self);
      const tail = moonbitlang$ulex$lib$automaton$$NFA$register_regex_rec(self, start, _re$2, name2pos);
      const _bind$2 = name2pos(_name);
      const _begin_tag = _bind$2._0;
      const _end_tag = _bind$2._1;
      let _tmp;
      if (_begin_tag.$tag === 0) {
        const _Dynamic_nfa = _begin_tag;
        const _begin_tag$2 = _Dynamic_nfa._0;
        _tmp = new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$Input$EpsWithTag(_begin_tag$2);
      } else {
        _tmp = $64$moonbitlang$47$ulex$47$lib$47$automaton$46$Input$Eps;
      }
      moonbitlang$ulex$lib$automaton$$NFA$add_edge(self, new_node, _tmp, start);
      let _tmp$2;
      if (_end_tag.$tag === 0) {
        const _Dynamic_nfa = _end_tag;
        const _end_tag$2 = _Dynamic_nfa._0;
        _tmp$2 = new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$Input$EpsWithTag(_end_tag$2);
      } else {
        _tmp$2 = $64$moonbitlang$47$ulex$47$lib$47$automaton$46$Input$Eps;
      }
      moonbitlang$ulex$lib$automaton$$NFA$add_edge(self, tail, _tmp$2, final_$4);
      final_ = final_$4;
    }
  }
  const new_final = moonbitlang$ulex$lib$automaton$$NFA$new_node(self);
  moonbitlang$ulex$lib$automaton$$NFA$add_edge(self, final_, $64$moonbitlang$47$ulex$47$lib$47$automaton$46$Input$Eps, new_final);
  return new_final;
}
function moonbitlang$ulex$lib$automaton$$NFA$register_regex(self, node, re, name2pos) {
  const final_ = moonbitlang$ulex$lib$automaton$$NFA$register_regex_rec(self, node, re, name2pos);
  const id = self.pattern_captures.length;
  moonbitlang$core$builtin$$Map$set$58$(self.end_nodes, final_.num, id);
}
function moonbitlang$ulex$lib$automaton$$from_patterns$46$alloc_tag$124$354(nfa) {
  const tag = nfa.tag_count;
  nfa.tag_count = nfa.tag_count + 1 | 0;
  return tag;
}
function moonbitlang$ulex$lib$automaton$$NFA$from_patterns(patterns, encoding) {
  const nfa = moonbitlang$ulex$lib$automaton$$NFA$new_nfa();
  const node = moonbitlang$ulex$lib$automaton$$NFA$new_node(nfa);
  nfa.start_node = node.num;
  const _len = patterns.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const pattern = patterns[_i];
      const _re = pattern._0;
      const _rest_binder = pattern._1;
      const lowered_re = moonbitlang$ulex$lib$regex$$lower(_re, encoding);
      const _p = moonbitlang$ulex$lib$automaton$$get_regex_captures(_re, lowered_re);
      const _p$2 = new Array(_p.length);
      const _p$3 = _p.length;
      let _tmp$2 = 0;
      while (true) {
        const _p$4 = _tmp$2;
        if (_p$4 < _p$3) {
          const _p$5 = _p[_p$4];
          const _p$6 = _p$5._0;
          const _p$7 = _p$5._1;
          const _p$8 = _p$7._0;
          const _p$9 = _p$7._1;
          const _p$10 = _p$9._0;
          const _p$11 = _p$9._1;
          let _p$12;
          if (_p$10 === undefined) {
            _p$12 = new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$NFACapturePosition$Dynamic_nfa(moonbitlang$ulex$lib$automaton$$from_patterns$46$alloc_tag$124$354(nfa));
          } else {
            const _p$13 = _p$10;
            const _p$14 = _p$13;
            _p$12 = new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$NFACapturePosition$Static_nfa(_p$14);
          }
          let _p$13;
          if (_p$11 === undefined) {
            _p$13 = new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$NFACapturePosition$Dynamic_nfa(moonbitlang$ulex$lib$automaton$$from_patterns$46$alloc_tag$124$354(nfa));
          } else {
            const _p$14 = _p$11;
            const _p$15 = _p$14;
            _p$13 = new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$NFACapturePosition$Static_nfa(_p$15);
          }
          _p$2[_p$4] = { _0: { _0: _p$6, _1: _p$8 }, _1: { _0: _p$12, _1: _p$13 } };
          _tmp$2 = _p$4 + 1 | 0;
          continue;
        } else {
          break;
        }
      }
      const capture_names = _p$2;
      const _bind = moonbitlang$core$array$$Array$iter$111$(capture_names);
      const map = moonbitlang$core$builtin$$Map$from_iter$121$((_p$4) => _bind((_p$5) => {
        const _x = _p$5._0;
        const _name = _x._0;
        const _x$2 = _p$5._1;
        const _begin_tag = _x$2._0;
        const _end_tag = _x$2._1;
        return _p$4({ _0: _name, _1: { _0: _begin_tag, _1: _end_tag } });
      }));
      moonbitlang$ulex$lib$automaton$$NFA$register_regex(nfa, node, lowered_re, (x) => {
        const _p$4 = moonbitlang$core$builtin$$Map$get$121$(map, x);
        if (_p$4 === undefined) {
          return $panic();
        } else {
          const _p$5 = _p$4;
          return _p$5;
        }
      });
      moonbitlang$core$array$$Array$push$88$(nfa.pattern_captures, { _0: capture_names, _1: _rest_binder });
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return nfa;
}
function moonbitlang$ulex$lib$automaton$$minimize_tags$46$map_capture_pos$124$286(tag_to_new_tag, pos) {
  _L: {
    if (pos.$tag === 0) {
      const _Dynamic_dfa = pos;
      const _tag_var = _Dynamic_dfa._0;
      const _bind = moonbitlang$core$builtin$$Map$get$58$(tag_to_new_tag, _tag_var._0);
      if (_bind === undefined) {
        break _L;
      } else {
        const _Some = _bind;
        const _new_tag = _Some;
        return new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$DFACapturePosition$Dynamic_dfa({ _0: _new_tag, _1: _tag_var._1 });
      }
    } else {
      break _L;
    }
  }
  return pos;
}
function moonbitlang$ulex$lib$automaton$$DFA$minimize_tags(self) {
  const tag_to_state_actions_map = moonbitlang$core$builtin$$Map$from_array$115$([]);
  const _bind = moonbitlang$core$builtin$$Map$iter2$120$(self.tag_actions);
  _bind((node, action) => {
    const _arr = action;
    const _len = _arr.length;
    let _tmp = 0;
    while (true) {
      const _i = _tmp;
      if (_i < _len) {
        const op = _arr[_i];
        let dest;
        _L: {
          if (op.$tag === 0) {
            const _Set = op;
            const _dest = _Set._0;
            dest = _dest;
            break _L;
          } else {
            const _Copy = op;
            const _dest = _Copy._0;
            dest = _dest;
            break _L;
          }
        }
        let op2;
        if (op.$tag === 0) {
          const _Set = op;
          const _dest = _Set._0;
          op2 = new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$TagOp$Set({ _0: -1, _1: _dest._1 });
        } else {
          const _Copy = op;
          const _dest = _Copy._0;
          const _src = _Copy._1;
          op2 = new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$TagOp$Copy({ _0: -1, _1: _dest._1 }, { _0: -1, _1: _src._1 });
        }
        const _bind$2 = moonbitlang$core$builtin$$Map$get$115$(tag_to_state_actions_map, dest._0);
        if (_bind$2 === undefined) {
          moonbitlang$core$builtin$$Map$op_set$115$(tag_to_state_actions_map, dest._0, moonbitlang$core$immut$sorted_map$$SortedMap$add$55$($64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$16$, node, [op2]));
        } else {
          const _Some = _bind$2;
          const _map = _Some;
          const _bind$3 = moonbitlang$core$immut$sorted_map$$SortedMap$get$55$(_map, node);
          if (_bind$3.$tag === 0) {
            moonbitlang$core$builtin$$Map$op_set$115$(tag_to_state_actions_map, dest._0, moonbitlang$core$immut$sorted_map$$SortedMap$add$55$(_map, node, [op2]));
          } else {
            const _Some$2 = _bind$3;
            const _ops = _Some$2._0;
            moonbitlang$core$array$$Array$push$15$(_ops, op2);
          }
        }
        _tmp = _i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    return 1;
  });
  const _bind$2 = moonbitlang$core$builtin$$Map$iter2$115$(tag_to_state_actions_map);
  _bind$2((__, state_actions_map) => {
    const _bind$3 = moonbitlang$core$immut$sorted_map$$SortedMap$iter2$55$(state_actions_map);
    _bind$3((__$2, ops) => {
      moonbitlang$core$array$$Array$sort$15$(ops);
      return 1;
    });
    return 1;
  });
  const groups = moonbitlang$core$sorted_map$$new$71$();
  const _bind$3 = moonbitlang$core$builtin$$Map$iter2$115$(tag_to_state_actions_map);
  _bind$3((tag, state_actions_map) => {
    const _p = moonbitlang$core$sorted_map$$SortedMap$get$71$(groups, state_actions_map);
    const _p$2 = $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$;
    let _tmp;
    if (_p === undefined) {
      _tmp = _p$2;
    } else {
      const _p$3 = _p;
      _tmp = _p$3;
    }
    moonbitlang$core$sorted_map$$SortedMap$op_set$71$(groups, state_actions_map, moonbitlang$core$immut$sorted_set$$SortedSet$add$4$(_tmp, tag));
    return 1;
  });
  const tag_to_new_tag = moonbitlang$core$builtin$$Map$from_array$58$([]);
  const num_tags = { val: 0 };
  const _bind$4 = moonbitlang$core$sorted_map$$SortedMap$iter2$71$(groups);
  _bind$4((__, tags) => {
    const new_tag = num_tags.val;
    num_tags.val = num_tags.val + 1 | 0;
    const _bind$5 = moonbitlang$core$immut$sorted_set$$SortedSet$iter$4$(tags);
    _bind$5((tag) => {
      moonbitlang$core$builtin$$Map$op_set$58$(tag_to_new_tag, tag, new_tag);
      return 1;
    });
    return 1;
  });
  const _tmp = self.graph;
  const _tmp$2 = self.start_node;
  const _bind$5 = moonbitlang$core$builtin$$Map$iter$120$(self.tag_actions);
  const _tmp$3 = moonbitlang$core$builtin$$Map$from_iter$120$((_p) => _bind$5((_p$2) => {
    const _node_id = _p$2._0;
    const _action = _p$2._1;
    const _p$3 = new Array(_action.length);
    const _p$4 = _action.length;
    let _tmp$4 = 0;
    while (true) {
      const _p$5 = _tmp$4;
      if (_p$5 < _p$4) {
        const _p$6 = _action[_p$5];
        let _tmp$5;
        if (_p$6.$tag === 0) {
          const _p$7 = _p$6;
          const _p$8 = _p$7._0;
          const _p$9 = moonbitlang$core$builtin$$Map$get$58$(tag_to_new_tag, _p$8._0);
          let _tmp$6;
          if (_p$9 === undefined) {
            _tmp$6 = $panic();
          } else {
            const _p$10 = _p$9;
            _tmp$6 = _p$10;
          }
          const _tmp$7 = _tmp$6;
          _tmp$5 = new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$TagOp$Set({ _0: _tmp$7, _1: _p$8._1 });
        } else {
          const _p$7 = _p$6;
          const _p$8 = _p$7._0;
          const _p$9 = _p$7._1;
          const _p$10 = moonbitlang$core$builtin$$Map$get$58$(tag_to_new_tag, _p$8._0);
          let _tmp$6;
          if (_p$10 === undefined) {
            _tmp$6 = $panic();
          } else {
            const _p$11 = _p$10;
            _tmp$6 = _p$11;
          }
          const _tmp$7 = _tmp$6;
          const _p$11 = moonbitlang$core$builtin$$Map$get$58$(tag_to_new_tag, _p$9._0);
          let _tmp$8;
          if (_p$11 === undefined) {
            _tmp$8 = $panic();
          } else {
            const _p$12 = _p$11;
            _tmp$8 = _p$12;
          }
          const _tmp$9 = _tmp$8;
          _tmp$5 = new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$TagOp$Copy({ _0: _tmp$7, _1: _p$8._1 }, { _0: _tmp$9, _1: _p$9._1 });
        }
        _p$3[_p$5] = _tmp$5;
        _tmp$4 = _p$5 + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    const ops = _p$3;
    moonbitlang$core$array$$Array$dedup$15$(ops);
    return _p({ _0: _node_id, _1: ops });
  }));
  const _bind$6 = moonbitlang$core$builtin$$Map$iter$116$(self.end_nodes);
  const _tmp$4 = moonbitlang$core$builtin$$Map$from_iter$116$((_p) => _bind$6((_p$2) => {
    const _node_id = _p$2._0;
    const _x = _p$2._1;
    const _pattern_id = _x._0;
    const _captures = _x._1;
    const _p$3 = new Array(_captures.length);
    const _p$4 = _captures.length;
    let _tmp$5 = 0;
    while (true) {
      const _p$5 = _tmp$5;
      if (_p$5 < _p$4) {
        const _p$6 = _captures[_p$5];
        const _p$7 = _p$6._0;
        const _p$8 = _p$6._1;
        _p$3[_p$5] = { _0: moonbitlang$ulex$lib$automaton$$minimize_tags$46$map_capture_pos$124$286(tag_to_new_tag, _p$7), _1: moonbitlang$ulex$lib$automaton$$minimize_tags$46$map_capture_pos$124$286(tag_to_new_tag, _p$8) };
        _tmp$5 = _p$5 + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    return _p({ _0: _node_id, _1: { _0: _pattern_id, _1: _p$3 } });
  }));
  const _tmp$5 = self.pattern_captures;
  return { graph: _tmp, start_node: _tmp$2, tag_actions: _tmp$3, end_nodes: _tmp$4, pattern_captures: _tmp$5, node_count: self.node_count };
}
function moonbitlang$ulex$lib$automaton$$collect_symbols$46$check_add$124$171(new_temp_char_sets, temp_char_set) {
  if (!moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$is_empty(temp_char_set)) {
    new_temp_char_sets.val = moonbitlang$core$immut$sorted_set$$SortedSet$add$39$(new_temp_char_sets.val, temp_char_set);
    return;
  } else {
    return;
  }
}
function moonbitlang$ulex$lib$automaton$$collect_symbols(dfa) {
  let char_sets = $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$7$;
  const _arr = dfa.graph;
  const _len = _arr.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const trans = _arr[_i];
      const _len$2 = trans.length;
      let _tmp$2 = 0;
      while (true) {
        const _i$2 = _tmp$2;
        if (_i$2 < _len$2) {
          const tran = trans[_i$2];
          const _input = tran._0;
          char_sets = moonbitlang$core$immut$sorted_set$$SortedSet$add$39$(char_sets, _input);
          _tmp$2 = _i$2 + 1 | 0;
          continue;
        } else {
          break;
        }
      }
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  const all_char_set = { val: moonbitlang$ulex$lib$util$eof_char_set$$empty };
  const temp_char_sets = { val: $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$7$ };
  const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$iter$39$(char_sets);
  _bind((char_set) => {
    const new_temp_char_sets = { val: $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$7$ };
    moonbitlang$ulex$lib$automaton$$collect_symbols$46$check_add$124$171(new_temp_char_sets, moonbitlang$core$builtin$$Sub$sub$39$(char_set, all_char_set.val));
    const _bind$2 = moonbitlang$core$immut$sorted_set$$SortedSet$iter$39$(temp_char_sets.val);
    _bind$2((temp_char_set) => {
      moonbitlang$ulex$lib$automaton$$collect_symbols$46$check_add$124$171(new_temp_char_sets, moonbitlang$core$builtin$$BitAnd$land$39$(temp_char_set, char_set));
      moonbitlang$ulex$lib$automaton$$collect_symbols$46$check_add$124$171(new_temp_char_sets, moonbitlang$core$builtin$$Sub$sub$39$(temp_char_set, char_set));
      return 1;
    });
    all_char_set.val = moonbitlang$core$builtin$$Add$add$39$(all_char_set.val, char_set);
    temp_char_sets.val = new_temp_char_sets.val;
    return 1;
  });
  const next_symbol_id = { val: 0 };
  return moonbitlang$core$immut$sorted_set$$SortedSet$map$45$(temp_char_sets.val, (char_set) => {
    const symbol = { id: next_symbol_id.val, char_set: char_set };
    next_symbol_id.val = next_symbol_id.val + 1 | 0;
    return symbol;
  });
}
function moonbitlang$ulex$lib$automaton$$DFA$add_edge(self, from, e, to) {
  const _arr = moonbitlang$core$array$$Array$op_get$85$(self.graph, from);
  const _len = _arr.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const tran = _arr[_i];
      if (moonbitlang$core$builtin$$Eq$equal$39$(tran._0, e) && tran._1 === to) {
        return undefined;
      }
      if (moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$subset(e, tran._0)) {
        $panic();
      }
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  moonbitlang$core$array$$Array$push$123$(moonbitlang$core$array$$Array$op_get$85$(self.graph, from), { _0: e, _1: to });
}
function moonbitlang$ulex$lib$automaton$$DFA$new(captures) {
  const _bind = [];
  const _bind$2 = moonbitlang$core$builtin$$Map$from_array$120$([]);
  const _bind$3 = moonbitlang$core$builtin$$Map$new$46$inner$116$(8);
  return { graph: _bind, start_node: -1, tag_actions: _bind$2, end_nodes: _bind$3, pattern_captures: captures, node_count: 0 };
}
function moonbitlang$ulex$lib$automaton$$DFA$new_node(self) {
  const id = self.node_count;
  self.node_count = self.node_count + 1 | 0;
  moonbitlang$core$array$$Array$push$85$(self.graph, []);
  return id;
}
function moonbitlang$ulex$lib$automaton$$minimize$46$get_new_state$124$234(_env, state) {
  const new_dfa = _env._3;
  const state_to_partition = _env._2;
  const partition_to_new_state = _env._1;
  const state_to_new_state = _env._0;
  const _p = moonbitlang$core$builtin$$Map$get$117$(state_to_partition, state);
  let partition;
  if (_p === undefined) {
    partition = $panic();
  } else {
    const _p$2 = _p;
    partition = _p$2;
  }
  const _bind = moonbitlang$core$builtin$$Map$get$118$(partition_to_new_state, partition);
  if (_bind === undefined) {
    const new_state = moonbitlang$ulex$lib$automaton$$DFA$new_node(new_dfa);
    moonbitlang$core$builtin$$Map$op_set$118$(partition_to_new_state, partition, new_state);
    const _bind$2 = moonbitlang$core$immut$sorted_set$$SortedSet$iter$4$(partition);
    _bind$2((state$2) => {
      moonbitlang$core$builtin$$Map$op_set$58$(state_to_new_state, state$2, new_state);
      return 1;
    });
    return new_state;
  } else {
    const _Some = _bind;
    return _Some;
  }
}
function moonbitlang$ulex$lib$automaton$$DFA$minimize(dfa) {
  const symbols = moonbitlang$ulex$lib$automaton$$collect_symbols(dfa);
  const all_states = moonbitlang$core$immut$sorted_set$$from_iter$4$(moonbitlang$core$int$$Int$until$46$inner(0, dfa.graph.length - 1 | 0, 1, true));
  const final_states = moonbitlang$core$immut$sorted_set$$from_iter$4$(moonbitlang$core$builtin$$Map$keys$116$(dfa.end_nodes));
  const partitions = { val: $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$6$ };
  const _end189 = dfa.pattern_captures.length;
  let _tmp = 0;
  while (true) {
    const pattern_id = _tmp;
    if (pattern_id < _end189) {
      const groups = { val: $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$17$ };
      const _bind = moonbitlang$core$builtin$$Map$iter2$116$(dfa.end_nodes);
      _bind((end_node, end_node_info) => {
        const tag_action = moonbitlang$core$option$$Option$unwrap$29$(moonbitlang$core$builtin$$Map$get$120$(dfa.tag_actions, end_node));
        if (end_node_info._0 === pattern_id) {
          const _tmp$2 = groups.val;
          const _p = moonbitlang$core$immut$sorted_map$$SortedMap$get$56$(groups.val, tag_action);
          const _p$2 = $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$;
          let _tmp$3;
          if (_p === undefined) {
            _tmp$3 = _p$2;
          } else {
            const _p$3 = _p;
            _tmp$3 = _p$3;
          }
          groups.val = moonbitlang$core$immut$sorted_map$$SortedMap$add$56$(_tmp$2, tag_action, moonbitlang$core$immut$sorted_set$$SortedSet$add$4$(_tmp$3, end_node));
        }
        return 1;
      });
      const _bind$2 = moonbitlang$core$immut$sorted_map$$SortedMap$iter2$56$(groups.val);
      _bind$2((__, partition) => {
        partitions.val = moonbitlang$core$immut$sorted_set$$SortedSet$add$10$(partitions.val, partition);
        return 1;
      });
      _tmp = pattern_id + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  const groups = { val: $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$17$ };
  const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$iter$4$(moonbitlang$core$immut$sorted_set$$SortedSet$difference$4$(all_states, final_states));
  _bind((state) => {
    const tag_action = moonbitlang$core$option$$Option$unwrap$29$(moonbitlang$core$builtin$$Map$get$120$(dfa.tag_actions, state));
    const _tmp$2 = groups.val;
    const _p = moonbitlang$core$immut$sorted_map$$SortedMap$get$56$(groups.val, tag_action);
    const _p$2 = $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$;
    let _tmp$3;
    if (_p === undefined) {
      _tmp$3 = _p$2;
    } else {
      const _p$3 = _p;
      _tmp$3 = _p$3;
    }
    groups.val = moonbitlang$core$immut$sorted_map$$SortedMap$add$56$(_tmp$2, tag_action, moonbitlang$core$immut$sorted_set$$SortedSet$add$4$(_tmp$3, state));
    return 1;
  });
  const _bind$2 = moonbitlang$core$immut$sorted_map$$SortedMap$iter2$56$(groups.val);
  _bind$2((__, partition) => {
    partitions.val = moonbitlang$core$immut$sorted_set$$SortedSet$add$10$(partitions.val, partition);
    return 1;
  });
  const result = moonbitlang$core$sorted_map$$new$72$();
  const _arr = dfa.graph;
  const _len = _arr.length;
  let _tmp$2 = 0;
  while (true) {
    const _i = _tmp$2;
    if (_i < _len) {
      const trans = _arr[_i];
      const _len$2 = trans.length;
      let _tmp$3 = 0;
      while (true) {
        const _i$2 = _tmp$3;
        if (_i$2 < _len$2) {
          const tran = trans[_i$2];
          const _input = tran._0;
          const _target = tran._1;
          const _bind$3 = moonbitlang$core$immut$sorted_set$$SortedSet$iter$18$(symbols);
          _bind$3((symbol) => {
            if (moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$subset(symbol.char_set, _input)) {
              const _p = moonbitlang$core$sorted_map$$SortedMap$get$72$(result, _target);
              const _p$2 = $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$18$;
              let map;
              if (_p === undefined) {
                map = _p$2;
              } else {
                const _p$3 = _p;
                map = _p$3;
              }
              const _p$3 = moonbitlang$core$immut$sorted_map$$SortedMap$get$57$(map, symbol);
              const _p$4 = $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$;
              let _tmp$4;
              if (_p$3 === undefined) {
                _tmp$4 = _p$4;
              } else {
                const _p$5 = _p$3;
                _tmp$4 = _p$5;
              }
              const map$2 = moonbitlang$core$immut$sorted_map$$SortedMap$add$57$(map, symbol, moonbitlang$core$immut$sorted_set$$SortedSet$add$4$(_tmp$4, _i));
              moonbitlang$core$sorted_map$$SortedMap$op_set$72$(result, _target, map$2);
            }
            return 1;
          });
          _tmp$3 = _i$2 + 1 | 0;
          continue;
        } else {
          break;
        }
      }
      _tmp$2 = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  const symbolized_invert_map = result;
  const worklist = { val: partitions.val };
  while (true) {
    if (!moonbitlang$core$immut$sorted_set$$SortedSet$is_empty$10$(worklist.val)) {
      const a = moonbitlang$core$immut$sorted_set$$SortedSet$min$10$(worklist.val);
      worklist.val = moonbitlang$core$immut$sorted_set$$SortedSet$remove_min$10$(worklist.val);
      let _foreach_result = $64$moonbitlang$47$core$47$builtin$46$ForeachResult$Continue$33$;
      const _bind$3 = moonbitlang$core$immut$sorted_set$$SortedSet$iter$18$(symbols);
      _bind$3((symbol) => {
        const x = { val: $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$ };
        const _bind$4 = moonbitlang$core$immut$sorted_set$$SortedSet$iter$4$(a);
        _bind$4((target) => {
          const _bind$5 = moonbitlang$core$sorted_map$$SortedMap$get$72$(symbolized_invert_map, target);
          let sources;
          if (_bind$5 === undefined) {
            sources = $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$;
          } else {
            const _Some = _bind$5;
            const _map = _Some;
            const _p = moonbitlang$core$immut$sorted_map$$SortedMap$get$57$(_map, symbol);
            const _p$2 = $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$;
            if (_p === undefined) {
              sources = _p$2;
            } else {
              const _p$3 = _p;
              sources = _p$3;
            }
          }
          x.val = moonbitlang$core$builtin$$Add$add$41$(x.val, sources);
          return 1;
        });
        if (!moonbitlang$core$immut$sorted_set$$SortedSet$is_empty$4$(x.val)) {
          const _bind$5 = moonbitlang$core$immut$sorted_set$$SortedSet$iter$10$(partitions.val);
          _bind$5((y) => {
            const intersection = moonbitlang$core$immut$sorted_set$$SortedSet$intersection$4$(x.val, y);
            const difference = moonbitlang$core$immut$sorted_set$$SortedSet$difference$4$(y, x.val);
            if (!moonbitlang$core$immut$sorted_set$$SortedSet$is_empty$4$(intersection) && !moonbitlang$core$immut$sorted_set$$SortedSet$is_empty$4$(difference)) {
              partitions.val = moonbitlang$core$immut$sorted_set$$SortedSet$remove$10$(partitions.val, y);
              partitions.val = moonbitlang$core$immut$sorted_set$$SortedSet$add$10$(partitions.val, intersection);
              partitions.val = moonbitlang$core$immut$sorted_set$$SortedSet$add$10$(partitions.val, difference);
              if (moonbitlang$core$immut$sorted_set$$SortedSet$contains$10$(worklist.val, y)) {
                worklist.val = moonbitlang$core$immut$sorted_set$$SortedSet$remove$10$(worklist.val, y);
                worklist.val = moonbitlang$core$immut$sorted_set$$SortedSet$add$10$(worklist.val, intersection);
                worklist.val = moonbitlang$core$immut$sorted_set$$SortedSet$add$10$(worklist.val, difference);
              } else {
                if (moonbitlang$core$immut$sorted_set$$SortedSet$size$4$(intersection) <= moonbitlang$core$immut$sorted_set$$SortedSet$size$4$(difference)) {
                  worklist.val = moonbitlang$core$immut$sorted_set$$SortedSet$add$10$(worklist.val, intersection);
                } else {
                  worklist.val = moonbitlang$core$immut$sorted_set$$SortedSet$add$10$(worklist.val, difference);
                }
              }
            }
            return 1;
          });
        } else {
          return 1;
        }
        return 1;
      });
      const _tmp$3 = _foreach_result;
      switch (_tmp$3.$tag) {
        case 0: {
          break;
        }
        case 1: {
          const _break = _tmp$3;
          _break._0;
          break;
        }
        case 2: {
          const _return = _tmp$3;
          return _return._0;
        }
        case 3: {
          $panic();
          break;
        }
        default: {
          $panic();
        }
      }
      continue;
    } else {
      break;
    }
  }
  const new_dfa = moonbitlang$ulex$lib$automaton$$DFA$new(dfa.pattern_captures);
  const state_to_partition = moonbitlang$core$builtin$$Map$from_array$117$([]);
  const _bind$3 = moonbitlang$core$immut$sorted_set$$SortedSet$iter$10$(partitions.val);
  _bind$3((partition) => {
    const _bind$4 = moonbitlang$core$immut$sorted_set$$SortedSet$iter$4$(partition);
    _bind$4((state) => {
      moonbitlang$core$builtin$$Map$op_set$117$(state_to_partition, state, partition);
      return 1;
    });
    return 1;
  });
  const partition_to_new_state = moonbitlang$core$builtin$$Map$from_array$118$([]);
  const state_to_new_state = moonbitlang$core$builtin$$Map$from_array$58$([]);
  const _env = { _0: state_to_new_state, _1: partition_to_new_state, _2: state_to_partition, _3: new_dfa };
  new_dfa.start_node = moonbitlang$ulex$lib$automaton$$minimize$46$get_new_state$124$234(_env, dfa.start_node);
  const _bind$4 = moonbitlang$core$immut$sorted_set$$SortedSet$iter$10$(partitions.val);
  _bind$4((partition) => {
    const new_state = moonbitlang$ulex$lib$automaton$$minimize$46$get_new_state$124$234(_env, moonbitlang$core$immut$sorted_set$$SortedSet$min$4$(partition));
    const _bind$5 = moonbitlang$core$immut$sorted_set$$SortedSet$iter$18$(symbols);
    _bind$5((symbol) => {
      const _bind$6 = moonbitlang$core$immut$sorted_set$$SortedSet$iter$4$(partition);
      _bind$6((state) => {
        const _arr$2 = moonbitlang$core$array$$Array$op_get$85$(dfa.graph, state);
        const _len$2 = _arr$2.length;
        let _tmp$3 = 0;
        while (true) {
          const _i = _tmp$3;
          if (_i < _len$2) {
            const tran = _arr$2[_i];
            const _input = tran._0;
            const _target = tran._1;
            if (moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$contains2(_input, moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$unsafe_choose(symbol.char_set))) {
              const new_target = moonbitlang$ulex$lib$automaton$$minimize$46$get_new_state$124$234(_env, _target);
              moonbitlang$ulex$lib$automaton$$DFA$add_edge(new_dfa, new_state, symbol.char_set, new_target);
            }
            _tmp$3 = _i + 1 | 0;
            continue;
          } else {
            break;
          }
        }
        return 1;
      });
      return 1;
    });
    return 1;
  });
  const _bind$5 = moonbitlang$core$builtin$$Map$iter2$120$(dfa.tag_actions);
  _bind$5((node, tag_action) => {
    const _bind$6 = moonbitlang$core$builtin$$Map$get$58$(state_to_new_state, node);
    if (_bind$6 === undefined) {
    } else {
      const _Some = _bind$6;
      const _new_state = _Some;
      moonbitlang$core$builtin$$Map$op_set$120$(new_dfa.tag_actions, _new_state, tag_action);
    }
    return 1;
  });
  const _bind$6 = moonbitlang$core$builtin$$Map$iter2$116$(dfa.end_nodes);
  _bind$6((end_state, end_state_info) => {
    const _bind$7 = moonbitlang$core$builtin$$Map$get$58$(state_to_new_state, end_state);
    if (_bind$7 === undefined) {
    } else {
      const _Some = _bind$7;
      const _new_end_state = _Some;
      _L: {
        _L$2: {
          const _bind$8 = moonbitlang$core$builtin$$Map$get$116$(new_dfa.end_nodes, _new_end_state);
          if (_bind$8 === undefined) {
            break _L$2;
          } else {
            _L$3: {
              const _bind$9 = moonbitlang$core$builtin$$Map$get$116$(new_dfa.end_nodes, _new_end_state);
              if (_bind$9 === undefined) {
                break _L$3;
              } else {
                const _Some$2 = _bind$9;
                const _end_state_info2 = _Some$2;
                if (moonbitlang$core$builtin$$Eq$equal$96$(_end_state_info2, end_state_info)) {
                  break _L$2;
                } else {
                  break _L$3;
                }
              }
            }
            $panic();
          }
          break _L;
        }
        moonbitlang$core$builtin$$Map$op_set$116$(new_dfa.end_nodes, _new_end_state, end_state_info);
      }
    }
    return 1;
  });
  return new_dfa;
}
function moonbitlang$ulex$lib$automaton$$TagState$new() {
  return $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$19$;
}
function moonbitlang$ulex$lib$automaton$$TagState$update_by_tag(self, tag, rank) {
  const _bind = moonbitlang$core$immut$sorted_map$$SortedMap$get$58$(self, tag);
  if (_bind === undefined) {
    return moonbitlang$core$immut$sorted_map$$SortedMap$add$58$(self, tag, rank);
  } else {
    const _Some = _bind;
    const _old_rank = _Some;
    return _old_rank > rank ? moonbitlang$core$immut$sorted_map$$SortedMap$add$58$(self, tag, rank) : self;
  }
}
function moonbitlang$ulex$lib$automaton$$TagState$update_by_tags(self, tags) {
  const state = { val: self };
  const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$iter$4$(tags);
  _bind((tag) => {
    state.val = moonbitlang$ulex$lib$automaton$$TagState$update_by_tag(state.val, tag, -1);
    return 1;
  });
  return state.val;
}
function moonbitlang$ulex$lib$automaton$$tagState_merge(self_, other) {
  const tags = moonbitlang$core$builtin$$Add$add$41$(moonbitlang$core$immut$sorted_set$$from_iter$4$(moonbitlang$core$immut$sorted_map$$SortedMap$keys_as_iter$58$(self_)), moonbitlang$core$immut$sorted_set$$from_iter$4$(moonbitlang$core$immut$sorted_map$$SortedMap$keys_as_iter$58$(other)));
  const result = { val: $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$19$ };
  const _bind = moonbitlang$core$immut$sorted_set$$SortedSet$iter$4$(tags);
  _bind((tag) => {
    const _tmp = result.val;
    const _bind$2 = moonbitlang$core$immut$sorted_map$$SortedMap$get$58$(self_, tag);
    const _bind$3 = moonbitlang$core$immut$sorted_map$$SortedMap$get$58$(other, tag);
    let _tmp$2;
    if (_bind$2 === undefined) {
      if (_bind$3 === undefined) {
        _tmp$2 = $panic();
      } else {
        const _Some = _bind$3;
        _tmp$2 = _Some;
      }
    } else {
      const _Some = _bind$2;
      const _rank = _Some;
      if (_bind$3 === undefined) {
        _tmp$2 = _rank;
      } else {
        const _Some$2 = _bind$3;
        const _rank2 = _Some$2;
        _tmp$2 = _rank > _rank2 ? _rank2 : _rank;
      }
    }
    result.val = moonbitlang$core$immut$sorted_map$$SortedMap$add$58$(_tmp, tag, _tmp$2);
    return 1;
  });
  return result.val;
}
function moonbitlang$ulex$lib$automaton$$state_canonicalize(state, tag_count) {
  let ranks_by_tag;
  if (tag_count <= 0) {
    ranks_by_tag = [];
  } else {
    const _p = new Array(tag_count);
    let _tmp = 0;
    while (true) {
      const _p$2 = _tmp;
      if (_p$2 < tag_count) {
        _p[_p$2] = [];
        _tmp = _p$2 + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    ranks_by_tag = _p;
  }
  const _bind = moonbitlang$ulex$lib$util$immut_map$$T$iter$145$(state);
  _bind((pair) => {
    const tags = pair._1;
    const _bind$2 = moonbitlang$core$immut$sorted_map$$SortedMap$iter2$58$(tags);
    _bind$2((tag, rank) => {
      moonbitlang$core$array$$Array$push$4$(moonbitlang$core$array$$Array$op_get$87$(ranks_by_tag, tag), rank);
      return 1;
    });
    return 1;
  });
  const _p = ranks_by_tag.length;
  let _tmp = 0;
  while (true) {
    const _p$2 = _tmp;
    if (_p$2 < _p) {
      const _p$3 = ranks_by_tag[_p$2];
      moonbitlang$core$array$$Array$op_set$87$(ranks_by_tag, _p$2, moonbitlang$core$sorted_set$$SortedSet$to_array$4$(moonbitlang$core$sorted_set$$from_iter$4$(moonbitlang$core$array$$Array$iter$4$(_p$3))));
      _tmp = _p$2 + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  const _bind$2 = moonbitlang$ulex$lib$util$immut_map$$T$iter$145$(state);
  const new_state = moonbitlang$ulex$lib$util$immut_map$$from_iter$145$((_p$2) => _bind$2((_p$3) => {
    const tag_state = moonbitlang$core$immut$sorted_map$$SortedMap$map_with_key$64$(_p$3._1, (tag, prev_rank) => {
      const ranks = moonbitlang$core$array$$Array$op_get$87$(ranks_by_tag, tag);
      const _bind$3 = moonbitlang$core$array$$Array$search$4$(ranks, prev_rank);
      if (_bind$3 === undefined) {
        return $panic();
      } else {
        const _Some = _bind$3;
        return _Some;
      }
    });
    return _p$2({ _0: _p$3._0, _1: tag_state });
  }));
  const tag_action = [];
  const _len = ranks_by_tag.length;
  let _tmp$2 = 0;
  while (true) {
    const _i = _tmp$2;
    if (_i < _len) {
      const ops = ranks_by_tag[_i];
      let _tmp$3 = ops.length - 1 | 0;
      while (true) {
        const dest_rank = _tmp$3;
        if (dest_rank >= 0) {
          const src_rank = moonbitlang$core$array$$Array$op_get$4$(ops, dest_rank);
          if (src_rank === -1) {
            moonbitlang$core$array$$Array$push$15$(tag_action, new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$TagOp$Set({ _0: _i, _1: dest_rank }));
          } else {
            if (dest_rank !== src_rank) {
              moonbitlang$core$array$$Array$push$15$(tag_action, new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$TagOp$Copy({ _0: _i, _1: dest_rank }, { _0: _i, _1: src_rank }));
            }
          }
          _tmp$3 = dest_rank - 1 | 0;
          continue;
        } else {
          break;
        }
      }
      _tmp$2 = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return { _0: new_state, _1: tag_action };
}
function moonbitlang$ulex$lib$automaton$$DFA$register_node(self, nfa, node, os) {
  const code_blocks = moonbitlang$core$builtin$$Iter$collect$4$(moonbitlang$core$builtin$$Iter$filter_map$135$(moonbitlang$ulex$lib$util$immut_map$$T$iter$145$(os), (x) => moonbitlang$core$builtin$$Map$get$58$(nfa.end_nodes, x._0.num)));
  if (!(code_blocks.length === 0)) {
    const _p = moonbitlang$core$array$$Array$op_get$4$(code_blocks, 0);
    let min_code_block;
    let _tmp = 0;
    let _tmp$2 = _p;
    while (true) {
      const _p$2 = _tmp;
      const _p$3 = _tmp$2;
      if (_p$2 < code_blocks.length) {
        _tmp = _p$2 + 1 | 0;
        const _p$4 = moonbitlang$core$array$$Array$op_get$4$(code_blocks, _p$2);
        _tmp$2 = _p$3 > _p$4 ? _p$4 : _p$3;
        continue;
      } else {
        min_code_block = _p$3;
        break;
      }
    }
    const _bind = moonbitlang$ulex$lib$util$immut_map$$T$iter$145$(os);
    const end_nodes = moonbitlang$core$builtin$$Iter$to_array$40$((_p$2) => _bind((_p$3) => moonbitlang$core$builtin$$Eq$equal$112$(moonbitlang$core$builtin$$Map$get$58$(nfa.end_nodes, _p$3._0.num), min_code_block) ? _p$2(_p$3) : 1));
    if (end_nodes.length === 1) {
      const tagState = moonbitlang$core$array$$Array$op_get$40$(end_nodes, 0)._1;
      const _p$2 = moonbitlang$core$array$$Array$op_get$88$(nfa.pattern_captures, min_code_block)._0;
      const _p$3 = new Array(_p$2.length);
      const _p$4 = _p$2.length;
      let _tmp$3 = 0;
      while (true) {
        const _p$5 = _tmp$3;
        if (_p$5 < _p$4) {
          const _p$6 = _p$2[_p$5];
          const _p$7 = _p$6._1;
          const _p$8 = _p$7._0;
          const _p$9 = _p$7._1;
          let _tmp$4;
          if (_p$8.$tag === 0) {
            const _p$10 = _p$8;
            const _p$11 = _p$10._0;
            const _p$12 = moonbitlang$core$immut$sorted_map$$SortedMap$get$58$(tagState, _p$11);
            let _tmp$5;
            if (_p$12 === undefined) {
              _tmp$5 = $panic();
            } else {
              const _p$13 = _p$12;
              _tmp$5 = _p$13;
            }
            _tmp$4 = new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$DFACapturePosition$Dynamic_dfa({ _0: _p$11, _1: _tmp$5 });
          } else {
            const _p$10 = _p$8;
            const _p$11 = _p$10._0;
            _tmp$4 = new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$DFACapturePosition$Static_dfa(_p$11);
          }
          const _tmp$5 = _tmp$4;
          let _tmp$6;
          if (_p$9.$tag === 0) {
            const _p$10 = _p$9;
            const _p$11 = _p$10._0;
            const _p$12 = moonbitlang$core$immut$sorted_map$$SortedMap$get$58$(tagState, _p$11);
            let _tmp$7;
            if (_p$12 === undefined) {
              _tmp$7 = $panic();
            } else {
              const _p$13 = _p$12;
              _tmp$7 = _p$13;
            }
            _tmp$6 = new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$DFACapturePosition$Dynamic_dfa({ _0: _p$11, _1: _tmp$7 });
          } else {
            const _p$10 = _p$9;
            const _p$11 = _p$10._0;
            _tmp$6 = new $64$moonbitlang$47$ulex$47$lib$47$automaton$46$DFACapturePosition$Static_dfa(_p$11);
          }
          _p$3[_p$5] = { _0: _tmp$5, _1: _tmp$6 };
          _tmp$3 = _p$5 + 1 | 0;
          continue;
        } else {
          break;
        }
      }
      const min_tags = _p$3;
      moonbitlang$core$builtin$$Map$set$116$(self.end_nodes, node, { _0: min_code_block, _1: min_tags });
      return;
    } else {
      moonbitlang$core$abort$$abort$1$("error");
      return;
    }
  } else {
    return;
  }
}
function moonbitlang$ulex$lib$automaton$$from_nfa$46$get_id$124$17(_env, state, canonicalized_state) {
  const dfa = _env._2;
  const node_map = _env._1;
  const nfa = _env._0;
  return moonbitlang$ulex$lib$util$hashmap2$$T$get_or_init$146$(node_map, state, (_key) => {
    const node = moonbitlang$ulex$lib$automaton$$DFA$new_node(dfa);
    moonbitlang$ulex$lib$automaton$$DFA$register_node(dfa, nfa, node, canonicalized_state);
    return node;
  });
}
function moonbitlang$ulex$lib$automaton$$from_nfa$46$42$func$124$1374(_env, _p) {
  const _tag_state = _env._1;
  const _bind = _env._0;
  return _bind((_p$2) => {
    const _cset = _p$2._0;
    const _target = _p$2._1;
    return _p({ _0: _cset, _1: { _0: _target, _1: _tag_state } });
  });
}
function moonbitlang$ulex$lib$automaton$$from_nfa$46$add_tran$124$42(new_nfa_trans, cset, targets) {
  if (!moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$is_empty(cset)) {
    moonbitlang$core$array$$Array$push$124$(new_nfa_trans, { _0: cset, _1: targets });
    return;
  } else {
    return;
  }
}
function moonbitlang$ulex$lib$automaton$$DFA$from_nfa(nfa) {
  const eps_closure = moonbitlang$ulex$lib$automaton$$NFA$get_eps_closure(nfa);
  const initial = moonbitlang$core$array$$Array$op_get$86$(eps_closure, nfa.start_node);
  const _bind = moonbitlang$ulex$lib$automaton$$NFAEpsClosure$iter(initial);
  const initial_state = moonbitlang$ulex$lib$util$immut_map$$from_iter$145$((_p) => _bind((_p$2) => {
    const _x = _p$2._0;
    const _y = _p$2._1;
    return _p({ _0: _x, _1: moonbitlang$ulex$lib$automaton$$TagState$update_by_tags(moonbitlang$ulex$lib$automaton$$TagState$new(), _y) });
  }));
  const _bind$2 = moonbitlang$ulex$lib$automaton$$state_canonicalize(initial_state, nfa.tag_count);
  const _canonicalized_initial_state = _bind$2._0;
  const _start_action = _bind$2._1;
  const _p = nfa.pattern_captures;
  const _p$2 = new Array(_p.length);
  const _p$3 = _p.length;
  let _tmp = 0;
  while (true) {
    const _p$4 = _tmp;
    if (_p$4 < _p$3) {
      const _p$5 = _p[_p$4];
      const _p$6 = _p$5._0;
      const _p$7 = new Array(_p$6.length);
      const _p$8 = _p$6.length;
      let _tmp$2 = 0;
      while (true) {
        const _p$9 = _tmp$2;
        if (_p$9 < _p$8) {
          const _p$10 = _p$6[_p$9];
          _p$7[_p$9] = _p$10._0;
          _tmp$2 = _p$9 + 1 | 0;
          continue;
        } else {
          break;
        }
      }
      _p$2[_p$4] = { _0: _p$7, _1: _p$5._1 };
      _tmp = _p$4 + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  const captures = _p$2;
  const dfa = moonbitlang$ulex$lib$automaton$$DFA$new(captures);
  const node_map = moonbitlang$ulex$lib$util$hashmap2$$new$146$(64);
  const _env = { _0: nfa, _1: node_map, _2: dfa };
  const start_node = moonbitlang$ulex$lib$automaton$$from_nfa$46$get_id$124$17(_env, initial_state, _canonicalized_initial_state);
  dfa.start_node = start_node;
  moonbitlang$core$builtin$$Map$op_set$120$(dfa.tag_actions, start_node, _start_action);
  const queue = moonbitlang$core$queue$$new$138$();
  moonbitlang$core$queue$$Queue$push$138$(queue, { _0: start_node, _1: _canonicalized_initial_state });
  let visited = $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$5$;
  while (true) {
    const _bind$3 = moonbitlang$core$queue$$Queue$pop$138$(queue);
    if (_bind$3 === undefined) {
      break;
    } else {
      const _Some = _bind$3;
      const _x = _Some;
      const _from_n = _x._0;
      const _cur_state = _x._1;
      if (moonbitlang$core$immut$sorted_set$$SortedSet$contains$4$(visited, _from_n)) {
        continue;
      }
      visited = moonbitlang$core$immut$sorted_set$$SortedSet$add$4$(visited, _from_n);
      const _bind$4 = moonbitlang$ulex$lib$util$immut_map$$T$iter$145$(_cur_state);
      const char_set_by_nfa_target = moonbitlang$core$builtin$$Map$from_array$119$([]);
      const _p$4 = (nfa_tran) => {
        const _cset = nfa_tran._0;
        const _target = nfa_tran._1;
        const _bind$5 = moonbitlang$core$builtin$$Map$get$119$(char_set_by_nfa_target, _target);
        if (_bind$5 === undefined) {
          moonbitlang$core$builtin$$Map$op_set$119$(char_set_by_nfa_target, _target, _cset);
        } else {
          const _Some$2 = _bind$5;
          const _old_cset = _Some$2;
          moonbitlang$core$builtin$$Map$op_set$119$(char_set_by_nfa_target, _target, moonbitlang$core$builtin$$Add$add$39$(_old_cset, _cset));
        }
        return 1;
      };
      _bind$4((_p$5) => {
        const _nfa_node = _p$5._0;
        const _tag_state = _p$5._1;
        const _bind$5 = moonbitlang$core$array$$Array$iter$110$(_nfa_node.trans);
        const _env$2 = { _0: _bind$5, _1: _tag_state };
        return moonbitlang$ulex$lib$automaton$$from_nfa$46$42$func$124$1374(_env$2, _p$4);
      });
      const nfa_trans = { val: [] };
      const all_char_set = { val: moonbitlang$ulex$lib$util$eof_char_set$$empty };
      const _bind$5 = moonbitlang$core$builtin$$Map$iter2$119$(char_set_by_nfa_target);
      _bind$5((target, char_set) => {
        const targets = new $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Node$8$($64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$8$, $64$moonbitlang$47$core$47$immut$47$sorted_set$46$SortedSet$Empty$8$, 1, target);
        const new_nfa_trans = [];
        moonbitlang$ulex$lib$automaton$$from_nfa$46$add_tran$124$42(new_nfa_trans, moonbitlang$core$builtin$$Sub$sub$39$(char_set, all_char_set.val), targets);
        const _arr = nfa_trans.val;
        const _len = _arr.length;
        let _tmp$2 = 0;
        while (true) {
          const _i = _tmp$2;
          if (_i < _len) {
            const nfa_tran = _arr[_i];
            const _old_cset = nfa_tran._0;
            const _old_targets = nfa_tran._1;
            moonbitlang$ulex$lib$automaton$$from_nfa$46$add_tran$124$42(new_nfa_trans, moonbitlang$core$builtin$$BitAnd$land$39$(_old_cset, char_set), moonbitlang$core$builtin$$Add$add$43$(_old_targets, targets));
            moonbitlang$ulex$lib$automaton$$from_nfa$46$add_tran$124$42(new_nfa_trans, moonbitlang$core$builtin$$Sub$sub$39$(_old_cset, char_set), _old_targets);
            _tmp$2 = _i + 1 | 0;
            continue;
          } else {
            break;
          }
        }
        all_char_set.val = moonbitlang$core$builtin$$Add$add$39$(all_char_set.val, char_set);
        nfa_trans.val = new_nfa_trans;
        return 1;
      });
      const next_states = moonbitlang$core$builtin$$Map$new$46$inner$113$(8);
      const _arr = nfa_trans.val;
      const _len = _arr.length;
      let _tmp$2 = 0;
      while (true) {
        const _i = _tmp$2;
        if (_i < _len) {
          const tran = _arr[_i];
          const _cset = tran._0;
          const _targets = tran._1;
          const _p$5 = moonbitlang$core$builtin$$Map$get$113$(next_states, _cset);
          const _p$6 = $64$moonbitlang$47$ulex$47$lib$47$util$47$immut_map$46$T$Empty$32$;
          let _tmp$3;
          if (_p$5 === undefined) {
            _tmp$3 = _p$6;
          } else {
            const _p$7 = _p$5;
            _tmp$3 = _p$7;
          }
          const state_map = { val: _tmp$3 };
          const _bind$6 = moonbitlang$core$immut$sorted_set$$SortedSet$iter$40$(_targets);
          _bind$6((target) => {
            const _step_node = target._0;
            const _from_tagState = target._1;
            const _bind$7 = moonbitlang$ulex$lib$automaton$$NFAEpsClosure$iter(moonbitlang$core$array$$Array$op_get$86$(eps_closure, _step_node.num));
            _bind$7((pair) => {
              const _eps_node = pair._0;
              const _tags = pair._1;
              const upd_tagState = moonbitlang$ulex$lib$automaton$$TagState$update_by_tags(_from_tagState, _tags);
              const old_tagState = moonbitlang$ulex$lib$util$immut_map$$T$get$145$(state_map.val, _eps_node);
              let new_tagState;
              if (old_tagState === undefined) {
                new_tagState = upd_tagState;
              } else {
                const _Some$2 = old_tagState;
                const _old_tagState = _Some$2;
                new_tagState = moonbitlang$ulex$lib$automaton$$tagState_merge(upd_tagState, _old_tagState);
              }
              state_map.val = moonbitlang$ulex$lib$util$immut_map$$T$add$145$(state_map.val, _eps_node, new_tagState);
              return 1;
            });
            return 1;
          });
          moonbitlang$core$builtin$$Map$op_set$113$(next_states, _cset, state_map.val);
          _tmp$2 = _i + 1 | 0;
          continue;
        } else {
          break;
        }
      }
      const trans = moonbitlang$core$builtin$$Iter$to_array$125$(moonbitlang$core$builtin$$Map$iter$113$(next_states));
      const _len$2 = trans.length;
      let _tmp$3 = 0;
      while (true) {
        const _i = _tmp$3;
        if (_i < _len$2) {
          const tran = trans[_i];
          const _cset = tran._0;
          const _state = tran._1;
          const _bind$6 = moonbitlang$ulex$lib$automaton$$state_canonicalize(_state, nfa.tag_count);
          const _canonicalized_state = _bind$6._0;
          const _action = _bind$6._1;
          const to_n = moonbitlang$ulex$lib$automaton$$from_nfa$46$get_id$124$17(_env, _state, _canonicalized_state);
          moonbitlang$core$queue$$Queue$push$138$(queue, { _0: to_n, _1: _canonicalized_state });
          moonbitlang$core$builtin$$Map$op_set$120$(dfa.tag_actions, to_n, _action);
          moonbitlang$ulex$lib$automaton$$DFA$add_edge(dfa, _from_n, _cset, to_n);
          _tmp$3 = _i + 1 | 0;
          continue;
        } else {
          break;
        }
      }
      continue;
    }
  }
  return dfa;
}
function moonbitlang$ulex$lib$automaton$$DFA$from_patterns(patterns, encoding) {
  return moonbitlang$ulex$lib$automaton$$DFA$minimize_tags(moonbitlang$ulex$lib$automaton$$DFA$minimize(moonbitlang$ulex$lib$automaton$$DFA$from_nfa(moonbitlang$ulex$lib$automaton$$NFA$from_patterns(patterns, encoding))));
}
function moonbitlang$ulex$lib$codegen$codeblock_parser$$scan_codeblock_rbrace$143$(subst, lexbuf) {
  _L: while (true) {
    let _match_pattern = moonbitlang$core$int$$max_value;
    let _match_start = lexbuf.pos;
    let _match_end = -1;
    let _capture_0_start = -1;
    let _capture_0_end = -1;
    let _capture_1_start = -1;
    let _capture_1_end = -1;
    let _tag_0 = -1;
    let _tag_1 = -1;
    let _tag_2 = -1;
    let _tmp = 0;
    _L$2: while (true) {
      const _param = _tmp;
      switch (_param) {
        case 0: {
          _match_pattern = 5;
          _match_end = lexbuf.pos;
          const _bind = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind >= 0 && _bind <= 35) {
            _tmp = 1;
          } else {
            if (_bind === 36) {
              _tmp = 2;
            } else {
              if (_bind >= 37 && _bind <= 122) {
                _tmp = 1;
              } else {
                if (_bind === 123) {
                  _tmp = 3;
                } else {
                  if (_bind === 124) {
                    _tmp = 1;
                  } else {
                    if (_bind === 125) {
                      _tmp = 4;
                    } else {
                      if (_bind >= 126 && _bind <= 1114111) {
                        _tmp = 1;
                      } else {
                        break _L$2;
                      }
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 1: {
          _match_pattern = 4;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 2: {
          _match_pattern = 4;
          _match_end = lexbuf.pos;
          const _bind$2 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$2 >= 65 && _bind$2 <= 90) {
            _tmp = 5;
          } else {
            if (_bind$2 === 95) {
              _tmp = 5;
            } else {
              if (_bind$2 >= 97 && _bind$2 <= 100) {
                _tmp = 5;
              } else {
                if (_bind$2 === 101) {
                  _tmp = 6;
                } else {
                  if (_bind$2 >= 102 && _bind$2 <= 114) {
                    _tmp = 5;
                  } else {
                    if (_bind$2 === 115) {
                      _tmp = 7;
                    } else {
                      if (_bind$2 >= 116 && _bind$2 <= 122) {
                        _tmp = 5;
                      } else {
                        break _L$2;
                      }
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 3: {
          _match_pattern = 0;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 4: {
          _match_pattern = 1;
          _match_end = lexbuf.pos;
          break _L$2;
        }
        case 5: {
          _match_pattern = 3;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 1 | 0;
          _capture_0_end = _match_end;
          const _bind$3 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$3 >= 48 && _bind$3 <= 57) {
            _tmp = 5;
          } else {
            if (_bind$3 >= 65 && _bind$3 <= 90) {
              _tmp = 5;
            } else {
              if (_bind$3 === 95) {
                _tmp = 5;
              } else {
                if (_bind$3 >= 97 && _bind$3 <= 122) {
                  _tmp = 5;
                } else {
                  break _L$2;
                }
              }
            }
          }
          continue _L$2;
        }
        case 6: {
          _match_pattern = 3;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 1 | 0;
          _capture_0_end = _match_end;
          const _bind$4 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$4 >= 48 && _bind$4 <= 57) {
            _tmp = 5;
          } else {
            if (_bind$4 >= 65 && _bind$4 <= 90) {
              _tmp = 5;
            } else {
              if (_bind$4 === 95) {
                _tmp = 5;
              } else {
                if (_bind$4 >= 97 && _bind$4 <= 109) {
                  _tmp = 5;
                } else {
                  if (_bind$4 === 110) {
                    _tmp = 8;
                  } else {
                    if (_bind$4 >= 111 && _bind$4 <= 122) {
                      _tmp = 5;
                    } else {
                      break _L$2;
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 7: {
          _match_pattern = 3;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 1 | 0;
          _capture_0_end = _match_end;
          const _bind$5 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$5 >= 48 && _bind$5 <= 57) {
            _tmp = 5;
          } else {
            if (_bind$5 >= 65 && _bind$5 <= 90) {
              _tmp = 5;
            } else {
              if (_bind$5 === 95) {
                _tmp = 5;
              } else {
                if (_bind$5 >= 97 && _bind$5 <= 115) {
                  _tmp = 5;
                } else {
                  if (_bind$5 === 116) {
                    _tmp = 9;
                  } else {
                    if (_bind$5 >= 117 && _bind$5 <= 122) {
                      _tmp = 5;
                    } else {
                      break _L$2;
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 8: {
          _match_pattern = 3;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 1 | 0;
          _capture_0_end = _match_end;
          const _bind$6 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$6 >= 48 && _bind$6 <= 57) {
            _tmp = 5;
          } else {
            if (_bind$6 >= 65 && _bind$6 <= 90) {
              _tmp = 5;
            } else {
              if (_bind$6 === 95) {
                _tmp = 5;
              } else {
                if (_bind$6 >= 97 && _bind$6 <= 99) {
                  _tmp = 5;
                } else {
                  if (_bind$6 === 100) {
                    _tmp = 10;
                  } else {
                    if (_bind$6 >= 101 && _bind$6 <= 122) {
                      _tmp = 5;
                    } else {
                      break _L$2;
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 9: {
          _match_pattern = 3;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 1 | 0;
          _capture_0_end = _match_end;
          const _bind$7 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$7 >= 48 && _bind$7 <= 57) {
            _tmp = 5;
          } else {
            if (_bind$7 >= 65 && _bind$7 <= 90) {
              _tmp = 5;
            } else {
              if (_bind$7 === 95) {
                _tmp = 5;
              } else {
                if (_bind$7 === 97) {
                  _tmp = 11;
                } else {
                  if (_bind$7 >= 98 && _bind$7 <= 122) {
                    _tmp = 5;
                  } else {
                    break _L$2;
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 10: {
          _match_pattern = 3;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 1 | 0;
          _capture_0_end = _match_end;
          const _bind$8 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$8 >= 48 && _bind$8 <= 57) {
            _tmp = 5;
          } else {
            if (_bind$8 >= 65 && _bind$8 <= 90) {
              _tmp = 5;
            } else {
              if (_bind$8 === 95) {
                _tmp = 5;
              } else {
                if (_bind$8 >= 97 && _bind$8 <= 111) {
                  _tmp = 5;
                } else {
                  if (_bind$8 === 112) {
                    _tmp = 12;
                  } else {
                    if (_bind$8 >= 113 && _bind$8 <= 122) {
                      _tmp = 5;
                    } else {
                      break _L$2;
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 11: {
          _match_pattern = 3;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 1 | 0;
          _capture_0_end = _match_end;
          const _bind$9 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$9 >= 48 && _bind$9 <= 57) {
            _tmp = 5;
          } else {
            if (_bind$9 >= 65 && _bind$9 <= 90) {
              _tmp = 5;
            } else {
              if (_bind$9 === 95) {
                _tmp = 5;
              } else {
                if (_bind$9 >= 97 && _bind$9 <= 113) {
                  _tmp = 5;
                } else {
                  if (_bind$9 === 114) {
                    _tmp = 13;
                  } else {
                    if (_bind$9 >= 115 && _bind$9 <= 122) {
                      _tmp = 5;
                    } else {
                      break _L$2;
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 12: {
          _match_pattern = 3;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 1 | 0;
          _capture_0_end = _match_end;
          const _bind$10 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$10 >= 48 && _bind$10 <= 57) {
            _tmp = 5;
          } else {
            if (_bind$10 >= 65 && _bind$10 <= 90) {
              _tmp = 5;
            } else {
              if (_bind$10 === 95) {
                _tmp = 5;
              } else {
                if (_bind$10 >= 97 && _bind$10 <= 110) {
                  _tmp = 5;
                } else {
                  if (_bind$10 === 111) {
                    _tmp = 14;
                  } else {
                    if (_bind$10 >= 112 && _bind$10 <= 122) {
                      _tmp = 5;
                    } else {
                      break _L$2;
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 13: {
          _match_pattern = 3;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 1 | 0;
          _capture_0_end = _match_end;
          const _bind$11 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$11 >= 48 && _bind$11 <= 57) {
            _tmp = 5;
          } else {
            if (_bind$11 >= 65 && _bind$11 <= 90) {
              _tmp = 5;
            } else {
              if (_bind$11 === 95) {
                _tmp = 5;
              } else {
                if (_bind$11 >= 97 && _bind$11 <= 115) {
                  _tmp = 5;
                } else {
                  if (_bind$11 === 116) {
                    _tmp = 10;
                  } else {
                    if (_bind$11 >= 117 && _bind$11 <= 122) {
                      _tmp = 5;
                    } else {
                      break _L$2;
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 14: {
          _match_pattern = 3;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 1 | 0;
          _capture_0_end = _match_end;
          const _bind$12 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$12 >= 48 && _bind$12 <= 57) {
            _tmp = 5;
          } else {
            if (_bind$12 >= 65 && _bind$12 <= 90) {
              _tmp = 5;
            } else {
              if (_bind$12 === 95) {
                _tmp = 5;
              } else {
                if (_bind$12 >= 97 && _bind$12 <= 114) {
                  _tmp = 5;
                } else {
                  if (_bind$12 === 115) {
                    _tmp = 15;
                  } else {
                    if (_bind$12 >= 116 && _bind$12 <= 122) {
                      _tmp = 5;
                    } else {
                      break _L$2;
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 15: {
          _tag_0 = lexbuf.pos;
          _match_pattern = 3;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 1 | 0;
          _capture_0_end = _match_end;
          const _bind$13 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$13 === 40) {
            _tmp = 16;
          } else {
            if (_bind$13 >= 48 && _bind$13 <= 57) {
              _tmp = 5;
            } else {
              if (_bind$13 >= 65 && _bind$13 <= 90) {
                _tmp = 5;
              } else {
                if (_bind$13 === 95) {
                  _tmp = 5;
                } else {
                  if (_bind$13 >= 97 && _bind$13 <= 122) {
                    _tmp = 5;
                  } else {
                    break _L$2;
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 16: {
          _tag_1 = lexbuf.pos;
          const _bind$14 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$14 === 9) {
            _tmp = 16;
          } else {
            if (_bind$14 === 32) {
              _tmp = 16;
            } else {
              if (_bind$14 >= 65 && _bind$14 <= 90) {
                _tmp = 17;
              } else {
                if (_bind$14 === 95) {
                  _tmp = 17;
                } else {
                  if (_bind$14 >= 97 && _bind$14 <= 122) {
                    _tmp = 17;
                  } else {
                    break _L$2;
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 17: {
          _tag_2 = lexbuf.pos;
          const _bind$15 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          if (_bind$15 === 9) {
            _tmp = 18;
          } else {
            if (_bind$15 === 32) {
              _tmp = 18;
            } else {
              if (_bind$15 === 41) {
                _tmp = 19;
              } else {
                if (_bind$15 >= 48 && _bind$15 <= 57) {
                  _tmp = 17;
                } else {
                  if (_bind$15 >= 65 && _bind$15 <= 90) {
                    _tmp = 17;
                  } else {
                    if (_bind$15 === 95) {
                      _tmp = 17;
                    } else {
                      if (_bind$15 >= 97 && _bind$15 <= 122) {
                        _tmp = 17;
                      } else {
                        break _L$2;
                      }
                    }
                  }
                }
              }
            }
          }
          continue _L$2;
        }
        case 18: {
          const _bind$16 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$next_as_int$143$(lexbuf);
          switch (_bind$16) {
            case 9: {
              _tmp = 18;
              break;
            }
            case 32: {
              _tmp = 18;
              break;
            }
            case 41: {
              _tmp = 19;
              break;
            }
            default: {
              break _L$2;
            }
          }
          continue _L$2;
        }
        case 19: {
          _match_pattern = 2;
          _match_end = lexbuf.pos;
          _capture_0_start = _match_start + 1 | 0;
          _capture_0_end = _tag_0;
          _capture_1_start = _tag_1;
          _capture_1_end = _tag_2;
          break _L$2;
        }
        default: {
          $panic();
          break _L$2;
        }
      }
    }
    if (_match_pattern <= 5) {
      moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$reset$143$(lexbuf, _match_end);
      const _bind = _match_pattern;
      switch (_bind) {
        case 0: {
          moonbitlang$ulex$lib$codegen$codeblock_parser$$scan_codeblock_rbrace$143$(subst, lexbuf);
          continue _L;
        }
        case 1: {
          return;
        }
        case 2: {
          const t1 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_string$143$(lexbuf, _capture_0_start, _capture_0_end);
          const t2 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_string$143$(lexbuf, _capture_1_start, _capture_1_end);
          const _tmp$2 = _match_start;
          const _tmp$3 = _match_end;
          let _tmp$4;
          switch (t1) {
            case "startpos": {
              _tmp$4 = new $64$moonbitlang$47$ulex$47$lib$47$codegen$47$codeblock_parser$46$SubstItemDesc$StartPosOf(t2);
              break;
            }
            case "endpos": {
              _tmp$4 = new $64$moonbitlang$47$ulex$47$lib$47$codegen$47$codeblock_parser$46$SubstItemDesc$EndPosOf(t2);
              break;
            }
            default: {
              _tmp$4 = $panic();
            }
          }
          moonbitlang$core$array$$Array$push$122$(subst, { start: _tmp$2, end: _tmp$3, desc: _tmp$4 });
          continue _L;
        }
        case 3: {
          const t1$2 = moonbitlang$ulex$45$runtime$lexbuf$$IStringLexbuf$get_string$143$(lexbuf, _capture_0_start, _capture_0_end);
          _L$3: {
            _L$4: {
              switch (t1$2) {
                case "startpos": {
                  break _L$4;
                }
                case "endpos": {
                  break _L$4;
                }
              }
              break _L$3;
            }
            const _tmp$5 = _match_start;
            const _tmp$6 = _match_end;
            let _tmp$7;
            switch (t1$2) {
              case "startpos": {
                _tmp$7 = $64$moonbitlang$47$ulex$47$lib$47$codegen$47$codeblock_parser$46$SubstItemDesc$StartPos;
                break;
              }
              case "endpos": {
                _tmp$7 = $64$moonbitlang$47$ulex$47$lib$47$codegen$47$codeblock_parser$46$SubstItemDesc$EndPos;
                break;
              }
              default: {
                _tmp$7 = $panic();
              }
            }
            moonbitlang$core$array$$Array$push$122$(subst, { start: _tmp$5, end: _tmp$6, desc: _tmp$7 });
          }
          continue _L;
        }
        case 4: {
          continue _L;
        }
        case 5: {
          return;
        }
        default: {
          $panic();
          return;
        }
      }
    } else {
      $panic();
      return;
    }
  }
}
function moonbitlang$ulex$lib$codegen$codeblock_parser$$parse_codeblock(str) {
  const lexbuf = moonbitlang$ulex$45$runtime$lexbuf$$StringLexbuf$from_string(str);
  const subst = [];
  moonbitlang$ulex$lib$codegen$codeblock_parser$$scan_codeblock_rbrace$143$(subst, lexbuf);
  return subst;
}
function moonbitlang$ulex$lib$codegen$$group_trans$46$42$func$124$183(_env, _p) {
  const _state = _env._1;
  const _bind = _env._0;
  return _bind((_p$2) => {
    const _min = _p$2._0;
    const _max = _p$2._1;
    const _bind$2 = _min === -1 ? $64$moonbitlang$47$ulex$47$lib$47$util$47$eof_char_set$46$EofCharRepr$Eof : new $64$moonbitlang$47$ulex$47$lib$47$util$47$eof_char_set$46$EofCharRepr$Char(_min);
    let _tmp;
    if (_bind$2.$tag === 0) {
      _tmp = -1;
    } else {
      const _Char = _bind$2;
      const _c = _Char._0;
      _tmp = _c;
    }
    const _tmp$2 = _tmp;
    const _bind$3 = _max === -1 ? $64$moonbitlang$47$ulex$47$lib$47$util$47$eof_char_set$46$EofCharRepr$Eof : new $64$moonbitlang$47$ulex$47$lib$47$util$47$eof_char_set$46$EofCharRepr$Char(_max);
    let _tmp$3;
    if (_bind$3.$tag === 0) {
      _tmp$3 = -1;
    } else {
      const _Char = _bind$3;
      const _c = _Char._0;
      _tmp$3 = _c;
    }
    return _p({ _0: { _0: _tmp$2, _1: _tmp$3 }, _1: _state });
  });
}
function moonbitlang$ulex$lib$codegen$$group_trans(trans) {
  const char_set_by_state = moonbitlang$core$builtin$$Map$from_array$114$([]);
  const _len = trans.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const tran = trans[_i];
      const _char_set = tran._0;
      const _next_state = tran._1;
      const _bind = moonbitlang$core$builtin$$Map$get$114$(char_set_by_state, _next_state);
      if (_bind === undefined) {
        moonbitlang$core$builtin$$Map$op_set$114$(char_set_by_state, _next_state, _char_set);
      } else {
        const _Some = _bind;
        const _existing_char_set = _Some;
        moonbitlang$core$builtin$$Map$op_set$114$(char_set_by_state, _next_state, moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$union(_char_set, _existing_char_set));
      }
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  const _bind = moonbitlang$core$builtin$$Map$iter$114$(char_set_by_state);
  const result = moonbitlang$core$builtin$$Iter$to_array$14$((_p) => _bind((_p$2) => {
    const _state = _p$2._0;
    const _char_set = _p$2._1;
    const _bind$2 = moonbitlang$ulex$lib$util$eof_char_set$$EofCharSet$iter_ranges(_char_set);
    const _env = { _0: _bind$2, _1: _state };
    return moonbitlang$ulex$lib$codegen$$group_trans$46$42$func$124$183(_env, _p);
  }));
  moonbitlang$core$array$$Array$sort$14$(result);
  return result;
}
function moonbitlang$ulex$lib$codegen$$rewrite_codeblock$46$index_of_name$124$128(captures, name) {
  const _p = captures.length;
  let _p$2;
  let _tmp = 0;
  while (true) {
    const _p$3 = _tmp;
    if (_p$3 < _p) {
      const _p$4 = captures[_p$3];
      const _p$5 = _p$4._0;
      if (_p$5 === name) {
        _p$2 = _p$3;
        break;
      }
      _tmp = _p$3 + 1 | 0;
      continue;
    } else {
      _p$2 = undefined;
      break;
    }
  }
  if (_p$2 === undefined) {
    return $panic();
  } else {
    const _p$3 = _p$2;
    return _p$3;
  }
}
function moonbitlang$ulex$lib$codegen$$rewrite_codeblock(codeblock, subst, captures) {
  const buf = moonbitlang$core$builtin$$StringBuilder$new$46$inner(0);
  let last_index = 0;
  const _len = subst.length;
  let _tmp = 0;
  while (true) {
    const _i = _tmp;
    if (_i < _len) {
      const item = subst[_i];
      moonbitlang$core$builtin$$Logger$write_substring$25$(buf, codeblock, last_index, item.start - last_index | 0);
      const _bind = item.desc;
      switch (_bind.$tag) {
        case 0: {
          const _StartPosOf = _bind;
          const _name = _StartPosOf._0;
          moonbitlang$core$builtin$$Logger$write_string$25$(buf, `_capture_${moonbitlang$core$builtin$$Show$to_string$4$(moonbitlang$ulex$lib$codegen$$rewrite_codeblock$46$index_of_name$124$128(captures, _name))}_start`);
          break;
        }
        case 1: {
          const _EndPosOf = _bind;
          const _name$2 = _EndPosOf._0;
          moonbitlang$core$builtin$$Logger$write_string$25$(buf, `_capture_${moonbitlang$core$builtin$$Show$to_string$4$(moonbitlang$ulex$lib$codegen$$rewrite_codeblock$46$index_of_name$124$128(captures, _name$2))}_end`);
          break;
        }
        case 2: {
          moonbitlang$core$builtin$$Logger$write_string$25$(buf, "_match_start");
          break;
        }
        default: {
          moonbitlang$core$builtin$$Logger$write_string$25$(buf, "_match_end");
        }
      }
      last_index = item.end;
      _tmp = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  if (last_index < codeblock.length) {
    moonbitlang$core$builtin$$Logger$write_substring$25$(buf, codeblock, last_index, codeblock.length - last_index | 0);
  }
  return buf.val;
}
function moonbitlang$ulex$lib$codegen$$codegen_rule_inner$46$gen_tag_var$124$39(tag_var) {
  if (tag_var._1 < 0) {
    moonbitlang$core$builtin$$println$31$(tag_var);
  }
  return tag_var._1 === 0 ? `_tag_${moonbitlang$core$builtin$$Show$to_string$4$(tag_var._0)}` : `_tag_${moonbitlang$core$builtin$$Show$to_string$4$(tag_var._0)}_${moonbitlang$core$builtin$$Show$to_string$4$(tag_var._1)}`;
}
function moonbitlang$ulex$lib$codegen$$codegen_rule_inner(rule, code_unit, default_encoding) {
  const out = moonbitlang$core$builtin$$StringBuilder$new$46$inner(0);
  let encoding;
  _L: {
    _L$2: {
      switch (code_unit) {
        case 0: {
          encoding = default_encoding;
          break;
        }
        case 1: {
          break _L$2;
        }
        default: {
          break _L$2;
        }
      }
      break _L;
    }
    encoding = undefined;
  }
  const dfa = moonbitlang$ulex$lib$automaton$$DFA$from_patterns(rule.patterns, encoding);
  const _bind = moonbitlang$core$array$$Array$iter$84$(dfa.pattern_captures);
  const _p = moonbitlang$core$builtin$$Iter$maximum$4$((_p$2) => _bind((_p$3) => _p$2(_p$3._0.length)));
  const _p$2 = 0;
  let max_num_capture_vars;
  if (_p === undefined) {
    max_num_capture_vars = _p$2;
  } else {
    const _p$3 = _p;
    max_num_capture_vars = _p$3;
  }
  const max_pattern_id = dfa.pattern_captures.length - 1 | 0;
  moonbitlang$core$builtin$$Logger$write_string$25$(out, `  // The matched pattern id\n  let mut _match_pattern = @int.max_value\n  let mut _match_start = ${rule.lexee}.curr_pos()\n  let mut _match_end = -1\n`);
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i <= max_num_capture_vars) {
      moonbitlang$core$builtin$$Logger$write_string$25$(out, `  let mut _capture_${moonbitlang$core$builtin$$Show$to_string$4$(i)}_start = -1\n  let mut _capture_${moonbitlang$core$builtin$$Show$to_string$4$(i)}_end = -1\n`);
      _tmp = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  const all_tag_actions = moonbitlang$core$sorted_set$$new$29$();
  const _bind$2 = moonbitlang$core$builtin$$Map$iter2$120$(dfa.tag_actions);
  _bind$2((__, tag_action) => {
    moonbitlang$core$sorted_set$$SortedSet$add$29$(all_tag_actions, tag_action);
    return 1;
  });
  const all_tag_vars = moonbitlang$core$sorted_set$$new$31$();
  const _bind$3 = moonbitlang$core$sorted_set$$SortedSet$iter$29$(all_tag_actions);
  _bind$3((tag_action) => {
    const _arr = tag_action;
    const _len = _arr.length;
    let _tmp$2 = 0;
    while (true) {
      const _i = _tmp$2;
      if (_i < _len) {
        const op = _arr[_i];
        if (op.$tag === 0) {
          const _Set = op;
          const _dest = _Set._0;
          moonbitlang$core$sorted_set$$SortedSet$add$31$(all_tag_vars, _dest);
        } else {
          const _Copy = op;
          const _dest = _Copy._0;
          const _src = _Copy._1;
          moonbitlang$core$sorted_set$$SortedSet$add$31$(all_tag_vars, _dest);
          moonbitlang$core$sorted_set$$SortedSet$add$31$(all_tag_vars, _src);
        }
        _tmp$2 = _i + 1 | 0;
        continue;
      } else {
        break;
      }
    }
    return 1;
  });
  const _bind$4 = moonbitlang$core$sorted_set$$SortedSet$iter$31$(all_tag_vars);
  _bind$4((tag_var) => {
    moonbitlang$core$builtin$$Logger$write_string$25$(out, `  let mut ${moonbitlang$ulex$lib$codegen$$codegen_rule_inner$46$gen_tag_var$124$39(tag_var)} = -1\n`);
    return 1;
  });
  const start_tags = moonbitlang$core$sorted_set$$new$4$();
  const _bind$5 = moonbitlang$core$sorted_set$$SortedSet$iter$4$(start_tags);
  _bind$5((tag) => {
    moonbitlang$core$builtin$$Logger$write_string$25$(out, `  ${moonbitlang$ulex$lib$codegen$$codegen_rule_inner$46$gen_tag_var$124$39({ _0: tag, _1: 0 })} = ${rule.lexee}.curr_pos()\n`);
    return 1;
  });
  moonbitlang$core$builtin$$Logger$write_string$25$(out, `  loop ${moonbitlang$core$builtin$$Show$to_string$4$(dfa.start_node)} {\n`);
  const _arr = dfa.graph;
  const _len = _arr.length;
  let _tmp$2 = 0;
  while (true) {
    const _i = _tmp$2;
    if (_i < _len) {
      const trans = _arr[_i];
      moonbitlang$core$builtin$$Logger$write_string$25$(out, `    ${moonbitlang$core$builtin$$Show$to_string$4$(_i)} => {\n`);
      const tag_action = moonbitlang$core$option$$Option$unwrap$29$(moonbitlang$core$builtin$$Map$get$120$(dfa.tag_actions, _i));
      const buf = [];
      const _arr$2 = tag_action;
      const _len$2 = _arr$2.length;
      let _tmp$3 = 0;
      while (true) {
        const _i$2 = _tmp$3;
        if (_i$2 < _len$2) {
          const op = _arr$2[_i$2];
          if (op.$tag === 0) {
            const _Set = op;
            const _dest = _Set._0;
            moonbitlang$core$array$$Array$push$2$(buf, `${moonbitlang$ulex$lib$codegen$$codegen_rule_inner$46$gen_tag_var$124$39(_dest)} = ${rule.lexee}.curr_pos()`);
          } else {
            const _Copy = op;
            const _dest = _Copy._0;
            const _src = _Copy._1;
            moonbitlang$core$array$$Array$push$2$(buf, `${moonbitlang$ulex$lib$codegen$$codegen_rule_inner$46$gen_tag_var$124$39(_dest)} = ${moonbitlang$ulex$lib$codegen$$codegen_rule_inner$46$gen_tag_var$124$39(_src)}`);
          }
          _tmp$3 = _i$2 + 1 | 0;
          continue;
        } else {
          break;
        }
      }
      let _bind$6;
      if (buf.length === 0) {
        _bind$6 = undefined;
      } else {
        const _bind$7 = moonbitlang$core$array$$Array$iter$2$(buf);
        _bind$6 = moonbitlang$core$builtin$$Iter$join((_p$3) => _bind$7((_p$4) => _p$3(`      ${_p$4}`)), "\n");
      }
      if (_bind$6 === undefined) {
      } else {
        const _Some = _bind$6;
        const _tag_action_code = _Some;
        moonbitlang$core$builtin$$Logger$write_string$25$(out, `${_tag_action_code}\n`);
      }
      const _bind$7 = moonbitlang$core$builtin$$Map$get$116$(dfa.end_nodes, _i);
      if (_bind$7 === undefined) {
      } else {
        const _Some = _bind$7;
        const _x = _Some;
        const _pattern_id = _x._0;
        const _captures = _x._1;
        moonbitlang$core$builtin$$Logger$write_string$25$(out, `      _match_pattern = ${moonbitlang$core$builtin$$Show$to_string$4$(_pattern_id)}\n      _match_end = ${rule.lexee}.curr_pos()\n`);
        const _len$3 = _captures.length;
        let _tmp$4 = 0;
        while (true) {
          const _i$2 = _tmp$4;
          if (_i$2 < _len$3) {
            const capture = _captures[_i$2];
            const _begin = capture._0;
            const _end = capture._1;
            if (_begin.$tag === 0) {
              const _Dynamic_dfa = _begin;
              const _begin_tag_var = _Dynamic_dfa._0;
              moonbitlang$core$builtin$$Logger$write_string$25$(out, `      _capture_${moonbitlang$core$builtin$$Show$to_string$4$(_i$2)}_start = ${moonbitlang$ulex$lib$codegen$$codegen_rule_inner$46$gen_tag_var$124$39(_begin_tag_var)}\n`);
            } else {
              const _Static_dfa = _begin;
              const _x$2 = _Static_dfa._0;
              if (_x$2.$tag === 0) {
                const _RelativeToStart = _x$2;
                const _offset = _RelativeToStart._0;
                if (_offset === 0) {
                  moonbitlang$core$builtin$$Logger$write_string$25$(out, `      _capture_${moonbitlang$core$builtin$$Show$to_string$4$(_i$2)}_start = _match_start\n`);
                } else {
                  moonbitlang$core$builtin$$Logger$write_string$25$(out, `      _capture_${moonbitlang$core$builtin$$Show$to_string$4$(_i$2)}_start = _match_start + ${moonbitlang$core$builtin$$Show$to_string$4$(_offset)}\n`);
                }
              } else {
                const _RelativeToEnd = _x$2;
                const _offset = _RelativeToEnd._0;
                if (_offset === 0) {
                  moonbitlang$core$builtin$$Logger$write_string$25$(out, `      _capture_${moonbitlang$core$builtin$$Show$to_string$4$(_i$2)}_start = _match_end\n`);
                } else {
                  moonbitlang$core$builtin$$Logger$write_string$25$(out, `      _capture_${moonbitlang$core$builtin$$Show$to_string$4$(_i$2)}_start = _match_end + ${moonbitlang$core$builtin$$Show$to_string$4$(_offset)}\n`);
                }
              }
            }
            if (_end.$tag === 0) {
              const _Dynamic_dfa = _end;
              const _end_tag_var = _Dynamic_dfa._0;
              moonbitlang$core$builtin$$Logger$write_string$25$(out, `      _capture_${moonbitlang$core$builtin$$Show$to_string$4$(_i$2)}_end = ${moonbitlang$ulex$lib$codegen$$codegen_rule_inner$46$gen_tag_var$124$39(_end_tag_var)}\n`);
            } else {
              const _Static_dfa = _end;
              const _x$2 = _Static_dfa._0;
              if (_x$2.$tag === 0) {
                const _RelativeToStart = _x$2;
                const _offset = _RelativeToStart._0;
                if (_offset === 0) {
                  moonbitlang$core$builtin$$Logger$write_string$25$(out, `      _capture_${moonbitlang$core$builtin$$Show$to_string$4$(_i$2)}_end = _match_start\n`);
                } else {
                  moonbitlang$core$builtin$$Logger$write_string$25$(out, `      _capture_${moonbitlang$core$builtin$$Show$to_string$4$(_i$2)}_end = _match_start + ${moonbitlang$core$builtin$$Show$to_string$4$(_offset)}\n`);
                }
              } else {
                const _RelativeToEnd = _x$2;
                const _offset = _RelativeToEnd._0;
                if (_offset === 0) {
                  moonbitlang$core$builtin$$Logger$write_string$25$(out, `      _capture_${moonbitlang$core$builtin$$Show$to_string$4$(_i$2)}_end = _match_end\n`);
                } else {
                  moonbitlang$core$builtin$$Logger$write_string$25$(out, `      _capture_${moonbitlang$core$builtin$$Show$to_string$4$(_i$2)}_end = _match_end + ${moonbitlang$core$builtin$$Show$to_string$4$(_offset)}\n`);
                }
              }
            }
            _tmp$4 = _i$2 + 1 | 0;
            continue;
          } else {
            break;
          }
        }
        moonbitlang$core$builtin$$Logger$write_string$25$(out, "");
      }
      const grouped_trans = moonbitlang$ulex$lib$codegen$$group_trans(trans);
      if (grouped_trans.length === 0) {
        moonbitlang$core$builtin$$Logger$write_string$25$(out, "      break\n");
      } else {
        moonbitlang$core$builtin$$Logger$write_string$25$(out, `      continue match ${rule.lexee}.next_as_int() {\n`);
        const _len$3 = grouped_trans.length;
        let _tmp$4 = 0;
        while (true) {
          const _i$2 = _tmp$4;
          if (_i$2 < _len$3) {
            const tran = grouped_trans[_i$2];
            const _x = tran._0;
            const _first_char = _x._0;
            const _last_char = _x._1;
            const _next_state = tran._1;
            const pattern = _first_char === _last_char ? moonbitlang$core$builtin$$Show$to_string$4$(_first_char) : `${moonbitlang$core$builtin$$Show$to_string$4$(_first_char)}..=${moonbitlang$core$builtin$$Show$to_string$4$(_last_char)}`;
            moonbitlang$core$builtin$$Logger$write_string$25$(out, `        ${pattern} => ${moonbitlang$core$builtin$$Show$to_string$4$(_next_state)}\n`);
            _tmp$4 = _i$2 + 1 | 0;
            continue;
          } else {
            break;
          }
        }
        moonbitlang$core$builtin$$Logger$write_string$25$(out, "        _ => break\n      }\n");
      }
      moonbitlang$core$builtin$$Logger$write_string$25$(out, "    }\n");
      _tmp$2 = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  moonbitlang$core$builtin$$Logger$write_string$25$(out, "    _ => panic()\n  }\n");
  moonbitlang$core$builtin$$Logger$write_string$25$(out, `\n  guard _match_pattern <= ${moonbitlang$core$builtin$$Show$to_string$4$(max_pattern_id)} else {\n    // No pattern matched\n    panic()\n  }\n\n  ${rule.lexee}.reset(pos=_match_end)\n  match _match_pattern {\n`);
  const _arr$2 = rule.actions;
  const _len$2 = _arr$2.length;
  let _tmp$3 = 0;
  while (true) {
    const _i = _tmp$3;
    if (_i < _len$2) {
      const action = _arr$2[_i];
      moonbitlang$core$builtin$$Logger$write_string$25$(out, `    ${moonbitlang$core$builtin$$Show$to_string$4$(_i)} => {\n      ()\n`);
      const subst = moonbitlang$ulex$lib$codegen$codeblock_parser$$parse_codeblock(action);
      const captures = moonbitlang$core$array$$Array$op_get$84$(dfa.pattern_captures, _i);
      const _arr$3 = captures._0;
      const _len$3 = _arr$3.length;
      let _tmp$4 = 0;
      while (true) {
        const _i$2 = _tmp$4;
        if (_i$2 < _len$3) {
          const capture = _arr$3[_i$2];
          const _name = capture._0;
          const _var_type = capture._1;
          if (_var_type === 0) {
            moonbitlang$core$builtin$$Logger$write_string$25$(out, `      let ${_name} = ${rule.lexee}.get_char(_capture_${moonbitlang$core$builtin$$Show$to_string$4$(_i$2)}_start, _capture_${moonbitlang$core$builtin$$Show$to_string$4$(_i$2)}_end)\n`);
          } else {
            moonbitlang$core$builtin$$Logger$write_string$25$(out, `      let ${_name} = ${rule.lexee}.get_string(_capture_${moonbitlang$core$builtin$$Show$to_string$4$(_i$2)}_start, _capture_${moonbitlang$core$builtin$$Show$to_string$4$(_i$2)}_end)\n`);
          }
          let _tmp$5;
          let _return_value;
          _L$2: {
            _L$3: {
              const _len$4 = subst.length;
              let _tmp$6 = 0;
              while (true) {
                const _i$3 = _tmp$6;
                if (_i$3 < _len$4) {
                  const item = subst[_i$3];
                  let n;
                  _L$4: {
                    _L$5: {
                      const _bind$6 = item.desc;
                      switch (_bind$6.$tag) {
                        case 0: {
                          const _StartPosOf = _bind$6;
                          const _n = _StartPosOf._0;
                          n = _n;
                          break _L$5;
                        }
                        case 1: {
                          const _EndPosOf = _bind$6;
                          const _n$2 = _EndPosOf._0;
                          n = _n$2;
                          break _L$5;
                        }
                        case 2: {
                          break;
                        }
                      }
                      break _L$4;
                    }
                    if (n === _name) {
                      _return_value = true;
                      break _L$3;
                    }
                  }
                  _tmp$6 = _i$3 + 1 | 0;
                  continue;
                } else {
                  break;
                }
              }
              _tmp$5 = false;
              break _L$2;
            }
            _tmp$5 = _return_value;
          }
          if (_tmp$5) {
            moonbitlang$core$builtin$$Logger$write_string$25$(out, `      let _ = ${_name}\n`);
          }
          _tmp$4 = _i$2 + 1 | 0;
          continue;
        } else {
          break;
        }
      }
      moonbitlang$core$builtin$$Logger$write_string$25$(out, `${moonbitlang$ulex$lib$codegen$$rewrite_codeblock(action, subst, captures._0)}\n`);
      moonbitlang$core$builtin$$Logger$write_string$25$(out, "    }\n");
      _tmp$3 = _i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  moonbitlang$core$builtin$$Logger$write_string$25$(out, "    _ => panic()\n  }");
  return out.val;
}
function moonbitlang$ulex$lib$codegen$$codegen_rule(rule, code_unit, default_encoding) {
  const inner = moonbitlang$ulex$lib$codegen$$codegen_rule_inner(rule, code_unit, default_encoding);
  const signature = rule.signature;
  const _p = moonbitlang$core$string$$String$find(signature, { str: moonbitlang$ulex$lib$codegen$$codegen_rule$46$42$bind$124$318, start: 0, end: moonbitlang$ulex$lib$codegen$$codegen_rule$46$42$bind$124$318.length });
  let lparen_index;
  if (_p === undefined) {
    lparen_index = $panic();
  } else {
    const _p$2 = _p;
    lparen_index = _p$2;
  }
  const left_part = moonbitlang$core$string$$String$substring$46$inner(signature, 0, lparen_index);
  const lbracket_index = moonbitlang$core$string$$String$find(left_part, { str: moonbitlang$ulex$lib$codegen$$codegen_rule$46$42$bind$124$317, start: 0, end: moonbitlang$ulex$lib$codegen$$codegen_rule$46$42$bind$124$317.length });
  let _bind;
  _L: {
    _L$2: {
      if (lbracket_index === undefined) {
        break _L$2;
      } else {
        const _Some = lbracket_index;
        const _lbracket_index = _Some;
        if (_lbracket_index < lparen_index) {
          const _p$2 = moonbitlang$core$string$$String$rev_find(left_part, { str: moonbitlang$ulex$lib$codegen$$codegen_rule$46$42$bind$124$311, start: 0, end: moonbitlang$ulex$lib$codegen$$codegen_rule$46$42$bind$124$311.length });
          let rbracket_index;
          if (_p$2 === undefined) {
            rbracket_index = $panic();
          } else {
            const _p$3 = _p$2;
            rbracket_index = _p$3;
          }
          const generic_part = moonbitlang$core$string$$String$substring$46$inner(signature, _lbracket_index, rbracket_index + 1 | 0);
          _bind = { _0: generic_part, _1: `${moonbitlang$core$string$$String$substring$46$inner(signature, 0, _lbracket_index)}${moonbitlang$core$string$$String$substring$46$inner(signature, rbracket_index + 1 | 0, undefined)}` };
        } else {
          break _L$2;
        }
      }
      break _L;
    }
    _bind = { _0: "", _1: signature };
  }
  const _generic_part = _bind._0;
  const _other_part = _bind._1;
  return `fn${_generic_part} ${_other_part} {\n${inner}\n}\n\n`;
}
function moonbitlang$ulex$lib$codegen$$codegen_lex(lex_, code_unit, default_encoding) {
  const _tmp = lex_.header;
  const _p = lex_.rules;
  const _p$2 = new Array(_p.length);
  const _p$3 = _p.length;
  let _tmp$2 = 0;
  while (true) {
    const _p$4 = _tmp$2;
    if (_p$4 < _p$3) {
      const _p$5 = _p[_p$4];
      _p$2[_p$4] = moonbitlang$ulex$lib$codegen$$codegen_rule(_p$5, code_unit, default_encoding);
      _tmp$2 = _p$4 + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  const _tmp$3 = moonbitlang$core$array$$Array$join$2$(_p$2, { str: moonbitlang$ulex$lib$codegen$$codegen_lex$46$42$bind$124$324, start: 0, end: moonbitlang$ulex$lib$codegen$$codegen_lex$46$42$bind$124$324.length });
  return moonbitlang$core$array$$Array$join$2$([_tmp, _tmp$3, lex_.trailer], { str: moonbitlang$ulex$lib$codegen$$codegen_lex$46$42$bind$124$325, start: 0, end: moonbitlang$ulex$lib$codegen$$codegen_lex$46$42$bind$124$325.length });
}
function Yoorkin$trie$$Trie$lookup$148$(self, path) {
  let _tmp = moonbitlang$core$string$$String$view$46$inner(path, 0, undefined);
  let _tmp$2 = self;
  while (true) {
    const _param_0 = _tmp;
    const _param_1 = _tmp$2;
    if (moonbitlang$core$string$$String$char_length_eq$46$inner(_param_0.str, 0, _param_0.start, _param_0.end)) {
      return _param_1.value;
    } else {
      const _x = moonbitlang$core$string$$String$unsafe_char_at(_param_0.str, moonbitlang$core$string$$String$offset_of_nth_char$46$inner(_param_0.str, 0, _param_0.start, _param_0.end));
      const _tmp$3 = _param_0.str;
      const _bind = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(_param_0.str, 1, _param_0.start, _param_0.end);
      let _tmp$4;
      if (_bind === undefined) {
        _tmp$4 = _param_0.end;
      } else {
        const _Some = _bind;
        _tmp$4 = _Some;
      }
      const _tmp$5 = _tmp$4;
      const _x$2 = { str: _tmp$3, start: _tmp$5, end: _param_0.end };
      const _bind$2 = moonbitlang$core$immut$sorted_map$$SortedMap$get$54$(_param_1.forks, _x);
      if (_bind$2 === undefined) {
        return undefined;
      } else {
        const _Some = _bind$2;
        const _subtree = _Some;
        _tmp = _x$2;
        _tmp$2 = _subtree;
        continue;
      }
    }
  }
}
function Yoorkin$trie$$add$46$aux$47$7087(value, xs, trie) {
  if (moonbitlang$core$string$$String$char_length_eq$46$inner(xs.str, 0, xs.start, xs.end)) {
    return { value: value, forks: trie.forks };
  } else {
    const _x = moonbitlang$core$string$$String$unsafe_char_at(xs.str, moonbitlang$core$string$$String$offset_of_nth_char$46$inner(xs.str, 0, xs.start, xs.end));
    const _tmp = xs.str;
    const _bind = moonbitlang$core$string$$String$offset_of_nth_char$46$inner(xs.str, 1, xs.start, xs.end);
    let _tmp$2;
    if (_bind === undefined) {
      _tmp$2 = xs.end;
    } else {
      const _Some = _bind;
      _tmp$2 = _Some;
    }
    const _tmp$3 = _tmp$2;
    const _x$2 = { str: _tmp, start: _tmp$3, end: xs.end };
    const subtree = moonbitlang$core$option$$Option$unwrap_or_else$70$(moonbitlang$core$immut$sorted_map$$SortedMap$get$54$(trie.forks, _x), () => ({ value: undefined, forks: $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$15$ }));
    return { value: trie.value, forks: moonbitlang$core$immut$sorted_map$$SortedMap$add$54$(trie.forks, _x, Yoorkin$trie$$add$46$aux$47$7087(value, _x$2, subtree)) };
  }
}
function Yoorkin$trie$$Trie$add$148$(self, path, value) {
  return Yoorkin$trie$$add$46$aux$47$7087(value, moonbitlang$core$string$$String$view$46$inner(path, 0, undefined), self);
}
function Yoorkin$trie$$Trie$empty$148$() {
  return { value: undefined, forks: $64$moonbitlang$47$core$47$immut$47$sorted_map$46$SortedMap$Empty$15$ };
}
function Yoorkin$ArgParser$$interpret(trie, xs, fallback) {
  const _bind = xs.length;
  let _tmp = 0;
  let _tmp$2 = _bind;
  _L: while (true) {
    const _param_start = _tmp;
    const _param_len = _tmp$2;
    if (_param_len === 0) {
      return;
    } else {
      const _x = xs[_param_start];
      const _bind$2 = 1 + _param_start | 0;
      const _some = _param_len;
      const _bind$3 = _some - 1 | 0;
      const _bind$4 = Yoorkin$trie$$Trie$lookup$148$(trie, _x);
      if (_bind$4 === undefined) {
        fallback(_x);
        _tmp = _bind$2;
        _tmp$2 = _bind$3;
        continue;
      } else {
        const _Some = _bind$4;
        const _spec = _Some;
        _L$2: {
          switch (_spec.$tag) {
            case 1: {
              const _String = _spec;
              const _f = _String._0;
              if (_bind$3 >= 1) {
                const _y = xs[_bind$2];
                const _bind$5 = 1 + _bind$2 | 0;
                const _some$2 = _bind$3;
                const _bind$6 = _some$2 - 1 | 0;
                _f(_y);
                _tmp = _bind$5;
                _tmp$2 = _bind$6;
                continue _L;
              } else {
                break _L$2;
              }
            }
            case 2: {
              const _Set_string = _spec;
              const _r = _Set_string._0;
              if (_bind$3 >= 1) {
                const _y = xs[_bind$2];
                const _bind$5 = 1 + _bind$2 | 0;
                const _some$2 = _bind$3;
                const _bind$6 = _some$2 - 1 | 0;
                _r.val = _y;
                _tmp = _bind$5;
                _tmp$2 = _bind$6;
                continue _L;
              } else {
                break _L$2;
              }
            }
            case 3: {
              const _Set = _spec;
              const _r$2 = _Set._0;
              _r$2.val = true;
              _tmp = _bind$2;
              _tmp$2 = _bind$3;
              continue _L;
            }
            case 4: {
              const _Clear = _spec;
              const _r$3 = _Clear._0;
              _r$3.val = false;
              _tmp = _bind$2;
              _tmp$2 = _bind$3;
              continue _L;
            }
            default: {
              const _Unit = _spec;
              const _f$2 = _Unit._0;
              _f$2();
              _tmp = _bind$2;
              _tmp$2 = _bind$3;
              continue _L;
            }
          }
        }
        moonbitlang$core$builtin$$println$2$(`missing argument for ${_x}`);
        return;
      }
    }
  }
}
function Yoorkin$ArgParser$$parse$46$aux$124$15(acc, it) {
  const _x = acc._0;
  const _help_msg = acc._1;
  const _a = it._0;
  const _b = it._1;
  const _spec = it._2;
  const _help = it._3;
  const trie = Yoorkin$trie$$Trie$add$148$(Yoorkin$trie$$Trie$add$148$(_x, _a, _spec), _b, _spec);
  const help_msg = `${_help_msg}  ${_a}\t${_b}\t${_help}\n`;
  return { _0: trie, _1: help_msg };
}
function Yoorkin$ArgParser$$parse(speclist, rest, usage_msg, argv) {
  const _p = { _0: Yoorkin$trie$$Trie$empty$148$(), _1: `${usage_msg}\n options:\n` };
  let _bind;
  let _tmp = 0;
  let _tmp$2 = _p;
  while (true) {
    const _p$2 = _tmp;
    const _p$3 = _tmp$2;
    if (_p$2 < speclist.length) {
      _tmp = _p$2 + 1 | 0;
      _tmp$2 = Yoorkin$ArgParser$$parse$46$aux$124$15(_p$3, moonbitlang$core$array$$Array$op_get$83$(speclist, _p$2));
      continue;
    } else {
      _bind = _p$3;
      break;
    }
  }
  const _trie = _bind._0;
  const _help_msg = _bind._1;
  const help_spec = new $64$Yoorkin$47$ArgParser$46$Spec$Unit(() => {
    moonbitlang$core$builtin$$println$2$(_help_msg);
  });
  const trie = Yoorkin$trie$$Trie$add$148$(Yoorkin$trie$$Trie$add$148$(_trie, "--help", help_spec), "-h", help_spec);
  Yoorkin$ArgParser$$interpret(trie, argv, rest);
}
function moonbitlang$x$internal$ffi$$mbt_string_to_utf8_bytes(str, is_filename) {
  const res = [];
  const len = str.length;
  let i = 0;
  while (true) {
    if (i < len) {
      const _p = i;
      $bound_check(str, _p);
      let c = str.charCodeAt(_p);
      if (55296 <= c && c <= 56319) {
        c = c - 55296 | 0;
        i = i + 1 | 0;
        const _p$2 = i;
        $bound_check(str, _p$2);
        const l = str.charCodeAt(_p$2) - 56320 | 0;
        c = ((c << 10) + l | 0) + 65536 | 0;
      }
      if (c < 128) {
        moonbitlang$core$array$$Array$push$24$(res, c & 255);
      } else {
        if (c < 2048) {
          moonbitlang$core$array$$Array$push$24$(res, (192 + (c >> 6) | 0) & 255);
          moonbitlang$core$array$$Array$push$24$(res, (128 + (c & 63) | 0) & 255);
        } else {
          if (c < 65536) {
            moonbitlang$core$array$$Array$push$24$(res, (224 + (c >> 12) | 0) & 255);
            moonbitlang$core$array$$Array$push$24$(res, (128 + (c >> 6 & 63) | 0) & 255);
            moonbitlang$core$array$$Array$push$24$(res, (128 + (c & 63) | 0) & 255);
          } else {
            moonbitlang$core$array$$Array$push$24$(res, (240 + (c >> 18) | 0) & 255);
            moonbitlang$core$array$$Array$push$24$(res, (128 + (c >> 12 & 63) | 0) & 255);
            moonbitlang$core$array$$Array$push$24$(res, (128 + (c >> 6 & 63) | 0) & 255);
            moonbitlang$core$array$$Array$push$24$(res, (128 + (c & 63) | 0) & 255);
          }
        }
      }
      i = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  if (is_filename) {
    moonbitlang$core$array$$Array$push$24$(res, 0 & 255);
  }
  return moonbitlang$core$bytes$$Bytes$from_array(res);
}
function moonbitlang$x$internal$ffi$$utf8_bytes_to_mbt_string(bytes) {
  const res = [];
  const len = bytes.length;
  let i = 0;
  while (true) {
    if (i < len) {
      const _tmp = i;
      $bound_check(bytes, _tmp);
      let c = bytes[_tmp];
      if (c < 128) {
        moonbitlang$core$array$$Array$push$51$(res, c);
        i = i + 1 | 0;
      } else {
        if (c < 224) {
          if ((i + 1 | 0) >= len) {
            break;
          }
          const _tmp$2 = (c & 31) << 6;
          const _tmp$3 = i + 1 | 0;
          $bound_check(bytes, _tmp$3);
          c = _tmp$2 | bytes[_tmp$3] & 63;
          moonbitlang$core$array$$Array$push$51$(res, c);
          i = i + 2 | 0;
        } else {
          if (c < 240) {
            if ((i + 2 | 0) >= len) {
              break;
            }
            const _tmp$2 = (c & 15) << 12;
            const _tmp$3 = i + 1 | 0;
            $bound_check(bytes, _tmp$3);
            const _tmp$4 = _tmp$2 | (bytes[_tmp$3] & 63) << 6;
            const _tmp$5 = i + 2 | 0;
            $bound_check(bytes, _tmp$5);
            c = _tmp$4 | bytes[_tmp$5] & 63;
            moonbitlang$core$array$$Array$push$51$(res, c);
            i = i + 3 | 0;
          } else {
            if ((i + 3 | 0) >= len) {
              break;
            }
            const _tmp$2 = (c & 7) << 18;
            const _tmp$3 = i + 1 | 0;
            $bound_check(bytes, _tmp$3);
            const _tmp$4 = _tmp$2 | (bytes[_tmp$3] & 63) << 12;
            const _tmp$5 = i + 2 | 0;
            $bound_check(bytes, _tmp$5);
            const _tmp$6 = _tmp$4 | (bytes[_tmp$5] & 63) << 6;
            const _tmp$7 = i + 3 | 0;
            $bound_check(bytes, _tmp$7);
            c = _tmp$6 | bytes[_tmp$7] & 63;
            c = c - 65536 | 0;
            moonbitlang$core$array$$Array$push$51$(res, (c >> 10) + 55296 | 0);
            moonbitlang$core$array$$Array$push$51$(res, (c & 1023) + 56320 | 0);
            i = i + 4 | 0;
          }
        }
      }
      continue;
    } else {
      break;
    }
  }
  return moonbitlang$core$string$$String$from_array(res);
}
function moonbitlang$x$sys$internal$ffi$$get_cli_args() {
  return moonbitlang$x$sys$internal$ffi$$get_cli_args_internal();
}
function moonbitlang$x$sys$$get_cli_args() {
  return moonbitlang$x$sys$internal$ffi$$get_cli_args();
}
function moonbitlang$x$fs$$read_file_to_bytes_internal(path) {
  const res = moonbitlang$x$fs$$read_file_ffi(path);
  if (res === -1) {
    return new Result$Err$34$(new Error$moonbitlang$47$x$47$fs$46$IOError$46$IOError(moonbitlang$x$fs$$get_error_message_ffi()));
  }
  return new Result$Ok$34$(moonbitlang$x$fs$$get_file_content_ffi());
}
function moonbitlang$x$fs$$read_file_to_string_internal$46$inner(path, encoding) {
  if (encoding === "utf8") {
    const _bind = moonbitlang$x$fs$$read_file_to_bytes_internal(path);
    let bytes;
    if (_bind.$tag === 1) {
      const _ok = _bind;
      bytes = _ok._0;
    } else {
      return _bind;
    }
    return new Result$Ok$35$(moonbitlang$x$internal$ffi$$utf8_bytes_to_mbt_string(bytes));
  } else {
    return new Result$Err$35$(new Error$moonbitlang$47$x$47$fs$46$IOError$46$IOError(`Unsupported encoding: ${encoding}, only utf8 is supported for now`));
  }
}
function moonbitlang$x$fs$$write_bytes_to_file_internal(path, content) {
  const res = moonbitlang$x$fs$$write_file_ffi(path, content);
  if (res === -1) {
    return new Result$Err$36$(new Error$moonbitlang$47$x$47$fs$46$IOError$46$IOError(moonbitlang$x$fs$$get_error_message_ffi()));
  } else {
    return new Result$Ok$36$(undefined);
  }
}
function moonbitlang$x$fs$$write_string_to_file_internal$46$inner(path, content, encoding) {
  if (encoding === "utf8") {
    const bytes = moonbitlang$x$internal$ffi$$mbt_string_to_utf8_bytes(content, false);
    return moonbitlang$x$fs$$write_bytes_to_file_internal(path, bytes);
  } else {
    return new Result$Err$36$(new Error$moonbitlang$47$x$47$fs$46$IOError$46$IOError(`Unsupported encoding: ${encoding}, only utf8 is supported for now`));
  }
}
function moonbitlang$x$fs$$read_file_to_string$46$inner(path, encoding) {
  return moonbitlang$x$fs$$read_file_to_string_internal$46$inner(path, encoding);
}
function moonbitlang$x$fs$$write_string_to_file$46$inner(path, content, encoding) {
  return moonbitlang$x$fs$$write_string_to_file_internal$46$inner(path, content, encoding);
}
function moonbitlang$ulex$main$util$$exit$1$(code) {
  moonbitlang$ulex$main$util$$ffi_exit(code);
  $panic();
}
function moonbitlang$ulex$main$util$$exit$149$(code) {
  moonbitlang$ulex$main$util$$ffi_exit(code);
  return $panic();
}
function moonbitlang$ulex$main$$offset_to_line_column(content, offset) {
  let line = 1;
  let column = 1;
  let _tmp = 0;
  while (true) {
    const i = _tmp;
    if (i < offset) {
      $bound_check(content, i);
      if (content.charCodeAt(i) === 10) {
        line = line + 1 | 0;
        column = 1;
      } else {
        column = column + 1 | 0;
      }
      _tmp = i + 1 | 0;
      continue;
    } else {
      break;
    }
  }
  return { _0: line, _1: column };
}
function moonbitlang$ulex$main$$array_to_or_list(arr) {
  if (arr.len === 0) {
    return $panic();
  } else {
    if (arr.len === 1) {
      return arr.buf[arr.start];
    } else {
      const _x = arr.buf[arr.start + (arr.len - 1 | 0) | 0];
      const _tmp = arr.buf;
      const _tmp$2 = arr.start;
      const _some = arr.len - 1 | 0;
      const _x$2 = { buf: _tmp, start: _tmp$2, len: _some };
      const _self = [];
      moonbitlang$core$array$$Array$push_iter$2$(_self, moonbitlang$core$array$$ArrayView$iter$2$(_x$2));
      const left = moonbitlang$core$array$$Array$join$2$(_self, { str: moonbitlang$ulex$main$$array_to_or_list$46$42$bind$124$42, start: 0, end: moonbitlang$ulex$main$$array_to_or_list$46$42$bind$124$42.length });
      return `${left} or ${_x}`;
    }
  }
}
function moonbitlang$ulex$main$$loc_to_string(filename, content, loc) {
  const _bind = moonbitlang$ulex$main$$offset_to_line_column(content, loc._0);
  const _start_line = _bind._0;
  const _start_column = _bind._1;
  const _bind$2 = moonbitlang$ulex$main$$offset_to_line_column(content, loc._1);
  const _end_line = _bind$2._0;
  const _end_column = _bind$2._1;
  return _start_line === _end_line ? `${filename}:${moonbitlang$core$builtin$$Show$to_string$4$(_start_line)}:${moonbitlang$core$builtin$$Show$to_string$4$(_start_column)}-${moonbitlang$core$builtin$$Show$to_string$4$(_end_column)}` : `${filename}:${moonbitlang$core$builtin$$Show$to_string$4$(_start_line)}:${moonbitlang$core$builtin$$Show$to_string$4$(_start_column)}-${moonbitlang$core$builtin$$Show$to_string$4$(_end_line)}:${moonbitlang$core$builtin$$Show$to_string$4$(_end_column)}`;
}
(() => {
  const output_file = moonbitlang$core$ref$$new$2$("");
  const input_file = moonbitlang$core$ref$$new$2$("");
  const code_unit = { val: 2 };
  const default_encoding = { val: undefined };
  Yoorkin$ArgParser$$parse([{ _0: "--input-file", _1: "-i", _2: new $64$Yoorkin$47$ArgParser$46$Spec$Set_string(input_file), _3: "Input file (lexer specification)" }, { _0: "--output-format", _1: "-f", _2: new $64$Yoorkin$47$ArgParser$46$Spec$String((format) => {
    let _tmp;
    switch (format) {
      case "rust": {
        _tmp = "out.rs";
        break;
      }
      case "c": {
        _tmp = "out.c";
        break;
      }
      default: {
        moonbitlang$core$abort$$abort$1$(`Invalid output format: ${format}`);
        return undefined;
      }
    }
    output_file.val = _tmp;
  }), _3: "Output format (rust or c)" }, { _0: "--output-file", _1: "-o", _2: new $64$Yoorkin$47$ArgParser$46$Spec$Set_string(output_file), _3: "Output file" }, { _0: "--version", _1: "-v", _2: new $64$Yoorkin$47$ArgParser$46$Spec$Unit(() => {
    moonbitlang$core$builtin$$println$2$("moonlex 0.1.0");
    moonbitlang$ulex$main$util$$exit$1$(0);
  }), _3: "Show version" }, { _0: "--code-unit", _1: "", _2: new $64$Yoorkin$47$ArgParser$46$Spec$String((code_unit_str) => {
    let _tmp;
    switch (code_unit_str) {
      case "1": {
        _tmp = 0;
        break;
      }
      case "2": {
        _tmp = 1;
        break;
      }
      case "4": {
        _tmp = 2;
        break;
      }
      default: {
        moonbitlang$core$abort$$abort$1$(`Invalid code unit: ${code_unit_str}`);
        return undefined;
      }
    }
    code_unit.val = _tmp;
  }), _3: "Set code unit (1, 2, or 4)" }, { _0: "--default-encoding", _1: "", _2: new $64$Yoorkin$47$ArgParser$46$Spec$String((encoding) => {
    let _tmp;
    switch (encoding) {
      case "ascii": {
        _tmp = 0;
        break;
      }
      case "latin1": {
        _tmp = 1;
        break;
      }
      case "utf8": {
        _tmp = 2;
        break;
      }
      case "utf16": {
        _tmp = 3;
        break;
      }
      default: {
        moonbitlang$core$abort$$abort$1$(`Invalid encoding: ${encoding}`);
        return undefined;
      }
    }
    default_encoding.val = _tmp;
  }), _3: "Set default encoding (ascii, latin1, utf8, or utf16). Only valid when code unit is 1" }], (rest) => {
    input_file.val = rest;
  }, moonbitlang$ulex$main$$_init$42$46$usage$124$1, moonbitlang$x$sys$$get_cli_args());
  const _p = input_file.val;
  const _p$2 = "";
  if (!(_p === _p$2)) {
    let _tmp;
    let _try_err;
    _L: {
      _L$2: {
        const _bind = moonbitlang$x$fs$$read_file_to_string$46$inner(input_file.val, "utf8");
        let _tmp$2;
        if (_bind.$tag === 1) {
          const _ok = _bind;
          _tmp$2 = _ok._0;
        } else {
          const _err = _bind;
          const _tmp$3 = _err._0;
          _try_err = _tmp$3;
          break _L$2;
        }
        _tmp = new Result$Ok$35$(_tmp$2);
        break _L;
      }
      _tmp = new Result$Err$35$(_try_err);
    }
    const lexer_spec_src = moonbitlang$core$result$$Result$unwrap$48$(_tmp);
    let lex_;
    let _try_err$2;
    _L$2: {
      _L$3: {
        const _bind = moonbitlang$ulex$lib$parser$$parse_lex_from_string(lexer_spec_src);
        if (_bind.$tag === 1) {
          const _ok = _bind;
          lex_ = _ok._0;
        } else {
          const _err = _bind;
          const _tmp$2 = _err._0;
          _try_err$2 = _tmp$2;
          break _L$3;
        }
        break _L$2;
      }
      const _UnexpectedToken = _try_err$2;
      const _token = _UnexpectedToken._0;
      const _loc = _UnexpectedToken._1;
      const _expected = _UnexpectedToken._2;
      const loc_str = moonbitlang$ulex$main$$loc_to_string(input_file.val, lexer_spec_src, _loc);
      const _p$3 = new Array(_expected.length);
      const _p$4 = _expected.length;
      let _tmp$2 = 0;
      while (true) {
        const _p$5 = _tmp$2;
        if (_p$5 < _p$4) {
          const _p$6 = _expected[_p$5];
          _p$3[_p$5] = moonbitlang$core$builtin$$Show$to_string$107$(_p$6);
          _tmp$2 = _p$5 + 1 | 0;
          continue;
        } else {
          break;
        }
      }
      const _bind = _p$3;
      const expected_str = moonbitlang$ulex$main$$array_to_or_list({ buf: _bind, start: 0, len: _bind.length });
      moonbitlang$ulex$main$util$$println_to_stderr(`SyntaxError: Unexpected token ${moonbitlang$core$builtin$$Show$to_string$107$(moonbitlang$ulex$lib$parser$$Token$kind(_token))}, expected ${expected_str}.\n  at ${loc_str}`);
      lex_ = moonbitlang$ulex$main$util$$exit$149$(1);
    }
    const output = moonbitlang$ulex$lib$codegen$$codegen_lex(lex_, code_unit.val, default_encoding.val);
    if (output_file.val === "") {
      moonbitlang$core$builtin$$println$2$(output);
      return;
    } else {
      let _tmp$2;
      let _try_err$3;
      _L$3: {
        _L$4: {
          const _bind = moonbitlang$x$fs$$write_string_to_file$46$inner(output_file.val, output, "utf8");
          if (_bind.$tag === 1) {
            const _ok = _bind;
            _ok._0;
          } else {
            const _err = _bind;
            const _tmp$3 = _err._0;
            _try_err$3 = _tmp$3;
            break _L$4;
          }
          _tmp$2 = new Result$Ok$36$(undefined);
          break _L$3;
        }
        _tmp$2 = new Result$Err$36$(_try_err$3);
      }
      moonbitlang$core$result$$Result$unwrap$49$(_tmp$2);
      return;
    }
  } else {
    moonbitlang$core$abort$$abort$1$("Input file is required");
    return;
  }
})();
