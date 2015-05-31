{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE DeriveDataTypeable #-}
-- | A simple Turtle-graphics demonstration for modeling the location of a turtle.
--
-- This is based on the code presented by Seth Tisue at the Boston Area Scala
-- Enthusiasts meeting during his lens talk.
--
-- Usage:
--
-- > def & forward 10 & down & tColor .~ red & turn (pi/2) & forward 5
-- Turtle {_tPoint = Point {__x = 5.0, __y = 10.0}
--        , _tColor = Color {__r = 255, __g = 0, __b = 0}
--        , _heading = 1.5707963267948966
--        , _penDown = True}

module Turtle where

import Lens.Simple
import Data.Default

data Point = Point
  { __x, __y :: Double
  } deriving (Eq,Show)

makeLenses ''Point

instance Default Point where
  def = Point def def

data Color = Color
  { __r, __g, __b :: Int
  } deriving (Eq,Show)

makeLenses ''Color

red :: Color
red = Color 255 0 0

instance Default Color where
  def = Color def def def

data Turtle = Turtle
  { _tPoint  :: Point
  , _tColor  :: Color
  , _heading :: Double
  , _penDown :: Bool
  } deriving (Eq,Show)

makeLenses ''Turtle

instance Default Turtle where
  def = Turtle def def def False

forward :: Double -> Turtle -> Turtle
forward d t =
  t & tPoint._y +~ d * cos (t^.heading)
    & tPoint._x +~ d * sin (t^.heading)

turn :: Double -> Turtle -> Turtle
turn d = heading +~ d

up, down :: Turtle -> Turtle
up   = penDown .~ False
down = penDown .~ True