// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { StdCheats } from "forge-std/StdCheats.sol";

contract MappingChallengeFactory is StdCheats {
    function createChallenge() external returns (address) {
        return deployCode("MappingChallenge.sol:MappingChallenge");
    }
}
