module Main where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console

import Data.Maybe

import Graphics.Canvas

main :: forall e. Eff (console :: CONSOLE, canvas :: Canvas | e) Unit
main = do
  Just canvas <- getCanvasElementById "d"
  ctx <- getContext2D canvas
  setFillStyle "#5555AA" ctx
  fillPath ctx $ do
    moveTo ctx 200.0 200.0
    lineTo ctx 400.0 200.0
    lineTo ctx 400.0 400.0
    lineTo ctx 200.0 400.0
    closePath ctx
  return unit
