lens-simple
==================

`Lens-Simple` makes it easier to use the combinators from the original van Laarhoven-O'Connor lens library: Russell O'Connor's [`lens-family`](http://hackage.haskell.org/package/lens-family-core) package. For various reasons, O'Connor's package has a rather complicated structure; our purpose here is to ignore all this. The `zoom` preferred here is from `Lens.Family.State.Strict`. `makeLenses` and `makeTraversals` & co are re-exported from Dan Burton's  [`lens-family-th`](http://hackage.haskell.org/package/lens-family-th).  

