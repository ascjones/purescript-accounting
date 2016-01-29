module Test.Main where

import Prelude

import Control.Monad.Eff.Class (liftEff)

import Test.Unit (TestUnit(), test, runTest)
import Test.Unit.Assert as Assert
import Test.Unit.Console

import Accounting (formatMoney, formatMoney_, currencySettings)

-- main :: forall eff. Eff (timer :: TIMER, avar :: AVAR, testOutput :: TESTOUTPUT | eff)
main = runTest do
  test "Format Money with defaults" do
    let result = formatMoney_ 10000.0
    Assert.assert "Formats number as currency" $ result == "$10,000.00"
  test "Format Money with custom symbol" do
    let result = formatMoney 10000.0 currencySettings { symbol = '£' }
    Assert.assert "Formats number as currency" $ result == "£10,000.00"
