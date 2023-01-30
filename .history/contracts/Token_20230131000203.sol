pragma solidity ^0.8.0;

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

contract TokenComparator {
    function areTokensEqual(Token memory token1, Token memory token2) public view returns (bool) {
        return token1.nameHash == token2.nameHash && token1.symbolHash == token2.symbolHash && token1.totalSupply == token2.totalSupply;
    }
}

contract Example {
    TokenComparator comparator = new TokenComparator();

    function createAndCompareTokens() public view returns (bool) {
        Token memory token1 = new Token("Token 1", "T1", 100);
        Token memory token2 = new Token("Token 2", "T2", 200);

        return comparator.areTokensEqual(token1, token2);
    }
}
