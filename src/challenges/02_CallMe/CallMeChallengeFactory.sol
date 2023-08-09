// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { CallMeChallenge } from "./CallMeChallenge.sol";

contract CallMeChallengeFactory {
    function createChallenge() external returns (CallMeChallenge) {
        return new CallMeChallenge();
    }
}
