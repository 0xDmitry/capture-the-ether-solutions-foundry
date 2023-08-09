// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { TokenSaleChallenge } from "../src/challenges/10_TokenSale/TokenSaleChallenge.sol";
import { TokenSaleAttack } from "../src/attacks/TokenSaleAttack.sol";

contract TokenSaleTest is Test {
    TokenSaleChallenge public challenge;

    function setUp() public {
        challenge = new TokenSaleChallenge{ value: 1 ether }();
    }

    function test() public {
        TokenSaleAttack attacker = new TokenSaleAttack();
        attacker.attack(challenge);

        assertTrue(challenge.isComplete());
    }
}
