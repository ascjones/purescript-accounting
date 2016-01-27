module Accounting where

import Prelude

import Data.Function

type CurrencySettings =
  { symbol    :: String
  , format    :: String
  , decimal   :: Char
  , thousand  :: Char
  , precision :: Int
  }

defaultCurrencySettings :: CurrencySettings
defaultCurrencySettings =
  { symbol : "$"
  , format : "%s%v"
  , decimal : '.'
  , thousand : ','
  , precision : 2
  }

formatMoney :: Number -> String -> Int -> Char -> Char -> String -> String
formatMoney n sym prec thou dec fmt = runFn6 formatMoneyImpl n sym prec thou dec fmt

foreign import formatMoneyImpl :: Fn6 Number String Int Char Char String String
