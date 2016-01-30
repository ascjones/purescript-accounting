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

-- data CurrencyFormat
--   = Format String
--   | FormatSettings CurrencyFormatSettings

-- type CurrencyFormatSettings =
--   { pos :: String
--   , neg :: String
--   , zero :: String
--   }

currencySettings :: CurrencySettings
currencySettings =
  { symbol : "$"
  , format : "%s%v"
  , decimal : '.'
  , thousand : ','
  , precision : 2
  }

formatMoney_ :: Number -> String
formatMoney_ n = formatMoney n currencySettings

formatMoney :: Number -> CurrencySettings -> String
formatMoney n settings = runFn2 formatMoneyImpl n settings

unformat_ :: String -> Number
unformat_ v = unformat v '.'

unformat :: String -> Char -> Number
unformat v dec = runFn2 unformatImpl v dec

foreign import formatMoneyImpl :: Fn2 Number CurrencySettings String
foreign import unformatImpl :: Fn2 String Char Number
