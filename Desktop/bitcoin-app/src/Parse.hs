{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE OverloadedStrings #-}

module Parse where

import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as L8
import GHC.Generics
import Network.HTTP.Simple            ( httpBS, getResponseBody )
import Control.Lens                   ( preview )
import Data.Aeson.Lens                ( key, _String )
import Data.Text                      ( Text )
import qualified Data.Text.IO as TIO


getRate :: L8.ByteString -> Maybe Text
getRate = preview (key "bpi" . key "USD" . key "rate" . _String)
