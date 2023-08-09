// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { CallMeChallenge } from "../src/challenges/02_CallMe/CallMeChallenge.sol";
import { CallMeChallengeFactory } from "../src/challenges/02_CallMe/CallMeChallengeFactory.sol";

contract CallMeTest is Test {
    CallMeChallenge public challenge;

    function setUp() public {
        CallMeChallengeFactory factory = new CallMeChallengeFactory();
        challenge = factory.createChallenge();
    }

    function test() public {
        challenge.callme();

        assertTrue(challenge.isComplete());
    }
}
