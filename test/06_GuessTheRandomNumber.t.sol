// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { GuessTheRandomNumberChallengeFactory } from "../src/challenges/06_GuessTheRandomNumber/GuessTheRandomNumberChallengeFactory.sol";

interface IGuessTheRandomNumberChallenge {
    function isComplete() external returns (bool);

    function guess(uint8 n) external payable;
}

contract GuessTheRandomNumberTest is Test {
    IGuessTheRandomNumberChallenge public challenge;
    uint256 public blockNumber;
    uint256 public blockTimestamp;

    function setUp() public {
        GuessTheRandomNumberChallengeFactory factory = new GuessTheRandomNumberChallengeFactory();
        address challengeAddress = factory.createChallenge{ value: 1 ether }();
        challenge = IGuessTheRandomNumberChallenge(challengeAddress);
        blockNumber = block.number;
        blockTimestamp = block.timestamp;
    }

    function test() public {
        uint8 answer = uint8(
            uint256(keccak256(abi.encodePacked(blockhash(blockNumber - 1), blockTimestamp)))
        );
        challenge.guess{ value: 1 ether }(answer);

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}
