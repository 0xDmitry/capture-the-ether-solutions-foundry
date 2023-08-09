// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { TokenWhaleChallenge } from "./TokenWhaleChallenge.sol";

contract TokenWhaleChallengeFactory {
    function createChallenge(address player) external returns (TokenWhaleChallenge) {
        return new TokenWhaleChallenge(player);
    }
}
