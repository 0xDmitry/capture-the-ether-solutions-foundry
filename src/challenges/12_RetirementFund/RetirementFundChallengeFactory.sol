// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { RetirementFundChallenge } from "./RetirementFundChallenge.sol";

contract RetirementFundChallengeFactory {
    function createChallenge(address player) external payable returns (RetirementFundChallenge) {
        return new RetirementFundChallenge{ value: msg.value }(player);
    }
}
