// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { StdCheats } from "forge-std/StdCheats.sol";

contract TokenBankChallengeFactory is StdCheats {
    function createChallenge(address player) external returns (address) {
        return deployCode("TokenBankChallenge.sol:TokenBankChallenge", abi.encode(player));
    }
}
