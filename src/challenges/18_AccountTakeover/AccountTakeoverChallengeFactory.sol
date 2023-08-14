// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { StdCheats } from "forge-std/StdCheats.sol";

contract AccountTakeoverChallengeFactory is StdCheats {
    function createChallenge() external returns (address) {
        return deployCode("AccountTakeoverChallenge.sol:AccountTakeoverChallenge");
    }
}
