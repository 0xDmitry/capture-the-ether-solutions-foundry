// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { AssumeOwnershipChallenge } from "../src/challenges/19_AssumeOwnership/AssumeOwnershipChallenge.sol";
import { AssumeOwnershipChallengeFactory } from "../src/challenges/19_AssumeOwnership/AssumeOwnershipChallengeFactory.sol";

contract AssumeOwnershipTest is Test {
    AssumeOwnershipChallenge public challenge;

    function setUp() public {
        AssumeOwnershipChallengeFactory factory = new AssumeOwnershipChallengeFactory();
        challenge = factory.createChallenge();
    }

    function test() public {
        challenge.AssumeOwmershipChallenge();
        challenge.authenticate();

        assertTrue(challenge.isComplete());
    }
}
