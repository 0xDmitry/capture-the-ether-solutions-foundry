// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { TokenSaleChallenge } from "./TokenSaleChallenge.sol";

contract TokenSaleChallengeFactory {
    function createChallenge() external payable returns (TokenSaleChallenge) {
        return new TokenSaleChallenge{ value: msg.value }();
    }
}
