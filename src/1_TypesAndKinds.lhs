> main = putStrLn "welcome!"

By the end of this workshop, you'll be able to solve
Advent-of-Code-level problems using Haskell's type system.

The only tools you'll need are:
  - ghci (version >= 9.2)
  - text editor

You should already know some Haskell, especially:
  - declaring datatypes
  - defining functions (pattern matching, recursion, basic syntax)
  - reading/writing type signatures
  - what a "kind" is (roughly, the type of a type)

Let's distinguish values, types, and kinds.
Open `ghci` and run the `:command`s below.

We can ask ghci for the type of a value.
:t True

One level up, we can also ask for the kind of a type.
:k Bool

Some type signatures indicate value arguments.
:t id
:t (++)

Some kind signatures indicate type arguments.
:k Maybe
:k Either

What happens if we ask for the type of a type like `Bool`?
First make a guess, then check that guess.
:t Bool

What happens if we ask for the kind of a value like `True`?
First make a guess, then check that guess.
:k True
