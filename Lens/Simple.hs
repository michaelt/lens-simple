{-#LANGUAGE CPP #-}
module Lens.Simple (
  module Lens.Family,
  module Lens.Family.Unchecked,
  module Lens.Family.Stock,
  module Lens.Family.State.Strict,
  module Lens.Family.TH,
  module Lens.Simple
  ) where
import Lens.Family.Unchecked
import Lens.Family.Stock
import Lens.Family.State.Strict
import Lens.Family.TH (makeLenses, makeTraversals, makeLensesBy, makeLensesFor)
#if MIN_VERSION_base(4,8,0)
import Data.Function ((&))
import Lens.Family hiding (Fold,(&))
#else
import Lens.Family hiding (Fold)
#endif

infixl 1 ??
-- | Generalized infix flip, replicating @Control.Lens.Lens.??@
-- 
-- >>>  execStateT ?? (0,"") $ do _1 += 1; _1 += 1; _2 <>= "hello" 
-- (2,"hello")

(??) :: Functor f => f (a -> b) -> a -> f b
ff ?? a = fmap ($ a) ff
{-# INLINE (??) #-}
