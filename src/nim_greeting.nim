# This is just an example to get you started. A typical library package
# exports the main API in this file. Note that you cannot rename this file
# but you can remove it if you wish.

import strutils
import sequtils


proc first(names: openArray[string]): string =
  names[0]

proc last(names: openArray[string]): string =
  names[^1]

proc greet(name: string): string =
  if isUpperAscii(name, false):
    ["HELLO ", name, "!"].join
  else:
    ["Hello, ", name, "."].join

proc greet(name: string, other: string): string =
  ["Hello, ", name, " and ", other, "."].join 

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

