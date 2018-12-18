import unittest

import nim_greeting

suite "Greetings":
  test "No Name is passed":
    check greet() == "Hello, my friend."

  test "Single Name":
    test "is lowercase it responds":
      check greet("Bob") == "Hello, Bob."

    test "is upper case it shouts":
      check greet("BOB") == "HELLO BOB!"

  test "Multiple Names":
    test "when two names pass it, and responds to both":
      check greet("Bob", "Jill") == "Hello, Bob and Jill."

    test "when there are more than two names, it resposes with a sentance":
      check greet("Bob", "Jill", "Sam") == "Hello, Bob, Jill, and Sam."

    test "when there are mixed capitalized and lowercase, it shouts at uppercase":
      check greet("Bob", "JILL", "Sam") == "Hello, Bob and Sam. HELLO JILL!"
  
    test "when there are comma seperated names, it splits the names":
      check greet("Bob", "Jill, Sam") == "Hello, Bob, Jill, and Sam."