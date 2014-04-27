lens-simple
===========

This just re-exports the combinators and elementary 'van Laarhoven' lenses from Russell O'Connor's sublime [`lens-family`](http://hackage.haskell.org/package/lens-family) package, including "Lens.Family2.State.Strict". The naming in `lens-family` is now more or less uniform with the more powerful and elaborate [`lens`](http://hackage.haskell.org/package/lens) library. 

This package is merely intended to simplify imports -- just write `import Lens.Simple` -- for use with [`pipes`](http://hackage.haskell.org/package/pipes) and associated libraries, which frequently require that some version of `view/(^.)` and `zoom` should be in scope. Presumably much more should be hidden!
