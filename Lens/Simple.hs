{-#LANGUAGE CPP, RankNTypes #-}
module Lens.Simple (
    
    -- * Fundamental lens combinators: @view@, @set@ and @over@ \- also known as @(^.)@, @(.~)@ and @(%~)@
    view
    , set
    , over

    -- * @LensLike@ and important strength-expressing synonyms, from the all-powerful @Lens@ downward
    , LensLike 
    , Lens 
    , Traversal 
    , Setter 
    , Getter 
    , Fold
    , FoldLike 
    , SetterLike
    
    
    -- * Simple Prelude lenses (@_1@, @_2@) and traversals (@_Left@, @_Right@, @_Just@, etc.)
    , _1
    , _2
    , _Left, _Right
    , _Just, _Nothing
    , both
    
    -- * Common lens-applying operators: particularly @view\/(^.)@,  @set\/(.~)@, @over\/(%~)@
    , (^.)
    , (%~)
    , (.~)
    , (&)
    , (??)
    , (?~)
    , (^..)
    , (^?)
    
    
    -- * Lens forming support (see also the TH incantations below )
    , lens
    , iso
    , to
    , setting
    

    -- * Basic state related combinators: @zoom@, @use@, @assign\/(.=)@ etc.
    , zoom
    , zoom_
    , use, uses
    , assign
    
    
    -- * Convenient state-related operators 
    , (%=)
    , (.=)
    , (%%=)
    , (<~)
    
    -- * Pseudo-imperatives
    , (+~), (*~), (-~), (//~), (&&~), (||~), (<>~)

    -- * Corresponding state-related imperatives
    , (+=), (-=), (*=), (//=), (&&=), (||=), (<>=)
    
    -- * More stock lenses 
    , chosen
    , ix
    , at, intAt
    , contains, intContains
    
    -- * More stock traversals 
    , ignored
    
    -- * More stock setters
    , mapped

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
    
    -- * Other type synonyms
    , LensLike'
    , Lens'
    , Traversal'
    , Getter'
    , Setter'
    , FoldLike'
    
    -- * Helper classes
    , Identical(..)
    , Phantom(..)
    
    -- * Helper types
    , AlongsideLeft, AlongsideRight
    , Zooming 
    
    -- * Re-exports
    , Constant (..), Identity (..)
    , Monoid(..),(<>)
  ) where
import Lens.Family2.Unchecked
import Lens.Family2.Stock
import Lens.Family2.State.Strict
import Lens.Family2.TH (makeLenses, makeTraversals, makeLensesBy, makeLensesFor)
import Data.Monoid
import Data.Functor.Identity
import Data.Functor.Constant
import Control.Monad.Trans.State.Strict (StateT(..))
import Control.Monad.State.Strict
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

type SetterLike a a' b b' = LensLike Identity a a' b b'

(?~) :: Setter a a' b (Maybe b') -> b' -> a -> a'
l ?~ b = set l (Just b)

-- | @zoom_@ is like @zoom@ but for convenience returns an @mtl@ style
-- abstracted @MonadState@ state, rather than a concrete @StateT@, recapturing
-- a bit more of the abstractness of @Control.Lens.zoom@ 
zoom_
      :: MonadState s' m =>
         LensLike' (Zooming m a) s' s -> StateT s m a -> m a
zoom_ l f = abstract $ zoom l f  where
  abstract st  = do 
    s <- get 
    (a,s') <- runStateT st s
    put s'
    return a
