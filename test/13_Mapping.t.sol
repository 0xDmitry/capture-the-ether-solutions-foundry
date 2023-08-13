// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { MappingChallengeFactory } from "../src/challenges/13_Mapping/MappingChallengeFactory.sol";

interface IMappingChallenge {
    function isComplete() external returns (bool);
}

interface IMappingAttack {
    function attack(address target) external;
}

contract MappingTest is Test {
    IMappingChallenge challenge;

    function setUp() public {
        MappingChallengeFactory factory = new MappingChallengeFactory();
        address challengeAddress = factory.createChallenge();
        challenge = IMappingChallenge(challengeAddress);
    }

    function test() public {
        address attackerAddress = deployCode("MappingAttack.sol:MappingAttack");
        IMappingAttack attacker = IMappingAttack(attackerAddress);
        attacker.attack(address(challenge));

        assertTrue(challenge.isComplete());
    }
}
