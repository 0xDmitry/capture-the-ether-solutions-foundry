// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { AssumeOwnershipChallengeFactory } from "../src/challenges/19_AssumeOwnership/AssumeOwnershipChallengeFactory.sol";

interface IAssumeOwnershipChallenge {
    function isComplete() external returns (bool);

    function AssumeOwmershipChallenge() external;

    function authenticate() external;
}

contract AssumeOwnershipTest is Test {
    IAssumeOwnershipChallenge public challenge;

    function setUp() public {
        AssumeOwnershipChallengeFactory factory = new AssumeOwnershipChallengeFactory();
        address challengeAddress = factory.createChallenge();
        challenge = IAssumeOwnershipChallenge(challengeAddress);
    }

    function test() public {
        challenge.AssumeOwmershipChallenge();
        challenge.authenticate();

        assertTrue(challenge.isComplete());
    }
}
