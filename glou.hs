{-# LANGUAGE DeriveDataTypeable #-}

import System.Console.CmdArgs
import Glounicode

data Glou = Glou {decode :: Bool} deriving (Show, Data, Typeable)

glou = Glou {
  decode = def &= help "Decode a glou encoded string"
} &= help "That help" &= summary "glou"

optionHandler Glou{decode=True} = gloudecode . words
optionHandler _ = unwords . glouencode

main = cmdArgs glou >>= interact . optionHandler

