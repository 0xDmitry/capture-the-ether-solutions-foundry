// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { DeployChallenge } from "../src/challenges/01_Deploy/DeployChallenge.sol";
import { DeployChallengeFactory } from "../src/challenges/01_Deploy/DeployChallengeFactory.sol";

contract DeployTest is Test {
    DeployChallenge public challenge;

    function setUp() public {
        DeployChallengeFactory factory = new DeployChallengeFactory();
        challenge = factory.createChallenge();
    }

    function test() public {
        assertTrue(challenge.isComplete());
    }
}
