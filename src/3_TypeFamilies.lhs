> {-# LANGUAGE DataKinds #-}

Two new extensions! Extensions have to go at the top of the file,
but we'll learn about them in a moment.

> {-# LANGUAGE StandaloneKindSignatures, TypeFamilies #-}

Promoting constructors from POH to HTS is nice!
Unfortunately, we can't simply promote POH functions to HTS functions.

Let's rewrite the POH boolean-or operator (||) as an HTS function.

The POH type signature looks like:

(||) :: Bool -> Bool -> Bool

The HTS kind signature is similar, but begins with the `type` keyword.
This syntax is enabled by the `StandaloneKindSignatures` extension.

> type Or :: Bool -> Bool -> Bool

A POH definition looks like:

(||) True  _ = True
(||) False x = x

In HTS, there's an extra bit of preamble.
Type-level functions in Haskell are called "type families",
and start with the `type family` keywords.
This syntax is enabled by the `TypeFamilies` extension.
In this workshop, I'll call type families "HTS functions".
After `type family`, we state the function name,
list its arguments, and end with `where`.

> type family Or a b where

The rest of the HTS definition looks a lot like the POH definition.

>   Or True  _ = True
>   Or False x = x


For practice, define each of these HTS functions:
1. `And`, based on POH `(&&)`
2. `Not`, based on POH `not`
3. `Nand`, using your definitions of `And` and `Not`

You can define these here or in another file, but note that
in this "literate Haskell" file each code line has to start with `> `
