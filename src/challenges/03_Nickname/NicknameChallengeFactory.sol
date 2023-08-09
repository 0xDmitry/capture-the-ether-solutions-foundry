// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

import { CaptureTheEther, NicknameChallenge } from "./NicknameChallenge.sol";

contract NicknameChallengeFactory {
    function createChallenge(address player) external returns (NicknameChallenge) {
        CaptureTheEther captureTheEther = new CaptureTheEther();
        captureTheEther.createNicknameChallenge(player);
        return captureTheEther.nicknameChallenge();
    }
}
