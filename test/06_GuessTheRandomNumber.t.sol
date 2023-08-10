// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { GuessTheRandomNumberChallenge } from "../src/challenges/06_GuessTheRandomNumber/GuessTheRandomNumberChallenge.sol";
import { GuessTheRandomNumberChallengeFactory } from "../src/challenges/06_GuessTheRandomNumber/GuessTheRandomNumberChallengeFactory.sol";

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
        uint8 answer = uint8(
            uint256(keccak256(abi.encodePacked(blockhash(blockNumber - 1), blockTimestamp)))
        );
        challenge.guess{ value: 1 ether }(answer);

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}
