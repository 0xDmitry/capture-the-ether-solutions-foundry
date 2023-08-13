// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { CallMeChallengeFactory } from "../src/challenges/02_CallMe/CallMeChallengeFactory.sol";

interface ICallMeChallenge {
    function isComplete() external returns (bool);

    function callme() external;
}

contract CallMeTest is Test {
    ICallMeChallenge challenge;

    function setUp() public {
        CallMeChallengeFactory factory = new CallMeChallengeFactory();
        address challengeAddress = factory.createChallenge();
        challenge = ICallMeChallenge(challengeAddress);
    }

    function test() public {
        challenge.callme();

        assertTrue(challenge.isComplete());
    }
}
