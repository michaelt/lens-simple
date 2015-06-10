{-#LANGUAGE CPP, RankNTypes #-}
module Lens.Simple (
    -- * Fundamental lens combinators (@view\/(^.)@,  @set\/(.~)@, @over\/(%~)@)
    view
    , set
    , over

    -- * Characteristic lenses (@_1@, @_2@) and traversals (@_Left@, @_Right@ etc.)
    , _1
    , _2
    , _Left, _Right
    , _Just, _Nothing
    , both
    
    
    -- * Lens (etc.) formers
    , lens
    , iso
    , setting
    , to

    -- * Basic state related combinators: @zoom@, @use@, @assign\/(.=)@ etc.
    , zoom
    , use, uses
    , assign
    
    -- * Commonly used operators: particularly @view\/(^.)@,  @set\/(.~)@, @over\/(%~)@
    , (^.)
    , (%~)
    , (.~)
    , (&)
    , (??)
    , (?~)
    , (^..)
    , (^?)
    
    -- * Convenient state-related operators 
    , (%=)
    , (.=)
    , (%%=)
    , (<~)
    
    -- * Pseudo-imperatives
    , (+~), (*~), (-~), (//~), (&&~), (||~), (<>~)
    

     -- * Corresponding state-related imperatives
    , (+=), (-=), (*=), (//=), (&&=), (||=), (<>=)
    
    -- * Stock semantic editor combinators (setters)
    , mapped
    
    -- * More stock lenses 
    , chosen
    , ix
    , at, intAt
    , contains, intContains
    
    -- * More stock traversals 
    , ignored


    -- * Other combinators
    , folding, views
    , toListOf, allOf, anyOf, firstOf, lastOf, sumOf, productOf
    , lengthOf, nullOf
    , backwards
    , choosing
    , alongside
    , beside

    -- * TH incantations
    , makeLenses
    , makeTraversals
    , makeLensesBy
    , makeLensesFor
    
    -- * Types
    , Lens, Lens'
    , Traversal, Traversal'
    , Getter, Getter'
    , Setter, Setter'
    , LensLike, LensLike'
    , FoldLike, FoldLike'
    , Phantom
    , Constant (..), Identity (..)
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
import Data.Functor.Identity
import Data.Functor.Constant
#if MIN_VERSION_base(4,8,0)
import Data.Function ((&))
import Lens.Family2 hiding ((&))
#else
import Lens.Family2 
#endif

infixl 1 ??
-- | Generalized infix flip, replicating @Control.Lens.Lens.??@
-- 
-- >>>  execStateT ?? (0,"") $ do _1 += 1; _1 += 1; _2 <>= "hello" 
-- (2,"hello")

(??) :: Functor f => f (a -> b) -> a -> f b
ff ?? a = fmap ($ a) ff
{-# INLINE (??) #-}
--
(?~) :: Setter a a' b (Maybe b') -> b' -> a -> a'
l ?~ b = set l (Just b)
