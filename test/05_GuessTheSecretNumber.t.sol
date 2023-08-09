// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { GuessTheSecretNumberChallenge } from "../src/challenges/05_GuessTheSecretNumber/GuessTheSecretNumberChallenge.sol";
import { GuessTheSecretNumberAttack } from "../src/attacks/GuessTheSecretNumberAttack.sol";

contract GuessTheSecretNumberTest is Test {
    GuessTheSecretNumberChallenge public challenge;

    function setUp() public {
        challenge = new GuessTheSecretNumberChallenge{ value: 1 ether }();
    }

    function test() public {
        GuessTheSecretNumberAttack attacker = new GuessTheSecretNumberAttack();
        attacker.attack{ value: 1 ether }(challenge);

        assertTrue(challenge.isComplete());
    }
}
