// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { StdCheats } from "forge-std/StdCheats.sol";

contract FuzzyIdentityChallengeFactory is StdCheats {
    function createChallenge() external returns (address) {
        return deployCode("FuzzyIdentityChallenge.sol:FuzzyIdentityChallenge");
    }
}
