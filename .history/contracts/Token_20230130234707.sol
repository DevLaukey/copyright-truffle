pragma solidity ^0.8.0;

contract Token {
    string public name;
    string public symbol;
    uint256 public totalSupply;

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) public  {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
    }
}

contract TokenComparator {
    function areTokensEqual(address token1, address token2) public view returns (bool) {
        Token  t1 = Token(token1);
        Token  t2 = Token(token2);

        return t1.name == t2.name && t1.symbol == t2.symbol && t1.totalSupply == t2.totalSupply;
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
