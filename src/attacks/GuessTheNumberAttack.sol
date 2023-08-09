// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { GuessTheNumberChallenge } from "../challenges/04_GuessTheNumber/GuessTheNumberChallenge.sol";

contract GuessTheNumberAttack {
    function attack(GuessTheNumberChallenge target) external payable {
        target.guess{ value: 1 ether }(42);
    }

    receive() external payable {}
}
