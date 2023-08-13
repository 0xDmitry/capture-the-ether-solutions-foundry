// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { StdCheats } from "forge-std/StdCheats.sol";

contract TokenWhaleChallengeFactory is StdCheats {
    function createChallenge(address player) external returns (address) {
        return deployCode("TokenWhaleChallenge.sol:TokenWhaleChallenge", abi.encode(player));
    }
}
