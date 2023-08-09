// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { GuessTheNumberChallenge } from "./GuessTheNumberChallenge.sol";

contract GuessTheNumberChallengeFactory {
    function createChallenge() external payable returns (GuessTheNumberChallenge) {
        return new GuessTheNumberChallenge{ value: msg.value }();
    }
}
