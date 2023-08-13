// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { GuessTheNewNumberChallengeFactory } from "../src/challenges/07_GuessTheNewNumber/GuessTheNewNumberChallengeFactory.sol";

interface IGuessTheNewNumberChallenge {
    function isComplete() external returns (bool);

    function guess(uint8 n) external payable;
}

contract GuessTheNewNumberTest is Test {
    IGuessTheNewNumberChallenge public challenge;

    function setUp() public {
        GuessTheNewNumberChallengeFactory factory = new GuessTheNewNumberChallengeFactory();
        address challengeAddress = factory.createChallenge{ value: 1 ether }();
        challenge = IGuessTheNewNumberChallenge(challengeAddress);
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
