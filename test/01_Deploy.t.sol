// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { DeployChallenge } from "../src/challenges/01_Deploy/DeployChallenge.sol";

contract DeployTest is Test {
    DeployChallenge public challenge;

    function setUp() public {
        challenge = new DeployChallenge();
    }

    function test() public {
        assertTrue(challenge.isComplete());
    }
}
