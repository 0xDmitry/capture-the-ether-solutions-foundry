// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { GuessTheNewNumberChallenge } from "../src/challenges/07_GuessTheNewNumber/GuessTheNewNumberChallenge.sol";
import { GuessTheNewNumberAttack } from "../src/attacks/GuessTheNewNumberAttack.sol";

contract GuessTheNewNumberTest is Test {
    GuessTheNewNumberChallenge public challenge;

    function setUp() public {
        challenge = new GuessTheNewNumberChallenge{ value: 1 ether }();
    }

    function test() public {
        GuessTheNewNumberAttack attacker = new GuessTheNewNumberAttack();
        attacker.attack{ value: 1 ether }(challenge);

        assertTrue(challenge.isComplete());
    }
}
