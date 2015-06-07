{-#LANGUAGE CPP #-}
module Lens.Simple (
    -- * Stock Lenses
    _1, _2
    , chosen
    , ix
    , at, intAt
    , contains, intContains
    
    -- * Stock Traversals
    , both
    , _Left, _Right
    , _Just, _Nothing
    , ignored
    
    -- * Basic lens combinators
    , to, view, (^.)
    , folding, views, (^..), (^?)
    , toListOf, allOf, anyOf, firstOf, lastOf, sumOf, productOf
    , lengthOf, nullOf
    , backwards
    , over, (%~), set, (.~)
    , (&)
    , (??)
    
    -- * Pseudo-imperatives
    , (+~), (*~), (-~), (//~), (&&~), (||~), (<>~)
    
    -- * State related combinators
    , zoom
    , use, uses
    , (%=)
    , assign, (.=)
    , (%%=)
    , (<~)
    
    -- * Compound state assignments
    , (+=), (-=), (*=)
    , (//=)
    , (&&=), (||=)
    , (<>=)
    
    -- * Stock Semantic Editor Combinators
    , mapped
    
    -- * Lens formers
    , lens
    , iso
    , setting
    
    -- * Combining Combinators
    , choosing
    , alongside
    , beside

    -- * TH incantations
    , makeLenses
    , makeTraversals
    , makeLensesBy
    , makeLensesFor
    -- * Types
    
    , LensLike, LensLike'
    , FoldLike, FoldLike'
    , ASetter, ASetter'
    , Phantom
    , Constant, Identity
    , AlongsideLeft, AlongsideRight
    , Zooming
    
    -- * Re-exports
    , Monoid(..),(<>)
  ) where
import Lens.Family2.Unchecked
import Lens.Family2.Stock
import Lens.Family2.State.Strict
import Lens.Family2.TH (makeLenses, makeTraversals, makeLensesBy, makeLensesFor)
import Data.Monoid
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
