pragma solidity ^0.4.21;

import { DonationChallenge } from "./DonationChallenge.sol";

contract DonationChallengeFactory {
    function createChallenge() external payable returns (address) {
        return (new DonationChallenge).value(msg.value)();
    }
}
