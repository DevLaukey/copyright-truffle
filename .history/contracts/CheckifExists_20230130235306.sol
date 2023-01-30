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
        Token storage t1 = Token(token1);
        Token storage t2 = Token(token2);

        return t1.nameHash == t2.nameHash && t1.symbolHash == t2.symbolHash && t1.totalSupply == t2.totalSupply;
    }
}

contract Example {
    TokenComparator comparator = new TokenComparator();

    function createAndCompareTokens() public view returns (bool) {
        Token token1 = new Token("Token 1", "T1", 100);
        Token token2 = new Token("Token 2", "T2", 200);

        return comparator.areTokensEqual(address(token1), address(token2));
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