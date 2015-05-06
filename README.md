lens-family-simple
==================

This just re-exports the combinators and elementary 'van Laarhoven' lenses from Russell O'Connor's sublime [`lens-family-core`](http://hackage.haskell.org/package/lens-family-core) package, including "Lens.Family.State.Strict", and the corresponding TH module from [`lens-family-th`](http://hackage.haskell.org/package/lens-family-th). 

`lens-family` has a complex structure and distinctly unpleasant module names, so I made this for my own use, but maybe with experience it will prove to be a sensible idea -- or not. It is mostly just intended to simplify imports for use with [`pipes`](http://hackage.haskell.org/package/pipes) and associated `pipes` libraries. The special quasi-lenses that pervade these libraries frequently require, at a minimum, that some version of `view/(^.)` and `zoom` should be in scope. (The effect of `import Lens.Simple` is at the moment a bit like that of `import Control.Lens`; presumably much more should be hidden!)

The only non-ghc-boot library `lens-family-core` and `lens-family-core` require is `mtl`.  

The naming in `lens-family` is more or less uniform with the more powerful and elaborate [`lens`](http://hackage.haskell.org/package/lens) library, so it can be dropped in favor of `lens` should this become necessary. 




-----

The pong example from `lens/examples` is included here as an illustration of the strenth of `lens-families` + `lens-families-th`. Nothing is needed but the change of imports. 


