> {-# LANGUAGE DataKinds #-}

Still in ghci, turn on the `DataKinds` language extension.
:set -XDataKinds

Now, we can ask for the kind of a "value".
:k True

DataKinds did two "promotions" here:

1. promoted the constructor `True` to be a type
2. promoted the type `Bool` to be a kind

For added clarity, from now on I'll start distinguishing two "languages":

  1. POH - plain old Haskell
  2. HTS - Haskell Type System

POH refers to the values-and-types part of Haskell (i.e. "normal Haskell").
HTS refers to the types-and-kinds part (i.e. "type-level Haskell").

Treating these concepts as two separate languages helps disambiguate when we're
talking about concepts which show up in both (e.g. "the type level").
We could call HTS "promoted" and POH "unpromoted", but that's more unwieldy.

We currently have all of these in scope:

- the POH value `True`
- the HTS type `True`
- the POH type `Bool`
- the HTS kind `Bool`

We're allowed to have an HTS kind and HTS type with the same name,
just like we're allowed to have a POH type and POH value with the same name:

> data Unit = Unit

In fact, we have all three varieties of `Unit` (value, type, kind) in scope.
Check this with:

x = Unit
:t Unit
:k 'Unit

The ' in 'Unit lets GHC disambiguate HTS from POH. Compare against:
:k Unit

An easy way to create HTS datatypes is to write POH data declarations
and turn on `DataKinds` to promote them.
