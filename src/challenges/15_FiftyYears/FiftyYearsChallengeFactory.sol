// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { StdCheats } from "forge-std/StdCheats.sol";

contract FiftyYearsChallengeFactory is StdCheats {
    function createChallenge(address player) external payable returns (address) {
        return
            deployCode(
                "FiftyYearsChallenge.sol:FiftyYearsChallenge",
                abi.encode(player),
                msg.value
            );
    }
}
