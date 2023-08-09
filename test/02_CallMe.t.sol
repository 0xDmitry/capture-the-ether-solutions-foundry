// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { CallMeChallenge } from "../src/challenges/02_CallMe/CallMeChallenge.sol";

contract CallMeTest is Test {
    CallMeChallenge public challenge;

    function setUp() public {
        challenge = new CallMeChallenge();
    }

    function test() public {
        challenge.callme();

        assertTrue(challenge.isComplete());
    }
}
