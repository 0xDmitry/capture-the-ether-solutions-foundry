// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { ICaptureTheEther, NicknameChallengeFactory } from "../src/challenges/03_Nickname/NicknameChallengeFactory.sol";

interface INicknameChallenge {
    function isComplete() external returns (bool);

    function cte() external returns (ICaptureTheEther);
}

contract NicknameTest is Test {
    INicknameChallenge challenge;

    function setUp() public {
        NicknameChallengeFactory factory = new NicknameChallengeFactory();
        address challengeAddress = factory.createChallenge(address(this));
        challenge = INicknameChallenge(challengeAddress);
    }

    function test() public {
        challenge.cte().setNickname("abc");

        assertTrue(challenge.isComplete());
    }
}
