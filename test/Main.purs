module Test.Main where

import Prelude

import Control.Monad.Eff.Class (liftEff)

import Test.Unit (TestUnit(), test, runTest)
import Test.Unit.Assert as Assert
import Test.Unit.Console

import Accounting (formatMoney)

-- main :: forall eff. Eff (timer :: TIMER, avar :: AVAR, testOutput :: TESTOUTPUT | eff)
main = runTest do
  test "Format Money" do
    let result = formatMoney 10000.0 "£" 2 ',' '.' "%s%v"
    liftEff $ consoleLog result
    Assert.assert "Formats number as currency" $ result == "£10,000.00"
