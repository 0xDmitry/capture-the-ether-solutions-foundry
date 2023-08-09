// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { PredictTheFutureChallenge } from "../src/challenges/08_PredictTheFuture/PredictTheFutureChallenge.sol";
import { PredictTheFutureChallengeFactory } from "../src/challenges/08_PredictTheFuture/PredictTheFutureChallengeFactory.sol";
import { PredictTheFutureAttack } from "../src/attacks/PredictTheFutureAttack.sol";

contract PredictTheFutureTest is Test {
    PredictTheFutureChallenge public challenge;

    function setUp() public {
        PredictTheFutureChallengeFactory factory = new PredictTheFutureChallengeFactory();
        challenge = factory.createChallenge{ value: 1 ether }();
    }

    function test() public {
        PredictTheFutureAttack attacker = new PredictTheFutureAttack();

        attacker.lockInGuess{ value: 1 ether }(challenge);
        vm.roll(block.number + 2);

        bool success = false;
        while (!success) {
            // check if our guess worked, if not, keep advancing blocks until it works
            try attacker.settle(challenge) {
                success = challenge.isComplete();
            } catch {
                vm.roll(block.number + 1);
            }
        }

        assertTrue(challenge.isComplete());
    }
}
