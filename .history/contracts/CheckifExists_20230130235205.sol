//SPDX // SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.5;

// import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract VRToken {
    // code to define the token's properties
    address[] existingTokens;

    //create a constructor


    function addExistingToken(address _token) public {
        existingTokens.push(_token);
    }

    function isDuplicate(address _newToken) public view returns (bool) {
        for (uint i = 0; i < existingTokens.length; i++) {
            if (compareVRAssets(existingTokens[i], _newToken)) {
                return true;
            }
        }
        return false;
    }
    // other functions

   function compareVRAssets(address _asset1, address _asset2) public view returns (bool) {
        // Compare the VR assets' hashes
        bytes32 hash1 = Token(_asset1).getHash();
        bytes32 hash2 = Token(_asset2).getHash();
        if (hash1 == hash2) {
            return true;
        } else {
            return false;
        }
    }
}

contract Token {
    bytes32 public nameHash;
    bytes32 public symbolHash;
    uint256 public totalSupply;

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) public {
        nameHash = keccak256(abi.encodePacked(_name));
        symbolHash = keccak256(abi.encodePacked(_symbol));
        totalSupply = _totalSupply;
    }
}