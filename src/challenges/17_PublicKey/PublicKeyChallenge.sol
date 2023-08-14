pragma solidity ^0.4.21;

contract PublicKeyChallenge {
    // 0x92b28647Ae1F3264661f72fb2eB9625A89D88A31
    address owner = 0x92b28647ae1f3264661f72fb2eb9625a89d88a31;
    bool public isComplete;

    function authenticate(bytes publicKey) public {
        require(address(keccak256(publicKey)) == owner);

        isComplete = true;
    }
}
