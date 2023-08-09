// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { GuessTheRandomNumberChallenge } from "./GuessTheRandomNumberChallenge.sol";

contract GuessTheRandomNumberChallengeFactory {
    function createChallenge() external payable returns (GuessTheRandomNumberChallenge) {
        return new GuessTheRandomNumberChallenge{ value: msg.value }();
    }
}
