// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { GuessTheNumberChallengeFactory } from "../src/challenges/04_GuessTheNumber/GuessTheNumberChallengeFactory.sol";

interface IGuessTheNumberChallenge {
    function isComplete() external returns (bool);

    function guess(uint8 n) external payable;
}

contract GuessTheNumberTest is Test {
    IGuessTheNumberChallenge challenge;

    function setUp() public {
        GuessTheNumberChallengeFactory factory = new GuessTheNumberChallengeFactory();
        address challengeAddress = factory.createChallenge{ value: 1 ether }();
        challenge = IGuessTheNumberChallenge(challengeAddress);
    }

    function test() public {
        challenge.guess{ value: 1 ether }(42);

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}
