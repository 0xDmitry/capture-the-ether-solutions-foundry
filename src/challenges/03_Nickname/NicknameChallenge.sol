pragma solidity ^0.4.21;

// Relevant part of the CaptureTheEther contract.
contract CaptureTheEther {
    mapping(address => bytes32) public nicknameOf;
    NicknameChallenge public nicknameChallenge;

    function setNickname(bytes32 nickname) public {
        nicknameOf[msg.sender] = nickname;
    }

    function createNicknameChallenge(address player) public {
        nicknameChallenge = new NicknameChallenge(player);
    }
}

// Challenge contract. You don't need to do anything with this; it just verifies
// that you set a nickname for yourself.
contract NicknameChallenge {
    CaptureTheEther public cte = CaptureTheEther(msg.sender);
    address player;

    // Your address gets passed in as a constructor parameter.
    function NicknameChallenge(address _player) public {
        player = _player;
    }

    // Check that the first character is not null.
    function isComplete() public view returns (bool) {
        return cte.nicknameOf(player)[0] != 0;
    }
}
