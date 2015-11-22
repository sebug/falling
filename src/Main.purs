module Main where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console

import Data.Maybe

import Graphics.Canvas (getCanvasElementById, getContext2D, Canvas())
import Graphics.Canvas.Free

main :: forall e. Eff (console :: CONSOLE, canvas :: Canvas | e) Unit
main = do
  canvas <- getCanvasElementById "d"
  case canvas of
    Nothing -> log "Oh no, canvas not found"
    Just c -> do
      context <- getContext2D c
      runGraphics context $ do
        setFillStyle "#000000"
        rect { x: 0.0, y: 0.0, w: 400.0, h: 600.0 }
        fill
