# This is just an example to get you started. A typical library package
# exports the main API in this file. Note that you cannot rename this file
# but you can remove it if you wish.

import strutils

proc greet*(): string =
  "Hello, my friend."

proc greet*(name: string): string =
  if isUpperAscii(name, false):
    join(["HELLO ", name, "!"])
  else:
    join(["Hello, ", name, "."])