{-# LANGUAGE OverloadedStrings #-}
import Web.Scotty

import qualified Data.Text.Lazy as T

import Glounicode

main = scotty 3000 $ do
  get "/" $ do
    setHeader "content-type" "text/html"
    file "glounicode.html"

  get "/encode" $ do
    setHeader "content-type" "text/html"
    file "glouencode.html"

  post "/encode" $ do
    paramString <- param "data"
    text . T.pack $ unwords $ glouencode paramString

  get "/decode" $ do
    setHeader "content-type" "text/html"
    file "gloudecode.html"

  post "/decode" $ do
    paramString <- param "data"
    text . T.pack $ gloudecode $ words paramString
