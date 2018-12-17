# This is just an example to get you started. A typical library package
# exports the main API in this file. Note that you cannot rename this file
# but you can remove it if you wish.

import strutils

proc greet*(names: varargs[string]): string =
  result = case len(names):
    of 0:
      "Hello, my friend."
    of 1:
      if isUpperAscii(names[0], false):
        join(["HELLO ", names[0], "!"])
      else:
        join(["Hello, ", names[0], "."])
    else:
      join(["Hello, ", names[0], " and ", names[1], "."])
  