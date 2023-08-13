// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { StdCheats } from "forge-std/StdCheats.sol";

contract GuessTheNewNumberChallengeFactory is StdCheats {
    function createChallenge() external payable returns (address) {
        return deployCode("GuessTheNewNumberChallenge.sol:GuessTheNewNumberChallenge", msg.value);
    }
}
