import strutils
import sequtils

proc first(names: openArray[string]): string =
  names[0]

proc last(names: openArray[string]): string =
  names[^1]

proc opener(isUpper: bool): string =
  if isUpper: "HELLO " else: "Hello, "

proc closer(isUpper: bool): string =
  if isUpper: "!" else: "."

proc greet(name: string): string =
  var isUpper = isUpperAscii(name, false)
  [opener(isUpper), name, closer(isUpper)].join

proc greet(name: string, other: string): string =
  [opener(false), name, " and ", other, closer(false)].join 

proc all_but_last(names: openArray[string]): string =
  names[0..^2].join(", ")

proc just_greet(names: openArray[string]): string =
  result = case names.len:
    of 0:
      ""
    of 1:
      names.first.greet
    of 2:
      names.all_but_last.greet(names.last)
    else:
      (names.all_but_last & ",").greet(names.last)

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

      [ lower.just_greet, " ", upper.just_greet].join.strip

