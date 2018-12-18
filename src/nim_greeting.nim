import strutils
import sequtils

proc all_but_last(names: openArray[string]): seq[string] =
  names[0..^2]

proc last(names: openArray[string]): string =
  names[^1]

proc opener(isUpper: bool): string =
  if isUpper: "HELLO " else: "Hello, "

proc closer(isUpper: bool): string =
  if isUpper: "!" else: "."

proc ander(isUpper: bool): string =
  if isUpper: "AND" else: "and"

proc greet(names: seq[string], isUpper: bool = false): string =
  isUpper.opener & names.join(" ") & isUpper.closer

proc with_trailing_comma(names: seq[string]): seq[string] =
  if (names.len > 2):
    names.all_but_last.mapIt(it & ",") & names.last
  else:
    names

proc cap(names: seq[string], isUpper: bool): seq[string] =
  if (names.len > 1): 
    names.all_but_last & isUpper.ander & names.last
  else:
    names

proc just_greet(names: seq[string], isUpper: bool = false): string =
  if names.len == 0: return ""
  names
    .with_trailing_comma
    .cap(isUpper)
    .greet(isUpper)

proc join_commas(names: varargs[string]): seq[string] =
  for it in items(names):
    result = result.concat(it.split(",").mapIt(string, it.strip))

proc greet*(names: varargs[string]): string =
  result = case names.len:
    of 0:
      "Hello, my friend."
    else:
      let upper = names.join_commas.filterIt(it.isUpperAscii(false))
      let lower = names.join_commas.filterIt(not it.isUpperAscii(false))
      [ lower.just_greet, " ", upper.just_greet(true) ].join.strip
