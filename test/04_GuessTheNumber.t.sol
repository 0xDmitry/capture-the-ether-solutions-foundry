// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { GuessTheNumberChallenge } from "../src/challenges/04_GuessTheNumber/GuessTheNumberChallenge.sol";
import { GuessTheNumberAttack } from "../src/attacks/GuessTheNumberAttack.sol";

contract GuessTheNumberTest is Test {
    GuessTheNumberChallenge public challenge;

    function setUp() public {
        challenge = new GuessTheNumberChallenge{ value: 1 ether }();
    }

    function test() public {
        GuessTheNumberAttack attacker = new GuessTheNumberAttack();
        attacker.attack{ value: 1 ether }(challenge);

        assertTrue(challenge.isComplete());
    }
}
