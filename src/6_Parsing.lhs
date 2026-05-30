> {-# LANGUAGE DataKinds, StandaloneKindSignatures, TypeFamilies, UndecidableInstances #-}

> import GHC.TypeLits (Symbol, UnconsSymbol)

Copy over your SymbolChars HTS function from the last exercise, and replace this stub:

> type family SymbolChars :: undefined

> type SymbolCharsHelper :: Maybe (Char, Symbol) -> [Char]
> type family SymbolCharsHelper maybeUnconsed where
>   SymbolCharsHelper 'Nothing = '[]
>   SymbolCharsHelper ('Just '(first, rest)) = first ': SymbolChars rest

With the ability to treat a Symbol as a [Char], we can now start parsing inputs.

1. Write an HTS function `ParseDigit :: Char -> Nat`.
It takes any single digit character and converts it into a number.
Advent of Code input is always well-formed, so `ParseDigit` can simply
ignore any input that isn't actually a digit.

Incidentally, what are our other options for error handling in HTS?


2. Write an HTS function `ParseNat :: [Char] -> Nat`.
It should act like the equivalent of the POH `read :: String -> Int` (ignoring negatives).
Test it on this `Number`.

> type Number = SymbolChars "8675309"


3. Write an HTS function `ParseLines` to split the lines of a [Char] input into a [[Char]].
Test it on this poem ("The Kitten" by Odgen Nash).

> type Poem = SymbolChars "The trouble with a kitten is\nTHAT\nEventually it becomes a\nCAT."


4. Finally, put the previous parser pieces together and write `ParseNatList :: Symbol -> [Nat]`.
Test it on some inputs like `NumberList` below.

Try implementing this with a generic HTS `Map` function.
It should act like POH's `map :: (a -> b) -> [a] -> [b]`.
What issues did you run into? What did you learn?

> type NumberList = "123\n8675309\n0\n525600\n555"
