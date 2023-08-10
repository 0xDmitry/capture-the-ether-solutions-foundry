// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { AssumeOwnershipChallenge } from "./AssumeOwnershipChallenge.sol";

contract AssumeOwnershipChallengeFactory {
    function createChallenge() external returns (AssumeOwnershipChallenge) {
        return new AssumeOwnershipChallenge();
    }
}
