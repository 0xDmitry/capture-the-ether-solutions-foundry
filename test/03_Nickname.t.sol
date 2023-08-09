// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { NicknameChallenge } from "../src/challenges/03_Nickname/NicknameChallenge.sol";
import { NicknameChallengeFactory } from "../src/challenges/03_Nickname/NicknameChallengeFactory.sol";

contract NicknameTest is Test {
    NicknameChallenge public challenge;

    function setUp() public {
        NicknameChallengeFactory factory = new NicknameChallengeFactory();
        challenge = factory.createChallenge(address(this));
    }

    function test() public {
        challenge.cte().setNickname("abc");

        assertTrue(challenge.isComplete());
    }
}
