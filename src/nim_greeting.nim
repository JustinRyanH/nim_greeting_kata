# This is just an example to get you started. A typical library package
# exports the main API in this file. Note that you cannot rename this file
# but you can remove it if you wish.

import strutils
import sequtils

proc greet_one(name: string): string =
  if isUpperAscii(name, false):
    join(["HELLO ", name, "!"])
  else:
    join(["Hello, ", name, "."])

proc greet_two(name: string, other: string): string =
  join(["Hello, ", name, " and ", other, "."])

proc all_but_last(names: openArray[string]): string =
  join(names[0..^2], ", ")

proc greet*(names: varargs[string]): string =
  result = case len(names):
    of 0:
      "Hello, my friend."
    of 1:
      greet_one(names[0])
    of 2:
      greet_two(all_but_last(names), names[1])
    else:
      greet_two(all_but_last(names) & ",", names[^1])

      

  
