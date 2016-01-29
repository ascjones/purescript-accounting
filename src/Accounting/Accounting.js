/* global exports */
"use strict";

// module Accounting

exports.formatMoneyImpl = function (number, settings) {
  return require('accounting').formatMoney(number, settings);
};
