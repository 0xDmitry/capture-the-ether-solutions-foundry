// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { StdCheats } from "forge-std/StdCheats.sol";

contract TokenSaleChallengeFactory is StdCheats {
    function createChallenge() external payable returns (address) {
        return deployCode("TokenSaleChallenge.sol:TokenSaleChallenge", msg.value);
    }
}
