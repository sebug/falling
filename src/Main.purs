module Main where

import Prelude (Unit(),bind,($))
import Control.Monad.Eff (Eff())
import Control.Monad.Eff.Console (log, CONSOLE())

import Data.Maybe (Maybe(..))

import Graphics.Canvas (getCanvasElementById, getContext2D, Canvas(), setCanvasWidth, setCanvasHeight)
import Graphics.Canvas.Free (runGraphics, setFillStyle, rect, fill)

main :: forall e. Eff (console :: CONSOLE, canvas :: Canvas | e) Unit
main = do
  canvas <- getCanvasElementById "d"
  case canvas of
    Nothing -> log "Oh no, canvas not found"
    Just c -> do
      context <- getContext2D c
      runGraphics context $ do
        setFillStyle "#000000"
        rect { x: 100.0, y: 100.0, w: 400.0, h: 600.0 }
        fill
