/* global exports */
"use strict";

// module Accounting

exports.formatMoneyImpl = function (number, symbol, precision, thousand, decimal, format) {
  require('accounting').formatMoney(number, symbol, precision, thousand, decimal, format);
};