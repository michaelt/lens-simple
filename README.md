lens-simple
===========

This just re-exports the combinators and elementary 'van Laarhoven' lenses from Russell O'Connor's sublime [`lens-family`](http://hackage.haskell.org/package/lens-family) package, including "Lens.Family2.State.Strict". Because we are using the `Rank2Types` version, this requires `ghc` of course; the only non-boot library `lens-family` and `lens-family-core` require is `mtl`.  

The naming in `lens-family` is more or less uniform with the more powerful and elaborate [`lens`](http://hackage.haskell.org/package/lens) library, so it can be dropped in favor of `lens` should this become necessary. Note the separate [`lens-family-th`](http://hackage.haskell.org/package/lens-family-th) package.

This package is merely intended to simplify imports for use with [`pipes`](http://hackage.haskell.org/package/pipes) and associated `pipes` libraries, which frequently require, at a minimum, that some version of `view/(^.)` and `zoom` should be in scope. The effect of `import Lens.Simple` is at the moment a bit like that of `import Control.Lens`; presumably much more should be hidden!

-----

The pong example from `lens` is included here. Apart from the change of imports and the substitution of `mkLenses` for `makeLenses` we are missing only the `(<~)` operator (just as well if we are planning on using pipes), so the only substantive change is to replace 

    reset = do
      ballPos .= (0, 0)
      ballSpeed <~ nextSpeed

with 

    reset = do
      ballPos .= (0, 0)
      s <- nextSpeed
      ballSpeed .= s
      


