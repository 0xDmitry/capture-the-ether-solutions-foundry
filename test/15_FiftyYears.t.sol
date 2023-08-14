// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { FiftyYearsChallengeFactory } from "../src/challenges/15_FiftyYears/FiftyYearsChallengeFactory.sol";

interface IFiftyYearsChallenge {
    function isComplete() external returns (bool);
}

interface IFiftyYearsAttack {
    function attack(address target) external payable;
}

contract FiftyYearsTest is Test {
    IFiftyYearsChallenge challenge;
    IFiftyYearsAttack attacker;

    function setUp() public {
        FiftyYearsChallengeFactory factory = new FiftyYearsChallengeFactory();
        address attackerAddress = deployCode("FiftyYearsAttack.sol:FiftyYearsAttack");
        attacker = IFiftyYearsAttack(attackerAddress);
        address challengeAddress = factory.createChallenge{ value: 1 ether }(attackerAddress);
        challenge = IFiftyYearsChallenge(challengeAddress);
    }

    function test() public {
        attacker.attack{ value: 2 }(address(challenge));

        assertTrue(challenge.isComplete());
    }
}
