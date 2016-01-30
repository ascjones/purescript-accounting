module Test.Main where

import Prelude

import Test.Unit
import Test.Unit.Assert as Assert

import Accounting

-- main :: forall eff. Eff (timer :: TIMER, avar :: AVAR, testOutput :: TESTOUTPUT | eff) Unit
main = runTest do
  test "Format Money with defaults" do
    let result = formatMoney_ 10000.0
    Assert.assert "Formats number as currency" $ result == "$10,000.00"
  test "Format Money with custom symbol" do
    let result = formatMoney 10000.0 currencySettings { symbol = "£" }
    Assert.assert "Formats number as currency" $ result == "£10,000.00"
  test "Format Money with empty symbol" do
    let result = formatMoney 10000.0 currencySettings { symbol = "" }
    Assert.assert "Formats number as currency" $ result == "10,000.00"
  test "Unformat" do
    let result = unformat_ "£10,000.00"
    Assert.assert "Unformats currency" $ result == 10000.00
