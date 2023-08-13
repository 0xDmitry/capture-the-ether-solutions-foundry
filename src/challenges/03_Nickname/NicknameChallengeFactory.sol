// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { StdCheats } from "forge-std/StdCheats.sol";

interface ICaptureTheEther {
    function nicknameChallenge() external returns (address);

    function setNickname(bytes32 nickname) external;

    function createNicknameChallenge(address player) external;
}

contract NicknameChallengeFactory is StdCheats {
    function createChallenge(address player) external returns (address) {
        address captureTheEtherAddress = deployCode("NicknameChallenge.sol:CaptureTheEther");
        ICaptureTheEther captureTheEther = ICaptureTheEther(captureTheEtherAddress);
        captureTheEther.createNicknameChallenge(player);
        return captureTheEther.nicknameChallenge();
    }
}
