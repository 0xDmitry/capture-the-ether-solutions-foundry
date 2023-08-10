// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { GuessTheNumberChallenge } from "../src/challenges/04_GuessTheNumber/GuessTheNumberChallenge.sol";
import { GuessTheNumberChallengeFactory } from "../src/challenges/04_GuessTheNumber/GuessTheNumberChallengeFactory.sol";

contract GuessTheNumberTest is Test {
    GuessTheNumberChallenge public challenge;

    function setUp() public {
        GuessTheNumberChallengeFactory factory = new GuessTheNumberChallengeFactory();
        challenge = factory.createChallenge{ value: 1 ether }();
    }

    function test() public {
        challenge.guess{ value: 1 ether }(42);

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}
