lens-family-simple
==================

This just re-exports the combinators and elementary lenses and traversals from the original 'van Laarhoven' lens library, Russell O'Connor's [`lens-family`](http://hackage.haskell.org/package/lens-family-core) package, including `Lens.Family.State.Strict`, and the corresponding TH module from Dan Burton's [`lens-family-th`](http://hackage.haskell.org/package/lens-family-th) so you can `makeLenses` and `makeTraversals` automatically.

`lens-family` has a inexplicably complex structure and distinctly unpleasant module names. This omnibus module is mostly just intended to simplify imports for use with [`pipes`](http://hackage.haskell.org/package/pipes) and associated `pipes` libraries. The special quasi-lenses that pervade these libraries frequently require, at a minimum, that some version of `view/(^.)`, `over`and `zoom` should be in scope. 

The only non-ghc-boot library `lens-family` and `lens-family-th` require is `mtl`.  

The naming in `lens-family` is more or less uniform with the more powerful and elaborate [`lens`](http://hackage.haskell.org/package/lens) library, so it can be dropped in favor of `lens` should the more advanced combinators become become necessary.  The pong example from the `lens/examples` in the repository of the lens library is included here as an illustration of the strength of `lens-families` + `lens-families-th` and their coherence with the nomenclature of the `Control.Lens`. Nothing was needed but the change of imports. 


