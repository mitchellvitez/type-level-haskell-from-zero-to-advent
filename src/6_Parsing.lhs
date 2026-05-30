> {-# LANGUAGE DataKinds, StandaloneKindSignatures, TypeFamilies #-}

> import GHC.TypeLits (Symbol, UnconsSymbol)

Copy over your SymbolChars HTS function from the last exercise, and replace this stub:

> type family SymbolChars :: undefined

> type SymbolCharsHelper :: Maybe (Char, Symbol) -> [Char]
> type family SymbolCharsHelper maybeUnconsed where
>   SymbolCharsHelper 'Nothing = '[]
>   SymbolCharsHelper ('Just '(first, rest)) = first ': SymbolChars rest

With the ability to treat a Symbol as a [Char], we can now start parsing inputs.
Write an HTS function `Lines` to split the lines of a [Char] input into a [[Char]].
Test it on this poem ("The Kitten" by Odgen Nash):

> type Poem = "The trouble with a kitten is\nTHAT\nEventually it becomes a\nCAT."

Write an HTS function `CharsNat :: [Char] -> Nat`.
It should act like the equivalent of the POH `read :: String -> Int` (ignoring negatives).

What are our options for handling bad inputs?
For example, instead of "123"...something like "hello"?

Finally, put the previous two parsers together and parse this `Numbers` Symbol into a `[Nat]`.

> type Numbers = "101\n8675309\n31\n525600\n555"

As a bonus exercise, try implementing some sort of generic HTS `Map`.
It should act like POH's `map :: (a -> b) -> [a] -> [b]`.
Try not to spend too long on this. If successful, refactor your Numbers parser to use Map.
What kinds of issues did you run into? What did you learn?
