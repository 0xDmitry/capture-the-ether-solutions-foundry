pragma solidity ^0.4.21;

import { MappingChallenge } from "./MappingChallenge.sol";

contract MappingChallengeFactory {
    function createChallenge() external returns (address) {
        return new MappingChallenge();
    }
}
