// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { GuessTheSecretNumberChallengeFactory } from "../src/challenges/05_GuessTheSecretNumber/GuessTheSecretNumberChallengeFactory.sol";

interface IGuessTheSecretNumberChallenge {
    function isComplete() external returns (bool);

    function guess(uint8 n) external payable;
}

contract GuessTheSecretNumberTest is Test {
    IGuessTheSecretNumberChallenge public challenge;

    function setUp() public {
        GuessTheSecretNumberChallengeFactory factory = new GuessTheSecretNumberChallengeFactory();
        address challengeAddress = factory.createChallenge{ value: 1 ether }();
        challenge = IGuessTheSecretNumberChallenge(challengeAddress);
    }

    function test() public {
        for (uint8 i; i < 256; i++) {
            if (
                keccak256(abi.encodePacked(i)) ==
                0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365
            ) {
                challenge.guess{ value: 1 ether }(i);
                break;
            }
        }

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}
