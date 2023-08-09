// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { DeployChallenge } from "./DeployChallenge.sol";

contract DeployChallengeFactory {
    function createChallenge() external returns (DeployChallenge) {
        return new DeployChallenge();
    }
}
