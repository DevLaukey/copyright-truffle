//SPDX // SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.5;

contract VRToken {
    uint256 public tokenCount;
    mapping (uint256 => bytes32) public tokens;

    function hashVRAttributes(string memory vrAttributes) public returns (uint256) {
        tokenCount++;
        tokens[tokenCount] = keccak256(abi.encodePacked(vrAttributes));
        return tokenCount;
    }

    function getToken(uint256 tokenId) public view returns (bytes32) {
        return tokens[tokenId];
    }
}


// it displays the hash of the VR attributes