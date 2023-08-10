// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { GuessTheNewNumberChallenge } from "../src/challenges/07_GuessTheNewNumber/GuessTheNewNumberChallenge.sol";
import { GuessTheNewNumberChallengeFactory } from "../src/challenges/07_GuessTheNewNumber/GuessTheNewNumberChallengeFactory.sol";

contract GuessTheNewNumberTest is Test {
    GuessTheNewNumberChallenge public challenge;

    function setUp() public {
        GuessTheNewNumberChallengeFactory factory = new GuessTheNewNumberChallengeFactory();
        challenge = factory.createChallenge{ value: 1 ether }();
    }

    function test() public {
        uint8 answer = uint8(
            uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp)))
        );
        challenge.guess{ value: 1 ether }(answer);

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}
