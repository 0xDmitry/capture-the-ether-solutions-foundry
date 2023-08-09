// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { PredictTheBlockHashChallenge } from "./PredictTheBlockHashChallenge.sol";

contract PredictTheBlockHashChallengeFactory {
    function createChallenge() external payable returns (PredictTheBlockHashChallenge) {
        return new PredictTheBlockHashChallenge{ value: msg.value }();
    }
}
