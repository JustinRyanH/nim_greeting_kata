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

proc ander(isUpper: bool): string =
  if isUpper: "AND" else: "and"

proc greet(name: string, isUpper: bool = false): string =
  [opener(isUpper), name, closer(isUpper)].join

proc all_but_last(names: openArray[string]): seq[string] =
  names[0..^2]

proc with_trailing_comma(names: seq[string]): seq[string] =
  names.mapIt(it & ",")

proc cap(names: seq[string], cap_name: string, isUpper: bool): seq[string] =
  names & ander(isUpper) & cap_name

proc just_greet(names: openArray[string], isUpper: bool = false): string =
  result = case names.len:
    of 0:
      ""
    of 1:
      names.first.greet(isUpper)
    of 2:
      names
      .all_but_last
      .cap(names.last, isUpper)
      .join(" ")
      .greet(isUpper)
    else:
      names
      .all_but_last
      .with_trailing_comma
      .cap(names.last, isUpper)
      .join(" ")
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

