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
    function areTokensEqual(address token1, address token2) public  returns (bool) {
        Token  t1 = Token(token1);
        Token  t2 = Token(token2);

        return t1.nameHash == t2.nameHash && t1.symbolHash == t2.symbolHash && t1.totalSupply == t2.totalSupply;
    }
}

contract Example {
    TokenComparator comparator = new TokenComparator();

    function createAndCompareTokens() public  returns (bool) {
        Token token1 = new Token("Token 1", "T1", 100);
        Token token2 = new Token("Token 2", "T2", 200);

        return comparator.areTokensEqual(address(token1), address(token2));
    }
}
