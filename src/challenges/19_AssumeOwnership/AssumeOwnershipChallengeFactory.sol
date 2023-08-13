// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { StdCheats } from "forge-std/StdCheats.sol";

contract AssumeOwnershipChallengeFactory is StdCheats {
    function createChallenge() external returns (address) {
        return deployCode("AssumeOwnershipChallenge.sol:AssumeOwnershipChallenge");
    }
}
