// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { GuessTheSecretNumberChallenge } from "./GuessTheSecretNumberChallenge.sol";

contract GuessTheSecretNumberChallengeFactory {
    function createChallenge() external payable returns (GuessTheSecretNumberChallenge) {
        return new GuessTheSecretNumberChallenge{ value: msg.value }();
    }
}
