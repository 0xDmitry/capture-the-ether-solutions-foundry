// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { GuessTheSecretNumberChallenge } from "../challenges/05_GuessTheSecretNumber/GuessTheSecretNumberChallenge.sol";

contract GuessTheSecretNumberAttack {
    function attack(GuessTheSecretNumberChallenge target) external payable {
        uint8 answer = getAnswer();
        target.guess{ value: msg.value }(answer);
    }

    function getAnswer() public pure returns (uint8) {
        for (uint8 i; i < 256; i++) {
            if (
                keccak256(abi.encodePacked(i)) ==
                0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365
            ) {
                return i;
            }
        }

        return 0;
    }

    receive() external payable {}
}
