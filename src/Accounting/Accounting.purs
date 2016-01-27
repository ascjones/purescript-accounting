module Accounting where

import Prelude

import Data.Function

formatMoney :: Number -> String -> Int -> Char -> Char -> String -> String
formatMoney n sym prec thou dec fmt = runFn6 formatMoneyImpl n sym prec thou dec fmt

foreign import formatMoneyImpl :: Fn6 Number String Int Char Char String String
