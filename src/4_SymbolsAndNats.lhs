> {-# LANGUAGE DataKinds, StandaloneKindSignatures, TypeFamilies, UndecidableInstances #-}

New extension alert!

> {-# LANGUAGE ExplicitNamespaces #-}

This extension lets us import type-level operators, as seen with `type (+)` here:

> import GHC.TypeLits (type (+), CmpNat)

There are some other useful HTS kinds we should know about.

In POH, we'd use the `Text` type for messages...

{-# LANGUAGE OverloadedStrings #-}
import Data.Text (Text)

message :: Text
message = "hello world"

...but in HTS we use the `Symbol` kind.

> import GHC.TypeLits (Symbol)

> type Message :: Symbol
> type Message = "hello world"

What's the type of "hello"? What's the kind of "hello"? Check with ghci.

We imported `type (+)` above. Load this file in ghci (or just import the HTS operator in ghci directly).

What's the type of (+)? What's the kind of (+)? Check with ghci.

What's the kind of `1 + 2`? Check with ghci:
:k 1 + 2

ghci actually has built-in support for evaluating HTS expressions!
Try this and compare against the previous command's output:
:k! 1 + 2

Define an HTS function `AddOne` that uses HTS (+) to add 1 to an input number.

We also imported `CmpNat :: Nat -> Nat -> Ordering` above.

What do you expect the result of `CmpNat 6 7` to be? Check with ghci.

What do you expect the result of `CmpNat 6` to be? Check with ghci.

Use `CmpNat` to test `AddOne` on a few different inputs.
