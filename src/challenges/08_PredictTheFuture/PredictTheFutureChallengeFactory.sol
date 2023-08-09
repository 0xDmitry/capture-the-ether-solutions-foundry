// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { PredictTheFutureChallenge } from "./PredictTheFutureChallenge.sol";

contract PredictTheFutureChallengeFactory {
    function createChallenge() external payable returns (PredictTheFutureChallenge) {
        return new PredictTheFutureChallenge{ value: msg.value }();
    }
}
