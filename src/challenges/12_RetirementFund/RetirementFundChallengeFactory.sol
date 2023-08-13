// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { StdCheats } from "forge-std/StdCheats.sol";

contract RetirementFundChallengeFactory is StdCheats {
    function createChallenge(address player) external payable returns (address) {
        return
            deployCode(
                "RetirementFundChallenge.sol:RetirementFundChallenge",
                abi.encode(player),
                msg.value
            );
    }
}
