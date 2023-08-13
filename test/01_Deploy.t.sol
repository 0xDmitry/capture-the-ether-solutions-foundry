// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { DeployChallengeFactory } from "../src/challenges/01_Deploy/DeployChallengeFactory.sol";

interface IDeployChallenge {
    function isComplete() external returns (bool);
}

contract DeployTest is Test {
    IDeployChallenge challenge;

    function setUp() public {
        DeployChallengeFactory factory = new DeployChallengeFactory();
        address challengeAddress = factory.createChallenge();
        challenge = IDeployChallenge(challengeAddress);
    }

    function test() public {
        assertTrue(challenge.isComplete());
    }
}
