{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty

import qualified Data.Text.Lazy as T

import Glounicode

main = scotty 3000 $ do
  get "/" $
    file "glounicode.html"

  get "/encode" $
    file "glouencode.html"

  post "/encode" $ do
    paramString <- param "data"
    text . T.pack $ unwords $ glouencode paramString

  get "/decode" $
    file "gloudecode.html"

  post "/decode" $ do
    paramString <- param "data"
    text . T.pack $ gloudecode $ words paramString
