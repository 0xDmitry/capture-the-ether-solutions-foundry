// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { GuessTheNewNumberChallenge } from "./GuessTheNewNumberChallenge.sol";

contract GuessTheNewNumberChallengeFactory {
    function createChallenge() external payable returns (GuessTheNewNumberChallenge) {
        return new GuessTheNewNumberChallenge{ value: msg.value }();
    }
}
