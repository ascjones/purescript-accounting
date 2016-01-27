module Test.Main where

import Prelude

import Test.Unit (test, runTest)
import Test.Unit.Assert as Assert

import Accounting (formatMoney)

-- main = runTest do
--   test "Service Tests" do
--     assertFn "Nutcracker is missing from inventory" $
--       checkInventory "Nutcracker"
--     assertFn "Spinning Top is missing from inventory" $
--       checkInventory "Spinning Top"

-- main :: forall e. Eff (console :: CONSOLE | e) Unit
main = runTest do
  test "Format Money" do
    Assert.assert "Can format number as currency" $ (formatMoney 10000.0 "£" 2 ',' '.' "%s%v") == "£10,000.00" 
