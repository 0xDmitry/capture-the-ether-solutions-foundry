// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { GuessTheRandomNumberChallenge } from "../src/challenges/06_GuessTheRandomNumber/GuessTheRandomNumberChallenge.sol";
import { GuessTheRandomNumberChallengeFactory } from "../src/challenges/06_GuessTheRandomNumber/GuessTheRandomNumberChallengeFactory.sol";
import { GuessTheRandomNumberAttack } from "../src/attacks/GuessTheRandomNumberAttack.sol";

contract GuessTheRandomNumberTest is Test {
    GuessTheRandomNumberChallenge public challenge;
    uint256 public blockNumber;
    uint256 public blockTimestamp;

    function setUp() public {
        GuessTheRandomNumberChallengeFactory factory = new GuessTheRandomNumberChallengeFactory();
        challenge = factory.createChallenge{ value: 1 ether }();
        blockNumber = block.number;
        blockTimestamp = block.timestamp;
    }

    function test() public {
        GuessTheRandomNumberAttack attacker = new GuessTheRandomNumberAttack();
        attacker.attack{ value: 1 ether }(challenge, blockNumber - 1, blockTimestamp);

        assertTrue(challenge.isComplete());
    }
}
