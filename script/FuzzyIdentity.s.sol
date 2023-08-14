// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import { FuzzyIdentityAttack } from "../src/attacks/FuzzyIdentityAttack.sol";

contract FuzzyIdentityScript is Script {
    function run() external pure {
        bytes memory creationCode = type(FuzzyIdentityAttack).creationCode;
        console2.log("Calculating salt...");

        for (uint256 salt = 0; salt < type(uint256).max; salt++) {
            address predictedAddress = getAddress(
                0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496,
                salt,
                creationCode
            );

            if (isBadCode(predictedAddress)) {
                console2.log("Done!");
                console2.log("Salt: ", vm.toString(bytes32(salt)));
                break;
            }
        }
    }
}

function getAddress(
    address deployerAddress,
    uint256 salt,
    bytes memory creationCode
) pure returns (address) {
    bytes32 hash = keccak256(
        abi.encodePacked(
            bytes1(0xff),
            deployerAddress,
            salt,
            keccak256(abi.encodePacked(creationCode))
        )
    );

    return address(uint160(uint256(hash)));
}

function isBadCode(address _addr) pure returns (bool) {
    bytes20 addr = bytes20(_addr);
    bytes20 id = hex"000000000000000000000000000000000badc0de";
    bytes20 mask = hex"000000000000000000000000000000000fffffff";

    for (uint256 i = 0; i < 34; i++) {
        if (addr & mask == id) {
            return true;
        }
        id <<= 4;
        mask <<= 4;
    }

    return false;
}
