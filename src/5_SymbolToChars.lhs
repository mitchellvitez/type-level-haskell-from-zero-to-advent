> {-# LANGUAGE DataKinds, StandaloneKindSignatures, TypeFamilies #-}

> import GHC.TypeLits (Symbol)

Unlike a POH `String`, an HTS `Symbol` can't be directly manipulated as a list of characters.

However, since GHC 9.2, there's a helpful HTS function called `UnconsSymbol`.

> import GHC.TypeLits (UnconsSymbol)

Its kind is:

UnconsSymbol :: Symbol -> Maybe (Char, Symbol)

`UnconsSymbol` acts like a rather unwieldy POH `(x:xs)` pattern match.
It takes a `Symbol`, splitting it into `Just` the first `Char` and the rest of the `Symbol`,
or giving us `Nothing` when that's not possible.

We can use the results of `UnconsSymbol` to recursively build up a `[Char]` in a helper function:

> type SymbolCharsHelper :: Maybe (Char, Symbol) -> [Char]
> type family SymbolCharsHelper maybeUnconsed where

Base case: if there are no characters, the list is empty.

>   SymbolCharsHelper 'Nothing = '[]

Recursive case: add the first `Char` to the growing `[Char]`

>   SymbolCharsHelper ('Just '(first, rest)) = first ': SymbolChars rest

Write the `SymbolChars` HTS function that converts a `Symbol` into a `[Char]`.
It should use `SymbolCharsHelper` to do its dirty work. Replace this stub:

> type family SymbolChars :: undefined

We included ' ticks on all the promoted constructors in `SymbolCharsHelper`.
Until now, we haven't needed many promotion ticks (refer back to 'Unit in file 2).
Some of them aren't actually necessary here, but others are!
Place your bets, then delete individual ' marks to discover which ones we actually need.
Try to formulate a rule for which ones are necessary and which ones aren't.
