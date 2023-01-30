//SPDX // SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.17;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract VRToken is ERC20 {
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
        bytes32 hash1 = VRAsset(_asset1).getHash();
        bytes32 hash2 = VRAsset(_asset2).getHash();
        if (hash1 == hash2) {
            return true;
        } else {
            return false;
        }
    }
}

