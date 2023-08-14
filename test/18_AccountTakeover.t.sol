// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { AccountTakeoverChallengeFactory } from "../src/challenges/18_AccountTakeover/AccountTakeoverChallengeFactory.sol";

interface IAccountTakeoverChallenge {
    function isComplete() external returns (bool);

    function authenticate() external;
}

contract AccountTakeoverTest is Test {
    IAccountTakeoverChallenge challenge;

    function setUp() public {
        AccountTakeoverChallengeFactory factory = new AccountTakeoverChallengeFactory();
        address challengeAddress = factory.createChallenge();
        challenge = IAccountTakeoverChallenge(challengeAddress);
    }

    function test() public {
        // Not sure how to solve properly since Ropsten testnet was deprecated
        vm.startPrank(0x6B477781b0e68031109f21887e6B5afEAaEB002b);
        challenge.authenticate();
        vm.stopPrank();

        assertTrue(challenge.isComplete());
    }
}
