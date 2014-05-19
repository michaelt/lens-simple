module Lens.Simple (
  module Lens.Family2,
  module Lens.Family2.Unchecked,
  module Lens.Family2.Stock,
  module Lens.Family2.State.Strict,
  (??)
  ) where
import Lens.Family2 hiding (Fold)
import Lens.Family2.Unchecked
import Lens.Family2.Stock
import Lens.Family2.State.Strict

infixl 1 ??
-- | Generalized infix flip, replicating @Control.Lens.Lens.??@
-- 
-- >>>  execStateT ?? (0,"") $ do _1 += 1; _1 += 1; _2 <>= "hello" 
-- (2,"hello")

(??) :: Functor f => f (a -> b) -> a -> f b
ff ?? a = fmap ($ a) ff
{-# INLINE (??) #-}
