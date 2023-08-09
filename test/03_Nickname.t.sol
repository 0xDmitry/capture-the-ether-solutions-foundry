// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { CaptureTheEther, NicknameChallenge } from "../src/challenges/03_Nickname/NicknameChallenge.sol";

contract NicknameTest is Test {
    CaptureTheEther public captureTheEther;
    NicknameChallenge public challenge;

    function setUp() public {
        captureTheEther = new CaptureTheEther();
        captureTheEther.createNicknameChallenge();
        challenge = captureTheEther.nicknameChallenge();
    }

    function test() public {
        captureTheEther.setNickname("abc");

        assertTrue(challenge.isComplete());
    }
}
